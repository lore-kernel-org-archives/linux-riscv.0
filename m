Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEBD606A33B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0fWkl/Qm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=R10bR+nG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AM1O1gP+dA5DLY23/9B0ytjeHdAcVO/HPIldSo4v2ps=; b=0fWkl/QmhI+cAWE99Y6DzJE1ty
	HK35g37+a94CL3GABg9sWnsEZDEFHYpp158B05FyGltoQPHi4INrX4yhQPzeTMUESREacFbJQPvGq
	LBA86Y7kTcBGqaYhsl48Aieqj7Of59lZbR25RyRLETL3WaKF5zVg/+WJgA/Kn1fg3Yz6HNMEwRhUR
	x2zQ3m0D+SsB2jXW55M7UNVXNM8JP0r800QzL7vqSk1Bfoo7qbSg0wOPVg5466dwtGs279NoJDzsC
	k502ln+O0yh4UufOuRDiRqQj/LjXRJf1J+yJGm4woI1yHISiC/LupcLCaPnTicf04Uzt10fgjnqs8
	9J4D+l2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYBh-00000004zZt-1B2t;
	Wed, 04 Nov 2026 10:25:49 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYBd-00000004zXG-2vjY;
	Wed, 04 Nov 2026 10:25:47 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 60653200AD7;
	Wed, 04 Nov 2026 11:25:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793787941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3uO33BWTvRzGT589zK5XHXlVqQazzRdbRxGw4lkcXk=;
	b=R10bR+nGpDOBHsBsgfY6x5gF6MVODYpe6zLWjOZvK+UTPbvF0HfqI/A/FRWV1xQ4rLOnJG
	Hb8X0WX7j8MES5DZFlHTx+H0VDKdNkdnDXrwpBmZQD9uxqA2KqMQa+cD/tPkBFUbCD/bzy
	HDEzMn4V9OjGUW4bx9vc1i1mW99gnJJv7Kker8hWZzv4E56jco3hpM2e6rpueAOWLuKM/c
	hC7UWblK3ZcwnjcxAgxFp/foAklOa+fGZBqbfdfoPH3N4tWeIrqEcoIWLYNbphD/LSX+Y6
	Cj5o9sYMg6E8rkMq1xVDrb3oQEqgDJt4gK6LDpJsPOTicIIrL87fbOnc7srrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793787941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3uO33BWTvRzGT589zK5XHXlVqQazzRdbRxGw4lkcXk=;
	b=aFCcuWhsp1Rz+FS39uH9Jep8WwzbEDt5X9Up5FrfhiHMupYvat/6ZsySEzPCJQbFFbrwdF
	KxQfsflbd/FGbjgketDjDxiEn+2hXdq/QUXfdX/hn9MkcRlUk4K7KZQPX5inZV51ngDGxH
	oIB7VXZOgAg4jv6zK11cAa1CH+MPVj8pg+Uf6/8qUbf5eMCW7rNfx49qebB3SqkOXX7wCK
	u9AmNrsZPEEUK10aJK3NUbySExb7xvJ9jQPNOt1owma2lxC7CWI6AgDNp1UFTgKoXS0iiU
	MOHCpL73RQg2QI3XWSMy8OMvGqtPnFpWcm8xM+tuBQynPUYBWfjXIlQnceVmUQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793787941; a=rsa-sha256;
	cv=none;
	b=W2SKAYeDEhEpB+KWH744MC/8Zua/10/EdN1knlfwc1zu3oHnUZNBLRDhvIToO9Czib2rc8
	ttW6//vcBNO82+tOTuPweTyX/nRR4Z7AbC3GD6HS726LZbYk++LEDxksFPWHt9BHbnWpcK
	OG+b2US90SeGVwPL6nQbqQWGLAdr9wssj3RIJH12VMFyi59Hyocz+TvK3UUS3TJdi4aTo6
	rOBFxvK4R//wbiwbT556vl5gcqkF+t/7KkgN4E14J4r8OYUCcJa7eKz9jyp3oyB9AD4FBa
	1rSsYoeu/4NZAATdwpGICbJiZk7+wqYyVkVOJBfhgH6VBVLUGxaHyUfOYokBsQ==
Message-ID: <9afb8ddc8451afad4f7ff7b9a133dd8542d07205.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] hwspinlock: sun6i: Get the clock and the reset
 without names
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Wilken Gottwalt
	 <wilken.gottwalt@posteo.net>, Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai	 <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti	 <alex@ghiti.fr>, Andre Przywara
 <andre.przywara@arm.com>, Bastian Germann	 <bage@debian.org>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 11:25:41 +0100
In-Reply-To: <20260927025626.69614-2-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	 <20260927025626.69614-2-tien.nguyenminh@embeddedlinux.blog>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_022545_894354_AB6D8FB8 
X-CRM114-Status: GOOD (  17.14  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On So, 2026-09-27 at 09:56 +0700, Nguyen Minh Tien wrote:
> The driver looks up its clock and reset by the name "ahb", but the
> binding doesn't define clock-names or reset-names, so a node that
> follows the binding fails to probe:
> 
>   sun6i_hwspinlock 3005000.hwlock: unable to get AHB clock (-2)
> 
> There is only one of each, so get them without a name. That is what
> was asked for when the names were added to an A64 node, and nodes that
> do set "ahb" keep working. For the reset, call the explicit
> devm_reset_control_get_exclusive(), which devm_reset_control_get()
> only wraps.
> 
> Fixes: 3c881e05c814 ("hwspinlock: add sun6i hardware spinlock support")
> Link: https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org
> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> ---
>  drivers/hwspinlock/sun6i_hwspinlock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
> index c2d3145880..e7cc121310 100644
> --- a/drivers/hwspinlock/sun6i_hwspinlock.c
> +++ b/drivers/hwspinlock/sun6i_hwspinlock.c
> @@ -104,14 +104,14 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	priv->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
> +	priv->ahb_clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(priv->ahb_clk)) {
>  		err = PTR_ERR(priv->ahb_clk);
>  		dev_err(&pdev->dev, "unable to get AHB clock (%d)\n", err);
>  		return err;
>  	}
>  
> -	priv->reset = devm_reset_control_get(&pdev->dev, "ahb");
> +	priv->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
