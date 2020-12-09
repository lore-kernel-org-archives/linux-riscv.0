Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E288DC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 12:53:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713C3238A0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 12:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713C3238A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ASBhNCclI3PljYzc9Kif7DXvfErwUBeTyB6Z864AQvI=; b=I1insX9QrXJSExctJqzdSrkTa
	3sYubPPmxiv9WXHviJNojEZcQX08AeiUewcJP4MFSESxMXk0XNit9L6P4nDWTIgooHLSlM/01QQXV
	/XFR+0EgJf0gHrItuBLemqLrKG9IjLEFojNQEKXCUKeYzesgN4+DpxYQGV91atB42uqCMiCGB3uoM
	Z+0f8j5lfW8fX/2GZHHfrN1/4sTEnaqYgIO8Y0uqlrK4oFIDWsPx5DTqWVUOWCqNQOgw3p6xZ1mhn
	Of4IpWtJXHJVr4QiotNmVkNvmW4+zeJfUnSto1wwMf9FbA6zRssApzVJTg2jooUf1jQMRbUvB+iJv
	NckZ2ahDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmyyK-0000RY-35; Wed, 09 Dec 2020 12:53:32 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmyyH-0000R8-F5
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 12:53:30 +0000
Received: by mail-lf1-x141.google.com with SMTP id l11so2971424lfg.0
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 04:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q0ERmRel5zMK0HrfUyBGbMf84SViVXTKgfugx46LJdc=;
 b=CfQeSl03RYY1/kP1aY6rXJzJvM6wQuj5UDNft7mpgVbb/7Cw6Y14eAKeJR4Mj/0n4k
 wf8XYouCzKoh0cr64LOl/BxkYu4qURmZGRf+6tS58CDr5U0SDILSMmayCqifmbKnGGe2
 2o+N8h3Z8EFN58HRS1yMpC0D3WjPp4xqfhzVVrJwq8rj2CR2spDLG5URfVjGAwDcckBM
 vl02o6JImgvybbR4RtSNCbcPpHzi+inU7G7AODAsNZV7IQYZ57Ibs9O3ZOIbi6sUXgg7
 A8HzLGoX1upy2ah+cmO0uxehRoUznRxLapDvw22E6BErQb9i7k2+P4gUB4pCTBkowOES
 cixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q0ERmRel5zMK0HrfUyBGbMf84SViVXTKgfugx46LJdc=;
 b=Wr7A09hJ7dR3zXvP72MoVA5/Fe9DjSxgAOcvxkp8HdkJ5NhY1HxnlE20pFaaAoI7rE
 a6CfKjpHu7KrqKJ6o5PqZQz1KNLZ6ejQZN/RD3I5aEmkMZ2sF6SYNU+Aa+sJtzzmtEqU
 NNKwqRDvgefQyomizDnPckX8cu1wxDQxeIAQBiJnFPYsyUGXMwE52Y5eoqshIMJCrRkS
 tbJ3vRr4tthGPmvKCya9r11zqPRxzf11Q6rE9rhDvkchIztJAuAE5tuQeXZsgKMWM7uF
 phtIUG8X2s1azOf5NuPwUpSWY4v7tP4LL9GDKpUQ1g8HLXT/KH2MU4py9Fl8MHYDHGRs
 Cp5g==
X-Gm-Message-State: AOAM530DF2TGpIkMryhJgCMg+rJMW7xI5PnuT2kHA3QBT/QB2U567j6M
 THEsrRdUb8K7gzywZdGXDcHOaMHjQYaGuzLT6TKKZw==
X-Google-Smtp-Source: ABdhPJxT4z0Ly0kEdV4gEy+8cd3A9g/cl+KJVYjIXwDP/GLVbi+NiYbB3EufDbPF5UWEAxrY4q6VUw8juxsLEvIm0Og=
X-Received: by 2002:a19:8384:: with SMTP id f126mr877455lfd.649.1607518407214; 
 Wed, 09 Dec 2020 04:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
 <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
 <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
 <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
In-Reply-To: <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Dec 2020 13:53:15 +0100
Message-ID: <CACRpkdbNAeDsi9B14kbkAeoqX7NE_Ua_yOX1iNF75oNK0ELefQ@mail.gmail.com>
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_075329_777031_DC1FD74B 
X-CRM114-Status: GOOD (  16.73  )
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Jason Wang <jasowang@redhat.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 9, 2020 at 12:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Wed, Dec 9, 2020 at 9:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Dec 8, 2020 at 3:07 PM Enrico Weigelt, metux IT consult <lkml@metux.net> wrote:
>
> > What we need to understand is if your new usecase is an outlier
> > so it is simplest modeled by a "mock" irq_chip or we have to design
> > something new altogether like notifications on changes. I suspect
> > irq_chip would be best because all drivers using GPIOs for interrupts
> > are expecting interrupts, and it would be an enormous task to
> > change them all and really annoying to create a new mechanism
> > on the side.
>
> I would expect the platform abstraction to actually be close enough
> to a chained irqchip that it actually works: the notification should
> come in via vring_interrupt(), which is a normal interrupt handler
> that calls vq->vq.callback(), calling generic_handle_irq() (and
> possibly chained_irq_enter()/chained_irq_exit() around it) like the
> other gpio drivers do should just work here I think, and if it did
> not, then I would expect this to be just a bug in the driver rather
> than something missing in the gpio framework.

Performance/latency-wise that would also be strongly encouraged.

Tglx isn't super-happy about the chained interrupts at times, as they
can create really nasty bugs, but a pure IRQ in fastpath of some
kinde is preferable and intuitive either way.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
