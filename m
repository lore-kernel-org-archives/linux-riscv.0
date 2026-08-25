Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535CAC61DB9
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 22:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtbU57oLQVITtJAfKZNXmdliBIbYc25/HGFd0eX+CX8=; b=meNaTzEusVw8Xr
	aJG93BUGcMX0hZATJoD1czuNRtbuNcS4cmbCuMUIHmI/qi+RTGhhumn8r4OaP9ROaX/H1BUWDK9Xq
	674509mdUXgIG36+0yaHqpM31uDYmDVfXxe3ech9EDHK9ZkJL9tClTFG+xEgfBahKOnaM0R05eSMb
	URMoPOhLvhQQrkBPQ9DV3rHhkzv/Af4gwtKFrOK2P7MQHg0hNkeN7RyOIlE+UsqGW+bx89ezXCgne
	dm0E2j6jFf4HkBDqQDGpRjCPbfuZlUC6RE5S/BuiWK/cOhhgv9NO+i4ZbgnhGb4oHXj4f45wNoToe
	JBhefZONP8hpQqdDa21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyzcZ-00000001cVQ-0XZE;
	Tue, 25 Aug 2026 22:27:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyzcY-00000001cUy-19SB;
	Tue, 25 Aug 2026 22:27:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C62D843265;
	Tue, 25 Aug 2026 22:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FEF1F000E9;
	Tue, 25 Aug 2026 22:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787696872;
	bh=23zDuFbp1Nf4XV/PnWdKgzGKEz+YbDJhZVzaG+CUuVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YxLCwTlo0rpEB7nZlQubsGWLQTi57rYYTY3iZu6GHt0w8Gz8+7X27lU2mfC9Bi68J
	 Hy0oiNleAj1gxYtdYI8N6zq+THAdjiTRc14/81hrdkhv6R0BZzJBSdo3ykSGZf8T8Q
	 Bwslvb0eTkJTZ8X0EfAvCE1arDtgTrPr5RycdZygZK1x3AHi36gebHzkAoiiVW931q
	 Z+vLP+usQa4AQC/7d+NBXb5sQeqJjkINJbxLRJLrdBKv/i3Rg87xfqA6OOXfoV5LMq
	 MTxknVS/40HI9lPkxHAMIz9POmDoZ44WvBfJqzKH09Q/eCLAMgW41sUEdpRtImD2V1
	 SdnEfWwkXxkCw==
Date: Tue, 25 Aug 2026 22:27:50 +0000
From: Yixun Lan <dlan@kernel.org>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ze Huang <huang.ze@linux.dev>, Alex Elder <elder@riscstar.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: spacemit: enable K1 USB 2.0 PHY by default on
 ARCH_SPACEMIT
Message-ID: <20260825222750-GKB631715@kernel.org>
References: <20260825052158.66367-1-bbanelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825052158.66367-1-bbanelli@gmail.com>
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

Hi Bruno,

On 07:21 Tue 25 Aug     , Bruno Banelli wrote:
> PHY_SPACEMIT_K1_PCIE has "default ARCH_SPACEMIT", but
> PHY_SPACEMIT_K1_USB2, twelve lines below it in the same file, does not.
> Since the symbol is also absent from arch/riscv/configs/defconfig, a
> plain "make defconfig" build for a SpacemiT K1 board ends up with the
> USB 2.0 PHY driver disabled.
> 
> dwc3-generic-plat needs that PHY, so the result is a kernel with no
> working USB at all on boards such as the Milk-V Jupiter, where all four
> USB 3.0 type-A ports hang off the single dwc3 controller.
> 
> Give it the same default as its sibling.
> 
> Signed-off-by: Bruno Banelli <bbanelli@gmail.com>

Looks good to me
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
