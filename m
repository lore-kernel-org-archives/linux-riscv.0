Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C94C3F6B0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaWXUXuejUu//u3mToBejZ4aSelCx6dDNBvphx8pp6k=; b=TjqGDtQUEWJNzi
	eaJPx/F6NCTlW2mjLbY2fS9JyH8pLdkyRz/Nol+A3JFBPJG205BppkFhhDDhGZWmorLh00nJGVdON
	fEVefEApqY1BbxTMKHk8FrrLkGh609UwnCQRjwRbzxL6oXnLeRQMqd9WwxfZskMQcSVw+ljT/8zao
	oBg/cWM4/nfRL3/aMjuR5hKwb02oPZ2VE3oM2lIUWXxfR8ktz3LRo/QBY0nR5p/6lebQYpHD6wCdL
	Sg8FAQZIbpwLvmY+lZC7qdYFvf4DvlxDxZhvIyHwHYA5hGRmKSSNgu2W71c4LYzwBYHZVohOoljq3
	JG8cq8oRI5/VlTWLcG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGg2Z-00DR0x-Gx; Wed, 27 Jul 2022 12:21:27 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGg2W-00DQuo-1H
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 12:21:25 +0000
Received: by mail-lf1-x12d.google.com with SMTP id p11so22022638lfu.5
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7bEtmnK2tPU54AB6HVbM7vDC+tZHIQcAyrzRsaXxDZM=;
        b=GgSGDIdHNixhUGu7yYAoz9ouzF0cT0bTt4S1/YmYLkt5GDfgvZBWzegMGJlXpsf2YQ
         bhL1bod+/rV+CnEVcM6rDKWhaLbvHKIQ8E6J6S08LicgAf/JPdmCYipJ2m9HwxfRNJQn
         +SJlIkRUaHJvkYW7OrfaFlZPoBwMtbqiuQjFHcVcjBOS2Uz948tiFPy0oxOCr1h/1ZIk
         lrb2JsONok9uuXduhfl0kVAA2aKwn5ykcRJoutP4u4kgpyCfsrGXfCfbfO8MTU0X1Ec9
         RDOhQHKAej2rbGm41huZNordTZ2u7bukYCURGu/iEz/KnrUwCJ14QyeGAGkRhCuPgyk6
         JAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7bEtmnK2tPU54AB6HVbM7vDC+tZHIQcAyrzRsaXxDZM=;
        b=2QApRQu1Nux/JfSU7XyrX8TvLiJfeH0rmMySwzqyrCfh2enRmyR2iEg6MB/Ta6f5RH
         dUCtw0ucnnVVvgLaYUl0Vb47vqGKEb3NEz2VgaZO3J52FNjqlq547a2mDXA2A4IEkUQP
         x9YjLonGeP6IzML0bAPOsxH7XlLHk3NMbkYtdyCy5gw1ngWN7vGUwYz0vZUc/GNgeXtE
         MNI90npXrhfA8/U7Xwwvf3YcvjGn8hyUUPDm1ReZQp5FrDkt7B0ed9u7l3iZYA0klb/B
         fnGJXfaRjLlj0WdpiuHwOqrUmzhfWCbtlULl3bRrtIDVB2lTNBAbb/BYD4UzRiCPWvWG
         yh2Q==
X-Gm-Message-State: AJIora9HeQG/FcRXQkGwMoXFqsJwzZ0/P2/HRPX9rFxXtoj2Z0Ibg6FC
	+dGU1DbjZ9JuQxWRwhNSKC1LRrcZulMF/n2IuEEeNw==
X-Google-Smtp-Source: AGRyM1tBR5GHnn8Sw/Vkd8jNxCDYQqmi2BGppjOeFfvYrEZtHdmW/4v1/hpsHv17Di796mRJwvbprkRM0Q7KijluqJc=
X-Received: by 2002:a05:6512:3e03:b0:48a:9d32:5652 with SMTP id
 i3-20020a0565123e0300b0048a9d325652mr3537132lfv.41.1658924476217; Wed, 27 Jul
 2022 05:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com> <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
In-Reply-To: <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 27 Jul 2022 17:51:05 +0530
Message-ID: <CAK9=C2WjU+2cD7UZbja3TT++KCdRyWroT=50dw=fzi5mX30rcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property riscv,timer-can-wake-cpu
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, 
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_052124_095335_6D9A61C2 
X-CRM114-Status: GOOD (  18.81  )
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

On Wed, Jul 27, 2022 at 5:37 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/07/2022 13:43, Anup Patel wrote:
> > We add an optional DT property riscv,timer-can-wake-cpu which if present
> > in CPU DT node then CPU timer is always powered-on and never loses context.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index d632ac76532e..b60b64b4113a 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -78,6 +78,12 @@ properties:
> >        - rv64imac
> >        - rv64imafdc
> >
> > +  riscv,timer-can-wake-cpu:
> > +    type: boolean
> > +    description:
> > +      If present, the timer interrupt can wake up the CPU from
> > +      suspend/idle state.
>
> Isn't this a property of a timer, not CPU? IOW, your timer node should
> have "wakeup-source" property.

Historically (since the early days), we never had a timer node in the
RISC-V world.

>
> Now that's actual problem: why the RISC-V timer is bound to "riscv"
> compatible, not to dedicated timer node? How is it related to actual CPU
> (not SoC)?

The RISC-V timer is always present on all RISC-V platforms because
the "time" CSR is defined by RISC-V privileged specification. The method
to program per-CPU timer events in either using SBI call or Sstc CSRs.

Since, there is no dedicated timer node, we use CPU compatible string
for probing the per-CPU timer.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
