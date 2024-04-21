Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7483CC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 10:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUiA8EjlNScOhhBO3cdt06XdGEl15LUvyEUiA4eLQN4=; b=We/QVKPI4ezyWK
	IqXO1icetYMx+zeuuKtOsFDahFexhPuCMCWh+yy6FSIDSFiOU58Wis8wImxyaHVNmlCArb6ugGycj
	bgAKOI6V3/3C1UQ6jM3wUKmSf55IRgMP0jZb0Sz9RagySCuzV9a7qpn9GTtbi4YCbbAWB9LIiAZm2
	CKk7pVJ/kLDymhrj9hZOXfRgAAcNNedEA0+Yd6WIcQWblaTWzrXKib/OA6ixgefG//5C0jJ2HJWo1
	VueGovH68GxcGF2PkG3EvRQKWREtTtJatL1sKrc71UUa2GP8Lk5nq/YcmEBCC9AD4XR2IMKL0zFSX
	BzfXFKoYmYCFLtR51tog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryUIv-0000000AIEI-0UVl;
	Sun, 21 Apr 2024 10:20:13 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryUIr-0000000AIDW-3Dev
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 10:20:11 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso41734411fa.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Apr 2024 03:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713694805; x=1714299605; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ34QbYUP42radFqcG4Fu2rfSxDEHqCa4xcp8CRb+6I=;
        b=MBjoMIq60BmVA/SARE6suDOX8hAUixmbbZnBhWzGMKCt5Wq/ETPj0bF5zUXO3E6i63
         fH8RP/1yIPEohzJ6ciIxxiKKoAs1OV0Q1645HjkZzFdF/BesGypaAFPBLn9H9TS6bMxL
         mwWCuqG+OwB3vH4LeQP69erC6tbbq8zFWjdeB9b9W7Y40c5Su9+6w+5nl4yVUb/PWOog
         8EBO0r+e8yhgZpLBSregTHvalurOPEBlo2aBHrFrDnkARFwYKiBSEgvImLQAuOBgJqcW
         0Ou5B0f4SOgmwwDHA5ht+CPsZK2qLHHoaN6us8tRdAaTYYuS5SisL0FWkrVCqBz4JTa3
         SqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713694805; x=1714299605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQ34QbYUP42radFqcG4Fu2rfSxDEHqCa4xcp8CRb+6I=;
        b=dXYeqKbifn18uHj4YXzSXfbc+bpUof+oQ0gYEW2kJGz2G4KB663XXIuhLE3gcFOLsW
         DDHodLURuXYy0gqsLJM1ZNj/QftJPlaD1nlSo+NR4tGW94pE6uTufiIwl/GTZcHv+A7I
         HM0uiAt+ImbxQxjDPUc7ieGgzJoC+Okx3p0tkJzUC35rT5dDIhd34rWKcKtvfki21+xF
         IOkRjVqeAbFC8nVYxloPerijgzBE76A2zt/WSRPosyHhHvd+Ja5+KopeSmU8jHuTnMVJ
         uqRMmzOPe9Zs4Rys3FmsQ2sRMy7imn+84ieT5g8umcYs/PkBmwNYUk63UgQeVFZOyLOP
         7koQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX6JClQApRXPqkkTjsvp629WIpsPS+fvIlblgTcbpTwn/bD49g/AONVVOgHDQ3z47SWnbX9Si4IEitR/1g9N+eG3xJ7Z+DuXmpmNtUJFjG
X-Gm-Message-State: AOJu0YwmIiEB8PbEEP/FmwzPjWRyO+38XjuWDD+rar4oX5/lZY8ADhdh
	IVifT+D6N74ohjqp6puurhHERq5cFLhDPBpHIr7mciLJi35noGCcNuW7K/hCaSs=
X-Google-Smtp-Source: AGHT+IEAP5ccnT87Gjlugcu7UBPy8RZkCrhchcaaIW1xoFta2k9UOHEQVI4x2dhSEVzyP+LDuaDHTw==
X-Received: by 2002:a05:6512:4809:b0:518:d4c3:4682 with SMTP id eo9-20020a056512480900b00518d4c34682mr4163280lfb.24.1713694805349;
        Sun, 21 Apr 2024 03:20:05 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b61-20020a509f43000000b0056e51535a2esm4426362edf.82.2024.04.21.03.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 03:20:04 -0700 (PDT)
Date: Sun, 21 Apr 2024 12:20:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, devicetree@vger.kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	anup@brainfault.org, atishp@atishpatra.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, christoph.muellner@vrull.eu, 
	heiko@sntech.de, David.Laight@aculab.com, parri.andrea@gmail.com, 
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension
 description
