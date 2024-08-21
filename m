Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402FCC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKWgIFXE4vIGLIvvMY54D92aMnzXjQ2XMnBPLuRk2VA=; b=n4KfggcuegkiFl
	S6xu2GIjk2kxKOCEaiLYDslOPHyhaGZL7LDHXZRt0+qyrtcK90n96xNh8JznFa8z1bqDetkeOsmY3
	hcmv5h5YQtgzpxqqpe5i/nWGOvd+D8fteVuvhnOX6s9Xj50xoj5lVgcG+awcmH+v9PAZ/+/wKKOc8
	QkYunJy+6H/va7i5OeWaTzOZE2sWLfuSF2OkZ65Epbdf9CD42YA2RIx6q4G0uLuEqTuvGPSvvwfEm
	Zut40HKGb8jsUUyaGUQ8YGE3MEQdXCBsufrDuu2qiCMrhgSYeH/G2TlgTbEu1GWZry+4oPAKHfd5S
	9nGFxmok3HoqW6TuMUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgm8f-00000009G54-3k90;
	Wed, 21 Aug 2024 14:16:42 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgm8c-00000009G3h-1zGh
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 14:16:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a867a564911so81846766b.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724249796; x=1724854596; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1HTAcUTpqyzByMJpquHWMYu3B5Ynm1G8WC9iJphytM0=;
        b=J0gv7iBvoLhyXZufiRRNIBSqVGDHLbsDjqUCI3jf/BWOrpHBJ8AOmk+gwcWwhXKl0b
         mCuYFz22aVnv65xLzyX9JWA6OHxy6FlDokiZMeRGUe7C5S5D4b7TqorHIELhjO4WgvTC
         +LBOE9mqdb/8KJp72L2LP1Cd0dUnSOe2SWNSWBzi2TQCNaqOI9fHkmXBtCnAstsoCPo0
         CT5U4lQthgiHhz1QI8PhXKBFjMJkLgrCeHZYFJ5Oc8wG4o0j/pqO26mdjvUqs5K9m00u
         1YYUmREjZFSu8hhBxiU5HsIpMaf7dkYoEWCTeTmBxcxoBKzbZ/H9u5bspY6zB3ak1Pom
         J/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724249796; x=1724854596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HTAcUTpqyzByMJpquHWMYu3B5Ynm1G8WC9iJphytM0=;
        b=LKZJp6zGKiLaiZhw4tQgdpiK6S+Nkvfa9lbR2iwF3GWE4vApA9RFQ55jA8ZHho/4ko
         icgMOC78c/ZL+XX2L7AH18LeHuXlTRy6+5Q39Bau8kvYobvS3vTV14TQhWSTnw76KCtV
         h5qRldy/ACQXsm+2t1C2ako5hlVoDJUZaIQxcAizbNDyEtYZ5Wt7J5XqlruJQcLmaWdC
         SJ+KxfXTfWaJU2kwXBKqZwhmUhgxUH7W9WBm38SZwTnxyAC4XhSGTtivIzp0U+zFsN63
         Srlhl9G1DOirhM8OLVrP+fsyUMa+HFV7vBCd7+DQSX+TzhX7ucuO/9gcXXDbjT/qU/L5
         eO3A==
X-Forwarded-Encrypted: i=1; AJvYcCVL0OvGx89jm0uaFRbMn5vH0DqzflpyvsmxrYGWLcKo8AbVBS/kEPpIzxM2U6AGImyQU65tbKC7HKyDUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUSsgenfxF3fSnyW6tSQJSDgyGsab3ZVZsol+JSqyZ2eF0ymRn
	dH1g2ixg2DXBlB5VwduVmQPmRuJ/Xwo0px+hi87LPZ2OwU4f4yhLvbsET0LCntI=
X-Google-Smtp-Source: AGHT+IE8bwm0dEjF7VBywYff/AafpoSdjerliMDujGbpLZiuwqH+igjndWkqozC0Ufc6S5g43YyWNA==
X-Received: by 2002:a17:907:9803:b0:a80:f79a:eb6f with SMTP id a640c23a62f3a-a866f11b8ecmr177010066b.8.1724249795649;
        Wed, 21 Aug 2024 07:16:35 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86680ed15fsm136535866b.224.2024.08.21.07.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:16:35 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:16:34 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 04/13] dt-bindings: riscv: Add Zabha ISA extension
 description
Message-ID: <20240821-5c19951bb4f35f7ed90fc10a@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_071638_520716_C7046449 
X-CRM114-Status: GOOD (  17.88  )
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

On Sun, Aug 18, 2024 at 08:35:29AM GMT, Alexandre Ghiti wrote:
> Add description for the Zabha ISA extension which was ratified in April
> 2024.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index a06dbc6b4928..a63578b95c4a 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,12 @@ properties:
>              memory types as ratified in the 20191213 version of the privileged
>              ISA specification.
>  
> +        - const: zabha
> +          description: |
> +            The Zabha extension for Byte and Halfword Atomic Memory Operations
> +            as ratified at commit 49f49c842ff9 ("Update to Rafified state") of

The typo is verbatim from the commit, so

"Reviewfified-by:", err...

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

> +            riscv-zabha.
> +
>          - const: zacas
>            description: |
>              The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
