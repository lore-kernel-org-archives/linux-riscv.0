Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23CACCD183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 00:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xf6SsJ4HAPfC6K5fIj3dZVCOhKCkOr25IwNJjRsiAog=; b=wgmD5kCbabv/3h
	pZ0J1kk9Pvg2F0i8EllJFBDBb/A5IiScO37VHqAJDJNBu2fRA56CwwP8+TR19o4v4HD6ahKT6dwn1
	pGz2D7KvA8ywzzkQQbeSOnxBY91OuzKBzyIeFxERElsFqOD1P7bSy2TLpdU77BPBybJNLAk5SkTSW
	URVkDwPcKo7SAAryB7kzrnC+nhrAFSsBJBEkTbgNYfr+61CvMGGrMeZVwl5rjcfAGevyN1HpCBu1y
	GtK4zku+1WhZVDjQ2+tzr0O3+enJQZNSlDTnpvi/TsNpRXmCmj+Vxb884VCyaTQ9tACIrcIhGbbqb
	2rcMbylCZ3+fjSDxzVhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SUL-0000000Entz-2dFk;
	Tue, 14 Oct 2025 00:02:01 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SUI-0000000Ensf-3za9
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 00:02:00 +0000
Received: from ofsar (unknown [116.232.147.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 10150340E58;
	Tue, 14 Oct 2025 00:01:50 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	mat.jonczyk@o2.pl,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Date: Tue, 14 Oct 2025 08:01:45 +0800
Message-ID: <176040002491.864314.9564488018549093381.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_170159_013701_F6D6C785 
X-CRM114-Status: UNSURE (   6.97  )
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


On Mon, 25 Aug 2025 12:20:49 -0500, Alex Elder wrote:
> The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
> converters and 12 LDOs.  It contains a load switch, ADC channels,
> GPIOs, a real-time clock, and a watchdog timer.
> 
> This series introduces a multifunction driver for the P1 PMIC as
> well as drivers for its regulators and RTC.
> 
> [...]

Applied, thanks!

[5/7] riscv: dts: spacemit: enable the i2c8 adapter
      https://github.com/spacemit-com/linux/commit/3e8d7309e6260b1d066e733bf3e2e1b6a0d3f82b
[6/7] riscv: dts: spacemit: define fixed regulators
      https://github.com/spacemit-com/linux/commit/1df07a40453fd652132051419140950d47941fe9
[7/7] riscv: dts: spacemit: define regulator constraints
      https://github.com/spacemit-com/linux/commit/09a412d397484e76588707d85ccc37f71e491091

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
