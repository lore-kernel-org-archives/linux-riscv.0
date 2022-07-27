Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99F5C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDXI3jldoj6dbS/OBWL9fRJHMVaigTQ+o4dRDBijfpc=; b=eq16Aih5uF7GsA
	uRBC8patVAK1ASBxngAZDuuq88HiG3uDmMltbmwKVGhxgu0e6sOKWDSNWvO28F0XBZMc0dUbS4/Vx
	VgOFW4akz7N/kvi/nQyKDIbwOgcd8W79lSNabf5Upn98f6dlFAnEOdrm/rnqxG2liMmPemxRva5vO
	uOFUIc2bdMEJ5dCbU/HtcsriDzniCSfpCdL1fiYi/ZQ2zy5/yfofso2H4zgwTbTg42313p1cJa4Sw
	oUDH0je+vdQpI9Bd/YdvnwxZ0dU/DZPwFcjbd3Uf6K1fanXb4dUirxxppfoBVSJX6N9Y/S4wtvOts
	uSwKubAIOZsir7AXTwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGiva-00F25M-RF; Wed, 27 Jul 2022 15:26:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGivX-00F20X-Ay
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 15:26:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABAA5113E;
	Wed, 27 Jul 2022 08:26:19 -0700 (PDT)
Received: from bogus (unknown [10.57.11.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E04EB3F73B;
	Wed, 27 Jul 2022 08:26:16 -0700 (PDT)
Date: Wed, 27 Jul 2022 16:26:13 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Anup Patel <anup@brainfault.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property
 riscv,timer-can-wake-cpu
Message-ID: <20220727152613.kbhfnvekpkd7na72@bogus>
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com>
 <372e37bf-ac90-c371-ad9e-b9c18e1cc059@linaro.org>
 <20220727124556.owk3zlyzsg5uaa4t@bogus>
 <CAAhSdy0TSKhR8_2eU7pmgizybuxPbwAycn4YudvkfGWGbnXNtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0TSKhR8_2eU7pmgizybuxPbwAycn4YudvkfGWGbnXNtQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_082623_466778_BA89C19E 
X-CRM114-Status: GOOD (  27.50  )
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

On Wed, Jul 27, 2022 at 07:15:28PM +0530, Anup Patel wrote:
> Hi Sudeep,
> 
> On Wed, Jul 27, 2022 at 6:16 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Wed, Jul 27, 2022 at 02:07:50PM +0200, Krzysztof Kozlowski wrote:
> > > On 27/07/2022 13:43, Anup Patel wrote:
> > > > We add an optional DT property riscv,timer-can-wake-cpu which if present
> > > > in CPU DT node then CPU timer is always powered-on and never loses context.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > index d632ac76532e..b60b64b4113a 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > @@ -78,6 +78,12 @@ properties:
> > > >        - rv64imac
> > > >        - rv64imafdc
> > > >
> > > > +  riscv,timer-can-wake-cpu:
> > > > +    type: boolean
> > > > +    description:
> > > > +      If present, the timer interrupt can wake up the CPU from
> > > > +      suspend/idle state.
> > >
> > > Isn't this a property of a timer, not CPU? IOW, your timer node should
> > > have "wakeup-source" property.
> > >
> >
> > I agree on the concept that this is property of the timer and not CPU.
> > However we generally don't need to use wakeup-source property for timer
> > as we ideally use this for waking up from system sleep state and we don't
> > want to be running timer when we enter the state.
> 
> It seems ARM is using two separate timer DT properties: one for
> system suspend (i.e. arm,no-tick-in-suspend) and another for CPU
> system (i.e. always-on). Is this understanding correct ?
>

TBH, I hadn't looked at "arm,no-tick-in-suspend" before though it seem to
be there for few years now. Based on the log, I see this as quirk for some
platform and not used on many platforms. Ideally to account how much time
was spent in suspend, we could use the counter as it continues to tick
during the suspend as well i.e. just the timers are not available if
not always. This was added to handle systems that are not conformant to
the expectation of always available counter.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
