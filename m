Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4138ACA0FF9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 03:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M89eG4/03sqUsVKtkZLq8jKIcUnyqO1KXMUXKx8m92Q=; b=SdCmo/JBquFeJC
	V0lAmmCDn2njnSZEofgLC6XjpJ8uq/Z1Cr2Pld6jZWY86yt7nMYFlsgNNQDYlar/Hkj2WQdC5NRmN
	dg1xrbFneOobZFi+SkFij1EKZGG2L97qIm2uUkhMtOsZfSUaeM0nFhFesZvnx/Nb0LfqTHgeGm2JF
	59miqNYT0MGmxMbbplEtyc5qVh9m+40ja3JMiYz4fgGJcQu3F9h8EyrN0vZTKwCEudvnYhe+F/+2B
	KlgKblNhy0Jnk4/H+uXToMiog74luC87dOgTsly1eSJMkLou6z2C4VffC7UaU69m4ucsYnBablCkJ
	Wje2F/dEOorO6YPsTBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urTEf-0000000081R-3SLy;
	Thu, 28 Aug 2025 03:23:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSBV-0000000HaLF-01K3
	for linux-riscv@bombadil.infradead.org;
	Thu, 28 Aug 2025 02:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KyDnSuhDjQ8VOJ+mJFnTBacGVMg4yY+Nne4s1ctZDzo=; b=dlHv+ayZ5wk+SKkwCfA0KkdiTg
	/3eeFOzDUebqS+d7iXXNp8CfFOBcngMoL9ogrcwrQ6XwT5JJFMHGhpz5rEcQedulCmusNu2kTlkAD
	SHImOXudLA1TkNEIW8aHPBc+UyUbJIMdsGzXRDByDk3tqlh3sNSJqGDXHWtcOz37RByAWbZXiYQJk
	Y2c6d6DPyDUVvymm4eDLRVh2J/uSFQSeBGpvzmWO3Lyci4Yg4s9scCVIGH5hR5p3Mj7YEY3VgLsOq
	54m4srhJP+yPa466rVchFGkDpd3bL8bU+fJ+7tFa/eMrfVdxPjTqNj6G3KQrdEW0WttqDQ4R90Fch
	jRpyisLQ==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSBR-00000002brA-0awD
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 02:16:15 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-74543fea20dso486764a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 19:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347369; x=1756952169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KyDnSuhDjQ8VOJ+mJFnTBacGVMg4yY+Nne4s1ctZDzo=;
        b=gUkFjcJu24VDX6r0phvfiMNZi97nFr/mYyeX9VAp2rfYw5FQ1HXZqSJ0OsV5StbFjc
         SXwRwkzIgHbwzZMw88q8RBwWE9EY+vp7HR+DiPdgYaElcdKNaV474n4XLNUIOKf7Jl2F
         Dv0rGaBEMYvh82a3RRHVdb+/f0lU/XUqwDJY/J3oYa6WgKt1kYeIJkExjxAdUtQ6MJeE
         uTCNu7kS1jyQeZePFL2xyXOPpHOyg5um8YYydU16WPahNssD4RNxDj1TcqNRg8p/CVLr
         ZnfaFRKQxSwkjvpPpMWXckBwJkG8oX1cA8a7CCFEpHUrgRlj1kqNxAYVUG9lcVQutb5J
         RxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347369; x=1756952169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyDnSuhDjQ8VOJ+mJFnTBacGVMg4yY+Nne4s1ctZDzo=;
        b=c54+TuTT/OzqMbAZGNHBRpUWIJe/Ho+t0/7Wb0q84KZGZlst0D6xhSFpq5dX1onH5y
         yy3aDf4WTGfS2gmht+tH3ZinkOOdAbLD5GptTIh4U1rbWSM392SHJai0Nk+Pl3EZUYaw
         q54udslKCfhcuBSTcTK98LEKCxounDczj6tzRkfqk3pyq5bcQu6brDpM5lusDJlV0nhn
         yDfw2WP94IGlm+QbFyEwXsPfXE/wspVWL4pVcIUcX/efZdxU5xsxvHgJj/fDPwJe30Xg
         PQy5WpP75V5BWTL9ioBASfQEIBMOOV/7mmyoIK1PFuvjkq758ccSO+MZq4UlArvBCrJM
         i/jg==
