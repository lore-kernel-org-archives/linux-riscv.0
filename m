Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675F3E7AD62
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psgwGjNBBhEWcCw+aSkrBeT1C8PaTBRa4hfGbk6tJHM=; b=VvV6V/tXLErME+
	YWwXKjE5aKhixRhiElWNb/E7QBfcu1NUU5/5QvGRQGxEiuSOaKNjZzD+GCJPpIh7AhftW1FsVYC/T
	OC+9s8caO1x+XueFw8RvhfBpKbu+qlPz43+hkuiGOaMhjKGQKFAm7k8VkxjCFIIgdeuvm1Ojqpiir
	uEMpnyXBuW5aTIJt961c1yE5bthstf/DA4jkY7KVlr+618f/7OduRhTtEwK9SQZ3yxiATI1S118rM
	00SfvbynTXMVVsHiNF3HmGf+A1U2EnEC/3NAIEXvWXZKkVz4ww6Xn/vSbrpygIiNp8COZ29MDmWI+
	Soughc57S6ryZ+RHnUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYoay-00000000YD2-0ZAz;
	Thu, 25 Dec 2025 16:53:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYoav-00000000YCZ-0m2K
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 16:53:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9A18F4E41DA7;
	Thu, 25 Dec 2025 16:53:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5443E60742;
	Thu, 25 Dec 2025 16:53:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 970C7103C8CAF;
	Thu, 25 Dec 2025 17:53:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766681621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=afdzq0G7wsigzO6RVOGJk2hczbqsJTxZQZ9HcD5yI2M=;
	b=x7BL1eqg+0xLhEmZMN3OS+aGPrn9OBS2gfRbN5PCEBw08tiIZnLhj29tFwQgLxdaL2i496
	AAgEa5BCZXdkEWMDD0A9DzNC6LYehVAjShKwa+HCuqKpbslkANFusCvJK0viyVHLmvxzFw
	jCp4NUnx10MWMoVuYz++hV7A74cgQBRLcQw1Bzp9QjWYzWwG7ccpANpG3Vse5PJc0WQHnT
	/hrJwEepy7h+JoWFgKbib0KW1PYIn1ZQIwjU9gz+uzDYxqmxavGTq4iP2H6yzdQQJ4ixHo
	V6bpKGhvfYHw8jXucie4hRQ596QJfvFTyGI3IWsN5YSQUEwFl4GjZDdkfQBwdg==
Date: Thu, 25 Dec 2025 17:53:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when
 MFD_SPACEMIT_P1 is enabled
Message-ID: <202512251653368b33c7e7@mail.local>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_085345_365776_68744F8A 
X-CRM114-Status: GOOD (  20.81  )
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

On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
> caused it to be built-in automatically whenever the PMIC support was
> set to y.
> 
> This is not always desirable, as the RTC function is not required on
> all platforms using the SpacemiT P1 PMIC.

But then, can't people simply change the config? I don't feel like
this is an improvement.

> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/rtc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>  	tristate "SpacemiT P1 RTC"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>  	depends on MFD_SPACEMIT_P1
> -	default MFD_SPACEMIT_P1
> +	default m if MFD_SPACEMIT_P1
>  	help
>  	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>  	  This driver can also be built as a module, which will be called
> 
> -- 
> 2.52.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
