Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC67C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 13:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sfnXNEqEUd7QynRHB4gNe0ucji+Wcop6CXyKEAuaYs=; b=39m7658KYthADT
	+bueQswQgQ0jA2wvloKS/YVbXzrimdQd8wPDdx04kQ1eNh2GKfT/TSwZKCfDerkc8S5UlSVp+hDZp
	ZtAHgRxMO+AXgjkGSaz0RGKVrlhUgwYS9dP53+MEhC42gZxQ3/WUZ8POYFzpBnjY90PI1eoBLJ6dF
	2gOGM56HndjsaBu2J+D360D29oleWl1U41PGtmpLDf/rjPZfX35XzJnGqXHv84M8/aJj6xE4IsfoD
	nTQsBEq1KRAfhnRxueudF9Ij6lX9Otc3owbm/53llgMpABILv+1S/OXiSDE240G/8FcTuXdm6IvKK
	DZ0lO/CQxokeyhsy9+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrg4j-006ziy-4C; Thu, 19 May 2022 13:20:21 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrg1d-006y0y-Jw
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 13:17:11 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id i11so8975651ybq.9
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3sUY19GyIG12NZLSdAkjxx301GK+rduuDLAdw32x6M4=;
 b=K7PUUlvSIZwD7tSfFGGgz2BGsQsPghltwxCtZVaDs3tOPU0gwjnHP+E+50K4ou7MXs
 WwtxalC/RYiop7fAAFCcpppSo8VUnenJUxeA4UXuWo5vmNalmFzfufVFaL9WercZMYmI
 bbylwdFU9hk9cejG8jkwFMspPUSTHHpJuFEoRMcXP+MzQ+80mxW9NI+8VNjb5/3SaqI/
 2zdr7ceYpeM0ABpR5hfvDDyqfhPx7RO7FXilF7HwCaroxTV7tbQxrMXLUk83iKVDyvGm
 E/U01edrPY8sHxm1XYwhPGf4IFK/F+C3RINdNVLWdLaZ40Rd/XTUWKx/PgaaqS+cLr6C
 ukkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3sUY19GyIG12NZLSdAkjxx301GK+rduuDLAdw32x6M4=;
 b=nTfYXp1ZB+2TaMokkr8LNmNcfCU6cufuQVL0/yrB88ywEV1iYpj2Anqylu/Rqaqml3
 wjMdJ5Ql7RctT/nyBpq3IcTU+OI6W9MQ5Tl7ZHsvUw9XUbKivPVHJj6IltCHU/gWXA/7
 q7+ChrrIkL+Q2wrrjHnbzYFWXWij2NINAnMv9dQJxBg0Mifbih5EsP/hEDyZhYBoFCOT
 tpehXtKzxszXY58u0L3bGF3vic4eWRGIwXa0I4O5dVJ0pt+jU/IHr45Hk03QonN7fzR+
 tvjSpoB84R5s+M90eK5wkR5rTkaSdpy3EYSXIAlPrPwQgUxnDxkuqD/jqVF9QbBs3kbn
 p3tw==
X-Gm-Message-State: AOAM531442vMdr8WmsZYfKw/G/BsW87/JZOnDvC4J5w7t8mYQjqUGrXI
 j+KynWGvvINpEBomwAY0yaMklt6YKT+mMkPtkgxiBJN5kf4=
X-Google-Smtp-Source: ABdhPJzisHzH95Hrh5acSvOJw3P+Lcc8zZsq8YBW6sPvP9iJzJjmv806G156YRLRSxDx/2NX8NJLkXVg1hJoFcLXnbo=
X-Received: by 2002:a25:2c82:0:b0:64d:62a1:850b with SMTP id
 s124-20020a252c82000000b0064d62a1850bmr4519321ybs.291.1652966226763; Thu, 19
 May 2022 06:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <5eb66be34356afd5eb0ea9027329e0939d03d3a0.1652884852.git.geert+renesas@glider.be>
In-Reply-To: <5eb66be34356afd5eb0ea9027329e0939d03d3a0.1652884852.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 May 2022 15:16:55 +0200
Message-ID: <CACRpkdbW7iSPGkWjV3hWOPv=rJ9VL1Ct2if34nVVhhOB+WQLog@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: Make the irqchip immutable
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Marc Zyngier <maz@kernel.org>,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_061709_724382_C015479D 
X-CRM114-Status: GOOD (  11.45  )
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

On Wed, May 18, 2022 at 4:41 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the starfive driver:
>
>     gpio gpiochip0: (11910000.pinctrl): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the starfive driver immutable.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against linux-next.
> Boot-tested on BeagleV Starlight Beta.

Patch applied!

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