Message-ID: <20240421-f63f90c2146deb0695b84441@orel>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
 <20240419135321.70781-10-ajones@ventanamicro.com>
 <20240419-chafe-leotard-e5daee19b1c8@spud>
 <20240419-8c6af6a169a7aa0b9aa5cac5@orel>
 <20240419-disdain-litmus-82874cc4872e@spud>
 <ZiKeYRnXxtLUtkkW@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZiKeYRnXxtLUtkkW@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_032009_844819_AE34BB19 
X-CRM114-Status: GOOD (  44.97  )
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

On Fri, Apr 19, 2024 at 12:40:01PM -0400, Charlie Jenkins wrote:
> On Fri, Apr 19, 2024 at 04:19:52PM +0100, Conor Dooley wrote:
> > On Fri, Apr 19, 2024 at 05:16:05PM +0200, Andrew Jones wrote:
> > > On Fri, Apr 19, 2024 at 03:45:46PM +0100, Conor Dooley wrote:
> > > > On Fri, Apr 19, 2024 at 03:53:24PM +0200, Andrew Jones wrote:
> > > > > Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
> > > > > which was ratified in commit 98918c844281 of riscv-isa-manual.
> > > > > 
> > > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > ---
> > > > >  .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
> > > > >  1 file changed, 12 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > index 468c646247aa..584da2f539e5 100644
> > > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > @@ -177,6 +177,18 @@ properties:
> > > > >              is supported as ratified at commit 5059e0ca641c ("update to
> > > > >              ratified") of the riscv-zacas.
> > > > >  
> > > > > +        - const: zawrs
> > > > > +          description: |
> > > > > +            The Zawrs extension for entering a low-power state or for trapping
> > > > > +            to a hypervisor while waiting on a store to a memory location, as
> > > > > +            ratified in commit 98918c844281 ("Merge pull request #1217 from
> > > > > +            riscv/zawrs") of riscv-isa-manual.
> > > > 
> > > > This part is fine...
> > > > 
> > > > 
> > > > > Linux assumes that WRS.NTO will
> > > > > +            either always eventually terminate the stall due to the reservation
> > > > > +            set becoming invalid, implementation-specific other reasons, or
> > > > > +            because a higher privilege level has configured it to cause an
> > > > > +            illegal instruction exception after an implementation-specific
> > > > > +            bounded time limit.
> > > > 
> > > > ...but I don't like this bit. The binding should just describe what the
> > > > property means for the hardware, not discuss specifics about a
> > > > particular OS.
> > > > 
> > > > And with my dt-bindings hat off and my kernel hat on, I think that if we
> > > > want to have more specific requirements than the extension provides we
> > > > either need to a) document that zawrs means that it will always
> > > > terminate or b) additionally document a "zawrs-always-terminates" that
> > > > has that meaning and look for it to enable the behaviour.
> > > 
> > > IIUC, the text above mostly just needs to remove 'Linux assumes' in order
> > > to provide what we want for (a)? I'm not sure about (b). If Zawrs is
> > > unusable as is, then we should probably just go back to the specs and get
> > > a new standard extension name for a new version which includes the changes
> > > we need.
> > 
> > An (official) new name for the behaviour that you actually want, especially
> > if the patchset sent the other day does not have the more stringent
> > requirement (I won't even pretend to understand Zawrs well enough to know
> > whether it does or not), sounds like the ideal outcome. That way you're
> > also sorted on the ACPI side.
> 
> What would be the purpose of a vendor implementing WRS.NTO (and putting
> it in the DT) that never terminates? The spec says "Then a subsequent
> WRS.NTO instruction would cause the hart to temporarily stall execution
> in a low- power state until a store occurs to the reservation set or an
> interrupt is observed." Why is this wording for WRS.NTO not sufficient
> to assume that an implementation of this instruction would eventually
> terminate?
>

We can invoke smp_cond_load_relaxed(addr, VAL || anything_we_want()). This
means we may not expect VAL ever to be written, which rules out "until a
store occurs". As for "an interrupt is observed", we don't know which one
to expect to arrive within a "reasonable" amount of time. We need to know
which one(s), since, while wrs.nto will terminate even when interrupts are
globally disabled, we still need to have the interrupt(s) we expect to be
locally enabled. And, the interrupts should arrive in a "reasonable"
amount of time since we want to poll anything_we_want() at a "reasonable"
frequency.

So, we need firmware to promise to enable exceptions if there aren't any
such interrupts. Or, we could require hardware descriptions to identify
which interrupt(s) would be good to have enabled before calling wrs.nto.
Maybe there's already some way to describe something like that?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
