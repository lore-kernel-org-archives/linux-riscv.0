Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F569C4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 13:52:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 475262343F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 13:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 475262343F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e0JbMTkJygHQeWqVr0krmLGda+tzE7xPtXnB8/IaQKE=; b=1YtoE6FHKn3WiWXe1vThD71K/
	WIGVOivFAgBU64Zn0NTpr+gAaySlnStiVQgJtMeo4wBCnujnVcBQkOQj9kylvGFIIfW05MqxGntLP
	yI68euRTP5z0kRx5z4zvRkWyZu08WrE6g9Rg5m3MCvL40FZl28/gz0rY4kOBVzqE28D2YqwbaMuIJ
	pza6TIqoVKWKM0Pxx7Uc8tUYYewCwsn0QlHMjfP1aViUxbZ4779AJZISWGj1fljGM78NIMBwdxf9r
	Necvplb3CXSTDtR/bn42V5kEl8AQ2JIuRIOBtZ/axz22pRCv4kk8LPQToTXWEhJvKt6TcXUky+KXS
	YLWmWjO9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmGwK-0005vT-T5; Mon, 07 Dec 2020 13:52:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmGwI-0005u6-04
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 13:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607349149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwkrY6cjQW6l0lAUCv8oVDdwg/KrYKuVcu8dAb8pkjA=;
 b=PCnoCkOIRE2qgBOGnq7ktRTNjpvQa5xzkXXQEv2gmI9iL6afCGT9IWYVuBwwVEkousvfGm
 vaL48L58PMDUQVxolK5WEXiw0SaLG4xdEkBKQKNTVkKGUtHefSDPhnNSiVyqh1b4aN+RdI
 1LYiYgI3sZ+q2t5SmL9FdlR19lNYgi4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-7oscLf6YMGGCLp0fb2sRVQ-1; Mon, 07 Dec 2020 08:52:27 -0500
X-MC-Unique: 7oscLf6YMGGCLp0fb2sRVQ-1
Received: by mail-wr1-f72.google.com with SMTP id y5so854671wrs.15
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 05:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=o2eDRpg2p3nscNNP24Y5Wwi2J4Ejtn5EoY7jP2IsnBU=;
 b=ghwgrMbEgeVwVFam+JiCOc2EwtzHJZxNaq1N0Mgfdh/HSOgxA79epQK08K4hMKYKzm
 /HimazpFBP+mv7jOXcsj/h/niZHau8F7sbEbXovPpo3xbVeuuUoAjXqT5FUTloz/QsUa
 1rOKcuB0m7pjzAJhChmPYvPh+kFOuliMeEV9cJJ2/fhYLBzDprFRz2r3Ql369N4Pt439
 o5Qun+s0Mer3Cbgq34aJVGTVi/PsM5MTQsvkFN2XsUhTFF+JS1wIDIJdFti0IdWQz8HZ
 q1cFoffj13bkAn0RwMTYNc2Ekr1rX6OXtbTuLUidXxbx/SvImuGh0XDUdjgXu1EFWg4m
 +jPQ==
X-Gm-Message-State: AOAM5319ztnYimE56ENRV/XNcg4yTqAaQeWqXpUQryLhRG8v3d74PbS/
 GC0QViOqG43c7iDcBTqJNl8nYrPuyqwpAQU4wT4q/TgGDZdf4uImno/G/d7CkXoPudYyp0pcQkN
 xbp/Gzy/31LkDTaL1fGXswkcog88k
X-Received: by 2002:a5d:5689:: with SMTP id f9mr19985949wrv.181.1607349145790; 
 Mon, 07 Dec 2020 05:52:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxry8r99XfuZsd9xpT/D3HhTrDgujG2fkSVGb9ILMFpXGDKe10crdm3NpHJ20Ml9kS7Zd7JfA==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr19985923wrv.181.1607349145521; 
 Mon, 07 Dec 2020 05:52:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id h14sm13884316wrx.37.2020.12.07.05.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:52:24 -0800 (PST)
Date: Mon, 7 Dec 2020 08:52:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201206075131-mutt-send-email-mst@kernel.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
MIME-Version: 1.0
In-Reply-To: <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_085230_096086_F26C98CC 
X-CRM114-Status: GOOD (  30.46  )
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

On Sat, Dec 05, 2020 at 09:05:16PM +0100, Enrico Weigelt, metux IT consult =
wrote:
> On 05.12.20 20:32, Michael S. Tsirkin wrote:
> =

> Hi,
> =

> > It seems a bit of a mess, at this point I'm not entirely sure when
> > should drivers select VIRTIO and when depend on it.
> =

> if VIRTIO just enables something that could be seen as library
> functions, then select should be right, IMHO.
> =

> > The text near it says:
> > =

> > # SPDX-License-Identifier: GPL-2.0-only
> > config VIRTIO
> >         tristate
> =

> oh, wait, doesn't have an menu text, so we can't even explicitly enable
> it (not shown in menu) - only implicitly. Which means that some other
> option must select it, in order to become availe at all, and in order
> to make others depending on it becoming available.
> =

> IMHO, therefore select is the correct approach.
> =

> =

> >         help
> >           This option is selected by any driver which implements the vi=
rtio
> >           bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RP=
MSG
> >           or CONFIG_S390_GUEST.
> > =

> > Which seems clear enough and would indicate drivers for devices *behind*
> > the bus should not select VIRTIO and thus presumably should "depend on"=
 it.
> > This is violated in virtio console and virtio fs drivers.
> =

> See above: NAK. because it can't even be enabled directly (by the user).
> If it wasn't meant otherwise, we'd have to add an menu text.


The point is that user enables one of the bindings.
That in turn enables drivers. If we merely select VIRTIO
there's a chance user won't remember to select any bindings
and will be surprised not to see any devices.



> > For console it says:
> > =

> > commit 9f30eb29c514589e16f2999ea070598583d1f6ec
> > Author: Michal Suchanek <msuchanek@suse.de>
> > Date:   Mon Aug 31 18:58:50 2020 +0200
> > =

> >     char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
> >     =

> >     Make it possible to have virtio console built-in when
> >     other virtio drivers are modular.
> >     =

> >     Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> >     Reviewed-by: Amit Shah <amit@kernel.org>
> >     Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@su=
se.de
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > =

> > which seems kind of bogus - why do we care about allowing a builtin
> > virtio console driver if the pci virtio bus driver is a module?
> > There won't be any devices on the bus to attach to ...
> =

> When using other transports ?

Any transport selects VIRTIO so if you enable that, you get
VIRTIO and thus it's enough to depend on it.

> In my current project, eg. I'm using mmio - my kernel has pci completely
> disabled.
> =

> > I am inclined to fix console and virtio fs to depend on VIRTIO:
> > select is harder to use correctly ...
> =

> I don't thinkt that would be good - instead everybody should just select
> VIRTIO, never depend on it (maybe depend on VIRTIO_MENU instead)

GPU depends on VIRTIO and on VIRTIO_MENU ... which seems even messier
...

> =

> --mtx
> =

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
