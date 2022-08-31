Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77071ECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 17:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdhZs1G64IV2QHTWS4mBblGDBxcUChFt+SuaVbqoxwg=; b=Jl1LhTRjMdPk+A
	PavCsXFqxsEfNOjTsUgBUrBDS8Ng1B57uuB5ILxIRs0VE3cI9OvhHrnU7yz5olJHqyYkuz+Tk2wZw
	XZma2D2Io2VIl8UzqG9L5H+6nDRsbPfpA0tclvU5JG7LODjLOo9FfvGbGxKKQaFwAEnWj5FLj4d6R
	NBSYc66i85/rUsIx9CTcZLESevnGTcjC9pw07SsxuT47QGKRn+qc8Z2nGJJCPPJaw7LwJ/Xw0ZZxA
	UjWFOiiykOk5ltpJquhGjR8Jq01NhZsvjED0eE1h0W0i8qWbzMC+ZpCYCVXzP1OcBJ/uDladbSCa+
	4vwSH2bdWw8VGytMSr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSq-007OtC-JB; Wed, 31 Aug 2022 17:25:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSi-007OjJ-FS
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 17:25:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id b16so11551987wru.7
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 10:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=j/4NmJqDbu56RZTur3QY16Eac2cEYz1FtNauBSCWCWQ=;
        b=Gctht5Adjh+JJvvaLgnzQD96KymRBCoBtTYden65aDTuXUNcFIftMzaaVSVgOk89Pt
         22s4yl//k+NA19/+1YDYlCoHsrexoj1YEfPZX0DeRQJbWRmmQBfNDg4hVwxfbLK6hcgJ
         OMHE+huBXyktCnI7fGjm509OYEZDKqxtmo17IC57fGzapx6OZiXEgXGy6kYCF/wgwhjE
         X+4VF0eHw9NiCuB/uXmrZl5t7qvakCQ1wABEikeyRBVGOBzMrLCzm2JN2b/VfUaFTQLn
         J+4Ncgj/w3zBgGdeSz9X9/gMCZulUlCXxryClGDTzn8UGmGxeS767ad2OuaUw0j1ByLu
         Ms5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=j/4NmJqDbu56RZTur3QY16Eac2cEYz1FtNauBSCWCWQ=;
        b=DfMOLpkIbyXce8r0mk+hrXPPoT3HaaHjA/Dp5btAN6WuEBhpcCjpj0+Wo36n8MAd1V
         yaNqsbL0MbPzHr7H5I1aTcfq6HtmzOv/OjuLc1LNjSj9dnHXKLbBfY5mej/MFttwrwTV
         U7mSOR01TWGIS/KgAk9oHHfCIGGVQm3YDYMSnZdo0njXivAnD8e5Lziiy95d20KNfpZL
         GPdcTKnrI7Oga6XtcNmv/pGntddAMkvhgTWingGIox3kWJODZHaCBSVRrih9grYXpUMs
         sH/yb0WvIgVVIK1G3e2MWYM+wkHaFwuxYFmrWiP8DyBzvq0DjqBEo1MyW1K8hfcnlDM2
         D8xw==
X-Gm-Message-State: ACgBeo1nE/7euxBOR3aBGeIgw6FEzVr1wBEvjJruBGsakarV7kLziU9s
	ra9GkJo6f1k+ACflkHvLHCbdlY+x4NfhyQ==
X-Google-Smtp-Source: AA6agR6cPZwhir1oSL4FH+tlBFkccGiF2un2JQUTMvARQ3UEhDSAxmKc+ttgXP2sV/U7RLNiu1ekrg==
X-Received: by 2002:a5d:5941:0:b0:225:3fc3:d923 with SMTP id e1-20020a5d5941000000b002253fc3d923mr12309606wri.522.1661966708622;
        Wed, 31 Aug 2022 10:25:08 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id ay21-20020a05600c1e1500b003a536d5aa2esm2838222wmb.11.2022.08.31.10.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 10:25:08 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	mchitale@ventanamicro.com,
	heiko@sntech.de
Subject: [PATCH v2 4/4] riscv: KVM: Apply insn-def to hlv encodings
Date: Wed, 31 Aug 2022 19:25:00 +0200
Message-Id: <20220831172500.752195-5-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831172500.752195-1-ajones@ventanamicro.com>
References: <20220831172500.752195-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_102512_542915_070FA671 
X-CRM114-Status: UNSURE (   8.60  )
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

Introduce hlv instruction encodings and apply them to KVM's use.
We're careful not to introduce hlv.d to 32-bit builds. Indeed,
we ensure the build fails if someone tries to use it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/insn-def.h | 17 +++++++++++++++++
 arch/riscv/kvm/vcpu_exit.c        | 29 +++++------------------------
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 86c1f602413b..8fe9036efb68 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -93,4 +93,21 @@
 	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49),		\
 	       __RD(0), RS1(gaddr), RS2(vmid))
 
+#define HLVX_HU(dest, addr)					\
+	INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(50),		\
+	       RD(dest), RS1(addr), __RS2(3))
+
+#define HLV_W(dest, addr)					\
+	INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(52),		\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#ifdef CONFIG_64BIT
+#define HLV_D(dest, addr)					\
+	INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(54),		\
+	       RD(dest), RS1(addr), __RS2(0))
+#else
+#define HLV_D(dest, addr)	\
+	__ASM_STR(.error "hlv.d requires 64-bit support")
+#endif
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index d5c36386878a..da793f113a72 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -8,6 +8,7 @@
 
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/insn-def.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -82,22 +83,12 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 			".option push\n"
 			".option norvc\n"
 			"add %[ttmp], %[taddr], 0\n"
-			/*
-			 * HLVX.HU %[val], (%[addr])
-			 * HLVX.HU t0, (t2)
-			 * 0110010 00011 00111 100 00101 1110011
-			 */
-			".word 0x6433c2f3\n"
+			HLVX_HU(%[val], %[addr])
 			"andi %[tmp], %[val], 3\n"
 			"addi %[tmp], %[tmp], -3\n"
 			"bne %[tmp], zero, 2f\n"
 			"addi %[addr], %[addr], 2\n"
-			/*
-			 * HLVX.HU %[tmp], (%[addr])
-			 * HLVX.HU t1, (t2)
-			 * 0110010 00011 00111 100 00110 1110011
-			 */
-			".word 0x6433c373\n"
+			HLVX_HU(%[tmp], %[addr])
 			"sll %[tmp], %[tmp], 16\n"
 			"add %[val], %[val], %[tmp]\n"
 			"2:\n"
@@ -121,19 +112,9 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 			".option norvc\n"
 			"add %[ttmp], %[taddr], 0\n"
 #ifdef CONFIG_64BIT
-			/*
-			 * HLV.D %[val], (%[addr])
-			 * HLV.D t0, (t2)
-			 * 0110110 00000 00111 100 00101 1110011
-			 */
-			".word 0x6c03c2f3\n"
+			HLV_D(%[val], %[addr])
 #else
-			/*
-			 * HLV.W %[val], (%[addr])
-			 * HLV.W t0, (t2)
-			 * 0110100 00000 00111 100 00101 1110011
-			 */
-			".word 0x6803c2f3\n"
+			HLV_W(%[val], %[addr])
 #endif
 			".option pop"
 		: [val] "=&r" (val),
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
