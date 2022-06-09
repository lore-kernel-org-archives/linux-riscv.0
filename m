Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1952C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sL8BBIyR3RSX1MtLVwSJB7c3g41Lw8oRYJW4UfV8js=; b=QfrDm4nDL2nNjS
	De685zvPJ+CYet9YHa2PrRVFxFG4pyl0Uft1GDiZIIuzdmfxKbD1q0mGTIcopmoWO6iEOI9mkF8rp
	gF0dvDxNQmOlBeiRSRmpkfT7s5DQlWx58xMCWSQTjFLB2K77eTw1v/fx+UzQd9Z4EdnhjPvoBWUQT
	9xp7EwxsytZgYQvWijgCUljqhvNBOit5X+efocYljsFyUSI190Os5MmE9Nr2urva3euMpMY0Te0kI
	gPvHZdaKg/+WGr/++lxpo8y4v6GxNeTApENPEphQALyhJwfhVAeScMNyQkYQ8oPH0p1ppJoAuzmvm
	PEcAht1Inq02hXOT5oaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJly-002eWq-Ch; Thu, 09 Jun 2022 15:08:34 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJlu-002eVn-3V
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 15:08:32 +0000
Received: by mail-io1-f45.google.com with SMTP id q11so448588iod.8
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 08:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nAv69gpcPWI9Low0xHefIateOKeB8tVbI9fswYi40nM=;
        b=6G0e3yITV52iWawlPhAejvO9dm7FPBPcLFI5K9tWSG9JtkcB9L89cNehPU7dS5CUfx
         9UnjMBZ+ApPrBGr5NtbyLSOVHtCmtdtPebyC7uy7JpX1qooaye6dNpS7oK845oB6MDWM
         Wo22GeFImqqPiqf6V7+FjKEQ6ADn9NfNpfiPYlN7FF/nLv4Biq8Gh+4DDkYrnuvI8UxY
         5COMpx2RH6Yaqyt7PUR7GhpBNRX8Yp9CTBvPPM7x1ZxcEZMSwzpRIjBG77zPw2GgSW97
         3wYa7R8vSXDfaMhTZ/Jvarj2BrJWj5jxyeUDfj0h6jEUNQ406bgb2bS2fb1REOSHEHJa
         f6Xw==
X-Gm-Message-State: AOAM530Ly8ZVUs1UEzCUzFYC0QQRO76dwQBe1p26FoNzML7GnX1c057W
	LVHVDjWa0oYx1adQf9LMDw==
X-Google-Smtp-Source: ABdhPJw/GiO2Y1Nfl+vdnO3TJaRJzKOYQd9vP5AIMiesXHagezYV5WnL5NCT3JUuEpT4Qe4UHq/VPA==
X-Received: by 2002:a05:6638:16cf:b0:332:2bc:b7d5 with SMTP id g15-20020a05663816cf00b0033202bcb7d5mr1401791jat.172.1654787307750;
        Thu, 09 Jun 2022 08:08:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y10-20020a02354a000000b00331f48289easm2031970jae.136.2022.06.09.08.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:08:27 -0700 (PDT)
Received: (nullmailer pid 3800045 invoked by uid 1000);
	Thu, 09 Jun 2022 15:08:25 -0000
Date: Thu, 9 Jun 2022 09:08:25 -0600
From: Rob Herring <robh@kernel.org>
To: Atul Khare <atulkhare@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <Conor.Dooley@microchip.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sifive: add cache-set value of 2048
Message-ID: <20220609150825.GA3783956-robh@kernel.org>
References: <CABMhjYq8WbHcA=8dRxHVy=-NhL3+GaRKsBb3X2bG2-6Azd2S1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABMhjYq8WbHcA=8dRxHVy=-NhL3+GaRKsBb3X2bG2-6Azd2S1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_080830_181092_B21DCD14 
X-CRM114-Status: GOOD (  22.39  )
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

On Wed, Jun 08, 2022 at 04:39:31PM -0700, Atul Khare wrote:
> Fixes Running device tree schema validation error messages like
> '... cache-sets:0:0: 1024 was expected'.
> 
> The existing bindings had a single enumerated value of 1024, which
> trips up the dt-schema checks. The ISA permits any arbitrary power
> of two for the cache-sets value, but we decided to add the single
> additional value of 2048 because we couldn't spot an obvious way
> to express the constraint in the schema.

There is not any way to express power of 2, so you have to list values. 
Rather than just adding 1 more value, I would add at least a few more so 
we're not adding these one by one. This is for a specific cache 
implementation, so it can't really be *any* power of 2. Designs have 
some limits or physics does.

> 
> Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
> ---
> Changes since v1 [1]: Rebased on latest version

What version is that because this did not apply to v5.19-rc1 for some 
reason.

> [1]: https://tinyurl.com/yvdvmsjd
> ---
> ---
>  Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index e2d330bd4608..309517b78e84 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -46,7 +46,9 @@ properties:
>      const: 2
> 
>    cache-sets:
> -    const: 1024
> +    # Note: Technically this can be any power of 2, but we didn't see
> an obvious way
> +    # to express the constraint in Yaml
> +    enum: [1024, 2048]
> 
>    cache-size:
>      const: 2097152

Surely this is not fixed either?

> --
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
