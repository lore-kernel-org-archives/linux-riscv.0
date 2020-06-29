Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77512C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 08:32:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 435A023359
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 08:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pB1UcA+P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="v9Zl362z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 435A023359
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w3c4DhRWBgBSfvg+JNOYZqPsrlaZBGcnbhBT7HIvtA4=; b=pB1UcA+PEYoBhPnPNtuVE3p1/
	R4OhkBJ9c89W+dQ6krj+Vnj314911u6J5mJnv3FO5MGf83hZdY8QPXPe0QCTY6Findkv4Zjk0F+8T
	weUiFv+ejfyNqlYIKXF3LGdxafRCLw0RzwQBbPy19xdUdy+/G687bJB7Oy+NI7Ki5CTwIqH93daAI
	ni1huIceK1ntwQ4ft5Yj00E82P9dgUqA7G9S41kFiPC0qw5OLtgrV0wmEFgUr7VgUdvQo4br5zUcx
	7AyEEJVhvA54UllgoigHOj8cBw1j9Gz/48zPdg1uhL2eipvsyutwEh48b74mC4/AMx3rh7kKih5or
	puZmKr61A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jppCo-0005uc-L3; Mon, 29 Jun 2020 08:31:58 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jppCl-0005u4-Qw
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 08:31:56 +0000
Received: by mail-wr1-x442.google.com with SMTP id b6so15598853wrs.11
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 01:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0a0BV57yL5ficDtUjeioVVS7bAcbhc1pkjbiChvtOqw=;
 b=v9Zl362zUqiASgib07aYF9GS74MB9McYmwsWwm7+u0JHRuQpa3JpFxQp5HKSqBu5bV
 hME65OV8FA+Sv55A0o4GVkl+ixCjmwUWNfVgy2z+8TBssXcPIOrmWDGWt9+sbHHr66Cy
 dM9KjCpllKI8bYvqw4vjCkcohZDHEXPCojjgMyUv3H0v/ZQ/Ab2RvpAS/l5oLbHEdRCh
 Y8vGhsyLmEBHT1hNaD6YBQU0S1rBOZQIB71ttneeUsPFIOdHJQJWpRvbKjeQxIc/+3Jb
 UnGZ9ogeuxEtE7BFE+LdxkUttNlG6vIAePCjPL+gxVgRW3uY9YQM0VODgnxR7MZj68lM
 H9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0a0BV57yL5ficDtUjeioVVS7bAcbhc1pkjbiChvtOqw=;
 b=bGVfKT3OXI2AtPHhu9CzefFcNiMG3h6fEBKkSvfBpZJr0FpB3hPL8DKvgYJb+BYD3n
 hlOTaZA7PluKo1AMjiX6wAMWw3o1BkIcwssyDiYSkzf5Guwi+EopCMJaPaZvAucXXoqH
 kKbNRLC6Sq7O6w3RnQ0ncD3BK0XPr8H79qJ2u8QBxworYgFN6wS6eHOhZbFA1lzx6+qm
 lQv1ksFfmtthgKdajNv58PFRr1Xb1johIrllJLDAXYRl9zOGdaUz8gWcSPnp17kwhPJ2
 xGwa1x5ig/eGuN6ZSPKsIQzWt/orFGHJjRzlmjDpYZZ4AMsYhy4Rh7extto2+MuZw734
 MR0w==
X-Gm-Message-State: AOAM530E7vVlk0Gis8nKRlyyZXTsboe9L+Fx991GqrQzUNqr/h2QuKZR
 W/YF5NnGtT5Vl810zqNnAHp9VoQ2iIsdsozY3+3cHlLTd24=
X-Google-Smtp-Source: ABdhPJzYtZ0h83Rb5WNqf3L2Z5EidEEuCHUWCZ3RyjUvGssx1mKVKMQW6Z3EnvrO6S8+Wt/rD5qZ1q2bxYtlg5kacQY=
X-Received: by 2002:adf:aa90:: with SMTP id h16mr16128490wrc.356.1593419513242; 
 Mon, 29 Jun 2020 01:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593397455.git.zong.li@sifive.com>
 <3de3a480517d167a3faae086aa8ab0c0c7141d99.1593397455.git.zong.li@sifive.com>
 <CAAhSdy3VBUTMg_b2tO12cTYuvHYtH=4dj9-qT-at35Whf3w_7w@mail.gmail.com>
 <CANXhq0pV87oSzyAt80ySoXGRXp26bCnahPW0r27J+wjj5yc=nw@mail.gmail.com>
 <CAAhSdy3BUfPCS+LUWp9GKdnf960N-UkxtUtRArgkVd-1cGZxhQ@mail.gmail.com>
 <CANXhq0rvjJ6yAcOq=bc7O_rYGDcbRfp7DJhcM0RBQ8q2x7xH0A@mail.gmail.com>
