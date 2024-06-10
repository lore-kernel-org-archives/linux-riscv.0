Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E1CC27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEEhRYRqoIV4VN1pGVvEeY3GBnhe3hK8GCQMtCSc1YM=; b=Ij2YtDnyXse6U1
	b+DQAAdOReIkaL1D0+iOXT4ivo8aIH0NhfEt9NStVCaTh6xa9heGiIhlueCY2fqR2s8kVWDxEJ32P
	5YedDbMDk7ULlXURsFvh2nJDg8o6RTrHCZzMRaqRkxbJQyoW3XiUl+EZ8hV2lcEqv0Bmnfp9VKhBA
	iFAnr3ZSUL0eFe6kY0E0Ct0vY/ZYGn+v6scOEcPrVPKRyVqlaFJ/hPM4CwApgy/WJX71ogq/LSugg
	9nTQUo7FpAHDKT7VPbx3hnHoGLhSVyv8E/Tkvb26U4xnbFLoo0C9wYtugl7XSJSuB2w3Ao4/PegSu
	ZS2yBxs9ivt1Vx6COWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWjz-00000003lDo-0rqg;
	Mon, 10 Jun 2024 04:34:43 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWjf-00000003l8A-3BnX
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:34:25 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70109d34a16so3681030b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994062; x=1718598862; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpjb3e/cwn7NO7Zc46N1APao8n8upBlVj5xz8tHyLtY=;
        b=XH/rkrW+ugnDKjf1rYCgL2P226QlX04cTH1ORMEIEksS4xq3low4muNxhXRtLyTxC+
         11baUrOVCVfAa/jqeIjCX0Zh1ILgwxB6Z0q/Eyh73JxkM3oO/vqeAo1WBgtjc5OJSpl9
         OpfDHkQ2YRcHPBWfs3WR7wpcJfptUhyljYslj6WeJbQOB5acyDwEhEMplUWSWUMoWS6d
         IbAPPyHnDVidQvN9mcDcW6XNmeom/84xs2n23aW8ZQ6B4TicYELcriko5ut5m1m8/P8D
         JSLADys2SqG3GtylYVxTHzfyKK2+w4kPPArHPtUQO0WyYRVs3XGtQm1Eby0fH4vcbBDn
         HI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994062; x=1718598862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpjb3e/cwn7NO7Zc46N1APao8n8upBlVj5xz8tHyLtY=;
        b=h0FUCot47hO3su+0CbdM1uAp+BRgcf2eNhm4Kjcnqpdiq9DCiro4KN6NXayrhX7Qoi
         WETGWBWu2Cl6HWwNBoP6hx2hKl8LqQ81lsMntNU3blTG3FCNfQFVZBa5h7yupyUbrD46
         yDB7LTfgOoXNvuCO5uPI+Oh7mh+yl+PoyjAa+oxlnZmAKhQUCGsEfn/teYb12RRyswJG
         Vth5J21MIELNL9vbHnoi14TFOQ82xtolAjxY2H3UVDLA2J5ZRGf0wjL8I2faYE3791+i
         TcYf/hVFPBBQ9iL/oSc0WDiqCCkho1Yw5KXltUglW57NOcyNqnOktpkkXGbnrrk9qim7
         k+gQ==
X-Gm-Message-State: AOJu0YwGWJin4J3cHaOVSJKFps91rwMvAkoeWFfprwQ+CnVKwJ9Up0jB
	u8LSkOy8IWin8TSc//xfnLh0yL/sTgH1Ts+xV6GNi/hXccrO5gBcNtZF5lgm4oQ=
X-Google-Smtp-Source: AGHT+IG+FJiR8GwWMRcVqRMlspmsP9IMRu8fB6JZlGWawVSImskZdZ+E8TXT701sjPwnXv2NeszQvQ==
X-Received: by 2002:a05:6a20:d043:b0:1b4:4568:4c40 with SMTP id adf61e73a8af0-1b445684d58mr7174790637.12.1717994062670;
        Sun, 09 Jun 2024 21:34:22 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2fe295cf5sm1894756a91.47.2024.06.09.21.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:34:21 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:34:15 -0700
Subject: [PATCH v2 2/4] riscv: Add vendor extensions to /proc/cpuinfo
MIME-Version: 1.0
Message-Id: <20240609-support_vendor_extensions-v2-2-9a43f1fdcbb9@rivosinc.com>
References: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
In-Reply-To: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994057; l=2560;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=jX1rj/5Eo6K4VCkcWXFPVGV22tyIjfGbooFelFlP1yQ=;
 b=ty36o27Fcnn+ri6LPLaSahNWqUaPMAyATVlOaPFfWk4YvgxmcebiM6fPO7dMnRQFBm0Zor7vR
 MZQSv2/3WpjDWKZA8mMPhVbkpLjRbKfToO0tycFohoJfn0nt1a5+pC2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_213423_917576_21B4CBD3 
X-CRM114-Status: GOOD (  12.51  )
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
