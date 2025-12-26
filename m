Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5209E8FDB9
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 21:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ByeWX6AC7P++C4eHPS1IjE/EF+FAT7QHc4ZagAtxO0=; b=E9nW7CNM5kGBiu
	J9w9S413808ZBew/Z3Dd1QC+pB3/LqJK5eqn4sJJG+APbkW6TYjRSlFfT8ER/0F7kpe0G4LtMC3+c
	pS5dJ27fZWAVSMUhr1rThg0OwChW2jlBmu8HgUKaLScqUJ55LMc3aZt3yVYFbGQz6tRLWXLnhEYVz
	xe6tzjiOuoWahD9gHUfxzqkwDH5A+RxxgEsjSGIbuVF6MOYZmTaLblr0XNpPy+KadjgPSxSGpTGNj
	Zi76NISdfo+tcC8tToFyEbFxzBj2GLDBWraebHGZ7OBuhpRcKGzFiCmqtBjFxJRWM6vleubgMHU43
	U0jtqLQkPPaIS2zdrh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMl-00000001TzV-0qr5;
	Fri, 26 Dec 2025 21:28:55 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMi-00000001Txj-252q
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 21:28:53 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8bc53dae8c2so1141795185a.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Dec 2025 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766784531; x=1767389331; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nntctK0gEdJs8MBuE2OMh+NNa2bU4c08j9CTg1079CE=;
        b=jIU/K1lL+lZQ7d7Pfka5q1xGM7AVipHMpzbv1FOL5xV7iFTRkGaH/AdiABiByQi/2h
         UiRraox5bTEx5f5QbZekS6gzxj60naAVcDadnJxvCnEKQErBRqMmvOTajPPvgjkXBKJt
         +Lu9y3rRf8ElGnxUBI4Wuvlu8kJ/wNfiT6nAOyLa0KaxY0h+n5TmwgVt3XmVA5kdTMAa
         0med266jz6WOEhU6nSYiotWCGjdSYk+mWhP/kjuPm1YxM4/Vm07upaI/950lWPGIFHHc
         OIghi2hXOaxu3rzCj3UhbUktAa3cTWverb7ezevvgKDKItJUVYhQYicEJSAxR40Vp3Sk
         viEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784531; x=1767389331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nntctK0gEdJs8MBuE2OMh+NNa2bU4c08j9CTg1079CE=;
        b=QvzRXPkR1Iwy6oIMnVksnA9KB5LXl88UvJMcsWMaEvkljsrPZhiHNfmRaUdBYJ0f1A
         y2Ghdk2pPtiM13vRVWIxlzRe7apFQTFmFWret7abBG6tIa489SL/tAMQWAYjoCloyIyx
         HqfjYeq60TEUe8IUbdlFeTnukkQieFhOZ15caQulFhXIibJEJBk6GEH09OBofNn7Yl/i
         xCskdCTR9EPVtMszj6THEafzwZEMFynA9O+YpRleH8bkRsXqRHTYUMDhprqlsrGKSmMY
         TYrdtXC13W4j2U/x45tJ8xov4tJtZtYE/31FFncoFBVgGwyC4XqPL5CvFgUWIhhYh8WJ
         QlJA==
X-Forwarded-Encrypted: i=1; AJvYcCUkkN6BZ59c2x8r+06664TACYzkuAaXKy8omfqt7jMS7b1i0QqfunXGapx9mJKmQzZhPT0uyAnm+bSqEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz14oDQZYJDKmxHBtoloVJQBjCvK7ry/OEJ3tO4TtOmSJ3OTL/P
	QxM+wraPh/zy5izi5reWgVWX3pd1A74i2t4fV2w/N3DLfVf+td+YFtlBoEZRu4mCHh8=
