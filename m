Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291A0C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 21:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSxFLBKD361nVVawWRvhF5pOdcxXKmKkQXu2ZrfJ3UA=; b=axtqF5t334Shct
	Z4XbTf5FVvUzXZbayYq6ldnNE3AiohrrCIWmxpzJ1W+WxUXo2hhip/sFqanjvdGJtaBvxlvKe0aO2
	Xbnq5Z2ivTN94s4V/JU6YWQ+7QFFiJ0DCILrcIcVUqczdJdgrj95+jMQptgtpjMesPHwrEkAoqfnq
	iOPlDGw1TegbTlu42mAj7zsvfHOO5UsZjPyGOuX4vGjWOtnIorrHAAFvBXvffllUlZ7goaVSGEF+J
	MGcj+vTDw6R3ijGpeTpil2V+IPYeRhYTpd2UEb56Q/w4C49R1Ei2Lvmin3NOEdp8kuJdYjGIECbu0
	5cep4H14mptgCcSZcr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7MW4-00000002y3g-3ula;
	Wed, 15 May 2024 21:50:28 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7MW1-00000002y2L-3i17
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 21:50:27 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6f6765226d0so1138874b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715809825; x=1716414625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLs+h6zNZh7mF7wyHbnkfOw6GN1dWR7g2z29pkelkkw=;
        b=QERr0aIULBbqSwkQEj/VURsJCCxyt54gsip2AO/7jKOeWXJEfS/6nQ+wX+4BY80Eu+
         nh97h9/cT7dCMbpC7IYzmCtpFPJZqqPYGO9AQa7jGc1DqrSTTZcloLuF8smMMH4igoth
         q3WCGxOZNx65qzJVQimSQ9vchhHDOgFrliIxgIIcH0ydWnXt5CuJbC28xBA4hllWttsI
         jdhXazeWwak+DpGTji+FLGu9ccRb2YRq8fEk4DXMEDAl9v7jOwsrlmrF0J/kgAhNd2L4
         SI7GcwxEruIf9NICa0O4iIsIHHKNg5tUuHq2kqvINRpIKi2cwLP5Ag480RXRCMNZzNGb
         kPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715809825; x=1716414625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLs+h6zNZh7mF7wyHbnkfOw6GN1dWR7g2z29pkelkkw=;
        b=CRBnnn+0LG2pozh0aMbIFD+PGOssB/3UB0NLaxCL/NcV5FQ+fY2FUZEE9zRJy+p/Fo
         Vr5sJR9NTHgajb/PkfdGttWk9hhvqNwkv4/1R4qql4i+TCODvd6xDgjhhLq5KWKM6u0I
         z4OGaJOGrpUBMoaFn7fQeeb2xDq+nckC8Eq5K+ZNg1ChTKaQuiXnE5q3ELL1Js3t264y
         r8+Gi3KMzRRnGcmC/DvPB9iDHysGFD6e66nxmu2/JvMk2IS37l5FIRQgC9And/RkXu8M
         HSG9bQfTobcwv8ZF+blpsuICPd/5+WFD0eGiPnyFnyTlkPH2rVpk4SIwdeo/H3u0wfiT
         cLfg==
X-Forwarded-Encrypted: i=1; AJvYcCXpE1jjOzhP6lxmNmDCWCGG/wgdRkTKNjSVAf4c4vzmEQxZSXpPQE3IdD0T0WJgRI43T69gZUVX/D8qpoVeDIaAKn7mRL1tqYJe9G7wEUCK
X-Gm-Message-State: AOJu0YylydWQnqsjJttacsFJnjKY/EqC5cRvI6SJYHbeeKUipi7/MXB7
	/WMKU/4cRCLvZT9i4PejL/erNcwxp2jAJ+qSGXPrJcjTprv4VIIw61hR4cvDh/g=
