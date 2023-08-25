Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34D4C83F06
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 23:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tcf6Ia3DU31Oj8MpF1ZE0K66rmQrLOU7zFJavzYeXX8=; b=L4D9n6g6K3X2LP
	Ckk/+BKaEXfZO6QY60Bv2ijQqx5MBE+15jrChS43Htskpj7mPyAYHv1C234kQyM/EQzhOe0dpdfNW
	Tp7kybAFYwRQ/y+hItbUl43QnZajtybHITV5tDy4y064zPEE8OpqNld/RtROH6Ttdrm33epmW2vec
	PfkxiEejn5Tm44sy3CEd49RBgulGW4wgCcLbnhNXI+ovr4RxHtnWGBBYKmsXc0iQz6CWk//FDzmOj
	wRYag9HkT4yF/vjLYLCOhHn4ksEUrmkrZFAKroL5xxCx9CMWO3fgcoJpOqDsd3cXyWV8bdx+o200s
	wNcmVyqT+mdFvZBrS1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZfy7-006A7q-2O;
	Fri, 25 Aug 2023 23:11:55 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZfy4-006A7X-1E
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 23:11:54 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68bed8de5b9so1162290b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 16:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693005111; x=1693609911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ggPOOHH589hYjv6gdFVOq0aacdbX5IKUkHaLzkHlaY=;
        b=QOZtL/y5zENYSSlmUxwLeSqpz5kI8kEAvVttdxBiqhATFMZi1X5kzSngCI+kn/X/6u
         LfvF39rfgIQ5MLNHv9pYrUGDAHJxMTNSZTXagt8wRFV1egOngicf5Lhny0TrM40wL7Fh
         sXK9aoyhMhrLHSeC5g2E7WB/mRBFuLoRLoq+fAsBDEpl1eWCbZ+ib9KHy+fbJqcbq3/X
         5XMHGh/7KXdiSRnl+ZfldFts5QzYaW4ViMDGEKOhdAfiGB87m/VbtPcfMa7Z+q3L9YWN
         ElzMdwiSX5ujwsnPG6OkrwZD2KDN2WqvoUZrnj7K7OxFJnlu6xWTwvzDl9QQf9BNz+JD
         HZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693005111; x=1693609911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ggPOOHH589hYjv6gdFVOq0aacdbX5IKUkHaLzkHlaY=;
        b=FX0q0tOxRrqzrAktq2mb+aFEGGX8B9DSU6YsBd5L2YPPuLYDh9Vy9PVNzBuTHDM3xZ
         KqKbCOFZ/RxPrWwGQ4NGjkIMIwR+po/gKILpEsfMbbZqftqDcB2xyQ7ocrnB0JlZe5Iz
         /Mnp4/kbORmaD73d4GQtTKQTGr84ugV61JTVB/0y5nZM4PLWmR9UvTwd+lOOO1wbf4B+
         XTdewN623mcgsQLO2J73qBLlg1nSBCOhNFo9/06QptsiObDgYauywX6e1i7e6l0HPQgv
         or49TdYE+TUiOPZayZKgv85+gvMOOW28QbscS+48+uzFAYict/9ZGMnNi+Zhf6+fg/PB
         P8Kg==
X-Gm-Message-State: AOJu0YxG3kCStxPPUnFpANKH0acC9DIWChrwY8+dg9ipI2BOWGJ6h16P
	OSLngBNigbCS/TV1xAfpI4bD3w==
X-Google-Smtp-Source: AGHT+IGaR7FGnDMNDLYgHhWG0XAuBfJDoKxj8hXBc/H8Me1KQj0GH7Oh42Tzr3U8HePmfacS6h2lYw==
X-Received: by 2002:a05:6a21:3393:b0:140:fab7:4d14 with SMTP id yy19-20020a056a21339300b00140fab74d14mr21944630pzb.15.1693005111578;
        Fri, 25 Aug 2023 16:11:51 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e13-20020a17090301cd00b001a98f844e60sm456534plh.263.2023.08.25.16.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 16:11:51 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Date: Fri, 25 Aug 2023 16:11:38 -0700
Message-Id: <20230825231139.1145522-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_161152_444949_3C8B272B 
X-CRM114-Status: GOOD (  18.42  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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

 Documentation/riscv/uabi.rst | 12 ++++++++++++
 arch/riscv/kernel/cpu.c      | 22 ++++++++++++++++++----
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index 8960fac42c40..a46017f57db2 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -42,6 +42,18 @@ An example string following the order is::
 
    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
 
+"isa" vs "hart isa" lines in /proc/cpuinfo
+------------------------------------------
+
+The "isa" line in /proc/cpuinfo describes the lowest common denominator of
+RISC-V ISA extensions recognized by the kernel and implemented on all harts. The
+"hart isa" line, in contrast, describes the set of extensions recognized by the
+kernel on the particular hart being described, even if those extensions may not
+be present on all harts in the system. In both cases, the presence of a feature
+in these lines guarantees only that the hardware has the described capability.
+Additional kernel support or policy control changes may be required before a
+feature is fully usable by userspace programs.
+
 Misaligned accesses
 -------------------
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 7b793c4321bb..100fb382b450 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -197,9 +197,8 @@ arch_initcall(riscv_cpuinfo_init);
 
 #ifdef CONFIG_PROC_FS
 
-static void print_isa(struct seq_file *f)
+static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
 {
-	seq_puts(f, "isa\t\t: ");
 
 	if (IS_ENABLED(CONFIG_32BIT))
 		seq_write(f, "rv32", 4);
@@ -207,7 +206,7 @@ static void print_isa(struct seq_file *f)
 		seq_write(f, "rv64", 4);
 
 	for (int i = 0; i < riscv_isa_ext_count; i++) {
-		if (!__riscv_isa_extension_available(NULL, riscv_isa_ext[i].id))
+		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
 			continue;
 
 		/* Only multi-letter extensions are split by underscores */
@@ -271,7 +270,15 @@ static int c_show(struct seq_file *m, void *v)
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
-	print_isa(m);
+
+	/*
+	 * For historical raisins, the isa: line is limited to the lowest common
+	 * denominator of extensions supported across all harts. A true list of
+	 * extensions supported on this hart is printed later in the hart_isa:
+	 * line.
+	 */
+	seq_puts(m, "isa\t\t: ");
+	print_isa(m, NULL);
 	print_mmu(m);
 
 	if (acpi_disabled) {
@@ -287,6 +294,13 @@ static int c_show(struct seq_file *m, void *v)
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
