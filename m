Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F81E98FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 03:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpihUc/rwsGBPOaLVMtPqFnax1mv56293EgYqjJcPnU=; b=Rv62O+9ZO3uzMR
	5Cnzy+8etN6h9gpYCds1qO+PbTJqdJ2WiiEiEL7oqtWZAd5Vl5OAg8kNQVKVQFWbDOQeVvB2y3cVB
	SMQ97bvl1QYV8LqTmmArxqx4vuiS2OKd+isiD72AoFPA5l05wMBi302//FWX24L7DO1llQyxPHUpt
	7nNaOWe/VKdIoxyookzpmohLwwBKgpKOf/dzJPFEzDL+cxDBlBd95kM2PUG3R2gEHHWcrQoTJNAfv
	4l5GAoXx1tIvE8kRZFre/Y3eXyYY8xhfZYT1g6TL7kD5J9heulkAcudj3K9vNLgFBZcJKzXFP7LZJ
	fl9UYHrtU2DV7GkPXGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAgFO-00000009fMA-08BB;
	Thu, 09 Apr 2026 03:40:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAgFN-00000009fLg-1Pr2
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 03:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74DFE600CB;
	Thu,  9 Apr 2026 03:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A57EC4CEF7;
	Thu,  9 Apr 2026 03:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775706000;
	bh=l2mXjVQl1N+fo2+/ND1bzoMtST0s0hnl9zlj9/pnvXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RF6ZDNhq/uzkUGkBrbRrXwQBZFHM3u5keoQwYZW2T9kCUej++gZlOtkBkI6l5C4mV
	 Ih3wgIuG/QjYqa6yyZXOAZ6h3w2x3ephPVe357Zrqpd0ZeFFPKnTbOB5D5zL0XG9bz
	 SelewoXwXIQZqEQQAWXC1f6X+vd+Q51wBfWaV1FWcHjbVkeTb49b4xWHWaRGB/kV6v
	 2aERolbaF8OBUuEUYuK2MXz5J6EVYaaopDEwNWmpZhmKLYO25QuVc4Kw0Mn85JXGh4
	 /JrwyaZjEhsHUbrcqNj1qOKfphhk5xmv8r7vp2CfS8FutVOe5i8xzoAfupW8fDymLt
	 F4furoxPOciuA==
Date: Thu, 9 Apr 2026 11:39:57 +0800
From: Yixun Lan <dlan@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v10 0/3] riscv: dts: spacemit: Add PMIC regulators usb
 pcie
Message-ID: <20260409033957-GKA1143689@kernel.org>
References: <cover.1775575436.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1775575436.git.gaohan@iscas.ac.cn>
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

Hi Han,

On 23:28 Tue 07 Apr     , Han Gao wrote:
> Changes in v10:
>  - patch 3:
>    add vin-supply in pcie_vcc3v3
>    reorder vcc5v0_usb30
>    remove vpcie3v3-supply form pcie1
>  - Link to v9: https://lore.kernel.org/linux-riscv/cover.1775417019.git.gaohan@iscas.ac.cn
You should keep all ChangeLog versions, which easy for people to review
backwards, but this isn't a big problem..

> 
> Han Gao (3):
>   riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
>   riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
>   riscv: dts: spacemit: Enable USB3.0/PCIe on OrangePi RV2
> 
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 217 ++++++++++++++++++
>  1 file changed, 217 insertions(+)
> 
> 
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> prerequisite-patch-id: ef6e9c7b5854d0c08066b72f9a7868db8c2140eb
> prerequisite-patch-id: cfe3800f8c791ec4c63e070af9628e88e0fc31b9
> prerequisite-patch-id: b76493e625ae257c8adcd67874178458420e4d47
> prerequisite-patch-id: 88e01dc92c83bd88ddeb78891d3088209fed8d6b
> prerequisite-patch-id: 60336d10ab8322c70596d0f046b6b5c54bb24b54
> prerequisite-patch-id: 68c4d869548687dc115dd91e2ffb8f4c11482d86
> prerequisite-patch-id: fdadcf964c2cb3406160edb579d99a8d5695f8e6
> prerequisite-patch-id: 73b9e745338b0499b849fa4f7f9508987ab39a59
> prerequisite-patch-id: cd26770c2160c3c31a406bd8a6b01ab666180ae0
> prerequisite-patch-id: e5dfddc32cefae195692da8b80e19adf086e4ad7
> prerequisite-patch-id: 7fd53cbe4977598f26148a4bb1cf692bbdb79a09
> prerequisite-patch-id: 96ebac57bb29619b97fe95422206a685825618e9
> prerequisite-patch-id: 00fac16b52f60383db3140e2885f3f7f8d14dd1a
> prerequisite-patch-id: 3b7a60047b922c48e93599f621cb738856f42354
> prerequisite-patch-id: 275c030b963be05dd1041451f539a130ce614277
> prerequisite-patch-id: 93963424b0871e64276af0e0b2199b52e29b4603
> prerequisite-patch-id: 8383188b1c01ed6280629faaa29c37d699ade241
> prerequisite-patch-id: 5f8126b912b924d63d4a1e0c5eb42d212eb0d369
> prerequisite-patch-id: e80af628a2e0b5f2eeb3cb1b5e7133d08bdd2c4e
> prerequisite-patch-id: 0234a6dca15eb91f98a45a46604ce5b4935048a5
I beliew all dependencies are queued already, and those "prerequisite-patch-id"
are rather hard for people to review (I know it's b4 do this conversion),
I would prefer listing them directly in the cover letter

Anyway, I'm ok with this version, so here

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
