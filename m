Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BCDC3DA62
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AETVs1huuTu4VxpndWBQ8NPL1nmDGvt5yVeINspW3qM=; b=qishkGdm81ONpF
	E+0u+wH+bXpYWixUKmTVXaj2SxqLe7d376z1cu44COO6ZHFl8PvtaUWPSfkIJbjmx2PsSci3GN/eE
	TIZlrzNbmqNkN/64hOB14WyngvTS+WUtc+ahZfU2SZLVNTN4nlDcrVLI7P544/beYnsXEnsdwgLX5
	bng4j3viSQ0o+qwR68aGzVCkU3tsHn3AZwyft9bTyoGuzq38bbrP9t5m+XP3iAolKhUeIOM9umlmz
	YHmqMqHmge4GnwQjlQtVVXEf4N2HGo4O+jtR6HHiNntCjPNG39pUGr/l/dnjIzY/y2xJLt5UijD0+
	+kXs+jJzZo7YnT26xxpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU94D-0000000EYzP-30Ki;
	Wed, 17 Jul 2024 18:07:53 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU948-0000000EYwM-3R8Y
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 18:07:50 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso4887093a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721239666; x=1721844466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2v0PQPo+2UsBqPXbCT4QAwtg43AqtiWUCtgbmmFr6Mk=;
        b=y8FFy53t2gZEWSjva8H/gLIJjGTbPQ39s7pWmO9reuQXe9DJbT6tQqwZF4zGL+6m4u
         fQ8xme5TztTDhXvkcCohOgkDAWoFgYA7GERWSY8gmCWQkjWrJ6CbkLe5iQ/+oP9Yn0iV
         2TuA89beYnot8oW462keZmDSJKSeWUBxs2DriF5qy07ylsiGDDkOrYfTf2OnbC7zXsAN
         RIUzwbjVAEudidewvMX2bDT21BUOp9jygaTBIZ67RS/A+b2F8GlFig3wOqkVaOL+2mMI
         OP+tNYmeF4ir+H4RHB9R6dVr+j2aIwwEzdex/nxItUaHEcHHWmTV93EuqMKi76ezxU0r
         9dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721239666; x=1721844466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v0PQPo+2UsBqPXbCT4QAwtg43AqtiWUCtgbmmFr6Mk=;
        b=Hps6n4p45d3JzfdwUAyKXcE5z1JtI0oAxhFDGH8RnEwAkCAqjMRrhT2B9LbXMHmkh5
         edhM1bW36QB2DdQVwg9aqFVQEQxLb30e2YAKQn1XRmHxDmI2of0wK5sjaCWPfkJlZoR0
         7e2+iApt0wxuJce6wo5Br75kPgnsUz1xdf6tHzh4Le5mfXWAn+8vgvN+RSguFAUIoMMi
         MFTRhXkJLNcUD1dUQjxRH4+Th4NqUW7MHqVxXB7Rlkard9P6aQgXyquv5/knbM6Ok5jb
         +zfXg+ZE/unrqmkHE7zvVHKo+JCeeUsE7VT24mUVCV2o++JcOC6N8Bpe8igAtKMYkWfH
         vf9A==
X-Gm-Message-State: AOJu0YzsbOyznA7YSjBgWF2djhSHzZZUJZQgtGGWPhMHPQezEHiwIjRp
	KYSNg7DtyO+gcSzduj/KywlEQ5RJqIzqR3KXDnvi/97oY4uyJOdnxUMI43SduW5w5QIZdYlN0JB
	c
X-Google-Smtp-Source: AGHT+IEy3+PK+qr4IDio0BsLMYxFRVKEQ5xv4rsHRx7ZJLo6TisZYFkxKaOoewodSBviFRWBegZ3ZA==
X-Received: by 2002:a05:6a20:6a2b:b0:1c1:31d0:c7a7 with SMTP id adf61e73a8af0-1c3fdc9a8d6mr3633482637.16.1721239666522;
        Wed, 17 Jul 2024 11:07:46 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c969sm8432332b3a.35.2024.07.17.11.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:07:46 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 3/7] RISC-V: Check scalar unaligned access on all CPUs
Date: Wed, 17 Jul 2024 14:07:23 -0400
Message-ID: <20240717180727.4180475-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717180727.4180475-1-jesse@rivosinc.com>
References: <20240717180727.4180475-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_110749_109402_242C095A 
X-CRM114-Status: GOOD (  14.00  )
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

Originally, the check_unaligned_access_emulated_all_cpus function
only checked the boot hart. This fixes the function to check all
harts.

Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Cc: stable@vger.kernel.org
---
V1 -> V2:
 - New patch
V2 -> V3:
 - Split patch
V3 -> V4:
 - Re-add check for a system where a heterogeneous
    CPU is hotplugged into a previously homogenous
    system.
V4 -> V5:
 - Change work_struct *unused to work_struct *work __always_unused
---
 arch/riscv/kernel/traps_misaligned.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index b62d5a2f4541..9a1e94383d6d 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -526,11 +526,11 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-static bool check_unaligned_access_emulated(int cpu)
+static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 {
+	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
-	bool misaligned_emu_detected;
 
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
 
@@ -538,19 +538,16 @@ static bool check_unaligned_access_emulated(int cpu)
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
 
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
 	 * CPUS uses emulated misaligned access at boot time. If that changed
 	 * when hotplugging the new cpu, this is something we don't handle.
 	 */
-	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
+	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_EMULATED))) {
 		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
 		while (true)
 			cpu_relax();
 	}
-
-	return misaligned_emu_detected;
 }
 
 bool check_unaligned_access_emulated_all_cpus(void)
@@ -562,8 +559,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
+	schedule_on_each_cpu(check_unaligned_access_emulated);
+
 	for_each_online_cpu(cpu)
-		if (!check_unaligned_access_emulated(cpu))
+		if (per_cpu(misaligned_access_speed, cpu)
+		    != RISCV_HWPROBE_MISALIGNED_EMULATED)
 			return false;
 
 	unaligned_ctl = true;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
