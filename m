Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D951EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbtpba+4YCMDEc4NHUlW7NrZNGEgXhSR1e6ZRZsDM5E=; b=S8PZIEwxOWVUz7
	34QBonKRjrw2tXiFauq6FODW8MSCHqdSh2ScRyUTEcw/aIn/8ZiEdx78r0iu1thw6syJQZeZU3Uar
	QD8IHHwl4BZJWvEie3jdFM+XwnUpc4YEIzld/99X2BefR8nQDh/xdysuzZXXay3kIhFb/mVPe4L5L
	mzv5TRwx9H20Y8vvOHdZaeVzo02TteVp28WMkJz+HuxPMJ8UdfH7YoPmJjyek4hzzpwsfvKgVN76S
	RIb56zEgZ3kqJLPvIP5t3o+0TgBUF4/qq3R6NlpJu8CxdmrEKyfWgzsq3JL3ZhDwX6tIMQVzXlkJd
	HEq8uM5fwfBdaQTS6awA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCfT-00AE0D-1k; Fri, 17 Dec 2021 12:48:59 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCfP-00ADxE-PZ
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 12:48:57 +0000
Received: by mail-wr1-x42c.google.com with SMTP id a9so3815621wrr.8
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 04:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=snUeSCccdhoRxlfsg8Ts9j6VNOw1G6e55Lk+9WKqlyc=;
 b=VrmeN3wpi1gNrML4Do0CYOVryw5xkN4me97Ek7NhAj7E67onCecFOZV06lH2uNNoJ0
 YR5aTAScn+MqHEktNhQIouNZlSvvsSqlSYK5pSwn8ZCcOfFGQXYPYLSNyVpWYH2ymQrB
 2/qLQ5fz8zm9gKd9baYQ2q+5P0Qc+27cwpVt1UayVc8QE1JtQhIVPcXFDxT5a1Mg3OXy
 hupJvCEkFLVmuspWM2kMimCBqqJ+XCEPm+jiE3o2oOqxeeZZELizJuZJIoiaxKgrMqsV
 yWiWsLt+2WpKUJlE59KZU1/7iNyhKk7B5XFEwrxms8hnaYVQ8erxC3etPvF7V8Qf5rOd
 9Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=snUeSCccdhoRxlfsg8Ts9j6VNOw1G6e55Lk+9WKqlyc=;
 b=B/Lp1SOnjNgPsS2Gent2lBBfpXzPszRkOrhOd5zdkilFcauT4zF4d8KB5p9PbM2dYB
 IFPlaAEVYflt3vfaeiDIIgPsT/4rV74yzWKtXamsjR6OU0Yf+OopsQcB7eGGIYZxM2Vu
 Q0HlQRHLaiz7jR0pBqQxI+AnBTVqvX5VaInjkKjvcZsd0SxkYK0ykUtdIMxhaIc9sdkv
 vZ9gK+Qbw9l+xoTsbI0ewrI8znKPwEVHVk58R8bbJijdu1ZUGYq+eqoY8nJxOMrMyyJK
 fIiEnpraYZrSMSRRBC+s/RGRn8t//8bAo3FI4ZBjHpa0OMnQ/lLUFLzcpSyf1m0rGDty
 pDkg==
X-Gm-Message-State: AOAM531vYAj6rSVHNXvMse1uZ/cbtNB8XqIXBJGBRMCXDiFQB7c1bcTp
 gd3QBnO0wDYTpL9uyROtYHBo5MTgjpDJ/YvcwcHxFw==
X-Google-Smtp-Source: ABdhPJy6jZjbGiy24EK1rrImb8JGalcQGHnt5zFcmV3cEzqNUYKetq2K2+tqD4tnFwJzeYSapqKjLx5IuF9v9+BKmaA=
X-Received: by 2002:adf:efd0:: with SMTP id i16mr2505380wrp.86.1639745333595; 
 Fri, 17 Dec 2021 04:48:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639744468.git.geert@linux-m68k.org>
 <4f409ac939e260a4657a0e6e6518ef8736527822.1639744468.git.geert@linux-m68k.org>
In-Reply-To: <4f409ac939e260a4657a0e6e6518ef8736527822.1639744468.git.geert@linux-m68k.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Dec 2021 18:18:42 +0530
Message-ID: <CAAhSdy3g9WsBmQk7KOgdVNSw9qUouxF2i==q9M3WQq3iabXv7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: sifive,
 clint: Fix number of interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh+dt@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_044855_879802_C3216ACC 
X-CRM114-Status: GOOD (  19.05  )
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

On Fri, Dec 17, 2021 at 6:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The number of interrupts lacks an upper bound, thus assuming one,
> causing properly grouped "interrupts-extended" properties to be flagged
> as an error by "make dtbs_check".
>
> Fix this by adding the missing "maxItems".  As the architectural maximum
> is 4095 interrupts, using that as the limit would be unpractical.  Hence
> limit it to 10 interrupts (two interrupts for a system management core,
> and two interrupts per core for other cores).  This should be sufficient
> for now, and the limit can always be increased when the need arises.

Same comment as the PLIC DT binding patch.

The "maxItems" should represent CLINT spec constraints so
please don't add any synthetic value here.

Regards,
Anup



>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v3:
>   - Add Acked-by,
>
> v2:
>   - Split in two patches,
>   - Improve patch description and document limit rationale.
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index 8d5f4687add9e81e..b75fd6f982b1ecb3 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -44,6 +44,7 @@ properties:
>
>    interrupts-extended:
>      minItems: 1
> +    maxItems: 10
>
>  additionalProperties: false
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
