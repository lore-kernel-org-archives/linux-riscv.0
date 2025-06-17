Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB962C71155
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 05:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08IMhL6DgrBkeUE6ZsXLWS/hyXA9vVlIGCSJVZxG0hs=; b=iZTBkNtyXX9LI2
	xhxPi7HJOCDbmo/lI8+alnU/chuyBrcTMy04apyuWNV4qwyCWtEsovNkx7nxG0kac7EcJE03KfPp4
	IfzYMDDMTSfNDqNmHCeaz++pbUwqIkK6wYzrfRHhjLdEHfQUYpzKAGg68SBYnw7jo3q9ktnkM5ltD
	DDB9u97yQTtcvhm8njEv8Xtt5nnNo9JEirYoMc8TT9eW7efpTgJS/Bxyf179KnGtoETj9JcGefSA+
	ctN/0U8YQNTxukh0e12hcBDlmbIspvcCAzFvZVh3WALL/vr7dtQubmJ3u+IIeJeKWbMe3/LkTmu9H
	B1CFhbfDAGjusNcUgUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROYy-00000006DeR-2xTx;
	Tue, 17 Jun 2025 05:08:48 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROYv-00000006Ddh-1ilS
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 05:08:46 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b2fb8226e1cso5940062a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 22:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750136924; x=1750741724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8a5FK3kQzpqiKJGUPwyQmhurnkoWDXPmVMG0kYx2X4=;
        b=CdVWwQuKFSFbRjM8f7o2rZukUqp//xxbLK23WnzQCAxvhJYc6eQuI1ltoAvTSypiHR
         RGW6jEbFs/HOMLTZsEoIdhvKk1zSHS51elQ4yv1L74QEY/AlnVb+rBvLa7Aff+Quo9Lg
         I3HNdlqREwnVnMRebgnE/NoDqYCEPeLy/gfxvODsxOUYAdA3uqPnzLWABqc3cmwJGbRi
         K7RYHTPd5NxMS9F+uJS+SC1T898uQ9inF6xcESZEfN2294fdXJchnLBz3DsQuNzm3ELq
         XUJ23mk6nU6qc1Bbq/xqYwwaykr+mmoD2Gne2lvzvyKF7+CEtcZcEWafD8iNffRezgdX
         2kCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750136924; x=1750741724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8a5FK3kQzpqiKJGUPwyQmhurnkoWDXPmVMG0kYx2X4=;
        b=kLPVEiROcG4BiTdTVCtWt+ho5k/f6e66xCRSqZ75F4S26w7nq9qI6+QoidtdLrqafN
         oRYqDLg+Inw6hcTQYjnvLR5QqwVXsx2FagE80DKGD05JPjbc7UbBlMUYI9yMT0NL9cwX
         7aLmtdz1S0fgNU4r0EGZ6iv56e3Gvy26SHb7/YtnQF5Snq+38D7D+4XFGQOLi240J5TZ
         UWoayFQ+BbJgw7bhXfeoJ38jjvpY0Fbb00fuo8r/N6jwA5gU2J4CaNcKmWMgRRUYXb35
         +VsHbiRU4W3V3beX0Na2OLL5akOLmTm/WPHYsI5/Hq54SDNpR0B4bHGASlkDi+tStxd4
         2Qsw==
X-Forwarded-Encrypted: i=1; AJvYcCUCan6XA7wabw2bgfBc1Hz6d1zDA4hzJcbucb8CMfzXpE9eB2KR0QUU2zOWonPO0dwuwyaiLIv5xcusIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5+OuSpcLsnflOZgdEdvgP6JiiX6tmWmidV1oEWMBNMZh94mSa
	H7GfPeVEWJVXBnEVIagoK9dGwgDWI1f1kPaZSmmCANDeDA0cmHRDDPwq
