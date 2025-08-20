Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19874CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 18:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jk43W/TR60vNU8rZqH4zyRhxz/9SPtuckf8iQLednsI=; b=gIXIsqUwNSQeHv
	RHcGdUA24wV5uOnn8Kw5yrotjH4VdvBz8k1fXKsaJAT4fnpTXbaF64mFku9AB3kJ97Z5wr+f22Tgr
	AWpdmVASucyW9Bz8Acu9KVc8Lrdrqgm3E7N1Wd59nWdE58olZlteHp6yDuzhjCxk0Fn3BInjis+cf
	e2Y5qzV4uNz3J1MTqQbt0s+uHssEcNhn6DNE1UAnaXdhG6VJq3FqmzmeWeqkji5RNlXJUJcMqkjT8
	/b2u22Vxg+fPgiVebzC+gN6GLvYqhIPJY4gIp2mYVheWwSdVBuNlHRURsiG9OJhsZn6346K2wUZB/
	cHVxBl8huMUh9vWGCzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonVZ-0000000Eg1e-0FFY;
	Wed, 20 Aug 2025 18:26:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokMd-0000000EBUy-0c2Z
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 15:04:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2445811e19dso53114715ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Aug 2025 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702274; x=1756307074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=++r0iAI2yCp7ByMWBTkoq4eZJInhcfQbLd7c4fa729Y=;
        b=bZpdH90xxan6OqaSKkRp8WH9hK+rnzYEJN4f/XuFvnJcLtzgh1aMqWLLfnmn5ENv5g
         yjmk9wkpj7aftuutLvmcdTR7N0Wtfh03hHY17aAqzOBOkrrj3hXOPDfRsyXRkOjrmThL
         TGbo5SXkOj1fQlNuxOd5ixcDdWM0yPtc6msqIBtXh+I/IRpuHDTrrZuv0h4hX31pkSE5
         dLhuG8bdVZ0fU4vaJhXvOWqsLweyjg8RX4omPHVEvokFPaGae5LWLLrZcVJPHe+jDRNO
         DVbX7kXri3NE1rJehssD/XyJAc5xc5uHOBHQjJqPmBoymarisL5atrXRQ6YySpVOY+P1
         NvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702274; x=1756307074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++r0iAI2yCp7ByMWBTkoq4eZJInhcfQbLd7c4fa729Y=;
        b=vO061MJf+grbz15Kag3yIk2EthdE7A9WZr3PiKDWzuaWKfTha5CqbtoCN8vZWVdwag
         B00FGVd9MxZMJUFiasz1unhblGD3l1bc8Ca5cr68K2g2BZCmBAb8U7t4ip+ZNCpeveOg
         T6HpjpaLP/X04r7n2U+oW42IulgvzB92A7+M9E9VXyElO1vYO2gu6+ksxakuuJ5UMW+f
         RYhR+F/lo5TSBoXh3DpBOE2HoUB1v8IxY+lmhyRUDkJSnJJ1nRa4WXWtMSAdUk0NkYEk
         9n1//ujihPjjBvyIUcGc4FwfTmNh1ozj2jjU35lP2ENPOEnXWBs6sCZGClQ2MZi3W/ea
         M+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXd79INj8YIs6JkmgeVSxzXE/crWJSjIfsWT8itTmzsAwaNxP2Ybheew+fegWTJOaVGZ31Ku1HYXuCNmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIBsWDgkVskAd3tIDOt46oH6JfyCmT/4uczg/ySFETwZtjvQ0H
	bc43nmagQLtJbpO66AKRSz7Bg/2Co4u+qZUgKblLwR/NDiESgHMe7lFW
