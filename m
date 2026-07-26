Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EED7C531CC
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 08:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7QXc+8M011yCGJ+icE0da+pRcF0Hiwh7YxHRsiqsoU=; b=zKr3JokTiHQ1dH
	ylEmqHYsi8yKOwEe/tBqf/q8FVlA/EzBQe36ak7SjGHMh6SVfJ/acbDX4jPTQHo1ggtCeNzKTBJ8l
	AsQFkRrYwMfnVyPoYtVvlFSwX+Zwk1yCBAK5hvDuVDgv7fUMEpipj2+YBzmPECPA7a9tS5OMQFPJQ
	zSaC/o0sD5ceka3IBvkfco4mfrGQK/IqyPlnTotgCjIrupm50KWbIZ5OwZ7hwMB//QSDdwKF63HYr
	IB8GowlnnnKWQSkhXi3roUlSe/e9WuXzlCLZ3/rwPWcBoGyTOpCWkY7r87oiHmAWqI9WZ/fwuPZ7w
	GqXgyB2zRib4JATDUCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wntmk-00000000ziq-3M8A;
	Sun, 26 Jul 2026 08:00:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wntmj-00000000zii-1X5W
	for linux-riscv@lists.infradead.org;
	Sun, 26 Jul 2026 08:00:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D4894025E;
	Sun, 26 Jul 2026 08:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602261F00A3A;
	Sun, 26 Jul 2026 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785052829;
	bh=DbMwK3pSQLlciY/1LkRLxZkGV9EuGsQ5BZXVpfHEy0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qc+vVnPD/3jcCWqnk+iBw6I4PSTH0jzX1eG9hCIEeDt9EqHoxvqttQsA4zUZf0Syx
	 pN9s8/PZulQ2nFzSqwa4Z/hJ8KpOtJnEfc9X6Ea8IGoVwH/7L341JcRW6Pr3qnRkC7
	 4s8cW2mkh7OyHSl4VUu9KIOgh8RBDhpBHWs4S/DhKnXCwiMQD95lAQec95SoMODb2p
	 mOF5g0Aa5w5ZzmHj5x8w07YmzdG3ED9VC8/50RY/0j/MoY2i2HUeXenk1m8/8zCTDf
	 ncEjl5+BF1YPZk7VveBbryjaYSXRRUtUam0H0wAXswqoA6VQaJmieeunY+1IUHYesr
	 gBgWwQ+F6gaqg==
Date: Sun, 26 Jul 2026 08:00:27 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Message-ID: <20260726080027-GKH77545@kernel.org>
References: <20260725233351.55004-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260725233351.55004-1-inochiama@gmail.com>
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

On 07:33 Sun 26 Jul     , Inochi Amaoto wrote:
> As reported, the phy framework can not detected the phy id correctly
> when re-initialize this. So add the phy id compatible string to the
> etherenet phy, so the phy can be reinit successfully.
> 
> Note: separate this patchset as two patch for backport if necessary.
> 
> Changed from v1:
> - https://lore.kernel.org/spacemit/20260725005804.373698-1-inochiama@gmail.com
> 1. Remove all the c22 fallback compatible.

Reviewed-by: Yixun Lan <dlan@kernel.org>

> 
> Inochi Amaoto (2):
>   riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
>   riscv: dts: spacemit: Fix phy id check for the phy on com260 board
> 
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
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
