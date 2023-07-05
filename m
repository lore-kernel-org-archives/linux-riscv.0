Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79D9EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lg6phwSUUE0dGXzfl0XgerMca+I32r81cfN9XohbKC0=; b=XHNmnSUhs5GHlE
	qWtRKDcYYsoCnBYoImfMgjUOQiD+tdoq5hCC2JGrt7+masyJ392BIJyFWXUa5lxSCm+kiMVnn/i0v
	aC5YoWRekfagk+8Th0meSgd9dNg4W//7qEFkXJutVeGzUuVrfMmn0QxquoXDxzcqng68xRIBn3waU
	38a560B/VWhMrALA991OqAsP/K1ZvX6kNsdTGP5dpGKZdOuT65IEV9fMGzMQqi57mxkeNehwa6U2k
	ePp3PnWUyQkS8OURXn4yrUKKAR9BsWRCNtjHrW5mHc2Zyz1yJ0j+dCIbnKVzmRymIXv9Xcbq5U9Km
	uQBOx8IX4GCcU9HTO/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0wS-00Fl4B-0s;
	Wed, 05 Jul 2023 11:45:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0wP-00Fl2k-0s
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 11:45:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b89b75dc1cso4279135ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 04:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688557500; x=1691149500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/7mU7LG0/LoivTbyL8zN+ZBZKcFo4rglaRaqylxhfQ=;
        b=Ltfa/6PMTzVFKvupHYoIu25JvZQEj8+TG279VMGSVCFID+E3BGc5M/0cOuZAjs8bL2
         z9Cgl0L5iCAGnnQ/SuOGo7Tlk2zQTK9bQPleevr+vBadbtzutwf63D4nRPP3IF+qUaFx
         EvP//jSB2BrpV79rZnIxTxbFyGU2bFXfQ00+rYLUlKKiHn2sM+6/jwg1lRkSLa9Axgpj
         Txv/dFC2aNPc+fLwMIpNaBCDQ/ZOdivCtVpmurWLgY2ltsQ8x9kA03yypVf4nBnyOGiw
         Zc7G9su5n0GMnMCvvb8mRkoltS9mmH76Z7KN16SNl20HeoY+KKNBQTu61nHeHB/My8I5
         vr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688557500; x=1691149500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/7mU7LG0/LoivTbyL8zN+ZBZKcFo4rglaRaqylxhfQ=;
        b=NrKXqtCAWBE2vw5yXENkorarSMUxBUNHtMP1pPLTvPflWAl00GLdtJlnSmcQfuAh1/
         L7bDF9WQCUu3Ld00TWjYDLk84JHRmCGrryurlROn2Ry/gvZqazgfsCoKfAo5pQNmeR73
         MX3htrRk5ov3CCwF91jfN0HxPAybFWAJu0Gw8wgV7uaOc97GdZPKK01I+Y+sA+xpJctE
         tSzg+SUp6ZXuOoM8r3L1Rb7mHotcvGj2zq/LQgTSQWuVE23DxSxG5bCnnuVgnPxL7zTR
         4g5Za+mKVLjfpiSpd/ma/RXIl6pQiKMx9UDHRYNO2nFTbdcXPSdzussA4MWiPhRinivV
         zbfg==
X-Gm-Message-State: ABy/qLaPWJozRf5b2WK19PrKuBxaYRS7VTj/RpqKK/km7HlueBfpZJgy
	CbQ9RnVu7EnEpYc52cuIqkvUQA==
X-Google-Smtp-Source: APBJJlE+p5F5PIvo05kj7fIPA1p9K+VjhFZ7LXhkzaKK45+ZK+JAauB4t1oRak5U+mKJZRNdHuxLkA==
X-Received: by 2002:a17:90a:f40a:b0:263:f674:490e with SMTP id ch10-20020a17090af40a00b00263f674490emr1749692pjb.3.1688557499886;
        Wed, 05 Jul 2023 04:44:59 -0700 (PDT)
Received: from PF2E59YH-BKX.inc.bytedance.com ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a194300b00263f6687690sm1177900pjh.18.2023.07.05.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 04:44:59 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	sunilvl@ventanamicro.com,
	ardb@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	rminnich@gmail.com,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	rafael@kernel.org,
	lenb@kernel.org,
	jdelvare@suse.com,
	yc.hung@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	pierre-louis.bossart@linux.intel.com,
	tinghan.shen@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	geshijian@bytedance.com,
	weidong.wd@bytedance.com,
	cuiyunhui@bytedance.com
Subject: [PATCH v3 3/4] riscv: obtain SMBIOS entry from FFI
Date: Wed,  5 Jul 2023 19:42:50 +0800
Message-Id: <20230705114251.661-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.37.3.windows.1
In-Reply-To: <20230705114251.661-1-cuiyunhui@bytedance.com>
References: <20230705114251.661-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_044501_314097_2DBF72F0 
X-CRM114-Status: UNSURE (   8.60  )
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

On RISC-V, Coreboot does not support EFI booting, only supports
devicetree, and RISC-V does not have reserved address segments.
To support Coreboot on RISC-V platforms that require DMI
functionality, SMBIOS entry need to be passed through FFI.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/ffi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/ffi.c b/arch/riscv/kernel/ffi.c
index 147d06a5acff..b959d16fe0b3 100644
--- a/arch/riscv/kernel/ffi.c
+++ b/arch/riscv/kernel/ffi.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/ffi.h>
 
 static u64 acpi_rsdp;
 
@@ -35,4 +36,5 @@ u64 __init riscv_acpi_rsdp(void)
 void __init ffi_init(void)
 {
 	ffi_acpi_root_pointer();
+	ffi_smbios_root_pointer();
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
