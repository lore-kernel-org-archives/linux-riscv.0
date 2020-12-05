Return-Path: <SRS0=5ZKR=FJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7538AC4361A
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 19:32:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31C6022DBF
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 19:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31C6022DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SCgIEFeMwm9oIobLoOUIKwJdL5NOeMBjWIu30LAH6r8=; b=SM8es0VDKR/CQBL2YbsMPnGZs
	r1KpjmGfgVeLDwAr/a0LgchY871Xog5dxhCbk8+4hj8HLXEc5h4GV8hNB+MuN7Z7MTvq1I46W3N9s
	dChPsAr0FvFTVEomtKODNUeSZL6voLJc0g+gcCb52vef5Q72fVBPJCWsGMMo4v+Yzf4k4SZD6UDL3
	N3XUlzUA1bnudwI7pfD5r0JdCFXuoL1YXuT6d2aAmH3ZOzZJVj6mrf6JSfSxkTFeOsXo1QgNfrbZb
	4ggJyQI5hnhXmp6b37SUc97ICTAkqeW4KEYVzedCObfj0aUR3yFn57J6wNNM825qKLv5sqw4B1y8a
	DTkNmCmIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kldI0-0006O4-Vb; Sat, 05 Dec 2020 19:32:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kldHy-0006Nf-NJ
 for linux-riscv@lists.infradead.org; Sat, 05 Dec 2020 19:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607196733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0EK7Xx+WJiCxdoOjpYgymlmknRa2p5m+dwzuMaOFjc=;
 b=CsZ2ecsWkH9aZ7TQrI8ZO8vKeTWj/6G6l/KP0XCzPPH11IyPN3ReCyBZhPOMg7SfADZ1FL
 jxuSkqyFwE4svtyAV6jv1MNMUQStGry0ewGSFKU70X4qBGax42WZTw362TU6yAu3jPQ3L6
 iYDOYSI8ZKmVM7d+h+Ofmx0CeFO31Ho=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-hAEJ09H2P--H6TcbkxPzCw-1; Sat, 05 Dec 2020 14:32:12 -0500
X-MC-Unique: hAEJ09H2P--H6TcbkxPzCw-1
Received: by mail-wm1-f72.google.com with SMTP id f12so3835224wmf.6
 for <linux-riscv@lists.infradead.org>; Sat, 05 Dec 2020 11:32:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ofSC9lpwG6+UCSNudemJILG6AFj0fHelQy+fBqMM60g=;
 b=dyOKVpSQwGtfZN6NiwdZF1RCiwbJPt4dc3g/+QtQURi3YUVnJzgeCHlOpbRSiXpmlS
 q5Ijq076n3tvSIZAAEnVctmwLAgIgXkHuvlm+3y4iK0NRm0PvbrqraCe8by6ROfQqHH+
 d27Ym5koez3XpuCpF4mgU3U+WSZiFR5Qw/76KIU4StXrLzqbxegxNWIm1Wtwc26IaFd7
 xfnv+LV2sqDC6oqoXrA6XpOMMIhzvsDHSjrLDdaHJVNkm0prs8WyRPa1FWf6rfugOeEa
 mNwjZ3AzSPuKICrJnkCmgZ45fuCDIkDzRwOS3Uu/enlvI+bPbWfX30PRZhxGkZxtKlOy
 GO3A==
X-Gm-Message-State: AOAM533yNplFX4z2GcXpLKIGGrGZ6nO5aChklXlMXfo+XRqMRFHKqPup
 08gVhUK9c34ZBjevK1+jgl6sK2z7xART0vuXB94x4LjgHRNZsJUWinDc9pFNiZMBB4XA/FWaeqn
 LaP4jBjMqImOe7lGEuhFtH6nIeMEK
X-Received: by 2002:a1c:9d85:: with SMTP id
 g127mr10659855wme.118.1607196729259; 
 Sat, 05 Dec 2020 11:32:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTZFGnBU4zJ3vNUAlp7Lk23tATWWb8vX7NoCe2Rd1SBGhMQ9NKv0j2hhmXa23rEif7aIjTgQ==
