Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E598EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBSKsCVLJIsF4TgsfMdzeGz30bA1MeB+i9ZhOowc7/E=; b=k6W35OMzQcl30u
	K2SCixXKBSUsgqGbyNZo8hG8rxJ0fPoK7v5j9baOBllS2wYiwyMG2yblEOwrAxoHmGpaCBsNmk71V
	sLeq8sKyVQlEEsXfmFpDAp/xejAVSpSxSy30rtlfbQkILVR1kk+k+2AlGKV+ysnyxQCTIHk2kLTW3
	EOLUO7cFVXqRfOPeh6HZuha8WHPlDDsyJfKEscD3bWA45NNNerURefc0MKkeemjRrF9H6KOrxzcwL
	MFIc7/vBz3gxC1Oa7/G2l3mngwTE4LfK9bHt2cShlWyvMBHfuxIUGuedpRbuRNEvMV4IaCY9EUQf1
	NVJURFVd/K9sN4xtoRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyV-00DG5U-1K;
	Fri, 21 Jul 2023 07:54:55 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyT-00DG2s-08
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:54:54 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-765a1690003so159036185a.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689926091; x=1690530891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3u1lOqcX+rFr/12ZO+V0mL4AJbG+0yajCeAol8veJU=;
        b=ihe51+EG+C60YUxB7AocvCGuMa7zYMTuYaCjxA5WrAb+BpsUg9E4ce/9rtN4xmom9j
         5iSdLKNgtVmv+mQkSlsWAw+0LqESqtrg6HJQVMZsP3tJHKwfqQmqBJuNw2/kGIKA/laJ
         x304IZPTrtv+f5nz8zp8/D0RQV8bzBPPoUpaNKeuBBBQptJKT5yJb8Fng9kqX8/7iDkA
         JpM/+4louXVnjU+lrgn2yv9AsT3O0Mz3kzkUrjGId/HSFetgYZ8QctbDAqbae8LPlikk
         2HowdbEZu6HdzaAEANGzoO5L7xaLDXlFktgV5nIArIIVimB125rOg1FKhyWo+CgVVVqA
         ayog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926091; x=1690530891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3u1lOqcX+rFr/12ZO+V0mL4AJbG+0yajCeAol8veJU=;
        b=hmt9c1df1oEniDsr8hFtrFW5xVGMNhssKY9zFc4pkf1DbBAnr2VXTeppAQjuC5GnR9
         AKy62sQu2j0zSa1sFlBaNEoN6ZTb+QHQhtKs3NW4H9zdfgLlMdPl5nCBkkY9GOruLuAb
         RiaFlSydnaHLsBh5phXFAeC70OXHzuqoyDF4EAB1eYcKtenosgBx40pVsIflm0U8Zd1B
         d0rbpLF+x6dUwgkjD2UCbSe90yXnxqRoWavyhy8kbNg4f9s0Iu52yBIW3ZjnQ/TqJJw2
         9gptCjJ+E4kdXfrpmZMOTg8VRdWHmjvfEUELxdVbJ0QPYYqmbPg9VhmCe1nTqhD6GRoJ
         tZTg==
X-Gm-Message-State: ABy/qLZ1FOps2HKXYHAmhzsUyY+X23Hzl8ri/I7ggHE/jPluQFSMzTVJ
	r8mNBRgHJOyCE4RK/ucQlfdMqw==
X-Google-Smtp-Source: APBJJlHR5erD7wTV3lBrLRpvo3ypVzl5teqtGuyMa0LtCPD5Gkvmp6di/L4g2VyrLXQlCODMUW6leg==
X-Received: by 2002:a05:620a:4085:b0:768:1572:ebd0 with SMTP id f5-20020a05620a408500b007681572ebd0mr1635854qko.31.1689926090685;
        Fri, 21 Jul 2023 00:54:50 -0700 (PDT)
Received: from mchitale-vm.. ([117.99.250.48])
        by smtp.googlemail.com with ESMTPSA id gw15-20020a17090b0a4f00b00267bb769652sm2026354pjb.6.2023.07.21.00.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:54:50 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 1/6] RISC-V: Detect Smstateen extension
Date: Fri, 21 Jul 2023 13:24:34 +0530
Message-Id: <20230721075439.454473-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721075439.454473-1-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005453_101973_2A1EB9FD 
X-CRM114-Status: GOOD (  10.19  )
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

Extend the ISA string parsing to detect the Smstateen extension

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/kernel/cpu.c                                 | 1 +
 arch/riscv/kernel/cpufeature.c                          | 1 +
 4 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..1e6d0e182be1 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,12 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smstateen
+          description: |
+            The standard Smstateen extension for controlling accesss to CSRs
+            added by other Risc-V extensions in H/S/VS/U/VU modes and as
+            ratified at commit a28bfae (Ratified (#7)).
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f041bfa7f6a0..fad1fd1fcd05 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -53,6 +53,7 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_SMSTATEEN		43
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..fb0df651bc48 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -217,6 +217,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..ddca31160637 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -301,6 +301,7 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				/* sorted alphabetically */
 				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("smstateen", RISCV_ISA_EXT_SMSTATEEN);
 				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
