Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF27C433E6
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 12:33:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AE8C2065F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 12:33:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S2ANE5CQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="tfdHs4lV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AE8C2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E/zzRnYG83ILh9K/UzmR/wnhV6LOGCg476eq6wa6HDA=; b=S2ANE5CQDq09Y3hBd1a4tuEfr
	RQkJYHyY21491aPAY4QGwekPJ0X9yRFYFC38HgMtiblpoVSM+YwzwbddC6CJV+JSOFWKpUl5dmxLW
	/6mmvwUcUhIe1UXjf3iuE1depftr2coz48Yz4RHUsYBV6Ag9RB5GA4nCJc28L5n8HXSrFfUsxce0q
	P4DUT44GGZThek4YRISP+Eh+9L//nhEUF5xRRPi+qMzjCBY1FzcxGElpylCNlwjQs3pslPxzQUs2y
	BBzetw8BFskc2fXFBYxvniPN+u+i7YRgaftsXWosI6B+u2e42uvq5+e1g+XzLGTnYE/qvFSzouY3U
	6wOj2IM7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw34V-0001VS-BJ; Thu, 16 Jul 2020 12:33:07 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw34S-0001Um-Bf
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 12:33:05 +0000
Received: by mail-wr1-x443.google.com with SMTP id f18so6927510wrs.0
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1zGcH9bVraCGk1IyMWJVQQmzfwhx9ePyMUGS1rXIGzc=;
 b=tfdHs4lV3K1enQd/i8s/Y6ZQJcIQR2GjSzPEft7fLp2riOkywEsf/h2zgU+UhXyK6G
 AxAt6X3dUnVl9vizC0D6H8AfMhrF8y5naSh6oNGfDOmbMows6v3dIja6f2KqCs/i2k8K
 dasNhnny1vRKtRS32czBtK4UeDHp6VwUlRMj4OUrHXlHhcZHRVfmpuAJhHufyHuVftrQ
 5rnIUkocevRCeyi6vVw/RUWul/oDf3sZqBrr6jYtAJ52EIWeZCLfd9xHS3hUz6TCmYpy
 +UXs28JOLgCXCzGUtKXuDtxyV2xr0jQ8P4hlqUAOTlKb3xbTNvFZ4JumeLGPD0T3lS+a
 P2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1zGcH9bVraCGk1IyMWJVQQmzfwhx9ePyMUGS1rXIGzc=;
 b=aJ4PJaFMbgip6bluGA4AtzRmvbt1dyg6l4oq3fH581efnkiJfcVsIwSAPayD8roA/u
 agq9P6uSN4vx8zNIOY46dRWCb/cEXGZPSbUgtWMqziWL1LEQyeFVK+L/jq8ojWz3/U9o
 57F/Kr22FRhlhl6c8sFyfQqsZQGB/E4NBLSgtZ4DJhDpMaV+m2wiPUpDTXe83auNHXWb
 62wLmvtn6RpDzHf1QLYZ209lZJWBZzFF11QIjJ5nwP4U8sYFry5rk0QA5pl0x7WXv/aq
 3URrZd30PqORyKnzjZ1YJHwVAtSLiiL1ZG0zWxnGBE0VIJeLuo0danvqkRfe+weYmdtz
 uOrg==
X-Gm-Message-State: AOAM532kdwVc7cNuGHFDbJM5LIRBXRxCK8JNzT2PoqPbQRs9RxwHMCcW
 cP6IyPSGnMlE8bvyI4fSund+JMJKFHJwHAyXbyyOIg==
X-Google-Smtp-Source: ABdhPJy6xsdDfH9Ylj/v2yPo1O5OESyNaGSH3ZonHoy9hE4hybzrFM03O2b9Vk7PY574UGsXfxlhXxaQ5iMa+uG7cHE=
X-Received: by 2002:adf:fcca:: with SMTP id f10mr4795342wrs.325.1594902780957; 
 Thu, 16 Jul 2020 05:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200715071506.10994-1-anup.patel@wdc.com>
 <20200715071506.10994-5-anup.patel@wdc.com>
 <20200715175052.GA497000@bogus>
In-Reply-To: <20200715175052.GA497000@bogus>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Jul 2020 18:02:49 +0530
Message-ID: <CAAhSdy04h-PD-=VhjB=5MOf=-RZMrMOcvEtbtUaDc3-kbV47BA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: timer: Add CLINT bindings
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_083304_533938_CF718765 
X-CRM114-Status: GOOD (  14.56  )
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
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 15, 2020 at 11:20 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 15 Jul 2020 12:45:05 +0530, Anup Patel wrote:
> > We add DT bindings documentation for CLINT device.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >  .../bindings/timer/sifive,clint.yaml          | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Error: Documentation/devicetree/bindings/timer/sifive,clint.example.dts:21.39-40 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/timer/sifive,clint.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/timer/sifive,clint.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1347: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
>
> See https://patchwork.ozlabs.org/patch/1329276
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
>
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>
> Please check and re-submit.
>

Thanks for these steps. I will fix and send v4.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
