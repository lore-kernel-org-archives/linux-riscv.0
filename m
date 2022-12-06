Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675ECC352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYjxsTZQNjBZt0LdmsyEX67ZrDmNRSYV7VCszRhILps=; b=Q2c1RrHNxXEgRs
	MyKH2FAzzfcGTXG7mXbWKgBFLqI8wK4YoDHKKIFKTF/JzllU5zKLe/JmMx84kHraJotPCSgAQSdy3
	jLINvDIMxpOSb85xr0H1OEy17BdMI0gTtY7ZkzwBh5TojzweFdHPA0ZCsJ8kbG8/5aiImDh5oDW8m
	dwgAp2gDkJoFFDOSjxC/Y+CMTzZaMkFueEGNG1g8vyWF1G6RJLRu1JobX0c01AnFTAAtrMw4t65yv
	ul5Vv03qxQSMRVVTG1cvwXbxvXaE6vuGghf0IO3KcCdVpa+uA5Vj6r9InSzDvD2g1cA01oQkb5VSV
	Qb3OTpkXEr0Ls4Z9mUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XfO-009WgP-UF; Tue, 06 Dec 2022 13:07:22 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2XfH-009Wal-0R
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 13:07:20 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1443a16b71cso13807539fac.13
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 05:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imUdSZL1p1VPSoRbaTGeAWYoJrWVTzc2KiZUbiVlSk0=;
        b=MpxAn4xIH04MLkPWrxWDh2NJn56vu1rNsrYrMSTJX9+RtgvP/wyKN7Vg61zn2OcM0U
         KXJaSBnH7uAdLv8lqqVBqi08jXD0XJWP/opESLhxOvVOGPSaxUUV4QX9nHI31W5DIFmb
         tA6F7y5afasr8kiiXLCb9n31HzVobvXtzQQBjvq5x1X+paILY9U1VMwBZcnnff7SMQPG
         ERWtK9HTOOgW7QqI31KI3DVba3So22h6jxfN2n7aaWvCif/4gGKC1vK8x81GZtOze1rM
         baOC3/mIBXYur3IGgT6LbURZY4aR/8v/wEFLn6R+qltMmfsbiIszd2+beUjM+mQolS2o
         2J6w==
X-Gm-Message-State: ANoB5plV55agaBnHgdfjBVGhhMYly4csRG1vNA9Z1IAJzj+uWVANPSSP
	y2eHX1dDgfa6VnsSjnlqEg==
X-Google-Smtp-Source: AA0mqf5z9DjerkdA2yTFa+vGGSfpZNB+NnpP2vdElYLYU29uLcQ9+ZkV9VlhJCcZpEAQoIs77c/cIA==
X-Received: by 2002:a05:6870:828e:b0:144:9477:9f56 with SMTP id q14-20020a056870828e00b0014494779f56mr5147179oae.226.1670332031196;
        Tue, 06 Dec 2022 05:07:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s5-20020a05683004c500b0066d2fc495a4sm9098255otd.48.2022.12.06.05.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 05:07:10 -0800 (PST)
Received: (nullmailer pid 232720 invoked by uid 1000);
	Tue, 06 Dec 2022 13:07:10 -0000
Date: Tue, 6 Dec 2022 07:07:10 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jessica Clarke <jrtc27@jrtc27.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: riscv: fix single letter canonical
 order
Message-ID: <167033202949.232654.4467238719152703044.robh@kernel.org>
References: <20221205174459.60195-1-conor@kernel.org>
 <20221205174459.60195-3-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205174459.60195-3-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_050715_086763_AC98D90C 
X-CRM114-Status: GOOD (  12.17  )
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


On Mon, 05 Dec 2022 17:45:00 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> I used the wikipedia table for ordering extensions when updating the
> pattern here in commit 299824e68bd0 ("dt-bindings: riscv: add new
> riscv,isa strings for emulators").
> 
> Unfortunately that table did not match canonical order, as defined by
> the RISC-V ISA Manual, which defines extension ordering in (what is
> currently) Table 41, "Standard ISA extension names". Fix things up by
> re-sorting v (vector) and adding p (packed-simd) & j (dynamic
> languages). The e (reduced integer) and g (general) extensions are still
> intentionally left out.
> 
> Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
> Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
> Acked-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
