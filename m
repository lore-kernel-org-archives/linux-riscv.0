Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD2AC369A2
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zy5vjjawbkDgZyIdauHS5tldn3+7VM9fSuwZUlRfj0M=; b=KJjmAlpqmqhcUo
	NRPTNBk9RRZJTx0bYJbnohWZBClUCPb/l0q6fERgCBQi0xBmpcNL/5RHKOXi1CCmoKcpFmbgayvCf
	eaLKqVqZLGe5Pik0dvmM0Nu+RiQ4mxRJEe6WNRDww/GF7e9LL4b29mLTnbRopZjjsrLrlXQNuJJng
	DJrlg+UIvU7UEdUhRzdR6uZcDAaBDUhJ09bJBSuO7DMYRviUG80jluQ1ucNecoyHazQbWK6hzkfzm
	lPu8dZijc8jq4Tp+NzOLsCRAEwlpStOQLsWNEKvkI+Hgyr+RHnCpkPjmc0sIqWlz8fpm5+ka7oWxD
	qdtufIt/0QAlnLfhZFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mE-000000046mL-3l9H;
	Tue, 08 Apr 2025 13:14:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u271L-00000003pYr-49TI
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 11:21:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso5283848a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 04:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744111295; x=1744716095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1WTsXHcQYhNYnT0/xU5DpY+xWRau9JN7FZGJGxicCc=;
        b=QlMSCh2uqxhWYEgtAy2tIyt3fPyRZcLFwawoICImDvjeZKNqK6KoMmCT5/sLuREnJK
         R1XLA/T2+hVY9PfxUVwjTM/04npo8u7VhjGEIxEW35HDR9M1sUp5LxTZu4C91+hRw4da
         jen42flyaA+Fb9ZW1wi0J42WrdElvZ+NJuFyFTz/wQz3U0tl+62SETD4xvIYj3vqpHaK
         uT4fN8rGQyjT/HWzgFTBOteVWXFlyHdhOr/g+l/pHTPovcEXzAbJOB4ifOuk1OhIllJw
         9tBVaMZO8qF36DKt0RWcHpyxlPahj9QF4IEyAoZWIGyg0jDIg3KMO9r9Kbj8T6rdHuAJ
         HjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744111295; x=1744716095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1WTsXHcQYhNYnT0/xU5DpY+xWRau9JN7FZGJGxicCc=;
        b=YhCnW33sfC9LJekfAr1rOGVRBf4W9jnbOHgtj4LN57Q7FyK9wgaq+hIKbvb4v/sx+6
         bQjB002uemaFMX+sa4g+vwrjHwc2wHf6BpKRSC18BBjpd9hZeqibmI7glXnwMfQ74kzC
         S2LLuDHePnmVMM6pmJ4D5zaPs86mdN3whaRqHL2V46gcfl6C+IuIYOLaFTX7QD4Krtxh
         31sRr3jPIVVK4zC+kFYU8/9k163uSwEL8Ad962oG9F2q/1RNVoqR9IRaBYFovEvPvI/7
         MX7LOtois/vUg2RoVkG12WJHITDeQg9PsEK7MiMIaoKTbcn4dKN6Fp8Ohhv5Xqb511h3
         V47w==
X-Forwarded-Encrypted: i=1; AJvYcCWksCxuOWYO7tey1/Pj48qp68inkocYCQlQ/CH65OZJsEKYFymCXNTKg6oHvT8mpIzMqMw2G3N/DvKF7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvvHQqt/BpxP5b8MearKBxEFDAHjNxU/UC9B1GwnI6LMWVPQOB
	7Jm8cKQ+QXUPMgtXM0y1/X/gSg4UijQCP2e1AVAKAw5eCpK+5WdP
X-Gm-Gg: ASbGncsT5v3YhH2crGOWiTJBIeWh/bGR7qgUz6LU1A/e5AO0Ty83LAHBewKsSQlLBXv
	aCXtRf3B9TireC9K+FkduHzWCjBMah7gROhUxF55XCJLNK7trEPI4ralVOPALBlKOMhhHQDO+gs
	ATMR4soazXFWf5RbAC811eZ6YLAJtP5rqONlvPp/+HuJlLvcYcUNbCePiCjqOA2/OCKLe+Ov/1z
	kbX9zTXycaUkzANLvJctin5l16eB1V8KfPXezk7Xhubop0Yt+QkdLbJRwcZaC1fVymEdQj+MasK
	pp+BqJlGBxVuVO3pxV2WqqxnSs4AP7fIR+/oRdHsIeqZKHk=
X-Google-Smtp-Source: AGHT+IENHbT7aGSGC2d+Xs3HK0eW2n1NHcpEJC/0ogHOySPZcdktzD7ZPPAXmOKRs/wQ018ClqbpUQ==
X-Received: by 2002:a17:90b:53c5:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-306a47c2e20mr24517484a91.7.1744111294119;
        Tue, 08 Apr 2025 04:21:34 -0700 (PDT)
Received: from localhost ([223.80.110.9])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30588a30974sm10619376a91.25.2025.04.08.04.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:21:33 -0700 (PDT)
Date: Tue, 8 Apr 2025 19:21:28 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, sophgo@lists.linux.dev, 
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, dlan@gentoo.org
Subject: Re: [PATCH v4 1/2] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
Message-ID: <qe4qhkbou5t24jccfrufvszsrbrwvj765y6jrj3bnhk2jnh5st@2y4hpbmujo3w>
References: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
 <20250407-sfg-spi-v4-1-30ac949a1e35@gmail.com>
 <20250407140739.GA2174606-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407140739.GA2174606-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_042136_028603_890B9C63 
X-CRM114-Status: GOOD (  17.18  )
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

On 25/04/07 09:07AM, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 02:35:12PM +0800, Zixian Zeng wrote:
> > add compatible property to include "sophgo,sg2042-spi" for
> > the SOPHGO SG2042 SoC SPI Controller.
> > 
> > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > index bccd00a1ddd0ad92b437eed5b525a6ea1963db57..94102d94ed5dffe889a8a11c1c637d466713c208 100644
> > --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> > @@ -88,6 +88,10 @@ properties:
> >                - renesas,r9a06g032-spi # RZ/N1D
> >                - renesas,r9a06g033-spi # RZ/N1S
> >            - const: renesas,rzn1-spi   # RZ/N1
> > +      - description: SOPHGO SG2042 SoC SPI Controller
> > +        items:
> > +          - const: sophgo,sg2042-spi
> > +          - const: snps,dw-apb-ssi
> 
> This and all the other cases with snps,dw-apb-ssi fallback should be 
> combined into 1 entry.
> 
Sounds good, did you mean conbining "SOPHGO SG2042" "T-HEAD TH1520" and "Renesas RZ/N1" together? But How about the description?
> >        - description: T-HEAD TH1520 SoC SPI Controller
> >          items:
> >            - const: thead,th1520-spi
> > 
> > -- 
> > 2.49.0
> > 
Best regards,
Zixian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
