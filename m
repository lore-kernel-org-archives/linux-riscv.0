Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2DFC27C5F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFweMgqvCbnZcgwZN54c0ZdLU3GQvxb2xm6lgZ9q2kY=; b=C79LIGT9nYOiCc
	FH269UVpZ9AiJaVVjDLVyekq3G13rx/kHS82uLhGNk14shAmtKOVS5BHF7zNZrd0xhFjKtovySmrT
	NqD+1xIDtRi+LFLVbn1ewzc0dDSGtHAVfBodR4KTUZ7IHA4Z8uXUYkMM5ch8icj772ZV9KAy9h8WI
	/+e+NauS9Syhbd74GSqGqkTqyBLQh+hkYHJk2Poya+qJtij+y1E7dGs0hqyJJV1532J0o9YOqUR/q
	t1p3S0oJQ2OKYb1Fhns/NQ42oDUr7TgpN/JT8lpj6x+7mrwNVKolWK+x963OGn4vgBfCHgE+SqzqO
	bc1Rl8+yWhQaXnPMHixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWuq-00000003mau-3pkM;
	Mon, 10 Jun 2024 04:45:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWug-00000003mRV-47nZ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:45:49 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f6fabe9da3so9319965ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994746; x=1718599546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6wty7/5ckkbIMYQrfSGTFo0XViwtxD1A330OlnyF00=;
        b=bNlOL2slCVenkOrbuSg7gEpmsH7ozOiX9Hd+131hDFRDGz50Xn71PPyqpDXdDFjxBv
         xsHxTfhfYVfUXP0wM2uWwvsuZP6AKn2fkdWtlkNdq5ZZXJOegVMk8nOd0Sd/lLm4tmIQ
         TOiVU0Iw7WsqTWYidW6Af/jPAnkDKpF9oBt8wd0XvWCFoArnWk7CtBywWOPfpq13uNwH
         5zdxFZlsO0az4J7Xiir0xtykysZMZnUJkJTk6rELRxNT9dtd0xiBDGYLQ2s9iTFDUbfI
         P+Dlm9qPUji0e03lzoa4OCVkAvpwwj6Hl/Z+SpqVnJu2YJDFgbWVHIw0OQMoe80VDSKw
         bj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994746; x=1718599546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6wty7/5ckkbIMYQrfSGTFo0XViwtxD1A330OlnyF00=;
        b=EB1vqc5/lDnbyG4w9ItBBZCZxLcK38QITfcRP4ckdWgEmPVB1Woc3R9yAMHco3i44z
         sRQByBHGIe627SU0nKxSUa3yc+Q0qtggPNbmIsNVb+fJVt/7Gxs0EkKFAzCXKK9uMX28
         z0DlMBUvo+QsesE349TvbJgb0aI39djeHdC6kRKITo5oWoXCpcZE1EJZ3MZV8jVQjEnH
         HlrEhJaqsS3dhrqcWis1q71BmwdxDs8+9agNoANO/TC3xzEa2VgCYjnVOmMHyQ2z6PFh
         DbftkSaJbT4L4RcJ1RRsWqKEy96pa2j0P2LXN9rCiARzk3MxoCaJezEUdgKwSU5oIRLh
         MFjg==
X-Gm-Message-State: AOJu0YwzTu6msSTD3Y3yBUb23x4T0yXuPplm9ta1pvoJeqg+BvuDcsBc
	PtqchBLCAUdzBaJjpfPevWNIDvS0JpaLOxECW2yL3OZ0zE04kQCOQB3J5bkhygQ=
X-Google-Smtp-Source: AGHT+IFf+1OJg1xK1MiXf0vBcz9BVHeA14Ul2s1z6qYt10MeOW0nvzzXkW/P4XRzr1D4aiRO1tRUzg==
X-Received: by 2002:a17:902:e88d:b0:1f4:a3a1:a7e5 with SMTP id d9443c01a7336-1f6d02bef11mr85103415ad.13.1717994745696;
        Sun, 09 Jun 2024 21:45:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:10 -0700
Subject: [PATCH 05/13] riscv: vector: Use vlenb from DT for thead
MIME-Version: 1.0
Message-Id: <20240609-xtheadvector-v1-5-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=3511;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=4N9WDp7GVC3puitkjGgcI/jJcnDMobkD3Avh+NXutPg=;
 b=DC7NLCqeukgT5lOVe137EsewYJ9o72ymXSCD9kejmdpQ1Vf7p2mH/l6TTZY1v6PLdnnpuqWvY
 zXH1O/+aMGsDnv7PW52FjUayRa3BK2sWdLtfhwVrfOaa4GCD21J2jf2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_214547_202044_9FA01854 
X-CRM114-Status: GOOD (  17.54  )
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

If thead,vlenb is provided in the device tree, prefer that over reading
the vlenb csr.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 48 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vector.c          | 12 +++++++++-
 3 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index b029ca72cebc..e0a3164c7a06 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+extern u32 thead_vlenb_of;
+
 void riscv_user_isa_enable(void);
 
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size) {	\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2107c59575dd..0c01f33f2348 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -37,6 +37,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+u32 thead_vlenb_of;
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -625,6 +627,46 @@ static void __init riscv_fill_vendor_ext_list(int cpu)
 	}
 }
 
+static int has_thead_homogeneous_vlenb(void)
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
+		if (of_property_read_u32(cpu_node, "thead,vlenb", &vlenb)) {
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
+	thead_vlenb_of = vlenb;
+	return 0;
+}
+
 static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 {
 	unsigned int cpu;
@@ -689,6 +731,12 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 		riscv_fill_vendor_ext_list(cpu);
 	}
 
+	if (riscv_isa_vendor_extension_available(THEAD_VENDOR_ID, XTHEADVECTOR) &&
+	    has_thead_homogeneous_vlenb() < 0) {
+		pr_warn("Unsupported heterogeneous vlenb detected, vector extension disabled.\n");
+		elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+	}
+
 	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
 		return -ENOENT;
 
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6727d1d3b8f2..3ba2f2432483 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
 
-	/* There are 32 vector registers with vlenb length. */
+	/*
+	 * There are 32 vector registers with vlenb length.
+	 *
+	 * If the thead,vlenb property was provided by the firmware, use that
+	 * instead of probing the CSRs.
+	 */
+	if (thead_vlenb_of) {
+		this_vsize = thead_vlenb_of * 32;
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
