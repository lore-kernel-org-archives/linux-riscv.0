Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00191C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 22:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tM3Kgq+Z5RsDl1DIS8hO341cNsqy1eE2pdtxcS8jogM=; b=CYNTLAk1ELWm7x
	oEU+jLy/FoOmiDkOPVZ+Pbn5zrD5VZSPE8gCvUnJ9lHbemYfplNVp7DHEeT18Efr975uTMYp4pkBW
	17aNlEsVep9fqDaNY25xkVGhBqLnoz9QGUEXVy2QAXzrP73QVpbRL/pGxMopXt+8hrWMVWiPJZ9js
	toCGb90Y0X7WvOGikJPQScG+QpBVJFHP5wopbrDC3FbhqBOL2SW4ovOJ57apj5d5f99nbs1OnrX3A
	kV4PqZq2hqg2UBju9PBEGE+IflRW2i6rQUkgrojng6j6lkw/44UcbIkMGGBV7TrVcPyiOcGAxn7dK
	IHgf7cSb+2MFTQ6gVj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCpCH-004kZt-07;
	Fri, 23 Jun 2023 22:24:05 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCpCE-004kZI-0m
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 22:24:03 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5577900c06bso637841a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 15:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687559041; x=1690151041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2T74NvB61j3v2x3seml7lOG7zGtTOHQZiKI9MSy1E1w=;
        b=2EFwKpEpn1GuiCAmqPCRobOJDLmPT0lTU5+mX/qqokC8SaZkni1sEd6wjT1x8qKcRY
         dNT0eYjJCgXS/Q/dR3chEQTYwi4xFRQJbu5blR4pzfE3h6HZPLkY4jlTRHuF3pyF7lWp
         4Zn3U4H7KcZy5oRilvTBMSFAHNsEwnk9XJAUccADwRq0dFw1AqHMlUoXkddAv025GINS
         8mY0ueJmqA5CxgM7M71zf6Oj6uKQj1WmH72AgwMqxEwrePfKsVOYBPJApmjFeatj6s4J
         YPAA6nyMGs2zJqY3GgSPTNUIce+PgAOwH839GsTPnttAOCmSHoxNSB/3q7IY70UxqN6/
         wCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687559041; x=1690151041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2T74NvB61j3v2x3seml7lOG7zGtTOHQZiKI9MSy1E1w=;
        b=lFIclauQlIeVz3JCHcMWucY+pPT7UAWzizI2pHtjt57H5AC2t8FfnxlZlXOVVVf4+D
         lSYHpdPR9JCzBfKhZnGjA6gjn8SjeZsxbJij8J/JBGdeWIxcyvVTtgX0WjfF80bxegFH
         5CWD/jLwdo55oxATXC7lhG1s7bZXbpbVQpkjpYtyYrZNVoUiygd7JYHbmE2crazhU2zf
         6p6vNEIYjwi7wXqZUe6m+d2m+BAiKgPAypbkDYk7X+lJIPX++fmD0ivoCPSzgB2wYe2Q
         3Gk1rYzDkdq8MFHVwWGWMTWQ0ntrvIL1rW8iCOPN/De4NuG/dSuBR7RAds11SngBeZcs
         0Rjw==
X-Gm-Message-State: AC+VfDx5Sc8fzAOGPVkWOqR8PswES8rZv/37EowTSovrIomluGTYfba+
	jNuCRkGu2rL0i0Ty/somTMOwjQ==
X-Google-Smtp-Source: ACHHUZ7h6vGDPAtA6v9YZudL2WUx8yi3iZ4W2PvpdY7L2JNMgMAhH95t/BMWZcJwI+1tYmX35sWHJQ==
X-Received: by 2002:a05:6a21:3293:b0:10a:ee1b:fdc4 with SMTP id yt19-20020a056a21329300b0010aee1bfdc4mr28198131pzb.47.1687559041720;
        Fri, 23 Jun 2023 15:24:01 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id m7-20020aa78a07000000b0063f1a1e3003sm19429pfa.166.2023.06.23.15.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 15:24:01 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Date: Fri, 23 Jun 2023 15:23:53 -0700
Message-Id: <20230623222353.3742384-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_152402_286618_053F28A1 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In /proc/cpuinfo, most of the information we show for each processor is
specific to that hart: marchid, mvendorid, mimpid, processor, hart,
compatible, and the mmu size. But the ISA string gets filtered through a
lowest common denominator mask, so that if one CPU is missing an ISA
extension, no CPUs will show it.

Now that we track the ISA extensions for each hart, let's report ISA
extension info accurately per-hart in /proc/cpuinfo.

Signed-off-by: Evan Green <evan@rivosinc.com>

---

 arch/riscv/kernel/cpu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..7bb386f94f01 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -226,7 +226,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
-static void print_isa_ext(struct seq_file *f)
+static void print_isa_ext(struct seq_file *f, unsigned long cpu)
 {
 	struct riscv_isa_ext_data *edata;
 	int i = 0, arr_sz;
@@ -239,7 +239,8 @@ static void print_isa_ext(struct seq_file *f)
 
 	for (i = 0; i <= arr_sz; i++) {
 		edata = &isa_ext_arr[i];
-		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
+		if (!__riscv_isa_extension_available(hart_isa[cpu].isa,
+						     edata->isa_ext_id))
 			continue;
 		seq_printf(f, "_%s", edata->uprop);
 	}
@@ -253,7 +254,7 @@ static void print_isa_ext(struct seq_file *f)
  */
 static const char base_riscv_exts[13] = "imafdqcbkjpvh";
 
-static void print_isa(struct seq_file *f, const char *isa)
+static void print_isa(struct seq_file *f, const char *isa, unsigned long cpu)
 {
 	int i;
 
@@ -261,11 +262,12 @@ static void print_isa(struct seq_file *f, const char *isa)
 	/* Print the rv[64/32] part */
 	seq_write(f, isa, 4);
 	for (i = 0; i < sizeof(base_riscv_exts); i++) {
-		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
+		if (__riscv_isa_extension_available(hart_isa[cpu].isa,
+						    base_riscv_exts[i] - 'a'))
 			/* Print only enabled the base ISA extensions */
 			seq_write(f, &base_riscv_exts[i], 1);
 	}
-	print_isa_ext(f);
+	print_isa_ext(f, cpu);
 	seq_puts(f, "\n");
 }
 
@@ -324,7 +326,7 @@ static int c_show(struct seq_file *m, void *v)
 	if (acpi_disabled) {
 		node = of_get_cpu_node(cpu_id, NULL);
 		if (!of_property_read_string(node, "riscv,isa", &isa))
-			print_isa(m, isa);
+			print_isa(m, isa, cpu_id);
 
 		print_mmu(m);
 		if (!of_property_read_string(node, "compatible", &compat) &&
@@ -334,7 +336,7 @@ static int c_show(struct seq_file *m, void *v)
 		of_node_put(node);
 	} else {
 		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
-			print_isa(m, isa);
+			print_isa(m, isa, cpu_id);
 
 		print_mmu(m);
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
