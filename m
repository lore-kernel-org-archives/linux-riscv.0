Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F65C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M3mtrr/qZ2e2uGL5/DtnUdb2Jr0rklovxLI2+PN3/WM=; b=uECvogrJMb1ccU
	xkighM0TLznTU8ER0uc4wPV1VrgLpkSv1jvpZAznt+ecVRmF9IDLCLhdBlljnLn7TQYHmZwtXuao4
	A6dq3ouN5KnkRNCWC51fo3dx31EkC6m22UbsDnAuNWp0A5lVfuEX5TYgLpiGdwmst9hJrQMgn9jQi
	R2UUb/ztNkBhrJhEs+fJ6vBEdVSAHBTD3inZ+DIFhTqni7gjy7lwG9fG8hnx/Gk1cJ5PGGqSsR4i+
	REXtozw5TSg/zte8tm/gwEYKJ3bVOvIWBtxuCZxdcHEJw9mRakLnPSXtxVa/WeODlBI8XWRy9uorz
	BPYDzeks1J6rzZ2nZUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGYe-00000009EHh-0VYH;
	Wed, 11 Jun 2025 08:11:40 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGI4-00000009ALH-49SK
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:54:34 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7d3862646eeso218705485a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628471; x=1750233271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFY1n8hKD7YHLP1kf7MxSpa9O55c6JB9hP3AwHqMzNA=;
        b=cbdrFMf7xsiGs1gbN+DWfYFhQK6CvybaGnOJuOxN0hvleb9Lh4SEKcpuXDxIHSzB2x
         FMm9NGM4sAcEABo2CVHFqv6ji5rAbYv7V0tyFGgFUibQHx4BC/+C4lFkD3093gbbx2ir
         m6xy4sA3etBMvqTa4Pl7CpaOhVaj85LOdiXULEb03+haHXErWwNC/yZRgf1qzJf1CNcr
         N/9UmMbx1MsS6LQ0I9JKzbNFv13NydA1n3Tp9321tW3uAGUpjraXPwYVV1se4eIdbNTe
         o1qpchk490+R/UG0IfEWESVhiU5ny+E8RNtxLmTjzJEA/VQJp2yXXZKX5uy78l9DDlEp
         Ixtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628471; x=1750233271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFY1n8hKD7YHLP1kf7MxSpa9O55c6JB9hP3AwHqMzNA=;
        b=gNpC+coA3T8sUna4cIn0EW+JCD/gU88O4hKCo/4zesCjlR8SvJDZLC6tIVyr9S8PvA
         93fnfeG6AnsB55bVTkqwvSajKsNLFxPQ40KnBl3EateIH4mFc/BGdTvyTTgrg6Lyiv1f
         vMvwkj0U9HwWF2GXrqgr2cq+tpnK2iSnHeAkiKvd+cJT1C65wmz7ccXOFDqkr/+lifQy
         Jgvj1Worqlt5s1FP8sazk/UGDxDkMaKEFaLym0eYYyDkR3+f0mLNAVlIWDlZaS71HXcC
         V8cQNgkfe/RzyXbkQDYrDAzh1eVP/JQKO8gKFarb81PF9OqcekiYgsUehBwcZyg90JIk
         zoSA==
X-Forwarded-Encrypted: i=1; AJvYcCW3tNCDVH1dSXrR8tDYdIiBQdOnIrOEmc8fF7jB8D7hbEmSePSrwKH49W2JBX7zLdUT8ebz9OF99iAWEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpY4WKKBp7XAxhKC60nOIJ7FFKjoefhZDV+SuG4sPYihvCN2/u
	N8/OFMYSNTglv/tKRuoKXa7Ov80WZ75p2GA/wTLbEWHK4y8bQrk7NqRk
X-Gm-Gg: ASbGncvYihKPLyEfZ0g50Oyna7enoACkgamE7E88CSgNHxp3rnS7NCUifqK4G2kdZXa
	47uM9KaSumGM0YTHSzMuBLlOw8r3/xDEiEGMtNDDCPuA8vBqwjhKLvEGjXeZMfOxzv2/vi8rl2Z
	OqWAfdDd0OxR91trF+n8A2Hc33sx9mSfZ84fIxIPYVSD5PykLXY5mj6qmN/BWcOerkJOQ9NMTVM
	yHotJMyVYTqtoCrfTYlrPSMut94INhxiLO/pHy/kBOy9cHDX2nh0UeJ93i5RfJEdgZ2h0caBSD7
	1EziJmXiBzkronOxB+i4eJqZcZtTHKLwefGZTw==
X-Google-Smtp-Source: AGHT+IHiEq5NOVnzdI0MVOEGferuZ6sPEJIWdas7r5sxvl6GtQWSqqWA/YtBhGlgc6evDKBd2SnF9Q==
X-Received: by 2002:a05:620a:29c9:b0:7d3:9ecc:1bd2 with SMTP id af79cd13be357-7d3a8805fe9mr315815185a.10.1749628471424;
        Wed, 11 Jun 2025 00:54:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a609092sm825539885a.65.2025.06.11.00.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:54:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Wed, 11 Jun 2025 15:53:14 +0800
Message-ID: <20250611075321.1160973-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_005433_031089_AC3C5933 
X-CRM114-Status: UNSURE (   7.95  )
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

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Changes from v2:
1. patch 3: fix wrong reset ID.

Changes from v1:
1. rebase to v6.16-rc1
2. patch 1: apply Rob's tag
3. patch 3: fix wrong reset ID

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 126 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
