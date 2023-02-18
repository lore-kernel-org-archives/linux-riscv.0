Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188F7C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 18:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RgmXiO4XetS5ieXYLKHJUbBJvGRLVEBNpBI0bkCjIAI=; b=ilkPX5DBgmZqJZIX+v5w79kuyI
	vt6SDiTqboPuJ3pN9ZeAyiyPxbfFBFfw3y+Zdm/JxChNZPPkLZrFCBR4yAR7NeveFjrRLWLs3wKOx
	OG46tpTonqQyd7iXk4Z0kv4uF0y1uZSOzTSA53MJgY3c9N1TT5f82Mf30KLrOiu5IKvObDISGN7EL
	I2B6DTB5Q+xm0wG3dyzXwyqyXg8bsAxsUNTxe3GcRMBQ4nQEq3flGbkVkLrEGM94IG0rKHYHDHBlt
	w3DsuSOQokpFoZGxezEIQo8/8jCBU3AACcCm2cIcD6B3gY1NpWXXNZITKztv3qWsIiYsd+5kEZ4Fy
	m/9NtrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTS1o-00HS44-4s; Sat, 18 Feb 2023 18:33:44 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTS1i-00HS2d-7d
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 18:33:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id w9-20020a17090a028900b00236679bc70cso1934231pja.4
        for <linux-riscv@lists.infradead.org>; Sat, 18 Feb 2023 10:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdSlOABUXDOnyk+meHLPkKnSRDvSQB5azUWlVg5K0Ws=;
        b=WR4G9LwTNYw3FsVROmx2f2szhqt+aMI/Fh0pXJqQjv95Cg9jGxtYHlWhp1CYy2rS3O
         S++5vWov8xo0SYE1crAyxDqHnolbaCMzpWTVH9JIE/b0jkC7U73XIsWrzedZp43x8kLu
         Y8Tho4N0wwsSRVAl3b+ejPhqzUDMYRAI7hVrDSHr8HGSIXQjH1m5/0iy3L5dWT1JcBqq
         ypQQpO0zdqMOc1YDmP6qjFphv8031UpYLwBQAry59Oms6Xn6SYF5VFbwx+lk/p+Ag93P
         W4Myo/pt8q8LFBMTIXGHgRIzCCi384i19yboiyWhCBJhg4LbCRTa7iK9v281/DfDX18A
         3Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdSlOABUXDOnyk+meHLPkKnSRDvSQB5azUWlVg5K0Ws=;
        b=FxgGEA7GSKlouEHWRPR1g7qcsqeK6PPubHCeLlCA5IWhwW6R024bQir5gZ/LHvJBHT
         Dy+Qz00gFlMFVdJsxQ35hOrG/UBsoijZpjxGvOJqnoxbdmqFjiDfC3UOyc/FiKuk+mFR
         SqHU8lgKYJze3rhGGg6UA8zgjFvd3nXRtbC0a9FqiL9U5JW5qw7Jfs73z/a1dN96ibNf
         hrPlgdFc+C+tuzVZvwp04NW3FDgeEewmhU14NRcuOHTb8XrHTWZnBp4H6jNJ4CaIeWlr
         0IsnrSTM1Tn75xAQV9IahNBfQA7upymBTSmo3liyxjFdlCUNymFmHc8hxOxtoa67xW1U
         kQHw==
X-Gm-Message-State: AO0yUKXW7WLum+bcqe5/inHwlsXImLsLCpuy/hScwvrviuFc+Gj2av+R
	1O10SqVxocmhw1cJEFLVMh3GuQ==
X-Google-Smtp-Source: AK7set8mks9ATRjJPpov69mSHOUoLOQ6En2xElAg1qfskRkaUzRjvcvpky66JqrPGHFAvJ/KAvpztg==
X-Received: by 2002:a17:902:f544:b0:196:6577:5a96 with SMTP id h4-20020a170902f54400b0019665775a96mr470313plf.30.1676745215107;
        Sat, 18 Feb 2023 10:33:35 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902b28400b00199481ac72fsm4939269plr.225.2023.02.18.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 10:33:34 -0800 (PST)
Date: Sat, 18 Feb 2023 10:33:34 -0800 (PST)
X-Google-Original-Date: Sat, 18 Feb 2023 10:32:53 PST (-0800)
Subject: Re: [PATCH] dt-bindings: drop Sagar Kadam from SiFive binding maintainership
In-Reply-To: <20230217180035.39658-1-conor@kernel.org>
CC: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, mturquette@baylibre.com, sboyd@kernel.org,
  tglx@linutronix.de, Marc Zyngier <maz@kernel.org>, thierry.reding@gmail.com,
  u.kleine-koenig@pengutronix.de, aou@eecs.berkeley.edu, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, sagar.kadam@openfive.com, sagar.kadam@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-5af14e38-3a1b-480b-be9f-922acbcad914@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_103338_319624_F3952332 
X-CRM114-Status: GOOD (  17.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 17 Feb 2023 10:00:36 PST (-0800), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Sagar's email listed in maintainers is bouncing as his division was sold
> off by the company. I attempted to contact him some days ago on what the
> bounce email told me was his new contact information, but am yet to
> receive a response.
>
> Paul and Palmer are listed on each of the bindings, both of whom were
> alive & well as of Wednesday so the bindings remain maintained.
>
> CC: Sagar Kadam <sagar.kadam@openfive.com>
> CC: Sagar Kadam <sagar.kadam@sifive.com>
> Link: https://lore.kernel.org/all/785425ca-4000-a7e4-16d6-4d68c91b158d@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Palmer/Paul, as mentioned Wednesday, here you go!

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

> ---
>  Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml | 1 -
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml       | 1 -
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml          | 1 -
>  Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml    | 3 +--
>  4 files changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> index c3be1b600007..c79e752283aa 100644
> --- a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.yaml
> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive FU540 Power Reset Clock Interrupt Controller (PRCI)
>
>  maintainers:
> -  - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley  <paul.walmsley@sifive.com>
>
>  description:
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 99e01f4d0a69..63bc89e13480 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -45,7 +45,6 @@ description:
>    from S-mode. So add thead,c900-plic to distinguish them.
>
>  maintainers:
> -  - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley  <paul.walmsley@sifive.com>
>    - Palmer Dabbelt <palmer@dabbelt.com>
>
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> index 605c1766dba8..bae993128981 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive PWM controller
>
>  maintainers:
> -  - Sagar Kadam <sagar.kadam@sifive.com>
>    - Paul Walmsley <paul.walmsley@sifive.com>
>
>  description:
> diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> index bf3f07421f7e..0551a0d1b3df 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> @@ -8,8 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: SiFive Composable Cache Controller
>
>  maintainers:
> -  - Sagar Kadam <sagar.kadam@sifive.com>
> -  - Paul Walmsley  <paul.walmsley@sifive.com>
> +  - Paul Walmsley <paul.walmsley@sifive.com>
>
>  description:
>    The SiFive Composable Cache Controller is used to provide access to fast copies

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
