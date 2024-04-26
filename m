Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF8AC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fo6Rsr8D3QJsMn8qW3DLS2GabFNcwz0wT9hlJLz2IDs=; b=PTmH9ROWpYpFGn
	Lqk00fNTWLlWPYlN9HOHxXZcEHjuvzU241m4SItauopT9em8zyye7tbZRmVLad8sOcdbWdbLWyzbH
	+AviWV8r9cl0aOLLT9vvLLgjbuw9N3kSeis6yiygvRCnroUDkMoL5/LtmqV7f2kj+gN/4nZI70TiQ
	2IDwfd66i6X4J8BFOb/M873qhmJdprACX5FunQrvKRjJRXhnt9azU6ztywqY/69kqJQkJr8Wcqkxx
	tW1ODvaWZxqos+8H9YAFnMdAYJNyrw8oQJVT+aoUNAq3bOTpHIspTvPIzwOaU5R5iP9xxqTST/uJQ
	p4NHMNayQhXolqQ+C4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0T9V-0000000E4Bs-3gES;
	Fri, 26 Apr 2024 21:30:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0T8Y-0000000E3Nw-2mC6
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:29:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e50a04c317so15339155ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714166971; x=1714771771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epQYh2eYy4HhqqXFO0t2DHAzvNVz9k3o87eDn/hGHY8=;
        b=v0D49OpVJH9NrrQFOS14sf6IPMp+OE401ucQFbA4duBOBeX1z+vNvIivxRY8IiXh2E
         kccMdJkjUfJUERMWF7sTY/dnV2lLz1P4XqCak3BpJgYDv6dAb13TM56FhCUsSHHHciuj
         xr35Pw5PGhk+WsVMOPAT2UVU+8EDr2+I8T2BZzZ+nEZjrp3LHVg+e5+btaLq9gTT4NiE
         zvQWaqo8nxTFmBgu9WZAH1raVQJxaq+rOsJe3pTXyjdSfVW7DlsAve6WwwuRx5pL3RGX
         fA8FLViDI9W/6/YhnRK08k6A111u1jAYcS2sxRmeBVe/yaUpwFegMUJwQRaoh6XXh9JT
         xeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166971; x=1714771771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epQYh2eYy4HhqqXFO0t2DHAzvNVz9k3o87eDn/hGHY8=;
        b=EEBDN9wB2FnrES2oo9PvHAQ7cZRR4Vdx7KzJ5dl9y7+s9kAHl8SwZRHnzWpSYJJfER
         4sSE6MwgHph8bJEo3WMq43Av7/8J9Ylem9/+nxLnFj/VhCbIuA7EmzAIt+BbK8BHzORF
         /grpa9QExnyuzzcD6xWiulkbQjxCobRqNmGyVya7OQFdgCGJ1I9xlsUPYHlhH8QHQF6j
         1sZrdUH58hN2iizljEc2F5rK8xmBPbDuxCpzEJTidiakvjcKuZaoffNfHfNk9mMZ0aKH
         oE40w3HUvV6cPY/9utsszE7hpS7AObRELENp5ZI/Bdh1dPg4FA+WQ8gcbVi8EYxwDL+s
         7hAQ==
X-Gm-Message-State: AOJu0YxlTJwlgG8rPHJubN+OiyXb6fQwLbmyzTCzk11l6fTJHFinaaKn
	p3227DR4pXazrZnzWtTR1UPmvCy2GXyNTTTAwaLMyvjfteyfYH1rugp3NUYP3Wo=
X-Google-Smtp-Source: AGHT+IFDdWTRYVcgW9qDFh5H5WCJcnb34hUrziiEttp/aNO3ZqSkuqgK9qnNIcUJgRrMqeA168Gjwg==
X-Received: by 2002:a17:902:d2d2:b0:1eb:144f:63b7 with SMTP id n18-20020a170902d2d200b001eb144f63b7mr3362816plc.56.1714166971409;
        Fri, 26 Apr 2024 14:29:31 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001ea2838fa5dsm7226720plk.76.2024.04.26.14.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:29:30 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:29:17 -0700
Subject: [PATCH v4 03/16] riscv: vector: Use vlenb from DT
MIME-Version: 1.0
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-3-b692f3c516ec@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714166962; l=3503;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=TMZGPAigRUlnddtyOxdX28W8hFoUd2ldYAJcckC4XNo=;
 b=voxH8bczevqJuWsa7XFbvY9OOL8pV13Qpe0a6DJPgY+bzFW02nxmGbjhOM58C+T7gFvqpoMhf
 1Bk7VHjcOmKC45lYQRmhaE8i0oGl6cJy2OFEN3ko9rPsO0a7Logzma5
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_142942_970107_A0F02B10 
X-CRM114-Status: GOOD (  17.95  )
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
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 43 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vector.c          | 12 ++++++++++-
 3 files changed, 56 insertions(+), 1 deletion(-)

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
index 3ed2359eae35..8158f34c3e36 100644
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
@@ -648,6 +650,42 @@ static int __init riscv_isa_fallback_setup(char *__unused)
 early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
 #endif
 
+static int riscv_homogeneous_vlenb(void)
+{
+	int cpu;
+	u32 prev_vlenb = 0;
+	u32 vlenb;
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node;
+
+		cpu_node = of_cpu_device_node_get(cpu);
+		if (!cpu_node) {
+			pr_warn("Unable to find cpu node\n");
+			continue;
+		}
+
+		if (of_property_read_u32(cpu_node, "riscv,vlenb", &vlenb)) {
+			of_node_put(cpu_node);
+
+			if (prev_vlenb)
+				return -1;
+			continue;
+		}
+
+		if (prev_vlenb && vlenb != prev_vlenb) {
+			of_node_put(cpu_node);
+			return -1;
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
@@ -671,6 +709,11 @@ void __init riscv_fill_hwcap(void)
 			pr_info("Falling back to deprecated \"riscv,isa\"\n");
 			riscv_fill_hwcap_from_isa_string(isa2hwcap);
 		}
+
+		if (riscv_homogeneous_vlenb() < 0) {
+			pr_warn("RISCV_ISA_V only supports one vlenb on SMP systems. Please ensure that the riscv,vlenb devicetree property is the same across all CPUs. Either all CPUs must have the riscv,vlenb property, or none. If no CPUs in the devicetree use riscv,vlenb then vlenb will be probed from the vlenb CSR. Disabling vector.\n");
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
