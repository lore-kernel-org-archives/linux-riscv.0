Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A73C79FBB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 21:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uwDbKsgBcV5W3SAVQDo00mHJAERGrcIGgmgeqoHgm8=; b=yJGxAj2XUPSJL7
	VipoL7/6jWlH5mR38xKfDEUK3wXddTSywJEg0KGM90+Ph5+IILDMJUDPBkM9OM31D6MdCRTn73Yhm
	hu7fdLrRp4OiVwbCyAZf8X6ArjFDWkixCcu9Ic8WKIu07DiFOeDHfGHiodTLo2Ooka8V47QuB6r5A
	RAP20U01A4B/LrpI4139GG6Lk3+o6cfiev82nk3i5eUumoLwqat1hZkvCZv0IQMoSc59uPmlI8XHK
	VI8qenlON+Cu1woP9ATWeSltBJN07ByKdct/2x4jh+KfOoFSB9LJcxusN9FnSfRIR4OuKOss946vr
	CXGiXiSMKFVaqoO5j/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mig-0000000FRy5-0kkW;
	Thu, 10 Sep 2026 21:54:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mie-0000000FRxv-2Kpm
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 21:54:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A065860200;
	Thu, 10 Sep 2026 21:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18701F000FF;
	Thu, 10 Sep 2026 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789077247;
	bh=nYeAcoA9jFFh9C8PqEV1VOBXg4x7U3Mq9X1SD9tZuNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jp26CEy7TGxzHajIK1zKX5wUVTwsbFkA3dt5KTxF33+g54wVc28gdS/LuruIDC1m0
	 b+3lxKbnzDqChUBuBLe13XTnfOTsQjVIN8swVwzqNCVNOmeh1EpVeN2k5OXWD3g5Oh
	 emF6mG17b29j3xs5F2GqWLBbaBTbsXVxHq8wvDpKfWOLSfSkIrAmeuK080HKGBvqaL
	 aFUuwCHtzc2PbLdv8TINXqhbbvWYwT+1S9XCSYKur2if1Jq+dzk3VCGlFNU8xr4ICE
	 TBki/Mw6Gtjf4Ux1Ot0K9TcaJ3ATQkeQ8K/BXBftySKIUYq+hCQFlBdwzvcdFWzVQZ
	 vTdmnZOn1pkbg==
Date: Thu, 10 Sep 2026 21:54:05 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for
 OrangePi
Message-ID: <20260910215405-GKF2346@kernel.org>
References: <20260901080010.95040-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260901080010.95040-1-amadeus@jmu.edu.cn>
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

On 16:00 Tue 01 Sep     , Chukun Pan wrote:
> Enable the i2c2 bus and add the connected GT24C02B EEPROM.
> 
> [   6.766] TlvInfo Header:
> [   6.766]    Id String:    TlvInfo
> [   6.769]    Version:      1
> [   6.772]    Total Length: 38
> [   6.775] TLV Name             Code Len Value
> [   6.779] -------------------- ---- --- -----
> [   6.783] Base MAC Address     0x24   6 .....
> [   6.788] MAC Addresses        0x2A   2 2
> [   6.792] Product Name         0x21  15 x1_orangepi-r2s
> [   6.797] Unknown              0x41   1  0x01
> [   6.801] CRC-32               0xFE   4 0xE5A74B18
> [   6.806] Checksum is valid.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> This patch depends on the following to avoid conflicts:
> https://lore.kernel.org/lkml/20260802100101.327815-1-amadeus@jmu.edu.cn/
> ---
>  .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 30 ++++++++++++++++++
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 31 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