X-Forwarded-Encrypted: i=1; AJvYcCXl9ZVmw53+qN7n2H/w8aucwRvtP9hsQgqBP8vzi/uMDHV8q6vc/ab59C55rgtaB/VAzc0lG6sAd41yIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6xbygcEF9UZtfJUas59uVAjIHgAwbYWAk6w25mdMrQAklGxv6
	2mz68EYjhXQq8FU0xOrYv7GDWCCenN3ru+Lntf1tEUNDcBoLrnvjtSfW
X-Gm-Gg: ASbGncupl+XsolKC1YQxxGrgmY+eL0BtjZUCPD8y3DOdPrR82dssuP5M1YtTLNC0KoT
	b7yOW6fqEOi6i4tldul9DX6697Vx4UkQcyDvNEi+/zbPMk3YWkcXuSoXH/nJ5TWr5i+8YF657ec
	bool7pPm7yLkFsin6u1BHj95YEWw417GX4SAPB7NUUzCdSt0BXey64hkN/TA6wjRkXsxioh3n0D
	KSjy9nN0ZDy0sjewaep6X+MSrAAmEo4IW4o66qD435+btExOHR/YGE7fKCHMwByCQYHxYP5XJue
	a5TMyQCI2GxSSKj3FH9YtjbKI4aX3awQFLITesotXO/jBbO/ICfjy3a84tS5G4h8dqz+PtoNWgl
	+EiSHKeEnPXObkGGwvInvriqzXDrUUMH+ntgfPmzWDJU=
X-Google-Smtp-Source: AGHT+IGTwvNOSas/djEs+uapV36wAJNWQmeyipG2QXZwMOf63seTufF1qhsaw+7FW+qp86Wa2UCa6g==
X-Received: by 2002:a05:6830:6b0f:b0:745:2adc:af4d with SMTP id 46e09a7af769-7452adcb1admr5051880a34.29.1756347369587;
        Wed, 27 Aug 2025 19:16:09 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7450e474c97sm3505230a34.23.2025.08.27.19.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:16:08 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 0/5] Add PCIe support to Sophgo SG2042 SoC
Date: Thu, 28 Aug 2025 10:15:58 +0800
Message-Id: <cover.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_031613_494985_72A4012E 
X-CRM114-Status: GOOD (  16.31  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Sophgo's SG2042 SoC uses Cadence PCIe core to implement RC mode.

This is a completely rewritten PCIe driver for SG2042. It inherits
some previously submitted patch codes (not merged into the upstream
mainline), but the biggest difference is that the support for
compatibility with old 32-bit PCIe devices has been removed in this
new version. This is because after discussing with community users,
we felt that there was not much demand for support for old devices,
so we made a new design based on the simplified design and practical
needs. If someone really needs to play with old devices, we can provide
them with some necessary hack patches in the downstream repository.

Since the new design is quite different from the old code, I will
release it as a new patch series. The old patch series can be found in
here [old-series].

Note, regarding [2/5] of this patchset, this fix is introduced because
the pcie->ops pointer is not filled in SG2042 PCIe driver. This is not
a must-have parameter, if we use it w/o checking will cause a null
pointer access error during runtime.

Link: https://lore.kernel.org/linux-riscv/cover.1736923025.git.unicorn_wang@outlook.com/ [old-series]

This patchset is based on v6.17-rc1.

Thanks,
Chen

---

Chen Wang (5):
  dt-bindings: pci: Add Sophgo SG2042 PCIe host
  PCI: cadence: Fix NULL pointer error for ops
  PCI: sg2042: Add Sophgo SG2042 PCIe driver
  riscv: sophgo: dts: add pcie controllers for SG2042
  riscv: sophgo: dts: enable pcie for PioneerBox

 .../bindings/pci/sophgo,sg2042-pcie-host.yaml |  66 +++++++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  66 +++++++++
 drivers/pci/controller/cadence/Kconfig        |  12 ++
 drivers/pci/controller/cadence/Makefile       |   1 +
 .../controller/cadence/pcie-cadence-host.c    |   2 +-
 drivers/pci/controller/cadence/pcie-cadence.c |   4 +-
 drivers/pci/controller/cadence/pcie-cadence.h |   6 +-
 drivers/pci/controller/cadence/pcie-sg2042.c  | 134 ++++++++++++++++++
 9 files changed, 297 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
