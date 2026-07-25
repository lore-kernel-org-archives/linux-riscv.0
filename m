Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71B8C531FC
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 01:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTcxl1pQINlTjYyIQe7FMVZv4ObbyVRHKUJlMGGM/LI=; b=KDwBoRwHfYu7UU
	AWseg1qloxfSPNsXEsBgPYroUy6h/ynfudYX6epk5K00BgDtXaUGST0ABS+nLbZE5V7Iq+7CSdecz
	1D78lLIBhQo8S8E4aOvE3hkjz6zZGvQVBdQQJtATUl1aaDo0EDKLKKnHnKPa8ECH6l4ddLlfAmNq+
	Cx7NtyQTDtcx4vQkjsv5ARXMLXpKpd/xvGqblKsNulF1bat+jOTf8jh7F23FNu175Gaa8hOHiV7jR
	QeWNxC63wneTztzLUasJrkfRea4Ly+hg1uEwW5fbkxceMV8We4kw+IX5JCdpPVqtAOENJPohDlxBL
	oVAEvFBUIPYkko4sCsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQx5-0000000HRUm-3iL3;
	Sat, 25 Jul 2026 01:13:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQx4-0000000HRUZ-07VZ
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 01:13:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1E06600AD;
	Sat, 25 Jul 2026 01:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2AA1F000E9;
	Sat, 25 Jul 2026 01:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784941996;
	bh=XzgySLzyI7kn1ZvUP96iUq3OPAcH6C94rAtubMSU488=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jA2UhvSTjA7f/EZ9Ybxev5I6gGDmT4xOd0GH5OK5qFpAMvE/dS3JPfrsvbLE2bF2o
	 /n/Hutdz18852HzCOhsfXH2Bx8EJofg98KGSl6xahzQyX+aC3c5AVXymo38yxuSuu8
	 jGmiknIyDbO8tdE9+hKxj67CaUYPBChabIptZkX/N+v1wyrgJlNkX2N0DV40LbQ4PL
	 pKtYL/npXpRkZF1mi6W3ka/lSQP8nU5xFwqsEqmib0q+ThrYvw7jmqDKkcjJ8bg4VD
	 RxuPFwfbaX8cSjD6jMxiUkToskLY/sZmM29+3RuSCUKDYlTFOJUdNfGifhEFn/Xm/N
	 bUc0tHW7GzezQ==
Date: Sat, 25 Jul 2026 01:13:14 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Message-ID: <20260725011314-GKB77474@kernel.org>
References: <20260725005804.373698-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260725005804.373698-1-inochiama@gmail.com>
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

Hi Inochi,

On 08:58 Sat 25 Jul     , Inochi Amaoto wrote:
> As reported, the phy framework can not detected the phy id correctly
> when reiniting this. So add the phy id compatible string to the
> etherenet phy, so the phy can be reinit successfully.
> 
> Note: separate this patchset as two patch for backport if necessary.
> 
> Inochi Amaoto (2):
>   riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
>   riscv: dts: spacemit: Fix phy id check for the phy on com260 board
> 
for the series, with R-B

Reviewed-by: Yixun Lan <dlan@kernel.org>

>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 3 ++-
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> --
> 2.55.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
