Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D58C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6etKk/JU54lYa/fRHPD2bnpNnO5T970N7a+yoo+NU1Q=; b=ZHCQWDwdSMxBTS
	gZhIq7+DFmAoJSJr2AYm7M7/TrZzfoYkMzsof7DjnRfYxWZ8c1v5OwhofqtFldURyl1KniJSHMfSh
	Q6kEIjdlLlKmnZ7C9KZvNwhd8qZKFLokhkNnnPnKYcSCEKi8er37QrQQHChyMg+erXTGj4mc5SzfW
	rVS27YbbIHMybssS4/ehJvWPyULJudz9GBg6ZdSK3OMptPuVEV8dV7eNt+jdpoOsarCvBZfwzHGtK
	xi8m10dCnM7tEc8NEUMAOXaIIruRTpgyb9bKjNvkWkpx5HHihznMXWGS9LtuhezcXuAord7KqyOto
	lCxnQverwDnUQtrQF4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pexrZ-00Fzao-1L;
	Wed, 22 Mar 2023 12:46:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pexrT-00FzWi-2M
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 12:46:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id eg48so72312491edb.13
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679489195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5zKbHjfhgxF54RZN2uMVwaO/XV5lTFGogMg3VcS9Gw=;
        b=g0bBuwgqfq8NKbwhZFZrgh3ILJQ25NRW5qmNmABpR/5J7UMpNHAgm8YKjMO2Sam/b1
         MTvpDdEagorVMuehmgxKrl4YStGgrnAooCP+TADfp7Gms6SGocetTcammGQPbuNERIxm
         OkR0IkAiwTXDztGkkP9JhEUx8qtCRNfLOA1zuX84EvQirnpJKEMR9BaDiPdWHtWwh9g1
         ePEOpsQs8gcvuHGwZTBats0t6ZaUhAe6MaPKGUXknAROm4VvIa4KS9t3ODGfGMp7ZUK3
         3WimQkNd1WdmFoQ8wRpIQKMvYjQnCDsJjqynML4PMoDU8iYKKLYX78DF7ObFk08gSpZK
         Yhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679489195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5zKbHjfhgxF54RZN2uMVwaO/XV5lTFGogMg3VcS9Gw=;
        b=0oBqPSEt585vVLgLv4sR+FEc23m+w6p2mfk6LVVEOTiOjacmkQ7mT5nNE+tsUdf33/
         x1E+Q4y4LB4VZ3j560obbCt7UxHY2gssAgsGLWKNvyqq8eStNsbfbpy1TpFA2NjbFy1N
         5IOKF2D9k2Cvc2rArmHQS/alDo54ZBHBmgj0cbiNAuE69BulDFA07RxfXerqjOOqHKHO
         fEAEADdzPzWYBRHlsdIfBNeIYaubG6dF2BJ9ADvyQNJ52p2Kd5rMncXmmiTL36x1AXTR
         ADptR42yL8286RqT8omDvaD68WmtS7MTEDQdS5OroQOXUDLK0ag01tDXfsCv2mngCEob
         KSMg==
X-Gm-Message-State: AO0yUKVOz5qg5xXbXzcpBYNvDkzJ9Grhz9B800/xK8XHsaXWXyKBpPTq
	kzvmVMiMmxVjZnLjQcBDOPxE0Q==
X-Google-Smtp-Source: AK7set+gJyx2poiD3sfTmwA9axJroFF1RhsQFBXaCqd0DtnPZi3yDlC8QBiTKtp9e6oeJC2EllLOww==
X-Received: by 2002:a05:6402:48c:b0:4fa:ad62:b1a0 with SMTP id k12-20020a056402048c00b004faad62b1a0mr5882545edv.41.1679489193201;
        Wed, 22 Mar 2023 05:46:33 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id c25-20020a50f619000000b004bd6e3ed196sm7761962edn.86.2023.03.22.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:46:32 -0700 (PDT)
Date: Wed, 22 Mar 2023 13:46:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info, regressions@lists.linux.dev
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <20230322124631.7p67thzeblrawsqj@orel>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322120907.2968494-1-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_054639_796996_C633ABF4 
X-CRM114-Status: GOOD (  17.66  )
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

On Wed, Mar 22, 2023 at 01:09:07PM +0100, Jason A. Donenfeld wrote:
> When moving switch_to's has_fpu() over to using riscv_has_extension_
> likely() rather than static branchs, the FPU code gained a dependency on
> the alternatives framework. If CONFIG_RISCV_ALTERNATIVE isn't selected
> when CONFIG_FPU is, then has_fpu() returns false, and switch_to does not
> work as intended. So select CONFIG_RISCV_ALTERNATIVE when CONFIG_FPU is
> selected.
> 
> Fixes: 702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")
> Link: https://lore.kernel.org/all/ZBruFRwt3rUVngPu@zx2c4.com/
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Cc: Andrew Jones <ajones@ventanamicro.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c5e42cc37604..0f59350c699d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -467,6 +467,7 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
>  config FPU
>  	bool "FPU support"
>  	default y
> +	select RISCV_ALTERNATIVE
>  	help
>  	  Say N here if you want to disable all floating-point related procedure
>  	  in the kernel.
> -- 
> 2.40.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

I took a look to see if we missed anything else and see that we should
do the same patch for KVM. I'll send one.

(It's tempting to just select RISCV_ALTERNATIVE from RISCV, but maybe we
 can defer that wedding a bit longer.)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
