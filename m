Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60B1C369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 01:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b3JLoEeV3T5Gc+ey5swSHczZrIQ9T9nuYBCw+tkcSj0=; b=n33q7uorDR4CZK
	QINO3yP421UGUdUqmugVk0nk8Pi6xFLOYhZbeUuDNWqK1BHpHq5pQE44rBK/o1e6HWvPnDNlMbnZG
	a/VBDN/ofz8fct0+YgED4h7T6IOQSFnre/EiSaYnzmj2sl4ofCVa3XFEA716cuuQPNKyOnn8PQTdb
	TFlb8P31y67sV5oa74/nQSwMZIJaiq7NY9Y0G8h1Wv1s7vxxkVD774KVM2A84smaxuDlbvh+iN4Iy
	YQfp4H/L03v5TlXrTzNy7SrmTRNSaofK/WgeqsuQjaFRyqv26taYPemcHUGQWgx49RbBMh9eK0zcc
	2T7nMe7/DXfTBC0GLqFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wEF-0000000BRG9-3RgL;
	Wed, 30 Apr 2025 01:27:15 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wED-0000000BRFi-36Ij
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 01:27:14 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-47ae894e9b7so145364351cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 18:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976432; x=1746581232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qO1MORlZvAIzRB4tDNjI13tses6Kydhdwj9mXuXFn4=;
        b=h97oz8hBdRC6CpbDJziKJjxSXaDnJdgoeCGDE3pRSs7QfXF01n4mIIcXm+CpC/SvY1
         GSO59Vf4x94zB1hyegBHDgp7UhkDoIIhUnM9YYAM/C8Ecv5FCeoDZJiv1QQRxb0GPAS7
         O3aPkbY4lFBfi13WNlYN+jKjFjzIoqCHQYL7KAr1euPuTmdTDupbgHo0dU3nu6w3D54V
         lYKdxQ5Xa443DxDsD7i1DSBhzxYje8EUESFzV9td7qvWg6X8j5JDeMpgoSsGoAwbPvr7
         +GR2K/opnwrtjboWNWQV4cmR6de21OEu+BugrUYrAG+1u7jodi1Rd8BNpRzcHPYRwi7u
         9+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976432; x=1746581232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qO1MORlZvAIzRB4tDNjI13tses6Kydhdwj9mXuXFn4=;
        b=PS8OmCY2wrfzQelyE8gUIbSCWras5BkWJTG0pd/f+5lKuHX1hgm089/4oc0d3GJUrv
         QLmSbIWznpVhaJoaBmY5GHD3VXJ3iaPbovMA0O0s2spbvbalmMp2eAJK1ILxEVOY/gvN
         ao/kmNQBWPmZYWv1qWDd4Z1d9JIbBkRjmfxuCPkFzez7lvrLZ+gspp7hjjCs9yWn3beQ
         k53+EpKHm9h9ZbM47WxMocHvnBEcZOGrfVI63FP/PT5iNytwuVvWTkuaBxaD/El+4drr
         XJqKyq7JkJWX1IzHAsI/Lrc8MrU3/hTyMC2tFSoHxmYkTCf/RsKRRkOebhPMjHPaCbfj
         P8IA==
X-Forwarded-Encrypted: i=1; AJvYcCU71DRmRC39VtCaxLr1Lko26221N9NmAvVl4xSFIuY1pSU0dEqxwdiWGZzJykCkzR6+Uo064ESSFaizfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz25j7DAkuXC/VkaVoiUyoLvt1xXINWR476XIZ2ZDuCZIVBDaVa
	RRTlBlG2VGSG9zaZuDxeU3CQDrUhz2uubf4rBUBH9XPkrnzMR6jl
X-Gm-Gg: ASbGncvOlDhl04pZbLIoR/l4Gv19UZZIlikBaQpbGfsSoghOxTOuJ+oUyAd6i5cCgPs
	gJpxyslD+YkodaRKKKkDgAQmukhDOkCl5GMBDQdd2laOoIPgMqM/24YvtTZYyDdYXxBS9VjFRoL
	9i7mT2n8qJFjsx0bPoem/8r5MNNQWrMYRBceY0s0AyMXV1DMWEvdTGdqTl3VbIclunqu+wQBasu
	yMC0v9IqJu4jmboVyRLFjkfSvzyuA9YrHBGGLQ8yAU3Kb2Kbqo1cm4MBTpbcNQcNsBKBfOJ41SB
	B9QIpgSvkB5XAZ/+
X-Google-Smtp-Source: AGHT+IGMsLOIjeNBpHyXV8xdTCJ6Im3aMfl/H6Lvwc9epi9BhN+OPpNVARbbu1gwO2GJsJc9Sc/T6g==
X-Received: by 2002:a05:622a:5a06:b0:476:97d3:54f with SMTP id d75a77b69052e-489e4991b10mr12935231cf.14.1745976432132;
        Tue, 29 Apr 2025 18:27:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9eaf4d46sm86963441cf.14.2025.04.29.18.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:11 -0700 (PDT)
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
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/4] riscv: sophgo: cv18xx: dts rework, part 1
Date: Wed, 30 Apr 2025 09:26:49 +0800
Message-ID: <20250430012654.235830-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_182713_779967_77DD0287 
X-CRM114-Status: UNSURE (   8.10  )
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

It is a hard time to maintain cv18xx/sg200x device tree file, as
it uses something that dts override, shared peripheral header
and something hard to migrate arm64 arch. So it is time to rework
the device tree file and reduce potential problems.

The part 1 change mainly focus on the format of the current dts
file, and try to make them easy to understand and adpat for the
arm64 arch.

Inochi Amaoto (4):
  riscv: dts: sophgo: Move all soc specific device into soc dtsi file
  riscv: dts: sophgo: Move riscv cpu definition to a separate file
  riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
  riscv: dts: sopgho: use SOC_PERIPHERAL_IRQ to calculate interrupt
    number

 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 43 ++++++---
 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi   | 36 +++++++
 .../dts/sophgo/{cv18xx.dtsi => cv180x.dtsi}   | 95 +++++--------------
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 43 ++++++---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        | 43 ++++++---
 6 files changed, 149 insertions(+), 113 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
 rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} (75%)

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
