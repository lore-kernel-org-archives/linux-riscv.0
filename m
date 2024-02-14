Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9905C48BC4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BghsH0I9HOiQxqa8ZLfH8XZoH70SMiVL79xTFgmDvM=; b=pgjkiatiz6U4/F
	NYD6IFIyXN+8mrOHGTmCAAs/VxZr78LMYjxM5gdZEwWmmhKV/jSeUojADEQfNBGYE3n8nrFLOtBAE
	/nANG6JK3dwJHivZS54/ur5nE/8k0om4Ld9Ef0NgEJFQTGNNEj1t1smcIj8N0+WHeGhjsPq7bZ93h
	FWwgFgbcJLwu/Rh5KHTtJRkMQzj/Pz1kG8wmoNAm+Q12ZTuzNCiuMg8qWlp3v0XgbHpIDpGWxcdIG
	ZblelUw2HAI5dmC5SJAnEfYxmI+sfzOVCXu5T0TD8+ycyb/zE7zMe2lC/jCK9yKnQr7PZFichUQ+S
	0U4yrCZkwvu6LfdfB9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raB9h-0000000CCdJ-2kTG;
	Wed, 14 Feb 2024 09:02:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raB9e-0000000CCcF-10Od
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:02:11 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e0a37751cbso2801878b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 01:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707901329; x=1708506129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbCTJ5IGhkP1LmE7TbGdUdt79kYAcBAyFyeC8QWmnbA=;
        b=F1R0/Cnxapi4A3k93oI9E8preJelDuQ9o3kL+eoT8cH8PU9Q3q4wRCzJuD7zOGApQ2
         ejTF4UN16Vkecz1mlQw1s7BaPjU18AlzcaANLt1RoyeKsdVW0wuJXS8T/Oj2c/itlfe7
         ttOCY5tL1hslkQpED1inPigGIxQ9+JWFN1q7jU8m7Jay0R8kznFI5iboB/9xCBjcjttj
         6jpA77OuD/pjIfPIKFNsTy4MlyuLSJdYgm9lSigmT1NFgLDT7pNdJDykyHOdMz4qE71U
         OevLoFqsvfCfCN/X38Xk/Q6psjgeoxA4g+Y8DdFjI8CK9/WJKOtamclQw4nSRvaB8lfI
         x/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901329; x=1708506129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbCTJ5IGhkP1LmE7TbGdUdt79kYAcBAyFyeC8QWmnbA=;
        b=KBFZV/KNVqfMSMyX6Lt4IDbMbkngAb9mLN60QIaLawTssqcshmlZ7yIoHRFODDVkU7
         GpMk1GovH0BghOwoxed8k+jAPwyOxMUxkFNVln83uaz51h8Kfo3N4UhkrsI2lDwGEZ6v
         xcQow0CIeV+GImki5meIa90UI5ozz5IPmVLblxu338KBaAm/hpwyVcsL2BkVqmwjNbY3
         CZRZ55nn/TyN/jmEfkDDYob7YhjMGct7gqpJiIOMwb0OBdQim3p8ZcayAa6ngIf1uzLP
         Nt6uUA4iQiVCLFMWH/7WVcIwfdYqQ/pfX9d9NBSQMLCoz0zKBcShfJD/QhSRvFYi4Oo9
         VLZg==
X-Forwarded-Encrypted: i=1; AJvYcCVGKcQc9xFB9ZeFzloPRmAVH1CQoTUpAIycGDYBI4dzo3NNUws7Rul7Gab9NVqsTGeODgWvTS+BkKJvD4HRBynnS6uTc0NMOuP5uIeJm5AF
X-Gm-Message-State: AOJu0Yzgi2w6/brO/tD3G+m32qETjszf8716zOpiDzxch+w7NjUFR846
	dpgLy8ncsHgp7yq3stTCJ1ddAgNadRvSQInMnjmNRGDOK6bDVyg5h4K9J0CaKIU=
X-Google-Smtp-Source: AGHT+IFsjTuVAsJab6ip88ByI9QyNPkKm0np9TXh01qjGS2E4T32B1s1GFubfCKk7kV11vqAbji1+g==
X-Received: by 2002:a05:6a21:3a44:b0:19e:4f38:d8b8 with SMTP id zu4-20020a056a213a4400b0019e4f38d8b8mr2502137pzb.49.1707901329240;
        Wed, 14 Feb 2024 01:02:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7j4Fc4POZ09+xXH83jfYc+PuXbyH/VpOIAqmnBvkJ7GqY+HqUjeaxss0dPHCrRc2j31VDWX26D00yKHkfrVrh/CtH4mEa+eXidreRJPQVQm1CHNxDFHSujA1O2DtcTmfQJnAyb7E4fgp4iJkddZeH14jt0tzjkqeMTpNzqbiEa+Ttjq1fIS3GLjWb/svp7lzGE6D9Zk/QFtwED28vrb5ty1QHbbn+rGhZxsay3cXFF5d9pj9rukcYm/6vj7pH010lIbqQV9ff
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id m25-20020a638c19000000b005d7994a08dcsm2476681pgd.36.2024.02.14.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 01:02:08 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH -fixes v3 1/2] riscv: Fix enabling cbo.zero when running in M-mode
Date: Wed, 14 Feb 2024 01:01:56 -0800
Message-ID: <20240214090206.195754-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214090206.195754-1-samuel.holland@sifive.com>
References: <20240214090206.195754-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_010210_283571_11840B4C 
X-CRM114-Status: GOOD (  10.37  )
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

Cc: <stable@vger.kernel.org>
Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

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
