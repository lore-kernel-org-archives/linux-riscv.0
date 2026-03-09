Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD93F417F6
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+k26cLjGJ+4/4bfHAJxORJqUkk0rvycBK0QqsIdJ44=; b=sRd9XDTTdPPPmr
	bQMQTS5dhldvXHGOClkWzWvwalVYmxCaZv82qIzBdCdW/iCgqhBAZ6nhh+5QYyUCOZ1ln7N1p80b2
	J0XS/0W4Ad5KP3QMS79LH6nSk6x/F69GkHlYV9Daax/5E35e5DU/JdYyDWIk/CLIRVKWLv7V9YFLa
	S5bYMteqlNaFzTCZaoOlc4zWDfwQRpHkpc5RGkA7FhAALkYa7yYf5fZXtouVqS1J8TrrwU5+4Rg/3
	46lOqjfpcwI78Ugs9sd+HN84eSrY9D7/nnCJ8U/bpbxlVR0T9Aud1CTdJS3QcBDmFwyOKkQMFlHMy
	lUNTnRCIJo5iDLEXyJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcBK-00000007YPL-1MSo;
	Mon, 09 Mar 2026 15:06:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcBG-00000007YNb-3R4k
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 15:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773068761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=phOctTNEVWSPGlfX8YVkAI1SC7tMCmOFyrrNOPwSW4I=;
	b=jWsaDd0xiVBtSZ0MSnAmeCsugTudx5hUY2C2Bkh09lAEnZukIuN165l8Vtezn8tm3neMyo
	UWqFsF2d0lhbf2gBZ8+BpcB5Hw5770BCa1ZsIDoTCpUoeBHSDhET4sL+LjhjzvOFC5QiTG
	7k/wagPSmublJOne91+KZUOUh0bdnw8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-Cvgm5Y-yM5GOu90qT38jIQ-1; Mon, 09 Mar 2026 11:06:00 -0400
X-MC-Unique: Cvgm5Y-yM5GOu90qT38jIQ-1
X-Mimecast-MFC-AGG-ID: Cvgm5Y-yM5GOu90qT38jIQ_1773068759
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd84943c76so776031585a.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 08:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068758; x=1773673558;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phOctTNEVWSPGlfX8YVkAI1SC7tMCmOFyrrNOPwSW4I=;
        b=rKl77NlLXTNuJzIJyJ6ftfOL2fmaZ7akx24qMvEmeW1NZBcumDZ8dcSvv0Xx4pG6kU
         Thz3rHziqan6q/NM06CiZCV3DNdClPjl5V54zQEWFcOSF6OP9AOPUtq0S2dY2rDQmJL/
         Jjj4tJJX1f3VTanwJimbyuou1cEP7kcSTez37uQPaamV7MRbyr8pOTuZ2Wh0tPXJVFpc
         z6VXNHCiPQmkokZhOZ2hxAyMbP6Vs+ErC2xvHD2Ceo7rG6BfzcpF07wrl4WBlBd3RSAp
         3C5FRvBFoObm/3R85AqaX/OznGWONX3BdUZyGfFvjMkOyzjIiX03yMbfPePmIZuoaCj2
         yOhg==
X-Forwarded-Encrypted: i=1; AJvYcCVMZ3d77M76gJGmuiEVhTYUQWeYaqyReT/WbQTE1V+Ezo7fm25RydhU/k0gI5Drfy6/2unIvgOAJuenDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrWnQjmWAemKthUg+SRpkalpPvT90Iml8kouq5Dp51QiY/IF39
	+JuvoiyfqGPaH5BKEYkHH5YMy6e6mHhA/Tiic9kSZGADqtCy6XwkiSpkb2n4DQYu8KhjXp9QQlo
	Gz5fgQTq7QX23BAQnUDg39WjgdxFnzcJVNxBAGgpfDCpnMfK9sa7X5d/Ni1eQnMK7qxqKlQ==
