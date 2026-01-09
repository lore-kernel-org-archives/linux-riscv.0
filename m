Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59113D277C1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 22:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Szb2UZYjrftRT6JTHH1aqPL83GzT33KEH1tPPmeUM8c=; b=p/pP1LXzzJ1euT
	PjvY9Pdp6P80Py+6JTGZomirEk/jeze4v/Wt88HBp5kQFuqOVnT96FjDJIKho74K1/26Z8MgJuVVb
	NWPgN8jVJiVEfWAkVNo46Mdm2l8Xs8qqIy9bw0ledWJCmg0dFUdB3KKsMkFnvRXt03bpcRWlYB+At
	MaS1nWBy3nAuat6Ok/8LhaAzm3VXnMQUBGVfZ5hbv9lV7ig+kHhbRqvtflPS1zqiQgqwTgaxOv51C
	v2/3ecEyNQTxFVsWPkX8OQP5Y7/75+ekqRJgSSjXcCxYPNg7zG9c6l6KyZGw9RiJ7atHiRfshDBcF
	qZQSaPxBTKMD85z/kCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veL84-000000035Er-1MXg;
	Fri, 09 Jan 2026 22:38:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veL82-000000035EO-0u1c
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 22:38:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0EAA8C1F6E8
	for <linux-riscv@lists.infradead.org>; Fri,  9 Jan 2026 22:38:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D0FF606C6;
	Fri,  9 Jan 2026 22:38:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0C5F103C871E;
	Fri,  9 Jan 2026 23:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767998322; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Hx7WIiWE3EK2oEUgKzf5pfMAPP9G4Qkm7NyF+IC7TSU=;
	b=ffoPX5Ke+/yLP6QLjTb2DgXr1j7Po6SMkZgS4fdBAXFSkQDV3R7bCqqXlh6A3YXMKMn3XA
	iQ17fNj7UlqCsc7VE0RrsUhHeRorUC0WuR1J2iGAeWnhE69Noz0828nfKss8Ev+aEJJjG4
	ZKSBLG8+R6vbW6gnsuixuoGL29OFGwDNdN58d8jl5tkRF4z6z1bADP/H4AV3aIjqIGbeow
	IfEmwarsbQ9/hxoPceyuIPVS6edleJkp8NpxYbTjC8u8+jdwGHvvppWBCFZXjVO5tYVFwv
	SwctKRn/hzRnRmTNAxnVJWMebvPwu3xaxLcM/yzcmFZlnPFc87ZHTg01UfaAIw==
Date: Fri, 9 Jan 2026 23:38:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 3/3] rtc: spacemit: default module when
 MFD_SPACEMIT_P1 is enabled
Message-ID: <20260109223839b59ca7ce@mail.local>
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_143846_394959_2FE68B08 
X-CRM114-Status: GOOD (  20.82  )
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

On 08/01/2026 16:38:56+0800, Troy Mitchell wrote:
> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
> caused it to be built-in automatically whenever the PMIC support was
> set to y.
> 
> This is not always desirable, as the RTC function is not required on
> all platforms using the SpacemiT P1 PMIC.
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Change log in v5:
> - add Alex's tag
> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com/

See my reply on v4, this is still a NAK for me, I don't believe this
change is necessary as soon as the default for MFD_SPACEMIT_P1 is m.

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
