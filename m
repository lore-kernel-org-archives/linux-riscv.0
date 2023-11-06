Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029D8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 23:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aDGJo5M34o1yzI9JbpZj2ljfjlPM09yLfcD7N7OxfyA=; b=Vj658Fd80RReqf
	v1Ziyk7AD1VKFAYPRylEqn2wVSBR9VqnbC1/rwrfHaEY51LYkHqU92N5TnEiQGafeXfCTSfZ5+z14
	jaCWLMDaAQ0DOuBgpMLyNtmeWt16JjHzZbg1VcaXw6FiIqf9NS5z6wa2S6Mk7wI9Nbt3CIg0rTA3I
	Q6oQKJrffRRTrcddbgXp3L5y+IzjPskyA5XV8TcrjQf/Bjktbnuc57M++Z8pwLjskF3dIl6CtJK9e
	mimvAY7wb/DN72HNrshqrdvlGavIghFCqAAMYBR1q3AP6D+gNLzkheDOBs4yiRFRYIHajsUV+pErO
	Haz5KUiOuRkoB31D+ONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r08xb-0009Ne-1W;
	Mon, 06 Nov 2023 23:24:47 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r08xY-0009Mw-0h
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 23:24:45 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6ce2cf67be2so3167051a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 15:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699313083; x=1699917883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WkCaHfeixjvsbU9/HYvSI6qtTRbFXuR0gXBbnJPPGNQ=;
        b=lEFxeS6ouVNlcvpH1owcHCe+ZfafOismOXVPBd1bL6mC7qEhLmpMplDXSEyDeyn13c
         1yrt7BRHk6WOZ1I00pHFcpUuZQjS/VYx4HfmsZkpjL+shJ4/Xtu6O1CZ4sQ4kGL/tvmn
         6hqlLiIkvAUeO9MdMNk94PYH6RXeecOWoPStRYydHauCUpVKh8LvWISX+UU/Ye/LtkMy
         ZftKZZAsGryAcD/+2UZmbpGBF8kD0eOferGO3FDIRlu2lMjrIN3VA3U8JQBUNi3ln+Hb
         ayieQ5gJuuLR+IWAenQlZyIHP1lGGf8X7ZkeDUjPVni8/JEsaw2V9v5/CQ0jeJPAO52i
         jCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699313083; x=1699917883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkCaHfeixjvsbU9/HYvSI6qtTRbFXuR0gXBbnJPPGNQ=;
        b=t1ZTYfMcetib4fbMAsfhElKSvpCX8r7LAdTH58JFD/H7crPzKQVM4MNU/dL4wEGaYN
         JWp18kwbtYaAVUVKZ94lZgW6QKbBrJPOQPubIFhw8VPl7shgO3b4ubzTPm1kzs6U8HrB
         FcQ7m3M2IzYHiihJc+2jKcAPlNfN/ykvghfsqKgBhDkVm1AK1JslAbxyVch62EYCbxG5
         cwYLDQnAc6kqRV6rmQjQkvTqgjHeuyIcTOinpj7Tz6UgHbs/zGEccZlgtVQj761Fp3UB
         PXXuF6JyLqJQkFc3GygD3tbhUHWZRXKA9PDYKKs5ef0MncV39GWeEMXbZpalOK87PDfs
         RGYw==
X-Gm-Message-State: AOJu0YxkkS8qMUK+cpDEpucs5B3Dm7yNfhtW4w6FgaJBbqb93gnzHtVo
	O5GvbBxvICTLcfBaKThu/sFmUA==
X-Google-Smtp-Source: AGHT+IF8/og5dIycNzK8e9XK0cNUJwSPcyW+Gv0cddk13GTwXNbaarLhy1RvGC1vU82/UZD7JnneRQ==
X-Received: by 2002:a9d:6b8d:0:b0:6c6:50d0:1104 with SMTP id b13-20020a9d6b8d000000b006c650d01104mr32871637otq.27.1699313083089;
        Mon, 06 Nov 2023 15:24:43 -0800 (PST)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f2-20020a9d5e82000000b006d3161e612dsm1422773otl.30.2023.11.06.15.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 15:24:42 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Date: Mon,  6 Nov 2023 15:24:39 -0800
