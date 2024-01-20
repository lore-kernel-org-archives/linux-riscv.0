Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8865AC4725D
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 01:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20VGOqO46twcfAthrTN/nhi3CzdXi4i3zIZt9OVhLvQ=; b=Bl967Bfb7/a6he
	PenqceutLiI8MabOTMQOcAKBuA4E/hk8QQ8+E/VC/Vq6wqWnPKp9gU5vti5uA4PcdewVP3JKfPT+3
	DUJv+fqeVeD4X5+tSWS9czAh0eIqPNgyWr/PMGvHNRh/y5MARiV87m2XmsPPjmazoMLsDVpUWm/2w
	uUzmW5m/JSi3KRlwQttQVbuGrm1qgRW1Nys4Ex4oPI+Jy35E0E+ajhJzvLY+LrDuVKiVLUS9Kerl2
	2k4obFHve/XxwGNA22LsBay/BdsCPJcfgr7Y4frd9Bqgzli77Bm5bGeMKNmueC6FbTVqagc1CexdP
	lhpu0kBfIQH8mMCtbrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rR0WO-0071sD-1T;
	Sat, 20 Jan 2024 01:51:44 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rR0WL-0071re-2C
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 01:51:43 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6dddb927d02so717951a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 17:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705715439; x=1706320239; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XOITpQ5DIMR2IaudgN0/DW6CNyk3x4Ig/+XyjN/PP8=;
        b=JU5DBr9rt8nwo47Ad2BRzD/dLc/dwR1sfBslSd7mxpHicFKyffRXjxzy2MHkkLRfAU
         WRlc7t1QasEcOGem9Nvze6vR+Em11f8OqPXcOGksNLH4yp50sxHxzKoLyHllvKv3CQ5K
         kNPkF6uo2PvbqysWpsHwIJyutrFuZpEfR1fVdR+0tgMFzjYb5sRrvf4JQw1uCpIdxzRp
         dsrAaLgtBZnKCyfADH78gTA0+dLmhfTHKMsHbuHzv0gocwIQJm34bnLUlDBhs3XypYTe
         zCGVxuo23NMBAWTM8QmLRKjJGrqYDqG8ONub2Ll102AjwSlZQjq9BCkwJhc6IaXKQC+m
         zjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705715439; x=1706320239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XOITpQ5DIMR2IaudgN0/DW6CNyk3x4Ig/+XyjN/PP8=;
        b=gxVd1DJSXYW6wQsI1pyYvi8b7dqTBkmHtg6V3XeG0Oz7aSo1oyi5zqAxTEXhUhQ+UT
         KBRXv3ieVu9wqUvqXYdr+Uzkg+++rNCJ+6S0Ki6RDjZ4Z0GuBIFJLfXeKnEnI413Gz2+
         DmJr7yUE5r5jB7583SyPSI+Gp1VVI2/TiKRB7/+TJS5Jw00mI0+MWZMnOYoksGS07f6B
         7aQ1jjCVMTvkNENq+fcbGY9RN4OFjU/R5Im+AH2EAZDQGC3+IvWrRmKSAd7scUNFgwR/
         ZcRL64VbyNeur/ZQLxbL5pRZ/f00wq8j+CcjarzUcq2J2crLus7rMC48dF26wPsvxQL8
         HJRg==
X-Gm-Message-State: AOJu0YyMaKBHRkBEnjjeXLyVDOo5Wei38mnmcAl0eF3nGtrEChTfzF38
	33FdCpj45GA5JtR1voa9YznB8t/RYU1hTB0Euu3b7SEQTQGsQsJRHfF+c/9Jfns=
X-Google-Smtp-Source: AGHT+IGkhCllEapg0R5O7qaHZ0AI3ph1OReFqFBoj0J72zCVnKpl8RZyjHh02StLZzQXRNmMLGfiWQ==
X-Received: by 2002:a9d:6212:0:b0:6dc:5e1:3d89 with SMTP id g18-20020a9d6212000000b006dc05e13d89mr762369otj.17.1705715439125;
        Fri, 19 Jan 2024 17:50:39 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id u24-20020a63f658000000b005cda7a1d72dsm4086546pgj.74.2024.01.19.17.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 17:50:38 -0800 (PST)
