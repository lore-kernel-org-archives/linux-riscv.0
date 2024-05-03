Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AED6C25B4F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYlSDj3E8Jz8gzRMOCdC8udw0cyqELY9ba52D46vfN8=; b=4qD/7BmmEA7jaq
	L0jW4WZxqVbiU+1I0y1TPvlj3vdgzSwK2uVYG3eaX4ZES4YigABmcYaeyZ8XbyeWULR3E5Qr4uUmC
	OVcYpmWWkXztzFIB2+Lo7y9/eRjku51WqM05H3GRr+HyiHg6DPgnX3X4nUga/M1YHfeThVAesq7mh
	rUuOUvTWS2JGJewQ3uILmZWTlqiKevhETzXThbakVr+u0IapMdDRF6y55dA8wz0CbiqlINV0TMMJW
	T66E2CUeBSVa4J01hTnCUAngQdLvtzz+U1FUtJHx2a/Ek9I8YbJBb0y01IKdVMDA1/LYuEQp05mVp
	KlxmDZVB7uW8PDiATKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xVh-0000000HXcr-3wEb;
	Fri, 03 May 2024 18:19:53 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUn-0000000HWw2-1cOT
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:19:10 +0000
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f457853950so33479b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760335; x=1715365135; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=1DZ4SciUQWMlsK33oWtB2xFhdwqKcN0KRWjTZZMj/2pXOkLiA50dH7Vdk5yTnV2JWc
         4IOZXyrpVYRMReCaL9zcCekyzJa5RRjiGbE5cT8uEky3zkhPX9TKE0NRX15BSjDUVu2V
         8XxAOwOgnyE+57bOQjCbNKQ0vmXRoXgBKIE4Tu0ML/XmeNn8DrEpE3Sy1hje0rvuDVOE
         pViGv16wwNlE+g+Nle/JA36q1hZXxhyqXSZ72/SXyYVypCjYoh44Plk4z45I5SJVxwBb
         w3HCYD2POoqvX8PzoQcqA9+tbgfVxW5GxdMu6TqOdrz6a0WmeHX8B5wPWyetp7peeXeM
         0wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760335; x=1715365135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=SnqujHZ8aO55zBI0uLk14otLhAhHa3ghqHtR1SnRk1QyorBFO0ZdwCPtK0Syr6gfjj
         oSW1g6PMxHKCNaDGUyS9aNM0juCglugL/eSRoizCzQGmWFu8dZlrzX5uUgjr+l1JUHMP
         eFC5FcefDAJXPI/ZuhD/ikAWGdS9hYIKAOtI3KD0Q2yJuldIkbxrpu3STe1ake28DKND
         ABZ31i0PR48kk/OVBK+htMQB5gUWdYfV6dVOIeadTzsulWTjWEeA0Rd/Pe3W3tG/vUdp
         JHKKQfHpryNqWckEcs9hACa2vasbuGE3VNh4zgSx4+q+1aAvN8xjaYSEoxz9EiB2VsJc
         /xHA==
X-Gm-Message-State: AOJu0Ywx5AYvMF/07qa5818qNya6pUC96yxy//GAZ9npQuBlQbaMebci
	tKIHWQ4W+iwml7N/HOsyccYj7XmXjoooqPhNPW+fZjkgsamjYU4grkrBCaxsBcw=
X-Google-Smtp-Source: AGHT+IFtffChuwBhS5Hm7XU8F8qXkdTP8YFkTdZYyG5ns+Etj9MDZuxDDNk7FtJ718xCtJB8CuLs2g==
X-Received: by 2002:a05:6a20:104d:b0:1a9:11e5:2915 with SMTP id gt13-20020a056a20104d00b001a911e52915mr3981411pzc.27.1714760334670;
        Fri, 03 May 2024 11:18:54 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:53 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:21 -0700
Subject: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=2459;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=pqN1lFvFRjrgQQgZqYCWrh0drQd/FoIFRL9Qt9AtemU=;
 b=mSKF8x/jDoWL2qt9MbecKfiOANTWEfzH0iw4ND1E+SV0TbNnB9ytivBteSpS+Z2vjGFzFTRiQ
 UdfwX8NaOz5BpeYweh8Wk3kACtc1ksmEmsYKFfUKkaZcms6Ck2Wyrck
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_111857_683214_722B462D 
X-CRM114-Status: GOOD (  13.60  )
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

All of the supported vendor extensions that have been listed in
riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/cpu.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index d11d6320fb0d..2a7924dd809b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -16,6 +16,7 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/pgtable.h>
+#include <asm/vendor_extensions.h>
 
 bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 {
@@ -203,7 +204,33 @@ arch_initcall(riscv_cpuinfo_init);
 
 #ifdef CONFIG_PROC_FS
 
-static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
+#define ALL_CPUS -1
+
+static void print_vendor_isa(struct seq_file *f, int cpu)
+{
+	struct riscv_isavendorinfo *vendor_bitmap;
+	struct riscv_isa_vendor_ext_data_list *ext_list;
+	const struct riscv_isa_ext_data *ext_data;
+
+	for (int i = 0; i < riscv_isa_vendor_ext_list_size; i++) {
+		ext_list = riscv_isa_vendor_ext_list[i];
+		ext_data = riscv_isa_vendor_ext_list[i]->ext_data;
+
+		if (cpu == ALL_CPUS)
+			vendor_bitmap = &ext_list->all_harts_isa_bitmap;
+		else
+			vendor_bitmap = &ext_list->per_hart_isa_bitmap[cpu];
+
+		for (int j = 0; j < ext_list->ext_data_count; j++) {
+			if (!__riscv_isa_extension_available(vendor_bitmap->isa, ext_data[j].id))
+				continue;
+
+			seq_printf(f, "_%s", ext_data[j].name);
+		}
+	}
+}
+
+static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap, int cpu)
 {
 
 	if (IS_ENABLED(CONFIG_32BIT))
@@ -222,6 +249,8 @@ static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
 		seq_printf(f, "%s", riscv_isa_ext[i].name);
 	}
 
+	print_vendor_isa(f, cpu);
+
 	seq_puts(f, "\n");
 }
 
@@ -284,7 +313,7 @@ static int c_show(struct seq_file *m, void *v)
 	 * line.
 	 */
 	seq_puts(m, "isa\t\t: ");
-	print_isa(m, NULL);
+	print_isa(m, NULL, ALL_CPUS);
 	print_mmu(m);
 
 	if (acpi_disabled) {
@@ -306,7 +335,7 @@ static int c_show(struct seq_file *m, void *v)
 	 * additional extensions not present across all harts.
 	 */
 	seq_puts(m, "hart isa\t: ");
-	print_isa(m, hart_isa[cpu_id].isa);
+	print_isa(m, hart_isa[cpu_id].isa, cpu_id);
 	seq_puts(m, "\n");
 
 	return 0;

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
