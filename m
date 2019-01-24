Return-Path: <SRS0=k7m6=QA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307FBC282C3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Jan 2019 08:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01BC020854
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Jan 2019 08:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AneRATiZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dBIWHzrq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01BC020854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75u3CtgE4bP7ZfIDOxfUQbuy+svjscD0Q8euNXWgYpY=; b=AneRATiZwkqGQJ
	IkqRgAAUoiqGzXBnOyaz7Vi5IY+lsqGyYp6NIy9GTTwgO4lnxaV8dqF4ImGi+rO1EtUXPp2X4UaEj
	+z+eDrxg5L5nbtaDLvmX2+vZDgeDWYiih0DX6IIn/b/+ZcCvJL1HroxJe/BvzFqh17MOXZa6VOBsJ
	VVp8OpKutP/U6VsAZ3McW4M8iKg8sPheUdxD7Udh9rBWUxYYGshiGSceNAs7Zb263tUxtgCZDQZST
	PwxyH4mdYaj1lgZTP5ft8H+1X5GpqQ7NtSjTzMMBIw7+RGLJlwhNGTnfekNHyKQwWHLAxguba0FWO
	DWtr1ArQzntTezZdq7rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmar9-0002Dj-3V; Thu, 24 Jan 2019 08:59:27 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmar5-0002Ct-Si
 for linux-riscv@lists.infradead.org; Thu, 24 Jan 2019 08:59:25 +0000
Received: by mail-lf1-x141.google.com with SMTP id u18so3696672lff.10
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jan 2019 00:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X+6CDhmFE5BUgJINfvBlE6kMfuKGKXOQt17aKaSC2CU=;
 b=dBIWHzrqrzUEmk0fPf31ioVvC5HLtg2oP6b6UPzvQvyUrCu7IHzda0phOLDGOFVUcF
 +LUQ9dim7l2j5yRewWPPX3yEi3SV+ZlfK12nMt9xvfxGWriQPm0GTlKdU9F+OIBDt85Z
 yYzRx7aP9IqbPmon3F17G8zIq+mMGD10aGqP4igCWWGEI3hWzWUahx/RLVhPTQQLzEWE
 z4VYASQRtb4+PyFNTNI+NvyZkzzNu1Dd9FmskDTRLlFFNehwI14jc4ye2wXiW1Onlww4
 prdfBAtLEbCcJfdvdyd+Mx1BASOZW62y2nJP0RWOCLy/L9Z9wUsgBTAj+KiYhKvcmy5/
 OhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X+6CDhmFE5BUgJINfvBlE6kMfuKGKXOQt17aKaSC2CU=;
 b=FHHd7tZFK3CbCF4aOSIUPVnjtW1Nz+XDlAzgFs6+NU1k+VYxexNfdopHjrf1ZPsNHX
 Yv8WR5qwIC4pMv2aJL5EnbWCROtCeoD7sP6UlXs/GR+KPZEIK317mEO/65p5zj3DdNZo
 RaINieqimW84B1u99KkQS0GQs/pvgbAHhWRFkVf2K4k1kUmr1Q8d2WzrZ+IQ/nUEH+j0
 d4VQfrvw1wuoPd/hOXdNRkW1aB4q9sr3awvDECDAbdKvDNbk60IOVMmbMjqRuTOyXAaw
 DSgmhICIYFPXOS4fuLaQDY0ab33KIF3A1BrifkxFhOA1GpdIl40pmjS+rHn5ZR+cGJdP
 OoFA==
X-Gm-Message-State: AJcUukcHdL1FN27mXtum8QjmZipeFI6RlbBDBfeWVd0gz4GdcviB5W9H
 8Rmk8Eer8TFb22TSqwhubE8bQKdT0k+g/78nDD1c2w==
X-Google-Smtp-Source: ALg8bN52LHHj0Rtr1xWGpXi2iK10lapJcU3T+NVduKsZj8oRNRzT9aTPbMWXVZI2sGMCWVV7V3uY9kCD+UDbF8sBpmM=
X-Received: by 2002:a19:d381:: with SMTP id k123mr4445479lfg.101.1548320361053; 
 Thu, 24 Jan 2019 00:59:21 -0800 (PST)
MIME-Version: 1.0
References: <1548066043-1252-1-git-send-email-yash.shah@sifive.com>
 <1548066043-1252-2-git-send-email-yash.shah@sifive.com>
 <20190121145901.GA7547@bogus>
In-Reply-To: <20190121145901.GA7547@bogus>
From: Yash Shah <yash.shah@sifive.com>
Date: Thu, 24 Jan 2019 14:28:44 +0530
Message-ID: <CAJ2_jOFMDkAv44Ck1HNxDQ8mfH=Zi3cxhLugoqBMDcueDw0O3w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_005923_956367_8C618D30 
X-CRM114-Status: GOOD (  20.69  )
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

On Mon, Jan 21, 2019 at 8:29 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jan 21, 2019 at 03:50:42PM +0530, Yash Shah wrote:
> > DT documentation for PWM controller added.
> >
> > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > [Atish: Compatible string update]
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  .../devicetree/bindings/pwm/pwm-sifive.txt         | 37 ++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > new file mode 100644
> > index 0000000..b207908
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > @@ -0,0 +1,37 @@
> > +SiFive PWM controller
> > +
> > +Unlike most other PWM controllers, the SiFive PWM controller currently only
> > +supports one period for all channels in the PWM. This is set globally in DTS.
> > +The period also has significant restrictions on the values it can achieve,
> > +which the driver rounds to the nearest achievable frequency.
> > +
> > +Required properties:
> > +- compatible: Should be "sifive,pwmX" and "sifive,$socname-pwm".
>
> The order here is wrong.

Will fix the order.

>
> You still need to enumeration valid version numbers. Is 'sifive,pwm20'
> valid?

Yes

>
> > +  Please refer to sifive-blocks-ip-versioning.txt for details.
> > +- reg: physical base address and length of the controller's registers
> > +- clocks: Should contain a clock identifier for the PWM's parent clock.
> > +- #pwm-cells: Should be 2.
> > +  Refer to bindings/pwm/pwm.txt for details.
> > +- sifive,period-ns: the driver will get as close to this period as it can
> > +- interrupts: one interrupt per PWM channel
>
> How many channels? If variable, is the a max number?

Max 4 channels.

>
> > +
> > +PWM RTL that corresponds to the IP block version numbers can be found
> > +here:
> > +
> > +https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
>
> Put this in the description at the top.

Sure.

>
> > +
> > +Further information on the format of the IP
> > +block-specific version numbers can be found in
> > +Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
>
> You already said this.

Will remove redundant info.

>
> > +
> > +Examples:
> > +
> > +pwm:  pwm@10020000 {
> > +     compatible = "sifive,fu540-c000-pwm","sifive,pwm0";
>
> Space after the ',' needed.

Sure

>
> > +     reg = <0x0 0x10020000 0x0 0x1000>;
> > +     clocks = <&tlclk>;
> > +     interrupt-parent = <&plic>;
> > +     interrupts = <42 43 44 45>;
> > +     #pwm-cells = <2>;
> > +     sifive,period-ns = <1000000>;
> > +};
> > --
> > 1.9.1
> >

Thanks for the feedback

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
