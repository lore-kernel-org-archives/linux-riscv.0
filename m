Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D4EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 05:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dEcFikBXymqWmKkgyNXoqvOOUOf/yBhdaILfQ2T7ifU=; b=UiPgv1OvryLJo3
	j3G2NU4rIjoPPYURrs1ot7fkGwHx/xH1P2YCJeat0t0/5TquXl502Ht+ho/ZxMDjnT8W9EelqKpwb
	vh+/qlOilp3C042QvUAjG1SROHbJ/BpSjQr9uBK1xt94Yk1/d+q1zaxIE2mwpRKmaKIu4S8kJ5afY
	/1f2qTou/FBwhJX8Nj4ZgLvo7Doqw5WVL4MWMNvSQUn+BDpPwcQYRe3vIYnPBNCBna2jZcJapnJPq
	u12HKHf33yylVO/YIfCXPX4vz9uhQqbXrohGQVroXfVpxvuR09E9+LtExV1Mor+Ukdx+5Lz5Jo2PZ
	km2X5GJ9f2IxkDpLnpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nElks-00BDrd-Ea; Tue, 01 Feb 2022 05:31:02 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nElkf-00BDnc-RR
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 05:30:53 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id p5so47353189ybd.13
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 21:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kydovGavYpv7Z8Qzla4H6f1AHt/32IxvvPG5ynaWbE=;
 b=U77UZ+D4xbTT9TJN9/zszI5V0tEXwMdM+BFvx6Nb9KJU883KTTg8RWJqW4u+rENsbc
 mTJr60YFHw5Cyrrca0pMlnzqqtKSvEDubI0G2fZza/uyEvwpK6LDHKbyuL1pAKlu+isx
 5Rnhlftwp2yqp8HSPx5SIs3NWouiN3k6iuUSYGxj7wdtzs4LuWuXt7HF6nYvE8dm6UJf
 J1nVZTCZUchtA+Hnhbrnp4yi2zYEiIcOXsDJBByWDsZQcVGxuYwU+aPi9Twkd3NAAQyx
 7zDPjux6Iu/hWafBsPTXIjefy75b3o6mwNorP1BcbZabndECDeiebZm9E9u4xH8uPY2J
 Pp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kydovGavYpv7Z8Qzla4H6f1AHt/32IxvvPG5ynaWbE=;
 b=DwCmYqMSgk/rDAgOZVuqqnXp5d90YKIqSIay5k+nYwyTz8UjWLTwg35X0Cm/aXzJGV
 /aLllkUxl64w2wnjZljAPox0YscwEWGb0feCpjcGrUYRni7Zk4NTgSQ14deAEqavohqS
 zVbB3RdFbPdwc0t6z27lUFiGSAkqAa7ONQ8V7hSCI6wOxhBSIjUhf//4DYkJWQu1ui56
 fA41z/yOn7pN2pO9qoUOY9g/ZT+qre+BEbDHhSrzUxqm30I5XWK3L3Kanf5QfkF4tQFz
 +vRcucYM9HFHz+AyBrmCA67+K/DDIOvktUEmYWe6GQ/QDQf1jBcToyMm4UYdN1dfV4pM
 4KZQ==
X-Gm-Message-State: AOAM533khmhDXK83UamvuFbSxO+/NTy/om6IjM99ENXkVJrLkyLWNBBp
 6AnBt6348L+V4JbFQ6XUzqWizpZzQNZJt3CNvLgYBQ==
X-Google-Smtp-Source: ABdhPJynKbsLj1UEZZnKfLzmdFbVdxNi6pGBmrFfyYXto1lhLijfs+2rVmbRV30Q7qVZQAskM2peIoEkaBltQtJKHlQ=
X-Received: by 2002:a25:50c7:: with SMTP id
 e190mr33046695ybb.324.1643693445559; 
 Mon, 31 Jan 2022 21:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
 <7hk0efmfzo.fsf@baylibre.com>
In-Reply-To: <7hk0efmfzo.fsf@baylibre.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 31 Jan 2022 21:30:09 -0800
Message-ID: <CAGETcx_YEUxEBSBnzFaBxW=9=jO6BO0GuThaMGF+JPkDeC-ivw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To: Kevin Hilman <khilman@baylibre.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_213049_953230_F5D42B80 
X-CRM114-Status: GOOD (  29.44  )
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

On Mon, Jan 31, 2022 at 7:18 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hi Saravana,
>
> Saravana Kannan <saravanak@google.com> writes:
>
> > fw_devlink could end up creating device links for bus only devices.
> > However, bus only devices don't get probed and can block probe() or
> > sync_state() [1] call backs of other devices. To avoid this, probe these
> > devices using the simple-pm-bus driver.
> >
> > However, there are instances of devices that are not simple buses (they get
> > probed by their specific drivers) that also list the "simple-bus" (or other
> > bus only compatible strings) in their compatible property to automatically
> > populate their child devices. We still want these devices to get probed by
> > their specific drivers. So, we make sure this driver only probes devices
> > that are only buses.
> >
> > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> This patch landed in stable/linux-5.10.y as commit d5f13bbb5104 and it
> broke suspend/resume on at least one TI AM335x board I'm testing on:
> upstream dts: arch/arm/boot/dts/am335x-icev2.dts, upstream defconfig:
> arch/arm/configs/omap2plus_defconfig.
>
> Bisecting between vanilla v5.10 (good) and stable/linux-5.10.y (bad)
> pointed me to this patch, and I confirmed that reverting just this patch
> on top of stable/linux-5.10.y makes it work again.
>
> Also interesting, this same platform works fine on vanilla v5.15, which
> also includes this patch.  That suggests that either 1) this patch
> should not have been backported to v5.10 stable or 2) there are some
> other dependencies that are missing in v5.10.
>
> Since vanilla v5.10 works fine, I'm leaning towards (1), but if you have
> any ideas for deps that need backporting, I'm happy to try.

Oh wow! I didn't realize I made so many changes AFTER 5.10! Unless I'm
doing something wrong with my git commands.
$ git log v5.10..v5.15 --oneline -- drivers/of/property.c
$ git log v5.10..v5.15 --oneline --author=saravanak -- drivers/base/

If you don't think I got my git command completely wrong, yeah, way
too many patches are missing on 5.10. I'd go with the option of
dropping this patch on 5.10.

> I haven't debugged exactly where it's hanging yet, but, enabling
> CONFIG_DEBUG_DRIVER=y, and suspending with "no_console_suspend" on the
> command line, the last line before it hangs is:
>
>    [   28.129966] simple-pm-bus ocp: noirq power domain suspend
>
> Any ideas?

I'd guess it's either a sync_state() happening too soon since some of
the dependencies aren't tracked. Or some dependency cycle that'd be
handled correctly if the rest of the patches were picked up. Yeah, a
pretty broad/vague answer.

-Saravana

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
