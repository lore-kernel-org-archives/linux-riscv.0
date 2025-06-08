Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D07C5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jd3UmKtBnXnv0QYYejwOProFwdU5faKyRDog6kQvtig=; b=DbWsD1HmVu5Z8W
	GR8aZo97Lx/CeHM0qJj3su35WICSDliAHlV/388ppx/Neo37GtPIerOHk+oOsfyycG/9mtvOPNDSX
	JHj35ygD32gOwsezty8lqVlvF970rizto/EhmScmpu0FVQEwDzJ5B5VESJNc/11X4uwUkibVdcQ74
	hD8XkFIkTEGRsjTNEius5yskO46ov2GJBvVDGc2dl0DX7UxZFyeoj31MJGTP6L5JcCR4Ct8Q1EtOo
	Pv7/QRPiS6Bkh70bFucu37HCnCTXZaQ7h/Ox+XWD8KwCCH5BzOAI34aaQZiG4VDnhh1yLyc1mCvFq
	farzVyX/caPwjmckFw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPST-000000037Be-1yQZ;
	Sun, 08 Jun 2025 23:29:45 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSR-000000037BK-2gMK
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:29:44 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fabb948e5aso40678566d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425382; x=1750030182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SU8RawjSZdNZIx5mCZErc6Hx9E5djpvdZZjZt5itdtY=;
        b=IgEQrhj7MLrP9To4s402u3gcm0MuyAosE2vE5cA5EPYr5teGgCkO6YHNtmO2q2elXw
         PJX764VkQ09BejtOJJFOfju91QHXBlva5QIfZfLyAMxowZwRSnUncjYwxU5K8TsGAm1b
         YZQxzz8viEY0pY6FdMmYsCfCIUW4RpH2CdSpP+YysmTOhBc30Ys0mIU+2W4epRfjmUkg
         tsmKrrkYnCMI5E+eiQUJwGFmpjSdzxP7mElr8dSTPfVEbwNEnlqims344IHdWZV0NkH0
         TOyf9j9GmpOXpv3tchdPDrNsDD8zRlDNg86Rci9MO8xnDGUFfSHs2oT9ymC72UvXifDE
         5sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425382; x=1750030182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SU8RawjSZdNZIx5mCZErc6Hx9E5djpvdZZjZt5itdtY=;
        b=Ild0gKDB1TZfxHc9AH9qcms7tmqW9ev+lQZJ+cZzQUygdcM577q6soGdLWrSHMaWz4
         tBsOQmwaMV4kMoPdWe1IRqJNyp0Y2eGa4HtnA71xdPEY4znO+seo6YScm3ILuhX8zolM
         6R+Zd+r7l0jNm7hgCfmvD1b6F0L3Xxk+mWus8ZmOYGBK0S/59nnCPAWy89ePETevLQeG
         XciEhQ9ol0v2q329gi2yeDLBri/DrdIw49Rcf84zhI8RJsZ8IwUJkq4fnh+hsdG6Go5H
         G9hPf/7WGJiVmCWhiQn/uxRfjwaru1poEQBlXwa20JonT7ZwAlnwPXnjx6gsKSQW7oKy
         ECVw==
X-Forwarded-Encrypted: i=1; AJvYcCXU/93xTsN9t/QtKMlf32eXVRtU9fWtiq08JiWtJobZvRqHdArxdpYDy565+bTM+pAXt/M+LRnkzkVDdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMxCvdvGwAmiIFWNi7NpVqvcqAMigNI2iY4PznoffasQEsy4hW
	O8j+5VBF6tZ1leXit8kp+55zerKR9PXDUG6IrupT8ZKe+dvlzc4QIkEb
X-Gm-Gg: ASbGncu2qNbPkcVHEUMfwV1adDDM1gR0vEJwGWJ4YPUmxVP6BJJUZD2dDVwItvg+9PQ
	WT/sIg8ap8K4bnzWvWGjWnG/hSNA4c1rBcJ5DFrAAY3dySVN8xRsjtX0F4L+5YdAn2V5SPqhj7n
	dGICMV1DimEVCYG7KVm6Yl+1JQoi04vuFaggOzBXvEi8J26qI3z+jyUH2c3smAPMm4dxZyKu63R
	RfjmoPwo1FQIUsG3qx3SI0lDu80t9ZH+oCtVTRB6+W/6zwhYGCG3lZCo64UjfXgEbOMg2jo3muv
	i+46OUAsUbVkQLgx1cvYdgf00mM2pu89FP1jRg==
X-Google-Smtp-Source: AGHT+IGptkGsilp0rjRsjr4k4/JNTYB2bLGg6xQxJeSBP2iNfrPSLopfC8ZXQso4Bk3xGJqa+Kzo+A==
X-Received: by 2002:ad4:5ded:0:b0:6fa:fc96:d10a with SMTP id 6a1803df08f44-6fb08ff86f4mr198607016d6.27.1749425382538;
        Sun, 08 Jun 2025 16:29:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac85a8sm43748866d6.35.2025.06.08.16.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:42 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 00/11] riscv: sophgo: sg2044: add DTS support for all available devices
Date: Mon,  9 Jun 2025 07:28:24 +0800
Message-ID: <20250608232836.784737-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162943_698741_071FD04D 
X-CRM114-Status: UNSURE (   6.93  )
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

As the clock driver for SG2044 got merged, it is possible to add
dts node for all support devices of SG2044.

Inochi Amaoto (9):
  riscv: dts: sophgo: sg2044: Add system controller device
  riscv: dts: sophgo: sg2044: Add clock controller device
  riscv: dts: sophgo: sg2044: Add GPIO device
  riscv: dts: sophgo: sg2044: Add I2C device
  riscv: dts: sophgo: sg2044: add DMA controller device
  riscv: dts: sophgo: sg2044: Add MMC controller device
  riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
  riscv: dts: sophgo: sg2044: Add ethernet control device
  riscv: dts: sophgo: sg2044: Add pinctrl device

Longbin Li (2):
  riscv: dts: sophgo: add SG2044 SPI NOR controller driver
  riscv: dts: sophgo: add pwm controller for SG2044

 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  48 +++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 313 ++++++++++++++++++
 2 files changed, 361 insertions(+)

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
