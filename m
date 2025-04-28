Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140CDC369D5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xt24tR2+qiIrMXVvSZfYsurkjWkBTdwAAlcJQp6nwdw=; b=s5Qru5yc+pvrk6
	IU87crgNogmWH2ideCAxXBTRpOxQ2wwYINbfyALtWB5jybBlW1kt8FUBMSBncZcrG4MkrskFcDIUw
	shR6f5X2s2rBKwjpgdqzZIi26EVXCW7PsZnak17LyxKP88REMajQKjfyI5B75cTMv6oXsHml0wzxC
	8GLKbHfY85H+DKtuYvwQ8/T41OOsWfzNl0jiE9YwUuf8o20LIdseAiCGGLZ3z/Nsk7+JVfHniveVk
	Z6XH7lSZL7akkmPds6p6HNYdDP3ucJijNF+NcoehQz3qoec8sI0I/nu8pNEt54YC4e8hI91+kQNkt
	SV6NxNYxlG/t+xrq8MvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9REi-00000006u6V-3WjJ;
	Mon, 28 Apr 2025 16:21:40 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9REg-00000006u4z-0syE
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 16:21:39 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e7329792c6eso1600731276.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745857297; x=1746462097; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WOhasKd6micKEiWT/MKXPBW1f7I1/Q2+vdBpOz089cI=;
        b=APwiAcayq3A1cZjMhu8ZVuYmL3ygKXZ2Jol+NlDmW2HfKISiIx6/v1B2/fCEEdx8vR
         s+6vY3IcNkbGzclgGORbSlgKpZv+Ry0F83LUTatYs6be3cfLWFQtuf+cgERFS/7OoGGV
         7Ggph6vT8x9cXLDKAA2l82f9mBwQO2xJXlnKtXFsORNjhTeqP3pATN/5uAT7KgfyEV8V
         azEtSPhgKbm8e4V1x9WB7ZaoNzzLjdacrsjhvIgvytjTxwNE0uy+OTl+3EXHSr5CRV//
         COS4FNCab/Nq+ih45R0u6QVhM0u0vnMiq/A9R1B488mkXIMevFiCJXlZIQbFRFK0qzmy
         7j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857297; x=1746462097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOhasKd6micKEiWT/MKXPBW1f7I1/Q2+vdBpOz089cI=;
        b=au6YBEANZVhyDg8HnuoDMVeYC48nMp9IGHAED1wdhkvH/yGWbKg+zCZd0yBoJj4/vW
         ihTCr4rt5a3RrUHyzjZ5YaJdi3X/BugvNqXk1Vslepm28WlagrD5bqWZmGiRHI8U6pyy
         PiP5O/FQ9OZ9ZBvUlA8jvrDjqAkLmwozsRyJQWvnTsSOe53wItz7FtfE9wHiDUvk3uWF
         duaW5lnK8G7Tnr8gGW5leNEq/7WfL7Hh92lytRMKX0ZLzAhxwJwr1vVzbc5L8WwD3ul4
         NzDj6JjKRQBwCoCh/+cV5jHuTCCNiszqpbphXVe7hEFo64eLlt6AxprVSTiKMrcqFqlh
         de7A==
X-Forwarded-Encrypted: i=1; AJvYcCXTxV7zfsFpOPpdy/E1jOhOiMKWusMenRhUukt6NoE1shljCyVSQExs2sL138NWg/0ggHui1G4LKHigIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw+7bN90jr4K8GlK2GsvhvD/rcn8cMoJmruAdQbVP0mSTI20If
	zfJ6g5IlE6m11jUVIiB6mJWqKWC0S5voxc/7rhKoN3452zRzBkRanGKh6DKfqC1Cl8vJoTMDZH9
	phnl70J0P2ZmgoezFYsAj4Ys1ROgQ/D+rJ2DkGw==
X-Gm-Gg: ASbGnctQpi5C8XWzd2wH5zacMaMi4uKrY0XGZr80UpyPKjz0ZOv2E4ozrXZ9u+Tngg2
	XiCj2gavORj8oT3U31BuCv6WmhV/xRJ4zXnIwCcm5IqDjkHBqtFZmrmgTE0pQocmyQJRc5vzwPH
	n29/p8yvw5eFPxnmyGzYJi+ss=
X-Google-Smtp-Source: AGHT+IF2+lLJogWYmJ9CklQNKtsYDG7mA++udTlmO/sYgtKfw1zcHF/zNyAnw+6seYbb5sOJx4PEl6rhupOOr/4EHRU=
X-Received: by 2002:a05:6902:15c1:b0:e6d:f0a6:4cd7 with SMTP id
 3f1490d57ef6-e7322febd09mr12474369276.0.1745857297087; Mon, 28 Apr 2025
 09:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250413223507.46480-1-inochiama@gmail.com> <20250413223507.46480-8-inochiama@gmail.com>
In-Reply-To: <20250413223507.46480-8-inochiama@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 18:21:01 +0200
X-Gm-Features: ATxdqUHo5zpHgBeVnQwujIcWP56iQkcuhTXqhu8H3yGRlHLlrSHxM1LpwpFg6CU
Message-ID: <CAPDyKFrM32TVAHzSoMvmO_ZW2Ax=RQmH_7KqSGgqXTOc20UnLA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_092138_251213_CBF45F62 
X-CRM114-Status: GOOD (  13.66  )
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

On Mon, 14 Apr 2025 at 00:36, Inochi Amaoto <inochiama@gmail.com> wrote:
>
> The sdhci IP of SG2044 is similar to it of SG2042. They
> share the same clock and controller configuration.
>
> Add compatible string for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index e6e604072d3c..5fb347167004 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -19,6 +19,9 @@ properties:
>                - rockchip,rk3562-dwcmshc
>                - rockchip,rk3576-dwcmshc
>            - const: rockchip,rk3588-dwcmshc
> +      - items:
> +          - const: sophgo,sg2044-dwcmshc
> +          - const: sophgo,sg2042-dwcmshc
>        - enum:
>            - rockchip,rk3568-dwcmshc
>            - rockchip,rk3588-dwcmshc
> --
> 2.49.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
