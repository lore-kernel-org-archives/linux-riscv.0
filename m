Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6CAC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkiLy5cpUXj4T1SvVHqR4bo1jRvAwxPHkHmYFA2UqY8=; b=X6i7tLfxCDsWqg
	Dip9oEYWK+RureIPoJYXzFg2GnoE5DIA6hhXx1Hs1dcl41xWZOjatjlGhSwoNPAX02/YnHOwLk2cb
	quJd8eC1tep6wZIYDGwCZ8wAK4QWllYz0LTl41bPrVfQCv4OLr+jxmTDgjIJd5j+gvUKBfJv2b2sv
	0LMlkqtOMhzQNosHegxASMh+2U6N633Lho0IrPsw54JaIGpnDmWn4Ap6yTs4CwZK7LM5z6VBxdcy/
	Mi0kfTg9bCF2LYHGaE4zZRwX8B/IZf3RlNY1fD5JOgeZV8zhJqLuqN3xlRcUxqQ2rGovGU0dzSgF2
	PX6AU6oq0MK8oUz+1/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9Yn-000000003Z1-0gRD;
	Fri, 29 Mar 2024 10:34:09 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Wp-0000000HUU0-13tD
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:28:05 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-29ddfd859eeso1519590a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711704478; x=1712309278; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfructPGSDbFIY5KANyP0OUZ/rAlg6UVQSMNURcUx/Q=;
        b=hg22XjR3nIFx4g8tLusphvTaiN7w70XR7XQ9vjqWhqiKi8B6eNgEfMoylCvX1NejhM
         1RE7yfwdY0HYsqPWg9N3ogjA9uDdsfLejGvvwdMyUmbj6VMPh8Cpa2+0DIOE+T+57Ce0
         2tgJYCdpUgawsTfTgDmDul4RCK0adDwfu4pYAMtYPggasJc2czx1K5Lwy9J/LbrT0ElG
         krKmDW693372Yt0+pN3LghUU/niTMXL/yjeS9iBV1ENMOclXW6dq9qt70uG0U9cQU3vD
         9+dlUzVE6He6xBYEZxs2jxWhReGPPnHs36G5OV3d1DMVBO35oY/W+5HrrdDuBfOWC/9A
         kMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704478; x=1712309278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfructPGSDbFIY5KANyP0OUZ/rAlg6UVQSMNURcUx/Q=;
        b=uXVxYR1EJevmppGn0uRmsnGaWkmrHqNZZZ5scD1XqlDKldnV2NACOJNYmzKhfXfbfH
         vteAGJIZzRgfE4CL7RinP4ZzDUiR6qAyuO0I5H+O1ZPFO7We8MbDQTZv1ZVhGJOIXvy0
         Erg5YWSkEXAxV4py76l0QX4YaC9OZDy00pcilHiGZ5xAw5bp5mp63UHDsukku1M29ZzG
         1K1wUcd2pw/+xSmcgn/PCQz4h8JSxxhr46OwrY1ugWroXuFVjkKCrhlr1mPbNpKjpnG4
         5H5URCjdHlYEjfbQHCZe3Gh8yduX6euRzIrgG8wrMPOP2Y460wFCXatNl/MOhR48Yw15
         8bFA==
X-Forwarded-Encrypted: i=1; AJvYcCV0igz4uzH59YzISGGrYka1O4zGQRPZEsWvg5Kg/VNvauL1aIe3d3soYhBzcOW4FDREKlB9WBXfhywmER8nwPvFX5tel19viy2xz7rY3b3t
X-Gm-Message-State: AOJu0YxMilVrAwukGbk73e2NIsySiB9hu61qLZvNsvZGk/42TKkx7mpr
	NS+XrFotUSwEfseV2B/0DAwQVzQXjME4awMKhPcuJR8AeK31FHr3utjM9hAumx2pQmDLy53Z4qV
	O8T1qY7csYlcH3QYzq+6AGibW1if8zAbqQA70A7PaRe0LDtO1pabneW9TwlMRxiZe8C35zlEpiZ
	sWw09POFVaC5F1ls4PYlac9rMTEIWbaRTePAASZpTBBOVI0mq/Vg==
