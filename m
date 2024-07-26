Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94C3C3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 13:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cw9OGNTRRSSlbZKFlGwuwOQo6CBhCTu8DpVeE65yV+8=; b=zgZPHJQKHgbrzxx95w2W0wESSD
	WQVYTILsTpPC/1WXt/HF9lmTwwbTbygCk3puIW4c8V5ev+TRS2aDCuVoIM5wp2B/n9ZzOh8vrVJ0P
	L1t+z6PHCotxf5xy1dwZ1h+ssgevsuB2knxoPaqJm3tP2ddcF3AiNuLjrBSXwwaMyV2ZTKL4Yk+ro
	S1Mv1HSHb/iqDzdV1rMg5OJUP5GTgnrB4vCpDE3K3N1RtIQI37AGQhOOzmUCQOZyzAOxA2BQCHi67
	JVtNzlq0lm01tToCfYu6LjCdn7Z4PlXeAh0gr9J9XoS/DJ3yteie1OLw+JdkXhYItjKPoQtoerfvW
	4NdyVxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXKYC-00000003wTF-1opW;
	Fri, 26 Jul 2024 13:00:00 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXKY9-00000003wSq-2p6H
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 12:59:59 +0000
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 352B33F47C
	for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721998795;
	bh=1FaoIgcazK27xHpAWhnTuEBO61BLfDHMuFObkWX4Y8s=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CxSm85/J19JC/JJ/3ijslKqvn8rgDpUcdUb74ekehF3oIMJasjaIuLziKf9p3cJ7j
	 mG+r2aNIlP9A3jwXooXPs0UWwSY29gQo++IzKgJBdC6zQmXPEiCtHkomAFNHwmSmlS
	 KO0oKnAaa0QN+WiunyLszh++Xx2+U8WpAPKX74cq0OYciH0zjHMykKTSfL/fN56EZT
	 s7GLA00z5TNeQUsh7ELXzGSTzBJkKcpl7EtkWBl4+ogrQDWlaLpailbJHhndOQo5Ol
	 PUZwz+aUDycbMsf1W7JYL72gQXFcq/s6BHBqQ9SJeP6g8utu1imevt6rDyioHZrld9
	 X2cr7krbXZ4Pw==
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3db159c9b4bso876484b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 05:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721998793; x=1722603593;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FaoIgcazK27xHpAWhnTuEBO61BLfDHMuFObkWX4Y8s=;
        b=mbDHQFHEt62NQVvPGYiAx+Icu7IgahLEynSGwUPbHTdXVfrpTcG1WPLB7lAHqJcrzr
         wPr0uhRnVgUoGL0RpSDxW96xaVp7LMiWpVF8v2D+jkeNwABg7v6OUeNMHmDsMmn4SV+J
         ZHSSCtcQfRPkQHz4o+Nqv05QpnhEMTw+I4nqkgPs9pll7aMDNihF+y07utx8WqAQiply
         0nAdqm2jdjW5eZ2tThKcI/bZcz+ufvY4QC1W3WPBwIMxtwi/A3Xi76NMPLiuNwe8EyLp
         ZzNWH+Tek4D58CmdRZMhCJg8Opt7q+fxQhaifTGiNC+dgDg9SYPJLcCEbKQn21oPjK5b
         n3cw==
X-Forwarded-Encrypted: i=1; AJvYcCXNu61YonvkvZf5iItT7LcVJaJszKAW6lni0mfM0tGAJsOlM+dbSQyjaDjBd8pveWliGonjTkjZYQrTN7hNz32ySU5ql7AYmuJtiK74dWED
X-Gm-Message-State: AOJu0YwXOZJsWndkCHDJEp4eGXZd2TNoFx9YRiFiNCkIi6T5sZu89zUO
	IT+gyvKXKa393uHnmKxJILHb8j9Ry3sbI8FYk8YvDR/wH+4STRGTqFHd1/tGzS7uvA3Fh8FucyA
	SgbFaLLIfmYqC/pWxtZVL1qOPfi1eRrzKwWedIahhbMWTc+l4Rzjn5D4rHtcTjIDDqT5NNxlkO5
	escpD+tlOznb4eMQm2OavENYKeeMgl4EGW4wwkBGvcFXk5/24vRcEKZG/h
X-Received: by 2002:a05:6808:1301:b0:3d9:e090:5e1e with SMTP id 5614622812f47-3db140a9f79mr6565309b6e.7.1721998792762;
        Fri, 26 Jul 2024 05:59:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiUN4fyKdyXsmTQkEBFb4vT0Xp39UbgHgUlfO0wIWjYUMfsOxngCxeH3PUOM3smpR8JRzlRdM5B7RIva4IuKA=
X-Received: by 2002:a05:6808:1301:b0:3d9:e090:5e1e with SMTP id
 5614622812f47-3db140a9f79mr6565281b6e.7.1721998792337; Fri, 26 Jul 2024
 05:59:52 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jul 2024 08:59:51 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240726-likewise-satin-81a7a4a3885c@spud>
References: <20240716-majesty-antler-d9bedc7fd0af@wendy> <CAJM55Z9FAH-uiNmXDELM0gkYjHue+g8JQgOryxOCv4OXJ9f5EA@mail.gmail.com>
 <20240726-likewise-satin-81a7a4a3885c@spud>
Mime-Version: 1.0
Date: Fri, 26 Jul 2024 08:59:51 -0400
Message-ID: <CAJM55Z_QFfKOVLhKTwZCHFRC--b7QPn7_Y_Dz9ffTBGNNDcuoQ@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: remove non-existant spi device
 from jh7110-common.dtsi
To: Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_055957_994672_62B2D804 
X-CRM114-Status: GOOD (  23.20  )
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

Conor Dooley wrote:
> On Fri, Jul 26, 2024 at 08:29:39AM -0400, Emil Renner Berthing wrote:
> > Conor Dooley wrote:
> > > There is no rohm,dh2228fv on any of supported JH7110 boards - in fact
> > > the dh2228fv almost certainly does not exist as it is not a valid Rohm
> > > part number. Likely a typo by Maxime when adding the device originally,
> > > and should have been bh2228fv, but these boards do not have a bh2228fv
> > > either! Remove it from jh7110-common.dtsi - pretending to have a device
> > > so that the spidev driver will be bound by Linux is not acceptable.
> >
> > This patch is correct, but as you mention the fake device was most likely added
> > in order to use spidev from userspace with random devices added on the exposed
> > pins. In case someone actually makes use of this wouldn't this be a regression?
> > What is the right way to support this?
>
> Unfortunately, there's no "right way" that's supported for for this
> particular case. If people want to use spidev for their device, they
> should either document it in the bindings, add the compatible to the
> spidev driver and use an overlay to add the device to the dts or they
> can r bind the spidev driver to the device from userspace.
>
> The other thing, which doesn't exist yet, is a connector binding. The
> folks are Beagle are currently working on creating a connector binding
> for the Mikrobus connector - but that's rather far from complete at the
> moment.
>

I see. Thanks for the explanation. At least now there is this thread
any potential users might find.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
