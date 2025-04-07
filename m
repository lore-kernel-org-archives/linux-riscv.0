Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD2C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/dtv40Nei8krJP+zC/R+yV3QhANAhRc/1yFgAETrNU=; b=0CVo9yHsuoFZNp
	0F790doKQ2DIHjN2gpkxAOtF2GE0ts9iG/79VGZNiGNlGPc43kQOJhltcAuNBz/xJ7a3zatvUhTrz
	pXOIEOBb0QUHl3yMfnHxZr/n3rx99OKa5OlwFJb4AVAcGJYwFOUaZmW+vmJlWncO1R+41ZA5NncK6
	snKXCIdLgO1qTQj4aRzf5CbMc8P3b5ldlG8qWUa7UFlIa+a4EaGBFDMN498+4zZ5w7aHllf5XmC+A
	r+a6yTvAYNib8JDfe4P2vbRHSwim0we63FdRnSXVQmlPxAMg9A1OWsNTWfIYGOXbzii839Avnekrf
	L7bUaM7kkvpnPsTa0hoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jni-0000000HOOl-02El;
	Mon, 07 Apr 2025 10:33:58 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jnC-0000000HOJT-0u43
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 10:33:28 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 80C5F3430B1;
	Mon, 07 Apr 2025 10:33:24 +0000 (UTC)
Date: Mon, 7 Apr 2025 10:33:20 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
Message-ID: <20250407103320-GYA13974@gentoo>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_033326_274409_B94C0518 
X-CRM114-Status: GOOD (  11.47  )
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

Hi Linus Walleij:

On 06:06 Wed 26 Mar     , Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/gpiolib-of.c |  8 ++++++++
>  drivers/gpio/gpiolib-of.h |  6 ++++++
>  drivers/gpio/gpiolib.c    | 22 ++++++++++++++++++----
>  3 files changed, 32 insertions(+), 4 deletions(-)
> 

  I'd assume this patch [2/2] will go via pinctrl's tree?
as patch [1/2] has been accepted by Thomas into tip tree [1]..
  Additonally need to pull that commit first? since it's a dependency

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/core&id=0a02e1f4a54ace747304687ced3b76d159e58914

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