X-Gm-Gg: ASbGncubWbgcvyVGeIWXxi1rSOccKdftO/SfD4NINPGmUvRRZMLY59pIPXJSlqsh8YU
	H3SS1Pnok4j1PXmkkL0XhYPNzpszZugKJiNM27AY4QjzN3NFq68rgXYfjTINwOuqLwWeb607813
	dVE3/9DkCM+b/ogklG965WFcVGMUT8sBURTNsfKQ6XlxVvvW2+gVFe5rdJWs4bWjm4Mp6NHh4P2
	do7zPs+e+QMunJ5Fo8VwW41HIn5yI99uzeetdgqLtrGr+26ZPly4wBQbT/ixpLsUFnbJF5eeveK
	4ZxB2TLR6lo9EWrVUQ/aL1E7ggbSV//ix6rVknmEvZlvy34oR8iVBV+meZJ8cg==
X-Google-Smtp-Source: AGHT+IEssrqaSfoOP/FGQlXeEDhOtAtWAeKGb5++EjqTQbQnP1cJDjcvN7caFzDjVdHbkmrf/+DupA==
X-Received: by 2002:a17:902:cec4:b0:231:9817:6ec1 with SMTP id d9443c01a7336-2366ae551a4mr176657755ad.17.1750136924089;
        Mon, 16 Jun 2025 22:08:44 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a4d6csm70981135ad.88.2025.06.16.22.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 22:08:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 00/11] riscv: sophgo: sg2044: add DTS support for all available devices
Date: Tue, 17 Jun 2025 13:07:21 +0800
Message-ID: <175013680588.1018298.5174289579188996071.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_220845_451003_9ED980CC 
X-CRM114-Status: UNSURE (   7.94  )
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

On Mon, 09 Jun 2025 07:28:24 +0800, Inochi Amaoto wrote:
> As the clock driver for SG2044 got merged, it is possible to add
> dts node for all support devices of SG2044.
> 
> Inochi Amaoto (9):
>   riscv: dts: sophgo: sg2044: Add system controller device
>   riscv: dts: sophgo: sg2044: Add clock controller device
>   riscv: dts: sophgo: sg2044: Add GPIO device
>   riscv: dts: sophgo: sg2044: Add I2C device
>   riscv: dts: sophgo: sg2044: add DMA controller device
>   riscv: dts: sophgo: sg2044: Add MMC controller device
>   riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
>   riscv: dts: sophgo: sg2044: Add ethernet control device
>   riscv: dts: sophgo: sg2044: Add pinctrl device
> 
> [...]

Applied to for-next, thanks!

[01/11] riscv: dts: sophgo: sg2044: Add system controller device
        https://github.com/sophgo/linux/commit/50fa2633c143d857a68128da387e0bb09c6cd362
[02/11] riscv: dts: sophgo: sg2044: Add clock controller device
        https://github.com/sophgo/linux/commit/acd836a65b8cdebb007df0c3e08ac5710f0994e7
[03/11] riscv: dts: sophgo: sg2044: Add GPIO device
        https://github.com/sophgo/linux/commit/8fc13510b3540481d291e28172b41b571ea078c2
[04/11] riscv: dts: sophgo: sg2044: Add I2C device
        https://github.com/sophgo/linux/commit/b0d0b60bc906160aa3a1654de82c24bd55a801b3
[05/11] riscv: dts: sophgo: sg2044: add DMA controller device
        https://github.com/sophgo/linux/commit/e40105024f078269a9729f7488945c11f4f3422e
[06/11] riscv: dts: sophgo: sg2044: Add MMC controller device
        https://github.com/sophgo/linux/commit/4a678cc75d580a6478bcfae60907fa732d485368
[07/11] riscv: dts: sophgo: sophgo-srd3-10: add HWMON MCU device
        https://github.com/sophgo/linux/commit/62d6db9792ff7ddec27a61df8223395b22860c0d
[08/11] riscv: dts: sophgo: sg2044: Add ethernet control device
        https://github.com/sophgo/linux/commit/67970c99f040c3e26677178f323993ddf11cab1c
[09/11] riscv: dts: sophgo: sg2044: Add pinctrl device
        https://github.com/sophgo/linux/commit/d32d3c657f4f8b45ace6dbdb48ad602fc9a44be8
[10/11] riscv: dts: sophgo: add SG2044 SPI NOR controller driver
        https://github.com/sophgo/linux/commit/502ade8b6fd981ba3694000e684686954d73c3bb
[11/11] riscv: dts: sophgo: add pwm controller for SG2044
        https://github.com/sophgo/linux/commit/ea389214c01b2767ed2bbd4e9a03573394b33fd3

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
