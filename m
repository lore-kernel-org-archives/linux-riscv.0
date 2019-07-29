Return-Path: <SRS0=e5eF=V2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843BFC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 06:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559CD2070B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 06:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J4tqhfxW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 559CD2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxxvKBa7OqcUG2NU3enhXbB4CbX0SsofqHrQoSZj6Co=; b=J4tqhfxWjMC8eO
	TwflxSfRISXyrfGSiLJ91k3v1/m9L66VA7ua8WzkvOWYYF5ooxu/NnoepmRsVrqGJeH/xMzp1/9jP
	Hi9Jc2a8SG+suo+ihLvAciNywjeCQ1mopV9hflhL+Nq5dRHtb7aTf0KHlYWHyEtvnA2UyhctH8NP+
	TOt2qBKq6dYLSs+iPkMo+RR0nuemw0G83FDq8mxaWnTOiu55E1ZZtUc+37YeDHTGCHMROpQHwGd7X
	oa9vTVvJBV2HAK10RWpT0Z8VtvIl4EDrtAkdNXCAoJ/C3nxnnycF1NNGvs7e0hShCVj30a6NpUXuS
	8lm8GK7H7ydYlrP+kSlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrz6f-0000za-VM; Mon, 29 Jul 2019 06:26:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrz6c-0000z8-9F
 for linux-riscv@lists.infradead.org; Mon, 29 Jul 2019 06:25:59 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1hrz6V-0005fQ-Of; Mon, 29 Jul 2019 08:25:51 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hrz6S-0002ca-VW; Mon, 29 Jul 2019 08:25:48 +0200
Date: Mon, 29 Jul 2019 08:25:48 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>,
	Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH] pwm: avoid disabling clk twice
Message-ID: <20190729062548.4pio5sfuxfwwxecr@pengutronix.de>
References: <20190727070916.2960-1-xywang.sjtu@sjtu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190727070916.2960-1-xywang.sjtu@sjtu.edu.cn>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_232558_326742_1BD83CE0 
X-CRM114-Status: GOOD (  13.96  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 thierry.reding@gmail.com, palmer@sifive.com, paul.walmsley@sifive.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

On Sat, Jul 27, 2019 at 03:09:16PM +0800, Wang Xiayang wrote:
> Similar to commit 63fd4b94b948 ("serial: imx: fix error handling
> in console_setup"), as ddata->clk has been explicitly disabled two
> lines above, it should avoid being disabled for the second time.
> clk_unprepare() suits here better.
> =

> Signed-off-by: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
> ---
>  drivers/pwm/pwm-sifive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index a7c107f19e66..00f6fab5bd3b 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -312,7 +312,7 @@ static int pwm_sifive_remove(struct platform_device *=
dev)
>  	if (is_enabled)
>  		clk_disable(ddata->clk);
>  =

> -	clk_disable_unprepare(ddata->clk);
> +	clk_unprepare(ddata->clk);
>  	ret =3D pwmchip_remove(&ddata->chip);
>  	clk_notifier_unregister(ddata->clk, &ddata->notifier);

I think this patch is wrong.

After a successfull call to .probe the clock is left prepared and
enabled. This is undone in the unconditional call to
clk_disable_unprepare that you removed.

There is however still a problem: If Linux is started with the pwm
enabled (such that .get_state returns state->enabled =3D true) then
disabling the pwm has one clk_disable too much.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
