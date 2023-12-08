Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2188BC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rcxfu9Zg7GNHjpkuz6ET66waMeLzAFXwZgRFqjtOYWA=; b=LeXGleJV4BCcgm
	I/hMsBeRYcTPIiGwZTosjA30pEnpWYfPlQr7hbcDVQm4pMzoY5Lt1DuL2Xs8/WD/+GuOsVejVrc6W
	GqFFfuzjkwWqTk5sqQe5WC7tcVw3ChnMQvict9dMsQucGQ6lFe8dJXGSeKcUR8oX5UbZZ29Lb2Fbi
	xxVdjVYbwDtliV5IEF/qsWWStpf5WyyiSl5+m8TYRXfxtEoKBqrvBiFo1QABb/WV3qLEfSphkGotr
	ww+ZqtnyXRSxBDuXa22GNrLMyURYs1QhaJZut4qhmOvSy5JrIusmMKeSr3Y8zuLwyYE4/Ad3qEyUl
	2x1jupebO5J7KRCETTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBicN-00GcdZ-0A;
	Fri, 08 Dec 2023 21:42:43 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBicJ-00Gcd1-0G
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 21:42:40 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6d9e993d94dso719896a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 13:42:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702071753; x=1702676553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAfN68Sm3Ma2VnLB4uj+2M8nBwQbTqyO/LCdJPBLHVk=;
        b=JaSbPQimeA/qDibkqga1MkyE/3E/FqztyxQanv9Nen6lFKzmfWKyfpkditaLmo39IP
         HuhDaAcxlW3x2n+tHtoiEb9z89R/WVA8mHx/XLoQj1S2IwJmFmyoraZZqc92Yu99oIfp
         JbHEu0hw8dShx72PGShn0/x5Zy4hxIcR0hM4CkG2BAkjtB78HBPGM4wMsEgPqMgA42Ma
         BNAPDvsFWTrK/jmbFyqJ11Dmnk0cMbLRaPMhCD6bYc+7lDnxYkhY63gYPB/dn9dr7EMC
         O97uBknpbifDAdAZLb8YrJNfp5SHlv5c/0jRTgOW/YS5sWnW3Q8RhEsCZZHhqLH0VDnO
         Py/w==
X-Gm-Message-State: AOJu0YwIYQN6/fidw8tyKU5KFAF4cjW/xH9FRaQjkiqywk3IzdXQKi+X
	FCowIcOPJO2HcoI8UEW6IA==
X-Google-Smtp-Source: AGHT+IEmwxuggTo2ju30Ucv6bYuJd0p/9ogjLzvbfH0HbqDKNhshngTzZpOVDv288xxzAQmTakEB7Q==
X-Received: by 2002:a05:6870:1b0f:b0:1fb:75a:c415 with SMTP id hl15-20020a0568701b0f00b001fb075ac415mr846554oab.62.1702071752839;
        Fri, 08 Dec 2023 13:42:32 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id gb8-20020a056870670800b001fb4aaf261csm607175oab.32.2023.12.08.13.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:42:32 -0800 (PST)
Received: (nullmailer pid 2852367 invoked by uid 1000);
	Fri, 08 Dec 2023 21:42:30 -0000
Date: Fri, 8 Dec 2023 15:42:30 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-can@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>, Wolfgang Grandegger <wg@grandegger.com>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH RESEND v1 2/7] dt-bindings: can: mpfs: add missing
 required clock
Message-ID: <20231208214230.GA2850699-robh@kernel.org>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
 <20231208-palpitate-passable-c79bacf2036c@spud>
 <170206026051.2485962.13304186324857333888.robh@kernel.org>
 <20231208-contusion-professed-3b2235f7d3df@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208-contusion-professed-3b2235f7d3df@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_134239_123680_2C75C800 
X-CRM114-Status: GOOD (  16.92  )
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

On Fri, Dec 08, 2023 at 07:25:39PM +0000, Conor Dooley wrote:
> On Fri, Dec 08, 2023 at 12:31:00PM -0600, Rob Herring wrote:
> > 
> > On Fri, 08 Dec 2023 17:12:24 +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > The CAN controller on PolarFire SoC has an AHB peripheral clock _and_ a
> > > CAN bus clock. The bus clock was omitted when the binding was written,
> > > but is required for operation. Make up for lost time and add it.
> > > 
> > > Cautionary tale in adding bindings without having implemented a real
> > > user for them perhaps.
> > > 
> > > Fixes: c878d518d7b6 ("dt-bindings: can: mpfs: document the mpfs CAN controller")
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  .../devicetree/bindings/net/can/microchip,mpfs-can.yaml    | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml: properties:clocks: {'maxItems': 2, 'items': [{'description': 'AHB peripheral clock'}, {'description': 'CAN bus clock'}]} should not be valid under {'required': ['maxItems']}
> > 	hint: "maxItems" is not needed with an "items" list
> > 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> 
> 
> Oh dear, me of all people.

Happens to the best of us. :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
