Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38114E7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J6sPxHke9yu10S4bP09mG+6OeMQCvj4N22w5EadWvL8=; b=1gbPIpjAUTWW2y
	da6nhI52SVDVMI5WSPVagvpidn1NRtxMj5j5OyNFBTlRNCpkNN+fJwVb+KwAOd/lZTh50yeOrX/91
	djfEMlWV4I0j7NhL7r36rOrPwnpYPUNbt+7OugXYStovnO+pJ7FUv1rdTqhudx63s/Ry/kOFGOwJ7
	BQemSIzbRUw8B/XLvktCA9eqA7UTDg4NmRGN9SLbC0MInHrJLVcS5ft6mcehARNUJ2po1yEnVM9cf
	uOy7bcxMtn0NOAEW/qZMTh6VrfPGWZvg+qEq2qmc/t9jdyfADNqRylYX9+6ja3lr7nbHaEXcDFNKF
	TtLSdNhYjrU6bKgIDgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4IL-00000003dnD-1Tpi;
	Fri, 13 Dec 2024 11:57:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4II-00000003dmM-0axf
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 11:57:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361ecebc4dso11938845e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 03:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734091037; x=1734695837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=snfyq8lDZYDcZd3/jEIiaO5E3Ue45FWLsNzNsDHm93g=;
        b=TwKumG0u7jUDXpAlMRNl1+XzIQPJAZ7+yCo5Gwkqk0Xwu8sRWItCTwe2/99EeINZoS
         33X7uZkUtNp5M9ZxJqAjT72E6+CoEHWM6uQDdr65Zomq/fcOdsXVQP96bZfZHMa+uwpy
         j6ubRerz4sz17PQS2+m2AxGRSCTASZT/A/S1z9q1fRQBpqkpX5pDYM5V7YBozQYuVIjI
         v3ViegtHGuxKkYF8E4+Jkg8CuBJ/eWoksdr8DK8efzuO4evOYgvRcr4Swyzm35OH0dKT
         7E9eie6e3aJAstEMD5uh4KyWXZFtuVqgeq0BqJwS5ZAPSt+lpEG3zBajXymP7quCaHF9
         SI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734091037; x=1734695837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snfyq8lDZYDcZd3/jEIiaO5E3Ue45FWLsNzNsDHm93g=;
        b=JGFPLiKK591WIhOz9oXQlCotALUaVm3LZrl6aLyK7DbAYXRijbtfSx8dEijFkMyyim
         KMyv578FeSOWBhAMMkD+Hmnkivg3OmB5QL32wGzH0Cye9OQzy3SsmTL8ttY4p4jvVMp1
         ay2yRzUjZX8LyTfTD1p8nittJaSj1DgM9aHjsLpyjsKMCoBfqvC3Q2Nj+68Pb70+375J
         TJbuEiHYRxt4ujIAhI3fPJvocFFvMAE7LVQrB7PeL2MlTi2vwsc+tNfbQL+nW5P1alsO
         AVQHrlJgLXmOSeL5vYwoMjooFbuHe44L3iVebPCbijqHT9/7DTKM/LZ8+4SeY3gdK6JH
         sTjw==
X-Forwarded-Encrypted: i=1; AJvYcCWRExei7Z5fwfc8fcKY0a/mw/UITjVDzEVr1tBYQ8O1W+gK+yT8tBLP5HhfCZ55sDKUTLPnoosup/aX5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBGnwccsRQ+w6kzkbr8ZZk4RGnvXPVSnoORIaJlC9drsepi+B4
	o5I2VMO8DFrkgETGYAeA2F/+4zDjnfcS8hAu8j4jwgo1vNIJMNOLTYE4Gm3IR1k=
X-Gm-Gg: ASbGncut9UDc/O+sPPezzJgM9kSn8XW6Gq8c6oEtGX2waaDZ4+jJUsMTiJ3HXTwCqCy
	1PDSJWGC125ee1ZT+5Z1EYchxnYp/iLkktV7pRzIcaOOD0/LUwR/ifkoObfR7s62fUp0VN4JSck
	NQVB7k1D7gJKc4s9NgVL7XGKpOAO6tOR08I1yuVhwrLzz+rm7hXjKeW8gawtWKaZNG7vhg0QYNr
	yXQsTqcFhvfsivtjDmHVBEdpQizexV3n0pBHeD/cI94hnJK62TBAvOwDbu4GUZ4md2oP1aQTP29
	IM870E0gnYH7lAuTHwGoEx8Fhl/jQ0WoCDRUKFM=
X-Google-Smtp-Source: AGHT+IGuKBifitMwHJD63dlWjth+MyOB5tJF7VkrOI/FkjnTg+QJm2BBh02u9ybtuzDz8g87bmxHIg==
X-Received: by 2002:a05:600c:5397:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-4362aa34e4cmr16687785e9.5.1734091036669;
        Fri, 13 Dec 2024 03:57:16 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c357sm46528135e9.10.2024.12.13.03.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:57:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [RFC PATCH] riscv: Fix PCI warning by enabling PCI_MSI_ARCH_FALLBACKS
