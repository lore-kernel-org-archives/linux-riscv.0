Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9507DC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyhrpI/6o55AQdaoZaNdZJfxg9aDPTioAPUXGH3i9ZM=; b=0kFhJmi6BZr3I7
	65jgms67ysTJZUldWndorpAwe/6Qf86tyZgm0Rd/d4QHW/cnF3rCdlVOjtqBMa9wTI2Wur4KrKuuU
	DLiJTGMbx2WJxf+qtJCCZhHyHhMZ70R6yoWEEId4ITXISIOuU9Ym2Lw5HvngAvU6CJdek/pSILSfU
	6qyEZQX59+HktNtfRfZjqO2OjO4xluxLQmCldO4vj+/8GR3uFO/iiVKY9nRdD0y8XpuzcckqXsFT5
	ZtzEzocZGl23eZnRqsRrb+pbBOfcTplDMPvuRyZMdp2GBJoooKYOA7EcD2Cmx64CsftlWLcS6Ai9N
	FSTjwcL52gw/zDxsXuyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zB0-0071Na-2k;
	Wed, 07 Jun 2023 19:50:38 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zAx-0071Lx-1O
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 19:50:37 +0000
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33b04c8f3eeso6993835ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jun 2023 12:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686167430; x=1688759430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxz+VSY3OchR10r0VISpQdXnKAXD7OegfTXcHZuDAYI=;
        b=UDoKeuLhy9r17vfXjn0VnF//ziMgxTPbJFhiT44aAkF/KZ9Mayo84B0uWgTAzjQ7rb
         9WDJ+ircO2B6xWu0H+umnSfJ6I4YvRHWYEDElrdVx8bs4e79F1vK+lo6DdpsiBcjlD+3
         /UZwsL2J4DUbPvazvRKA0WMfDkvxfn9Ve+Wlo2pr3M38cPGHafn5vXmJPbOpnlTmgqeY
         sRVIA3ze6YgTybTU9vJPyva31dZYLCYHw6fHs102v5CN7zimcQ0aBZRRdb6TnWtRMFWw
         fKJlVn1pPJvbjRsVSVW8HgCRMmxQv5iyOqNpujePgB6bhGUKAymd73GVrP1wsJD5lUcI
         oayA==
X-Gm-Message-State: AC+VfDxDVG27A1dAbWpv0ygtHar/vMGE5sD6xpWyXNwyVG6AEj4c452J
	C2I9GqczsA1NBw55z2kSoG0KSA1lLQ==
X-Google-Smtp-Source: ACHHUZ6tTOede3FtgEtqDJNqsgOvBRsC+XBRPLf51VdMkdKwVWMknIrdONxR0TfLO75XXTRxbToixw==
X-Received: by 2002:a92:d34a:0:b0:33b:820:41ad with SMTP id a10-20020a92d34a000000b0033b082041admr5387661ilh.9.1686167429947;
        Wed, 07 Jun 2023 12:50:29 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h14-20020a926c0e000000b0033af42a969asm3910489ilc.57.2023.06.07.12.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 12:50:29 -0700 (PDT)
Received: (nullmailer pid 3907121 invoked by uid 1000);
	Wed, 07 Jun 2023 19:50:27 -0000
Date: Wed, 7 Jun 2023 13:50:27 -0600
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v4 01/10] dt-bindings: vendor-prefixes: add bouffalolab
Message-ID: <20230607195027.GA3894404-robh@kernel.org>
References: <20230518152244.2178-1-jszhang@kernel.org>
 <20230518152244.2178-2-jszhang@kernel.org>
 <a45c9193-aa63-650f-dbb3-14b6c3f74eeb@sholland.org>
 <ZGneH+ApaQVvv3SW@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZGneH+ApaQVvv3SW@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_125035_472049_1CDB1968 
X-CRM114-Status: GOOD (  21.02  )
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

On Sun, May 21, 2023 at 05:02:23PM +0800, Jisheng Zhang wrote:
> On Thu, May 18, 2023 at 09:53:12PM -0500, Samuel Holland wrote:
> > Hi Jisheng,
> > 
> > Thanks for updating this series!
> > 
> > On 5/18/23 10:22, Jisheng Zhang wrote:
> > > In the following commits, we will support bl808 SoC which is from
> > > Bouffalo Lab Technology (Nanjing) Co., Ltd.
> > > 
> > > Add bouffalolab vendor prefix binding.
> > > 
> > > Link: https://en.bouffalolab.com/
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index 82d39ab0231b..3566346f2f9e 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -200,6 +200,8 @@ patternProperties:
> > >      description: BOE Technology Group Co., Ltd.
> > >    "^bosch,.*":
> > >      description: Bosch Sensortec GmbH
> > > +  "^bouffalolab,.*":
> > > +    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
> > 
> > Have you thought about using the "bflb" abbreviation as the vendor
> 
> I did think about bflb vs bouffalolab. Here is what I thought: I came
> across "marvell" vs "mrvl" sevral years ago, I got an impression
> "marvell" vendor prefix is preferred if I read the discussions
> correctly.
> 
> As for Bouffalolab vendor prefix, I have no preference, maybe DT
> maintainers can provide inputs here.
> Rob, Conor, Krzysztof, what's your opinion?

The general preference is to match the vendor's domain name (minus the 
.com, etc.). Originally, the preference was stock ticker symbol, but 
we've pretty much moved away from that.

So that's 'bouffalolab'.

Acked-by: Rob Herring <robh@kernel.org>

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
