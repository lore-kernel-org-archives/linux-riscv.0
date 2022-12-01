Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C1C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 19:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4pbBZ99fComiQqaLraUhuz4EOfZ8lr9dwkw0sk1AZw=; b=v2lxgaCZfu0Qyg
	elMlvU/0PRQBPHRDP9Uu7rexSjIJYhGnfRQ6V4gunwQGIc7fR0NpF+GweBg89y0XwcQE4j0/XKPHj
	MwwfQypx0hQgRyzhGbcl69RWYJTyxDUTk6gbQI4Zb2dwCUkazA+1wcIMDlBRhHmRrzxmea1aGkMSX
	JIE95OUK8I4zwSaVSavzn/uz7flkY9d9guHI/F2Dz3c5qmLxyjp0bmCJ8VW2thstc0Upr5py/7zXH
	LOW7WSAyylEKSxo8ZKjA5axzB6go9QFXSOa7i/jQBR2vQCVZQZR8AfQqxtb7PXYpeY85aQ5ZWoUOn
	P9A/MoApXcjY2Qxwf9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pML-00APVG-MA; Thu, 01 Dec 2022 19:36:37 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pIk-00AKN1-Hy
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 19:32:55 +0000
Received: by mail-oi1-f179.google.com with SMTP id v13so3128445oie.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 11:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmJRKIwqBp8gbnNMB6ag+fH04itLVPSAiCRSKnEYWIE=;
        b=nRqspWMlsHZQOg66jL2EEib3uxAPZYRWWXrRfqzOtH8uMo9n3xBcizPdgVIuP/JJuV
         bLjDfxgJ7G59fbFQfEzjXWUkUZh3vj4zBdwtvZt44bdTEcmmycLgWJqpbhtiDIbSlsRT
         B7OU3ah2n+wmjsho3Yf/IgnYAfYVQrL7cvlSuPjxI6ayXxxx7wWAyXzE7t2v53nLoTiR
         QIJhhbw0DbVflhqJwyY26LX2AY5uKBgHiOLtKStRzmsjPjGqR4OXHqmlaq79xhD6/h1u
         vJKHBzyO1a8lJwZ8itJ4BqL31Eykuvu4fcE+g98oeS5u7LGYnQB38etByo0gDdrblJbS
         XDsQ==
X-Gm-Message-State: ANoB5pkU7kU2WmaGzskuCWVsGyIOAjIT3aiOAi9Pr6RYM45ZPNqsd1zP
	EVnsdQRh00HIAYfg4BOSDw==
X-Google-Smtp-Source: AA0mqf76S50/fCO8mJTuqErpyB2kZCnIKu73wy3rgo6CPDCs+HL87HJ2zzP7LGwz5k3YUTQnYyjZfw==
X-Received: by 2002:a05:6808:8c9:b0:351:1a63:a74c with SMTP id k9-20020a05680808c900b003511a63a74cmr23789693oij.288.1669923169283;
        Thu, 01 Dec 2022 11:32:49 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z95-20020a9d24e8000000b0066101e9dccdsm2524124ota.45.2022.12.01.11.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:32:48 -0800 (PST)
Received: (nullmailer pid 1203239 invoked by uid 1000);
	Thu, 01 Dec 2022 19:32:47 -0000
Date: Thu, 1 Dec 2022 13:32:47 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yanhong Wang <yanhong.wang@starfivetech.com>, linux-riscv@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1 3/7] dt-bindings: net: Add bindings for StarFive dwmac
Message-ID: <20221201193247.GA1190273-robh@kernel.org>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-4-yanhong.wang@starfivetech.com>
 <36565cc1-3c48-0fa8-f98b-414a7ac8f5bf@linaro.org>
 <Y4jl6awCMFgZsQGC@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4jl6awCMFgZsQGC@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_113254_634714_90599B6A 
X-CRM114-Status: GOOD (  18.08  )
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

On Thu, Dec 01, 2022 at 05:35:37PM +0000, Conor Dooley wrote:
> On Thu, Dec 01, 2022 at 05:21:04PM +0100, Krzysztof Kozlowski wrote:
> > On 01/12/2022 10:02, Yanhong Wang wrote:
> > > Add bindings for the StarFive dwmac module on the StarFive RISC-V SoCs.
> > 
> > Subject: drop second, redundant "bindings".
> > 
> > > 
> > > Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> > > ---
> > >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > 
> > Drop oneOf. You do not have more cases here.
> > 
> > > +      - items:
> > > +          - enum:
> > > +               - starfive,dwmac
> > 
> > Wrong indentation.... kind of expected since you did not test the bindings.
> > 
> > > +          - const: snps,dwmac-5.20
> 
> Disclaimer: no familiarity with the version info with DW stuff
> 
> Is it a bit foolish to call this binding "starfive,dwmac"? Could there
> not be another StarFive SoC in the future that uses another DW mac IP
> version & this would be better off as "starfive,jh7110-dwmac" or similar?

Yes. Really, *only* "starfive,jh7110-dwmac" is enough IMO. 

The question is what would the OS do with only understanding 
"snps,dwmac-5.20"? The answer is typically nothing because it isn't 
enough information to act on. So that compatible is not needed. Maybe 
the driver can do some things based on version, but that can be implied 
from the compatible (if not read from a register). And often, the exact 
version is not known, so do you want to hardcode a guess in DT? For 
these reasons, we've moved away from using these generic IP compatibles 
(with or without versions).

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
