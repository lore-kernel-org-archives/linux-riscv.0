Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89473C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 23:02:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 096722067C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 23:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iX7m6PAA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xcPtGsov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 096722067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PEyEg2c8/6MORivCtP4dIEwjXDkrmlfQ1yYFXuY8uYs=; b=iX7m6PAABHojE3/QZB0HDQBEI
	oOAu7C6yC62EI3fpq4eQOglgeGew6/dofD/y7L+SnFY7sBy/fxNQVjmOG8NcZkMgBQudDGTcTWopY
	YGx2I/MeWSUMVBfTScc85NiBwoE+s7kf2sdmaeTtVSVdAaeXGX1jWswHFj0Di24BPzINqKE2lwU8d
	kbRcdiKcZ7rZvI7oBIHxOdDTtXomoVPexpWG+QfGV0biQ1tB0jWN2QOwAbIz050hScIqM2ngdQzk1
	MgyfW2UtYAUqvyeMQXUP9lZV+wzzo+F2sYcevQ6B63/8NrnxNmizDA0Vkwysl0L1fwn9pLa3L7WWO
	TNqxBjLVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcGAj-0003oQ-Mz; Mon, 09 Nov 2020 23:02:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcGAh-0003nt-Ee
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 23:02:00 +0000
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E86F320867
 for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2020 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604962918;
 bh=bdVwG8FdK8vGdGJpj6PbiUz89A7YebtbgtmC+QRlL7E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=xcPtGsovGAopPW00WPdEEdc8JNgrZGL3OjANQE2oz9EMHmLZLzH4/ofW08tvno22F
 IhLaOGHU6FHCtNKAtCVnMTDzIduTOyLsYAcrtzdzF4ogMtQi5fR8CNZCKzPAlfBcx6
 BKetx0PTsqPbZFiRzCjTwTIeBymy32Ez7X+i6t48=
Received: by mail-oi1-f180.google.com with SMTP id m13so12102226oih.8
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 15:01:57 -0800 (PST)
X-Gm-Message-State: AOAM5339TOmc6tDEuGXLcD5zAU5S5pjNNAanDkbhVm9MidzcXH4uQ6Se
 hu8PrbVuzzlnTvQOpWZUQh7O8xZGThKZz0m1Iw==
X-Google-Smtp-Source: ABdhPJzCZJCbfWEZKn7ljIDJSDyRopmT9Qy63j3JoNPd/CoI6RdzJ+BkiuvBYn5qdzN6veChd5BwrgPBR1ZoRr0Mg58=
X-Received: by 2002:aca:fdd4:: with SMTP id b203mr1033604oii.152.1604962917159; 
 Mon, 09 Nov 2020 15:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-16-damien.lemoal@wdc.com>
 <20201109215913.GA1828781@bogus>
 <9e0bf865-99ff-3ca4-c693-34fb3d155c80@gmail.com>
In-Reply-To: <9e0bf865-99ff-3ca4-c693-34fb3d155c80@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Nov 2020 17:01:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJweFy90h0VuXnZ2fm-7oeuF6wHKh9dN-ZMDcDowU2GCQ@mail.gmail.com>
Message-ID: <CAL_JsqJweFy90h0VuXnZ2fm-7oeuF6wHKh9dN-ZMDcDowU2GCQ@mail.gmail.com>
Subject: Re: [PATCH 15/32] dt-bindings: Define Kendryte K210 sysctl registers
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_180159_613154_41E97B9E 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 9, 2020 at 4:10 PM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 11/9/20 4:59 PM, Rob Herring wrote:
> > On Sat, Nov 07, 2020 at 05:14:03PM +0900, Damien Le Moal wrote:
> >> Introduce the dt-bindings file include/dt-bindings/mfd/k210_sysctl.h to
> >> define the offset of all registers of the K210 system controller.
> >
> > We generally don't have defines for registers in DT.
>
> At least K210_SYSCTL_SOFT_RESET is necessary for the syscon-reboot driver.

How does a generic driver need your platform specific define? I meant
just use numbers directly.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