X-Google-Smtp-Source: AGHT+IGEAaUjSboxWJ2duwQsEeAptuaGBNQQH1TifXZ6d134LKtkLFEiWsZJaGRCLjJ0v/CqjmN2Tg==
X-Received: by 2002:a05:6a21:788e:b0:1a7:7358:f108 with SMTP id adf61e73a8af0-1afde0b5c64mr19600162637.24.1715809825401;
        Wed, 15 May 2024 14:50:25 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm11638629b3a.60.2024.05.15.14.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 14:50:22 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 15 May 2024 14:50:15 -0700
Subject: [PATCH 2/2] riscv: vector: Use vlenb from DT
MIME-Version: 1.0
Message-Id: <20240515-add_vlenb_to_dt-v1-2-4ebd7cba0aa1@rivosinc.com>
References: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
In-Reply-To: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715809814; l=3496;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=PJLl00JSXWHvsV/oHOhLKcWkE7dzVuiu0in04i+U0L8=;
 b=PPusZY5yDbyewn4LPOz6zzsAoeQVGhX8cVESMhQXQMjuHBGziZWmOGA/NEGK6N38Apa7YdlR0
 JGRVUT1Zr/bCCs7fZNijKg52638cniW+CprhQnJVbS0uErZnn/Wx36U
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_145025_977484_20EDED86 
X-CRM114-Status: GOOD (  16.39  )
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

If vlenb is provided in the device tree, prefer that over reading the
vlenb csr.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 47 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vector.c          | 12 +++++++++-
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 347805446151..0c4f08577015 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+extern u32 riscv_vlenb_of;
+
 void riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..6c143ea9592b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+u32 riscv_vlenb_of;
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -648,6 +650,46 @@ static int __init riscv_isa_fallback_setup(char *__unused)
 early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
 #endif
 
+static int has_riscv_homogeneous_vlenb(void)
+{
+	int cpu;
+	u32 prev_vlenb = 0;
+	u32 vlenb;
+
+	/* Ignore vlenb if vector is not enabled in the kernel */
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node;
+
+		cpu_node = of_cpu_device_node_get(cpu);
+		if (!cpu_node) {
+			pr_warn("Unable to find cpu node\n");
+			return -ENOENT;
+		}
+
+		if (of_property_read_u32(cpu_node, "riscv,vlenb", &vlenb)) {
+			of_node_put(cpu_node);
+
+			if (prev_vlenb)
+				return -ENOENT;
+			continue;
+		}
+
+		if (prev_vlenb && vlenb != prev_vlenb) {
+			of_node_put(cpu_node);
+			return -ENOENT;
+		}
+
+		prev_vlenb = vlenb;
+		of_node_put(cpu_node);
+	}
+
+	riscv_vlenb_of = vlenb;
+	return 0;
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	char print_str[NUM_ALPHA_EXTS + 1];
@@ -671,6 +713,11 @@ void __init riscv_fill_hwcap(void)
 			pr_info("Falling back to deprecated \"riscv,isa\"\n");
 			riscv_fill_hwcap_from_isa_string(isa2hwcap);
 		}
+
+		if (elf_hwcap & COMPAT_HWCAP_ISA_V && has_riscv_homogeneous_vlenb() < 0) {
+			pr_warn("Unsupported heterogeneous vlen detected, vector extension disabled.\n");
+			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+		}
 	}
 
 	/*
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6727d1d3b8f2..e04586cdb7f0 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
 
-	/* There are 32 vector registers with vlenb length. */
+	/*
+	 * There are 32 vector registers with vlenb length.
+	 *
+	 * If the riscv,vlenb property was provided by the firmware, use that
+	 * instead of probing the CSRs.
+	 */
+	if (riscv_vlenb_of) {
+		this_vsize = riscv_vlenb_of * 32;
+		return 0;
+	}
+
 	riscv_v_enable();
 	this_vsize = csr_read(CSR_VLENB) * 32;
 	riscv_v_disable();

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