Date: Fri, 19 Jan 2024 17:50:36 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] RISC-V: mm: fix mmap behavior in sv48 address space
Message-ID: <Zasm7D/bQH9XGHvf@ghost>
References: <tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com>
 <tencent_871D1B705162CE42D21BD1F86E0447B44709@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_871D1B705162CE42D21BD1F86E0447B44709@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_175141_740448_3724081C 
X-CRM114-Status: GOOD (  20.14  )
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

On Mon, Jan 15, 2024 at 03:58:30AM +0800, Yangyu Chen wrote:
> A commit add2cc6b6515 ("RISC-V: mm: Restrict address space for
> sv39,sv48,sv57") from patch[1] restricts regular mmap return address in the
> sv48 space if the address hint is not above the sv48 userspace address.
> However, this commit treats the address wrong which only use sv48 if the
> hint address is above sv48 user address space. Actually, it should use sv48
> if the address is above sv39 user address space. Moreover, the original

It is not valid to use any address in sv48 in this case. It is designed
to provide an address that is in sv39 to guarantee that the application
is able to handle any address that is returned by mmap. If, for example,
the application asks for the address 1<<42, it expects that all of the
bits above 42 are not used. The address provided by mmap must not
contain those bits, so it uses the sv39 address space.

- Charlie

> patch code looks very complex in logic, we can simplify it with min marco.
> 
> [1]. https://lore.kernel.org/r/20230809232218.849726-2-charlie@rivosinc.com
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/include/asm/processor.h | 39 ++++++------------------------
>  1 file changed, 8 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index e1944ff0757a..7ead6a3e1f12 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -9,6 +9,7 @@
>  #include <linux/const.h>
>  #include <linux/cache.h>
>  #include <linux/prctl.h>
> +#include <linux/minmax.h>
>  
>  #include <vdso/processor.h>
>  
> @@ -18,37 +19,13 @@
>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
>  #define STACK_TOP_MAX		TASK_SIZE
>  
> -#define arch_get_mmap_end(addr, len, flags)			\
> -({								\
> -	unsigned long mmap_end;					\
> -	typeof(addr) _addr = (addr);				\
> -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> -		mmap_end = STACK_TOP_MAX;			\
> -	else if ((_addr) >= VA_USER_SV57)			\
> -		mmap_end = STACK_TOP_MAX;			\
> -	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> -		mmap_end = VA_USER_SV48;			\
> -	else							\
> -		mmap_end = VA_USER_SV39;			\
> -	mmap_end;						\
> -})
> -
> -#define arch_get_mmap_base(addr, base)				\
> -({								\
> -	unsigned long mmap_base;				\
> -	typeof(addr) _addr = (addr);				\
> -	typeof(base) _base = (base);				\
> -	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
> -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> -		mmap_base = (_base);				\
> -	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
> -		mmap_base = VA_USER_SV57 - rnd_gap;		\
> -	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> -		mmap_base = VA_USER_SV48 - rnd_gap;		\
> -	else							\
> -		mmap_base = VA_USER_SV39 - rnd_gap;		\
> -	mmap_base;						\
> -})
> +#define arch_get_mmap_end(addr, len, flags) \
> +	((addr) >= DEFAULT_MAP_WINDOW ? STACK_TOP_MAX :\
> +	 min(DEFAULT_MAP_WINDOW, STACK_TOP_MAX))
> +
> +#define arch_get_mmap_base(addr, base) \
> +	((addr) >= DEFAULT_MAP_WINDOW ? base :\
> +	 min(base, DEFAULT_MAP_WINDOW))
>  
>  #else
>  #define DEFAULT_MAP_WINDOW	TASK_SIZE
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
