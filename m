Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B84C3DA70
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEEhRYRqoIV4VN1pGVvEeY3GBnhe3hK8GCQMtCSc1YM=; b=e8ECQ91se+C+cB
	Zbvw7Jl8n7XeigksOeCdHRpCPiG85iKkYtLt9U5tnEvkhliNlYFCMORLnJTFBuac0OpgJ9K4rflJB
	9GpUYPZRcOxw6SoUkh23R6vkA0PCIl7RerliFXMLGXVGvJG4/ZbEfc29ETPgunAkUM7yH5cErTgnc
	QOKGgA5nhWEPtaHavJdwN0qRPBRTWbBFQyIofvjQvF4vqLzEHyv9bRTkf+qM6OkCxSIz9lBAA/ZmZ
	gWikTnNciINOLlZfS3xcbFvHcV9m5JHTorELPnOVK2TIcgBiKJbw38DcBl7iqvmOH39ukMjVMpG4Z
	O6U3qomHYppS4N/JHr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqGo-00000003DgS-16CV;
	Fri, 19 Jul 2024 16:15:46 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqGk-00000003DeY-0eU9
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:15:43 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2611da054fbso195911fac.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405740; x=1722010540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpjb3e/cwn7NO7Zc46N1APao8n8upBlVj5xz8tHyLtY=;
        b=KyEaP+cxK0ITPKQGsd4y/xM3YvnYIAB/WmA1YOTRsVbrqNvNs6cthI5YIvnuVaiQBB
         pqEhOsg1G98vhqNRi7lwMG8cxgM/44w5+Li+o/80mLizsUsccQkeKHYeAPuGe7KXsnxc
         exG//7F9N3viypqxEqRWauviApD5wUsjVM5GlCYTJpb8RtlMB2AJjEKD5mcFEqn6zRnX
         Rf5lYqtlMJN1tnA/vyGNhP5gpNn2137WpAFLb2102pqm0MHA29s71mrCYoVKQSNQePEr
         B5fJrY8XnKEe5TcgZ9C0nw1g0bCa+IZTgkQWWi46M2EG4T9b+cHnzk2kUEuRYwKZFtxj
         Z/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405740; x=1722010540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpjb3e/cwn7NO7Zc46N1APao8n8upBlVj5xz8tHyLtY=;
        b=VV8isIAlXc79UNDaYj89ZbGTMIzCIxrCvkcj1QV3bvDsN/b74tbwjdsljmOtoVXDG+
         +YUha43dVBgdXjrR6JjtMzBgMfzrPuctjt72wuz+sUNXI2CM5MUDbMNyliT+vMO9Nyeg
         fkL+w2y6/w6jrDbLzjEqIXhVejpyLAs3EaCDi9ysDYYyYMHVqHjC/S6rHhT7iXcvy/oc
         MvdZSIWsuWFJ4f1yk4pFAdY0Rjb93cL2FyYizraBY7XHL/O0HNokcDZNfblRmX1TcH6x
         uKwti2N5eP3hHvjpQ1Tk6p/lqZdnyULjDiZvKVLjIk6DR5VEriXXuuh6ASVFDAQw9+mh
         KEwA==
X-Gm-Message-State: AOJu0YxF5eKIbcYEcy1krGuQ1vAAa4cv7JmItYJvo2O0yEdwjc3qY4ZN
	r1tfVFCRRsIxOZ4zpeQnXiP4kVS5hyKPPvRaLyIR9LSdtWpHwkioplVKzb759neOIkdXACcD7Tu
	n
X-Google-Smtp-Source: AGHT+IFoAtt/05zWiwEnh/GR3LUdJjmbVnpR5v+x7lYjPP5dLjhM86KY0E+JfVdgpVZRQ4YdUQ390g==
X-Received: by 2002:a05:6870:148c:b0:25d:f0ba:eab7 with SMTP id 586e51a60fabf-260d91c14eemr7070243fac.18.1721405739971;
        Fri, 19 Jul 2024 09:15:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0ad73cc4sm579589a12.29.2024.07.19.09.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:15:39 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:15:19 -0700
Subject: [PATCH v3 2/4] riscv: Add vendor extensions to /proc/cpuinfo
MIME-Version: 1.0
Message-Id: <20240719-support_vendor_extensions-v3-2-0af7587bbec0@rivosinc.com>
References: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
In-Reply-To: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405734; l=2560;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=jX1rj/5Eo6K4VCkcWXFPVGV22tyIjfGbooFelFlP1yQ=;
 b=lhgzvNChjg8kplCDzaODRjelwprExmqYizaI7GahQwX36jwYoLg90IMReAZacNf3LCHSV3OJi
 4i7f2uis6h6DZOqSKfRpKT76WiHAFmjVrX/9dVn+wV7FBGGLky57PIx
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091542_235005_D05BFC45 
X-CRM114-Status: GOOD (  12.83  )
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
index c1f3655238fd..f6b13e9f5e6c 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -16,6 +16,7 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/pgtable.h>
+#include <asm/vendor_extensions.h>
 
 bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 {
@@ -235,7 +236,33 @@ arch_initcall(riscv_cpuinfo_init);
 
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
@@ -254,6 +281,8 @@ static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
 		seq_printf(f, "%s", riscv_isa_ext[i].name);
 	}
 
+	print_vendor_isa(f, cpu);
+
 	seq_puts(f, "\n");
 }
 
@@ -316,7 +345,7 @@ static int c_show(struct seq_file *m, void *v)
 	 * line.
 	 */
 	seq_puts(m, "isa\t\t: ");
-	print_isa(m, NULL);
+	print_isa(m, NULL, ALL_CPUS);
 	print_mmu(m);
 
 	if (acpi_disabled) {
@@ -338,7 +367,7 @@ static int c_show(struct seq_file *m, void *v)
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
