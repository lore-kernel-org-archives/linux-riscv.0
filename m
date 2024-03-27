Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4D1C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1wgWIkR442idWA9LSOl5UtUFanhp5q+NEw1JsHtgcg=; b=lXuwd5KKkP2sKQ
	i/DiWv2y9IJbS3x+7cS4C5EWOrt0ckHMhLvK9o2xQFOtD735RhDt+bQFMj7SDe6JZr+7tUjlRFupX
	MoyMPFx3BK50biuWnYk/X7OREs7MMjVc/QqoAq6MVhn76SvAPxfdxtDSdaXLPLVJvL/4z3nkQb6Uf
	LkOw8PcZudz1Lw8IkwDqc/1mv/RrSX3OcfPc6NGLwICAD9HFkHWk6p3YLPWVgk5Kn6YP9LsBPNbQW
	XwpaLISkXahwXbKUVx80jKK4aI37lG0kgGTzsMXJQhrk9BCpxHBEqXG8GEf3u97DhWWRMohbk876B
	cLjhWO3AIVEqwtTcfExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUWD-00000009ZAZ-3fvs;
	Wed, 27 Mar 2024 14:44:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUW9-00000009Z7l-44fk;
	Wed, 27 Mar 2024 14:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF582CE250F;
	Wed, 27 Mar 2024 14:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463CDC433C7;
	Wed, 27 Mar 2024 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711550679;
	bh=YSLGb1GXTxnIIfhyIvC9GwAUZFGWgRDDFdTmlm4yRqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HaYZUqiJa07VEuOX2hUbqIVTlZ8o22sLnSNBmDvYGZReqgO3lSbCQK9Or5zp1KJbR
	 JvGvc2ZghpWxbzW5dcHWLkdtr9WPLtyBcYNZCtzYkZ0aehioYwzIa2QQF4Onnok8FB
	 Wc4M/AdTqe1cmI5ouLQdACNeTQWP2vIBDKBtvzYFRBk3qaqst4TyhFgm3+FAsIAsGT
	 mP0xgnOjCX2lX877lT3Jl7cBjQZe+yHaVUg+5xWuYNjiWEBCoNJyKr1tugz+G9vCSC
	 fo6IjfObk8UjT+1n6kvF1dQ0obJmvxfW9gBCQkbrMpth/5YtLWt0cnhdydB5wLkqq1
	 8N6oSbYrk2HYQ==
Date: Wed, 27 Mar 2024 14:44:31 +0000
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
	netdev@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v2 12/14] sh: Add support for suppressing warning
 backtraces
Message-ID: <20240327144431.GL403975@kernel.org>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-13-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325175248.1499046-13-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_074442_409311_7E795589 
X-CRM114-Status: GOOD (  20.61  )
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

On Mon, Mar 25, 2024 at 10:52:46AM -0700, Guenter Roeck wrote:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
> 
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because __func__
> is not a define but a virtual variable).
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> 
>  arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
> index 05a485c4fabc..470ce6567d20 100644
> --- a/arch/sh/include/asm/bug.h
> +++ b/arch/sh/include/asm/bug.h
> @@ -24,21 +24,36 @@
>   * The offending file and line are encoded in the __bug_table section.
>   */
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> +
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	"\t.long %O2\n"
> +#else
> +# define __BUG_FUNC_PTR
> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> +

Hi Guenter,

a minor nit from my side: this change results in a Kernel doc warning.

     .../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY(). Prototype was for HAVE_BUG_FUNCTION() instead

Perhaps either the new code should be placed above the Kernel doc,
or scripts/kernel-doc should be enhanced?

>  #define _EMIT_BUG_ENTRY				\
>  	"\t.pushsection __bug_table,\"aw\"\n"	\
>  	"2:\t.long 1b, %O1\n"			\
> -	"\t.short %O2, %O3\n"			\
> -	"\t.org 2b+%O4\n"			\
> +	__BUG_FUNC_PTR				\
> +	"\t.short %O3, %O4\n"			\
> +	"\t.org 2b+%O5\n"			\
>  	"\t.popsection\n"
>  #else
>  #define _EMIT_BUG_ENTRY				\
>  	"\t.pushsection __bug_table,\"aw\"\n"	\
>  	"2:\t.long 1b\n"			\
> -	"\t.short %O3\n"			\
> -	"\t.org 2b+%O4\n"			\
> +	"\t.short %O4\n"			\
> +	"\t.org 2b+%O5\n"			\
>  	"\t.popsection\n"
>  #endif
>  
> +#ifdef HAVE_BUG_FUNCTION
> +# define __BUG_FUNC	__func__
> +#else
> +# define __BUG_FUNC	NULL
> +#endif
> +
>  #define BUG()						\
>  do {							\
>  	__asm__ __volatile__ (				\

...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
