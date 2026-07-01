Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED90AC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weoNXe6dOYV6N4VaAXMdtaiExi0fzRCqZhQxeS1Z7ZU=; b=icY0p2e0NnID2X
	dfz1K45XgPj3ebZePM2NHeO5YX+8veLf7c9Sn09uoR7Bb9bV4XosEC35wgW21CtHfh3Wr9zEiDRpW
	TT40TulBahZZ05foR1BXF5vsVqrre7+mKY+l/0+RAxPgDrm8r1zoZqrhmTSw3FfPHmuxEV3uICetJ
	eOpYlVR8p5Pm2eHGVudYbXtKoK/SnE1WqoyTCDC4YOrtuAhtlX2INJ9dXN9f9F89OvFtecduj4E++
	UxRaA5GksqBY1+eus2zc5fhGXeJPp8u/DY2eTqi6g48cL/Pj6Ue7azwMav/dKisPnILbQ5Fd4PKEX
	r2sob8pFimWymM+tYdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuTI-000000024hg-2NSJ;
	Wed, 01 Jul 2026 12:55:20 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuTG-000000024gb-1pgU
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:55:19 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8453427d3f4so251952b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910518; x=1783515318; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiBQQxNYM4uZUtFA87RPryKjgpX8pd16ygJCO2DXwWg=;
        b=i9O9LUE+fWsgspETXNrh8HqsTQixUGki+m/gE7sGPV14qbdb5biR5ylZn49DjAd29V
         086AATrucrwkA5AVtgHzqoN3N+q/nuoo8cJEk275f7vwl9kAABZDVHdF9HbWP5qLSOLS
         ayjtkTBZSm0XNiqtgq9ccmMMXy0x+oTnzBbFpoxRNh+BbeXAvTBer0iiok3lnakxVUcP
         XFU8pO2dnAqzKzeZVSpyWvr7MzNTg+lMDsox5JYttRovoEgCmFzUePDiPHmsEaEFMrwh
         a5KV66JdGwVUmLBeFSq/kda4If8sT9433tcFNrP2gitjGb/ywmyRbsZ6+THq10BIImfv
         7gzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910518; x=1783515318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiBQQxNYM4uZUtFA87RPryKjgpX8pd16ygJCO2DXwWg=;
        b=ddDGKjPKkm48GzN/ShvReI7KcsWhqpVjJXdyJHn67mrFpqw9/ROJR68mbSwXghPFZd
         3ceX8N463CWSh6+51eWriBnf26dfBp+EH0L3HTP7O0S/fpbTu6gvtaUOlRtkpL0gvT7w
         WaIH/nVjqXZVm5RpwYbPoVhTYu2mD4krYLxy74ulFmUvtv2iRdm4n3SkWvv4iz1fOlA3
         nWJhR7iiw0C47C6c94bGAB2CIKy7edVxIUjaeFcUtumHfJq5djy9XULfytdmVJFvCF75
         wRwX9UCO6/OGixeweWk2fxZOh7I/QHYbKfc2GuVPEz1SvfGDFhXTcv026E74MSW+MtNP
         7E7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrcmmr9Tt/TqwiuXFHU0Ygj+SuMp6NHgWhwxccndjh5avN1yP7ZtOOto+ym5dU/DsrGPrNpp0xp64c0Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx238qCSQtuYIlHe+YCR6JVAhpftrgFRvhc3ArTpAIWPBqcMeMK
	Ht6qpo+nQARxrnSSljIS9N/R9fPImeFCNzuMUcswQMSXx5T8UopZ76PM
X-Gm-Gg: AfdE7clBYoMBRNYFSSDmpaPGg0p9IKC9pcZYGsy7Eg7ydo5JnxT9E1XVbBuc1o4QxAd
	ZtZOGFhPyfCg8RCCDV30lsbFWFb4O9QbrTWXJPzK5GV0m/sgrpyKziRxHVvh8g4Yj5duGxfvxWC
	1fZlxPeMCYJUdW7a/o9jBVhi5DzxBJXw0fO80xTOtq0NCBdL6DVlarraoPcShhzhEwlif/VG9vQ
	Djc52LuMpOJ07DS41S/aNbteCNsTMTPmlGb/Ji/OetCd9utN3u1CrbxDdxhtL1A6fUCBPHd27AF
	/NmSosvbKk7II5iyvMq47/K/QjoUcpSobje0erzFjU8PILyemwpPFdTWz9c20RRtgc8cQWEtnXE
	BO+xAOzYd5inAQmDaqiIXLaB2GxTu+GU3NrD87e6pR0BtbG1bWr8zsOEfKpkpo46KToDqLuxozE
	ekJN/TuditsSR/A3oj4jmeMEx+nUd31+A=
X-Received: by 2002:a05:6a00:3d0f:b0:846:7fb0:4ca2 with SMTP id d2e1a72fcca58-847c0ad5539mr1299225b3a.61.1782910517479;
        Wed, 01 Jul 2026 05:55:17 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:55:17 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:29 -0400
Subject: [PATCH v5 16/17] riscv: cpu: Output isa bases lines in cpuinfo
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-16-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=AZMqGWE/1kDk6APgiFn067C7/pSKrIkfc/qqQaj5N6U=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3vZ0bcszqXWzr7H3vl/xnun9rDRel9u3b78RzeZ9K
 Pl8q/7BjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZgImz4jw8/3Bw6vvM7R6vxn
 zpxcu+Ste19xJK+qf7zmv0FxXf+P4GJGhv2zd2Q0h4gHqRl26a6cfqCR0Ynj2U9pH0c7rRNzT/v
 EcgMA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_055518_520078_099BBFF2 
X-CRM114-Status: GOOD (  13.16  )
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

The "isa" line in /proc/cpuinfo lists a hart's extensions as
concatenated string, but not which profile base it satisfies. Add two
lines that report them directly:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on:

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  ...
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Simplified the commit message.
v4: No change.
v3: No change.
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd1..31e2857dcdcf1 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (test_bit(i, isa_bases))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, riscv_isa_bases);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
