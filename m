Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3800C8303F
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 03:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5EvNPUISQlb6sw38R0W41NPMjmv3zDKW+sVCprQD74=; b=AUOWFzYsmNQQuX
	oZN4UdZuugodluY4sX+LDKYYbDAs8ln4jLvnFXulL+DZAJEjdhU9xQmcbPtroSNAm+SPQ8E8jUnhx
	0TL6bms91putIj3KK2iVdhnzDM0Akp8jQTaVjgrxm938im1e9zMG8Du4nhxuh+FHVAgJyFzYpRcY7
	GMKWl8y2ZDRxLasjkDdY8oMhwwBPlB5uIPyg/o07ZsBfk7PLYdDujzLTTmqO+rTCVDuHqJz9XNG5v
	vXSBYo7b1N60M1SxIvLUzYUoZJhoA8pwg1aYK25pRI1lnoV6lj5wKhw69kMY4kjL0P+CL+0ceBJki
	YW2UzX6obq7+hXicC5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7A8-0000000DtCN-0yac;
	Wed, 27 Aug 2025 03:49:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur79g-0000000Dt8K-3aLU
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 03:49:02 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2489acda3bbso1883775ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 20:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756266540; x=1756871340; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ycg+k8BPaJBsXtt6oFP/HzoMA5d4/C3y5i8DrK9MTbE=;
        b=lZpbSUdqv/qmHkdWmKXPgAY25+yuRnifY144VqDe7Wm0HunF35hxqWxDKdzDrqHAVF
         dTlPgLplng0fiLDUaMWyQb6eLwrzwEKXGFiP6C5Rd34PgzZmS0FHV2Q0yyp1+Ih4eouL
         mHtzh3K4Ka6SkBn7NADEmjAzGsTfBtvehBviwpolwRC8uszQK5Ujyt6/7o9rD3OJfgrd
         xXn1LKdFBlAwX9KP6HgLq1SO1Dnayt4aeF9jCDbGys4ba9cwdKWm8jWn0ly3YdYKETOD
         KRxBZPOn4RGZJQKT8mgDJD/nnfAjbKsthkHsgxZaICL/6nepJA9KQUlzqyYj/aW7GPPG
         ZGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756266540; x=1756871340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycg+k8BPaJBsXtt6oFP/HzoMA5d4/C3y5i8DrK9MTbE=;
        b=cSIGIiHlJQoEnymR1SbWUUWXsp/ACQLIKoxtA8cqFdbBJ2NQBJgLU2w9RpPWtlFlab
         OQy/OxezhQWErct9GLr6M9PEW/sYJKkai+G1SjN79HJ0VpA/PUxUT11e7/2lCV/+18mZ
         2sJcqmIBMN7agJW0vU69PENb7Uipi66MLUXJX0SeCUbX3ZtvK9HiX5N6gcOAFksJL6nr
         7Rnkj6n7HYgNRjZ7H6AOVDnitkpZXOaA1VBz94vm4wvN7k5/1aI+uUVmQudHmIvxuWQb
         DpZH+9sHmP9BvivH2TmbIrgGoktd3okVdNIIG/anpzS1eZrsXx76+u43Yz29SXNeTcWt
         wJKg==
X-Forwarded-Encrypted: i=1; AJvYcCX5R7UYIug7j2NTHbXUCH+3XGoqg7+aYQUZCOGlZOGy7CJxSKuCf4pOGM24OEVXtxolykFBoaV+0MSH4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5HhZUFF9021h9nHcAk2MUsj7q3/j4IKrbLzhAZy/x3XXCbGjb
	p4ET5ahJlkZe1jjoUYIZGZjv/s/N8gW7Q3POWqIzQbjqPbTpQVej9aC6++yXzA==
X-Gm-Gg: ASbGncvQ2QZ1YlrTGFPsujR+PmymXea2Mg62xbR2qp2JaST3TE3CPz2OBJ4RbphbDvJ
	9wWMAnsdY3CznqmL0SxdZPS/L7PnmrtGQhCBpCfso9JAp5Fn2N1zU8yjKQOH5xlrIcQMNWQ0Ooo
	zvw00IJjE4rW7SgMFTTEw52vo4uuK6pTkP+aSlu9DZzlnII5WEzCj5xcNL0EeVXWB0WuEEEmsEX
	ig5QEhtjA3pBOEBdB8H73UVQTxDeh2pFXogoYwqI3WikYp6fxkz88gCAuMqE7SyEBM26DdAFt+a
	s9+Lbx9/hPOTOyvg7vx2Kg8OuH33a1yLj9wBZv9+6wgDHvf9uMidNf5euooveN1BZ7UsFKBX3HJ
	vwbScmkpzWdyhWCmKEsCoVAlv/xTh4vlP
