Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241A2CD98F6
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 05:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HorfHYP8R9Z80tNRy/0yLycRvdofYOHEsLrQFXEXiRA=; b=RGDut72vFnwTYi
	E811HoPZh+D4WUAOafH6HOX4qxVe1zmMgmF2Y+kYYcjnhhy5kr+x1RFy0UPtBOuKsVJQpK2061L9u
	i2ZYhcJkycgGvieCIEdgAPno0dux27BAOKJu2dNimkZaAz/JUz6asQIfETMra5UsEANknUPTlNo+U
	LFzC1BBV1k4o3ZQWae0aM9MjyHi4oqoVVC+fLrYMvzBzf+0Vi5p+LJzsEBk5bv90TxxgmcrKWpWc3
	6pflsFB3O6Bh0c1lZ+ivoeyYxK5kRbDQJy4mQSYaCBcy7uGNAiJ214EUYeS+g2J5Xwrh3K8Kyk0k6
	olYX93xZF+fgpyVAhhsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWwe-00000004QTB-1XYR;
	Mon, 22 Jun 2026 05:11:40 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWwb-00000004QS4-3Ebm
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 05:11:39 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3042a388168so2989923eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782105097; x=1782709897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tUyMdxDM/vKxlM20oDUY+rPNJmstFpQzq6tNl4fV6Yw=;
        b=LjUgijvZEWmsZwRrYMzW0NwsGDU9uISghqde6wKKxGMPaMdOt9jNvXScRAjlGXYwlc
         KAlG7g3g/QLOdDs8LMlQ3Am3bsyPPWihVx5pS+d7WeQfD89SbAI/i19KShgZpFUeWqCd
         Nnqfz0Bg066n8FLAxi4QDVgI+iBQvG9ub0PNixeXtFiMTc309qcJEwHnjAKyRKUbSI8G
         8670hNtObbdqHlXFYZ7IkeZR7T8IBeYxYwwg+R+oEGCnuaa8Ony95yjlLSKyLlbiI2v/
         iWYlI8B5/w1uOtIPtsTx2whBgY3D+lbCZkxPpDLA922aqb7MReLiPLHxvuD5lV4J7vYg
         rwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105097; x=1782709897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUyMdxDM/vKxlM20oDUY+rPNJmstFpQzq6tNl4fV6Yw=;
        b=ocCzRybNbb3+H00UHK9YCZaYyYE/MO3efGtMtqdk7Dylq4nbFZrYgTe54HOOdxsCzB
         CfNcNJ7KQCzeRJFFcjR1g///Sh3FGx7vCV+ruCttZK/vi73pSuNsRfL0sVmi2fUtUR50
         HoDT9M3LGxbzTz1Ke6Ur2I0WhfT2s4StSDMV/JPp79PM2NJ7fHCNCd5OOQpFod/YJltI
         JEITs1r3YAoxfhCizvZwWO+FQfkiqEA+KCqau1nclQ0XKRg69Cn5/gbEoOEGLjG+KYAf
         BOr9IPqaA1TvyusaBjhY0RFHESfjjRTxP/6KjbcSlWM5dzEezoFisVTm9DcBGIL56jDY
         qjHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmOW0qrpqDVsvjdEQt0Yw1RDi3J7H7GV8PEJczBuEv8luqxUnhr3xFHoYgigHavWzYCW4SYOkmxgsO6w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7swjDR5SYq48FF2KdS8np1R36SQ5DJKaze5ylz7cKkc7OR5/1
	P7ZGqCOSycEkvdvmv6dIroimDfG6GTvsKbENcr8VFodrbFzj6ZYWq3QC
X-Gm-Gg: AfdE7clW57i1T9sNwmUDa5OdAix9cts9Rv+9Vub22RVJGCEEGTNU1Y5CzbTAx3T37FH
	JJVW5axZ3sOemws3ih3g+TK9qPlDVnJYUs4BBJsTkRwaFzsFaJNZMvzqYLCULqgWON/oy0RYPPC
	41XxM5RKDi7L/guj8MrRGQ8ALjVgJwKxtqY18S2blo1Dla5/W0TBcVdaLSUJQ6ZCiu8a/AIhyTU
	COX8BDswYIaJQhWJIAC/TCR7+0BTFSa3vc5P/sOuD4bsea/7d2dSoHweUNEEwdE06mSaljp4BJH
	QhJYHvtk21iYYWX31UamlHDK9YkfFzOV3f1iNihPv0IPtqTu9/d4M/UigiYqbOZ5SOQ38MXhtkW
	9lTCMsU1w4iFHPmCLlC/f/IigC+u2xQ1HXdLt1quklDhwUCOjW2PDFgFUjLYhuW8NmKbF6MviqQ
	TqDr2JWXDedVU=
X-Received: by 2002:a05:7300:2210:b0:2c9:ee15:a0ee with SMTP id 5a478bee46e88-30c0798b3cfmr7992047eec.12.1782105096716;
        Sun, 21 Jun 2026 22:11:36 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c430553d1sm2062608eec.11.2026.06.21.22.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:36 -0700 (PDT)
Date: Sun, 21 Jun 2026 22:11:33 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: [PATCH 4/6] riscv: remove unreachable invalid range check in
 kasan_init()
Message-ID: <ajjEBVthck4c1le3@blinky>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
 <20260621145919.1453-5-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260621145919.1453-5-ekffu200098@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_221137_811752_D351552A 
X-CRM114-Status: GOOD (  15.49  )
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

On Sun, Jun 21, 2026 at 11:59:14PM +0900, Sang-Heon Jeon wrote:
> kasan_init() populates the linear mapping shadow with for_each_mem_range()
> and breaks the loop when start >= end. for_each_mem_range() never returns
> an invalid range, so start < end always.
> 
> Therefore the start >= end check is unreachable, so remove it.
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

> ---
>  arch/riscv/mm/kasan_init.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index c4a2a9e5586e..1f3aa9611187 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -512,9 +512,6 @@ void __init kasan_init(void)
>  		void *start = (void *)__va(p_start);
>  		void *end = (void *)__va(p_end);
>  
> -		if (start >= end)
> -			break;
> -
>  		kasan_populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
>  	}
>  
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