In-Reply-To: <CANXhq0rvjJ6yAcOq=bc7O_rYGDcbRfp7DJhcM0RBQ8q2x7xH0A@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Jun 2020 14:01:41 +0530
Message-ID: <CAAhSdy1NE2yd1gGZBjEdUSt0cZy6b+pLH5sqLBmUafzryqd4iA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] dt-bindings: riscv: Add YAML documentation for PMU
To: Zong Li <zong.li@sifive.com>
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

On Mon, Jun 29, 2020 at 12:06 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Mon, Jun 29, 2020 at 12:38 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jun 29, 2020 at 9:58 AM Zong Li <zong.li@sifive.com> wrote:
> > >
> > > On Mon, Jun 29, 2020 at 12:09 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Mon, Jun 29, 2020 at 8:49 AM Zong Li <zong.li@sifive.com> wrote:
> > > > >
> > > > > Add device tree bindings for performance monitor unit. And it passes the
> > > > > dt_binding_check verification.
> > > > >
> > > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > > > ---
> > > > >  .../devicetree/bindings/riscv/pmu.yaml        | 59 +++++++++++++++++++
> > > > >  1 file changed, 59 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..f55ccbc6c685
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> > > > > @@ -0,0 +1,59 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: RISC-V Performance Monitor Units
> > > > > +
> > > > > +maintainers:
> > > > > +  - Zong Li <zong.li@sifive.com>
> > > > > +  - Paul Walmsley <paul.walmsley@sifive.com>
> > > > > +  - Palmer Dabbelt <palmer@dabbelt.com>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - const: riscv,pmu
> > > > > +
> > > > > +  riscv,width-base-cntr:
> > > > > +    description: The width of cycle and instret CSRs.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +
> > > > > +  riscv,width-event-cntr:
> > > > > +    description: The width of hpmcounter CSRs.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > >
> > > > The terms "base" and "event" is confusing because
> > > > we only have counters with no interrupt associated with it.
> > > >
> > > > The RISC-V spec defines 3 counters and rest are all
> > > > implementation specific counters.
> > >
> > > As I know, there are 2 counters of spec definition: cycle and instret.
> > > What is the 3rd counter you mentioned?
> >
> > TIME is a counter CSR.
> >
> > >
> > > >
> > > > I suggest using the terms "spec counters" and "impl counters"
> > > > instead of "base counters" and "event counters".
> > >
> > > OK, they are good to me. Let me change it.
> > >
> > >
> > > >
> > > > Further, "riscv,width" properties are redundant because
> > > > RISC-V spec clearly tells that counters are 64bit for both
> > > > RV32 and RV64.
> > > >
>
> Sorry for the lost replying. The maximum length of counters is 64, but
> it doesn't require to implement all bits. A real case is that
> unleashed board only implements 40 bit for mhpmcounters.

The "3.1.11 Hardware Performance Monitor" clearly states that
all counters are 64bit

To take care of the unleashed board, the "riscv,width-xyz" DT properties
should be optional. Whenever these properties are not present, we
should assume 64bit counter width.

>
> > > > > +
> > > > > +  riscv,n-event-cntr:
> > > > > +    description: The number of hpmcounter CSRs.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +
> > > > > +  riscv,hw-event-map:
> > > > > +    description: The mapping of generic hardware events. Default is no mapping.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +
> > > > > +  riscv,hw-cache-event-map:
> > > > > +    description: The mapping of generic hardware cache events.
> > > > > +      Default is no mapping.
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - riscv,width-base-cntr
> > > > > +  - riscv,width-event-cntr
> > > > > +  - riscv,n-event-cntr
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    pmu {
> > > > > +      compatible = "riscv,pmu";
> > > > > +      riscv,width-base-cntr = <64>;
> > > > > +      riscv,width-event-cntr = <40>;
> > > > > +      riscv,n-event-cntr = <2>;
> > > > > +      riscv,hw-event-map = <0x0 0x0 0x1 0x1 0x3 0x0202 0x4 0x4000>;
> > > > > +      riscv,hw-cache-event-map = <0x010201 0x0102 0x010204 0x0802>;
> > > > > +    };
> > > > > +
> > > > > +...
> > > > > --
> > > > > 2.27.0
> > > > >
> > > >
> > > > Regards,
> > > > Anup

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