X-Gm-Gg: AY/fxX4LqTiok8hwDfosb2WsDdaJ+VloCRB74J4VKZubo+06sreSTcEAlIrvWvmW0E7
	QRReF3mj5AzbDr3YG17MteiQLZwKqIOAzpGMblcZXwmIHLd8Cos3k+tC7NF6ZkRg4JcjtJ1aNya
	IfGGlgKe08VX594wIZ6lWCmK4qWWE35BBnw0qoAqUjNcSNRcBQ0GmKovO2JTs8iQEqNCUuUO4TN
	z6vMbp6Dk0BkAICzONIhO4PTUComYYcBBN5nwLqeWF3o1LJOHq2lAnu7xrwdvUmKF8CuVKd2SMB
	LPxcf72v39LZy/UGbDiMDPCY9hWhFSReQ33m/CQrdaLn1oH6VhKnbxI7uj7ndkphb5xeq7zbvS0
	1+AUAvXF4Jxa9cxRc5L97mjd8cApphSGVsgcV9RKrKFTdJqncKN7VPrh0yxMgQpUdcLXwwu5YJS
	PDL5NUCstS5WnpCs9UEUMEyaFuJAi5w2kppPW++UcW9k09s2IffNo=
X-Google-Smtp-Source: AGHT+IEy/QOrxe2SQiRFQjJ/+nrpNVPGTV1wSqBMtHRM+j197OQHW+EwApB9rAJn4Nlwz0TrLac2kQ==
X-Received: by 2002:a05:620a:454d:b0:8b1:ed55:e4f0 with SMTP id af79cd13be357-8c08fbc6077mr3782302885a.39.1766784530950;
        Fri, 26 Dec 2025 13:28:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973ee08dsm1824350585a.36.2025.12.26.13.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:28:50 -0800 (PST)
Message-ID: <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
Date: Fri, 26 Dec 2025 15:28:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
To: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_132852_577201_50F64E83 
X-CRM114-Status: GOOD (  18.47  )
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

On 12/22/25 7:04 AM, Guodong Xu wrote:
> Add description for the Supm extension. Supm indicates support for pointer
> masking in user mode. Supm is mandatory for RVA23S64.
> 
> The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
> state") of riscv-j-extension.
> 
> Supm depends on either Smnpm or Ssnpm, so add a schema check to enforce
> this dependency.

I have the same general question on this, about whether it's really
necessary for the DT binding to enforce these requirements.  The
RISC-V specifications are what truly defines their meaning, so I
don't really see why the DT framework should need to enforce them.
(That said, I'm sure there are other cases where DT enforces things
it shouldn't have to.)


And now, having looked at these added binding definitions (in patches
07 through 11 in this series), I wonder what exactly is required for
them to be accepted.  For the most part these seem to just be defining
how the extensions specified for RISC-V are to be expressed in
DT files.  It seems to be a fairly straightforward copy from the
ratified specification(s) to the YAML format.

Who need to sign off on it?  Conor?  Paul?  DT maintainers?

Thanks.

					-Alex

> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>   Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 1066b7e65dab89704dbac449db4aa5605c95b9d3..4997f533b2c0defad88fd59413a6885b5b9e109a 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -267,6 +267,12 @@ properties:
>               ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
>               ("Updated to ratified state.")
>   
> +        - const: supm
> +          description: |
> +            The standard Supm extension for pointer masking support in user
> +            mode as ratified at commit d70011dde6c2 ("Update to ratified state")
> +            of riscv-j-extension.
> +
>           - const: svade
>             description: |
>               The standard Svade supervisor-level extension for SW-managed PTE A/D
> @@ -892,6 +898,16 @@ properties:
>                   const: shvstvecd
>               - contains:
>                   const: ssstateen
> +      # Supm depends on either Smnpm or Ssnpm
> +      - if:
> +          contains:
> +            const: supm
> +        then:
> +          anyOf:
> +            - contains:
> +                const: smnpm
> +            - contains:
> +                const: ssnpm
>         # Zcb depends on Zca
>         - if:
>             contains:
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
