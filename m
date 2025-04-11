Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192C0C369A8
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 07:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5dx4s06fGU8nxNJZ//EXiHd38CwFt8raFb6OEGBMgI=; b=3bRrzo12Ac+O1z
	SdiaGOt6i5offIvlCcCU1/Fu5jbb1kMfW9EeLSP4AqP5fld2rAfj/jgEQxsxbMj5qlZZhiSUST02b
	7tjtxHTlF17WlQ36Ipwhn4lzwXzO/iQn8FWbb+HmbuJWQmvxpBMesJrRnwR9m9i75IgNNA1luxyHr
	tyg+Nrv27ze46eRLohDnmn7k/UUsJsE16TEF/dbPDpK6dgXU/9FrupecxXicOgvj4LJ817CAhnfAK
	Q0VdtDbg6CNe/RSHY4DkB4HRy8wp5qwxPkVRg+ZurJaIguE0DrB/xU9d4CCa+/zkS6AwkguDZN+9B
	ppmsepPOFFdpEL07HKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38uZ-0000000CtSd-1aIc;
	Fri, 11 Apr 2025 07:34:51 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38tW-0000000CtNM-4Adf
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 07:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744356768;
	bh=sd+Nl/eaYzN8NjAAOpF0InQ3lgV2aivi7Oa4f7/cTMQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=iIOgSk69q4aMhB1sFz4ecADvx0FTbhutrlvSGNq58rIM9JSEr6LIvLwzuBLfDdjeG
	 eQaWEfELw4z3LyMrjB8x1ycElr77nnVs8KVVjuU3CG/833nOTQYNk2GzEM3SxBO6X/
	 47Zzj51Oqkvg/49FbUQiH4h7BEKVGBEu81L0ebY0=
X-QQ-mid: bizesmtpip4t1744356756t660852
X-QQ-Originating-IP: dp3YO1nfHeRSP4/c/LdDabyOm2l79Z0gF2bkZ4hRILM=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 15:32:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8021715095780151493
EX-QQ-RecipientCnt: 14
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	chenhuacai@kernel.org,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	niecheng1@uniontech.com,
	palmer@dabbelt.com,
	palmerdabbelt@google.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	vincent.chen@sifive.com,
	zhanjun@uniontech.com
Subject: [PATCH v4 2/2] riscv: KGDB: Remove ".option norvc/.option rvc" for kgdb_compiled_break
Date: Fri, 11 Apr 2025 15:32:22 +0800
Message-ID: <8B431C6A4626225C+20250411073222.56820-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
References: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MowBDtlQhFJIGhz6nIsmDMS1L+Ged06XYVsc0ui1ECiZXIgsFdsEcQ0E
	wcr1QaADniCw7+hJbxyhdNfNM6RwJy1HWTktQkPt7xIBHy1jKXIOEGOedsWJ0sQot+QX6fK
	2KHKbwt8Y1hb+MCdBJvxw98sLVjAYTb4+fsgVPUqBX0GQvyJUMWWlCSL0x6f2o2kcm/hoOd
	hF81lsBoeUHMnImHN3za4/NL2cDxOBPR7YxptFYDVcBZLhHMG91hGQhjgknlFeyAQxLH6wa
	IOgaXKN52+/GTxymvAOl7TccPCWjScYa08UhP/+pwuWHGnWS0RweuGwSSU8FA9OnXR9ytSK
	5ISMj37TpkYJZDQJaH5dcVrrkUmVAL7jXmlE+whvwG6hv/TsLNUM0imbr64aIf3VH2JH884
	VB2q5GzUyqj5QnP9xyEf+nP3N935oGk+wjwxc0R7tXFA4duVpiGSrE1/IMRRDhGBJ+9Wwe2
	8CtJn54CPWD6s4gshvGeK/8GjkaBY4s/sH3++mVBeJ5RzplhkZlTShm5pidzbemex/GkO5N
	2YKqwExhsu+1kTO6ZE6tF9mZ5nBBMTMSMly6MPEfbhbRiDde5NDUFwRpY9DNCkVgE5TRtQy
	DzBMNkqAJjxEYFbOW8CDrzCj1/aXxuEXtLXnHi9RiQ5c6of4HFj3N9MPr4/McFo/DeQplEB
	zzuwQvkm9w2Ik7HYjS00Y9B4i3dwuGglH0HT6KVnFEovJ4tXYoRMp78P9C0HAqxhlFkzfe/
	mqp8n1n94RyX1MfdK86ZAN6OlS9n+u1iIUVHkWIKil3Pi6a5P7N7GntNgPa2GGW9jAfibqn
	ISWd9hzOwu07Olld113/fBbxBGpUBqUXcRl+eccCbvhUPekSsyMjBxF4vg7UVlgOPY/lUxp
	df5Rfb693AW0+xkugbOmASF/PerXExBruJRQBONUWwPlQGcMT5D3EKJQeUAh5lfCrWce05Y
	oX71oIvKhx9XhkcvCgZGlEqhn9JbtM3G0DMBy+8VIysnqiRf7MDmxJSToO2fnhnPl7kyJAp
	4uAyTpbakFc1IiSjXM7r2WpIgIF3YzfYDcnLXbiQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_003347_537464_5F070B19 
X-CRM114-Status: GOOD (  12.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

[ Quoting Samuel Holland: ]

  This is a separate issue, but using ".option rvc" here is a bug.
  It will unconditionally enable the C extension for the rest of
  the file, even if the kernel is being built with CONFIG_RISCV_ISA_C=n.

[ Quoting Palmer Dabbelt: ]

  We're just looking at the address of kgdb_compiled_break, so it's
  fine if it ends up as a c.ebreak.

[ Quoting Alexandre Ghiti: ]

  .option norvc is used to prevent the assembler from using compressed
  instructions, but it's generally used when we need to ensure the
  size of the instructions that are used, which is not the case here
  as noted by Palmer since we only care about the address. So yes
  it will work fine with C enabled :)

So let's just remove them all.

Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
Link: https://lore.kernel.org/all/mhng-69513841-5068-441d-be8f-2aeebdc56a08@palmer-ri-x1c9a/
Link: https://lore.kernel.org/all/23693e7f-4fff-40f3-a437-e06d827278a5@ghiti.fr/
Fixes: fe89bd2be866 ("riscv: Add KGDB support")
Cc: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/riscv/kernel/kgdb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 5d1ce8dacaf5..9f3db3503dab 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -257,9 +257,7 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 noinline void arch_kgdb_breakpoint(void)
 {
 	asm(".global kgdb_compiled_break\n"
-	    ".option norvc\n"
-	    "kgdb_compiled_break: ebreak\n"
-	    ".option rvc\n");
+	    "kgdb_compiled_break: ebreak\n");
 }
 
 void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
