Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA2BC001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0cZtEOurPz/ujxv7jz9Z0ti5NG/3ZeoB2MtHQO/AQo=; b=CVUQr3rTvzCJ6f
	XjyUU1UKv8jEgJIY2rNSt7QCOxnuzGscrXe7tetrNnVcycooErM2hawgUbCKerZgYJUh+UW/H3eHp
	1r1/aZSx9dwF4yoxWzrKdPpGcy1flSkiBBdVQ/SGI8vdwdlAP541a9CQNimjYLmtCJ04T+4TJdNKK
	isQLJIQw8doiP+k3tmA+aukU4lkjvHjZv48af3IFGyypLA9M1IEjUj7Z5wFIOS4QTkV7rUflHGE1T
	VOvdje01L0GJWMdvXxQqpLJUN4Q3z58FKKruKAePXHJwCrOAB/LkU7DAs+nIq9utRU/kHHdXG8Gjd
	obghAUjVJNUjVlD3XAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3x6-007Svk-07;
	Thu, 10 Aug 2023 11:35:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3x3-007StZ-25
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 11:35:39 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 74EA141BF6
	for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691667333;
	bh=2n7sB/P+MVxtCrGdSlK3vHO7bX9b4hfYELYwbpKXbRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=E5B/sVx5M6ziVs+k7F8P8onXPUE3All9dtxryUQ04dpn/UJb8IAvMF5ojpD0G5sGd
	 yVDmL4WOLTlcvBsI8P1hcWkZKe5uK+sxpUhssoG9+op9xZLhmpsaOEDHWnUmOZAOL1
	 ZP8i3RvH/9VoZGs1NXTCWq5eO3Go/S13W6gruXZD61QW1GeKHtmrbJ57E034py+eaX
	 WN4ZJtMmV16Uri/HahnEqTJtkr7BRE8Px0u14tJvqbSAtd8Bi0Lqpo4gJE+k3rXCV2
	 UqhkNljLS8BJLwFfo92bAymBuDpMO0MOgTwaCYJtuzE7jFbLGHlyh8M0p3bPCjeybu
	 PjCxOT12Y84BA==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-40ea01f3e3bso10168241cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 04:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691667332; x=1692272132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2n7sB/P+MVxtCrGdSlK3vHO7bX9b4hfYELYwbpKXbRE=;
        b=DqY3PbaiI6qz7GSY+EnYFU0QDnBsu3kcRjw8Ze6ZoxzPo+bCMaONllyLN6V8itvvP7
         6LQZL/XjjWJGpehSD9QJoUJYTSf5SO5dxhxbup2KdOA+Khrbdaec/yi7err4xc13WQa4
         HdBpR6T0MJUE3H3xvYqsDboEWM33sc9WO725OGGVhoVtXo7/jc9aJh3bmQMvLNEsuPcn
         7+v6dtKOHEroOGPZTxZN25CXXkPGBYHTg2P2M4fgfO/DV1Kg3/1Rd1fZxWt/dCAL1EW8
         WEBUGpbva0azu7b0CBVyuvxZ1UXDqCtnCOsjvewcHKy9nypbm+vSPNg9+ypOmCgr/mJL
         1KwQ==
X-Gm-Message-State: AOJu0YyekbzCOvOrvKh26g5/EfV+RgrqC2uUBsJGiSVuphUycfjYPkGG
	8go8hfL2E6c7TYhPa5xaEPGydyeBbPpvM1qqzcRO3jRvyxVs5xPWgb3pzW6hhV35AXX3DuMwk63
	Rzz9u5L+vDrXg0hC3inK8TV4fQmTQ3XvI4uLaF8Zj8u3rxcyFm9q2c0JRQzv1Rw==
X-Received: by 2002:a05:622a:1648:b0:3ff:c677:a033 with SMTP id y8-20020a05622a164800b003ffc677a033mr2266452qtj.29.1691667332582;
        Thu, 10 Aug 2023 04:35:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8D2jRMka03WDcJfPuExlGjBBiL8v0s6iUaabJoidV44if4B92MIxNJM8K0yJh2I2+HR7DBIjvEpbhH7u6S8Y=
X-Received: by 2002:a05:622a:1648:b0:3ff:c677:a033 with SMTP id
 y8-20020a05622a164800b003ffc677a033mr2266430qtj.29.1691667332353; Thu, 10 Aug
 2023 04:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230718034937.92999-1-hal.feng@starfivetech.com>
 <20230718034937.92999-4-hal.feng@starfivetech.com> <20230718-progeny-edge-70b1a395f2aa@spud>
 <e63baeee-134c-db4f-f350-b3526a0ae571@starfivetech.com>
In-Reply-To: <e63baeee-134c-db4f-f350-b3526a0ae571@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 10 Aug 2023 13:35:16 +0200
Message-ID: <CAJM55Z_p4rFXVOUvXKRPH1r7KSXkVbSNtZAGA5Dyzw7TNfuLtA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] MAINTAINERS: Add Hal as a maintainer of SFCTEMP
 HWMON DRIVER
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_043537_810183_731C8291 
X-CRM114-Status: GOOD (  19.04  )
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

On Fri, 21 Jul 2023 at 05:24, Hal Feng <hal.feng@starfivetech.com> wrote:
> On Tue, 18 Jul 2023 15:20:15 +0100, Conor Dooley wrote:
> > On Tue, Jul 18, 2023 at 11:49:37AM +0800, Hal Feng wrote:
> >> As he is the submitter of this driver, add his mail so he can
> >> maintain the driver and easily reply in the mailing list.
> >>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  MAINTAINERS | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index aee340630eca..5056079ade77 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -19256,6 +19256,7 @@ F:   drivers/net/ethernet/sfc/
> >>
> >>  SFCTEMP HWMON DRIVER
> >>  M:  Emil Renner Berthing <kernel@esmil.dk>
> >> +M:  Hal Feng <hal.feng@starfivetech.com>
> >>  L:  linux-hwmon@vger.kernel.org
> >>  S:  Maintained
> >>  F:  Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> >
> > Whatever about the other patches in this series, this one certainly
> > needs an Ack from Emil.
>
> Hi @Emil,
>
> Would you mind adding me as one of the maintainers of this driver?
> Within StarFive, I was appointed to maintain this driver.

Hey, sorry about the late reply. That's absolutely fine by me.

/Emil

> Best regards,
> Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
