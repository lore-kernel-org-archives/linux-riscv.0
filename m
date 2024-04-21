Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F714C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 02:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGWDalkT11mVR7a9vdcboGXnFvodjihxqO+EGPe20UA=; b=Gr4/BHPUdFp+Uj
	RlPDXwJoH6D/zoFvy5sFACR2I1TWztovkpXhjtOT7NPWmbkec15tfCClbCkcGzp9O85zGdE6l4djv
	FQg1jhGUQXuKYNI2JMOClJE4nJtWZSzs/9GKGB7m/Du+We/VA5FMXFzg3odmMfcZm9Z19fX6gNUpo
	CCPHLZENvVxr5sox7Mb7HY7hI/rm1fCuEYNJ/1GyTKj4wbBo7EVGk7OmozBIcHVuoXWM047LTeKZN
	VNgG92ok7J+YE+LY/y8NkOD1aEZ/1b+JNfeAb1gzvDhm6Uf1CD5/nnJgc7CigmUA3Nddnk4ZcpBNe
	HjLOIJxRBVH78Q2IkgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryMl2-00000009erx-3S80;
	Sun, 21 Apr 2024 02:16:44 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLdW-00000009Vlx-0XDg
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 01:04:55 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5f034b4dcecso2089132a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 20 Apr 2024 18:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661493; x=1714266293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwiZxNeYR2dsOfUqNH+FhNResBaJwUAOM6PgWjZ96ng=;
        b=osEbWkQ4W7CIVLxja2juPyZXZiWQV6vuvz856V/UJlOqfCZf9AMmjxigfY+XPt1Drf
         yiGRC+iAHiGLNDIjSip3CEEwXTKImrqnnpaJnpRF2yoxN0sxDlDCKCJPiUiCkuiBJp4l
         9S5EZbtit0GYt3WL5bpyQ5ps6/1muNeRcg1mBBBVetx1GErpc6Yh5orYBsgbIsj75G99
         tZ1JnS2zQ6OUeCjEMZtTEErQk+qpWlrh2YIxb+OoxXCzEKfTLFxDj/JY4CLs2lv1Ca5w
         WxvJg8qhwWJY6grorL8xcQnfnR/Js6KKeKA133D/0lZs8MDnLjjsnQ+N1I4CqHXI/F0j
         4CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661493; x=1714266293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwiZxNeYR2dsOfUqNH+FhNResBaJwUAOM6PgWjZ96ng=;
        b=f0/ByjmgbznnfbkbmnA1fMU91ZSsb9g3LIFF2N4ea3zid/5UPusgDzeZbkoHGUQGKC
         9u1DvXkedEycAUA8CXZsDRA7cMFsNmUshUt05WHiz6cLqY6X6yY0HS6mfxEpBjaS35Db
         r+ecOKlU7i1XNPzCTiS5pwb9qAanFCeVRSbR+oyzGgbPOMbDtiJ93LyJghLb90RTeWtx
         gOSH15yAenlyiHMyvPbp9tkUVz4DIAPu0IwbujusVzo849RZYwCKihWrv0uvybrH6AKX
         Gpf7aa0HdGgANop0b1YSuLLjliKgLMI1BFcUkIAoWAKikdcNn+oEYawo54pZNV2T8S4c
         /Epg==
X-Gm-Message-State: AOJu0Yw6eZ8cnx+dY7SFf12m5dNq/+QJPdCO3omrR5+c34Tdf3YQGCX+
	33J3KUWsR1vR8LSnE4xCD4qRDhAFZ5P+eqpUnmffW2VRpg2vDtVgRBC/N2Ou6OM=
X-Google-Smtp-Source: AGHT+IHEqlVr8XjJq/bey4tfJdpqb4xpHnlnsfP9yuzhwez6j8pGLKCeBHJDB6I2Vja1k1/DoW2S5Q==
X-Received: by 2002:a17:90b:3651:b0:2ac:e2c6:3d40 with SMTP id nh17-20020a17090b365100b002ace2c63d40mr4937324pjb.18.1713661492951;
        Sat, 20 Apr 2024 18:04:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:36 -0700
Subject: [PATCH v3 04/17] riscv: vector: Use vlenb from DT
MIME-Version: 1.0
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-4-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=3089;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2wg73hE7GfHtQm3h56N22EjVsvIgG2uOGknAS+HQCok=;
 b=oM9AC2pUhODrL99+ED3B1dn5wieUo9QyYC4T1kj5tzYQfCtIJrkTGR8vysGpRIw+kQlGk+mi7
 bsmO7wcPIwDB1FbAfGYW4T6Jm4ic0X5z8Xk03t1wB+GrmxR6X8cHp4S
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_180454_211951_9B98CDD4 
X-CRM114-Status: GOOD (  14.47  )
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
 arch/riscv/kernel/cpufeature.c      | 26 ++++++++++++++++++++++++++
 arch/riscv/kernel/vector.c          | 13 +++++++++----
 3 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 347805446151..809f61ffb667 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+extern u32 riscv_vlenb_dt[NR_CPUS];
+
 void riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c6e27b45e192..48874aac4871 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+u32 riscv_vlenb_dt[NR_CPUS];
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -656,6 +658,28 @@ static int __init riscv_isa_fallback_setup(char *__unused)
 early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
 #endif
 
+static void riscv_set_vlenb_from_dt(void)
+{
+	int cpu;
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
+		if (!of_property_read_u32(cpu_node, "riscv,vlenb", &riscv_vlenb_dt[cpu])) {
+			of_node_put(cpu_node);
+			continue;
+		}
+
+		of_node_put(cpu_node);
+	}
+}
+
 void __init riscv_fill_hwcap(void)
 {
 	char print_str[NUM_ALPHA_EXTS + 1];
@@ -675,6 +699,8 @@ void __init riscv_fill_hwcap(void)
 	} else {
 		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
 
+		riscv_set_vlenb_from_dt();
+
 		if (ret && riscv_isa_fallback) {
 			pr_info("Falling back to deprecated \"riscv,isa\"\n");
 			riscv_fill_hwcap_from_isa_string(isa2hwcap);
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6727d1d3b8f2..fb7f3ca80d9e 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -32,11 +32,16 @@ EXPORT_SYMBOL_GPL(riscv_v_vsize);
 int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
+	int cpu = smp_processor_id();
 
-	/* There are 32 vector registers with vlenb length. */
-	riscv_v_enable();
-	this_vsize = csr_read(CSR_VLENB) * 32;
-	riscv_v_disable();
+	if (riscv_vlenb_dt[cpu]) {
+		this_vsize = riscv_vlenb_dt[cpu];
+	} else {
+		/* There are 32 vector registers with vlenb length. */
+		riscv_v_enable();
+		this_vsize = csr_read(CSR_VLENB) * 32;
+		riscv_v_disable();
+	}
 
 	if (!riscv_v_vsize) {
 		riscv_v_vsize = this_vsize;

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
