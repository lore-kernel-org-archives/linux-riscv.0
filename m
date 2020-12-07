Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBF9C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 10:31:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CBD223159
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 10:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CBD223159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bQhhjauNxLbq5iGqxC+Z5AcgwWHfXtOzRwteZ/u2UGg=; b=VULi0pdAkCFaIth+F9/oiuDiq
	YuM+tUOcRS5mkqPZ4YI03Cl1LPjWlfoch2jzALwGn3rtGmnbPDGWnISHfkFuvdPawciWUq7WXci2I
	pIkZqLWjb9GVlOczJdpZvH/KjjJsYjlIwFjXHjC5X440bBkX01yUJIhcTlhIzaRjP1ceOixCE59Gb
	aEZIQ/A0/WaWqNJVeoaazibEJfCC5qVNElZyXR0nE93Q4oVontLdXsWcxwVpnJoFcMbcUP4CutglQ
	BCkxGQ8EDUn+zgCaa+S2Fa0TQ+jb61iVac5+rP7d66Lur2dsKA2L+j4DGodzlD1gZdesD79y0pVJN
	dGosIku6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDnn-0006fx-5z; Mon, 07 Dec 2020 10:31:31 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDnk-0006f1-B0
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 10:31:29 +0000
Received: by mail-ej1-x643.google.com with SMTP id n26so18723072eju.6
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 02:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avwXTY4xKF4GYJux7MHK5WB/0Z5FSjvXovshldSv0FY=;
 b=Koz8pLD92Bc+OA38U/SVkLaUxErp6GlaZiBlKyqXz1eMnIAAlJ1AzWywkxnWEpTuqH
 jcpvF2CqCxtziXQ7kd8q4pe836G+LkCaA5WsZfZ+pm4I/4SkjmXLtjrf6laDzMx6YhkD
 SyBhLnB81hYrCMvTbf578MOKilnaYFTq/NK1CVGPEbc0M1UMpiq1F8EYEDb7K6Ev5RWH
 aEJnikVY4spRTMvGWM0UD5D+eqnZN53w2nheq9/FxLG3obYGCPgEMKPqABacz7+/06xW
 IhMcpuOukOTei6R7dZMXRvM6D7SIU/KSQDdBaPuloTNPORL20DniuYKo5CX05qvRp1We
 kP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avwXTY4xKF4GYJux7MHK5WB/0Z5FSjvXovshldSv0FY=;
 b=LEcpxGpVlhFGcGoupXjRLUnKvxtOWDXiyyD07MLzgsncjKUzlvk+aSDS4xiIjVwN5r
 Q0OBzK4qknNljO/D25jMfaZhmnYdbwwFsF4gj9QngJn12GDURi7F/WDOxBj6R7Xna4Md
 7y1F7fOscTEcjSBYSR6EGuCRABWNWL7SeZebrvnWuTv4H/MqoFsKLuFE6nJpnLlYjURN
 ZoI714XL4843yERNRCR5aU68zOE4qZiEDXCgL0IaRuOTroaoYM1M9UVP+oQjiaAF2Y/f
 pId6I3RMpO9WYLM4A7vWk+MjliaThGOMxf3kqkv01dyT+KSunph9zuSJUVUPjT7qjdm5
 8ZXw==
X-Gm-Message-State: AOAM531DnxpNr/zQchP6WEvrnLZJU+jAxw2Xu0jiMvRStvq1Uianb/D6
 fR7MZGXXKlWzcJc4/5QwnWp+0dKRE/9aveyzreEPzw==
X-Google-Smtp-Source: ABdhPJzXz9wKScnULYT5yiqNYTc0tuNX148+tIwRVDm7K1qucm+VxxovDI70gPvRQXH3EBb4Z3MpwQMNCuOuDuVMuAE=
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr17640381ejd.363.1607337085119; 
 Mon, 07 Dec 2020 02:31:25 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
In-Reply-To: <20201203191135.21576-1-info@metux.net>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 7 Dec 2020 11:31:14 +0100
Message-ID: <CAMpxmJVkXeH_B4A_e1Vy4H2LcQnNz0BVoZyXNKEXmG8NvgO6cw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drivers: gpio: put virtual gpio device into their
 own submenu
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_053128_439843_0DA48C34 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-doc <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 linux-gpio <linux-gpio@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 3, 2020 at 8:11 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Since we already have a few virtual gpio devices, and more to come,
> this category deserves its own submenu.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/gpio/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5d4de5cd6759..01619eb58396 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1590,6 +1590,8 @@ config GPIO_VIPERBOARD
>
>  endmenu
>
> +menu "Virtual GPIO devices"
> +
>  config GPIO_AGGREGATOR
>         tristate "GPIO Aggregator"
>         help
> @@ -1613,4 +1615,6 @@ config GPIO_MOCKUP
>           tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
>           it.
>
> +endmenu
> +
>  endif
> --
> 2.11.0
>

I'd call this section "Virtual GPIO drivers" because the code contains
drivers not devices.

Bartosz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
