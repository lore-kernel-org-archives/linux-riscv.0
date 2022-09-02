Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E007ECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 03:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eq1RUE4MX/YC1HcVGyDLfwADi8+9JxCz6V/l8H/aEQw=; b=qJ36ck359vFgIj
	UC8f1GsYRnWxmCdVb9RMjd7mkfQ7oRJVPMCrCtkSYOt5glhU1cyuz8DFLb/v6YIhxyL3FfEIg0NwE
	50aicnetH7PUMtbljy/CLrtI3nSz2JK796q1KYt2+wBySx2OmbkAF5KbZF6b0/qrUYqxj6m0ncuxU
	lTtcJzAh8gOVkhfeAZP0wqkXSRNYjrMY35xgs8M84HbuRgRKxB82R2KcZXfNACsSVeG8vo6DpfQQl
	dPR6rDdLyAnDwVQysokKwzldGUwBTHHzWXhFXjBHyveAY2weWZB0VK1uuY5M1YQnkcht8eie4Qi+L
	Ai60zGr3F/t7hKorl8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTxds-00HTZ6-Ma; Fri, 02 Sep 2022 03:46:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTxdo-00HTX1-FO
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 03:46:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id j5so680597plj.5
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 20:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date;
        bh=4/o3wSb/RD2Jj/3TZeJujE7Idm59sanq6I5hN+FhH5Y=;
        b=oBP6YfATtad97bQL7BibTOKORFp2gnomstwd7Cl8I8Ngn1vqn3bUpqSh3PYWKcdfxZ
         AArHoShG6MLf4UmGShW3K3/vcNGQFsCX9MlIOqaIfTaPCnUJTYcmkFKUiJkp2Q3m5PAX
         ZnJ2DUN44HvP+DkjTsLs6EbYpDLhRRKxAWw+DX1PTkM7buR5OC2HY9+tcMnJ86klA86t
         qY9cnBueksalVaFzykQ1rLodZjyAPKR+vjoU1EE4jbTMEqcSZOorkIEIRhRGebHOdzxZ
         5Be2n/aGvb8iI/SeWx6Ldkv+0PiSOahRJEUWCoN435ICQf78GDEXy9SsJfEhFQcbSRuE
         DIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=4/o3wSb/RD2Jj/3TZeJujE7Idm59sanq6I5hN+FhH5Y=;
        b=AlvmghFAt9Cr7BsEEmKhkxrFDFlCLj2AYQ8bAagdG20fGXh39lb9BSgtUNVTwQfEJt
         a7tzihF7IiNLOz93JxWraH/nJIBs0vPneGq6rkoKYsXVaX7gv4AtNXV+QCu4C11wmXoF
         EZEc9a0tYjNzJOUQt3rPoOVtyIed1xGm5GDGhRxVeRwc08+mfYR36puHhYG2OHSPJtoD
         8B3El0J/liRvppvYDUiajTBBDhtHZnribPgBiqeDJi8RsKf5ZmEAAWP5ha4v3TgsPfz+
         tOWt3IWCdkYc64XP1e+9koAxdVT201X1CZOqBUFmBZsDbZRMMA0l/DPAS5Nc+l0AhDoA
         33hg==
X-Gm-Message-State: ACgBeo2TaDTndQ0ox3y9SiACjUvYCX3Io+26KEGsY+yFuTZfbJ2SBOMh
	qPv5dgrN0IaLopgy11WV8UBe6vETl784DA==
X-Google-Smtp-Source: AA6agR4yKCaImhjHDqogf5MSTPoXtWuhAMtCoEBQBu2EPTz4x1EwcnDwKn34dwVyds/slNY2e3q7Nw==
X-Received: by 2002:a17:902:bc83:b0:174:3b2e:120e with SMTP id bb3-20020a170902bc8300b001743b2e120emr32465426plb.82.1662090406642;
        Thu, 01 Sep 2022 20:46:46 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id a23-20020aa79717000000b0053692028ec1sm431192pfg.34.2022.09.01.20.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 20:46:46 -0700 (PDT)
Subject: [PATCH] RISC-V: Add support for Ztso
Date: Thu,  1 Sep 2022 20:43:52 -0700
Message-Id: <20220902034352.8825-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_204648_755772_F5D1EDB6 
X-CRM114-Status: GOOD (  19.79  )
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

The Ztso extension was recently frozen, this adds support for running
binaries that depend on TSO on systems that support Ztso.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

This is very minimaly tested: I can run no-Ztso binaries on both
yes-Ztso and no-Ztso QEMU instances, but I don't have a yes-Ztso
userspace together in order to make sure that works.
---
 arch/riscv/include/asm/elf.h   | 18 ++++++++++++++++--
 arch/riscv/include/asm/hwcap.h |  3 +++
 arch/riscv/kernel/cpu.c        |  1 +
 arch/riscv/kernel/cpufeature.c |  3 +++
 4 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 14fc7342490b..7a17d2275b76 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -14,6 +14,7 @@
 #include <asm/auxvec.h>
 #include <asm/byteorder.h>
 #include <asm/cacheinfo.h>
+#include <asm/hwcap.h>
 
 /*
  * These are used to set parameters in the core dumps.
@@ -31,10 +32,23 @@
 #define ELF_DATA	ELFDATA2LSB
 
 /*
- * This is used to ensure we don't load something for the wrong architecture.
+ * Binaries that assume TSO cannot be correctly run on non-TSO systems, so
+ * prevent them from even being loaded.
+ */
+#define EF_RISCV_TSO	0x0010
+
+static inline int riscv_elf_tso_ok(long eflags)
+{
+	return likely(!(eflags & EF_RISCV_TSO)) || riscv_tso_hw;
+}
+
+/*
+ * This is used to ensure we don't load something for the wrong architecture or
+ * variant.
  */
 #define elf_check_arch(x) (((x)->e_machine == EM_RISCV) && \
-			   ((x)->e_ident[EI_CLASS] == ELF_CLASS))
+			   ((x)->e_ident[EI_CLASS] == ELF_CLASS) && \
+			   riscv_elf_tso_ok((x)->e_flags))
 
 extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #define compat_elf_check_arch	compat_elf_check_arch
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6f59ec64175e..4e1d94c43d51 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -36,6 +36,8 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
 
+extern bool riscv_tso_hw;
+
 /*
  * Increse this to higher value as kernel support more ISA extensions.
  */
@@ -58,6 +60,7 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_ZTSO,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 0be8a2403212..d8371c249cc8 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -95,6 +95,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3b5583db9d80..b8ab2b0a9e78 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -25,6 +25,8 @@
 
 unsigned long elf_hwcap __read_mostly;
 
+bool riscv_tso_hw __read_mostly;
+
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
@@ -204,6 +206,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
+				SET_ISA_EXT_MAP("ztso", RISCV_ISA_EXT_ZTSO);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
