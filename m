Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EB7CD8CAE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 05:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+2hQotd7uzbFa6wvaSi1HtzSnyeuXTJxSBpKXZCG4Q=; b=Q1HI5UrRb110X3
	PMA5b/qE7iP9reO0xv1r4ghwM1F17qzOT1uGmi+n6TwRQab6ARrMnzf4xKczpysByvzt7vhgI2KP6
	kjdVWeGhokUEgmdFT0HJJhUQUIZq7khsQv7piRGtFr7/h49n6h1XSTlP+vTcxPdJsD7avwV/IPg0c
	uPJ2WGNnQcwl5A9iUK4r+sj6k03Rsc9OpKItqbR8KhnDw8iD+pkOPmo3KaXydLzTDWmk+wAV6Q9nI
	91TLSqt18svh5tkpA442sDpN+g0lxWiYxaQZQAgdP0KGNYYfZQ12gvF4pl1Mgdm4vr8VDLbyjb4Q6
	U75Zh4xIZir5Ls4U3pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpAE-00000004lOs-1G4n;
	Tue, 09 Jun 2026 05:38:14 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpA7-00000004lOL-3JRO
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 05:38:12 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36d8b644473so5030741a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 22:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780983485; x=1781588285; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f0Ar/8R/e3J60CqzzrjWc5oNGKXlmxhAN8jEmzPMJ3c=;
        b=WMXMeYuQbJCxSLmrS1mBmPc5+ykaZQIBDqk2xBAVZr8kBd6NQOdQjDbAQFw06ISqUJ
         Zpt5p1uhDinkgvr/QiruQuvwc6lL8cgvqmhLjz8FwIPJYeUVWkRSqF7eg30D7G3s+KMh
         7yZwNNIcrGoNmWA/R4M3XapP4oHt52ElxF99fqbvuq3Zk5CVOTV/6z32F2qtzNS/6Law
         emMLx0HmULGUG/LV5zqp6e4l0E7RT0BDgNYKnjI0cCq8nAPP1hDJY29t7Pfi5f1qpOtD
         s98rH9N8w+O3TTvEB+F+Pnk642+e96kyLLql101qinQ/z09ANh/ybse87mJKEXXMGPWd
         +3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983485; x=1781588285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0Ar/8R/e3J60CqzzrjWc5oNGKXlmxhAN8jEmzPMJ3c=;
        b=PkooW7N3v/TyfENmOLZxrZyTorFOLCiXAGiJtBBH96XRlg+Ox0UQUm5++xVxh3vCMD
         ddt+eIDT5ReLBYq4cwy/2URroUm6xBmdOnjLMPZPS7XJ67eEsnY2hv6HFjTy6v5meO+Y
         FD4LozG6v0UctYxcGynTgcOeNWJBakiNN23EgB7U5xUsxHZ4U83gEUoIFSW4sMAQOFoR
         2DSBc+9xE1kiyx7gT72mcHB2N8FEvLNqPI5+1IpTYnmeeOpnHXJ80qqLU8l63IAhdVH1
         yM9a9EvnpRlPJY5BxImUMlaUuejlGLba81lso7C8Ec/H4c5/6zyVUUyd3lfVJP1LNOe7
         3o3g==
X-Gm-Message-State: AOJu0YyafeoePYeUHtSpc9fK1759Vn119ISAvKxgzWUdO45KY6Z2BbMa
	Ox31oHXPT7P57JTHEwJTAC70b1iCTFDpd41tGUBLB2XG2PCYQRk+Nbocc3Ginw==
X-Gm-Gg: Acq92OGlX5vgSgUrA+ftwdbTCtRqbWbFW8M0KNN5BDxhap+rPam1kEaHs+KanN78aLK
	vVjexBnxwX6v/GJW1dkdI/gFGb3RbIL2WwGdY/5r9kVfqAZxtpzIQnHMj4KBwait2nb18JdxqVa
	rEYb0qH+kX2Zireklj5MlAhQFOd6ABgzFhvd9TcotoDOkUhvMvNUoeDVFDCN+DSnaOg1Yspe5s6
	xVWgTrhg4EO+ym77Iam0E7Cd4Yrd9iV+rgau7hXpDXJFNftob06lo3taegPtKbRn9MF2l8fWmst
	h+8QFKYdIQl2xwFjzNvGSBMkqQ8BHgkuLEFYMeN/3SR2Ee7bfoskjHpimcbBP3fFeTsbduDoNHx
	K6nvb5Xzf2Kelq/deejbj3PXDrux8bMYWdJURdAwdsW8MchwqfqIQBnqNh1P0d9p+PZDum0QykH
	SiTL7S13ZD2Q==
X-Received: by 2002:a17:90b:4b84:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-370f0772022mr19530435a91.17.1780983485272;
        Mon, 08 Jun 2026 22:38:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf82fecsm18042826a91.3.2026.06.08.22.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 22:38:04 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:37:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Rembrandt <kernel@rembrandt.dev>, Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <aiemGajqcQeY9avz@inochi.infowork>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608182358.170489-1-kernel@rembrandt.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_223811_411883_347649BB 
X-CRM114-Status: GOOD (  19.19  )
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

On Mon, Jun 08, 2026 at 08:23:58PM +0200, Andrew Rembrandt wrote:
> The "rgmii-id" PHY mode applies a symmetric 2ns internal delay in the
> PHY. On the Pico-ITX board this leaves insufficient TX timing margin and
> no ethernet traffic passes.
> 
> Add a 400ps MAC-side TX internal delay on top of the PHY's delay to
> correct the TX clock/data skew. The value follows the vendor fork's
> asymmetric tuning (tx-phase 73 x 33.3ps - 2000ps ID ~= 400ps); the
> driver rounds tx-internal-delay-ps to the nearest supported step.
> 
> This builds on commit 3ea695eb111f ("dts: riscv: spacemit: k3: Fix I/O
> power settings"), which fixed the GMAC0 1.8V/3.3V I/O switch
> 
> Tested on Pico-ITX hardware with iperf3: 60s TCP each direction and 60s
> UDP, all at 1Gbps with no TX/RX errors on the interface.
> 
> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b89c1521e664..59aecaa2d32a 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -186,6 +186,7 @@ &eth0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
>  	phy-mode = "rgmii-id";
> +	tx-internal-delay-ps = <400>;
>  	phy-handle = <&phy0>;
>  	status = "okay";
>  

You should set tx-internal-delay-ps of the phy instead of
the controller. This is a phy in "rgmii-id" mode.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
