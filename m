Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3758CC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLnEirv1jIa4kLfc8VSfOOIa5lAChgLa+m+a0dIl8nE=; b=gWAkPiRmIhc0Uq
	D58CvHZManzN3HSN2n2SZDLcbxeV4wLnuVV+eS0ycXe+282jGMLQnT1Ze6DH1Y6yZj9WOrikksUy6
	BM5OKPLV/9Wf4b3iUDvUYAbJV+6gpEOKuxKMLZ8U8xr1T/AjMWovi3kqy3RoRR/c7Fz8c695wYg+0
	SSBfXiKipv2n3rFc6MnqrazFpkl3Qk9sZBqHQq6SIjk/YBpFOK6h/90sKA9ekG0JIU1JMwrsm000n
	GWZkGazNY5f/jgHirzTsHyJhqOJXiNwp045FviXse3jIZVE01AX2FBkb8UfXKxWXS+O61+Xe2uJcY
	ySU355tgaLkkHhkTxILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS1c-0040bK-1Z;
	Tue, 09 May 2023 18:25:24 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS1Z-0040Zf-1R
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 18:25:22 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64395e741fcso6313510b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 11:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683656718; x=1686248718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXYBK5F/Va+C5RMP3dhn94WTV7+LujR+4fSvsxyMFAA=;
        b=tFOl1GjL4aly+tZEQXPFtTwwgS9MQ50UGEY0hPX+Km1DLjxQBreVUHzC8vfbEGV3iS
         U7JzNRAeADF1ZTT/lhkmkElonDTyGZ0ZxsWFdBNixS7JD5RjzDc+fSv/0ZFT4DJOPaVi
         o5uEvi1eGayQLXKtim2Y+4JHPrMbb8W0H3j+myMd8Zy+ED4RxLGI5cBLivAR+f4oTQ5l
         Mgz+WIvNRRWaEbPmv/5XcjBPGsjWeG/DEri/YDghmNJstUdFRTBwGoV9NsJc8OUuNXda
         7/a+tPgFUQ4UBf2rhfx83p+zzu0v/PY9EuN9w9UI5i+jsamLNeghmAtlFrW6plX2S4xp
         fjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683656718; x=1686248718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXYBK5F/Va+C5RMP3dhn94WTV7+LujR+4fSvsxyMFAA=;
        b=HFrsGPEybJ96pGRdPYQtiuYIFxyByj/4ORNLHVhcJo/ObNM+aBtfZx4zXiXdC9T+qz
         Jp1G2DPqVsk+levwbkP987Z9gYClZbNZZ/DcOMUDoJh+pebR57KxxRrc3UXAbawmCTO7
         UbC6p4Xs0/cwhkWoD1OOXTSBVNuDCMaup8ebt0+6kYWe5+0wy3HVrBFRux2nhhT0TypC
         +1hytC/XbGazZuNklz6Te06E6lSVAVjQZAWcw/346AyGowKDcsi8vc5vUIgYCz0BmZuM
         Ptxv0kPdEqKZwzZmg/hZB8NoewicUMcUGmM/l3J6emJT0W4ZKb0WJPyRaNtYsiEg7l4U
         O0ww==
X-Gm-Message-State: AC+VfDxAPj3QUSfbXRQ/HFlWglNNbGOzi7+jxbHOwkdgA9NKyMj13LmJ
	hNWSdGPEGkhOHDLgpZalA7kgtQ==
X-Google-Smtp-Source: ACHHUZ7s5ESDHrEDlfBTs/m3olFB4ODbU8pdgGrH+aoci5/jA+ot/AKVJVB04yD1WWIR5AqZ7UYoQw==
X-Received: by 2002:a05:6a21:9981:b0:101:8b:43a5 with SMTP id ve1-20020a056a21998100b00101008b43a5mr6290587pzb.8.1683656718557;
        Tue, 09 May 2023 11:25:18 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id q12-20020a63cc4c000000b0051eff0a70d7sm1633559pgi.94.2023.05.09.11.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:25:18 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] RISC-V: Track ISA extensions per hart
