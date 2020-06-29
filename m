Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DD7C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 06:36:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5011323130
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 06:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a4sqKM2i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jB71Ljjq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5011323130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zStc4j7FpRNj/IWzYwztQ8zu4SYusN28s6t0qsu9njo=; b=a4sqKM2i9PAGqW2jyRKfIBbxX
	SZGgP5NRd2xgdWv+0+Nis144tFoL6sw/5H3EnMwI7rpnsRUzcSvkntso96wCWhWR5gXTR8ZAFhqMN
	xsXzkbJaTvDYiJgoqiKcN3Pw9kmMxder9F9C8nIA7YSU9TN6ZkxAqYOmOJv7cZ4R8mVUlKBCvU2Od
	qnEPHHfbM5ggPDt2gJwxYF5eRtbPfWN6CniqBGcVWEnSxhe8IAzQZ+98g0cDpclsTAUKSkwJgew0g
	TSX8j350ZNWAvuGjbKAALFDcrcJF434iHW4hBEYk1CrRIZhYwfa/ZSQtl+ITcetx3yNLt8Oq+0pyB
	R8VF1/D5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpnOl-0002kj-M7; Mon, 29 Jun 2020 06:36:11 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpnOi-0002kE-JM
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 06:36:09 +0000
Received: by mail-oi1-x243.google.com with SMTP id k6so9621357oij.11
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 23:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6Di78aul04vs2kyIJtsqSNPWqTVlpseLwhNlVPJlCw=;
 b=jB71Ljjq1eBRRMow3ePRUvEUQNwMfHAqv9mcp0yegcgOVA2UsvNwiMG2zLfZ8JVZ/r
 f0CHXYLQ/yer0HIXZkBafxzwQhkWzsoZUNmApVOMiciGG2kr8AqjAF5JDOb0sNFgonkH
 BJqaXq71xyAFuJyeF2Ifg3SFLTBmmkI3SAgMT4b6kGScWcc5PZ0PukTdyhON7/07MRvf
 HlZdVMdh24gdrmnmh4Zp9VPjAVtiCbD7GN26cDy9LTiwY/F7ioVTN9UWztx+kQo0RyJn
 jY5SpKDwmkn2uWBOYXWmPbFka+EA1mC1mklgB62+SF12rIHoOQpCQRmNdKK9aup8EwJW
 fEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6Di78aul04vs2kyIJtsqSNPWqTVlpseLwhNlVPJlCw=;
 b=b0nr5QHTdJFbjrq6Xj1BQrMXYfvL3GpzkHz6EJi+TlqeAnbEyL/EtHnL2xnEcz/JJR
 JH+d7+uas3isjpmJvnL5XnOw7Gxj+hHwYNXOTG6nCFtEhigN8jgZPSaLbtJ0LnMpKMEA
 9viXIJqOB3D4Aikcn8o1CpaBDJQJeM2RosLPdkx/km+0ViUI0o7BDtBXLTnJTaG3P4D8
 rSlhLCir2irYhFBIdNjqibsrMviVjI8rmjP3H1nyRqb90KtBuJjYHjkO/eZQKFzPST5E
 kvhN9WRwmEoyKq7/OxfDyKx97qKrfn0WbaeFsqS8mt6zCQ2aMAkzNzDTircid7+Wu+9J
 bqXA==
X-Gm-Message-State: AOAM533pBBUzi10/u1w2cbZzVcv4Wkla/uwolRvXQFoSkzSsBJPXL46m
 LCHJSutHZj1VaEyUhK4DOBcGLRxxUS0H938BtAPEZHXhMUQ=
