Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB38EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 19:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RtMQu34tnTQdgYsorQgt4tDXwFsCXb//EUS8BvyBmGI=; b=sDVuHmdgtTqBhN
	JVPORPEsO31kvW5hSB6jY+YVUEnMhpttV3dKNYIQEnWb4Qt8vkFUEvvtXWmszeWxoVCEgPVAn1GQ9
	8qpa5VfyNB0zLmf6NmAhJVQElLyAyY8V5swSup7bqbwurRyYoVC9rngVMR15sEKCwzFA3T6By7c3m
	kXQgXiRxOJXz9VeOXBs1/BlbR67NTALtcA2TFSHWtCPUv555iv4yIT4iuSzdLC1avg0tXplPBoo5m
	FpY4JiGRBqLIjdt1FRHtf5FNvCu+U4sZbr1J7sKFb2NynzHB/YBmUYFzp4UEE/krAtPk8J9N27DzF
	W5pk42eAcj6+H4IO5pKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIwUo-00CYGi-0H;
	Mon, 10 Jul 2023 19:24:30 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIwUl-00CYFl-22
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 19:24:29 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-55bac17b442so3734625a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 12:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689017065; x=1691609065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVU5xkkFrBHK9KN4xCmrxkM+F8/EoTyfyWL/2CP+3j0=;
        b=HASFVZl23FPMCm79tXoegRb1RNFILB9pF0aVoVMK8x4Sxj+bbrS70w4s+kI778hKvo
         rgVeXgf8djTPdQwty4wprwlEFrb3lhdGd/5Z7XWefuGrcp4oEeSRwKxzc9ZpwZ1lBEsY
         41h1Q/oXnJCJAbhIepxk74dE+5mMkkSoVoHFg5jAw8QI079ME/C5vdykHYakRi4fPbX7
         3z65PNk21m2ZjuB+sgjrjVcWtlZVtvMv5FD9QfkKTGY+nNIP7c5PDj1xs+OsZf+CVB6i
         ZnJ7q30xy/5dw0omQTP7ZNjTUSEvmHUElLvT2Ns8khZyXU7Z3rqTKEwNO39X4vCDI3Ir
         hDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689017065; x=1691609065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVU5xkkFrBHK9KN4xCmrxkM+F8/EoTyfyWL/2CP+3j0=;
        b=KrU6CIvylokEMRHxCyiesNdRqpIInvPb5d5vt4wvk8kccx6B/IlASTMOV/2+NeWVzP
         KhhkQNNzNtOkCzOwIc7/1XzTGj2JjxjBWkjgYLdju1J0h2RutPRbK5hAUedYyV9ZP5JL
         uvNAI+wLTNJie3/EY8MDyXE6Y+Wt750gOB/mhpbV5DFXh1ZXOEoJEnjySSJLbo/pGNs9
         SDdOcmm0NZS5yOIzOmYhH961Py9qrSeIVzPTGeZv0mWDtgymDUhzYAkyYRHOgPVLNbgo
         CSTGNiT1mWEMiApRLSHp9cVdWdw90zaMj2gZTKRI/Qsgbzcy8wNeg2Tj5arc5tqku6Pu
         kDCA==
X-Gm-Message-State: ABy/qLa6HXu8dZi1kMsVj3qBdpmZCCpvdkllMZn9zvd/Yj5jAUhk7o35
	Cuyw2Nk2rLQNUm6Z0YrD3heQVg==
X-Google-Smtp-Source: APBJJlElX3ouS/7FElxVVpI095f8HqlJxpa1dRsjo4z1LRMa0ZScCGPnPQjxkZlRuLEsux42YF/jSw==
X-Received: by 2002:a17:90a:3e08:b0:25b:e85a:e9fe with SMTP id j8-20020a17090a3e0800b0025be85ae9femr12935954pjc.27.1689017064856;
        Mon, 10 Jul 2023 12:24:24 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090a74c900b00263ba6a248bsm6646981pjl.1.2023.07.10.12.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 12:24:24 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Date: Mon, 10 Jul 2023 12:24:13 -0700
Message-Id: <20230710192413.2089085-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_122427_865219_77FCD62D 
X-CRM114-Status: GOOD (  18.35  )
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
index 8960fac42c40..4f462f5b168c 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -42,6 +42,16 @@ An example string following the order is::
 
    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
 
+"isa" vs "hart isa" lines in /proc/cpuinfo
+-----------------------------------------
+
+The "isa" line in /proc/cpuinfo describes the lowest common denominator of
+RISC-V ISA extensions understood by the kernel and implemented on all harts. The
+"hart isa" line, in contrast, describes the set of extensions understood by the
+kernel on the particular hart in question, even if those extensions may not be
+present on all harts in the system. The "hart isa" line is consistent with
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