Date: Tue,  9 May 2023 11:25:02 -0700
Message-Id: <20230509182504.2997252-3-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509182504.2997252-1-evan@rivosinc.com>
References: <20230509182504.2997252-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_112521_482830_D14D579D 
X-CRM114-Status: GOOD (  15.90  )
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

The kernel maintains a mask of ISA extensions ANDed together across all
harts. Let's also keep a bitmap of ISA extensions for each CPU. Although
the kernel is currently unlikely to enable a feature that exists only on
some CPUs, we want the ability to report asymmetric CPU extensions
accurately to usermode.

Note that riscv_fill_hwcaps() runs before the per_cpu_offsets are built,
which is why I've used a [NR_CPUS] array rather than per_cpu() data.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---

Changes in v2:
 - Add blank line before if in riscv_fill_hwcap() (Conor)

 arch/riscv/include/asm/cpufeature.h | 10 ++++++++++
 arch/riscv/kernel/cpufeature.c      | 18 ++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 808d5403f2ac..23fed53b8815 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -6,6 +6,9 @@
 #ifndef _ASM_CPUFEATURE_H
 #define _ASM_CPUFEATURE_H
 
+#include <linux/bitmap.h>
+#include <asm/hwcap.h>
+
 /*
  * These are probed via a device_initcall(), via either the SBI or directly
  * from the corresponding CSRs.
@@ -16,8 +19,15 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+struct riscv_isainfo {
+	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+};
+
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 DECLARE_PER_CPU(long, misaligned_access_speed);
 
+/* Per-cpu ISA extensions. */
+extern struct riscv_isainfo hart_isa[NR_CPUS];
+
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a1954c83638f..e8b7b4b20bb5 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -26,6 +26,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Per-cpu ISA extensions. */
+struct riscv_isainfo hart_isa[NR_CPUS];
+
 /* Performance information */
 DEFINE_PER_CPU(long, misaligned_access_speed);
 
@@ -113,14 +116,18 @@ void __init riscv_fill_hwcap(void)
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
 	for_each_of_cpu_node(node) {
+		struct riscv_isainfo *isainfo;
 		unsigned long this_hwcap = 0;
-		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 		const char *temp;
+		unsigned int cpu_id;
 
 		rc = riscv_of_processor_hartid(node, &hartid);
 		if (rc < 0)
 			continue;
 
+		cpu_id = riscv_hartid_to_cpuid(hartid);
+		isainfo = &hart_isa[cpu_id];
+
 		if (of_property_read_string(node, "riscv,isa", &isa)) {
 			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
 			continue;
@@ -137,7 +144,6 @@ void __init riscv_fill_hwcap(void)
 		/* The riscv,isa DT property must start with rv64 or rv32 */
 		if (temp == isa)
 			continue;
-		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
 			const char *ext_end = isa;
@@ -215,7 +221,7 @@ void __init riscv_fill_hwcap(void)
 				if ((ext_end - ext == sizeof(name) - 1) &&	\
 				     !memcmp(ext, name, sizeof(name) - 1) &&	\
 				     riscv_isa_extension_check(bit))		\
-					set_bit(bit, this_isa);			\
+					set_bit(bit, isainfo->isa);		\
 			} while (false)						\
 
 			if (unlikely(ext_err))
@@ -225,7 +231,7 @@ void __init riscv_fill_hwcap(void)
 
 				if (riscv_isa_extension_check(nr)) {
 					this_hwcap |= isa2hwcap[nr];
-					set_bit(nr, this_isa);
+					set_bit(nr, isainfo->isa);
 				}
 			} else {
 				/* sorted alphabetically */
@@ -257,9 +263,9 @@ void __init riscv_fill_hwcap(void)
 			elf_hwcap = this_hwcap;
 
 		if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
-			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+			bitmap_copy(riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
 		else
-			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+			bitmap_and(riscv_isa, riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
 	}
 
 	/* We don't support systems with F but without D, so mask those out
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
