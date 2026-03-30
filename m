Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BAA1061B22
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 22:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/VHfmE+tvoCnCTS9Kv6pi76G4IfQjgFuYkf+dY18bo=; b=m8bK/aNXW2x1F8
	M1/s8ExKqTVglJw65Es7scg2Jso4x6uhL6lkb76O2jug5MTvAfXb/hy+kIDRbGsQxGSxVLpwaZiYD
	/VQqU9tR6NZDLbHLcgHDWp+L4c5ko0yEwe1Ud/xA0gmvT+lQkn1gxPBC8UxEMtBJpqySr9WcWJLtc
	LvpV7F4Mvrisz0KUWAtDaZ6sZcoVX7PDvzEYvwYmxNnLynTdF6z8qSqzxqokqr96qlrfY4P7eGswC
	fYVmnAZiBxhnIgp2tUMa7KesFC/7j+2nlA09dlvWaySYm0KTkU+d/Pv+gFPFZLr832hzU03PnBPEI
	7AHlaO4pK5iO05Ncr/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LKL-0000000BzGV-2AEy;
	Mon, 30 Mar 2026 22:43:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7LKH-0000000BzFa-0uwR
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 22:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A8424360C;
	Mon, 30 Mar 2026 22:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7DDC4CEF7;
	Mon, 30 Mar 2026 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910595;
	bh=Jtr7Cgs42E1wZ2l6KUsYhsVRKShVAqt0nKYjEQkpRb4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lkGMs2O+AiBpQGjIrQLrnwjSwzwLGCMzGqtOKwW3ePNzGZfdlZl4Jk9j2CuD9WHSE
	 k+rQ7MRSdNLixbYROnHQH3IKkP9hVFdxw/62zQa3ebYr0MPzpjezTwUmgnNDdLxmLg
	 MPkWrW+K3ZMZN+gKwboOaOgwYe7kGGY8Hl7cG5akv3u9uioewlen1nFVsSFyXZgOEa
	 ON+Ds9e6WnwRvD3N7cYnn3DRv+W0Hsuto6vFnmc7+l83rtCv8XClQ94PHllpN1UvHA
	 hXAD+KOuU0ampErbA7xO2UcMtwmVzeMfH1SJSR0x0grRJV4yO/yvzhV6heJRBIpV2O
	 23Z2LR5giDrAA==
Date: Mon, 30 Mar 2026 15:43:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 kernel test robot <lkp@intel.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next v1] net: macb: fix use of at91_default_usrio
 without CONFIG_OF
Message-ID: <20260330154313.58edbf52@kernel.org>
In-Reply-To: <20260330-overture-cactus-c8eb7b9cbecc@spud>
References: <20260330-overture-cactus-c8eb7b9cbecc@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_154317_282876_A8F6C4AE 
X-CRM114-Status: UNSURE (   8.87  )
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

On Mon, 30 Mar 2026 10:02:00 +0100 Conor Dooley wrote:
> @@ -5778,7 +5778,7 @@ static int macb_probe(struct platform_device *pdev)
>  
>  	macb_config = of_device_get_match_data(&pdev->dev);
>  	if (!macb_config)
> -		macb_config = &default_gem_config;
> +		return -EINVAL;
>  

AI reviewer says this will break macb_pci.c which registers a platform
device and will never have match data?

Feel free to post the v2 without the full 24h netdev wait if needed.
-- 
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
