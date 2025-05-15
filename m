Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D0FC3ABDD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 21:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+uU0GiPU9NhSlSkB7gLPIuBkuKs1fpPoE2XPmUqV0c=; b=S4zmKXB/+oxhVA
	2k/KYYJwvAAXspa69FocVj3UF3+pnuQDCo9Gy9lud7y2q9ATIbzZkyvvxW70oqWYllXaD1XdQPJrW
	Z+/tlz6x1t/sdfWYaVdG9trynv/iDZ7VFZhnEWkJpxOLrkZDrwyChLdWki3NdDlQ5vmqjeQeR+7GM
	DU/9ETs5Do/g7RVICcTYcJdfG5L8t15iYJX8kJ6GL6XORL3xFY43sXlDCLxlaMYRfwJ4WAz6uMrH3
	1RgG5VEQeFxsHFbaNzCoxnXbN0e9lyN/fe6DO3rj6nldoR1Vol/GQ42yPuuYWk9MJ7FBgrOKNIVI2
	O+BwvAPMOIbVsmIPv9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfoR-00000001rCH-0j3D;
	Thu, 15 May 2025 21:08:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFfoP-00000001rBA-0ymk
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 21:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55089615F2;
	Thu, 15 May 2025 21:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E78C4CEED;
	Thu, 15 May 2025 21:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747343296;
	bh=kOIuaXYXacOb8Nlq4Aidqtnio6EeKovLJb4GwnhdDkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uyxZjUvw+s8+cf9Hp4pJCB5EmT5FhFo4CQp7qZcrf5bl55P8ip45XmUK+Vfaz7aaL
	 uGAKdMKnrRvt0lRlVZiaDXOHpXw5itSfgO5SVDXUYYyUc9lpN1jw/wwIWFwMwo1lJA
	 wzAYbQGmr1C9fakKoTNKYYJCEr+cAdKWZmRskPNTR+qmzDl8bU7p5C1ll3HhTI9xdP
	 rq1L/hn4g0jOYheoM/FSSRCaCY7SaGn0HZsEgT21bakaIx3NTyRlmKXZcCmphAOSgf
	 YIoXYLYgAYGFYGrvchtjp50IfOMGcskT+98IXeWDmXkxElb04SM0gxHZRMei0CdJte
	 Xi5we58V3Kzew==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: use macros for MMC0 pins
Date: Thu, 15 May 2025 22:08:02 +0100
Message-ID: <20250515-crank-tattle-746b52ee5821@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424060605.638678-1-uwu@icenowy.me>
References: <20250424060605.638678-1-uwu@icenowy.me>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=481; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tvYL9sBfhLGwtirpWTpefPjcI+3N6MPtjEqajh06cuU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlq4Rv/7l5QdIPpR+dSk/cP5iw2F9G0+5+1/w3nGv63+ szrM8LYOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRG3sZGTa++HfbPfX571XF PM/XKJla+ylYXdaSCZbcVOdbKHPrhD8jw7VD4lcjzxucMRLfn9uSu3t/oaCRbP/Jr9r172q9JT8 9ZQEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 24 Apr 2025 14:06:05 +0800, Icenowy Zheng wrote:
> The pin names of MMC0 pinmux is defined in the pinctrl dt binding header
> associated with starfive,jh7110-pinctrl .
> 
> Include the header file and use these names instead of raw numbers for
> defining MMC0 pinmux.
> 
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: jh7110-common: use macros for MMC0 pins
      https://git.kernel.org/conor/c/71385a893cea

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
