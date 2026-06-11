Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADF4CD98C7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BL2qW3dtaPIIKxo1CKYYACNvZbQ9OY+7qugJyPhEqog=; b=ZqfdSYgQaXo1nJ
	4hgTUa7ggvT0tikAH7c5sFlI7oqg/fRcWrTJp5GCer7nwKoejqkGd99lzlr45eMZIekgQLQYoUfNC
	Luo+sm9mIt9AQV+9v2DJaSnEG18ZkMD2WTCx7UbW7WwRPfwIjZxW0LpWpuNDdDRB0rWwM95GB5tw6
	2aFneogy8agRFgPhT6q9gwkMGNnbkhkBQlsbMgEmsWSGvS2eB/wDm/LvKDLzk0chCq6/+bB6+bFpO
	2+6JE8ZiZ/nHTKw713Sq4IrwJ8JEDQfplY0/6QIU/GOGXVssZ1oyQgpLdbV98SQyIXM5y9GJXdZW4
	Gjpp4DVzIe2h8bI37WPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXloG-0000000A1nI-2XcK;
	Thu, 11 Jun 2026 20:15:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXloF-0000000A1lg-1TEL
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Jun 2026 20:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=m265EV302HRo7Gs5HUB3XDJdYi9da1UqwB9AyAJDJRw=; b=W/a7ToFUQOxB2we7lWbCVvx7dR
	XDSj33TDiVgscuRg+NXd92pDBHKmdTIA8wmVgYbeU4YH+qCupuSqdcdMAksYF/pAQm71ddg9WBniK
	EZfEG8Q48d0G071eLN1DUduft1I9i5JJ7ERUF+cu8dnicwuGZwSUvcnyDYfEwMAC55/C36+4oZj04
	s2PdC3INdWJjReDDNNDY1Nm8fqL75dWHoVAgKvTt1P/Wy9rTRSAjM3kaKXQRM6fPH83k1IGzxutog
	ZV6SDj9fEKI8FwscX4fMQ8/d/QL77YvzFBt/BX9nNOHKyCAY+kKynjLSsVsxWzzGVPDD3GtYl92Z/
	EgaiRxzA==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXlo1-00000005dpH-2AEr
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:15:21 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso236520a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208911; x=1781813711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m265EV302HRo7Gs5HUB3XDJdYi9da1UqwB9AyAJDJRw=;
        b=qwotzUe1YlAPhGtZnwQkArJ92X0WtgquuEgJyhTpCqPqzxglxutM0fjYOemhuUsfdD
         QHByjRMkwJOHGHZsN42sELIXQg1CA1W8n2YkuXUNuNTKIVHokNw9847I/9SL9QJx/9kI
         0g/aMS0IGJ/Y/XJCHktf184X3q+P/R4JLrGYhjZAGz2VL1qi3JoHUPQVDsgptaLcnOiJ
         Scearjk9y0Kj4O6srGwsuM4toBcje4PKMnwoW+svnha01X+gwJTFzVPNPYife2jQfaFO
         z0iITRyX/yRbJkOxKk+13+6usrAam6+2JzBmgG8Z8XU1wbR+qk8JJVUkfQprMQ1LchMW
         1kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208911; x=1781813711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m265EV302HRo7Gs5HUB3XDJdYi9da1UqwB9AyAJDJRw=;
        b=I1UcR+bKx7Ag7U71p5+jX+uv/5aap+ETwnpaxTNrsTjtEW60G4qVOIqvUQHQgZwu3Y
         4qunL+bWtYst26PlnlDMJoPqiQUoAFHWhMrPEDEABawvqaS+ZHuoz2dTHbxHgwPBvnxj
         UhB8FlRmUpWU3DrDeDgJSaJkS9hrHnOE4YdtfHGuDmyWOC/iHIqb70wGyl0pSuBMnv+t
         PQQh1/JMuqC/Q1/FFvZ+eAldTEUkOhkiBQek5CVkMAvQsrI7A5IZtsacCvL+QumXkMjx
         qYyMt1hqtTzZUSSovPSeHa2TrgTHSgHjFMknk630EdJBmpA1OTgG7hboK1yfpFrUKizn
         QFSw==
X-Forwarded-Encrypted: i=1; AFNElJ/QXWOIKY3QfTXila8uFv1aL4gMwWBR/svC2u9WqaY3iUXPJAhs27fqw1Drxeu6YBtVev11nnGfXm+VPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjsf6g0pBf0+Pb7cppu7/6O1D6fdcnt8OnifP7RnuMS27Sthre
	RVy0s8ubgubFO8Q4xRU3WCaDDhGrFADwBOa7Ij2qE6Jfl2hfGs8FIa0U
X-Gm-Gg: Acq92OEymIRweF7AledwOVxyJzm4rhWRwFMkPxlaYO11OT0n7TKMtsGhhgPM6tPh7ar
	fVoyby0AwhU2pgiceLutRgW0y5T5Zju2MrwXlFW6g+qSRsGMXRPAqGd0BxncypKJ3HqZOYHtMWL
	qwzA28ngkRqjdLJGPWJytGdCIFb1UA4LbGfBUmD2nbuYwOurwiCGTEat/6TtZ/yGjoBdamuyHx2
	MqY7dAa/9NB9PBXWSdUtUJ5rwzJ+KsSj+oz5P8UjAcRFVsEAHI7mf2E/OYq4U5TgrVvivFkqvTW
	8MgntkKSC4Ed9zvieAn8CGc6mF1ZombzBhhD0ty9vDjqX6NzPpjhoHWWMTYcHcP25/iWMr3QB/6
	zCGTmV3JT3yhtPkD+mHuQ3XZ7ATlGo5D7mgQSUaHYY2IK/Koy8wOBqKCcVupKF3BvazuKFkWYww
	==
X-Received: by 2002:a17:902:ebc6:b0:2c0:c940:dc1e with SMTP id d9443c01a7336-2c2f2c64838mr48032165ad.20.1781208911134;
        Thu, 11 Jun 2026 13:15:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:15:10 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:52 -0400
Subject: [PATCH v4 15/16] riscv: cpu: Output isa bases lines in cpuinfo
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-15-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=6uRwmcArNmpcYHUxfVzJ1KUTNe7nDEt3Iouczp4pFJc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtscP8W/I7a44KTu7eNGUm/x/V9O7U55x9jvfX8IaI1
 ssc8jHtKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIloMTD8T3wWVc9/4Hm9Y7yr
 eVbGq8q1TtuvXvyga7K41THqj6TMdYb/nt9nPzbeIJA1uXnNe+Wgo6cy8mddueVw6fH5C27BBTP
 2cwAA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_211519_028920_CD09F140 
X-CRM114-Status: GOOD (  12.64  )
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

Output two new lines per processor in /proc/cpuinfo:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

These read directly from the cached riscv_isa_bases and
hart_isa[cpu].isa_bases bitmaps populated at boot by
riscv_init_isa_bases().

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on
(showing only the new lines plus their neighbors for context):

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  mmu             : sv39
  ...
  mimpid          : 0x0
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
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
