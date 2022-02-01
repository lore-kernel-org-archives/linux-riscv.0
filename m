Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38416C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 18:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K90oCp1Nw+zh47kWOPQ1r7STDM2ErbglgbxtgYJDvPk=; b=TQwOxUPXlQ7EeF
	55+kxYOzEOb5IRJDJqLvWwX7Um12vYhdRKQHa4sFmxNAJZPJurNp6yLiiQ/47ehuph0YgXMAKunF5
	1Uh4G6m3Gx1de+dhqTO7OmgD3wEc1kkFYjZN9zvtgS06lh9hfZq6a52LZuhloCNSg/MOev+02bENT
	bD1eyte35c15m/XpBqDRo36fI2XjYGMPKyx2Acg/Tq/J9MMvxB3VbtmEMphO9q+VkcRwBL+SDcOJ4
	AZa4WKrOUGMyGsRQRUrIPpM9Yz35FHbb+TtuwPxtecUJBUoQWKS/lwnUyA5kgNriI81QnONAn2vcq
	i+0zwH8uYMUfJmezs2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEy0p-00DNYQ-OB; Tue, 01 Feb 2022 18:36:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEy0k-00DNV8-9h
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 18:36:16 +0000
Received: by mail-pl1-x62e.google.com with SMTP id c9so16055264plg.11
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 10:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=uymdiPAHYMV+vGLrmLiiTQE2p6SugIXA4tmHpTGQbjY=;
 b=qUZrCeISmIWgpM3iteLe2br7t59/dMGDq8fMoccYVxIu8FYC+5uJFIP3SGc63ezqDv
 8O2Zl5OYLbH9gJgjwO3juwPtNL2X54jGdyfxsy5CzSjkxAVMiGgRzeQNF1/6S++zcRiM
 dwWFcxr5zlou7e4+73jqrtJq0eTIZyMOLIML+r/5dF7FWIyPW8u/fVDPsjNKLfOtfpTI
 G+CzAvVYQQeZSJIU3HeZ7wezHRtGing5eS1kJK5UPJJaND1+/h0oVXPiVgJ8+V5SQHn3
 73Bg64yat6rN4X9QIVIxDpXZT/E6WKVGqzaLYwHslGH4dhK6BjX8D1efX/nfGy1odPTd
 g6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uymdiPAHYMV+vGLrmLiiTQE2p6SugIXA4tmHpTGQbjY=;
 b=U8wKAoBswrOfXn3py2qMsj9s8AvrkHT0qck4d3w92bwvGGvO97YQ5+oxj9cGpO0iSm
 4fqzWoansPsCc+QZvJUzQVcBsmUM4ckOp3XHKP4psLBGwEzdGAyQrAyLlZ/PnOIq4cRa
 2O9jVe7NXP/hD+9Ru/ZU8H/jwJx3PkSJoyZpn23nx1b/syla8o0G9FkeWCyOLgfGShuS
 jzXjkcghVqe09JGWQY3pZH+h1zdi7x/jRhtHst10BuZxVtFyFRW5a/jwEiEgyYgSwoeS
 uTliJfkFH31LHh8aVwnsHunbhng6Wx4D4iGzHRSPQwFNEp6mZf6JHMxmzFrjBvc7GJ3A
 qMYw==
X-Gm-Message-State: AOAM533dNZaMnRdlUpdGz2GH91QEjyoojIRVouAFIGO2VggmtCbddheq
 2aCcTwU49LDzGUjkQN0cyFY0aw==
X-Google-Smtp-Source: ABdhPJz+xggSIZUfFn6fGeLQIQxLGEjAl8f1fJRDpC8QIRmqiiesC6t91zcdEmPTvWWB3uCdEyYplA==
X-Received: by 2002:a17:90b:1a8f:: with SMTP id
 ng15mr3762577pjb.235.1643740573012; 
 Tue, 01 Feb 2022 10:36:13 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j4sm23038417pfc.217.2022.02.01.10.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:36:12 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
In-Reply-To: <CAGETcx_YEUxEBSBnzFaBxW=9=jO6BO0GuThaMGF+JPkDeC-ivw@mail.gmail.com>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
 <7hk0efmfzo.fsf@baylibre.com>
 <CAGETcx_YEUxEBSBnzFaBxW=9=jO6BO0GuThaMGF+JPkDeC-ivw@mail.gmail.com>
Date: Tue, 01 Feb 2022 10:36:11 -0800
Message-ID: <7hee4mmo2s.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_103614_432031_ED7F7761 
X-CRM114-Status: GOOD (  27.62  )
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

Saravana Kannan <saravanak@google.com> writes:

> On Mon, Jan 31, 2022 at 7:18 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Hi Saravana,
>>
>> Saravana Kannan <saravanak@google.com> writes:
>>
>> > fw_devlink could end up creating device links for bus only devices.
>> > However, bus only devices don't get probed and can block probe() or
>> > sync_state() [1] call backs of other devices. To avoid this, probe these
>> > devices using the simple-pm-bus driver.
>> >
>> > However, there are instances of devices that are not simple buses (they get
>> > probed by their specific drivers) that also list the "simple-bus" (or other
>> > bus only compatible strings) in their compatible property to automatically
>> > populate their child devices. We still want these devices to get probed by
>> > their specific drivers. So, we make sure this driver only probes devices
>> > that are only buses.
>> >
>> > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
>> > Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
>> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>> > Tested-by: Saravana Kannan <saravanak@google.com>
>> > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
>>
>> This patch landed in stable/linux-5.10.y as commit d5f13bbb5104 and it
>> broke suspend/resume on at least one TI AM335x board I'm testing on:
>> upstream dts: arch/arm/boot/dts/am335x-icev2.dts, upstream defconfig:
>> arch/arm/configs/omap2plus_defconfig.
>>
>> Bisecting between vanilla v5.10 (good) and stable/linux-5.10.y (bad)
>> pointed me to this patch, and I confirmed that reverting just this patch
>> on top of stable/linux-5.10.y makes it work again.
>>
>> Also interesting, this same platform works fine on vanilla v5.15, which
>> also includes this patch.  That suggests that either 1) this patch
>> should not have been backported to v5.10 stable or 2) there are some
>> other dependencies that are missing in v5.10.
>>
>> Since vanilla v5.10 works fine, I'm leaning towards (1), but if you have
>> any ideas for deps that need backporting, I'm happy to try.
>
> Oh wow! I didn't realize I made so many changes AFTER 5.10! Unless I'm
> doing something wrong with my git commands.
> $ git log v5.10..v5.15 --oneline -- drivers/of/property.c
> $ git log v5.10..v5.15 --oneline --author=saravanak -- drivers/base/
>
> If you don't think I got my git command completely wrong, yeah, way
> too many patches are missing on 5.10. I'd go with the option of
> dropping this patch on 5.10.

I agree.  Could you submit a revert for v5.10 stable?  As the patch
author, it's probably better if it comes from you.

>> I haven't debugged exactly where it's hanging yet, but, enabling
>> CONFIG_DEBUG_DRIVER=y, and suspending with "no_console_suspend" on the
>> command line, the last line before it hangs is:
>>
>>    [   28.129966] simple-pm-bus ocp: noirq power domain suspend
>>
>> Any ideas?
>
> I'd guess it's either a sync_state() happening too soon since some of
> the dependencies aren't tracked. Or some dependency cycle that'd be
> handled correctly if the rest of the patches were picked up. Yeah, a
> pretty broad/vague answer.

Heh, yeah, and also suggests that there's other gotchas hiding in other
dark corners, which also suggests that revert is the best path for
v5.10.

Thanks for the quick response,

Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