Date: Fri, 13 Dec 2024 12:57:04 +0100
Message-Id: <20241213115704.353665-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_035718_441110_F886CC12 
X-CRM114-Status: UNSURE (   9.57  )
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

When the interrupt controller is not using the IMSIC and ACPI is enabled,
the following warning appears:

[    0.866401] WARNING: CPU: 1 PID: 1 at drivers/pci/msi/msi.h:121 pci_msi_setup_msi_irqs+0x2c/0x32
[    0.867071] Modules linked in:
[    0.867389] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc2-00001-g795582ce7e24-dirty #44
[    0.867538] Hardware name: QEMU QEMU Virtual Machine, BIOS
[    0.867672] epc : pci_msi_setup_msi_irqs+0x2c/0x32
[    0.867738]  ra : __pci_enable_msix_range+0x30c/0x596
[    0.867783] epc : ffffffff8050af80 ra : ffffffff8050a66e sp : ff20000000023750
[    0.867809]  gp : ffffffff815153b0 tp : ff60000080108000 t0 : ff60000081109600
[    0.867833]  t1 : 0000000000000228 t2 : 0000000000000004 s0 : ff20000000023860
[    0.867857]  s1 : ff60000080de1000 a0 : ff60000080de1000 a1 : 0000000000000005
[    0.867880]  a2 : 0000000000000011 a3 : 0000000000000000 a4 : 0000000000000000
[    0.867902]  a5 : 0000000000000000 a6 : ff600000806368f0 a7 : fffffffffffffff0
[    0.867925]  s2 : 0000000000000005 s3 : ffffffffffffffff s4 : 0000000000000000
[    0.867948]  s5 : ff60000080de10c0 s6 : 0000000000000005 s7 : 0000000000000005
[    0.867970]  s8 : ff20000000023a08 s9 : ff600000811093c0 s10: 000000000000002c
[    0.867993]  s11: ff60000081109410 t3 : 0000000000000001 t4 : ff600000803a2878
[    0.868014]  t5 : 0000000000000004 t6 : ff60000080357450
[    0.868036] status: 0000000200000120 badaddr: ffffffff8050af80 cause: 0000000000000003
[    0.868186] [<ffffffff8050af80>] pci_msi_setup_msi_irqs+0x2c/0x32
[    0.868339] [<ffffffff80509172>] pci_alloc_irq_vectors_affinity+0xb8/0xe2
[    0.868362] [<ffffffff8059d62c>] vp_find_vqs_msix+0x12a/0x370
[    0.868385] [<ffffffff8059d8a0>] vp_find_vqs+0x2e/0x1de
[    0.868402] [<ffffffff8059bd80>] vp_modern_find_vqs+0x12/0x4e
[    0.868425] [<ffffffff80624a50>] init_vq+0x2b4/0x336
[    0.868448] [<ffffffff80624c36>] virtblk_probe+0xd4/0x90e
[    0.868469] [<ffffffff80594e02>] virtio_dev_probe+0x14a/0x1e6
[    0.868488] [<ffffffff805fe04c>] really_probe+0x86/0x234
[    0.868509] [<ffffffff805fe256>] __driver_probe_device+0x5c/0xda
[    0.868529] [<ffffffff805fe392>] driver_probe_device+0x2c/0xb2
[    0.868549] [<ffffffff805fe512>] __driver_attach+0x6c/0x11a
[    0.868569] [<ffffffff805fc17e>] bus_for_each_dev+0x60/0xae
[    0.868588] [<ffffffff805fda7c>] driver_attach+0x1a/0x22
[    0.868607] [<ffffffff805fd398>] bus_add_driver+0xce/0x1d6
[    0.868627] [<ffffffff805ff0b2>] driver_register+0x3e/0xd8
[    0.868647] [<ffffffff80594614>] __register_virtio_driver+0x1e/0x2c
[    0.868694] [<ffffffff80a31b82>] virtio_blk_init+0x6a/0x9e
[    0.868733] [<ffffffff8000f128>] do_one_initcall+0x58/0x194
[    0.868755] [<ffffffff80a011b0>] kernel_init_freeable+0x224/0x28e
[    0.868775] [<ffffffff809e4e48>] kernel_init+0x1e/0x13a
[    0.868795] [<ffffffff809ed952>] ret_from_fork+0xe/0x18

So enable PCI_MSI_ARCH_FALLBACKS to get rid of this.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

This is an RFC as I'm really not sure this is the right fix,
Anup/Sunil/Thomas if you have any idea, please step in! Thanks

 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..40d51feac2bb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -199,6 +199,7 @@ config RISCV
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
+	select PCI_MSI_ARCH_FALLBACKS if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
 	select RISCV_APLIC
 	select RISCV_IMSIC
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
