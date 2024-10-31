Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE87E68954
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 06:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3P1uvJbu/n7t0mSsK0MigTlAPxoAXPI7dNO2uBlKOQ=; b=UVI2+5jtOv/t5c
	JfRL6Ko/XJic6eFN8//OL0ttMb3teS02uOWRfT4RsSrXo6xqxxuMjCRLqToP5O1yXINZlIpHu9ana
	9ou4OmpgMHgkls1fT1TfnU6A5xfFuJ+WJxFpiv+qP4QwlM292F5W3M3tEbPTTmZM07eZ9jemVoGaF
	fP1eV65aTeGZy7Kqu03J8MZ3xghqoAgV81Hprkg3zprMAPT8zTCM0DUWd3jz4lmsZpbbz2UYu1xv+
	J48OV2wOTGiWehq9rRDoGTjcW5KNZ2a5nMge/sFVUOFURTRHc9UejpU8F+cEo1iJe/0PPGGzMIuOC
	Ccwc64JHjadsVKrQ7pcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OU9-00000002fHh-3oXP;
	Thu, 31 Oct 2024 06:16:45 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6OU7-00000002fH2-2k8E
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 06:16:44 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a3a5cd2a3bso2145775ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 23:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730355402; x=1730960202; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EuWXK1FTmmyHPdq/HX3ciQnkpD6mZ9pTPXfUjDd7qVw=;
        b=mSfKUztZjWCXdSl/L/usAkE38YT0O2A6wH7/OXvXTIg0NScme6RJDQM0Yfmci/xdU/
         t+p+hGpZVAQixSeEcVDPAta2l6FcqVkV3z62S9vbuZBSGZWzBqE3B1ASgVaZPeDOiEmY
         ZWt/sgNLM0dEx7aVhhlWegpdsjkCjCI2YGXy2bAEstmiyNDpiir3LYKgomWnV691VaIV
         OzI4OyyYbmB4Fo0xENnemgtipwl+FphBIt3L0IU5AKIQVERxi0hseodxRwcsmmNxhdgy
         xPYg9UIdAwsFXa8QsI/pXD4/shB5d7mIoQ1PUXXWkMM6NJlzhMoqIwuV28zpmBDrdSdt
         u1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730355402; x=1730960202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuWXK1FTmmyHPdq/HX3ciQnkpD6mZ9pTPXfUjDd7qVw=;
        b=O8Qvwy68dG08GfHn699UCFc4H8eJSlCGmazUYLG7z4mLbDeNiz3DUxzGaXxHlojyZ4
         8XHdkR/V5+a71sasivT/z6ogBwTJhKyCYj6pMeqWwkl01kdMVvFb3nde9YZWDmQfIpj2
         TQwExOnHVJQxUixla65dkENyNeos+6r99sPZBEROyKlpsBtlRhcrz0V9XOxXRSYx8bDs
         7FUIcmkK1YOgIXsNleZdWl54Mn1u9iJWtHx1e/tUKa7ylvNkrNYm1I5Knqtyp0QvR6/O
         gavpTUxDmrNCS9DF8jzzmJO3RvQADEesSfhvqq0ZfuJECxAkPeylufOD4eOAa70D8Ozm
         JLZA==
X-Forwarded-Encrypted: i=1; AJvYcCVwU7hQfDnPCZ7W1mXIvOdh/Kq/9taaVtNdP+NyRpIkHStt0h/KTnxHVAr68YADjSpgytDgkbpG8L3pDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIkJ0jH+sj36CpKWFjKpnyaBjF3HXOzGjJnKfzBFLx3nk3i9B+
	dm1SG12WUFn9Ufu4AsiVuzL4T8T3Kp4DEoCGSQ7dWKRPyuf2L94P
X-Google-Smtp-Source: AGHT+IEjlco9iARxa0bQC4eLe4X9RvrtbLwAsHFCOo4/n8JV2mCJn3xvzg1nlMhFCJCWEVeRqZ3nSA==
X-Received: by 2002:a05:6e02:1c29:b0:3a0:8d60:8ba4 with SMTP id e9e14a558f8ab-3a4ed2e066fmr9182655ab.16.1730355402297;
        Wed, 30 Oct 2024 23:16:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452aa703sm499528a12.27.2024.10.30.23.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:16:41 -0700 (PDT)
Date: Thu, 31 Oct 2024 14:16:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, linus.walleij@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for
 cv1800
Message-ID: <3vgu3mw6eqdbv4lbenihpgfouupspeivfox7qu5upxdzfl5l4y@azhfscgilvfs>
References: <20241029012312.3448287-1-unicornxw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241029012312.3448287-1-unicornxw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_231643_716983_713CCDA7 
X-CRM114-Status: GOOD (  16.43  )
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

On Tue, Oct 29, 2024 at 09:23:12AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
> <dt-bindings/pinctrl/pinctrl-cv1800b.h>.
> 
> Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.")
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> index 1e6a55afe26a..feb4785a3fac 100644
> --- a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
> @@ -58,7 +58,7 @@ patternProperties:
>            pinmux:
>              description: |
>                The list of GPIOs and their mux settings that properties in the
> -              node apply to. This should be set using the GPIOMUX or GPIOMUX2
> +              node apply to. This should be set using the PINMUX or PINMUX2
>                macro.
>  
>            bias-pull-up:
> 
> base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> -- 
> 2.34.1
> 

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