X-Gm-Gg: ATEYQzy70FLkUjGqku8YLu0cuLoVazYW0htjtpR11ckuxHgsH1JkfnN2tkPHHtM7Wc8
	bECAgjYSdG7hg2hFz+8XXXAE2LtifehacVkpUFLRTNjuxU/dHQJTj+F5ZL9m3DsAkLH+3Si3eCx
	ItT45emPs1G0VRQbrmJvbDx/f3e7Qu58LOngCmyrYqOZD0AhulQr/P78Bxmu4Pi4IUQrJRA4kR8
	ONuEaevQy81yPpSvfz59yZch6WNyqJo6ytE8tmRqNJO6k+Zk+LGGCQ0+xwOU9IMnouv4fIGM2Wq
	X+h2a9pbq4l1PUawkADqOJydiJN85yF58o/hgM+kBi1WUsXVlmpDW3D9yvSglCZbvO2zSSShZ+T
	FNXjJrupnNs58wpp4LSCrXo8knQzCHxgzEJjWC7Ws8VQSxCw4+a1mpnCe
X-Received: by 2002:a05:620a:171e:b0:8c5:2de4:d6ee with SMTP id af79cd13be357-8cd6dc5f80bmr1304761285a.33.1773068758447;
        Mon, 09 Mar 2026 08:05:58 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:8c5:2de4:d6ee with SMTP id af79cd13be357-8cd6dc5f80bmr1304750085a.33.1773068757477;
        Mon, 09 Mar 2026 08:05:57 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd772f9f9bsm536468385a.24.2026.03.09.08.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:05:56 -0700 (PDT)
Date: Mon, 9 Mar 2026 11:05:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 04/10] clk: fixed-factor: Export
 __clk_hw_register_fixed_factor()
Message-ID: <aa7hz_psKK6lZC29@redhat.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
 <20260304-clk-eyeq7-v4-4-9d6bd9d24bec@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260304-clk-eyeq7-v4-4-9d6bd9d24bec@bootlin.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z7i9_8-DHGUfW0wrMzjh9TN2qqZGoCIvxJMYuvmDGQc_1773068759
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_080602_927349_6E06A9E2 
X-CRM114-Status: GOOD (  24.49  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 04, 2026 at 04:25:18PM +0100, Beno=EEt Monin wrote:
> Make the base registration function for fixed-factor clocks public and
> re-implement the various registration functions that are a direct call
> to __clk_hw_register_fixed_factor() as macros.
> =

> This is similar to how the registration functions of divider, mux and
> other clocks are implemented.
> =

> Add a new macro clk_hw_register_fixed_factor_pdata() to register
> a fixed-factor clock with its parent clock passed as a struct
> clk_parent_data.
> =

> Signed-off-by: Beno=EEt Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clk/clk-fixed-factor.c | 52 ++----------------------------------=
---
>  include/linux/clk-provider.h   | 56 +++++++++++++++++++++++++++++++++---=
------
>  2 files changed, 46 insertions(+), 62 deletions(-)
> =

> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-facto=
r.c
> index 359e91441c74..6116f878fc8f 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -90,7 +90,7 @@ static void devm_clk_hw_register_fixed_factor_release(s=
truct device *dev, void *
>  	clk_hw_unregister(&fix->hw);
>  }
>  =

> -static struct clk_hw *
> +struct clk_hw *
>  __clk_hw_register_fixed_factor(struct device *dev, struct device_node *n=
p,
>  		const char *name, const char *parent_name,
>  		const struct clk_hw *parent_hw, const struct clk_parent_data *pdata,
> @@ -148,6 +148,7 @@ __clk_hw_register_fixed_factor(struct device *dev, st=
ruct device_node *np,
>  =

>  	return hw;
>  }
> +EXPORT_SYMBOL_GPL(__clk_hw_register_fixed_factor);
>  =

>  /**
>   * devm_clk_hw_register_fixed_factor_index - Register a fixed factor clo=
ck with
> @@ -173,46 +174,6 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_ind=
ex(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_index);
>  =

> -/**
> - * devm_clk_hw_register_fixed_factor_parent_hw - Register a fixed factor=
 clock with
> - * pointer to parent clock
> - * @dev: device that is registering this clock
> - * @name: name of this clock
> - * @parent_hw: pointer to parent clk
> - * @flags: fixed factor flags
> - * @mult: multiplier
> - * @div: divider
> - *
> - * Return: Pointer to fixed factor clk_hw structure that was registered =
or
> - * an error pointer.
> - */
> -struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device=
 *dev,
> -		const char *name, const struct clk_hw *parent_hw,
> -		unsigned long flags, unsigned int mult, unsigned int div)
> -{
> -	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
> -					      NULL, flags, mult, div, 0, 0, true);
> -}
> -EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_parent_hw);
> -
> -struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
> -		const char *name, const struct clk_hw *parent_hw,
> -		unsigned long flags, unsigned int mult, unsigned int div)
> -{
> -	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
> -					      NULL, flags, mult, div, 0, 0, false);
> -}
> -EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_parent_hw);
> -
> -struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
> -		const char *name, const char *parent_name, unsigned long flags,
> -		unsigned int mult, unsigned int div)
> -{
> -	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NUL=
L,
> -					      NULL, flags, mult, div, 0, 0, false);
> -}
> -EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
> -
>  struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
>  		struct device_node *np, const char *name, const char *fw_name,
>  		unsigned long flags, unsigned int mult, unsigned int div)
> @@ -286,15 +247,6 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *h=
w)
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
>  =

