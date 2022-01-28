Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BA5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pY93Bn8k66al88k7XUgtwc5AopGZ3CfgP9LxOs7oHeQ=; b=jZEConRc/OeUKi
	RyAXclWFs9XihsCShb2YDJfRbeO45ioPYxhraya7v7pDWPlHXS0mRP6glJ78RZL4EmxSuN3IWV3il
	jyQc93yaAxOv6XyROD+irQOKRJpyH7F6ZYh9U7G7ekxJ4VFbymbxxsybT/j3VCmbmxphPMdRfu0bC
	+CSPsUZJqjSTP90EWRqdmB6YivGZZzgAKofxysqC5PQOT5uBInnKj14cxiACxZ+CsjkCBK0eE4hD9
	PHt5mLM9ku4YMVv7Df9pBwODrWm6Rk0xc6LyrpIeWYnN6K5rLLfC0FTKiY2QyhfU2EV5B9oICLqcd
	q+w7gc24lP09d3S6Ad3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDRRZ-002N6c-5D; Fri, 28 Jan 2022 13:37:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDR7v-002FCy-S4
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 13:17:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id s9so10825757wrb.6
 for <linux-riscv@lists.infradead.org>; Fri, 28 Jan 2022 05:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zRE6cP7pvi+ZI23Vg5Fh1CMwZmc7C8MWpMozO16RBzU=;
 b=8KM029J1OvRaJgPHOipEGOIcRfssg6B2NfpFNu8YWmSFDgkd9wWf+IJ66xVDuR43n3
 2+D8zdvVWoQ82hebXyvz6dirPC7Ek+lXA1x+TlEfAyd6br1C0uwLt1e98xEzEGvyT0fY
 8JTK9LEH9iYiJvTjwAAeNgHzm3M5OKfLZ8gcDzbf4wKVnixs82hUZiBRDTB290dvE7sO
 541MWF+TQExtk9I6p9OjDMGaI4wtmR+HmrGLEI+kq46EU/6Ab3QlK2EJZGdaKwtE7uZE
 KneFJaj7Rh1Ep3zxWxGtuRQ6lXtfDjOIEai6LlotHYT8H8yrtJV5iIH5hCNKlvFtusdT
 9CwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zRE6cP7pvi+ZI23Vg5Fh1CMwZmc7C8MWpMozO16RBzU=;
 b=m4Tsq6eoDfFmBK1APfxhC2zhYdpcwxo/khPeqUFGWFqVU8y2nLMTCrerOZt3O2XT1W
 YfmBMEccP7RmJ2K5k9tWsPOGHTXEmxx3r7f82TULjg7QYHqmq8TPEYLEOui6nf4N16gu
 avKFF5rX3liW74CgFeWbzhEJ29C2C1WN5t+P4pjz1hUYi807UVMKWQ6XJXpIIQzyhFXY
 zXU18vn5iO68n3SdT5HNJsrfDLjZTe2WYdGQw8Qmd4VW/Bj4E23L7EkHJybAZeOkLpzy
 1zPl3fA5mLKDnaCazweOU3s8PnOBBxZVo3dUV5ZKnXaJlqk80AOMsHDbHG78dUcLDCCu
 CGhA==
X-Gm-Message-State: AOAM5311IK2sZmDBg1cswgoekfs4j8KKMt6CUG4r49ZkcY7dt+ReYEtf
 emMK0U0bWg9djWx04SNLOyFF2KEoGm2bF40ag4iHwA==
X-Google-Smtp-Source: ABdhPJx0eAbfLbLIvSsOEMT0A5qjXLBP5J080JzYr7ucrMaAqfFeIyIpQaz8SMiXg4gtlqNBVlVuQi8VmjgUIugP5jw=
X-Received: by 2002:a05:6000:1e0a:: with SMTP id
 bj10mr7007651wrb.313.1643375837116; 
 Fri, 28 Jan 2022 05:17:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643360652.git.geert@linux-m68k.org>
 <62bf4ee6613550c07a99d4bd226ab0d33acae4c4.1643360652.git.geert@linux-m68k.org>
In-Reply-To: <62bf4ee6613550c07a99d4bd226ab0d33acae4c4.1643360652.git.geert@linux-m68k.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Jan 2022 18:47:06 +0530
Message-ID: <CAAhSdy139fUCYdTm=Ge4GhXt2WxnV3ngGHY2RVie4+k1yQnEKQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: timer: sifive,
 clint: Group interrupt tuples
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh+dt@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_051719_996152_BDE2B06B 
X-CRM114-Status: GOOD (  17.30  )
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

On Fri, Jan 28, 2022 at 2:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> To improve human readability and enable automatic validation, the tuples
> in "interrupts-extended" properties should be grouped using angle
> brackets.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> v4:
>   - Add Reviewed-by (this time for real ;-),
>
> v3:
>   - Add Reviewed-by,
>
> v2:
>   - Split in two patches.
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index fe4b73c3f269fc0f..e64f46339079fa3f 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -57,10 +57,10 @@ examples:
>    - |
>      timer@2000000 {
>        compatible = "sifive,fu540-c000-clint", "sifive,clint0";
> -      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> -                             &cpu2intc 3 &cpu2intc 7
> -                             &cpu3intc 3 &cpu3intc 7
> -                             &cpu4intc 3 &cpu4intc 7>;
> +      interrupts-extended = <&cpu1intc 3>, <&cpu1intc 7>,
> +                            <&cpu2intc 3>, <&cpu2intc 7>,
> +                            <&cpu3intc 3>, <&cpu3intc 7>,
> +                            <&cpu4intc 3>, <&cpu4intc 7>;
>         reg = <0x2000000 0x10000>;
>      };
>  ...
> --
> 2.25.1
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
