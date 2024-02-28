Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05731C54E4A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 06:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SY006LMzpala2SsYKH9gJBTdWhbv/yVjuMtZV7zIiRI=; b=IcfmqJ45l9pnD2
	JkyeKfJFic24+90Pe2wflnYsun5nj7D2LVFMEOfO1KYRSr7nhaMLUyjVh8mm/JZ3MS49B9mIihs4n
	L2n/9ruwVcy0yV2qD7+DblRD/t8PQxBAiYNiE/qOfmjqI7iNicpOdXLrVYR8CmI1WncP8OP/+43ft
	mhkXS2PtsD8sWkaOmO+wKoHuL/slU3q+9e11M7/krGxM1wmyreK+HfzPIVl22cbjWeMu8vv9v/paN
	Q9TQOx55ZyfK7ZveEnBqO3kHteX3IYkM6k+Tf/zIBXdPEjjTV2fBd4JDLcp1FX9EWGL8PkPrsPmw0
	yw5J0pf5dTfHFgXNASvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfDrM-00000008EIt-1wyi;
	Wed, 28 Feb 2024 06:56:08 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfDrI-00000008EHF-2LE3
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 06:56:06 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c19dd9ade5so1694372b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 22:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709103363; x=1709708163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1cp6XMBopp3tzzHV/G51+rKShiExWAPZnHAB8vVY2k=;
        b=S9yoIk2qd6sidZF1Q3PUKdJScEgt+BWA4d999Eurjx5+Tu32AGy+P4wQFDGJRjS2ID
         hh+MtxxxGWgspqSKbvfGid0of9HuCWyhe2KcqsxlSQ5zFDwqYbTKmzfJ0BxBafOgfv3c
         wTU/CuuD30/6jZaYC6Ntsl20JhWufHWjBsdtPl/88iQpnfDeixg9Eqq2+FF485OpkNsA
         lyxeBkPF+AY1a44oiezMlCVei4Vl+661ojn00t28eh91f3874/PdaSodceVU6LL3pJ8i
         PmRere2YO316zeamk3R2shbgdU1vcCH7arQYFdrfQqFFY5uogO5/9gGTrAcHy/ameWaF
         /Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709103363; x=1709708163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1cp6XMBopp3tzzHV/G51+rKShiExWAPZnHAB8vVY2k=;
        b=sg3iMD4RvyUDwfAQTk5idWrrX7cCykNRiLY+aC4iK7bbqCBr7JN/w04tW+qYzw84qz
         naXv7C8qJ9SQjSSDc7X2EJg73eEZCnkf1uL1ZfhtSziDvK0KgjQm/d4Uhi5Q5B2yAQXl
         zND4gNFEtX/lvwHkrsqeGqqhSyc3k5q1siKqJ5aiWDYI/ekC5kg++GItCH0zVfb2A5s4
         b6IHefsLccKoENDHjRmtlzFv+y5cV7PVJnrc8DwaU9jqAr0lnITWurzy40afbaDhyaCX
         MFqnVPaczCSc8qPGmMw4UkMTOX76TY0wOHsmQlNFNCNAu05FrMbcVpep6z1FTVC99Ay6
         EUWw==
X-Forwarded-Encrypted: i=1; AJvYcCXomVIytJTqJyePtsk6U3B0C/7Mpg9wrSLLQYJQ76e+kFnyDF/2Ay4+EyzDBZMXhHVLP5ZnG/aeoWrXnZ+KnkHzwMy4dXZHoTp8Gw4VzuAK
X-Gm-Message-State: AOJu0YyLDGUtBs/9E6jFZO+JIFF99WCx0q1xwS3/LmYWi7s6x9K1Ox5H
	BvVef/posQZoKt9pQJCFQNQPq4hUtFAQDMa608i0Yg8QzSBdz3hgcZoF8Gg4ITg=
X-Google-Smtp-Source: AGHT+IFXIsSjDWuHRYBUZ4nH4ci0C53IjlWATHbpl7/aaCUY4gxiRH0rXlKJl12edB4xIX1p9ussRA==
X-Received: by 2002:a05:6808:8b:b0:3c1:5b63:579b with SMTP id s11-20020a056808008b00b003c15b63579bmr3629169oic.49.1709103362812;
        Tue, 27 Feb 2024 22:56:02 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b006e5590729aasm1010112pff.89.2024.02.27.22.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 22:56:02 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH -fixes v4 1/3] riscv: Fix enabling cbo.zero when running in M-mode
Date: Tue, 27 Feb 2024 22:55:33 -0800
Message-ID: <20240228065559.3434837-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240228065559.3434837-1-samuel.holland@sifive.com>
References: <20240228065559.3434837-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_225604_727212_394D639C 
X-CRM114-Status: GOOD (  10.89  )
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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
