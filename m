Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A54CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlYre34Bw9ujVKFpqW7v3XOmim4isrXiuxFNjuAvX1U=; b=FRcqbAfxFv+Eis
	YAjafvWycjYo+b57xkFwkBW3orb/T+W29Swd2rXqEOrLfPpVH0aQish7PKybM2GO/N46icf2JWvya
	MwpTXpn8rZijOxrefDp1jtHgQ4dgiTS/7yv4pZm4aLOkj3/pIyt5kiszDTBM3kUOAvQy0KVpZqBZR
	J5QdOP6Yxk5NUgDcgoerhbTTvHg+mzu3KKTPVSHnv2VKIaTIHRwNUZN3oiE8TfrKUpfyCMw6Sgq/K
	AjVuQp3hvgdAcNXJqijLR8rGFHtAgtCvRzOEQhyULo7+1GBkizw5OsLJAJpJvIfVNX/Fuws91NOG5
	1tyzIueoH3Q6hKWwyoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsoLP-00000008Sjg-2mV8;
	Fri, 05 Apr 2024 18:31:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsoLL-00000008Sgn-2VFJ;
	Fri, 05 Apr 2024 18:31:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 034EFCE2447;
	Fri,  5 Apr 2024 18:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78FFC433F1;
	Fri,  5 Apr 2024 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712341871;
	bh=SpJ5IQ9UhqrJWD/qugetHjxi8hPNKx//RaZUEP7dXMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PjsNhh0fjSHbdf2868fr6XGX0ymVpLd72hs4QqY449d2ixqqIbiOZ9KGWsTScBEdM
	 MmD6oO1ZFR5n/8XBcvJfrg+1fJuE6RWAslDhUeScY/894NlfAHOyDlBtG+Jpj6Xgim
	 AEpzgBbfrsVfqV97+U4MIZvB6mlskGvejsxy0uQkrvJ6HQBnEonvJPKwG4UwRXSFPC
	 sokGvl/2IbsBR2HRjgP5VVh/y6bBeOez+JNtA6wzhbGF/BxyaWGie9mhpM3y8Fsgqy
	 nccatqMs+mRkE11DcKuPOVmzq2/2RT6tsP9WZvm4sK8QAsHlkDj+GzXZn741rHxhYU
	 UZgSQsgWkKskQ==
Date: Fri, 5 Apr 2024 19:31:02 +0100
From: Simon Horman <horms@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, x86@kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v3 13/15] sh: Move defines needed for suppressing warning
 backtraces
Message-ID: <20240405183102.GU26556@kernel.org>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-14-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403131936.787234-14-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_113115_994687_2D0AF0FD 
X-CRM114-Status: GOOD (  15.75  )
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

On Wed, Apr 03, 2024 at 06:19:34AM -0700, Guenter Roeck wrote:
> Declaring the defines needed for suppressing warning inside
> '#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.
> 
> .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
> 	Prototype was for HAVE_BUG_FUNCTION() instead
> 
> Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
> to make kerneldoc happy.
> 
> Reported-by: Simon Horman <horms@kernel.org>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: Added patch. Possibly squash into previous patch.

FWIIW, this looks good to me.

>  arch/sh/include/asm/bug.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
> index 470ce6567d20..bf4947d51d69 100644
> --- a/arch/sh/include/asm/bug.h
> +++ b/arch/sh/include/asm/bug.h
> @@ -11,6 +11,15 @@
>  #define HAVE_ARCH_BUG
>  #define HAVE_ARCH_WARN_ON
>  
> +#ifdef CONFIG_DEBUG_BUGVERBOSE
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	"\t.long %O2\n"
> +#else
> +# define __BUG_FUNC_PTR
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +#endif /* CONFIG_DEBUG_BUGVERBOSE */
> +
>  /**
>   * _EMIT_BUG_ENTRY
>   * %1 - __FILE__
> @@ -25,13 +34,6 @@
>   */
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>  
> -#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> -# define HAVE_BUG_FUNCTION
> -# define __BUG_FUNC_PTR	"\t.long %O2\n"
> -#else
> -# define __BUG_FUNC_PTR
> -#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> -
>  #define _EMIT_BUG_ENTRY				\
>  	"\t.pushsection __bug_table,\"aw\"\n"	\
>  	"2:\t.long 1b, %O1\n"			\
> -- 
> 2.39.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