X-Received: by 2002:a1c:9d85:: with SMTP id
 g127mr10659834wme.118.1607196729032; 
 Sat, 05 Dec 2020 11:32:09 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id b14sm8512163wrq.47.2020.12.05.11.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Dec 2020 11:32:08 -0800 (PST)
Date: Sat, 5 Dec 2020 14:32:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201205142218-mutt-send-email-mst@kernel.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
MIME-Version: 1.0
In-Reply-To: <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_143214_800053_5CEF0BB4 
X-CRM114-Status: GOOD (  21.46  )
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
Cc: stefanha@redhat.com, corbet@lwn.net, Jason Wang <jasowang@redhat.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, msuchanek@suse.de,
 "Enrico Weigelt, metux IT consult" <info@metux.net>, linus.walleij@linaro.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Dec 05, 2020 at 08:59:55AM +0100, Enrico Weigelt, metux IT consult =
wrote:
> On 04.12.20 04:35, Jason Wang wrote:
> =

> >> --- a/drivers/gpio/Kconfig
> >> +++ b/drivers/gpio/Kconfig
> >> @@ -1615,6 +1615,15 @@ config GPIO_MOCKUP
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tools/testing/selftests/gpi=
o/gpio-mockup.sh. Reference the
> >> usage in
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it.
> >> =C2=A0 +config GPIO_VIRTIO
> >> +=C2=A0=C2=A0=C2=A0 tristate "VirtIO GPIO support"
> >> +=C2=A0=C2=A0=C2=A0 depends on VIRTIO
> > =

> > =

> > Let's use select, since there's no prompt for VIRTIO and it doesn't have
> > any dependencies.
> =

> whoops, it's not that simple:
> =

> make: Entering directory '/home/nekrad/src/apu2-dev/pkg/kernel.apu2.git'
> make[1]: Entering directory
> '/home/nekrad/src/dk/DistroKit/platform-x86_64/build-target/linux-5.8.9-b=
uild'
>   GEN     Makefile
> drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
> drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by
> DRM_VIRTIO_GPU
> drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
> drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
> drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
> drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
> drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
> drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
> drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
> drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
> drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on
> DRM_KMS_HELPER
> =

> Seems that we can only depend on or select some symbol - we run into
> huge trouble if thats mixed. Just changed DRM_VIRTIO_GPU to just select
> VIRIO instead of depending on it, and now it works.
> =

> I've posted another patch for fixing drivers/gpu/drm/virtio/Kconfig
> to use 'select' instead of 'depends on'.

It seems a bit of a mess, at this point I'm not entirely sure when
should drivers select VIRTIO and when depend on it.

The text near it says:

# SPDX-License-Identifier: GPL-2.0-only
config VIRTIO
        tristate
        help
          This option is selected by any driver which implements the virtio
          bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
          or CONFIG_S390_GUEST.

Which seems clear enough and would indicate drivers for devices *behind*
the bus should not select VIRTIO and thus presumably should "depend on" it.
This is violated in virtio console and virtio fs drivers.

For console it says:

commit 9f30eb29c514589e16f2999ea070598583d1f6ec
Author: Michal Suchanek <msuchanek@suse.de>
Date:   Mon Aug 31 18:58:50 2020 +0200

    char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
    =

    Make it possible to have virtio console built-in when
    other virtio drivers are modular.
    =

    Signed-off-by: Michal Suchanek <msuchanek@suse.de>
    Reviewed-by: Amit Shah <amit@kernel.org>
    Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@suse.de
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

which seems kind of bogus - why do we care about allowing a builtin
virtio console driver if the pci virtio bus driver is a module?
There won't be any devices on the bus to attach to ...

And for virtio fs it was like this from the beginning.

I am inclined to fix console and virtio fs to depend on VIRTIO:
select is harder to use correctly ...

Jason?


> -- =

> ---
> Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6rt u=
nd manipuliert
> werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihren
> GPG/PGP-Schl=C3=BCssel zu.
> ---
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
