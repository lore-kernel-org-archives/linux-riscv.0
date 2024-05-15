Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B821C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 21:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxLnR6YfzvT+OFmHRUcctad5CVYfwXN9zCakEF5uEoc=; b=AOFy2AVUkOAfHo
	86LgxwXZR3ynOilSIgjDS6952PNF7m9qA+axRW7GggXQx2luoVLKRUTCP+jGMnRUtIAY+7H8DvnB1
	WF+hZCEfyRmhTndTbcL4BduqeD+aNyaxyAGhIoanOFqHgzVa2ATPM5pzLhAH6k+HrlrU8jLbxi1Bd
	eQzT/dEN69Onxu2yFAQcApIU+G6yIc9EyMYMag6suYbXL/4cFrYVVFGHrI0vw5gNqsKASjAUfAySg
	0rd/DEsMMVWXmt1tZzk7xHXZvB4MD1N3dqwqPDz11tg50F8rn5V+ci+hh5fQaM3+dZfJp5CWqyqiF
	cmf54KO5L7yHDkDiW0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7M93-00000002v1l-2jel;
	Wed, 15 May 2024 21:26:41 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7M8x-00000002uwc-0Xm2
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 21:26:36 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6f6765226d0so1118019b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715808391; x=1716413191; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEtMpcdozCEaninIMfDtv7U6J6lXws967E7oEWhvO1w=;
        b=iiiGSF6fDAMVuUYYqmST4yqqAUWdC+d86n4ikPLWGf0s2Vfrd+gJg2VXcIrfY9ch5f
         WPmpwR6KCiURpdsJI50NG73doe2VyfGl5I1yd713ZZf7Ha2Z4xl0rNnYlWUN628c3DVA
         ceEl2dIcOUc3hLoPbTDMl51fTUwj27YVbZ6OhPvJcEndi/zQgv1RkznSjPx106BBonEu
         J977r8mmh0cZ/B4BUeLf2n2qV4Nkqx1/o3XBYDU1ixQwDhAyUE73dLhUySP/hViMpPZC
         dghPhEXS3dxycrSa4D+Sa6xRvhsqT/50TgNRN0BDrv4hbgIRmdxCdwgKJOAJO+Y7NMam
         zzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715808391; x=1716413191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEtMpcdozCEaninIMfDtv7U6J6lXws967E7oEWhvO1w=;
        b=TsHmJqwalmfCZWmeJaw9OTlwuLkB5rdKpjQbxcSljBcPg5lOsQPC8sXOAI3oXN4WOr
         /9cn3GiyrU6Oni6yIEtVnPyDiA0j9npvwmso5jvzQe5MN5LTHzS2B8jw6LoThMm5UmAd
         VSYcGJm+AFgxgupcOeL9Wrip/9qY1+uN4Uy8rGZ3R1cZXjaBaLHRLpWW/SMqUjZ5f5Lu
         7d/L+rtIp2F8QpaIPeM0MatCTZj3ckfkMPgw5Ry/6hHZqvqFPVW6Hv6wR0AVuNFIEqfv
         hFqlU1NM02M0PIANk+DcRBXupR47ipf+pzs+S2by+qzuJ1N4HLVHN1gXzWI+TfsX4Cxl
         PLlQ==
X-Gm-Message-State: AOJu0YwWAdWKsCOsVjU4GLNTTx3w7UyMaEAO1DojwowCg08MOPrRtuQn
	d1IDhcjcoEfmAKf1kpfmzViHXH4WhBSe+cUxQlXSd9vASGdXw/3dGuWVe4bFz3Y=
X-Google-Smtp-Source: AGHT+IH32uaq8x0M23Tv8aymfxEIe1JpiMLVWwzdsi9eZUgeqENJpbM71PeLSvsro24FgpBWkZWJRQ==
X-Received: by 2002:a05:6a00:2e17:b0:6f4:b20e:a08a with SMTP id d2e1a72fcca58-6f4e039ccc8mr19686275b3a.29.1715808391671;
        Wed, 15 May 2024 14:26:31 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2b30sm11970243b3a.146.2024.05.15.14.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 14:26:30 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 15 May 2024 14:26:14 -0700
Subject: [PATCH 2/4] riscv: Add vendor extensions to /proc/cpuinfo
MIME-Version: 1.0
Message-Id: <20240515-support_vendor_extensions-v1-2-b05dd5ea7d8d@rivosinc.com>
References: <20240515-support_vendor_extensions-v1-0-b05dd5ea7d8d@rivosinc.com>
In-Reply-To: <20240515-support_vendor_extensions-v1-0-b05dd5ea7d8d@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715808387; l=2560;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=OKCBEgWtvD/dlocxKHXhgf3xa7jUJx2ld8oCeMzEsKY=;
 b=iVnq6S9cngstY5V0ai8u5yiNu0mhiLAza0dQF0qiCbRzE8O40tFTOCPpI+zsVRkmZSd4Zmfjp
 ixRuEWJTst9AkcEb/cwrQYQLxxZjvja+BhQzAjvDyoxXMwklkVermz8
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_142635_317706_AA82D5EE 
X-CRM114-Status: GOOD (  12.53  )
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
Reviewed-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