Message-Id: <20231106232439.3176268-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_152444_255103_B4058490 
X-CRM114-Status: GOOD (  20.08  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
extension info accurately per-hart in /proc/cpuinfo. We cannot change
the "isa:" line, as usermode may be relying on that line to show only
the common set of extensions supported across all harts. Add a new "hart
isa" line instead, which reports the true set of extensions for that
hart.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v6:
 - Documention changes (Andrew)
 - Comment fix

Changes in v5:
 - Documentation changes (only) (Conor)

Changes in v4:
 - Documentation: Made the underline match the text line (Conor)
 - Documentation: hanged "in question" to "being described" (Andrew)

Changes in v3:
 - Add some documentation (Conor)

Changes in v2:
 - Added new "hart isa" line rather than altering behavior of existing
   "isa" line (Conor, Palmer)

 Documentation/riscv/uabi.rst | 20 ++++++++++++++++++++
 arch/riscv/kernel/cpu.c      | 22 ++++++++++++++++++----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index 8960fac42c40..54d199dce78b 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -42,6 +42,26 @@ An example string following the order is::
 
    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
 
+"isa" and "hart isa" lines in /proc/cpuinfo
+-------------------------------------------
+
+The "isa" line in /proc/cpuinfo describes the lowest common denominator of
+RISC-V ISA extensions recognized by the kernel and implemented on all harts. The
+"hart isa" line, in contrast, describes the set of extensions recognized by the
+kernel on the particular hart being described, even if those extensions may not
+be present on all harts in the system.
+
+In both lines, the presence of an extension guarantees only that the hardware
+has the described capability. Additional kernel support or policy changes may be
+required before an extension's capability is fully usable by userspace programs.
+Similarly, for S-mode extensions, presence in one of these lines does not
+guarantee that the kernel is taking advantage of the extension, or that the
+feature will be visible in guest VMs managed by this kernel.
+
+Inversely, the absence of an extension in these lines does not necessarily mean
+the hardware does not support that feature. The running kernel may not recognize
+the extension, or may have deliberately removed it from the listing.
+
 Misaligned accesses
 -------------------
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c17dacb1141c..bcfc0c8dfd01 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -202,9 +202,8 @@ arch_initcall(riscv_cpuinfo_init);
 
 #ifdef CONFIG_PROC_FS
 
-static void print_isa(struct seq_file *f)
+static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
 {
-	seq_puts(f, "isa\t\t: ");
 
 	if (IS_ENABLED(CONFIG_32BIT))
 		seq_write(f, "rv32", 4);
@@ -212,7 +211,7 @@ static void print_isa(struct seq_file *f)
 		seq_write(f, "rv64", 4);
 
 	for (int i = 0; i < riscv_isa_ext_count; i++) {
-		if (!__riscv_isa_extension_available(NULL, riscv_isa_ext[i].id))
+		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
 			continue;
 
 		/* Only multi-letter extensions are split by underscores */
@@ -276,7 +275,15 @@ static int c_show(struct seq_file *m, void *v)
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
-	print_isa(m);
+
+	/*
+	 * For historical raisins, the isa: line is limited to the lowest common
+	 * denominator of extensions supported across all harts. A true list of
+	 * extensions supported on this hart is printed later in the hart isa:
+	 * line.
+	 */
+	seq_puts(m, "isa\t\t: ");
+	print_isa(m, NULL);
 	print_mmu(m);
 
 	if (acpi_disabled) {
@@ -292,6 +299,13 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
+
+	/*
+	 * Print the ISA extensions specific to this hart, which may show
+	 * additional extensions not present across all harts.
+	 */
+	seq_puts(m, "hart isa\t: ");
+	print_isa(m, hart_isa[cpu_id].isa);
 	seq_puts(m, "\n");
 
 	return 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