X-Google-Smtp-Source: ABdhPJzIbZs7+pk8YdVbf5qeEsUHVykEwUvO7k68qMKB1IWotZJ8TOn/8j6yCa6Xn3TcRl1sAP8SWOGWhzF9MrmH88c=
X-Received: by 2002:a05:6808:919:: with SMTP id
 w25mr11077804oih.91.1593412566656; 
 Sun, 28 Jun 2020 23:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <3de3a480517d167a3faae086aa8ab0c0c7141d99.1593397455.git.zong.li@sifive.com>
 <CAAhSdy3VBUTMg_b2tO12cTYuvHYtH=4dj9-qT-at35Whf3w_7w@mail.gmail.com>
 <CANXhq0pV87oSzyAt80ySoXGRXp26bCnahPW0r27J+wjj5yc=nw@mail.gmail.com>
 <CAAhSdy3BUfPCS+LUWp9GKdnf960N-UkxtUtRArgkVd-1cGZxhQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3BUfPCS+LUWp9GKdnf960N-UkxtUtRArgkVd-1cGZxhQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 29 Jun 2020 14:35:55 +0800
Message-ID: <CANXhq0rvjJ6yAcOq=bc7O_rYGDcbRfp7DJhcM0RBQ8q2x7xH0A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] dt-bindings: riscv: Add YAML documentation for PMU
To: Anup Patel <anup@brainfault.org>
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 29, 2020 at 12:38 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Jun 29, 2020 at 9:58 AM Zong Li <zong.li@sifive.com> wrote:
> >
> > On Mon, Jun 29, 2020 at 12:09 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
> > > >
> > > > Add device tree bindings for performance monitor unit. And it passes the
> > > > dt_binding_check verification.
> > > >
> > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/pmu.yaml        | 59 +++++++++++++++++++
> > > >  1 file changed, 59 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > new file mode 100644
> > > > index 000000000000..f55ccbc6c685
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > @@ -0,0 +1,59 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: RISC-V Performance Monitor Units
> > > > +
> > > > +maintainers:
> > > > +  - Zong Li <zong.li@sifive.com>
> > > > +  - Paul Walmsley <paul.walmsley@sifive.com>
> > > > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: riscv,pmu
> > > > +
> > > > +  riscv,width-base-cntr:
> > > > +    description: The width of cycle and instret CSRs.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +
> > > > +  riscv,width-event-cntr:
> > > > +    description: The width of hpmcounter CSRs.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > >
> > > The terms "base" and "event" is confusing because
> > > we only have counters with no interrupt associated with it.
> > >
> > > The RISC-V spec defines 3 counters and rest are all
> > > implementation specific counters.
> >
> > As I know, there are 2 counters of spec definition: cycle and instret.
> > What is the 3rd counter you mentioned?
>
> TIME is a counter CSR.
>
> >
> > >
> > > I suggest using the terms "spec counters" and "impl counters"
> > > instead of "base counters" and "event counters".
> >
> > OK, they are good to me. Let me change it.
> >
> >
> > >
> > > Further, "riscv,width" properties are redundant because
> > > RISC-V spec clearly tells that counters are 64bit for both
> > > RV32 and RV64.
> > >

Sorry for the lost replying. The maximum length of counters is 64, but
it doesn't require to implement all bits. A real case is that
unleashed board only implements 40 bit for mhpmcounters.

> > > > +
> > > > +  riscv,n-event-cntr:
> > > > +    description: The number of hpmcounter CSRs.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +
> > > > +  riscv,hw-event-map:
> > > > +    description: The mapping of generic hardware events. Default is no mapping.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +
> > > > +  riscv,hw-cache-event-map:
> > > > +    description: The mapping of generic hardware cache events.
> > > > +      Default is no mapping.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - riscv,width-base-cntr
> > > > +  - riscv,width-event-cntr
> > > > +  - riscv,n-event-cntr
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    pmu {
> > > > +      compatible = "riscv,pmu";
> > > > +      riscv,width-base-cntr = <64>;
> > > > +      riscv,width-event-cntr = <40>;
> > > > +      riscv,n-event-cntr = <2>;
> > > > +      riscv,hw-event-map = <0x0 0x0 0x1 0x1 0x3 0x0202 0x4 0x4000>;
> > > > +      riscv,hw-cache-event-map = <0x010201 0x0102 0x010204 0x0802>;
> > > > +    };
> > > > +
> > > > +...
> > > > --
> > > > 2.27.0
> > > >
> > >
> > > Regards,
> > > Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