X-Google-Smtp-Source: AGHT+IEgRCohje6FoItkAA90Oov//fQs26jLa2d7M0gq96y2GMdC43oOYqp9fbQEYyu5BFzz1OlNNA==
X-Received: by 2002:a17:90a:7d02:b0:2a0:4495:1f3d with SMTP id g2-20020a17090a7d0200b002a044951f3dmr2125693pjl.0.1711704478186;
        Fri, 29 Mar 2024 02:27:58 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id cv17-20020a17090afd1100b002a02f8d350fsm2628830pjb.53.2024.03.29.02.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:27:57 -0700 (PDT)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:21 +0800
Subject: [PATCH RFC 05/11] riscv: cpufeature: Add Sdtrig optional CSRs
 checks
MIME-Version: 1.0
Message-Id: <20240329-dev-maxh-lin-452-6-9-v1-5-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_022803_469773_D88D089A 
X-CRM114-Status: GOOD (  19.32  )
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

Sdtrig extension introduce two optional CSRs [hcontext/scontext],
that will be storing PID/Guest OS ID for the debug feature.

The availability of these two CSRs will be determined by
DTS and Smstateen extension [h/s]stateen0 CSR bit 57.

If all CPUs hcontext/scontext checks are satisfied, it will enable the
use_hcontext/use_scontext static branch.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/switch_to.h |   6 ++
 arch/riscv/kernel/cpufeature.c     | 161 +++++++++++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7efdb0584d47..07432550ed54 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -69,6 +69,12 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+DECLARE_STATIC_KEY_FALSE(use_scontext);