X-Google-Smtp-Source: AGHT+IHIqHeQ+7pnLDLG3vRJO8dAn12pGtpKjSirMdb7jEheA4wnpaV508VmCTAKLA0lPi5hO65T/w==
X-Received: by 2002:a17:902:db0c:b0:245:f85c:8c76 with SMTP id d9443c01a7336-2462edd7e00mr184407845ad.9.1756266539833;
        Tue, 26 Aug 2025 20:48:59 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668879162sm109367435ad.113.2025.08.26.20.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 20:48:59 -0700 (PDT)
Date: Tue, 26 Aug 2025 23:48:57 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vivian Wang <uwu@dram.page>
Subject: Re: [PATCH v2 4/5] riscv: bitops: Use __riscv_has_extension_likely
Message-ID: <aK6AKTnUtthEnEyy@yury>
References: <20250821-riscv-altn-helper-wip-v2-0-9586fa702f78@iscas.ac.cn>
 <20250821-riscv-altn-helper-wip-v2-4-9586fa702f78@iscas.ac.cn>
 <aKcwtXDJKRf4O_tF@yury>
 <4dba27c4-e7a5-4ffc-8073-08a83c68e527@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4dba27c4-e7a5-4ffc-8073-08a83c68e527@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_204900_911112_A5B1939B 
X-CRM114-Status: GOOD (  33.08  )
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

On Fri, Aug 22, 2025 at 01:46:19AM +0800, Vivian Wang wrote:
> On 8/21/25 22:44, Yury Norov wrote:
> =

> > On Thu, Aug 21, 2025 at 05:16:34PM +0800, Vivian Wang wrote:
> >> Use __riscv_has_extension_likely() to check for RISCV_ISA_EXT_ZBB,
> >> replacing the use of asm goto with ALTERNATIVE.
> >>
> >> The "likely" variant is used to match the behavior of the original
> >> implementation using ALTERNATIVE("j %l[legacy]", "nop", ...).
> >>
> >> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> >> ---
> >>  arch/riscv/include/asm/bitops.h | 32 ++++++++------------------------
> >>  1 file changed, 8 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/=
bitops.h
> >> index d59310f74c2ba70caeb7b9b0e9221882117583f5..f70ccc0c2ffb86a6fda3bc=
373504143d0c6a1093 100644
> >> --- a/arch/riscv/include/asm/bitops.h
> >> +++ b/arch/riscv/include/asm/bitops.h
> >> @@ -47,9 +47,8 @@
> >>  =

> >>  static __always_inline unsigned long variable__ffs(unsigned long word)
> >>  {
> >> -	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> >> -				      RISCV_ISA_EXT_ZBB, 1)
> >> -			  : : : : legacy);
> >> +	if (!__riscv_has_extension_likely(0, RISCV_ISA_EXT_ZBB))
> >> +		return generic___ffs(word);
> > So, on the previous round you spent quite a lot of time explaining how
> > 'unlikely()' version is handy over '!likely()', and now use just the
> > latter. I feel really lost about how the code generation should look.
> =

> It's not "handy". The operative part is "has_extension", and both
> functions return true if the extension is available and false if not.
> Functionally:
> =

> =A0 =A0 if (likely()) <-- equivalent --> if (unlikely())
> =A0 =A0 if (!likely()) <-- equivalent --> if (!unlikely())
> =

> Whereas:
> =

>     if (likely()) <-- **opposite of** --> if (!unlikely())
>     if (unlikely()) <-- **opposite of** --> if (!likely())
> =

> All the asm goto dispatch stuff work like this:
> static_branch_{likely,unlikely}, (arm64)
> alternative_has_cap_{likely,unlikely},
> __riscv_has_extension_{likely,unlikely}. Maybe it's confusing, but it
> seems to be the convention.
> =

> And, codegen-wise:
> =

> ALTERNATIVE("j %l[no_alt]", "nop", ...) -> likely() ALTERNATIVE("nop",
> "j %l[has_alt]", ...) -> unlikely()
> =

> Since the original code has the "likely" pattern, using "if (likely())"
> preserves it. Whatever the codegen was, it's still the same.
> =

> > Can you please share bloat-o-meter report against this patch? Can you
> > also show an example of code generation before and after? Have you
> > tried the 'unlikely()` one? How the output looks?
> =

> Thanks for the tip on bloat-o-meter. I'll take a look tomorrow.
> =

> >>  	asm volatile (".option push\n"
> >>  		      ".option arch,+zbb\n"
> > Yeah, now the diff is much cleaner. Thanks.
> =

> This is why the condition at the top needed to be "!has_extension". So
> the structure can be:
> =

> =A0 =A0 if (!has_extension)
>         return sw_version;
> =

>     multi_line
>     zbb_version;
> =

> If I used "if (has_extension)" the code would need be
> =

> =A0 =A0 if (has_extension) {
>         multi_line
>         zbb_version;
>     } else {
>         sw_version;
>     }
> =

> And whether it was "likely" or "unlikely" had no bearing on the
> structure of the code.

OK, I see. Sorry for confusion.

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
