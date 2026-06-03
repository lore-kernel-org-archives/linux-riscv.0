Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307B1CD6E5D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0akBjT5vfrlNEIfc+WNy8P0CEynY9k1opYy/ncnJ/0=; b=BDgCwAeLSxV7Ag
	WB90OsLAAipv2X1SAwA0bv/AR9KjCs7DTjYacL1/74AKsY0PkzRZEEYOGe/QEkaMcH/8OFE9RFlfE
	1JR76pQKWGZvehOwQhayEKKKGuAMXnHXEyDUXnficQGPb2fkC0/LcTLRdU52pdSJQuJ2PoPK2v8Wv
	GILSbx0zoHH7eAL9DxxQrZhCeefF1hFmlIX+K3UU/r4waSFuUsWi8vE4OHn1tuk4lxUMdt03+jmQX
	rChPmDSwvxI6oQNnpq75TCT63aPIM+Wj/amWptgWBryitceOpvOsVF0oxUh82aUQselX/NHKd2NxA
	QZSBId5NcSsnGWDT77Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYKR-0000000DwPR-2Bof;
	Tue, 02 Jun 2026 23:15:23 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYKP-0000000DwMT-3QiO
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:15:22 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so2094586a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442121; x=1781046921; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPBQ++ePsPMFHRPcO/XS56r+jXgkNVBk54cuehJ0cRo=;
        b=W3kYPzebKaSm0lK3A1uqEI+kCwu8Fn3qUdIY+WDtxlDYSXuV3JWVUlGhLTUP1aQsta
         1NrtCqLfQ8fYkGVZls4kHnLTFu6CZEN0o4WTou5DO/DO6eTTDbJf2nGNBq9fmz+y0aaC
         dhXj7/L3enANeBkagrq9CfJNmrfmxCw2CO0Lnt8pTEoq3LyTFfk0sYCA4U/YDh5mZlF3
         zg1Po80thhagli1pxL9VCrfG8m/HPr/+YEmqenU0aUAmIYIO2M1NIrAqfgI7ooNDm2BD
         /pneatvKQ2cwpBLoUnyT3dYil/1ZrVE8fLTHg6RSps9Hc1650uOV8bymKp8m51slvE7F
         lmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442121; x=1781046921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPBQ++ePsPMFHRPcO/XS56r+jXgkNVBk54cuehJ0cRo=;
        b=koG4chUzZ+VkMdIvPs2xDdrDIMuTzT1gq2dVZPhv3+KQ+RnLVbuBu+mZVobJMAoQXN
         oImBQmSTv73fZJ9495pO2vY1p0fCWBXqRp1yMN6eedtipOsHLS9saqzqNc5Pk3LzJnF6
         h62KQSZNKe+ngas3ZxWbQn/ccGTLk2DBVF7NA29JFKHsmp43qCU7hSEQFx2Ni53LW4L7
         WWJ6euhZt9lg5smc/uGGPn9Mu4MOLPjd6tjT8v3loAJZeScJthhwUN0wnYlCZ1ZNN/9z
         xL9EEya/dPxTledVk/rP2foMWRPGmILdDJJQxsn4OlM3ydSu3H1NjmwsabUuv6pXnpzh
         8EJA==
X-Forwarded-Encrypted: i=1; AFNElJ/fkv+ubMVpXnGImJqwr2EoFb0WWyUy45cNb4JQRQ5p4YgAUQeF365qO97KMyrCQr/fedlrkKKgK42HzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+vC53gCs55nxDZuADwTCPOmZl1oQmO/DJ964yh+uQgKr63+sP
	vS8cNnvQwR4uzmYmgKrY6AfPFRvyOElIo1Z00uCWqk0Os+fxLODhvQvl
X-Gm-Gg: Acq92OGQ5BaCBINPuVFPyzc4g28nUz4UEmZnuEWUxMxAc4oUnr+FPkHF7MooTHs8vWA
	UWN/T3FiUaKjXiNQyiJy0O/x/ORBzPs6/084/AutxU0ESdZD4YU8HbdKbAExGngnIR4WplVXTeQ
	U/Ykc2e3e+P7tgds7OrV4pT1ThaXqceGLxZvx5oxxMZ9L+qcYAbef/2y0K+sy4bcw9FZVIfYG5y
	3YqlKOskvIw8ZEEQGnX5XiJIn0c2K39dkggyTqZ7pywrm78AFFUK6zDrvGOwoGgkInLuGPBC6Xb
	udtEJmteq19vve+SW/zFWReUWdAx7gfueQ9p+pEqd0a/CufdnRn8ILUjoPgr4lhg5LX2+UVbez/
	IOvXeD/HsC8R+1z3Exi8XnkmFxz0eFz5rkfKs7cljglE7flKS3FxzOtvA0jlF4Ts7vYPzZ46mXY
	4LWBsA7yD0FA==
X-Received: by 2002:a17:90b:1fc7:b0:36d:8f51:fe29 with SMTP id 98e67ed59e1d1-36e32285958mr783171a91.17.1780442120719;
        Tue, 02 Jun 2026 16:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:15:20 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:09 -0400
Subject: [PATCH v3 14/15] riscv: cpu: Output isa bases lines in cpuinfo
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-14-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=sOGp0iB3i67htt/vt0YyWfexKgE348qHxnlSOAaqgUc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHvbsu0dSf3uxan3W+P3ws4linXtVZZ/tdq3sy5l8B
 wK7f5t2lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwET8VjIybPJi3bXcy+RQWf6x
 r3t0GIXNS9Yy3+L21ZSRiO683bLhOSPD3YeMk3iVKxc06qYfmb89acLLpOA9pQsPtry7kjdFtju
 CBQA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_161521_860772_268551DA 
X-CRM114-Status: GOOD (  13.28  )
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
