Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8258C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fS7N0sJZppKb+jBTLzNHZ+R8ianiGZn+TAXlXfA3nKo=; b=yKPZzJ/xRbsfen
	OyTErcvQr7ci9oczVeCEeCboDKMINheyxTolST9wRRdtLTBtV7T4Fx7myjYnZsOgKDjKAlUEXpl0W
	pFYmLZ3a+gXD370KKKamH41yo9fJJ4SyOZliltsZUnyvQ/E2nTTwMsqsVd6F5C6n/O2/QH2kEzVb0
	k3UR+ArsTTTT+daIF06DP45UBN+B8nSxf41MkJaJwg4G1NG2mhHiVevTcYrflsZpupnKE365srFjC
	YQMextanRgf1+yk9DLjaa7zEIeaS5eIa5DKnnwCWctqF9sbi8dquT6dE+ZOWM0ZfiN5uSMXIwzlr0
	vCJ1s820GyyqUFBwgwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdQe-00D2Pn-2k;
	Thu, 18 May 2023 13:12:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdQc-00D2Od-2W
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:12:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5428564F52;
	Thu, 18 May 2023 13:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FCFC433EF;
	Thu, 18 May 2023 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415541;
	bh=z5mkr//0fNawn45SMn5US81wCUZHNT6No8cwVZ30STk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dpq2AALe0mn8e3ICXMEMakWoQf7l4LZI9XJRL/KK8OthBuOAkkVBTJ2R5CWP7TUiJ
	 Lijji9TT0GYg9fBUfTLk6wPK4WXm+jxmpEbBajfcmdzmeRiy0ygmmAsUBKmbllOfBm
	 GnZ+bAVUV7Wyjr+nH981VRaTHsDByS7vGYmUPcEtDXWsZSvAZolKa4MH222LURagYw
	 uPbNeSwfdDlP5bA43XtY6Onzy+BfMiZeJw1Yzm2DsAiO+M2GjYFej3rCH4OuDLXcD6
	 4jGrdnCY/T2Ybpkves9qxyv/jU92PgqrXB11ZASrYjazL2MnM291C7EyiNIopSXqXE
	 IqaXJF5DKqkRA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 08/22] riscv: s64ilp32: Add asid support
Date: Thu, 18 May 2023 09:09:59 -0400
Message-Id: <20230518131013.3366406-9-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061222_902112_87D226E2 
X-CRM114-Status: GOOD (  12.17  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The s32ilp32 uses 9 bits as asid_bits because of the xlen=32
limitation of CSR. The xlen of s64ilp32 is 64 bits in width, and
the SATP CSR format is the same for Sv32, Sv39, Sv48, and Sv57. So
this patch makes asid mechanism support s64ilp32 with maximum
num_asids.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/mm/context.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 80ce9caba8d2..696a7ca41f55 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -20,9 +20,9 @@
 
 DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
-static unsigned long asid_bits;
+static xlen_t asid_bits;
 static unsigned long num_asids;
-static unsigned long asid_mask;
+static xlen_t asid_mask;
 
 static atomic_long_t current_version;
 
@@ -225,14 +225,18 @@ static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
 
 static int __init asids_init(void)
 {
-	unsigned long old;
+	xlen_t old;
 
 	/* Figure-out number of ASID bits in HW */
 	old = csr_read(CSR_SATP);
 	asid_bits = old | (SATP_ASID_MASK << SATP_ASID_SHIFT);
 	csr_write(CSR_SATP, asid_bits);
 	asid_bits = (csr_read(CSR_SATP) >> SATP_ASID_SHIFT)  & SATP_ASID_MASK;
-	asid_bits = fls_long(asid_bits);
+#if __riscv_xlen == 64
+	asid_bits = fls64(asid_bits);
+#else
+	asid_bits = fls(asid_bits);
+#endif
 	csr_write(CSR_SATP, old);
 
 	/*
@@ -265,9 +269,9 @@ static int __init asids_init(void)
 		static_branch_enable(&use_asid_allocator);
 
 		pr_info("ASID allocator using %lu bits (%lu entries)\n",
-			asid_bits, num_asids);
+			(ulong)asid_bits, num_asids);
 	} else {
-		pr_info("ASID allocator disabled (%lu bits)\n", asid_bits);
+		pr_info("ASID allocator disabled (%lu bits)\n", (ulong)asid_bits);
 	}
 
 	return 0;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
