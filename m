Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06C6C678DC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YN0UZvKmhu0pTG5gWxGsHSG/OW8wXwrDlpLDxLqO+IA=; b=On+uK2gxe6b28c
	VbKQkPg92wF1YB1eHE+ffm1CpyutUGAMsJsJ/SKuyhahW+2KR8AFCMYYkVWQR8m5ZJtTPp1bIYJh3
	uAFI5u0lxcrLOCKVQsAcaKBgO7Ukp+tEHfjimUjoUGHBit32zAXcoXlRgnMpTSqMBjbYwkD9iPsCi
	KxOkWl6PO02rCKYeltM0O1H9N8ym37GuTAknhTs9+1iNQx6TwjrIqbNHgoxUQCfqdSIQKfgY6YvlV
	vCKffylcRY2CNrpdTpJN5mpCEzt3r/ru9TNluNhI4V5r7V9iU9E4Ger5xPx/qUdWnpqRkJpKAJ91i
	1PeacKa1fGNc1yqR7HEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMlu-0000000ABE1-1Obl;
	Wed, 11 Jun 2025 14:49:46 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPI33-00000009Wgu-3EtH
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 09:47:10 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4a43cbc1ab0so79409421cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 02:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749635228; x=1750240028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n9rPiGNTaPA7/GngQM8aAU/prJJW46EXooVz3Uq/Q3M=;
        b=EKo0QG/+wzGM0x8YczONLMp8DHqiVDFG7OyFhxjp0XAseq1EQ86QgqBdXF9L4AWNiq
         QPmCjv92CkooOcCvruKQmGTtkByV3NDG0yNLT5c/XOEKaeA2W1CI3adzQIVRDdEW7UnH
         jwbNEmLT47pl7z2Ow0ZyBaePJgqSDMuAZBXWmFFJjN26uMspfozZ/VXn/etCYdwzm8le
         VmEoeraRVtfMAtami/be13MFNkBHVXvm021B9bKpOAXW3P38XwzuTy39qx71huF5WGN9
         DZfpskxao7oR6+KAqb6yGyC5K/e+oQFYuI/x5PXxmOo0U23IGvfArmT1nPeDMKpkWUgL
         McsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749635228; x=1750240028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9rPiGNTaPA7/GngQM8aAU/prJJW46EXooVz3Uq/Q3M=;
        b=epK2kFPM90Xkrf6DgIQ78q1znrka8bm4Sa0/EP3s5lGk5uxVkEka33FLgFKQI7e9sz
         T59CrLwIP6uVlWWQrYM7ehrx5+nWwKv9yptiqOP3sgHpzk8aOJ5zNnHgUrhVVyHIMjul
         Wvb1OfZ4KvRXoTlp72PO00ZUyK2XDbKZjnvsvp2ue9fT0h+YpV95mwuaIB2KPgLo3JRN
         l2nen8YOtAkD+6ErlzBRZlQnDI0JMZvE9ILxA5/BhxQY3Szh9+RnHbk5m5YIwGw43YzZ
         l/IzGSnGobxqk6N6bVsChFz8+iiQrbzO2CNvc0DD7ND5A9uFnOHQTl0wmYX6iOGtPdz8
         rfhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHlpM/WegSXH00wYp2wtixr+5m8UINU+6YlNWmqcc4ntGSGiFP0nximZtHFmzsVJ18ISLlQg04+Valcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YypOH76KD1tO5HczkDbp3gL4xm21rKisuvpVJkKr3gBXf//zMT/
	1iVT4jYQdNGPjQvO4TzOQ5IGrWmzd2jlhTfHWvwmWSMrF7YjcoVl+QTsEl3FGGXh
X-Gm-Gg: ASbGnctOwMr1KTvx6bg+wIZlHfis9LVaAxHyFdxnt8tfP8lrDj1OeLWrst7YtG9DL8q
	6j0OkJRhzrIzBO4ViCANuqLOp+1TY66XkAR1X7fCj1d2hSyoRy0HNO1T716jQfBeHsocSNu3K/3
	L0gh9Kmgn8quxhIdFSvKy+4DqZlq+YC5/1HcJ9RKs9D+r8uKPJuJcHYMTMRpT3TTjoKUfok1Iok
	sHsphxmsiPAi0Tx4pBehSSv0A5X+ND1qBVy9n72pe2fvejyBmYscNqneWpzrBTn4nsgtW4eAgTu
	/h+c4mjFGwpROKaId1cDv/evBux0RuO/4jkk+g==
X-Google-Smtp-Source: AGHT+IHoucd0pTsqUEMuvaSjWbfTQOjCUx6k4huksi1dJ/QwFsl1H1FuuHsdR5T8wu60/r37DLUb9A==
X-Received: by 2002:a05:622a:5595:b0:4a5:911d:52f6 with SMTP id d75a77b69052e-4a713c5ecc3mr52302751cf.39.1749635228486;
        Wed, 11 Jun 2025 02:47:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61116bc4esm86576941cf.28.2025.06.11.02.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:47:08 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:45:59 +0800
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
Message-ID: <mbvzlggbisa4zvvbjvlg5lrmhb455av37mrtwmphqiqi53iuyu@ybql2m773x4c>
References: <20250611075321.1160973-1-inochiama@gmail.com>
 <20250611075321.1160973-2-inochiama@gmail.com>
 <20250611-brown-turtle-of-election-87c324@kuoka>
 <2v4hfzqgz22k6s776onexnhd5cnhfr7s7ggvcmh4mfiviigq66@a2ehkwbv7oll>
 <ec60631a-7e55-4dc0-83f7-6e6cb156dbf2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec60631a-7e55-4dc0-83f7-6e6cb156dbf2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_024709_813003_B80E3327 
X-CRM114-Status: GOOD (  16.96  )
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

On Wed, Jun 11, 2025 at 11:09:50AM +0200, Krzysztof Kozlowski wrote:
> On 11/06/2025 10:29, Inochi Amaoto wrote:
> > On Wed, Jun 11, 2025 at 10:19:49AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, Jun 11, 2025 at 03:53:15PM GMT, Inochi Amaoto wrote:
> >>> Add bindings for the reset generator on the SOPHGO CV1800B
> >>> RISC-V SoC.
> >>>
> >>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >>> index 1d1b84575960..bd8dfa998939 100644
> >>> --- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >>> +++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
> >>> @@ -17,6 +17,7 @@ properties:
> >>>                - sophgo,sg2044-reset
> >>>            - const: sophgo,sg2042-reset
> >>>        - const: sophgo,sg2042-reset
> >>> +      - const: sophgo,cv1800b-reset
> >>
> >> Keep alphabetical order. That's enum with previous entry, btw.
> >>
> > 
> > There is a small question for this: should I move this before the entry
> > "const: sophgo,sg2042-reset", or before the first item entry?
> It does not matter where you place the enum. There is no convention for
> that.
> 

Thanks. I will fix it

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
