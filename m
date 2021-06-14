Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB25C2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 16:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9789760234
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 16:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9789760234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22Bes+QG/e1Nm/5XRL0vG4akYLioNcrJGnlsQP+7Yj0=; b=X9uVpPrmzjbUrq
	LezUrMFlBWzCiHaZRzDGADPh15DmH580uMeHHtF5sz4tjLJv0lwm2nJ3wEaxXBEAqaZ5AzIDdeppJ
	1vVcx1oPaCSWDAqNu5IATMqIZOcSFcDQxnKgFJjQEwBAj0vH+fhVtxkheARZX8kQgTsuW8H/FgAv1
	G4sBQlJ8aytOiZWWZiCdQYbGSeFmMjxsRJEZbFpi7moxH7utK+NVMadLu8UoQ31zz0VkZH7ffd/BB
	a8TRFJWogZgSCJK9BR3LV62ATWtQspvROco2TMYegyl9zU0p+zBBdjzjMQw+77ufKRqBD+HaAwsIQ
	HrCODstqEkic0HGQtAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lspSA-00F8Zb-BS; Mon, 14 Jun 2021 16:28:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lspS6-00F8XY-J1
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 16:28:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5555613F1
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623688121;
 bh=QuC0LPIEqeWDHCOkT2QGTkfSNaoCYgvhRIgurH/K7cU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GDTMEM6yiElC5EiyXI3i5gIF36gt5e1ndXybFuN2yPPN4OLMd5j0STcFhM5l0JyFj
 LS41pFBMXKABI7CJPlEf37oFUfqhdfCOUW4w5YouPcQYkFpn4dBIYwPnGrQW5yWl0c
 X0rLx+kqO/wzPCG68MEQOyUAbR9n24kyJy3YE1QvmSUlFQMVmXbI7LO3nX/s6tI1sF
 SutoCNgF/y1CKu9q8Y2HVC21EkFREOscbzrhXseysHHQGhY/MWHHdb0t0mZgw5JlbR
 0yX72M/cU93jKwgB+/R9wMyJSdgAZRtFToJ53mMYI3hb5XkTUOvKwjvhRDsDsv6Gad
 UQV32aKADutcQ==
Received: by mail-lf1-f51.google.com with SMTP id j2so21939424lfg.9
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 09:28:41 -0700 (PDT)
X-Gm-Message-State: AOAM5304jLmjZY2NXFFJqZbCO950NF1+0URtzqAi50h7NzwRwYHqYK04
 t+Cf8SHz/CbTxvs48G3NILYaMnNTWoX9avdB8xc=
X-Google-Smtp-Source: ABdhPJxzeTa4/PiD5gCCDYqdxYkyzOIVBvy0RvjMV8prCb5Cw8b/0l0fXUuPdkd9faq3+17/mxMh9Sw5wNk+ROQT/nU=
X-Received: by 2002:a05:6512:3f02:: with SMTP id
 y2mr12850956lfa.355.1623688119927; 
 Mon, 14 Jun 2021 09:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-13-git-send-email-guoren@kernel.org>
 <20210607072434.3g3bqxdlpxjirg6k@gilmour>
 <CAJF2gTStppyEoLD-ZToeHYdnzNoFhH2+3Lhd76=M8OFKS=Syow@mail.gmail.com>
 <20210614153341.z2nkx6sazaahhjfd@gilmour>
In-Reply-To: <20210614153341.z2nkx6sazaahhjfd@gilmour>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 15 Jun 2021 00:28:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTfMAGbHv3PN_0BmA1pRqU1UvZny4mKg14AtWKjAm8=vw@mail.gmail.com>
Message-ID: <CAJF2gTTfMAGbHv3PN_0BmA1pRqU1UvZny4mKg14AtWKjAm8=vw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/11] riscv: soc: Initial DTS for Allwinner D1
 NeZha board
To: Maxime Ripard <maxime@cerno.tech>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_092842_699023_BD85B53C 
X-CRM114-Status: GOOD (  13.80  )
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

On Mon, Jun 14, 2021 at 11:33 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Jun 07, 2021 at 04:07:37PM +0800, Guo Ren wrote:
> > On Mon, Jun 7, 2021 at 3:24 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > +             reset: reset-sample {
> > > > +                     compatible = "thead,reset-sample";
> > > > +                     plic-delegate = <0x0 0x101ffffc>;
> > > > +             };
> > >
> > > This compatible is not documented anywhere?
> >
> > It used by opensbi (riscv runtime firmware), not in Linux. But I think
> > we should keep it.
>
> This should have a documentation still.

Could we detail the above in [1]?

1: https://github.com/riscv/opensbi/blob/master/docs/platform/thead-c9xx.md

>
> Maxime



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
