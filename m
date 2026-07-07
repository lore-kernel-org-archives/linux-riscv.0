Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0D4C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 07:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAXvw0a+cbK6mmaxzyY4K1cOaYgQNfo9jICRLuav1gQ=; b=QBJtrPlkleAQfH
	KJkjki0OygUC+eWz9aPt/iaMFjvn8m7zL0e6byDPtBnQGdBWNT9oSSdDzH9sSHbL/4FqgQ36XAWZQ
	BY7imkipmrR6OtwCqHOefgf3sAZzYjtrFsrq8qOd80CjAFnlALK0wlndQ97M6Issjrh7vBmz+27E9
	PQY50r6Yzyq0oP8ODf3LrOSvzMwJQVRJB8nBysT/SPjX+PXEEYx8DhbmmOpSi6ZT/BQZG0AqKt6x+
	5bgvZ4AdKJDTjDOkUCY5RUSZ/zrN0ZTqwbZFCnJHAX0tYZrXhM6dPrCIPG2f158UAcww+ExtWDWAn
	sFdTs2Bragr/8L/TZJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh01R-0000000EIXu-1opU;
	Tue, 07 Jul 2026 07:15:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh01O-0000000EIXT-1jNF
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 07:15:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D11F742CEC;
	Tue,  7 Jul 2026 07:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8631F000E9;
	Tue,  7 Jul 2026 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783408509;
	bh=nZOzo3G/dKhWUbfChSNS2hwZEX3JQBfP49agVDDkuv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dSRfRR2KD8lVWnWgidUwz4ESfAiEu9b+uSXhzCyG4JdmkhRdwWEhzdYF08HFRuNsI
	 c57S53rizD4+fT4xZNqgTlMaiSkVaRrzy3CEpKJJSgOswy0GIZ5DfW1dCjNJQa4TEH
	 kWODUtjSvc5TJaJIHsgUGyB5bgCtOtdZ25BPd0KCwjV8+cRuhAjmyrdAWw9aCO2Oyb
	 5nNu4NxJyqs3Z1ZTMrNAwFas36nWB2zbX6TWCoJmYm//JITeyI1wcrM/b+TTR/BnaL
	 LP8yXYVBr0W/Y9I0FXPFWVTyo69Vg9nv5p+gpij1iBKVlCHNHX9/NDmWqAXNbJd9EY
	 iHC5NlA237VSA==
Date: Tue, 7 Jul 2026 07:15:07 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andrew Rembrandt <kernel@rembrandt.dev>
Cc: linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <20260707071507-GKF35811@kernel.org>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608182358.170489-1-kernel@rembrandt.dev>
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

Hi Andrew,

On 20:23 Mon 08 Jun     , Andrew Rembrandt wrote:
> The "rgmii-id" PHY mode applies a symmetric 2ns internal delay in the
> PHY. On the Pico-ITX board this leaves insufficient TX timing margin and
> no ethernet traffic passes.
> 
So I think you are the only one who reporting this issue? My board works
fine with or without this patch, or is there any particular case that can
expose this? otherwise I'd say it's an individual board issue.

> Add a 400ps MAC-side TX internal delay on top of the PHY's delay to
> correct the TX clock/data skew. The value follows the vendor fork's
> asymmetric tuning (tx-phase 73 x 33.3ps - 2000ps ID ~= 400ps); the
> driver rounds tx-internal-delay-ps to the nearest supported step.
> 
But since the property copied from vendor, so I believe problem also
noticed in vendor's kernell which imply it do exist

> This builds on commit 3ea695eb111f ("dts: riscv: spacemit: k3: Fix I/O
> power settings"), which fixed the GMAC0 1.8V/3.3V I/O switch
> 
> Tested on Pico-ITX hardware with iperf3: 60s TCP each direction and 60s
> UDP, all at 1Gbps with no TX/RX errors on the interface.
> 
> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> Signed-off-by: Andrew Rembrandt <kernel@rembrandt.dev>

I'd plan to apply it for next tree (target v7.3), leave more time for people
to test, let me know if you're not OK with this? and for this patch

Reviewed-by: Yixun Lan <dlan@kernel.org>

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
> -- 
> 2.54.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