X-Gm-Gg: ASbGncvU8zz7FuymPE3Xu7r+O3PuJknG9I+Pkm36ogo5pzIjjpjWVl/DwQURveig3K2
	SxXsdH887vCmPmsYz6DzS5eKYu/Sk2fhpyRB4MFD6irbTCDGiYSzMi4wVrUNTDFacx6DQi+j2Bt
	Uvz6sQtJxF6tKkTrQLiyx5dXymdYTIjSpJAhGP3hsEaU5PKwlS6xRPxsiH/o9pnAAfUElJCkIOH
	jnN9ccy8Er63cExZL9XSvGAd2o2ShtIt78YZt7dkviS86CCkEFoeYGNuee9LyIFoLf4cNknN8aw
	ktzSFNV4m57tXAy4ajkpQ+3T8iWq00RaWcPdoafoIaTTnIhfWvv6n+pK8LsaXasSnXzjPSGZHYa
	3mY6NfM161g6u5IGQiHYITw==
X-Google-Smtp-Source: AGHT+IG5GibFX4nRPe3uAIyd9oVrLLUMsOnz3s+oCgefLCLc1FqEY0SeoiyMrK+0hu5OLASgGFtLgg==
X-Received: by 2002:a17:903:1b6e:b0:245:fc41:eb53 with SMTP id d9443c01a7336-245fc41ecefmr466235ad.30.1755702274208;
        Wed, 20 Aug 2025 08:04:34 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53eb8bsm29017525ad.166.2025.08.20.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:04:33 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:04:31 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vivian Wang <uwu@dram.page>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] riscv: bitops: Convert to use_alternative_likely
Message-ID: <aKXj_zTwvk0SwUpV@yury>
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
 <20250820-riscv-altn-helper-wip-v1-5-c3c626c1f7e6@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820-riscv-altn-helper-wip-v1-5-c3c626c1f7e6@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_080435_186797_2A785808 
X-CRM114-Status: GOOD (  20.12  )
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

On Wed, Aug 20, 2025 at 09:44:49PM +0800, Vivian Wang wrote:
> Use use_alternative_likely() to check for RISCV_ISA_EXT_ZBB, replacing
> the use of asm goto with ALTERNATIVE.
> 
> The "likely" variant is used to match the behavior of the original
> implementation using ALTERNATIVE("j %l[legacy]", "nop", ...).
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/bitops.h | 112 ++++++++++++++++++----------------------
>  1 file changed, 50 insertions(+), 62 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index d59310f74c2ba70caeb7b9b0e9221882117583f5..0257d547a96293909d90b017c8a48b508d0fd642 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -47,20 +47,17 @@
>  
>  static __always_inline unsigned long variable__ffs(unsigned long word)
>  {
> -	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> -				      RISCV_ISA_EXT_ZBB, 1)
> -			  : : : : legacy);
> -
> -	asm volatile (".option push\n"
> -		      ".option arch,+zbb\n"
> -		      "ctz %0, %1\n"
> -		      ".option pop\n"
> -		      : "=r" (word) : "r" (word) :);
> -
> -	return word;
> -
> -legacy:
> -	return generic___ffs(word);
> +	if (use_alternative_likely(0, RISCV_ISA_EXT_ZBB)) {

I don't think that 'likely' is used properly here. The likely/unlikely
wording has a meaning of a hint to the compiler:

        if (unlikely(WARN_ON(cond))
                goto err;

In your case, it's just meaningless, because whatever is 'likely' for
one CPU, will be always 'unlikely' for another. 


> +		asm volatile (".option push\n"
> +			      ".option arch,+zbb\n"
> +			      "ctz %0, %1\n"
> +			      ".option pop\n"
> +			      : "=r" (word) : "r" (word) :);
> +
> +		return word;
> +	} else {
> +		return generic___ffs(word);
> +	}
>  }

This tabs wipe most of the history. Can you reorganize your patch
such that it preserves as much history as you can?

        if (use_alternative_unlikely(...))
                return generic___ffs();

        asm volatile (".option push\n"
                      ".option arch,+zbb\n"
                      "ctz %0, %1\n"
                      ".option pop\n"
                      : "=r" (word) : "r" (word) :);

        return word;

And so on.

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
