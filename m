Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419D7D637A8
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 18:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d/5v4mzdEcHpjUGlqBWWV9CKOpaGJnagKsvTvSVQpUI=; b=RSY8EjYXSDEqDc
	30X8107fOueH0e9iIjIMT8dEuypLfnLDh3PIJwO2BenjTsCRU627UV+IxT0UZ4gXbtbsBrLnS4Lw3
	u0yDJ/1ZzeXeIirSN38hBQ9LY/om0D1ny5rV+aoazVcphM4Vy6XtgjTJJB7Bj/dgTQaV5Zolf1JdC
	qSYOnrtof4rcBOMbdPx6lQZs0UGLG4FbvesslmJydUFZxv0+fNCakKGmtQgWYqVBFywjUza6xsExh
	npkCKwJI4BCtv8pC39rcAJHGNH/CQ5aZ5UTTDFP8/uCS1em+xkEeCE0Ju69TlDMjnoh4h/7vKwpCB
	0VfeeGF2xH6BbniIFEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBIPL-00000007lKw-22PB;
	Wed, 13 Nov 2024 18:48:03 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBINk-00000007lEA-1w5v
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 18:48:00 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so5228865a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 10:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1731523582; x=1732128382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D2wRdlsSBS9ax/d+B0UE5nbV3Jw/KYd+JIEXiRB5bbc=;
        b=cdJrwSmFEjNO7RrEDWwPuM+vreROqeChyK5CKWEEN57zf2dcKeTPaVYv2FfCsCGxmR
         SZFxut8/GitmUT4nV2jaeFR+I9810UFCIlY0sX4vlDKBgYP9Mhv/ybqyggF48T/G8SY/
         BYHP547wJpA07tz2+psAtrxlgT8fkuzbTl0cG/kvMjZuU5YPfX57iRbqAQ+sjzkj3Kut
         23vRTOW1R7jas0WTmqFQXjy4nKyKJ44a/HbW1WyvHvjBZCN/4Bfvi/dzaWVnacn0/iIM
         WslgRLvVM5C+JcbqU/u1nhg9xJJC7M6T5Ngg0K+7fHFDvOJ5deF/BmIXQ4Yr7IYcoeCa
         T6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731523582; x=1732128382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2wRdlsSBS9ax/d+B0UE5nbV3Jw/KYd+JIEXiRB5bbc=;
        b=mpfpxPlcKOpnysbnl8wV0NbnUXsIupcb7O5D9FIjcvpm1FAdcw+JANl3pNPgQkC+xl
         hI2SI8k/LSQJ1Tf0aEhZedHtN34+kEZjvDopiVwlY+sfxMGgdMmAlFiEsGoM1Da6fHan
         VH7ydfyJ3YvBjJaXTh8e/IistShzosH+mQubIADBZWnFwBliYbPUk8tcMgGp2+bPBZb4
         sFoydFQIzrIPfKnMZGqX2K3ThXFfrfllhZj4vZf0nKpT/qBABEcXnhwnLP+4LqkSuQ0u
         7qJGdow0CcDUTdKGAoRJK3fQM/WaR8Sbj0yoDJ5ZB5leEXfDMaC19+dRTuBmVFuGIodA
         SPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3QrUtnBZgix2tOOg16am4Ith35O4s5eBjOHtD0Kv1WeQeZ7GBDEOIxXzVK4HJZReGkmNdBKiOqrz+4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya4n9jrPYLkK7GtAa5mc5SoE2n3qI3XDrpC//e8PuUcCandPPL
	nin/XgBZIX1GwI7eK22/9nLyxGjskxUXM68bvV1dUSX1YoDYWf6w3EJPv5/KkOE=
X-Google-Smtp-Source: AGHT+IEM1ntvA2Qe+V8GoBpVy79jkXEU0zzfmfqm6KOiW0FHYVA02IKJ/bQKTkVVun17yjdiIv6XBw==
X-Received: by 2002:a17:90b:1d4c:b0:2e2:b6ef:1611 with SMTP id 98e67ed59e1d1-2e9f2c90340mr4604165a91.18.1731523582686;
        Wed, 13 Nov 2024 10:46:22 -0800 (PST)
Received: from x1.tailc1103.ts.net (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3ef3521sm1777869a91.32.2024.11.13.10.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 10:46:22 -0800 (PST)
From: Drew Fustini <drew@pdp7.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: defconfig: enable pinctrl and dwmac support for TH1520
Date: Wed, 13 Nov 2024 10:43:36 -0800
Message-Id: <20241113184333.829716-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_104624_684862_563CBF03 
X-CRM114-Status: UNSURE (   8.07  )
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

Enable pinctrl and ethernet dwmac driver for the TH1520 SoC boards like
the BeagleV Ahead and the Sipeed LicheePi 4A.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
Changes in v2:
 - Switch CONFIG_DWMAC_THEAD from built-in to module


 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b4a37345703e..d26e670404b6 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -167,6 +167,7 @@ CONFIG_PINCTRL_SOPHGO_CV1800B=y
 CONFIG_PINCTRL_SOPHGO_CV1812H=y
 CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_PINCTRL_SOPHGO_SG2002=y
+CONFIG_PINCTRL_TH1520=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
@@ -242,6 +243,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_DWMAC_THEAD=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
