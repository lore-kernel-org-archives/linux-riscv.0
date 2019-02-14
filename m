Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD83AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:08:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FD4222A1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FsVt1VuJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ya1a+cpJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1FD4222A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSq2eih/iMYwJ+n535qd5Ntd2MUt4idbVW0e8M5MpEI=; b=FsVt1VuJdsmG7X
	grlF3IFG9or6ZJgZ/4hFs9GiOrL4Y09NV/JO/G5MFyg+SWY3AVEAPRsAjbvFcHcBgU5QZx/fuToc/
	EMV2SqOZ05tLykYYdRAhPLI6xKYNJvXmFWmSVVyYvzh5Xz1cQGoKcn0ept7VhwSr/K1AHW7neo0+Q
	8X2YJwA///RBjtQKogXB/wWualZgcN4KReJK5n+BIpl7exXMjK++0uwwM3QABGCCbZmaplBn4+cU+
	655Dai9rx9qwX/PWg3+ytUfjbkHU1zZjroshp7pCFuvlgqznDfQ2ibtWGuwINfMeBzDxo05UGFjj5
	LMfdCTDAJzT4Ds1+81yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guC4X-0001QI-Ux; Thu, 14 Feb 2019 08:08:41 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guC4U-0001PY-25
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 08:08:39 +0000
Received: by mail-lj1-x243.google.com with SMTP id l7-v6so4393686ljg.9
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 00:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JUE3EVLdrtPM6TCnLkMXcWvIudWsHoogLziir6zdaRg=;
 b=Ya1a+cpJxy+G5yQzgsOZNvphBHk3bFY+7q5xJmV0pZzGwwgLRHHR0OfIc7e9mAOJ3r
 hctXJOuktQqBZPZDb09P8AgWKxvF1JkZ/VyBm0D2S3l/aySN3FV/lwq/Hie6GfbaJpah
 6dRQiS8wksXMfKNlBSw4NXybJylyphFEfgD7uW/t2Jsz9R8uB6gyLt9IXWALgqCZ3oQE
 8KCQKbmDd2jXpo7VRpunQPS2vCo+e0U8BxmYngXOzGLUpA7YuCM/j35pyrSeM6cTWLzw
 uDP18o9fMNOCs0cyn69oVfgQS3H+fUZNPhgddtI6X5zP2L549ILSyp7nOfofxo7A0YL/
 7Zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JUE3EVLdrtPM6TCnLkMXcWvIudWsHoogLziir6zdaRg=;
 b=NA1ARHT3Hed6PtOm+25ppBWyGGOR8o/Y2R8n2g+yfxv8hajiDeyfB6JjNdb+qhvNUX
 YGk2n91jN1eacMsLTO06qFEDWF0ZoTD0Ly6s0yVL0biL9hSRiG/UFsHL8mAx2OObmecQ
 JpZGVs3vB6WhiHZc87njsvVEd7ssJawpYD6PthRhNor4goGiY4CviSRZ8psyRUprkHUc
 ekDTpieNXMVKfFKkGuWte8BRp7Y0bY9aqBs59Kc0QWlH/1CEfSupbax/9hqI5mh2ivUq
 zj7ba03ylljb2qbEAbUug8Xv0Bw82b/mq7lXTxO5ypTarGDzIYrIaT6v88RnFu4O5qcn
 OUTA==
X-Gm-Message-State: AHQUAubK0TdJwFh1wja7RktJb3HQ7o4NoYLAQ+ebubPd2tvMpB2cGHi7
 NOaqvKESrR7sawypGe2ZtZAulJmIhcoPDRfAvy3ucA==
X-Google-Smtp-Source: AHgI3Iau7/ILoMBs542cZUjYKQfooNo7+Ppf4x0josN3dVCKV73OjdIcAG6zp/0nBglGHK7+eNtAgvoq1ZqNkSd+tP0=
X-Received: by 2002:a2e:a0c8:: with SMTP id
 f8-v6mr1430735ljm.177.1550131715841; 
 Thu, 14 Feb 2019 00:08:35 -0800 (PST)
MIME-Version: 1.0
References: <1550049978-20705-1-git-send-email-yash.shah@sifive.com>
 <1550049978-20705-2-git-send-email-yash.shah@sifive.com>
 <20190213203752.GA18326@bogus>
In-Reply-To: <20190213203752.GA18326@bogus>
From: Yash Shah <yash.shah@sifive.com>
Date: Thu, 14 Feb 2019 13:37:59 +0530
Message-ID: <CAJ2_jOHwk3_5Z1=QD4HZjpWg0mx-RTKzq44gueFZQ2k2OaZOZw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_000838_102068_AC47BE91 
X-CRM114-Status: GOOD (  18.39  )
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

On Thu, Feb 14, 2019 at 2:07 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Feb 13, 2019 at 02:56:17PM +0530, Yash Shah wrote:
> > DT documentation for PWM controller added.
> >
> > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > [Atish: Compatible string update]
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > ---
> >  .../devicetree/bindings/pwm/pwm-sifive.txt         | 30 ++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > new file mode 100644
> > index 0000000..3b9c64c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> > @@ -0,0 +1,30 @@
> > +SiFive PWM controller
> > +
> > +Unlike most other PWM controllers, the SiFive PWM controller currently only
> > +supports one period for all channels in the PWM. All PWMs need to run at
> > +the same period. The period also has significant restrictions on the values
> > +it can achieve, which the driver rounds to the nearest achievable period.
> > +PWM RTL that corresponds to the IP block version numbers can be found
> > +here:
> > +
> > +https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
> > +
> > +Required properties:
> > +- compatible: Should be "sifive,$socname-pwm" and "sifive,pwmX".
> > +  Please refer to sifive-blocks-ip-versioning.txt for details.
>
> Please specify what soc and IP version are used. Is sifive,pwm10 valid?

Does the below description seem fine?

should be "sifive,<chip>-pwm" and "sifive,pwm<version>".
Supported compatible strings are:
"sifive,fu540-c000-pwm" for the SiFive PWM v0 as
integrated onto the SiFive FU540 chip, and "sifive,pwm0"
for the SiFive PWM v0 IP block with no chip integration
tweaks. Please refer to sifive-blocks-ip-versioning.txt for details

>
> > +- reg: physical base address and length of the controller's registers
> > +- clocks: Should contain a clock identifier for the PWM's parent clock.
> > +- #pwm-cells: Should be 3. See pwm.txt in this directory
> > +  for a description of the cell format.
> > +- interrupts: one interrupt per PWM channel
> > +
> > +Examples:
> > +
> > +pwm:  pwm@10020000 {
> > +     compatible = "sifive,fu540-c000-pwm", "sifive,pwm0";
> > +     reg = <0x0 0x10020000 0x0 0x1000>;
> > +     clocks = <&tlclk>;
> > +     interrupt-parent = <&plic>;
> > +     interrupts = <42 43 44 45>;
> > +     #pwm-cells = <3>;
> > +};
> > --
> > 1.9.1
> >

Thanks for the comment

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
