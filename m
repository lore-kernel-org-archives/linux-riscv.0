Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEB2EE6428
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOS1rU0CjhDeOJzQ7aqMylGuMmRqczhc3B6n/nVkIm8=; b=XOE/hDJ2U0JNRh
	iFp4NUap7O2a7JI7/+N5hj6jpmHW3DiQv0rrbqraXh/fm+qvDtmhS+u78AS7anie9g2bf/WmUzD8q
	sUt7+7c4a/jPkElk9c8hdaxw8c3ulsuW32Hf1xZwXa9cWL4OoaZH9fbn4tSw/m0diKMyb46pNKdSr
	cit4yzpjDB92Jmj25NRw1yteqnMrvraO30VOms/bCOm8pqmGFOSN2LrAHYyF6ZlfpB1TCWLpt3byf
	cxvmHHd8RdrAVdVyjOzTb8qJSkl57yz6N6ivk4QBhu8DysI1qvFME0p4PpEuHKo9oH7jzbGL1+w4H
	YB0uIeK7o9qVQgsjP82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatsv-00000005u8M-1KMe;
	Wed, 31 Dec 2025 10:56:57 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatst-00000005u7z-374C
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 10:56:56 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47755de027eso63375755e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Dec 2025 02:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767178614; x=1767783414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7R9+4upUD30LvVBHKBIsvpaPmqe/LxN03we2YAJ0+o=;
        b=d7RFZjodzsEX0Z5glXZDma3ht5x78Qpo2lE+j07ILLzmsnwa7nuMz8JvaYZU9/6rlq
         f/OHtIg7EN0T/DtWZMd7mnF+Azl9wDlKW+osGvB4D2Pe1ppn4KMvCxCO6k9dDWTEFjKJ
         RI8IXm7/yjnURjWN85a6CvOB0FjqS0zEv8A+KPGCiuEOb0z0YmoxbsfqQ6EPVGtxiTMY
         RVD6NiMvSEhS1eDpewJSE+l9vfeVEv7GzXFaIDcTmz39YA+zs1abid65u8X1T2wdkMEa
         jQqLUl4YymUqr1nhody5JjddsQ6IverdgJmi/ozqNxc/T8/dXpc5nwrQSJgNi14t5qyF
         3xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178614; x=1767783414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i7R9+4upUD30LvVBHKBIsvpaPmqe/LxN03we2YAJ0+o=;
        b=KNRIguQEK6xs8458FWpkm125hNegrhsTrcPH4/X/I32hvg2uzOiPNFtLVu7b+LFoJf
         1n5oXAUnTXuaTd8gdbB2mANYL3Rln39R0/aVg8gV9jQ9baDAT5Pu2laIpxSHUN9xmkek
         u/bvlfhvhlJ1utXtHPojTDm3wfYhh5awAK2bj+6+n3X8741TJV682m6MAxK+xV26mzgG
         Q0zzc33vY8rOtSQGLmI39stlaAredcc3JvHLPKJ8FzJVVYW68LpdfBNJHKWuDwI8G42W
         P/16FmcHNg7FtNUciWVKsOBU9/IMXprNRQkRhIg+g7DgVe7fprIu1VgpV/x84vdQQ8uA
         BdcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIjikTMnukd7CGKBOHBy3kWi8OEEYAejTkNGWuHg9w+IrHkYNPgZb58Q0gg7tc9YfaLhhwJTuu2g4fsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXnj7yXujIdx51lSlm5U3p8yygzWfEmBCfPX1zEWGhI5FYhvbA
	nBEf/fIRyHrSqRoqGhFQRWfNkt5/eIhDTesiN3KU0EYAQc685FtKPSpO
X-Gm-Gg: AY/fxX4dabg9SmWuUSorI3YHW7b9gSrdMO7p65v3QkV3WD6tRTKkMCRlteR5EK7JgV9
	54sMnf/w+jwW3/zMtU+yKEwZNeA9SRvyLWBTfjkzB3G7TtoUxsuyB/xIh5M1RMLR+gQj1+XVTvY
	NFSg1IeO7et4sqjrkF6VWsmbdY95JHdISi9HFaxM+dYDHmNDVyqCLL4wKjIjsU8NlmLRWD+4XQq
	IICVLuCaiYslNfAyreH6oVEGEaKs5Km0ruv66VxlAcNWW0p/sDJJFfpd7SARYRPWObkYDwrUKbk
	3I5W6vNcIdHKxRqh/7UptNlYpVyiSGp+km4X9WCDvcMfAacU28e44FwZAqWjRuYUzJEZ5b8xMKH
	o5UemO0+SjbkTt9lrGHH6wrpuMCaq5gHcIs92uBRZemmW+qtWDzaDkdypgTTumd8Wp9ceqWqboj
	wfHaKECIYyy0djctuDKwoYPz4I7XimMX94B67jPnmirZCgk50ZN2VOvycwJdaJMcs=
X-Google-Smtp-Source: AGHT+IHDZb5mskiCuLOc+8SBDEk/OvIO6Pug2fQj87O+qUGMgHUJl5YBr1B9MzEZuOqkC4xwyZSO8A==
X-Received: by 2002:a05:600c:8595:b0:47d:5d27:2a7f with SMTP id 5b1f17b1804b1-47d5d272cd4mr54788585e9.26.1767178613627;
        Wed, 31 Dec 2025 02:56:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm696441795e9.6.2025.12.31.02.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:56:53 -0800 (PST)
Date: Wed, 31 Dec 2025 10:56:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v4 1/6] clk: correct clk_div_mask() return value for
 width == 32
Message-ID: <20251231105651.430f75f8@pumpkin>
In-Reply-To: <20251231-dr1v90-cru-v4-1-1db8c877eb91@pigmoral.tech>
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
	<20251231-dr1v90-cru-v4-1-1db8c877eb91@pigmoral.tech>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_025655_821947_3E6EF6E2 
X-CRM114-Status: GOOD (  18.83  )
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

On Wed, 31 Dec 2025 14:40:05 +0800
Junhui Liu <junhui.liu@pigmoral.tech> wrote:

> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
> 
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
> 
> Fix this by casting 1 to long, ensuring proper behavior for valid widths up
> to 32.
> 
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  include/linux/clk-provider.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 630705a47129..a651ccaf1b44 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -720,7 +720,7 @@ struct clk_divider {
>  	spinlock_t	*lock;
>  };
>  
> -#define clk_div_mask(width)	((1 << (width)) - 1)
> +#define clk_div_mask(width)	((1L << (width)) - 1)

That makes no difference on 32bit architectures.
I also suspect you need to ensure the value is 'unsigned int'.
If you can guarantee that width isn't zero (probably true), then:
#define clk_div_mask(width) ((2u << (width) - 1) - 1)
should have the desired value for widths 1..32.
It probably adds an extra instruction.
(OTOH so does passing width as 'u8'.)

	David


>  #define to_clk_divider(_hw) container_of(_hw, struct clk_divider, hw)
>  
>  #define CLK_DIVIDER_ONE_BASED		BIT(0)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
