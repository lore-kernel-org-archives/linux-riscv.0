Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC13CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 23:43:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92EDF6128E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 23:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92EDF6128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AirHpwbe++H8iCw71Ub6CC40MsNP3H5r+EAQ/X3Kswg=; b=nBZSIVEwVwpfvS
	OLB1j8G6tcHlW1kh9YYBVll6mqNBbdR22sIglBeutdxXao787qy6KqZpWEF3ry/nmy1kgL76XFe3R
	CBVF5qtiKIjUeA6tlaRqlB6qX3lGQe8MQRz9cbqw5Q2QRvngvCRZiBjdBDN1cj3gubQQaqVZJFWvU
	+GQA6KJsIAGzejyNzePt1fxtET7UZql/84InXqpeKu3uDmmeNpuQ1riCDbVDhFWBl4f6L4+2gZPWF
	jRD4Pmfs/dpj5HbnEdG6neg3b8H+y1m+gjSsiEJyPDJRg/Y4tZ5QoKfsC6zuMuNoybCUXQxho1G7K
	Do/aiiXs+r3lCrDyd/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdhiZ-009JOP-UQ; Thu, 21 Oct 2021 23:43:28 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdhiM-009JKw-Qo
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 23:43:16 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id l201so2969007ybl.9
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 16:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iItbf96vJqUXBAPNWl/S+u6NWGXbFnqP3nMjz13MqBo=;
 b=TFl4VR+n/Tz2N//3hY0nsO9nfx6KQXwngK5dVh8zYiQrFuwtAtD1xgWfiNqrn4Shvw
 1JUxPOVPbUcuwvhE1OI3HYqKqDLWxoQ1WSOGRdSJw1F8LhaxoEnmEA+oqoS/AmHvrH6z
 UNtKwsU9qRjI38BVq4xkPUsYU/9KeW+o0BzqdsD8AQjEsK8O3Q2ywuMzIV1hvf2knjMr
 V8uyr6rzS0w+sPLRG7eZhp3iBxqsIoVIi/FKzGhcpn9YgjJwPZbRNb3qsN7A3rgwBUnw
 cIaAwWRZZyQIjjsE4+HrK93XFrVxGV0Jog7RENlVKKDwUQGYLm7/Ii/LdwTFhq4eO2X6
 H7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iItbf96vJqUXBAPNWl/S+u6NWGXbFnqP3nMjz13MqBo=;
 b=YNE4v8rpGhc12aEdQwCL1YjXBEV7w+zX74z2HB8MRZBfRtM4unc1xxorm0Y4oXES6G
 xh+0Ir3KNPDbjsRd99T5C4YLjGpTc8bdYHVTVu3Ms+OZ7BaYwQ/e/vv6XPykdEvQS3XV
 dYSLoG3s/bLicIMI9jxQvQnyR660Kl0GGswwt930F+E4XHUzB50EZ8z8rR0b0/2njlSr
 3NRfMOu4bvys6vS3tV/ksJ2G6GOpYJiYawD59HupguqAIFK0Fid0MwuujiKPYmG6DSqN
 RH5lEJxRTHGoyG26AiagtunFqihkKn3mzLvr1FbS4ZkeKeHf9ZL4SfmyJgtNK2BV+Gv5
 fTIA==
X-Gm-Message-State: AOAM531RzDSwIpw7t7JkqFJ0JFB2fBc6IxRNgVLfye/Cxn31dswqIPOR
 uN+Hn/e6IxtLQaZ0sOWK1DJ1i4O1qPGjE7V60w2pCw==
X-Google-Smtp-Source: ABdhPJzJ2cbj29jDZQ6TyMNq0vcXWUvo5fXcSmk7cGTR2WSWJkF3T2lRwKoKyVFtQHaqRmOMZh+qPbZkggFCxWwOuBw=
X-Received: by 2002:a25:c696:: with SMTP id k144mr8911382ybf.296.1634859790611; 
 Thu, 21 Oct 2021 16:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
In-Reply-To: <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 21 Oct 2021 16:42:34 -0700
Message-ID: <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To: Amit Pundir <amit.pundir@linaro.org>
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
X-CRM114-CacheID: sfid-20211021_164314_911980_2FD7D7EA 
X-CRM114-Status: GOOD (  14.47  )
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

On Thu, Oct 21, 2021 at 4:21 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>
> Hi Saravana,
>
> This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.

Amit top posting? How did that happen? :)

The fact you are seeing this issue is super strange though. The driver
literally does nothing other than allowing some sync_state() callbacks
to happen. I also grepped for the occurence of "simple-bus" in
arch/arm64/boot/dts/qcom/ and the only instance for 8250 is for the
soc node.

The only thing I can think of is that without my patch some
sync_state() callbacks weren't getting called and maybe it was masking
some other issue.

Can you try to boot with this log (see log patch below) and see if the
device hangs right after a sync_state() callback? Also, looking at the
different sync_state() implementations in upstream, I'm guessing one
of the devices isn't voting for interconnect bandwidth when it should
have.

Another thing you could do is boot without the simple-bus changes and
then look for all instances of "state_synced" in /sys/devices and then
see if any of them has the value "0" after boot up is complete.

-Saravana

-- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1099,6 +1099,7 @@ static void device_links_flush_sync_list(struct
list_head *list,
                if (dev != dont_lock_dev)
                        device_lock(dev);

+               dev_info(dev, "Calling sync_state()\n");
                if (dev->bus->sync_state)
                        dev->bus->sync_state(dev);
                else if (dev->driver && dev->driver->sync_state)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
