Return-Path: <SRS0=RZUB=PM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB61C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 05:03:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D02F22087F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 05:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E6dEOR1G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mRrwnXbY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D02F22087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak3JuNdl98LgjieVYK2elbwY2brnKR46MztU+InkAik=; b=E6dEOR1G90s6qW
	OjBESpANDB8a21W3y+yeBLzwDzJ1Szb5ByTAxeVlMzu4nPUGJnO4hCGotNniRzDOboEkr1nuIdFG5
	LQ3gTHgT3yFnKipNfvzAeD93AO2GHbS0IFXLbZVOvS0sI/4hg6EY93zNuCU8cEH8JSeA6PuBWYeOi
	dlnkWXD+UPglCS2aZeh/LrIIyX5DSNHJ3SGWdvys2xlyIyZmzArRkN3s9YeLknUL1AhOJkG/9ybXe
	VjUGzp5NFK9SoIC4yybk7rQ1f9laAUZDugqnEgIUG6Mwr1ekw9BAoUyVcqqhiyBGwEk+WYCvoxJDG
	71nlkw3RkWmfN3Evyavg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfHeD-0004hc-P4; Fri, 04 Jan 2019 05:03:53 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfHeA-0004gu-EY
 for linux-riscv@lists.infradead.org; Fri, 04 Jan 2019 05:03:52 +0000
Received: by mail-lf1-x141.google.com with SMTP id e26so24667252lfc.2
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jan 2019 21:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ME8F7/tqwkC++IqaY030+2nSR1n7tVYolNeJJkHOFS0=;
 b=mRrwnXbY8e7eSM48aQWr+T73VJGKd+TdYS5JiGUbyljYGwQx6REQYm+mXQy60vckpZ
 5t2WVruQEvBhf9IOlH0LNd2eMIYkOXmpUs1cjTNP5fVECYxEQSaJCxNSN2lskHqfXqaC
 LFy5ve9P7xibp3ZlCD/bzZpzO7CXOI40z93vZE0qrkuYHlPqH8/5rvtTeyjdbttdWF83
 zCxlfCQeRoo94cvz1R5L/GXseYFex7OjB5+9bqzz0HJjVB+CqD2pYW3MxzyiHL1Qw5cr
 lqZDH5k8vTcAdObpRkby8ma6eubhui4DKbkkq5UJkSxGpGJuBdcAdyqWquE/P/IlKvPw
 H3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ME8F7/tqwkC++IqaY030+2nSR1n7tVYolNeJJkHOFS0=;
 b=eYBYsCE9biaY5VjsEGq3ArAqhWlV/8o304rw58OoIhb1D9oPxFwXUFaiUbxYiOpo9E
 yLkLqvpgZvp++sBskKyosEdV5Rq4E8jt3QAwTwmOcRVtTSKbzbeYjrOkpb4VrPdusacK
 lYupmeUOeq5VNcFefKfPezWIV6brjPMtTUAosaq9WU+sfVW3rEcmPJ/84PsJxJ//iboC
 l5O6WDJFLHSPoa8cfR0+dE/mlvVSWzC9ymV8t+J882038P4l7sCPidsXmKhMFAfk3FU5
 PYVDvy7LdLLGx8gpJg4FkaKGeZQvUQ7cDRWd7OntkmfTR/31Nqz9MA7mztuUlSdF+spf
 PzyQ==
X-Gm-Message-State: AA+aEWZdjjRNiAUBiW2tgjOoJiHcrf3PhEzBJxNt2Lkc2atNSW/+LBWi
 VB6O0T6JpCYFcwSGukWOy1wTGesqunA05z7UA7+6RA==
X-Google-Smtp-Source: AFSGD/XVc8l1UaVv+9WkdEg9eh4e2kv068Vx1cZdYWGGzuMQnEOGTUw/GsYnrwe6hI/K5HicSehK75FS2hrAzqTMyjI=
X-Received: by 2002:a19:739d:: with SMTP id h29mr26642446lfk.85.1546578227465; 
 Thu, 03 Jan 2019 21:03:47 -0800 (PST)
MIME-Version: 1.0
References: <1544768442-12530-1-git-send-email-yash.shah@sifive.com>
 <1544768442-12530-2-git-send-email-yash.shah@sifive.com>
 <20181218172031.GA7272@bogus>
In-Reply-To: <20181218172031.GA7272@bogus>
From: Yash Shah <yash.shah@sifive.com>
Date: Fri, 4 Jan 2019 10:33:36 +0530
Message-ID: <CAJ2_jOEy-0DmkzoOwezUf3+gHV3CTu04CqG1tiw5=iX-AO8xZg@mail.gmail.com>
Subject: Re: [RFC v2 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190103_210350_514403_3992C00F 
X-CRM114-Status: GOOD (  20.66  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 18, 2018 at 10:50 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Dec 14, 2018 at 11:50:41AM +0530, Yash Shah wrote:
> > DT documentation for PWM controller added with updated compatible
> > string.
> >
> > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > [Atish: Compatible string update]
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  .../devicetree/bindings/pwm/pwm-sifive.txt         | 44 ++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > new file mode 100644
> > index 0000000..250d8ee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > @@ -0,0 +1,44 @@
> > +SiFive PWM controller
> > +
> > +Unlike most other PWM controllers, the SiFive PWM controller currently only
> > +supports one period for all channels in the PWM. This is set globally in DTS.
> > +The period also has significant restrictions on the values it can achieve,
> > +which the driver rounds to the nearest achievable frequency.
> > +
> > +Required properties:
> > +- compatible: should be something similar to "sifive,<chip>-pwm" for
> > +           the PWM as integrated on a particular chip, and
> > +           "sifive,pwm<version>" for the general PWM IP block
> > +           programming model. Supported compatible strings are:
> > +           "sifive,fu540-c000-pwm" for the SiFive PWM v0 as
> > +           integrated onto the SiFive FU540 chip, and "sifive,pwm0"
> > +           for the SiFive PWM v0 IP block with no chip integration
> > +           tweaks.
>
> This should reference the common doc Paul has written and not re-explain
> the versioning scheme again.

Ok sure.

>
> > +- reg: physical base address and length of the controller's registers
> > +- clocks: The frequency the controller runs at
> > +- #pwm-cells: Should be 2.
> > +  The first cell is the PWM channel number
> > +  The second cell is the PWM polarity
> > +- sifive,approx-period: the driver will get as close to this period as it can
>
> Needs a unit suffix as defined in property-units.txt

Will be done.

>
> > +- interrupts: one interrupt per PWM channel
> > +
> > +PWM RTL that corresponds to the IP block version numbers can be found
> > +here:
> > +
> > +https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
> > +
> > +Further information on the format of the IP
> > +block-specific version numbers can be found in
> > +Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> > +
> > +Examples:
> > +
> > +pwm:  pwm@10020000 {
> > +     compatible = "sifive,fu540-c000-pwm","sifive,pwm0";
> > +     reg = <0x0 0x10020000 0x0 0x1000>;
> > +     clocks = <&tlclk>;
> > +     interrupt-parent = <&plic>;
> > +     interrupts = <42 43 44 45>;
> > +     #pwm-cells = <2>;
> > +     sifive,approx-period = <1000000>;
> > +};
> > --
> > 1.9.1
> >

Thanks for the comments!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
