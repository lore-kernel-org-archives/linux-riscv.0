Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF820C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 21:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DswXuH0S/dLZKBNEFpmCKXE/VstUoyRtfYnevpR/sgE=; b=TtAAeIgjSDDSd0
	1OPD497RfSrOtNmhLu5GO4rw6iuo65R9cVbdgeID7WGaC1Q40X7dd64fzYfS5qMCQjhjj7f5hQqq8
	GZJ+0CxXjQAtlBdqIqctjVqHh4Gp+7DWqzTjtwQYQxpumcGxl40KFXcL9uUGeqUWYah+kXqqb7NFW
	kJW8E2zwXp3om6Tag8oYqFELRnzmKrIOaNkCiyh58LEyJ1kg4EpLvLq2UsK3dGUIK84j85LsstBHU
	jih1sIRmFdFbP9xAshOWie4AKx2K2yzPHxgVmuHb67LDDJO3g+zvM1t+tqYx3UjWiIktr/9GyRo87
	pWH7q00Z8vwjpqdT21HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1pR-0000000FZn6-3vpF;
	Thu, 11 Jul 2024 21:59:54 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS1pP-0000000FZm1-0X3c
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 21:59:52 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70af81e8439so1217167b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 14:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720735190; x=1721339990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD4Jrv7yyOhSAoUDP5JzBFrS+BuW1YkOZl4khKRzO0g=;
        b=QwmjvvQ7BTyhpb2oLEr2rqO0sSDhlvCg7xYeZ03Bhm/Z+grssiY4ou4xRoedKQE62a
         sHmCHwLxvsiJzOLPjgszGqavcFxxdiuK51BvkCFD27wJeagF1kPQJu/Mx3XvBG7J4zaT
         6UIZOm+Nq0BCeYnEjYVmMfb9SxXLKd1D0WY76WfzN0GRHyezFabOpXYg1VIfWc52euqC
         uj1hI5jRobGHD3wrauuGc/POhNL7X90dV0veHHwESjH60eZRAXyasAv/T+3aPsqNfQO+
         Q53WvxZrF040DUEfvPfgPtb+LaLsjPLU9LdGBJ1Hf1HujwyfSJ/vQ+kHZ0lPSEcWqXUz
         3oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720735190; x=1721339990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RD4Jrv7yyOhSAoUDP5JzBFrS+BuW1YkOZl4khKRzO0g=;
        b=HqW9uGzp3qevUvWs3nOg8k0bMhxs7wa8Lza3wAsqOvbIUQaRGCrv5FnoDzw87b9dqj
         CPwIhn9crUC3IbRN/LZEeX0/TVWVtK+04utG+2TdwryI4mEBI0XeeS8xpThTDV3awqjD
         F5xmosl4c9p2vzMbPBtAnIK5NLsTx89obm+qAlvxykxkCY9KZXA8FJ8aEcHchyKH/gC1
         c0g6IPEQNYRQaS5vKppLwhF6+yPK2eqSOAd+Ia5hysq/7WhcxdgHBsNuhMJ3YNwrYU3V
         s6O002JhdoliBN2+30d+/PZwcvGkClQFkJgzjh5DVhJcyrEOf0JtvyIleky96p7FeG5y
         qjBA==
X-Gm-Message-State: AOJu0YxNPsec2MKBj0i8xWMPt4/DSz396FGm7UNGQZP3TmwQEQdXLWe6
	h6NhOA27LGZsJAJLxr99hymh+n1PTbF6aZPOdf60igiBu4t9Q+8fm7onyQYf+0Lzhbi+M5yVaQL
	1
X-Google-Smtp-Source: AGHT+IEHJqQluS13+YyzOtMS02Y+FGJBmzi/e2FwA3rgiR2aMvwi6CxYTAKSgFPQfTDX7y0MAGVisA==
X-Received: by 2002:a05:6a00:4650:b0:706:4889:960d with SMTP id d2e1a72fcca58-70b43568937mr11530984b3a.16.1720735190283;
        Thu, 11 Jul 2024 14:59:50 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898b10sm6169431b3a.7.2024.07.11.14.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 14:59:50 -0700 (PDT)
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
Subject: [PATCH v4 3/7] RISC-V: Check scalar unaligned access on all CPUs
Date: Thu, 11 Jul 2024 17:58:42 -0400
Message-ID: <20240711215846.834365-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711215846.834365-1-jesse@rivosinc.com>
References: <20240711215846.834365-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_145951_189338_007E6C33 
X-CRM114-Status: GOOD (  14.51  )
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
---
 arch/riscv/kernel/traps_misaligned.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index b62d5a2f4541..1a1bb41472ea 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -526,11 +526,11 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-static bool check_unaligned_access_emulated(int cpu)
+static void check_unaligned_access_emulated(struct work_struct *unused)
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
