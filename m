Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E26BC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 13:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wlMdCFgF2gQ/WVAWPYgh152ocC6ZpZ3NgyUv+8Ny0E4=; b=YYPozKiZKAVO4J
	fDn7dBeOqWxrZnNpG1vtppdX0SH4L45Z9cL0OkbJKl8+wavJNqadNLi0tNlNAKanBaKK1BhwaPCWn
	1tJbQBljZxN/Krzbr7SLqyGyIRBaR3IqNbP1XsEBdcZyVOEX7kCkwoLf7s0AZr9QZ2F4KJcQ2Z+H3
	9tTVzkRR6OgSrr9Ep/PvXpIbPjvYkApEFgqlNs5FKV114WXJvIF2ZTmqTXnlD6/RU3cNX7q1wshd1
	nIXjZ3t3xroiRSWz7/sPAxcZ1fu66q3MS2jXQdtmVMVRlAYEDdmIxtqGpf6LnM43AYoSiVTn6QSLi
	xJsbNNuiZPYriZGx2a/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgx2-00Dx9t-Bj; Wed, 27 Jul 2022 13:19:48 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgww-00Dx2n-E5
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 13:19:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id h9so24172940wrm.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dibkbw64+uQcY04egPFlqnHwHsFqfmAeKYM6z+pWQOk=;
        b=Y/X9OjJkkL7iDYVukFb7bLpNmZgR1h2IcOwkq2eCmqjYacPrz37zhp0ZsbdiZVi/RV
         Xb/wNpkg0x4WAMbKdwVole23Tp5wqsEgSVNUSF+6leNzUbah8IRZpzLkhp8S3PjglWvq
         lu0hsbVN/SNET9UoO94QR18JsGrUpRvHcYX9j+ErHYRIDKreiAs98P1cZH23eZFhpByS
         vxCkePTSqWqN6i3Q1pAl21HvHQuEyibsLb3W3hZqJPOEMH9AMsGwXXi1IccwlFkUfgdJ
         p5lq2gpNzSF38Yiy7tN31a+bmGQuPmFJe9o9+meZ7oVM8797/AeQKdvQYp48aBbtHTi5
         yEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dibkbw64+uQcY04egPFlqnHwHsFqfmAeKYM6z+pWQOk=;
        b=FF0fYGZe6ucsi2awYnECP8qZk8W+5pvXebjLpTp7q4BJwjLFrTHMAoelPukTfUWFK2
         gIxWSuGC5iVwO50HqR6v34dbx7Kl7fS3ZXeS0IBkwAcnSRdXiU2vyQhvThEo0dnYXCM4
         tS41NUVjoPJWyn8qlgMdygPceqrvlqgvS8osBS1ANPbA1THBktZYqJcPu0/DTCcuJWb8
         TKhuNexrG7Cl7BRHdXtV+RoObztjkhHHPriJQmJBUT8+3GfxWz4rerHV6qTf6rDoJ7VU
         Kc6TMDdtMp8qLS6nMDrwoj4YKwG8vkvoDhv+9nvwxdjkebqpNkzhnl81Gqp7IUgTt7V+
         0f4Q==
X-Gm-Message-State: AJIora+tgrkbLaxclQbIXA2FZs4Iz4/q4ukHuthDn5iq17JHA1mL3r0v
	sVMkBIiaR1a5FQ1wwmWfq/GPc5B4fQJ2JCuBzNyzSg==
X-Google-Smtp-Source: AGRyM1to8HbWQ44clapjD+5JGTD4YIZugXsbUPGE3wnHGXlqx7QirS2COMcNXHJ8Gy7Ob3it50+Qnfk4bKm9iNKFwpk=
X-Received: by 2002:a5d:64ac:0:b0:21d:7832:ecf9 with SMTP id
 m12-20020a5d64ac000000b0021d7832ecf9mr14023296wrp.86.1658927974767; Wed, 27
 Jul 2022 06:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com> <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
 <20220727124556.owk3zlyzsg5uaa4t@bogus>
In-Reply-To: <20220727124556.owk3zlyzsg5uaa4t@bogus>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Jul 2022 18:49:23 +0530
Message-ID: <CAAhSdy1guiVFxzU+r_7njH-E_hWUDy+r7P36YEf5OB80nDHuhA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property riscv,timer-can-wake-cpu
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Anup Patel <apatel@ventanamicro.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_061942_502687_CC9E4916 
X-CRM114-Status: GOOD (  26.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 27, 2022 at 6:16 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Jul 27, 2022 at 02:07:50PM +0200, Krzysztof Kozlowski wrote:
> > On 27/07/2022 13:43, Anup Patel wrote:
> > > We add an optional DT property riscv,timer-can-wake-cpu which if present
> > > in CPU DT node then CPU timer is always powered-on and never loses context.
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > index d632ac76532e..b60b64b4113a 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -78,6 +78,12 @@ properties:
> > >        - rv64imac
> > >        - rv64imafdc
> > >
> > > +  riscv,timer-can-wake-cpu:
> > > +    type: boolean
> > > +    description:
> > > +      If present, the timer interrupt can wake up the CPU from
> > > +      suspend/idle state.
> >
> > Isn't this a property of a timer, not CPU? IOW, your timer node should
> > have "wakeup-source" property.
> >
>
> I agree on the concept that this is property of the timer and not CPU.
> However we generally don't need to use wakeup-source property for timer
> as we ideally use this for waking up from system sleep state and we don't
> want to be running timer when we enter the state.
>
> > Now that's actual problem: why the RISC-V timer is bound to "riscv"
> > compatible, not to dedicated timer node? How is it related to actual CPU
> > (not SoC)?
>
> We have "always-on" property for this on arm arch timer, and I also see
> "regulator-always-on" or something similar defined. So in absence of timer
> node probably "local-timer-always-on" make sense ? Thoughts ?

I agree.

In the v1 patch, I had named it "riscv,timer-always-on" but I chose a
more specific name in v2 based on comments from Samuel. I think
we should use more consistent naming between ARM and RISC-V
so "riscv,timer-always-on" makes more sense to me.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
