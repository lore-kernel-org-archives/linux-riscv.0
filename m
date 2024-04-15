Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E098C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPfkGiRzoHaVbOWeOiwcZbnx4nus9vwIZRKu2Q/K4qA=; b=Cyq7nXeW/ZQGv4
	LjCP+NVyXsIZUe5FN/wlToP3WH5WnGNWckslY3aHu9ixwSvFOCGPcTgmO8B1ARSpfUHOjtV3xpO7V
	C0ThNtw+mlikgAr7vmSYTnJRQb/hXx3wHz4b/I73kXRCjinkYfuFfTc1dBVOroIGbq08s2n6D5K3O
	8tAGAUOfY08cjsvVVzRk92xqYzgumZ1YaR//UX9dLJvgrLVwb5H+qorx5thT/GPgQu6uNnCzU5vU+
	nBxAcDfgb0D7dONGwp0e7qBliPDWITogj0skZA0fLAtTA2U/CKIXP7WLtPr9yc3IHSNhZjyng/g9K
	+4TE+b5ZLcQC+MOQm7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPkE-00000009Cq9-3k7X;
	Mon, 15 Apr 2024 17:03:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPio-00000009Bpx-3rnn
	for linux-riscv@bombadil.infradead.org;
	Mon, 15 Apr 2024 17:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wivOzLRmXtJHidm0Hubd14abZ9qXDzBQHr2qytLzYnU=; b=rLi0ZFoFp4WYP36jCawa8JD0Ms
	9PeaQlMCo63xB3mY66nmnxeAGenOIpfr7bcevxA9GxA3E8tKGudz69vrH57/87IF6SqN4E0zSE8g2
	4krKu+rW8I4np8gfa15DCqjoDb+qHpIgDQBgYnZSYO3Yp8aIdsZdI32bpjEgmwxt2Wyk2VBM3bfXW
	98S6C6sb+1Ps/lwJddFXEpy4rzHbhxLPjLgxgs2oRUxpQ5m9UmTn5PfxomG7khI9o17BW1RJz3r+d
	10rq3sWKIFhVIyhe3gQnkp5Iu9uhwAM4iKSGSJoUwPO9d+9oFE0gCW7W/djKgIphSmKgNsLILk31u
	/5XwiRhg==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPig-0000000AfSK-3eet
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:02:20 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso3342964b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200530; x=1713805330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wivOzLRmXtJHidm0Hubd14abZ9qXDzBQHr2qytLzYnU=;
        b=SU5DSj0IIdowiK2MQCHn3tz8S428NnAr6l0y6YOh18g6ZT38bcE0gr2gxZxKPgstnm
         18MUfJO76dS6zBuzlvgihKVsQdlQOOatoUoh4XTJBmWz1bcE1Ggr0dIDbuHdcZGnQoT/
         YamL5STFXVeEPauF178qMnWkJdfP60BflwWa6oIqNj2VD8ED5TUmIb3TiYdYrX2shOEI
         V2TQOxAwpS76I7HFmdn7L8IoCn+I3pEWGaNIGFawLWEQiea5uwgWOu4ZtdBbWAPI7N6c
         aRw+fPgOuKDNf4T0g7xyOuuWGDvi62uk2vaPm5Zl7iFUuGVGhNaJwgMXZCGCCmCUI0t6
         OLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200530; x=1713805330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wivOzLRmXtJHidm0Hubd14abZ9qXDzBQHr2qytLzYnU=;
        b=hFqRDF+vx+W9tYjeBf3X91IBEnTTXy2ThpiXQEsleWpD2AvBLxJ0jMYsEK9279CqC0
         wt1BgaWcyzM44OSVn09BzMrTbyPc90Gy7gJWpXDsglkuAdXmmX1oRJvvjpK0Du6XnZam
         nsGPL1HBPPbSIAAs/bI6l6qTo2S5RULeNgK0GfFu3M/FdNhKMeilsRyXNu2CE1x/OzAk
         RgkaROsnAD/j/PTdZTHEHpiXDLRTG/M7iKgmIcOiixcpo6XZs4S2fpoWd7VCAC/VH28J
         y9q0FlxW93dQa29MzVR3+Nv4ZVWIJShg+A2/IZpeHWXv1JzSBY3aRR/GlUQSoyRjpc9u
         mDJA==
X-Forwarded-Encrypted: i=1; AJvYcCVn+WOADcf2EMiSfQHSuGlxTKfmN+nBZastRjP7jLqrwUe7m3YXIXtS2qaUM+ACct86A8Q6Ob77wY9AD3nCN8rsl+HWdNmA41h0E1QG2dAe
X-Gm-Message-State: AOJu0Yw/azNsEpann33P7QRblQrQr4uD4Xy1m6S6kcn9I3jQKmnaYG1f
	3vDINCeWXgYCB2vJjBwVFM76gwh9CCE9X0nxNgRwV9FwzVLSEd8ZdLY4CFCebJA=
X-Google-Smtp-Source: AGHT+IFQgj91jSGw2lUkZcvmJ8fK2VsBYSBL2HSqDtP8zaw7fuUgNF2lymwMr71eYZkL80x3yGmBkw==
X-Received: by 2002:a05:6a00:4f94:b0:6e6:8df5:f77a with SMTP id ld20-20020a056a004f9400b006e68df5f77amr12893462pfb.31.1713200530140;
        Mon, 15 Apr 2024 10:02:10 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:02:09 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 07/20] RISC-V: Kconfig: Select deferred GSI probe for ACPI systems
Date: Mon, 15 Apr 2024 22:31:00 +0530
Message-Id: <20240415170113.662318-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_180215_168956_D87D5443 
X-CRM114-Status: UNSURE (   9.19  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On RISC-V platforms, apart from root interrupt controllers (which
provide local interrupts and IPI), other interrupt controllers in the
hierarchy are probed late. Enable this CONFIG option for RISC-V ACPI
based platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig   | 1 +
 drivers/acpi/Kconfig | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 69cc0509a19a..d8cdb3535e44 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -15,6 +15,7 @@ config RISCV
 	select ACPI_GENERIC_GSI if ACPI
 	select ACPI_MCFG if (ACPI && PCI)
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
+	select ARCH_ACPI_DEFERRED_GSI if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index e3a7c2aedd5f..ebec1707f662 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -587,6 +587,9 @@ config ACPI_PRMT
 	  substantially increase computational overhead related to the
 	  initialization of some server systems.
 
+config ARCH_ACPI_DEFERRED_GSI
+	bool
+
 endif	# ACPI
 
 config X86_PM_TIMER
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