+static __always_inline bool has_scontext(void)
+{
+	return static_branch_likely(&use_scontext);
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 080c06b76f53..44ff84b920af 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -35,6 +35,19 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+atomic_t hcontext_disable;
+atomic_t scontext_disable;
+
+DEFINE_STATIC_KEY_FALSE_RO(use_hcontext);
+EXPORT_SYMBOL(use_hcontext);
+
+DEFINE_STATIC_KEY_FALSE_RO(use_scontext);
+EXPORT_SYMBOL(use_scontext);
+
+/* Record the maximum number that the hcontext CSR allowed to hold */
+atomic_long_t hcontext_id_share;
+EXPORT_SYMBOL(hcontext_id_share);
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -719,6 +732,154 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
+static void __init sdtrig_percpu_csrs_check(void *data)
+{
+	struct device_node *node;
+	struct device_node *debug_node;
+	struct device_node *trigger_module;
+
+	unsigned int cpu = smp_processor_id();
+
+	/*
+	 * Expect every cpu node has the [h/s]context-present property
+	 * otherwise, jump to sdtrig_csrs_disable_all to disable all access to
+	 * [h/s]context CSRs
+	 */
+	node = of_cpu_device_node_get(cpu);
+	if (!node)
+		goto sdtrig_csrs_disable_all;
+
+	debug_node = of_get_compatible_child(node, "riscv,debug-v1.0.0");
+	of_node_put(node);
+
+	if (!debug_node)
+		goto sdtrig_csrs_disable_all;
+
+	trigger_module = of_get_child_by_name(debug_node, "trigger-module");
+	of_node_put(debug_node);
+
+	if (!trigger_module)
+		goto sdtrig_csrs_disable_all;
+
+	if (!(IS_ENABLED(CONFIG_KVM) &&
+	      of_property_read_bool(trigger_module, "hcontext-present")))
+		atomic_inc(&hcontext_disable);
+
+	if (!of_property_read_bool(trigger_module, "scontext-present"))
+		atomic_inc(&scontext_disable);
+
+	of_node_put(trigger_module);
+
+	/*
+	 * Before access to hcontext/scontext CSRs, if the smstateen
+	 * extension is present, the accessibility will be controlled
+	 * by the hstateen0[H]/sstateen0 CSRs.
+	 */
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SMSTATEEN)) {
+		u64 hstateen_bit, sstateen_bit;
+
+		if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_h)) {
+#if __riscv_xlen > 32
+			csr_set(CSR_HSTATEEN0, SMSTATEEN0_HSCONTEXT);
+			hstateen_bit = csr_read(CSR_HSTATEEN0);
+#else
+			csr_set(CSR_HSTATEEN0H, SMSTATEEN0_HSCONTEXT >> 32);
+			hstateen_bit = csr_read(CSR_HSTATEEN0H) << 32;
+#endif
+			if (!(hstateen_bit & SMSTATEEN0_HSCONTEXT))
+				goto sdtrig_csrs_disable_all;
+
+		} else {
+			if (IS_ENABLED(CONFIG_KVM))
+				atomic_inc(&hcontext_disable);
+
+			/*
+			 * In RV32, the smstateen extension doesn't provide
+			 * high 32 bits of sstateen0 CSR which represent
+			 * accessibility for scontext CSR;
+			 * The decision is left on whether the dts has the
+			 * property to access the scontext CSR.
+			 */
+#if __riscv_xlen > 32
+			csr_set(CSR_SSTATEEN0, SMSTATEEN0_HSCONTEXT);
+			sstateen_bit = csr_read(CSR_SSTATEEN0);
+
+			if (!(sstateen_bit & SMSTATEEN0_HSCONTEXT))
+				atomic_inc(&scontext_disable);
+#endif
+		}
+	}
+
+	/*
+	 * The code can only access hcontext/scontext CSRs if:
+	 * The cpu dts node have [h/s]context-present;
+	 * If Smstateen extension is presented, then the accessibility bit
+	 * toward hcontext/scontext CSRs is enabled; Or the Smstateen extension
+	 * isn't available, thus the access won't be blocked by it.
+	 *
+	 * With writing 1 to the every bit of these CSRs, we retrieve the
+	 * maximum bits that is available on the CSRs. and decide
+	 * whether it's suit for its context recording operation.
+	 */
+	if (IS_ENABLED(CONFIG_KVM) &&
+	    !atomic_read(&hcontext_disable)) {
+		unsigned long hcontext_available_bits = 0;
+
+		csr_write(CSR_HCONTEXT, -1UL);
+		hcontext_available_bits = csr_swap(CSR_HCONTEXT, hcontext_available_bits);
+
+		/* hcontext CSR is required by at least 1 bit */
+		if (hcontext_available_bits)
+			atomic_long_and(hcontext_available_bits, &hcontext_id_share);
+		else
+			atomic_inc(&hcontext_disable);
+	}
+
+	if (!atomic_read(&scontext_disable)) {
+		unsigned long scontext_available_bits = 0;
+
+		csr_write(CSR_SCONTEXT, -1UL);
+		scontext_available_bits = csr_swap(CSR_SCONTEXT, scontext_available_bits);
+
+		/* scontext CSR is required by at least the sizeof pid_t */
+		if (scontext_available_bits < ((1UL << (sizeof(pid_t) << 3)) - 1))
+			atomic_inc(&scontext_disable);
+	}
+
+	return;
+
+sdtrig_csrs_disable_all:
+	if (IS_ENABLED(CONFIG_KVM))
+		atomic_inc(&hcontext_disable);
+
+	atomic_inc(&scontext_disable);
+}
+
+static int __init sdtrig_enable_csrs_fill(void)
+{
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SDTRIG)) {
+		atomic_long_set(&hcontext_id_share, -1UL);
+
+		/* check every CPUs sdtrig extension optional CSRs */
+		sdtrig_percpu_csrs_check(NULL);
+		smp_call_function(sdtrig_percpu_csrs_check, NULL, 1);
+
+		if (IS_ENABLED(CONFIG_KVM) &&
+		    !atomic_read(&hcontext_disable)) {
+			pr_info("riscv-sdtrig: Writing 'GuestOS ID' to hcontext CSR is enabled\n");
+			static_branch_enable(&use_hcontext);
+		}
+
+		if (!atomic_read(&scontext_disable)) {
+			pr_info("riscv-sdtrig: Writing 'PID' to scontext CSR is enabled\n");
+			static_branch_enable(&use_scontext);
+		}
+	}
+	return 0;
+}
+
+arch_initcall(sdtrig_enable_csrs_fill);
+
 void riscv_user_isa_enable(void)
 {
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
