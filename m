Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE2606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 04:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NXOAqx8G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oKLFmGC3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SNLXTSXSx0rfLy3TT2xPeX37Up01G9XGaJo6eutpyRk=; b=NXOAqx8GWDQEohfwa2HVcGbbFz
	CpRD8tkueggkoE3kqumpGfBut/Uw3CIbsOme/XgCU0/9R28HSyukl2iY4Qj+BmDkpNRrBbCWnWr9i
	6pzzq2PgTrA+kX3rgr3Iwv2lBL/ZKaSuFZFb0T4/PbTGAhEwmF5zI2cZUomaNYk+sotG5jSAxOdby
	Q6CccoPqh6rJ7Vca+5buOm7jjmFINPyLlWVBNeievbkKyCj2ms80icy/psxnovQP0UaA4b5v+ENnA
	XbwqMonmq+34cuxXKJ6bk9Nc65fJBUYYFht/QttWH/bNC9aUJPk1WTPNeBwpmzJakXDfI9UIVfeUJ
	S9OrstqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMdf-00000008hRh-0gNf;
	Thu, 12 Nov 2026 04:42:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMdd-00000008hRY-3sof
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 04:42:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01A736144B;
	Thu, 12 Nov 2026 04:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA731F00A05;
	Thu, 12 Nov 2026 04:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794458536;
	bh=o/qgiXuzgvovjEKL8rovshVCvJVWXh8SFxbVTEJ1seg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oKLFmGC3CBj77IN8R53zS/qL4a9ihAyCGK4U17EoaCbrRh/OFRePeoLEaQ9UIRXFV
	 W+MhiXrz9hcC1OgXhmJ8pcH1BiEjHXRV2vI4Sj33UP/CLyE0ZUafwI2F8yOz1rl9pO
	 R+QEB/6cWdVzm7EvYpsVHHKvTNCGa6BDyUG0bEvu67xeJj0FXb5YFLtKEUXM2EW0tA
	 Tc72WNyZFLo/p5rdV29LJmowivAqevjWwW3UhAGgXOEjYoF0UGJyYfls/77o5KyvrP
	 qenHsmKsSNvi9E6UjCdftqprbzkCEN9k6yix/ab0BzaycSjd6zYYtbXc1yEKZOGJGN
	 fAklX1TBxLtBQ==
Date: Thu, 12 Nov 2026 12:22:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: unaligned: fix __setup handlers
Message-ID: <avU-62EVrL341rL5@xhacker>
References: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:41:21PM +0200, Vladimir Kondratiev wrote:
> Returning -EINVAL from a __setup() callback cause invalid
> unaligned_scalar_speed= and unaligned_vector_speed=
> values to be treated as handled. obsolete_checksetup() treats any
> non-zero return value from setup_func() as success, so an unrecognized
> argument is silently accepted instead of being reported as an unknown
> boot option.
> 
> __setup() handlers return 0 on failure.
> 
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 67f1a0371659..323ccfcfbbb7 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -322,7 +322,7 @@ static int __init set_unaligned_scalar_speed_param(char *str)
>  	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED]))
>  		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED;
>  	else
> -		return -EINVAL;
> +		return 0;
>  
>  	return 1;
>  }
> @@ -337,7 +337,7 @@ static int __init set_unaligned_vector_speed_param(char *str)
>  	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED]))
>  		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>  	else
> -		return -EINVAL;
> +		return 0;
>  
>  	return 1;
>  }
> 
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20261111-fix-riscv-unaligned-e2df80509e0f
> 
> Best regards,
> --  
> Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
