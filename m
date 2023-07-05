Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82987EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mgwWa/I8GWVcLcqAB/GM2ka0dGAbGkpX5894isTb8R4=; b=sLXjAN3CrxR4Wc
	1Fi9QvUwLP6g/qaZ9z374rSYyjb9P7FDTn3WbIzv7t46PUOL1jGVZifmmCWFJpX7ON0PIqESTB6Ap
	PitrB+uzXvqG/kAGXDwpfCxd1yyvZFrgIV1XyeqAVWnidqw6Ig1Db0d0VJZGBUOmR0CzGN1LohC71
	ih5Cu0QcAtKTKDwQsKV5G0rId6XnRJa1Pn+xH1bQ0u/UpgcxBGidj1VCWUoZUjlUuphmbm7REb56O
	yUL151qkxEuJDmQzV3LJAfZZVGMtXAXRcnBJGNdAurwfLzZYzINb1FyRwkQrt+nxCPoS0pb7qhLg/
	5v6S4y0BUAGjJ7b6qYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH6KF-00GcAN-13;
	Wed, 05 Jul 2023 17:29:59 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH6KB-00Gc8O-2m
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 17:29:57 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666e6541c98so5522799b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 10:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688578193; x=1691170193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=21WgRYzk/FRZzyhPurFkJWRpl393yD1S4pYgQXdWIKY=;
        b=pDhW1muSnAlTyX2Z/SLj6E1+r/W6uepKcIroiGfSIOcT51P/RT7lujWK1VlHHTktOq
         TQ8oM+fQ6W4ituAQx2s48UNCh0krswk0E9sWzS7F4Ckrk4dJyqBHP6EsNqMpjLf8bf9p
         lV6/weT2vqENFEOJ2GCRRzqWkcWvId71QuOiyhJYPwfOYdeBQA6WbRdR8OXUFF2GVkXx
         3DjGYhBMbz7UA25iBepU8Ao+zB70V4gQFxlmGCdLz32FbAo0WXjKl2dTCF3LD/nAXW3r
         xaa1CmnZuV9vbUEsKfqF8j+n81vFgShCEuZtXpXHC7Ce4MblMnSYFw4TEIl6+maw/RiB
         J0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688578193; x=1691170193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21WgRYzk/FRZzyhPurFkJWRpl393yD1S4pYgQXdWIKY=;
        b=NSdm9Lbf0zTxSO6UO+UVrYMGViS4IDKwYzOUVKZq4KQ9l6aWfe4tz/VHk7q4MySBzU
         GOkXXtjKncBqXpwIhgL9hMD3PRTQCHRZjzAa1hnFinMOBXR3qhtPWxP/dE/7jjhZM3ou
         YHbMv9mjuPY5+hoUG8t44TArIBw3bVPa+XpCwUWUpus9ZYMdnhFgBSpOU6m1LVUVdniU
         jDaYyepXNqq3J6d3REzIzcb96OtxjpbY8hUbrWuXjxqiBScwRklpjN2RohxlIfkNIeg5
         kTVuBzPs0lVnfm+wZ2sTO1KZuVI9DvPKOg59t/CnCiLBXh168FV3R7cKT8aGqu+tFG87
         ed4g==
X-Gm-Message-State: ABy/qLbzcr/8HtW8MIWowjtoHBhArbPJ7yS+3CtFi12djfZTw1f7rQLy
	iEZiROl7u+emVEnaVLeociZedA==
X-Google-Smtp-Source: APBJJlE+cUUqf4PZsftRzFUhRQhAQdKZ66CaWMKscoxCnAdrmnh4xbX2rF0IZVJYDMbIvyaf6RKciQ==
X-Received: by 2002:a05:6a00:1823:b0:67e:18c6:d2c6 with SMTP id y35-20020a056a00182300b0067e18c6d2c6mr22812326pfa.5.1688578192636;
        Wed, 05 Jul 2023 10:29:52 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t15-20020a62ea0f000000b0068288aaf23esm5719930pfh.100.2023.07.05.10.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 10:29:52 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Date: Wed,  5 Jul 2023 10:29:31 -0700
Message-Id: <20230705172931.1099183-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_102956_117150_B008FD0C 
X-CRM114-Status: GOOD (  18.74  )
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
extension info accurately per-hart in /proc/cpuinfo. We cannot change
the "isa:" line, as usermode may be relying on that line to show only
the common set of extensions supported across all harts. Add a new "hart
isa" line instead, which reports the true set of extensions for that
hart. This matches what is returned in riscv_hwprobe() when querying a
given hart.

Signed-off-by: Evan Green <evan@rivosinc.com>

---

Changes in v2:
 - Added new "hart isa" line rather than altering behavior of existing
   "isa" line (Conor, Palmer)


I based this series on top of Conor's riscv-extensions-strings branch
from July 3rd, since otherwise this change gets hopelessly entangled
with that series.

I was unsure if I could snuggle the new "hart isa" line in just below
"isa". Aesthetically it would be quite pleasing, but it runs the risk of
breaking brittle usermode parsers that are assuming a specific line
order. So I put it at the end.

---
 arch/riscv/kernel/cpu.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

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
