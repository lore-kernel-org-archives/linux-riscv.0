Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5635FCCF9EA
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 00:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2v6c5AvWgRzLOdsFRL8Fk8jBk46vUQQ0Xa6DoDnZcx4=; b=PHZyWYb2Q75fxm
	RLlI4TH0euj2j5AodoHBEEeMbz03u5HesF7FbdyUvIPp3Y51jsHWdYyLBroKc6rzT7UGY4OI3/qWa
	XQdzXjaRZEvUOSKBl/Vi7Xmu9JqAcAOBtt5xidCp9BgbmquhSAHPutzqqcwSbauXifcnr3r823DgF
	Yrt3EhEOTS9+po5/HZxIxP+1caW7FPzzgCErqbK+I6eI3ygIHvkYc5mpMjdloi6v3EHK2kn1r4M6Y
	zvk8M1R/648oXFNSft+okmohXNouDYDv1hcYQEaFFatAaeFEpEwCUHRb6wqvDRw8NjBMVJM/iOeeV
	LJ+qR5ZbT5nrhHCD3mRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtmt-0000000GqGe-197I;
	Wed, 29 Oct 2025 00:11:39 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtmo-0000000GqFf-0a9X
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 00:11:38 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-87c1ceac7d7so66836846d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 17:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696693; x=1762301493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCyTfqDCHwiXjxLeCItWxd8e7Ei2d6bvYTfbpnxDRG0=;
        b=TzfO7btT1+OyaFADDFRxkHeFs2bKcMcq/yzflMI6V8ScGHVv/3cbFFMOce64KfuOzw
         I0eja9w7EKAupkbcnSgYZO453KlQF/83mVGjOEN23wmyY7Ovnm/n4ydqhUzTtb2pWav/
         3Mb3ZePX/Il3ISxLEXJ94R/1BLh4ogyeJCXP2QijmNtqyP/uYGvMOj3Q37y3TDzH0WIX
         LxLUVO/2PkI102fUz3ctFZras4gxiws8wr/4371pZJq2ImSDH4xNxTRq8LLy6lE/haY+
         Y7S8Qo4dL+DSh1DUmkDYTbRAVlBDGBD2caPrsX0mRKfJuSowuTXtJ8s15BqPOef8A6xS
         7DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696693; x=1762301493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCyTfqDCHwiXjxLeCItWxd8e7Ei2d6bvYTfbpnxDRG0=;
        b=Gzu7cVwfrX2kwYx7Qajbkwk6V/Mm+qVTAk3rra/+focE5pHGVViZyek7ZdMIWx4B+O
         NZlJS1FtFKd/LOHTTGy+u2hbUWsTuiQ8EcVvV87JhF+Tp+uRR68KG1SlRyKcth/8SxmZ
         ZZpn2Odof4piwkPfhW+F//Z4dizScrs+l1QP7nD2L7OB0pk5Si1mxe0MsdLDm3IzqZz5
         i3Wt+KkP0PHFubk1tF0WVpJ+OTdM9tOwm0xwSkbnKGzv0Ozi5K+0saMyq56ZxB4VamHx
         5SI2pUMrhL3mUBAwoBtTpYQ4NW6+NfP7JsOjgwuoUk8c/pSdyJ2gmGVHHOOVlBJrpmKu
         T3/A==
X-Forwarded-Encrypted: i=1; AJvYcCW+33ZPKHCMs5vsk0+UIk2ss4S5iods4bSgO38GnalDdic4P7WZkCoyDJiKZWmfNArZbfB0GLtnFpoqbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkTY3WfNfz3IXErrFAbLJc198z8LHVlty3BGrP5jzykMTK5dv3
	gcbcAUUaU8EQWhIc8ObsxAy+fgl5au3XM/8OuqkwYHgWs8FNoVYZ9ZYm
X-Gm-Gg: ASbGncsMiGmkpgxc82IUN9BoZdfCfSEoJUwWPe+oCn6iv4tuk+Xim54zRniFWCjFwf3
	6RinYXBlrpV1zmAHWzMAvRVwaFoeMBW+CnZiky8g01QL1ySw/2g05jS4HOUunJCh5IUOnKIRRBN
	f97Q5msXWPVRAXAp0wscqqL7mbCxXJS39YFRHqxwgC3rz95GIEal9psYlgbUBuLDpWXUtTN4O+S
	mVWzBt4+shO7CFXDZBhZUUx4xEEcghsBoRgx6X9W/TDJ2SIXlbw0P277kA0LqxQaVta7f4/cDwR
	w7UGQaU3BZ2WLtEtEZ0DZ5hzAYGj87L3A8+Whr/JU9ZwNcLHfRMYbtgsG0oLchB3v2J46ODU/4r
	hIy2HxSLpJ99v6sYMJ+5k6yNHWj8dYT9ewau+iKxmNajbQkt52gTeEQWGeqAFm4dtmHmUawHO2y
	P1hd0h+Ljji6d8T2A9uRFuBZ/APaOV6JA3ag==
X-Google-Smtp-Source: AGHT+IFTRnQ6IrBjTxaybv1yiOJZzNf1V38jNNEKvU4+MUeC78yIhbKYR0O/Jah2TP3guOgTGOtWEw==
X-Received: by 2002:a05:6214:242f:b0:87d:f2e9:488 with SMTP id 6a1803df08f44-88009acdd94mr12733766d6.11.1761696692917;
        Tue, 28 Oct 2025 17:11:32 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:32 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/5] Add initial Milk-V Duo S board support
Date: Tue, 28 Oct 2025 20:10:47 -0400
Message-ID: <20251029001052.36774-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_171134_185946_15E6F3B7 
X-CRM114-Status: GOOD (  11.87  )
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

This adds an initial device tree for the Milk-V Duo S board
with support for reading from the SD card and network over
Ethernet. This is continued work from Michael Opdenacker's
v6 series [1] on the ARM64 and RISCV side. It has been
tested with ARM64 and RISCV64 to boot from an SD card, have
networking, and read I2C slave devices over i2c4.

v3
- Added sg2000 interrupt controller and timer to documentation
- Added sg2000.dtsi for RISCV and moved DTS over to use it
- remove devices from DTS's to match what is available in the
  default pinmux config. spi0-2, i2c0-3, uart1-4
- Added i2c4 and spi3 aliases

v2: http
s://lore.kernel.org/sophgo/20251011014811.28521-1-josh.milas@gmail.com/
- Made new entry in docs to avoid DTC error
- "Milk-V DuoS" -> "Milk-V Duo S"
- Sorting of aliases
- Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
  to device tree matching what is available on the pinout [2]
- Added riscv device tree

v1: https://lore.kernel.org/sophgo/20250927173619.89768-1-josh.milas@gmail.com/

Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]
Link: https://milkv.io/duo-s/duos-pinout.webp [2]

Joshua Milas (5):
  dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
  arm64: dts: sophgo: add initial Milk-V Duo S board support
  dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
  riscv64: dts: sophgo: add SG2000 dtsi
  riscv64: dts: sophgo: add initial Milk-V Duo S board support

 .../sifive,plic-1.0.0.yaml                    |  1 +
 .../bindings/soc/sophgo/sophgo.yaml           |  4 +
 .../bindings/timer/sifive,clint.yaml          |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 80 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 80 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2000.dtsi        | 53 ++++++++++++
 8 files changed, 221 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi


base-commit: 0251a1deaec78252cb311fc8305d3670bc5eee0e
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
