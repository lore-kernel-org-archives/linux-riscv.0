Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49438C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:21:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3D932076C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X58k+G3v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTll7H9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3D932076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nihoNnOGQOWb/VeX+HhXEVQsMldiPWWIvYvkGp9P7S4=; b=X58k+G3vMa1nWeHoy90vCUUNk
	7dx7jzG178VGq2Klgu6p7vEUteEcu4dJ6cLMmP1gs4OT4vWLY5qIr+QOKT1UIY0OXfD4pmLK1JcAf
	sgLi2ivcFcfcLt/2hl+FpsKdftWCUtDZ+LUz3+NX26mwOKeIe0oli4HncmVw5TkSrSdctJ0szf4Sa
	i4gmmLlVKeDRXsc4qVfxx8Fx0t56DV3Jl8FRIy9IX73UdT6pLWaAwd4de2UKJMPKrZAydo2MHfDV0
	exZAcW4aUE1tgD2MJgf9JRcxny+dvUqXOjtzCuivM5TlfbB4JYHr0qtHX2oNI1pdXxqz5ja3DpId+
	aDWGCzOTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAbhG-0006F0-HM; Tue, 25 Aug 2020 16:21:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAbhE-0006EX-Lx
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 16:21:17 +0000
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CEA2B2083B
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598372475;
 bh=PoI9JF5btHk5sSTw0bcJpdoiKWYA/9tmzXn+FNP0WxI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aTll7H9dxJyUK9fyYYvBEfW/fcoUh82/4GHZXBMT1pKeXXMEqkTLjggXsHek71w/b
 hAqhyjQrQOgXgkMGg21eFzAZGI74k1aPzgx9irwxCNSPBvkQ+3y7jmY0drmAat9H7+
 tfk4eczieJHmExKPnuvbn1ITt9brHO1juFO13G0g=
Received: by mail-oo1-f46.google.com with SMTP id h9so33568ooo.10
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 09:21:15 -0700 (PDT)
X-Gm-Message-State: AOAM533rRJTton0Dvl83EgHbwi9Nj/5D4Jbl+Y6njxC3NDT84kJxlZED
 nLJdF9TMWvEj4M1nceeSxlRkgeAEi4IiSvJ07Q==
X-Google-Smtp-Source: ABdhPJzxUfkNriotpHAGv5AQAyBKuk14XowJiqNyCzseH1wr+QZWzE8abqHiFPx6mMQ/UOoJUCGoJ/0E0Jxv6EzFixo=
X-Received: by 2002:a4a:330b:: with SMTP id q11mr7411742ooq.50.1598372475009; 
 Tue, 25 Aug 2020 09:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <1598255421-8274-1-git-send-email-sagar.kadam@sifive.com>
 <1598255421-8274-2-git-send-email-sagar.kadam@sifive.com>
 <20200824173539.GA2939042@bogus>
 <DM6PR13MB3451089239FDA8F87BA6410497570@DM6PR13MB3451.namprd13.prod.outlook.com>
In-Reply-To: <DM6PR13MB3451089239FDA8F87BA6410497570@DM6PR13MB3451.namprd13.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Aug 2020 10:21:03 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+AfvgpXDt4vQmg2UcV7ARYKPw6hxJvuLotJH5xApz6cw@mail.gmail.com>
Message-ID: <CAL_Jsq+AfvgpXDt4vQmg2UcV7ARYKPw6hxJvuLotJH5xApz6cw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache: convert bindings
 to json-schema
To: Sagar Kadam <sagar.kadam@openfive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_122116_871655_33C7B22D 
X-CRM114-Status: GOOD (  20.19  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@openfive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 25, 2020 at 2:47 AM Sagar Kadam <sagar.kadam@openfive.com> wrote:
>
> Hello Rob,
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Monday, August 24, 2020 11:06 PM
> > To: Sagar Kadam <sagar.kadam@openfive.com>
> > Cc: aou@eecs.berkeley.edu; devicetree@vger.kernel.org; Paul Walmsley (
> > Sifive) <paul.walmsley@sifive.com>; robh+dt@kernel.org; Yash Shah
> > <yash.shah@openfive.com>; palmer@dabbelt.com; linux-
> > kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> > Subject: Re: [PATCH 1/1] dt-bindings: riscv: sifive-l2-cache: convert bindings
> > to json-schema
> >
> > [External Email] Do not click links or attachments unless you recognize the
> > sender and know the content is safe
> >
> > On Mon, 24 Aug 2020 13:20:21 +0530, Sagar Kadam wrote:
> > > Convert the device tree bindings for the SiFive's FU540-C000 SoC's L2
> > > Cache controller to YAML format.
> > >
> > > Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 ------------
> > > .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 93
> > > ++++++++++++++++++++++
> > >  2 files changed, 93 insertions(+), 51 deletions(-)  delete mode
> > > 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> > >  create mode 100644
> > > Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > >
> >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
>
> I had checked using DT_SCHEMA_FILES option due to which it didn't catch any error on other
> schemas. Without this I could regenerate the error you mentioned.
> I will fix it and update. Sorry for the error.

Update your kernel. DT_SCHEMA_FILES setting no longer matters on
current tree. It only affects 'dtbs_check' now.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
