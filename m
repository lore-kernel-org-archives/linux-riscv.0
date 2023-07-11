Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644C6EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 20:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1DSLHr8qmYT4mhNMXZXGKT8x1fJZUUUneHYHu62JYLQ=; b=RnziNZJMs0jN1P
	qP6n26Vra2MV04A8oS2GYNJ6PDIGzyaYPqFmckVMUC4vgiZzN+5Sh/Te5jx/Rs8/75aTvOyrtGinX
	FfTvb2GWVl3kWkqvkAiXcVqHhrSRMnxKx8DBSUgsjxkwJz4EC43Z2U5//fn7ocQfPhElWNgFMV2J1
	F1LXnwJ89o8DsD3++4cp7/oujAmqq5oru9qBgkDXN1ee1zuWc7zwF7CKn2oesDF4ugVgyzKB6WiBJ
	8kYNnTw+Xoed9unZ2MI/7yCjjLeX5m5Dl9+22PEJ7DojxgeyGfPe1e23T1dLPeqDVUdNg+QB1rPgR
	MQicgz8wdAxG8iAKzHxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJJon-00FpgR-1l;
	Tue, 11 Jul 2023 20:18:41 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJJoj-00Fpfx-2u
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 20:18:40 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-668704a5b5bso5443310b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 13:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689106714; x=1691698714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AHQ6nFJYzOLsxp4Cvh6Qt2yjVHqJxutm7vOmfrcNDX8=;
        b=gU+6fKWqEDBFi3CMOReEhuawOezpwYZAZX2TlhxmqHfIyioJXL9zMXhX0oCoh138sV
         t7XKc9BPuCaf/e1Rz9Mp2eM3CHX6gct6PNoZcWqFRFFbvu1FVvPCYgrzovVtk1PdAh5R
         kjulHgyJApP6XV36S5thBRxGmtEJcR6oogkDyr4puqRV7n4xThnDwZ7HwrCRc97Aj+pd
         X3s1YxuDDTAlF4Www/ONJF9cI2KHk6wbv0upXda9R0bGOg/9vKOAReqU4K7IXySqXgdA
         Ua+WGYcaYhvAC5bj6PsD7qLSYQZZkIbhtB6NHaBp7Bbna9au5mwq+fQ1gw2hRGdNg6c0
         M1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689106714; x=1691698714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHQ6nFJYzOLsxp4Cvh6Qt2yjVHqJxutm7vOmfrcNDX8=;
        b=bwVy/1ZZfxr0RSouB1N8XrVsIgRWGFzabPncg77qJI/PbpF7fPnoEuBKLRiBZz8YG/
         K6KsxjC2divPhynMeAzlTsBhBjdh8AmTCOlwbBquFuf5HuqLOJz3DiAgST+5vvo6eEkd
         aKmpEIuvJbalbnWgX/bDOEoEjAzIXDw1/Nj+2SZH97btyetzfQ2c/3z5mTHWNrqeV3Zs
         B6LJzM+EJCPknQkwWqdHVU0CdMk3DEgBw684w6R0382d8BcljgbbcT97P1BxdWi4x+jA
         du6KXmYPhYA9Jf7PuJ87xGQRqtRJy7Zr6FFIR9pu+yap4mz9Bfrilq4ykA6ugA9LZMgX
         9qpg==
X-Gm-Message-State: ABy/qLZxo3VTM0BT6s/+/AoKConNEBWeXN3wXmCjeUsp11QUIcpWrFKH
	skWA//UcBzWYdU+HysqNRmgnpQ==
X-Google-Smtp-Source: APBJJlGW/76QXHpB92BCVxf9S/cFQibKuZxpLbyG6qJ+wjnJ9KEBPHPGtuTt+nGFTDquZLIOM4dpXQ==
X-Received: by 2002:a05:6a00:2d84:b0:677:cda3:2222 with SMTP id fb4-20020a056a002d8400b00677cda32222mr18507941pfb.14.1689106714103;
        Tue, 11 Jul 2023 13:18:34 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id j6-20020aa783c6000000b0063a04905379sm2100623pfn.137.2023.07.11.13.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 13:18:33 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Date: Tue, 11 Jul 2023 13:18:30 -0700
Message-Id: <20230711201831.2695097-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_131838_155479_6F8D255A 
X-CRM114-Status: GOOD (  18.44  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
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
hart. This matches what is returned in riscv_hwprobe() when querying a
given hart.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v4:
 - Documentation: Made the underline match the text line (Conor)
 - Documentation: hanged "in question" to "being described" (Andrew)

Changes in v3:
 - Add some documentation (Conor)

Changes in v2:
 - Added new "hart isa" line rather than altering behavior of existing
   "isa" line (Conor, Palmer)


I based this series on top of Conor's riscv-extensions-strings branch
from July 3rd, since otherwise this change gets hopelessly entangled
with that series.

---
 Documentation/riscv/uabi.rst | 10 ++++++++++
 arch/riscv/kernel/cpu.c      | 22 ++++++++++++++++++----
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index 8960fac42c40..afdda580e5a2 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -42,6 +42,16 @@ An example string following the order is::
 
    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
 
+"isa" vs "hart isa" lines in /proc/cpuinfo
+------------------------------------------
+
+The "isa" line in /proc/cpuinfo describes the lowest common denominator of
+RISC-V ISA extensions understood by the kernel and implemented on all harts. The
+"hart isa" line, in contrast, describes the set of extensions understood by the
+kernel on the particular hart being described, even if those extensions may not
+be present on all harts in the system. The "hart isa" line is consistent with
+what's returned by __riscv_hwprobe() when querying for that specific CPU.
+
 Misaligned accesses
 -------------------
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1acf3679600d..6264b7b94945 100644
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
