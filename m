Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A75C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZiwL2xb/A/MmR0gEoOyym+7rrC+tYaEkiH5SkiMJ6k=; b=vUDmNXOGIP7Z+B
	UXCRZKpFSrs3XoKKsdVjT/LyMWo0h4RQcEhHSh7mAUe5r07oymizRIB45Wc38IlVxWUsqJj+1PJI5
	Z569sjygMcy0FYvgxYdakSTDI8f+GDjV8O8AOxzmrJsVxyDpOSy6ZgWyfL/5K8Dj5o0Qh4fJhYyP0
	Oju3Qz+lnITaFGz0OGuXp5eqC4Nymb85h46FLwj9vxp+hEVFCjL6jK+zDduDcdrcIuR9Lu0Tsvjwj
	oYpkJCpNMQnpcShY1V6w7CGgai/75rCLMeW1KpcH7Og/Qj7e8qQrc5odQrPY30HBuvEAKSsH9Y5Ca
	5RF1CY2HGXYbdmOU6fMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPH0V-00000009KH4-3Kp9;
	Wed, 11 Jun 2025 08:40:27 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGqf-00000009GtT-0xzY
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:30:18 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7d3862646eeso220134585a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630616; x=1750235416; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcSP2lVjFJ/bu0C3VkfzSJDndgidRs2bj0/IW68A3/k=;
        b=fXkOhm7mUl/ZpbZuhRd01uDmsvu1FttZudYytHe7hnRKobRnsHuXLuxUvqNpFuUF6l
         EKs5b+u1+VssYLva5hb9jdiHfCBnuGiLF1p0GjG9nCMthG9e1eFaQ9jSC4pVxmJxIZZG
         CPPiih4uoB+YSCtItBABdgccq0lTn5eA9p2nzQRRab9v/3BcHqC5liLHwY1B5nlSCv9p
         6gaodVFzym9/MPrYJqXNIGwB71WqnVnXCaTywTOCT7WzyM8PxDOb6aASl0v4IEhEqz+7
         +53q5F1S6Mj0/5TVIzLYGrq5Pd96q2C+3pPl9xoQvHL3qQf3l1kJkkQ0KfvGYkL03ozB
         WIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630616; x=1750235416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcSP2lVjFJ/bu0C3VkfzSJDndgidRs2bj0/IW68A3/k=;
        b=JCP6NuxQzk97DwkIVu3jfzzGN9ETlssQLiR7h3RBM+uijPEI9OYHL55u4MJ6kGzvH+
         Tq52AIPGk+Ax9J+wBgjsw2vwy7mQZhdnKjCMvo7D/I8vApgbAWI+dvYnPokpbfFbk6Cp
         vlLhQiYFNM6V64BOTQYEDkPr3oiOxtgciLcxDBj7JUOgnVqzBau1toDHzoaUsQC+iaTt
         f/qVKh5d7ssqaDeBLTTb8aHXALmh3yHarnsJg9abn9xNu7VOGaQpgqPWy3SwqSw1dhEJ
         q9Q4EpYUTZPfDxpPvekrH2edyqglFY5Di/mc3vRjNX+cXWRb/EoiFagqEFKCENzvqTl5
         gmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FDCuC8PmpADwDAKwUUeWP1j15G6drtovSr6zy9eBxo4ZShd+3Dn2vrebQZGD0GX1hVxS05r41BHytw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrgnr28j+McGEnvFqXXFaR15KHC5Mf6ZBEI9W+GE0I42VsuvA2
	FnrL70ZhL5xU+BcWNXg/Na/AdlhPHZGWekx7AX8NSSDWlslsL7Tn9YVD
X-Gm-Gg: ASbGncvxCfgtb3BEfUfcz9JIMp81SF7vs0QrDFIfHPOvFMc3fD4hMw+WtaKWLAe7ptX
	KwSBPKyGDi0DkotfoDo+U8f18QhCO6wpzkSlkBW7Kh4ugFNXx4gl19ru0XO9/mxudyT8N1wCH0j
	aOdVaESaa8muyYYEV+KE/GHfEC5Z9yf/EF2SDZ197AB+m670VjGisWx42GL4sxPRKYjq7o2kEwb
	ci3Isvf0rLMMZKQriD1ihTOUVgAtgXNLKK1yqSXk8cgwVqkxi+B+wxhl7DICG4mRE71NoA+rye+
	3PWxSKJGRuit/sr+l2PH97fAlBxqa33xxbej7v2ZX08s/eZM
X-Google-Smtp-Source: AGHT+IGCumupGFYJr2miTmB5pZGshAqhyq5KGLzPXAmspYahxEndxqWSVq6p8juUyI8Wq6JrkTAl1w==
X-Received: by 2002:a05:620a:2489:b0:7d3:99db:c4c with SMTP id af79cd13be357-7d3a8805820mr382875185a.6.1749630615951;
        Wed, 11 Jun 2025 01:30:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b2a085sm78890866d6.82.2025.06.11.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:30:15 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:29:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <2v4hfzqgz22k6s776onexnhd5cnhfr7s7ggvcmh4mfiviigq66@a2ehkwbv7oll>
References: <20250611075321.1160973-1-inochiama@gmail.com>
 <20250611075321.1160973-2-inochiama@gmail.com>
 <20250611-brown-turtle-of-election-87c324@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-brown-turtle-of-election-87c324@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_013017_270585_7EE98610 
X-CRM114-Status: GOOD (  14.52  )
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

On Wed, Jun 11, 2025 at 10:19:49AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 11, 2025 at 03:53:15PM GMT, Inochi Amaoto wrote:
> > Add bindings for the reset generator on the SOPHGO CV1800B
> > RISC-V SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > index 1d1b84575960..bd8dfa998939 100644
> > --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> > @@ -17,6 +17,7 @@ properties:
> >                - sophgo,sg2044-reset
> >            - const: sophgo,sg2042-reset
> >        - const: sophgo,sg2042-reset
> > +      - const: sophgo,cv1800b-reset
> 
> Keep alphabetical order. That's enum with previous entry, btw.
> 

There is a small question for this: should I move this before the entry
"const: sophgo,sg2042-reset", or before the first item entry?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
