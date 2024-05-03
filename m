Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000B4C25B10
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYlSDj3E8Jz8gzRMOCdC8udw0cyqELY9ba52D46vfN8=; b=nNExkN+0yjTQfA
	z6LvmzlBPwI+GIC+if5zE033c6cY+yO/MeXm+GXrVmuVaxGJXveSO/vGirArqLetsCtPtw8NwTKBw
	dLOTv6M4UAmPQc7d4inogaxhkPnwKDYh4wd92krsoRheX1CdYTBR1R98q99H6hGBrTg0UbtQNRvPD
	3D5SuV+kA/YrG3XY2s6vo1giJEaVi49Kri9F+hYXOvxfLAjRc9bPrS/Ubr5WRNtUsL+Gq2d+WfkxJ
	T36EZbt4QFf48dDHZ/sxk23dMbxDGEGepaLZGro/wHRsApphsrGYiZ/4uVvmSgicWsY6FTNuiKBKx
	5EPd2P4wK12yzsVq9d+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kpS-0000000F1vc-1nHf;
	Fri, 03 May 2024 04:47:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kp6-0000000F1YT-01rl
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 04:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=; b=OKNNjT++ym7cTIw1ip8PaRbSZE
	TE+BpC+ISQnqgDBt97D+7CPGQ1dpyMsfWQxeRxLbnzsyheLuTqMjUdjZ79VIlF/0DmDBIxkimZuO0
	DHgOxTSoF553ArbxUTt7SqTZgTc/8mUajR5rMdYE/ALMPn6i1N7b/erO+agw/yi2dM0pBdBrER9z9
	Fjyp4VgmYSGODrR1jgfaHlgPLHrPNSl7dPlZeZVryTf4y17wdkCqdt3oLZB6axUC8qwKmP3YHI4o2
	8Yu0bSKgDuUUdybqTZLSXSiHz0nEMAMznER7ENdcQF1r8OMyFHhlAokAn9GqqXFBatK4cKEDqZfd2
	G2a7nwKA==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kp1-00000000Pys-3O6L
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:47:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so63912925ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711616; x=1715316416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=ejGCpnbMeSXe4MSVrIWUobbz1cLVtzJfOp93251oSMqdJnN8EmN3iuJ6D0jnlF/C+y
         qFlztP+p0r1VmOO6kltv5gXHV4uePU7eJeBYtwXjVZR6LelyOzP2V8zFwJT7UOhxHAxB
         +j2BOAerz0vg+KgbGvvEFoAa3TxjjJbcpnPGF9qrZBarmTiTaPO6RKGqsuXGRJhM6Eiw
         8FrOMYVnNyulZ/NbzLKtd82h1MyNGMklns0riz0rrdH/FnbwXr693DQ6OxvYhNOXlJHm
         2tAqfaBjBzaYW7JP1s0agoy9Zsudu9eOjwYPAaQqFcxiC8xeIyJDUsyeaeMHwSJ/CHOx
         4NXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711616; x=1715316416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=dIiCbDnigsLsulVHPVwJh3qmdFyBqT0dZOPjhnMeYm8oYLtQJEoexr4k/Bld5I0Ya+
         34cJyGms+mCLTYbfYXASmhydmCKJ0RLh3YYCDse4kmjnWST6M+Rf6DvMhL5jen4kzoDH
         ZiBEH3YJVAgVqROBafC/ow88Ij4iplXYlk/vyie3a3Uq1a+TyiZ5WPXmIyEzFtO0TTe6
         Vt0LArhhrSkgczj5CpQY6PAsgnAWu70dF+LUDJYWBgZQSTowh/GvYg3tRpvQy8NZUfgZ
         LZCZSQVzCMqfaRIMYSH+qzdLUn7ozYtB+reEA2ppPU2aMoT8unMehipJRCxnQu5+REBo
         HdAA==
X-Gm-Message-State: AOJu0YxLYwV/L0n9nOmmL9anqyWlSsAypbPwHKDxiCXpNaCUWrftVVA1
	jv2h3QhXDJF+Fsxf/NCXg+8dvzi+anLeN6pE6tkusZRRLNwQe65iYyGcGPeKEF4=
X-Google-Smtp-Source: AGHT+IHbNMkuv/su3XYOiyps0iZwtZ876nCqWFEdktTVe4e6t6GWJkz5DfWvpaj9ZsUbI8EqMDprbw==
X-Received: by 2002:a17:902:ecc7:b0:1eb:dae:bdab with SMTP id a7-20020a170902ecc700b001eb0daebdabmr2129152plh.46.1714711616732;
        Thu, 02 May 2024 21:46:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:55 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:41 -0700
Subject: [PATCH v5 06/17] riscv: Add vendor extensions to /proc/cpuinfo
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-6-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=2459;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=pqN1lFvFRjrgQQgZqYCWrh0drQd/FoIFRL9Qt9AtemU=;
 b=H+DX3cVVjv1vLieQvFF/GzHeHnV6V/D0UYWMIUMz9yJnTEHNzwd2Lhb1bwFvj20Y7hip0X35P
 f1ya+z76CwvDzykr4rBxhsKf62CDwPGbJNyH02uPIH6mLHUmhes2dAq
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_054700_315281_F3D8F123 
X-CRM114-Status: GOOD (  13.44  )
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
