Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697D0CCD185
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 01:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1s+z4QJ3VifLGosH2xXJt9Ds5ZkogasuBE0HWPsODk=; b=yfutSp9IR4WP2G
	1KqQt/Anh8ut7BwW71/LZJpIKyzhPfSSIsODfNO8ijoDMaB+yG4H2jGZiy3qX2y9jWEd8+LV3UohC
	h6RJZf4gsv4CfRY1OEqnoC7c2hJEvGqX4vlkvtMpsYHS3vWodXcy0+efE2jlhP9aoUdSQj2+tENcy
	bpHq6zOrT5Ayk+/r3r6ziBQSTBYNHhetNhYsU6a8NBp86wVn/h9wIc65CD36XZeVLUfvtbVwYhyPe
	RycJrfumk97yvJtM56LTBmm+snOU7OqFkf12oGoH7xMI+OqmmBNy2aXopgaRiezS78D89f0JwMHmC
	UZYoO9IojE8pLDOpmx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Oln-00000009ftE-2cr5;
	Sat, 11 Oct 2025 01:51:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Olk-00000009fss-2TWW
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 01:51:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2697899a202so25621605ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 18:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147495; x=1760752295; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=teUHmj8fooMBhuzCTm7slxnW8DwXWVkNHJT/VXMMwXk=;
        b=Wce3I8kzJQRvCxC7BT83KNEXf7y88Gp41vbedWF590Oeq7B8o+nJ8GwCK8AvW2AEXj
         zHfD6rZly9oHXxJAcPb9J+ujhWJX6kmDd+iTb509wvQKAzozd983dxcZ7qilb5gfrOk9
         XFFJakjyfylY44CGL12BWJ8dWT2X3cnIIBl1bQKvSoXHQnX/5wcgyWb9tlFGZu+wBKv8
         2LCQ6Wof18WBmyLlHb8mXQSdip8WSDunf2ztf5LusrxWTCSZ63JJwCMZfTMyc+7pjoCJ
         BGTvnVWZ9DRd8Mbw6cjAd+Ep+s1rbDS24tZxnWaBAT7A6I2nrbeKQYzqgZDGOHcp9CxU
         57Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147495; x=1760752295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teUHmj8fooMBhuzCTm7slxnW8DwXWVkNHJT/VXMMwXk=;
        b=ZdYiBAl1ZT9LMUjv0me8by/lqVoLm/pBkgCHX+/BmGSvtj6Jw5gNVHbO1ICIdeiSzP
         D845IcuS9Y0mLpG18oyHGNrWm4DFiSvmmpG6/1KjDUKWv+9OKpzpCL1CqKYDoFtG0KGl
         lbp5a8EQ/k33R4qGfPv2Wk3cQ2n32637pk7IRWfZBDAjVnd/dOB/Ipi3f2cfyAe/lwZx
         HzmY+Yn9tRkH3+ZFZGEs9zGeYD+KtC7pwx114eeg63yOROafdv4/0Zj1CuziZKk3VmYI
         JXMbk4y2S1fmzhefw3VLG8dHeZCZd9YkIWCBIEcehdAHyoO4z3Ddvd2XXGbH0Vb1wjPm
         P93Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx6IVm9owAgDUJqueIJmEsi3o+Hkb+TnDIYCY8S0Vyo9slK/0B1qkk9xC39pmeyPp6vXigZ+yXtAlvIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFLinoANe3WgCtgLgqjoxE319GFkNsMaemTnmDuFdYBq/4fwGK
	Sroi4U1+avkjwffwMItIFEyFgQ6T4xnw83evNpHTh26oMbTX6pbFtFYW
X-Gm-Gg: ASbGncuxUnnOwflzY+J82odBBRHWUYxYxkqcKhTOwEZi+q8/GFcekf2QklpHZsYNS49
	vuHRkF1cMU53bEfTXXEpIEsJg8kdW5WgEoDJZOQ7aR+SFYbahiSjv140SO+cq/lOtk5w53jIDiU
	mlZCuV3WhoUJzM9CpA04GxoP/NbwmPl1DH5C88Mrccn+e5jKUYnWUIsaQkQWk8A7kuAZRu516ZS
	9cLiyyudKXbT/DrBwTYU5Vy2iYt72wauYeLV8zaKYguZxCRgBwfL//i8nZ2ovc9xd1YtHy1grpy
	qZbt1Qg8iPqNYfpJYEiJGsrDvsYm5IVbo2FRSbvhRGhDvp311njB0Ic8I2P/mTzeGj/e9NABZsA
	72YQJepRd9hGRFTmcsXpwMhYlBo1Ki774IKlNGxUM
X-Google-Smtp-Source: AGHT+IE3K6gFip9wxGITzlqymiDh7UAUD0eWbAaJZOHiLQbKOsh6fbE3Epzbc5CedugnlKFm2bUpCg==
X-Received: by 2002:a17:903:2f4b:b0:271:bd13:7e73 with SMTP id d9443c01a7336-28ec9c97605mr196969385ad.19.1760147495504;
        Fri, 10 Oct 2025 18:51:35 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034f362efsm69922305ad.89.2025.10.10.18.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:51:35 -0700 (PDT)
Date: Sat, 11 Oct 2025 09:50:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <fdysolp3ogf4ra2kpr565xtkwspk3yqj6ydbkxl67wi7fviabp@x4owynopb6s4>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-2-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251011014811.28521-2-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_185136_653426_315C4F95 
X-CRM114-Status: GOOD (  12.55  )
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

On Fri, Oct 10, 2025 at 09:48:09PM -0400, Joshua Milas wrote:
> Document the compatible strings for the Milk-V Duo S board [1]
> which uses the SOPHGO SG2000 SoC [2] on the ARM64 side. The RISCV
> side uses the SOPHGO CV1812h [3].
> 
> Link: https://milkv.io/duo-s [1]
> Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]
> Link: https://www.sophgo.com/sophon-u/product/introduce/cv181xh.html [3]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> index 1c502618de51..63773811b80f 100644
> --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> @@ -25,12 +25,17 @@ properties:
>        - items:
>            - enum:
>                - sophgo,huashan-pi
> +              - milkv,duo-s

Why? I know no duo S board use cv1812h.

>            - const: sophgo,cv1812h
>        - items:
>            - enum:
>                - milkv,duo-module-01-evb
>            - const: milkv,duo-module-01
>            - const: sophgo,sg2000
> +      - items:
> +          - enum:
> +              - milkv,duo-s
> +          - const: sophgo,sg2000
>        - items:
>            - enum:
>                - sipeed,licheerv-nano-b
> -- 
> 2.51.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
