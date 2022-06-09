Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D9BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFP1uce9mXzxRvYmtGeBXG/KQBBZO6a3+JpNdaUH/pc=; b=esHs1QzpWqvljL
	ccacmV5xRFE7UtEjWCR/jRkwOwv4fZIDROJj00Mx5AxJpY+50UZuWLjrlyxlJOzpC1t3kIIJ+bPNw
	el/5mI2QS3WSQs0yoN7V9myOTG2D2DKN4YX9JoHBLq6VaXBG/+0iza/54p+mPzTVRkZT03ZlbNbL4
	HJyqZYQA60+EGZgsv+E+bEX5o4lgcQjFWRgHwav/gyUAGzyY0AknAUePNm7iwGkIsva199KdE1/An
	qXUVRgorDL5NopLtTE4QpUJO21/JTDbhi4VwttZ9/dWGeLBAm+cs4vzKMCCpfOkz6fs8JIzcDN1Ua
	xFkjbG2SC+Skbj1qO6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJpt-002fou-6j; Thu, 09 Jun 2022 15:12:37 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJpq-002fmI-2N
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 15:12:35 +0000
Received: by mail-il1-f171.google.com with SMTP id u2so18036458iln.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 08:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CGEoHPza3xdvV7CwQXyXz/OI0Wr6yYkBqPLhFgmXcEI=;
        b=B8RctwPsWk829384XG+E3/bXbkHZCWFOI5cYnyctm/F3nE6YXfOPYrAIJ7zgRLx4t6
         9dENe7CZuq1NIbtT5FY4P04M3CdVBJXn6t7gU5zzEVhspOjdMH0I3z2fwKYQd3SZlolq
         cTOPb1hjDLJEIQ3D4Vwvyo4s9MP785KXmWOXwWF8nSliXXDlqBr0wcs3RSy48g3XyG/s
         pdtM26kNJ8stT4qexhtjbdfohSKJy2avrJ2oiPYimYHGeNtjN3Xu6U1zeReUnE11g0S/
         HITBAlddWc5i9sTs2aVrvPsFdqeFeMOH5I1Fwxi0whe4jU4rDlhCG2rqschLH97BB/1G
         QxNQ==
X-Gm-Message-State: AOAM531vD2eguDrHnmyQy4D6f1OMiTng6lDkgJec4pkeH7uHgE3Gpvq+
	LxSKEKgfC1jc602GFXEs/mswEA0osw==
X-Google-Smtp-Source: ABdhPJxO74uRCvSmQ2Qo1e121V5wl+KoVx7z04wk1OQqECEb6tExG/JJBd5b7j1HEtIB6qWquwjzmQ==
X-Received: by 2002:a05:6e02:180e:b0:2d3:c497:710 with SMTP id a14-20020a056e02180e00b002d3c4970710mr22275012ilv.166.1654787550592;
        Thu, 09 Jun 2022 08:12:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id m7-20020a056638408700b0032b3a7817b3sm9599623jam.119.2022.06.09.08.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:12:30 -0700 (PDT)
Received: (nullmailer pid 3805410 invoked by uid 1000);
	Thu, 09 Jun 2022 15:12:28 -0000
Date: Thu, 9 Jun 2022 09:12:28 -0600
From: Rob Herring <robh@kernel.org>
To: Atul Khare <atulkhare@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: sifive: add gpio-line-names
Message-ID: <20220609151228.GA3800290-robh@kernel.org>
References: <CABMhjYp4ChJ3KfP=jQmA5nnv7YB=Kkanjb2KwDEVWSS+Sn5m1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABMhjYp4ChJ3KfP=jQmA5nnv7YB=Kkanjb2KwDEVWSS+Sn5m1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_081234_175166_50935209 
X-CRM114-Status: GOOD (  15.04  )
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

On Wed, Jun 08, 2022 at 04:39:39PM -0700, Atul Khare wrote:
> Fixes device tree schema validation messages like 'gpio-line-names'
> does not match any of the regexes: 'pinctrl-[0-9]+' From schema: ...
> sifive,gpio.yaml'.
> 
> The bindings were missing the gpio-line-names element, which was
> causing the dt-schema checker to trip-up.
> 
> Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
> ---
> Changes since v1 [1]: Rebased on latest version

This one also doesn't apply.

> [1]: https://tinyurl.com/yvdvmsjd
> ---
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index 939e31c48081..787ce7300118 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -47,6 +47,9 @@ properties:
>      default: 16
> 
>    gpio-controller: true

blank line

> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 32
> 
>  required:
>    - compatible
> --
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
