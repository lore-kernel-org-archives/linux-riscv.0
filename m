Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E06DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 17:00:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF5061181
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 17:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBF5061181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6sJJ128ULwlfoz31t21w+37wQQw8JS3SML7HSCXp44=; b=OnseazB77aBw7p
	LwuiCQyKdV28NTKTIBaAY18OAOI56KtL0WiZylqkIj1GCgGoq7KVHJfZpzROgI5i3Lk+0cye35V2P
	2ULXmZfJQLvjTmEh4iCeIPt4tjz+9bW2HyOWvr9C4RDv0JYjPXhD9MPbBsC7qH4fn240cSdiB+WXB
	F8OzwzuqozlK4Jmdnqj1U9bY1wWjpKknT9Qi4y9906dNwSrxCcWFVXO510F+IDv9gcOvSXtIzNoMM
	C6iwjJOWW/mMh3XhEnquNSKR2lBSVc0SaAPne4DjmBl46gEG5WPnxe/HwbqgZZ3thvZD1IqHC8WUN
	eAfVKkN6/HOap5uPtfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdxtx-00BZe1-CK; Fri, 22 Oct 2021 17:00:17 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdxtj-00BZbD-KW
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 17:00:05 +0000
Received: by mail-io1-xd2e.google.com with SMTP id p142so6323574iod.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kTen2SJ5OXpwrB3GYaVSgs5PSr8Wl3SgV5Rb/nQHzy4=;
 b=OfBpCJAzSU6W7PZkLXvnp5uTA+iDkXVIdjqAMBeIpoljCUIE4H16rweL/sbBvPgjOz
 a7XnxBwIYdIryHPaHA7ppp+xRkuJ8ZkGtFQ917cYf6DXBKPw/S1sutxiZQufEACp4UpT
 PLnHHSzn4hQ4AhSAlnXGb0jGqcXGqNTs1nU6fnOh+AIxI5Q8oMN4iE7Fya+Xc4OOZBym
 rRn0MMZj1yiUeB/E8pchAg4wkBwHmXHOyXkKHbDeAue4CSfMCyDa4KbzZTr3JaR9+GBS
 VNmBEefGtXM9NaGbU0Rp/mPohCP047tLX02ikVEAVBUzcMC6NEhoorwouURdd7M5e8d/
 nviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kTen2SJ5OXpwrB3GYaVSgs5PSr8Wl3SgV5Rb/nQHzy4=;
 b=i4bnFLhxjTcT09RHL2mZdF/p3XQVtw3/G7bA6xlIs7ilalm6I9tS6TwJXLimT5GCOd
 AWGpuRUzIToiZSLIV4luqH2I48SSi3HjFfPtqsEr9i/TGgH7FRK0IoHFfxOCsb++i02R
 o8kT4vvMKp3X3Sj6LJDwTtPfDaha+0pY8j/VDckWbMuTduucmQnu2204sNEcqXMMKSbX
 NmNa5q1J2zkS681JDaj/SjQ2s8wsFFSiboQt/ys7gdGte3lDZ3HVgOOgPH30cBBSO76e
 guCjffGO+KTaSemH0m4S79/OA6Bmly8O6o1nor52iJ7DOKNt4rT5DkFxVMILDfdZqrjV
 PbQA==
X-Gm-Message-State: AOAM532o+vcAWkUZwl6/yMKok+Ra42zlMGE0j+whOrVZMggm4f/q/QtY
 zy7pzhaN/UUIubgq9Q/Cnz3fFMFzAHgbZATNBurHyA==
X-Google-Smtp-Source: ABdhPJzxQ0fZin7R9PkqV1UP1dkqBLaE11BhnPXYcqoa5W2nV/HynKJCgyp+2iBylPP9BT6beLI8s2+3hLU0rL6J7ec=
X-Received: by 2002:a05:6602:168f:: with SMTP id
 s15mr547913iow.178.1634922001157; 
 Fri, 22 Oct 2021 10:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
 <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
In-Reply-To: <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 22 Oct 2021 22:29:24 +0530
Message-ID: <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 John Stultz <john.stultz@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_100003_735170_BD4898F9 
X-CRM114-Status: GOOD (  26.99  )
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

On Fri, 22 Oct 2021 at 05:13, Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Oct 21, 2021 at 4:21 AM Amit Pundir <amit.pundir@linaro.org> wrote:
> >
> > Hi Saravana,
> >
> > This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> > I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.
>
> Amit top posting? How did that happen? :)
>
> The fact you are seeing this issue is super strange though. The driver
> literally does nothing other than allowing some sync_state() callbacks
> to happen. I also grepped for the occurence of "simple-bus" in
> arch/arm64/boot/dts/qcom/ and the only instance for 8250 is for the
> soc node.
>
> The only thing I can think of is that without my patch some
> sync_state() callbacks weren't getting called and maybe it was masking
> some other issue.
>
> Can you try to boot with this log (see log patch below) and see if the
> device hangs right after a sync_state() callback? Also, looking at the
> different sync_state() implementations in upstream, I'm guessing one
> of the devices isn't voting for interconnect bandwidth when it should
> have.
>
> Another thing you could do is boot without the simple-bus changes and
> then look for all instances of "state_synced" in /sys/devices and then
> see if any of them has the value "0" after boot up is complete.

Turned out RB5 is not even reaching up to
device_links_flush_sync_list() and seem to be stuck somewhere in
device_links_driver_bound(). So I added more print logs to narrow down
to any specific lock state but those additional prints seem to have
added enough delay to unblock that particular driver (Serial:
8250/16550 driver if I understood the logs correctly) and I eventually
booted to UI.

On the booted RB5 *with* and *without* the simple-bus changes, I see 4
instances of "0" state_synced nodes at:

/sys/devices/platform/soc@0/9100000.interconnect/state_synced
/sys/devices/platform/soc@0/1500000.interconnect/state_synced
/sys/devices/platform/soc@0/1740000.interconnect/state_synced
/sys/devices/platform/soc@0/163d000.interconnect/state_synced

Regards,
Amit Pundir

>
> -Saravana
>
> -- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1099,6 +1099,7 @@ static void device_links_flush_sync_list(struct
> list_head *list,
>                 if (dev != dont_lock_dev)
>                         device_lock(dev);
>
> +               dev_info(dev, "Calling sync_state()\n");
>                 if (dev->bus->sync_state)
>                         dev->bus->sync_state(dev);
>                 else if (dev->driver && dev->driver->sync_state)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
