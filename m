Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031F6C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 13:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3D420837
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 13:57:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ir9KKZEh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s00IBoPV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C3D420837
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMEdd2LlZyu+vXyKml2I9MP/DSV1SX1Hed/VFqbtZc0=; b=ir9KKZEhtjjNMN
	iDGhQTh4nqbrlmi8+B/9o+l09tYwPEsVBIs2gi1+RQ8ghoIp2eql4RwY8YKnxveVabnm+x7FkMSEm
	cO5VfDb1QO/psIaSOzMIFNt2ddRYq2/18uVlqCNVNFEuugp3OpzpH/Px9ijOwFP7fUURPRMov5NFn
	M83kwBrp0l6vcVeYkkwnNYNtPJkxu/Mu6nPlfSamNb/r/hRZxVnowAMlZaHZpNsyymgeNUb9rQASF
	yJ+6ZVcUi7XaUkYrENiJllZ0onLWsSga/mKnlzsqN+bGTgkt6tubcuB90oypU+lTAcwq+MAW42hDx
	YPaISQ82jkQuGlV4ElTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVGdI-0008DH-BF; Fri, 07 Dec 2018 13:57:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVGc3-0006qR-A3
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 13:56:22 +0000
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7F42214F1
 for <linux-riscv@lists.infradead.org>; Fri,  7 Dec 2018 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544190965;
 bh=9U0OX/5xeDsbOuEsPWWOkrNikvceTJpvJOYWI9L/Cmk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s00IBoPVv0ha+owBExjnNoUX7pEsYgeLqhWH/mZv8kXEI1lQ9vnQmcZ6BJUfF1E46
 bmyJssXcqDp7r3B0Relrx0G1NgKg7/MLonWiqo725dKqXTrEOg4O4WsFV5I+yQ+4LF
 vXXUywzRFE7Ux/pJof7L5E+KGacB+KpfFO3njo2E=
Received: by mail-qk1-f180.google.com with SMTP id w204so2447567qka.2
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 05:56:04 -0800 (PST)
X-Gm-Message-State: AA+aEWben1Fu7BoZv214+/Bis3MidzQKu1MkVhhK6qxh7VNM6qrneWTG
 934DXNv1B9ZEExgT2VOtl6adSrlEyDy83wweig==
X-Google-Smtp-Source: AFSGD/VwL9rISYKulfb3/dajjR5ko5f5mSBBHnBCon5WCu2Jlh8hS3hsvSMHqqEmFkgv/fGosEkLBhj94YKLlCdS8Mk=
X-Received: by 2002:a37:b646:: with SMTP id g67mr1908938qkf.326.1544190964068; 
 Fri, 07 Dec 2018 05:56:04 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
 <20181207000104.GA10814@bogus>
 <alpine.DEB.2.21.9999.1812061645070.29609@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1812061645070.29609@viisi.sifive.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Dec 2018 07:55:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJgt3VxHLcxY54Ojpqz_bLwGSySZ9meowgy6pnLPdXuLQ@mail.gmail.com>
Message-ID: <CAL_JsqJgt3VxHLcxY54Ojpqz_bLwGSySZ9meowgy6pnLPdXuLQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_055615_942136_2D66F2FF 
X-CRM114-Status: GOOD (  18.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Wesley Terpstra <wesley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Megan Wachs <megan@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 6:46 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
>
> On Thu, 6 Dec 2018, Rob Herring wrote:
>
> > On Wed, Nov 21, 2018 at 05:06:56PM -0800, Paul Walmsley wrote:
> > >
> > > For IP blocks that are generated from the public, open-source
> > > sifive-blocks repository, describe the version numbering policy
> > > that its maintainers intend to use, upon request from Rob
> > > Herring <robh@kernel.org>.
> > >
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Palmer Dabbelt <palmer@sifive.com>
> > > Cc: Megan Wachs <megan@sifive.com>
> > > Cc: Wesley Terpstra <wesley@sifive.com>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: linux-riscv@lists.infradead.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > Signed-off-by: Paul Walmsley <paul@pwsan.com>
> > > ---
> > >
> > > Hi Rob, please let me know if this document works with your
> > > requirements, or if some changes are needed.  - Paul
> >
> > Looks pretty good to me.
> >
> > >  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> >
> > Use the path that was suggested.
>
> Could you remind me which one that is?

In this thread: bindings/riscv/sifive/

> > > +
> > > +An example is "sifive,uart0" from:
> > > +
> > > +https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
> >
> > That's nice, but will be out of date as soon as someone adds or removes
> > a line above it. Can you point to a tagged version?
>
> Will do
>
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
