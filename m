Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353FFC4743C
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 18:36:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046626140B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 18:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046626140B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5jVydlWl1DWfAmbdr6vhcRcwFkYOpQuXRq3auFf9fI=; b=pVFDprqausM7ri
	f/jgs1K7ZRsAqD6M8RIzQAH/RZaPmvOEtfmRVBbHBJELT1Ol8L103TNf91Kvh7pIwlN9Jm7nlz9m7
	RqMlmAMrEki0maY/8hgElnbP+DOwJ9ZC1W96xKyOkuJshpKbLEWp+I5hYJQXB6jzGYfBBZY0dRNAH
	vUde408qUm6t6sqB6ibpvVof85Sl7zpPodcrAe6rcl5AogxskLkFzF/PSUf7rWncxhUmsbSuV+fsA
	l3CY6NoY1abUCRi1QoUXqt85YLEJg19+SyS3kIMIYnQFmAulBDRjEgMYSrn06OEQjGCbLtkcdK8D5
	B4u8Y7W7cnzZRcK8yMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpEgU-00EsrT-6L; Fri, 04 Jun 2021 18:36:42 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpEgR-00EsqD-QW
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 18:36:41 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MoNMu-1l0jV71FhQ-00opqI for <linux-riscv@lists.infradead.org>; Fri, 04 Jun
 2021 20:36:37 +0200
Received: by mail-wm1-f48.google.com with SMTP id o127so5910531wmo.4
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 11:36:37 -0700 (PDT)
X-Gm-Message-State: AOAM530TvqIK1wKbirAd/EEddFWacZEJ5TtkQhh6L/xDel3JG8ojRVlp
 JJU2mj9i1Yny2igNUedkGRt79+bEm0sEG4VwdHg=
X-Google-Smtp-Source: ABdhPJwToM45Hdp+Wi5DdfbjyZP3na9DVtUhy8/aD4zsYx/xdlCq2bqXt89T3uaq4bh3FeccqmZDvwKFYZJbITPagkc=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr4994277wmb.142.1622831796909; 
 Fri, 04 Jun 2021 11:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
 <mhng-f1a76f5f-ad66-40ae-aad3-cd2f669f33bf@palmerdabbelt-glaptop>
In-Reply-To: <mhng-f1a76f5f-ad66-40ae-aad3-cd2f669f33bf@palmerdabbelt-glaptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Jun 2021 20:34:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0fsYwMOioFd7UqzVT0oDSKAA=cjo2o781juO1v88sLAw@mail.gmail.com>
Message-ID: <CAK8P3a0fsYwMOioFd7UqzVT0oDSKAA=cjo2o781juO1v88sLAw@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix BUILTIN_DTB for sifive and microchip soc
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:ow44WuKlamr1OR6SBsHWc/6DZY8OMJgHZLkze+s6j2I3xfmDuoe
 QBgeh/DIYLKmXcWWrLwIzdAUppTN1hxSv2BQ+yEkMgA5SnlIQoutWrAuYKVkVTX4lwqjsKr
 hdoDrqrF9N1GHYLfh9K7Duo0Wcr+7uMfeGYfKGEuuTRlyKDKY/wGsYqK/X1M1RnC2+Z4sC0
 RkUA1AjosdlAw19bu1r2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ONDxhw6xbo=:5mKI2NjHGqT0mawqD60fZ0
 cyRapRs/ofC198IVRnfb36eNTVFnDu4zdBr6WdV9dZZoAgBZ2WTVnud+tl+BDS6lYbIkgbBXP
 NjcsoN2LetoTNYjiL+tzt3/EhZSe/x6BAm7TqE3Vd7vyjA9jK36Ll6ZDUBFMjYLG6kdw5V3o2
 ewqbDa/rH3C8AcEvd7/kspWdusDt2N8X6kObQDio85w6Hh80sEy1weklli2NDHAo0E0M+64+r
 zmfQOwGW0QBoN1cmcGTKxTnJRAYuyF1IXJGjfl6M3xRR7ORx1hxzUS5wn20OYidU2yOWjdqdQ
 VfIhmqOGluwFxSEB7wTRiWMddFmCOdWWIMWuW9pqpEB4+mF/XbBJa64epX5F+etHGcNGbdG42
 9Z1J/asPmqcgPcxgiTuCRcsKSinDu/e/Tca3mLmffc/65TWYh0RqPpAXSYiR4PANHtSFL2tfm
 XgFcKyAc8JiSThfS1JQD5yRArAiAXajVWAve1Iu9cwKKqtSaThoBnV93oeVfCKnhb8y8Zewhv
 LPgW21nIyjcs2xp5lzogxfbuo3NFGqN1kZjRJcLWyNfhFPFBNONiCOOnaciXfhqhJlD93EAnU
 qT8FM/vNImV3166x+ZzWPnFYRDNZF6V0Phbufkvx6RViYGID+X32u/7g4ZkYhR9hjxY8oglz5
 hxNo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_113640_181681_AAA07633 
X-CRM114-Status: GOOD (  22.11  )
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

On Fri, Jun 4, 2021 at 5:51 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Fri, 04 Jun 2021 06:08:05 PDT (-0700), Arnd Bergmann wrote:
> > On Fri, Jun 4, 2021 at 2:06 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> >>
> >> Fix BUILTIN_DTB config which resulted in a dtb that was actually not built
> >> into the Linux image: in the same manner as Canaan soc does, create an object
> >> file from the dtb file that will get linked into the Linux image.
> >>
> >> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> >
> > Along the same lines as the comment that Jisheng Zhang made on the fixed
> > address, building a dtb into the kernel itself fundamentally breaks generic
> > kernel images.
> >
> > I can understand using it on K210, which is extremely limited and wouldn't
> > run a generic kernel anyway, but for normal platforms like microchip and
> > sifive, it would be better to disallow CONFIG_BUILTIN_DTB in Kconfig
> > and require a non-broken boot loader.
>
> When we first added BUILTIN_DTB we actually had a compatibility
> mechanism in there.  There isn't enough in the ISA to handle board
> compatibility, but we were hoping to get something to deal with that.
> It didn't pan out so we dropped the compatibility mechanism, which is
> how we ended up here.
>
> Maybe the right thing to do here is to add some sort of "be compatible
> with the platform spec" Kconfig, which we could then use to disallow all
> these features that result in non-portable kernels?

Yes, I should have read your email before I replied with the same
suggestion to Vitaly ;-)

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
