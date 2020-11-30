Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD1BC64E7B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 15:36:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9DC6206C0
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 15:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OiXtWWzS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXcLdHi6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9DC6206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TdoVti8li0Z7clfgOTEo4uHufKxNpERbKKflfVOG1f4=; b=OiXtWWzSiKKg/RHIy0FWmrPzQ
	AZ/JTqPUOTMHHeVNSQx4KMfFHv8brenMBST0PfIfgJe9nmQVr5ePDGSiWzewai02aydgB+0sELwxE
	ZRI6Pv2/AaUgsUTBNSyKVXJHLDRvDWMm0o0tJY+8JYfegjorTLrz8MB1leH5wK52U53WrTUdNzSj3
	r9yqvrt9oIjuS7snqGB9XzuA5+lK9F23ajWQLG6/AmtOpfWB46dddwpXF3X9FkSiTvoN+RqIZELf4
	7oXjFf7GlsFd3Ogrz7DID1XRqvhXLrSRnf4Qg1nTy262AG8xOQ3lqbCyhf8NZROxleWuS4MlFEkDF
	6z93Hhfjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjlE0-0000mz-P8; Mon, 30 Nov 2020 15:36:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjlDy-0000mI-5D
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 15:36:23 +0000
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45F1620725
 for <linux-riscv@lists.infradead.org>; Mon, 30 Nov 2020 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606750580;
 bh=LzsPK0L9PUxgZ6Z+37fS4TS1uDQ2SzZG9WCwz1ZOsgM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mXcLdHi6/vI0ZnBL6aMniEUMTAcGPibdZXYZIGd4FwUOv6Kp8ngTcEugAxRct5IU0
 XrDAIX5lEawYz8bjbG2kkwo7hFFava230fTsjpBiZ7nFGznkf3kIM+3WXy5gIlAPov
 Xb/02fkxekRvwz/ZugD64UozkzQFjFdmxQsMw6DU=
Received: by mail-ej1-f48.google.com with SMTP id f23so2613281ejt.8
 for <linux-riscv@lists.infradead.org>; Mon, 30 Nov 2020 07:36:20 -0800 (PST)
X-Gm-Message-State: AOAM530l4LG0HXYvwlxtkRVNgH9p5adUle4J6dPe1VmEsmJAB/ypPyRd
 8eEsKNnukhaV5Dbb3BTVsl6hQpjKFZy55A4Jig==
X-Google-Smtp-Source: ABdhPJxWrvafzpbFRaZpB7xhU0lMwNaXi8tL7tYdUxlmVXzNWJKkwJnGaiNrJS+0OBFJq4dDKn0z8a9HVtiXLS5lu1U=
X-Received: by 2002:a17:906:a418:: with SMTP id
 l24mr8806944ejz.360.1606750578769; 
 Mon, 30 Nov 2020 07:36:18 -0800 (PST)
MIME-Version: 1.0
References: <1605172274-44916-1-git-send-email-yash.shah@sifive.com>
 <20201121125443.GA2076465@robh.at.kernel.org>
 <BY5PR13MB445328314FB3521DE257C57782FC0@BY5PR13MB4453.namprd13.prod.outlook.com>
In-Reply-To: <BY5PR13MB445328314FB3521DE257C57782FC0@BY5PR13MB4453.namprd13.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Nov 2020 08:36:06 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLy8kVNcMwkHCXRPvazrRmX+mfUmD4iwAAFvna+1zRaXg@mail.gmail.com>
Message-ID: <CAL_JsqLy8kVNcMwkHCXRPvazrRmX+mfUmD4iwAAFvna+1zRaXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Update l2 cache DT documentation to add
 support for SiFive FU740
To: Yash Shah <yash.shah@openfive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_103622_363138_3F234229 
X-CRM114-Status: GOOD (  28.99  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Sagar Kadam <sagar.kadam@openfive.com>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wsa@kernel.org" <wsa@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "bp@suse.de" <bp@suse.de>, "sam@ravnborg.org" <sam@ravnborg.org>,
 Sachin Ghadi <sachin.ghadi@openfive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 23, 2020 at 3:32 AM Yash Shah <yash.shah@openfive.com> wrote:
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: 21 November 2020 18:25
> > To: Yash Shah <yash.shah@openfive.com>
> > Cc: Paul Walmsley ( Sifive) <paul.walmsley@sifive.com>;
> > palmer@dabbelt.com; aou@eecs.berkeley.edu;
> > Jonathan.Cameron@huawei.com; wsa@kernel.org; sam@ravnborg.org;
> > Sagar Kadam <sagar.kadam@openfive.com>; anup@brainfault.org;
> > bp@suse.de; devicetree@vger.kernel.org; linux-riscv@lists.infradead.org;
> > linux-kernel@vger.kernel.org; Sachin Ghadi <sachin.ghadi@openfive.com>
> > Subject: Re: [PATCH 1/2] RISC-V: Update l2 cache DT documentation to add
> > support for SiFive FU740
> >
> > [External Email] Do not click links or attachments unless you recognize the
> > sender and know the content is safe
> >
> > On Thu, Nov 12, 2020 at 02:41:13PM +0530, Yash Shah wrote:
> > > The L2 cache controller in SiFive FU740 has 4 ECC interrupt sources as
> > > compared to 3 in FU540. Update the DT documentation accordingly with
> > > "compatible" and "interrupt" property changes.
> > >
> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 33
> > > +++++++++++++++++-----
> > >  1 file changed, 26 insertions(+), 7 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > > b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > > index efc0198..4873d5c 100644
> > > --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
>
> <...>
>
> > > @@ -51,12 +54,6 @@ properties:
> > >
> > >    cache-unified: true
> > >
> > > -  interrupts:
> > > -    description: |
> > > -      Must contain entries for DirError, DataError and DataFail signals.
> > > -    minItems: 3
> > > -    maxItems: 3
> >
> > Keep this here and just change maxItems to 4. Really, what each interrupt is
> > should be listed out as an 'items' entry.
> >
>
> Sure will send a v2 with the above modifications.
>
> <...>
>
> >
> > > +
> > > +else:
> > > +  properties:
> > > +    interrupts:
> > > +      description: |
> > > +        Must contain entries for DirError, DirFail, DataError, DataFail signals.
> >
> > DirFail should be last so you keep the same indices.
>
> Actually, the interrupts have been numbered like that in FU740 SoCs and the driver expects the interrupts to be in this order.
> I will keep the same order for v2 as well. Let me know if you still disagree.

Numbered within the cache block or the interrupt controller? If the
former, then fine. The latter would be outside the scope of the
binding. Another SoC could hook up interrupts differently.

It's going to be easier for the driver to deal with 1 new irq index
rather than 2 whole sets of different indices, but if you want to do
it the hard way...

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
