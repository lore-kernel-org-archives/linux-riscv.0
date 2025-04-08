Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2129BC3600C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 10:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t7XEfpOXXpJ32Bz6Yj3TqggGt/s81D3CzlQLTMnvX1g=; b=Dn25L7DoT+X83E
	TxoSexj18Sh0DMibFo8heT2ZCQU+EtjxZEmg7D8gR7S61eb7XRRkYrtiPqJGNATsKGl0LOfYa0xsP
	kmDg+Gs39UbrRuylq+fr8ipKPqNUHDEd1vv8MP/0qYKIOxS61tij5rq8UsOKSXzsPmu5zHH95HerP
	686Wqug5NrEgP9fB8BataL0OUBBbbW3aIIVBPQrE3eWppphgyXzJTL28YUQ/cFivDHcOcimIixrpD
	GepdIUaOSDWSy8Yko89N8hwrbpf/B4yJf/saqkp4DqaCirqS/ZBtghcKmjAchTTl2N5D11d51LMkR
	6WcmzIZw5NuuvB3QhxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26U0-00000003jBX-2rUa;
	Tue, 08 Apr 2025 10:47:08 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25h5-00000003XQh-1fo3
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 09:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744106143;
	bh=1cOOugdxNH1dzSDvBT4rMQJc05Z5J3Plmk57TSIQEWs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FbUqm+j/MqT2HTAg00BaINPTvFBHfqoGhrFAVjDm1NcDt3+NNI8U9Fgb9HQtCHtl0
	 oX47BFo+Q8wvgn6PUup57/Zd3GYqeoxDSG2UnykR47dNmsg3/QTHsSCsi2DhawRlFR
	 wZzRqe54SlyJsNpH3OXMRkJTSo8rkI8VdBFXJfzc=
X-QQ-mid: bizesmtpip4t1744106098t470dd0
X-QQ-Originating-IP: 07VJtzU6r30JTPiI7i71igbsBf5K/zZgEQV+ByQe3qs=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Apr 2025 17:54:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4550505304190636974
EX-QQ-RecipientCnt: 15
From: WangYuli <wangyuli@uniontech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: wangyuli@uniontech.com,
	chenhuacai@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vincent.chen@sifive.com,
	palmerdabbelt@google.com,
	samuel.holland@sifive.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Date: Tue,  8 Apr 2025 17:54:54 +0800
Message-ID: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M3ziZXKDk+iO8oWYNGzpEDtFmV3FhdqdbPO8mXitgtcwePtUA4MUK9U0
	r9lxYzW4S7H6zwj/SZftN7zZdup7YL5/qPESwxqc8RMSDaQp/fjAC5uEtEO7k+AJTMWYVCd
	iHKR82SCQ3GWN8hAByX3VOsXGUO4uFX7ccTg6WLSBqWFT5oo7RvSMXua3z4fBci6hepdHI+
	E/fzfE7nQkYbrLla/5cWs9TkeqsnXPzI6HAvKWzKVynLXIoNRNWzr02EQFVjo6muYTN+wi9
	gvvi8H9ASCN8lPTTZsbw01nhspcbs2iRv+yw5WSwilPdZ2WvNySatqUGd2DzKtMXaTXBy5+
	crryBHbsSiNFcAGjpGuT6bpcjq68NNLp/ldKSfPbRa04qWjcszrNU8QpEu1GCIyPD4U2KCi
	b0Y5ytD8FxNVx9R5+acKw7KiR862wmaOiSXEYS/aroZVV3Fv4WRL0vLB34by/U2lhre68DJ
	gulAAMTm6s9mGig2wuhSLYHYcJ79sUNoNDhBXgX7wNmqMLz5Y0w9Cox3uAjwIYoGtxMehM7
	2KQYs0sKwztkI2JUjF/dcDvbcx5oa6EdOtJzQCH5wPBjAJYF/ijqzV6Lj/dqsVRjbF0Rz+C
	8Tk3KFLUj98Xn0hHL2oN0Z3T4eHVzm+jzB3BZLKgfhcMMJ5/ASxnZO+nTQT4mxU2fB9yldJ
	aAX0zh6XTxlP+BxF2OVEOpABi6Wl6G4ws1FHRUzwa4o3nxM7Ssh+I14wBlRlL3X23BX2FlH
	7xWKfpAB9K/GJ/Df/N29+2ZuJ1oNLfgnUObsId+QIBYCrkXZXS29IDM31lLZkXKQPMo3svC
	zOm38Gw5+0+buvnltk4YV0N+QgP4TPDBbCEte4Da+bHhhVZAld4SU7lryRNfgsNQ+DqDuQ8
	ZUQ9+GyLvBN1bEwZpImJjas3cBuwPKu1MPC9CVa4iJ9bY99EynwMTJMvKMgu9PU99O5C58T
	q8xroabFz8MKkuNEhc5F9RxDia9WqyyXymWTtNPnEkEP9aSfzetsFDeNVk6D84rzJGcQBKz
	Jxagr/wxfv5yJnc9osAH6aJMkQO+gp7nD+Q87Vvw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025636_270035_088FEB4A 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
symbol using inline assembly.

There's a potential issue where the compiler might inline
arch_kgdb_breakpoint(), which would then define the kgdb_breakinst
symbol multiple times, leading to fail to link vmlinux.o.

This isn't merely a potential compilation problem. The intent here
is to determine the global symbol address of kgdb_compiled_break,
and if this function is inlined multiple times, it would logically
be a grave error.

Link: https://lore.kernel.org/all/4b4187c1-77e5-44b7-885f-d6826723dd9a@sifive.com/
Fixes: fe89bd2be866 ("riscv: Add KGDB support")
Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2:
    1. Add the missing __ASSEMBLY__ check and substitute
".option rvc/norvc" with ".option push/pop".
  v2->v3:
    1. Remove "extern".
    2. Restore the inadvertently deleted .option norvc to prevent
a change in semantics.
---
 arch/riscv/include/asm/kgdb.h | 9 +--------
 arch/riscv/kernel/kgdb.c      | 9 +++++++++
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
index 46677daf708b..cc11c4544cff 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -19,16 +19,9 @@
 
 #ifndef	__ASSEMBLY__
 
+void arch_kgdb_breakpoint(void);
 extern unsigned long kgdb_compiled_break;
 
-static inline void arch_kgdb_breakpoint(void)
-{
-	asm(".global kgdb_compiled_break\n"
-	    ".option norvc\n"
-	    "kgdb_compiled_break: ebreak\n"
-	    ".option rvc\n");
-}
-
 #endif /* !__ASSEMBLY__ */
 
 #define DBG_REG_ZERO "zero"
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 2e0266ae6bd7..7f2d3d956167 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -254,6 +254,15 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 	regs->epc = pc;
 }
 
+noinline void arch_kgdb_breakpoint(void)
+{
+	asm(".global kgdb_compiled_break\n"
+	    ".option push\n"
+	    ".option norvc\n"
+	    "kgdb_compiled_break: ebreak\n"
+	    ".option pop\n");
+}
+
 void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
 				char *remcom_out_buffer)
 {
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
