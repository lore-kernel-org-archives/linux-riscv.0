Return-Path: <SRS0=wwcw=L3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F22C07E97
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jul 2021 08:06:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42FC61421
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jul 2021 08:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D42FC61421
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iA/el2GrJvg3yVfIt20nrZR5KteujesyeYyOSgKTWU8=; b=kESskCwSebp/Ia
	MZkRluW14ZA5wRaXkqPhJtICZDqjtrc3xG2utTshu0eARzt3Rd49dnxZtn5n2sh75UZosDkN+m+dh
	vfTAMVMA91fVZ1TmSXNQmoWFLE7NbNINencHA4aX8J/Ih0gCqWFYq4OHB4/V//SJ8dw8twofVB0WR
	Ixjl73t5/terVy28k1TRTav0e1Wsht7ymGlawZq/dXBc2HOWZeOJ0VUW5rRQMr7XrHXdRHyMcaHHM
	vmC94uBkaZzj3ApDa1sVe2ym+cZvic8kigfyAmUXMZgwvJUTPjYTNmXkAOXjS+gNNv1fdGjSiv+2Y
	6/T4JovSh09wSlRcduaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzaeY-004ea2-2f; Sat, 03 Jul 2021 08:05:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzaeV-004eZX-4X
 for linux-riscv@lists.infradead.org; Sat, 03 Jul 2021 08:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625299525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kKIOnpxOcNmgTRp3B6WHqjm7D0aNgAomWGm0e5Ck0pA=;
 b=azDieFOiMYH4Ii+LAEJUp5/qxlmPgEsYJBW2LMW0av6GN44eroBKX+QPieNoup1obOH5ng
 xg9kHfVweDecpiwBgN/OlwLBZ2hf4IP2XLjTqmOriKV7vw1nBr0tNzZTHsSPS6/mNvsCsk
 rgJX50lG3VnmLkAnmoBUWsCUax1R5zo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-pb9obrkkNoOgGg7suKXSig-1; Sat, 03 Jul 2021 04:05:21 -0400
X-MC-Unique: pb9obrkkNoOgGg7suKXSig-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020adfa1d20000b029012c379fbc45so3946963wrv.22
 for <linux-riscv@lists.infradead.org>; Sat, 03 Jul 2021 01:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kKIOnpxOcNmgTRp3B6WHqjm7D0aNgAomWGm0e5Ck0pA=;
 b=gAJghLIbrB2mytt10wzQtimYUrxonDR4Tasf4JH5RuuMLO30OQD666NqKY1tgEUuwl
 cWeVtRMkJju1zZAoV3XyUkEawgG9xFhe/e7efiS8xfGErIk+aM/ANjqwEbEaRp2Oid1C
 QglfUcW/gYgEKU1kgqag8KqcwXM+j9Xm7e8jeZekNOuihYAlpVpcC4fsgzODFSpyjED2
 1w5m9scZHS/8vC7Bikd8oS/yS9nw5sgIxNV63w2vgShCsdJeKUwr499S+MNUZWc3f/1j
 Dqwcv7qcYXRj/737wWfHFL7Btn9Z7zr/YUs7I4tc0nw+/4FzlLArrZFb1tSIn8r5artH
 uNLA==
X-Gm-Message-State: AOAM530+nheMdGhGvW0zfcoN6hTKndgMJdebwhbrna01Xggfq3PWcCEG
 57tqrO6mDxJR7/EL3kCQ5x9d2ntGopWdx8xjVSnYd9XIPKuYExCP5FSVAsrD4Zgwoza49+hz69S
 KjcL3dVzuDN2RPgSsYtjeml83zzVG
X-Received: by 2002:adf:a74a:: with SMTP id e10mr3938753wrd.185.1625299520741; 
 Sat, 03 Jul 2021 01:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKSHjkKeNS1veZXd/UH5HPoz05bwQZrIGUjhF4ktH5u6/iyfCkd4WgsIejTPdf0V3pNrgQdQ==
X-Received: by 2002:adf:a74a:: with SMTP id e10mr3938741wrd.185.1625299520609; 
 Sat, 03 Jul 2021 01:05:20 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id c8sm5566926wri.91.2021.07.03.01.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 01:05:19 -0700 (PDT)
Date: Sat, 3 Jul 2021 04:05:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 bgolaszewski@baylibre.com, Jason Wang <jasowang@redhat.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 linux-gpio@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20210703040504-mutt-send-email-mst@kernel.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
 <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
 <20210526033206.5v362hdywb55msve@vireshk-i7>
MIME-Version: 1.0
In-Reply-To: <20210526033206.5v362hdywb55msve@vireshk-i7>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210703_010527_478708_ACA0C88B 
X-CRM114-Status: GOOD (  18.07  )
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

On Wed, May 26, 2021 at 09:02:06AM +0530, Viresh Kumar wrote:
> On 25-05-21, 14:59, Enrico Weigelt, metux IT consult wrote:
> > On 24.05.21 13:27, Viresh Kumar wrote:
> > 
> > Hi,
> > 
> > 
> > > We (Linaro's Project Stratos
> > > https://linaro.atlassian.net/wiki/spaces/STR/overview)
> > >   are interested in this stuff. I was trying to look at the last status
> > > of all this. Few
> > > questions for you:
> > > 
> > > - Was the spec ever posted to virtio-dev list ? I thought that's the
> > > very first step before
> > > we merge the code.
> > 
> > I had posted some spec quite some time ago, but it wasn't in the form
> > of patches against the .tex documentation files yet. It's been laying
> > aside for quite a while, since I've been busy w/ other things.
> 
> Will you be fine if I take that up and restart the thread ?

It's been a while - why not right?

> -- 
> viresh


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
