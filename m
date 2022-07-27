Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90A7C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 12:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+P97ToSfFzvGSeOeThwJRxlbPqrGzq2uCkyRI6tCuI=; b=CV1vjo13SCPbu3
	soRF0WuGanFIPnzsrnpBlH4r2OMAZ4Vt2jbwfaXqN/IUYQtLDwXJ9Xf6w2TJBbtLmKsI8+r5+RWVi
	QUh3TT5ZYjBLLFUPz3wANHxxVV3NqhKLOMrSr9aN6ndz4RJNBnpmckrNfK58HOVd9CYoo78p6bToY
	Zv/HQM0vfifdSjfFBvxA8cj1CQSVa1HGO7M7lsMMgSrtk/12W4nqLPXeJpBU1Ab6Gp/3ae7klAs2z
	Ta6NbKC7wrw2vhLjTOhIcQkyur81nqTkWbRlD06yd62y6R5IvOW7WTe30GNuVdtChtfo4155HppA6
	IUwh7lk6bT5mtf3GkXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgQS-00DeRJ-9R; Wed, 27 Jul 2022 12:46:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgQQ-00DePh-0f
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 12:46:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A46CED6E;
	Wed, 27 Jul 2022 05:46:03 -0700 (PDT)
Received: from bogus (unknown [10.57.11.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE30B3F73B;
	Wed, 27 Jul 2022 05:46:00 -0700 (PDT)
Date: Wed, 27 Jul 2022 13:45:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property
 riscv,timer-can-wake-cpu
Message-ID: <20220727124556.owk3zlyzsg5uaa4t@bogus>
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com>
 <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_054606_131095_0064F5C0 
X-CRM114-Status: GOOD (  20.06  )
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

On Wed, Jul 27, 2022 at 02:07:50PM +0200, Krzysztof Kozlowski wrote:
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
>

I agree on the concept that this is property of the timer and not CPU.
However we generally don't need to use wakeup-source property for timer
as we ideally use this for waking up from system sleep state and we don't
want to be running timer when we enter the state.

> Now that's actual problem: why the RISC-V timer is bound to "riscv"
> compatible, not to dedicated timer node? How is it related to actual CPU
> (not SoC)?

We have "always-on" property for this on arm arch timer, and I also see
"regulator-always-on" or something similar defined. So in absence of timer
node probably "local-timer-always-on" make sense ? Thoughts ?

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
