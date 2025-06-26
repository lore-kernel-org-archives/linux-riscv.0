Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C7C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 08:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f42DSPwsBXJYAgIGMi5PGESnDTz2TsN4xRsShayTuHk=; b=naT9C3st7fwD4G
	axxlzRKsTKmo8bzJ63PMXSSbutdGCJs7Ez35AjnVNNdijtnJ156UlexPHNF0RiOljjFDrYDu8z6jL
	A9iylaXryDwZANNtRskI8STsE52oKmIwr1S+w6qfCSO1sb6qBiGuTJQTFuTxoJFX78paVpMiaM40+
	EPZVNLkdXajm9Hu/wyz7jPcP96S8j8LY9yJ4l94GwLSSeRSlkLRDQFospkXRkOTH75T22pXMc6l+0
	Ru8FwUUSyD/MLw8m+HRqKA2aE7H+R0JoctAT3meeg2Qry03t+CvIq1DM4o5gavnzIge47ZK2dBHBw
	2Z6Avxdg24ic7iQwbY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhek-0000000AtTV-0Tkz;
	Thu, 26 Jun 2025 08:08:26 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUhXh-0000000AsNL-4BuY
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 08:01:14 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso766674a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750924869; x=1751529669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MutTzljpNoSQQ8KY/Naa1K0a5hKmtznD/W4HGzANsVs=;
        b=XRDdlIi8mT8uKjqpFVnv+7/wgu3saD3y327TnHKidHW+ySxpN/XEs+labHLDA4G6Yf
         oxFWIb1zSjdG1G52T348QWV299XCkTwKKOyp6NdP2lyE0jxlICmrnhSAioC556n4e/L9
         gLI4TnkSuITdNLLXLg+yznfqM81LYlMfc7HzGY4yiAY5NpX2/oXLdYUvmWD9I0DozY9n
         lOvUiAYLwIyD8kcEWthWa64BavMTFZX5aXlIFBrcYfpMfpG1Lfs5v0DyP/ShHqSdThDc
         0Gkv/LPMF3vF+c5ue7ngETl52K8RF0ueWso4vFLQjpO8gFCQJto9KOfeE9dcNjQSbjhc
         seDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924869; x=1751529669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MutTzljpNoSQQ8KY/Naa1K0a5hKmtznD/W4HGzANsVs=;
        b=LO8ioYyJVhC8KrJFUbI4ovd8SUUGybOUAafcSZC19OHPCQUUypV4EBP6vpvDC8nsBH
         LclX4e9DAEQocZgN5WYlQ8VSEfCI5NQK7SdaUGXK2vNrFueUoH8AhyFPwpEbhL9pYbNG
         Y9935xeUYYMs8YkbPN2GJHqdiGsP8jieR0Mk0xSe6roM4fhJxGhaRsCX6eD3PciVZssv
         jJGplRn1hViHGiZz2Y8Qrz4VGqz65B1cTqPS3EiTd2KUjwIO8CVUaMWk3YCjysFE/b9u
         QVnwhguIgtH8UlJweuOJyED1nJHRfHRaJIUk+rRV5FSWsS5Vy+T5eTvRIw74C5K4ezx8
         3Q1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDh09e9Y09uPuf+a3YKbF2jv2h6qQZ2ntruVyBTXh3NXZ6+bzhTYaatH6dNoZ5k52HEPbTCNDrbsfxGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHc4Z/JtHpSlePnaWsrSlqT0leW3tihwUB9VdxjuiTpdYZJ4i+
	VIQou8mk2ZTruAWPDJxZnYSwFcxBJNX0h2tCMSBdnF3qWEBmXICohj3a
X-Gm-Gg: ASbGnct0Oqwb+Swt69aKuBQmuRYElS7dmxcJ9R5mGt8fj+tmJ03nIXQc0kXsPaB0XoN
	ZQFzZsb1/3pM4W1K4vqWs1236/C88yxYkPGIlxk3/XWes4k79OJavANtuBJ2odYZ0A1JpOXq17U
	7yqQRaU+ZiXIpjZdSaynP/K6E80Y0nlIr/wbLoaGFpqoI8xnV12BO3hOh9V7Qcp8g8r7mCIKBzb
	TS3g1u7UbUB/0fFwo7OwmfCrXMqgEQCQBBc2yUzQR4m1l0Cypldb6anmW45qR1PfXeYilOvXdC4
	9q9VLKoI2V5lr7wU7IgXEqBKfFgoGYRuBnfH+7esc1/nOmv5KgFQl9eUipBF0A==
X-Google-Smtp-Source: AGHT+IEvFHP6OohPGoe/i9ODcPd4CzHYZYohuqPcN6oUCsWyV/2LcB0WXZlgW3DjTlwzc5TunaJepw==
X-Received: by 2002:a17:90b:350e:b0:312:f54e:ba28 with SMTP id 98e67ed59e1d1-315f2689fa0mr8936538a91.24.1750924869022;
        Thu, 26 Jun 2025 01:01:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315f53f3a64sm3785918a91.48.2025.06.26.01.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:01:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v3 0/4] riscv: dts: sophgo: Add ethernet support for cv18xx
Date: Thu, 26 Jun 2025 16:00:50 +0800
Message-ID: <20250626080056.325496-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_010110_039764_73CC3C82 
X-CRM114-Status: UNSURE (   9.13  )
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

Add device binding and dts for CV18XX series SoC, this dts change series
required the reset patch [1] for the dts.

[1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com

Change from RFC v2:
- https://lore.kernel.org/all/20250623003049.574821-1-inochiama@gmail.com
1. patch 1: fix wrong binding title
2. patch 3: fix unmatched mdio bus number
3. patch 4: remove setting phy-mode and phy-handle in board dts and move
	    them into patch 3.

Change from RFC v1:
- https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
1. patch 3: switch to mdio-mux-mmioreg
2. patch 4: add configuration for Huashan Pi

Inochi Amaoto (4):
  dt-bindings: net: Add support for Sophgo CV1800 dwmac
  riscv: dts: sophgo: Add ethernet device for cv18xx
  riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
  riscv: dts: sophgo: Enable ethernet device for Huashan Pi

 .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  73 +++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |   8 ++
 3 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml

--
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
