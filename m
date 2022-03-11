Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A83FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 03:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=lHHaIFJ573g2I7wGd99DtCf7spnbfPMtPQ4k57wAv98=; b=e/I7qN8vPNJHhsNHb+yjwqlMYM
	mm3YklYbuLwgLuBQwX8zG0NInor3svKjOm3KqzbuofWxcS/ubiNgPeqK0sKyswt97beWHv2Y71Cph
	1x/3FdgL3GDAJhzq3eO3t22Tfo3z38pEAXhTOC4wFlfJvrN0yCWPNwWZVW0pVbhzUhGCquDDojcaI
	/X+EO76F73S3+xMI2d9PPC4wFfmGp37RSQTttthJ8UQMPmwoeLy9FTHUga3y8kmRLTgM26QEKLtiV
	WYkjJM+ssBYu+oJpZO1JUHAGRFrip47teguKw2I6RurCtRpwUKA2f6ounCzbDo5K1RMbrgslwfVbW
	GP6Zprnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSVk4-00Erz2-19; Fri, 11 Mar 2022 03:15:00 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSVjr-00Erus-0u
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 03:14:49 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so7021624pju.2
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 19:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=k2icY+6tCwcqgzMbjLM+IMtOMr7cxOX9RXwF/4WbIuE=;
 b=J3JwssbcL91tpuNT7fB9AVcoTviOQtRwAaCe9iUYL5OxfAk9+y02r+gp7oXfhuwg81
 2qZbPheJlEQPpBKKhVsq8mte8hVVChgRP0B6I7mKXu1DYlneO/v/zulCcuhzuQCWcckc
 L3Bx/6f6c2L1qtCazJhLaxvtkk6cBBtphYkOw6XvT14qWlJUwqhXUkaDewhc+9626ynK
 lx2AAuA8aAAciwgkWY4L6PcPkcbaKiX5vnnOH+egphv+Bd/F6euavBUticf6UU2NKLmC
 8b1Mfn5s4sJiuqEGBGI53M5/NTBZ3SHpiiQ1n8bkfqWxmKLWrjwKjYa1Fg9Wx18YfOOr
 vg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=k2icY+6tCwcqgzMbjLM+IMtOMr7cxOX9RXwF/4WbIuE=;
 b=K8/bwaYwxYiElOhXOiKdLiiYaqNMGKzeXh5tXRhYiYZHfs1PpeI9eVs2qQtrs1pTlz
 1hQN1McDpvZyO6bKfWqSuvSZQ13F2jiYcUcM4OXobQ8C6S3XAsYnoP82D+uc4bHFXnet
 L4IgLQsgAExiRbOAsVoO/b+awB8g2i8c7pLJVQvklASoPFHUk6j3xGYpxgN5JgSNrDPR
 HxzxHpVtv39Ddzd9S2jrtuLLVmebBGKfE5ftJ3szeMGhrR2H/nkN4kn04SZRxKM3bxqC
 o0jIysiXG9HeuwJNLMuTnXbwE4sUqEr6SQzS0DKMd1t4CedXuTub/G9TlgFYioQzP18r
 0K6w==
X-Gm-Message-State: AOAM531+D5IL3lmlYRUa1OkLbTroh4drigz7OOeGmKhaN7CismS58af0
 sUgSFe1PKI4coYQ4P9qc9KgaTA==
X-Google-Smtp-Source: ABdhPJy4fvYld+2wi2QVybUrJQ6b31jsGkwcRrlP9HfNyDkH0uCBxKsrzbz1rkxbCv0nElwZJQHYdA==
X-Received: by 2002:a17:902:e94f:b0:14f:1636:c8a8 with SMTP id
 b15-20020a170902e94f00b0014f1636c8a8mr8257065pll.130.1646968485668; 
 Thu, 10 Mar 2022 19:14:45 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 g18-20020a056a000b9200b004f783f5e890sm2149999pfj.156.2022.03.10.19.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 19:14:44 -0800 (PST)
Date: Thu, 10 Mar 2022 19:14:44 -0800 (PST)
X-Google-Original-Date: Thu, 10 Mar 2022 15:52:57 PST (-0800)
Subject: Re: [PATCH 07/15] dt-bindings: pwm: sifive: include generic pwm schema
In-Reply-To: <20220214081605.161394-7-krzysztof.kozlowski@canonical.com>
CC: thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, 
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, mripard@kernel.org,
 wens@csie.org, jernej.skrabec@gmail.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 
 linux-imx@nxp.com, heiko@sntech.de, Paul Walmsley <paul.walmsley@sifive.com>, 
 nobuhiro1.iwamatsu@toshiba.co.jp, p.zabel@pengutronix.de, anson.huang@nxp.com,
 vijayakannan.ayyathurai@intel.com, 
 rtanwar@maxlinear.com, jeff@labundy.com, yash.shah@sifive.com,
 sagar.kadam@sifive.com, vigneshr@ti.com, yoshihiro.shimoda.uh@renesas.com,
 laurent.pinchart+renesas@ideasonboard.com, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@canonical.com
Message-ID: <mhng-7a872d06-a00d-49eb-bf67-68ad634e9985@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_191447_078110_E1469E23 
X-CRM114-Status: GOOD (  15.12  )
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

On Mon, 14 Feb 2022 00:15:57 PST (-0800), krzysztof.kozlowski@canonical.com wrote:
> Include generic pwm.yaml schema, which enforces PWM node naming and
> brings pwm-cells requirement.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-sifive.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> index 84e66913d042..676b2160bada 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
> @@ -22,6 +22,9 @@ description:
>
>    https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
>
> +allOf:
> +  - $ref: pwm.yaml#
> +
>  properties:
>    compatible:
>      items:
> @@ -55,7 +58,6 @@ required:
>    - compatible
>    - reg
>    - clocks
> -  - "#pwm-cells"
>    - interrupts
>
>  additionalProperties: false

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
