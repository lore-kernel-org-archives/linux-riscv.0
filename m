Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA355C4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=klJkeMLc7/RkAZtV2EGHtv/VE123KMSoUB2QHdVRDiU=; b=cQN8Cyr8l4u0/3
	Rn46SO8YRWcoWFjeZF39MayTd51jb9V6X+UtJdQSaU5G6KuGR/NzpqqDo4J2lvZqV9/9KZtrEyuv7
	Rs7OO3HgeEhisamPsPURPvuizTgdjxS2x2h55czXGQBrVYue7p0ER73O4Q8+ku7WvG+6JFmOtQ1mJ
	8F1iTrKHUlFy+2r+N1Vtsmx57WIqvC0hf6vZCNUlLImeGs8ki2Wmgy7SKZPepJvcldLwHyOd7skNa
	0gsgwB0MXdNsXqKQKZEX6+sB9TGPp04uoJhLtoSgCvb+nCOZDW+4TYTg9utvOO+X2VZC/0Kywm6md
	8c/5ghL2n6Gp1Ru1dJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZM1x-0000000489o-1TNN;
	Mon, 12 Feb 2024 02:26:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZM1u-0000000488S-17KX
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:26:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d7431e702dso22447045ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707704804; x=1708309604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kIZpNvKn1kQfhO8EuiKdYkkbsLjW1fhO0uLZ9v9zVM=;
        b=Q/JczOvIyuAwhmjuYJVHVhMG/DHxK5QDVAFZ4x1Xc8ObIXdgFwEKJRd3ZYuQmeyD78
         iJlMuonSV181r6909wAWlptmqq8csRBo3VAdP0ETb/6AiuN045HvCNQso0V02RL/SeUo
         Xw9N/7xZr3Cg9RWdMOPgXwpBodNmBHkP67E1L5tksgCRhUwkfZB4edS+u0dos6s1IsQd
         0V2XWcbU2NCkaF2ZYpXM5y7ddy7qZyqld6w4wK91hlj3xEKsyhOGH9Ft4gPnNB6IGj6i
         MepV9l+FSVMGRWHMLxs1DYiClWSyrRAVoGJmzk/DFh+IMINzuDyn0rTLub8F/qk2k5SK
         4GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707704804; x=1708309604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kIZpNvKn1kQfhO8EuiKdYkkbsLjW1fhO0uLZ9v9zVM=;
        b=RPfTn0D1dxQQjJ0+bMzF/8W8Pf9ksT1FAbTRPyXiq35m/6rMi/V8X+6/bSqC+NR8rD
         S0bwTcz6x0Zze6hTe6fyqRzho93iLUtxGqZ/ODnwXdzXvtz5fAPhZpzPNYf4ITPvnXjE
         8UMcEoTZVk7jD48NG9S38yKcNWDK+YVFLFxiwCOCofSiIebWVkoZ1iyStot6odPQNxWY
         Lsh94TtgPyspvj2Ddb2la64GQSo0CjDJ4M9kZPCE2Ekn0ldVFiCBLpTZotBkV79d/8bM
         QMatyIQSAcUf9FTQbW6YZyq5tWkyGMi5awAuH4eF67uqcP/HI4sxGT+PftQ4s/T4oGKE
         vafw==
X-Gm-Message-State: AOJu0YxOcrJzuJQoxr3llItN0ckeEzT4Wji9u8buHbyB6MLPSH6rf0aJ
	4McSjbyk+9s+1Yvr/hRtjseSaE4U09YGqNA2/LTyOBOgUhfsuRZnku+guCwtG5g=
X-Google-Smtp-Source: AGHT+IGPtKmdFrCoAXwq0IynPe2vhdhsmEWzTlOxO+M0NscVcWz7/5WgR2aYGbS2vfq/fGcYE/Bqvw==
X-Received: by 2002:a17:902:ce8a:b0:1d9:5f11:d018 with SMTP id f10-20020a170902ce8a00b001d95f11d018mr6165050plg.1.1707704804598;
        Sun, 11 Feb 2024 18:26:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfdeKz8qQ1Wm/LNrWafjLgkv2+Xkl8QrY/iZkgowaE8IySyAhm6B7a9c9c/cifytyBUKmSpQly+vFAnwjO1HIVW1XVe+DkIvqGaDhJ43ypOJnuMyTSRDRJMdhMKGU+Az55/4QPqYlZXa82EICvNRAepdBnJg4jItKVtMxdi7IV5ihxUtDCkD/VY9r2gLvJ
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id mg8-20020a170903348800b001da27cbcf5dsm1719624plb.228.2024.02.11.18.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:26:44 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@kernel.org
Subject: [PATCH -fixes 1/2] riscv: Fix enabling cbo.zero when running in M-mode
Date: Sun, 11 Feb 2024 18:26:14 -0800
Message-ID: <20240212022642.1968739-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_182646_356646_4E23B03B 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

When the kernel is running in M-mode, the CBZE bit must be set in the
menvcfg CSR, not in senvcfg.

Cc: stable@kernel.org
Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/csr.h   | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 510014051f5d..2468c55933cd 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -424,6 +424,7 @@
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
 # define CSR_TVEC	CSR_MTVEC
+# define CSR_ENVCFG	CSR_MENVCFG
 # define CSR_SCRATCH	CSR_MSCRATCH
 # define CSR_EPC	CSR_MEPC
 # define CSR_CAUSE	CSR_MCAUSE
@@ -448,6 +449,7 @@
 # define CSR_STATUS	CSR_SSTATUS
 # define CSR_IE		CSR_SIE
 # define CSR_TVEC	CSR_STVEC
+# define CSR_ENVCFG	CSR_SENVCFG
 # define CSR_SCRATCH	CSR_SSCRATCH
 # define CSR_EPC	CSR_SEPC
 # define CSR_CAUSE	CSR_SCAUSE
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..c5b13f7dd482 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -950,7 +950,7 @@ arch_initcall(check_unaligned_access_all_cpus);
 void riscv_user_isa_enable(void)
 {
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
+		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
