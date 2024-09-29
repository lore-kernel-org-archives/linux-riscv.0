Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3688CF6495
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wrQvHTrhFxTVAt8wrjfMby5uov7OJrg9IBrmN54rnVs=; b=HeEcucg0LEsDA6
	OYEuNbrYscdcGUviOirlNzdovdhVTv1abhe9pyJci/PdeCPnB+Zg8IH2Qo2Iq5poQeshGpZAn0LHK
	KzPl+FQNViKa42SIZWSnvmhg77YSEfE5Gjeq6KTJso5M/4lvDzpV3qtrsxPchHHCgO5BnY3jCtEms
	5+xzQMfeGHCCVeaF8HT/FRCJOSsb3O4OETezQXBO1ysWBqK7XXt9F9TCtMivJ5b55DGdChLZkTuoU
	Nd8JeUbrSPK7arh5gmWDr6lqJSaNawUmSfryBqaBIMTZRaXOey0bURXD5mW7i1lZMtq8rXBuJjadS
	U5IT5NY7hCE+6lE34CuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suuVf-0000000ErKM-3opN;
	Sun, 29 Sep 2024 14:02:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suuVc-0000000ErJx-0jzR
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 14:02:50 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 35C553F03F
	for <linux-riscv@lists.infradead.org>; Sun, 29 Sep 2024 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1727618564;
	bh=rHKx8mIJ5uIzbptOZkjeP2ZJIjmWzd/aEM3nFAlxFXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Kb3EisiR98rWNoAQ0hKdOpXRntljj0WvklUAWaFtUsEvbUlNDXYYN+OMjLkZ2x+Yi
	 jGSVl/5eg1Z9pMa5tXwEGWOghW00osIcChvkKpeY4TUjYg0difIQ28duDDjEPHwJ54
	 rXvaLOSMcirUZRq64Z3EQvNDxwAh9Ip3qzIehbPWzPz6vUlso4LTGLtK5M9aI6I6tr
	 qo5FwZ9qEKhgHEbZ/IsuUooDUsSCYwfktCWy5sh6UIZ78MiHtWOu8QCxJ8ncEodPFM
	 J9oc3BOvlit+p9XlZvVOGQy+lJU7tNC9poZnxLXRZ+XVflG4JmdlZaFNsrLD1d68J+
	 19R1hZ9s82S4w==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cbadcbb6eso26495455e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 29 Sep 2024 07:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727618563; x=1728223363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHKx8mIJ5uIzbptOZkjeP2ZJIjmWzd/aEM3nFAlxFXE=;
        b=aeO0fpQsTZFrKOHdfKghj7cADT59oRLJu55o9KlLkThEvV/03AyckBb0c+Zn7ms8HI
         syUWotTfRGALGKMh6hUmmFqj5RsO0P32jhEj5q79c/+DNmtfkPj8qvORGSFTNkxQtGrr
         2CWZiFMzXWo5BSv5GiJTq/gM3N1WOEWN3u9Y/im+m8IueF0Dg3jULm1Ru8cuwe2CYNgv
         FIvM6yj3/7G2Z8foc3MAMSEog8xvrzZDkSRbadOz7cLih9XycPJw5GZdqXVJ39EE829p
         vcoJ/XxeZzfBoOfV9qU3ZLm8jfaslmTzn6Am75/vVvgrRWCZYRNTw/swpauDMPyWHUy6
         ys/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnUnyhgniEwoRM+CHcNGKRcfgZkHpOLjNxHvIqfQrh6r2fVJHuefrR2IczxAo1fenVG5stNX2trjTVow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs3y4TpojupJeG0OI1Cxmjt9ZdMaPWy3iqW/4D2jZ5DFT7P96L
	96SuOrTakUH45+jioQXHCvXQVEE3xPLFpws3H1YoRfRZe1w9vm+z+1CVmFlwS1tKBw0NEjiRbpE
	67PeXoluwzW7gCtAi/LsoNns7CDZi94OT1S8eIHbYolCt7IVuu+YFXlENuqHEZvWHehFOqzFmSV
	e8S1PH6w==
X-Received: by 2002:a05:6000:46:b0:371:8750:419e with SMTP id ffacd0b85a97d-37cd5b1050dmr4364125f8f.47.1727618563436;
        Sun, 29 Sep 2024 07:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpRsGnT/O5Zh2PNndGTBGCRoPiKJuRnaYvFSR823DBh5TYMOIXkdUslOOcZ+Mk5FUrP/jCIA==
X-Received: by 2002:a05:6000:46:b0:371:8750:419e with SMTP id ffacd0b85a97d-37cd5b1050dmr4364109f8f.47.1727618562729;
        Sun, 29 Sep 2024 07:02:42 -0700 (PDT)
Received: from localhost.localdomain (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969f23d5sm127805885e9.13.2024.09.29.07.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 07:02:40 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] riscv: efi: Set NX compat flag in PE/COFF header
Date: Sun, 29 Sep 2024 16:02:33 +0200
Message-ID: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_070248_557041_E6467F7C 
X-CRM114-Status: GOOD (  12.31  )
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

The IMAGE_DLLCHARACTERISTICS_NX_COMPAT informs the firmware that the
EFI binary does not rely on pages that are both executable and
writable.

The flag is used by some distro versions of GRUB to decide if the EFI
binary may be executed.

As the Linux kernel neither has RWX sections nor needs RWX pages for
relocation we should set the flag.

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/kernel/efi-header.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/efi-header.S b/arch/riscv/kernel/efi-header.S
index 515b2dfbca75..c5f17c2710b5 100644
--- a/arch/riscv/kernel/efi-header.S
+++ b/arch/riscv/kernel/efi-header.S
@@ -64,7 +64,7 @@ extra_header_fields:
 	.long	efi_header_end - _start			// SizeOfHeaders
 	.long	0					// CheckSum
 	.short	IMAGE_SUBSYSTEM_EFI_APPLICATION		// Subsystem
-	.short	0					// DllCharacteristics
+	.short	IMAGE_DLL_CHARACTERISTICS_NX_COMPAT	// DllCharacteristics
 	.quad	0					// SizeOfStackReserve
 	.quad	0					// SizeOfStackCommit
 	.quad	0					// SizeOfHeapReserve
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