> -struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
> -		const char *name, const char *parent_name, unsigned long flags,
> -		unsigned int mult, unsigned int div)
> -{
> -	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NUL=
L,
> -			NULL, flags, mult, div, 0, 0, true);
> -}
> -EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
> -
>  struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *d=
ev,
>  		struct device_node *np, const char *name, const char *fw_name,
>  		unsigned long flags, unsigned int mult, unsigned int div)
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 630705a47129..614abb396a6e 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1146,13 +1146,16 @@ struct clk_fixed_factor {
>  #define to_clk_fixed_factor(_hw) container_of(_hw, struct clk_fixed_fact=
or, hw)
>  =

>  extern const struct clk_ops clk_fixed_factor_ops;
> +struct clk_hw *
> +__clk_hw_register_fixed_factor(struct device *dev, struct device_node *n=
p,
> +		const char *name, const char *parent_name,
> +		const struct clk_hw *parent_hw, const struct clk_parent_data *pdata,
> +		unsigned long flags, unsigned int mult, unsigned int div,
> +		unsigned long acc, unsigned int fixflags, bool devm);
>  struct clk *clk_register_fixed_factor(struct device *dev, const char *na=
me,
>  		const char *parent_name, unsigned long flags,
>  		unsigned int mult, unsigned int div);
>  void clk_unregister_fixed_factor(struct clk *clk);
> -struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
> -		const char *name, const char *parent_name, unsigned long flags,
> -		unsigned int mult, unsigned int div);
>  struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
>  		struct device_node *np, const char *name, const char *fw_name,
>  		unsigned long flags, unsigned int mult, unsigned int div);
> @@ -1164,9 +1167,6 @@ struct clk_hw *clk_hw_register_fixed_factor_index(s=
truct device *dev,
>  		const char *name, unsigned int index, unsigned long flags,
>  		unsigned int mult, unsigned int div);
>  void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
> -struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
> -		const char *name, const char *parent_name, unsigned long flags,
> -		unsigned int mult, unsigned int div);
>  struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *d=
ev,
>  		struct device_node *np, const char *name, const char *fw_name,
>  		unsigned long flags, unsigned int mult, unsigned int div);
> @@ -1178,13 +1178,45 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_=
index(struct device *dev,
>  		const char *name, unsigned int index, unsigned long flags,
>  		unsigned int mult, unsigned int div);
>  =

> -struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device=
 *dev,
> -		const char *name, const struct clk_hw *parent_hw,
> -		unsigned long flags, unsigned int mult, unsigned int div);
> +# define clk_hw_register_fixed_factor(dev, name, parent_name,           =
      \
> +				      flags, mult, div)                       \
> +	__clk_hw_register_fixed_factor((dev), NULL, (name), (parent_name),    \
> +				       NULL,  NULL, (flags), (mult), (div),   \
> +				       0, 0, false)

Why the extra space between # and define? It's not used below.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

> +#define clk_hw_register_fixed_factor_pdata(dev, np, name, pdata,        =
      \
> +				      flags, mult, div, acc, fixflags)        \
> +	__clk_hw_register_fixed_factor((dev), (np), (name), NULL, NULL,       \
> +				       (pdata), (flags), (mult), (div),       \
> +				       (acc), (fixflags), false)
> +#define devm_clk_hw_register_fixed_factor(dev, name, parent_name, flags,=
      \
> +					  mult, div)                          \
> +	__clk_hw_register_fixed_factor((dev), NULL, (name), (parent_name),    \
> +				       NULL, NULL, (flags), (mult), (div), 0, \
> +				       0, true)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
