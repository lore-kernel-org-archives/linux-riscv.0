Return-Path: <SRS0=hpeE=VZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34D5C7618B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Jul 2019 13:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F2921842
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Jul 2019 13:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FIDZwTTH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgfNebPe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F2921842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scpMrzgis/xb2T7EdmGIV8r73ETgDFCWCRTx2zqSKxA=; b=FIDZwTTHJyYTE+
	A8KohqHPBJEypv1Ra0B8PXqB3LgpwNNSACdnngB1igAskCWVCgEZeXBd/LSqPuCUWDfhf1bxv08Nd
	uhPUESsJENXL772pGqV8jpkFXNONN1a+oLuS0QyTyBrZiDCFKUE8NuwECtsdP+zNDXwOMt1mopzAF
	mtS3L5nVlPbpzITKZZFO7Ghkxjep0Q4TREG0lfrwAQQdiX244UdlXxYULpeJAyVk6kNH6gXCpljm5
	XXKkRrbiRkpOKzcMrs5rd05wJyCyJyThSvzM3P57g97cqA8CQ7TFVUqCc8eTj+fNQgDr67dIYmuHP
	nuhfNKgAqFif68RR5JzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrjUW-0005Lk-92; Sun, 28 Jul 2019 13:45:36 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrjUT-0005LK-2B
 for linux-riscv@lists.infradead.org; Sun, 28 Jul 2019 13:45:34 +0000
Received: by mail-ed1-x543.google.com with SMTP id w13so57092399eds.4
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jul 2019 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2zp7VZgo7gRFXS38Tm1zr34TgnjCWRWdIBcQSP1RHuo=;
 b=sgfNebPeC/Q743cR44AI97kFXhFTzrd62akNIUz49b6KNl/WXGYYOeqSdxmh0X/GLa
 wM7T/wlg00lDg53ul8meQswE8zZnKUu0hMo3oTpdWMYCP7iTZQzrIWGJ1Lu7DxyfShXZ
 YJlZZD4ykunOFsEEGbmIvy54JnV8LFHgDVkAZJP0/JbjZXZpPi1crfosPIVkfR1cDvoR
 rlcpZdVTrADupOvaVtzIVOp+etlcKxs7HCE5WrP+Z8qJOHP67GnD/xQlnqYxD1esHmTT
 tKrYjefQkQNt8bWTBZQD+YYfpx9YyLJ41T+qv5F3cHXqADjYuxZ/nNIyxWSJ9r1FX0tX
 xO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zp7VZgo7gRFXS38Tm1zr34TgnjCWRWdIBcQSP1RHuo=;
 b=de6ykPpNtSIw7FGavczjwI3buugIED1VhIhwztsulqM4tLwzP4c58T0BFQ2TWqlTt8
 Gj/w0PY7dguTP5ndD8DxonEvt8TJb8ql5QqLEg8f52u3akgYN5VIwByOu5CiivSsrozS
 rUZpdk2DxcN+IM6312jqXaX+qivt1us3p3HwuWXotHR6yUc5YJ96IXV7BpHGzXbKIUde
 mwTLSrFb/Qx1kR2cvUUhuSjVDw37f3lT2vsYRJGe95IDQg0/A+jum33mIAmjZpaTFb3X
 LkwveCMqB4JHUhNQhH+GyVmEhZ6avpJbrht26oksZIa93w2M5bDXCRxp61cvjOv5cDZp
 KEag==
X-Gm-Message-State: APjAAAU5J0wyDevf+hfeNiWpLQ0CirTteNCDJEGo6v0RO94A1vNkOxlT
 v/b4iARsFbmBIPkbsV/u698SaxcIl596QTZXFn4=
X-Google-Smtp-Source: APXvYqxZF5BQ5WWg803jI2sv2cFegFLpIDrN1WzdSX6Eb/wxCph/GHviMtFAJZwBBLp1CqEsXEX6fsVsEoCdCzQylno=
X-Received: by 2002:a50:ad0c:: with SMTP id y12mr89789151edc.25.1564321531714; 
 Sun, 28 Jul 2019 06:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <1562298766-25066-1-git-send-email-bmeng.cn@gmail.com>
 <MN2PR04MB60611BD1B89E3D76ABFBE94A8DF50@MN2PR04MB6061.namprd04.prod.outlook.com>
 <CAEUhbmWdLoRU1QGVZtwmymtYyQw43UMR8WDB17rJRmvXGbuBTg@mail.gmail.com>
 <20190722081157.rojxwc6qrsplpduo@salmiak>
 <CAEUhbmWLuFKdM0UhAvp2hjrDwYc5yxX91pZKOt9DHmb_oV-mJA@mail.gmail.com>
In-Reply-To: <CAEUhbmWLuFKdM0UhAvp2hjrDwYc5yxX91pZKOt9DHmb_oV-mJA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Jul 2019 21:45:20 +0800
Message-ID: <CAEUhbmWJe=wk9VV9dRAmVYUPVTogW6q9ULwm1xFxi5iLJOdSBw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: fu540-c000: Add "status" property to cpu node
To: Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_064533_132764_F13DB431 
X-CRM114-Status: GOOD (  16.76  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <Anup.Patel@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 22, 2019 at 9:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Mark,
>
> On Mon, Jul 22, 2019 at 4:18 PM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Fri, Jul 05, 2019 at 01:11:01PM +0800, Bin Meng wrote:
> > > On Fri, Jul 5, 2019 at 11:59 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of Bin
> > > > > Meng
> > > > > Sent: Friday, July 5, 2019 9:23 AM
> > > > > To: linux-riscv <linux-riscv@lists.infradead.org>; devicetree
> > > > > <devicetree@vger.kernel.org>; Rob Herring <robh+dt@kernel.org>; Mark
> > > > > Rutland <mark.rutland@arm.com>; Albert Ou <aou@eecs.berkeley.edu>;
> > > > > Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> > > > > <palmer@sifive.com>; Yash Shah <yash.shah@sifive.com>
> > > > > Subject: [PATCH] riscv: dts: fu540-c000: Add "status" property to cpu node
> > > > >
> > > > > Per device tree spec, the "status" property property shall be present for
> > > > > nodes representing CPUs in a SMP configuration. This property is currently
> > > > > missing in cpu 1/2/3/4 node in the fu540-c000.dtsi.
> > > >
> > > > We don't need explicit "status = okay" for SOC internal devices
> > > > (such as PLIC, INTC, etc) which are always enabled by default.
> > > >
> > >
> > > Yes, that's fine because those device bindings do not require them.
> > >
> > > > Absence of "status" DT prop is treated as enabled by default.
> > > >
> > >
> > > But per current device tree spec, "status" in cpu node is mandatory.
> > > (spec uses "shall"). Missing it is a spec violation.
> >
> > I think this is a spec bug (or at least misleading wording in the spec).
> >
> > IEEE 1275 says (for status as a generic property):
> >
> >   The absence of this property menas that the operational status is unknown or
> >   okay.
>
> Yes, I checked IEEE 1275 doc, and it indeed says like you mentioned.
>
> However, it says "unknown" _or_ "okay", yet provides a definite value.
>
> >
> > ... and I think it's fine to treat that the same as an explicit "okay" here, as
> > we do generically in Linux.
>
> So what Linux does is a defacto interpretation?
>
> If everyone agrees this is a device tree spec bug, I will submit the
> patch to devicetree spec then.

Any comments from the device tree folks? thanks!

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
