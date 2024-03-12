Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8029AC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sk0XzGPJo4eid8gYhoSZbcQhgdMce6fA2KosQEZT8Xk=; b=uz24cmtCFuY8dS
	K9yw6s4mrsmCyf8OWtTDoACi/O31PaA3/GlHeMzIybdxJfIP+dVrRANm+wkFOLXaWyBp7OvNGsxux
	jLF3KOuu1V0Sm+MKMzpoj4tQ8u+OjzoIS0vFLk80tkD4bSFEcdFrRZiLsgygJFg7MR1jYt48RWqN2
	kpfDRlzp+UyK0SzD+UQsMvbIU+eXu8zom0yO4771AJ8DpIjWMRmVG2e83okksJMbrtddWq5PKg9Rv
	HisLLPFLPOi6lbf+hogPBioaEOAoNg2ny6rk6gKFRZLe2U/qxfzHIXto2w0Xqu1Qym6UivGXCNAvj
	gzOlDbjQPetD0AMOmZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkACN-00000007i2S-1IOn;
	Tue, 12 Mar 2024 22:02:15 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkACI-00000007hzt-3uMu
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 22:02:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso3736996b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 15:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710280927; x=1710885727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HfVz/RhW1d+ABxE62vHBaQjSqXe83Qgl8810kDikh7s=;
        b=YvsMA694a1zUS0QhhS9PfdWfJgMLHEXDjrPFMnt7jthUCdbuhjXDTg0AUgaL0LCali
         8kfBMpqdwGP2kIBmQSaJoRj5N4smiVScm6i3ytGSlnFcffXzo+83/xesBCpFH8X6kSJd
         OyVhkJSahpRxlsE3PTwyjke6xPTE8jxqFA45w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710280927; x=1710885727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfVz/RhW1d+ABxE62vHBaQjSqXe83Qgl8810kDikh7s=;
        b=O3UmJr5yqlb8Y7DtrM1tEN3qjjhz0ZbVDRS8AA1deZTVsv7WhoUKbu34wfakiOGJeE
         VJ/Ydz0WdkvpPha8EetTr+If3FxNa/muPbscwaA0o5plgdshHRPTHXs0IVSNdjOY9hlj
         m/ARx1Pk1+RVfAbhpwMQ5PEnL6Rh3aFLBEYAegt43z5kn1HrtFg31tBuckfOSpUdnDEo
         2vlKvCUwF/Ay8i2hj99/nNZdG8yaJX2RNeKHoXfls3XnX2g68PK7fV18wORUuTlVhgoS
         r2PSm0FNK5dobXFil+MaW7PyoWYjwHgKERYzFZZsV/FGWKdK7YuihWERdxSAl4/VtX2B
         HFZw==
X-Forwarded-Encrypted: i=1; AJvYcCX5jQA20/l6IGVVl0jAhowh8iBjbVKMB1OJe2fz2/8gb7rJxRQTcaHHveC/h5AUzrlegSeXkM8qUYN++5w31O7/4r7S1cU6ZDeDzAtlFNyI
X-Gm-Message-State: AOJu0YyWC6nIVjIvUUbjKlWtKPU0egwtKemSqHLedhA4k/q9B+UrracE
	IsRppwAmWw8lrS28qEheDzZlGC7AzAxhW9a84LoG9U6tDxcKPt2j9Wpn0Du69A==
X-Google-Smtp-Source: AGHT+IFaAzHiJbVMwydAnFUAbBGgB4TiVXgXXf4Bmn7UNMuMdpujdzLwHr5uC0yhXwauRYk5a8qmzQ==
X-Received: by 2002:a05:6a00:4fcb:b0:6e6:afa3:7b32 with SMTP id le11-20020a056a004fcb00b006e6afa37b32mr865695pfb.6.1710280926942;
        Tue, 12 Mar 2024 15:02:06 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p35-20020a056a000a2300b006e6ab799457sm1315765pfh.110.2024.03.12.15.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 15:02:06 -0700 (PDT)
Date: Tue, 12 Mar 2024 15:02:05 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@lists.linux.dev
Subject: Re: [PATCH 02/14] kunit: bug: Count suppressed warning backtraces
Message-ID: <202403121501.F7CA06C@keescook>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <20240312170309.2546362-3-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-3-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_150210_983045_C9F5C15D 
X-CRM114-Status: GOOD (  21.10  )
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

On Tue, Mar 12, 2024 at 10:02:57AM -0700, Guenter Roeck wrote:
> Count suppressed warning backtraces to enable code which suppresses
> warning backtraces to check if the expected backtrace(s) have been
> observed.
> 
> Using atomics for the backtrace count resulted in build errors on some
> architectures due to include file recursion, so use a plain integer
> for now.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  include/kunit/bug.h | 7 ++++++-
>  lib/kunit/bug.c     | 4 +++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/kunit/bug.h b/include/kunit/bug.h
> index 1e34da961599..2097a854ac8c 100644
> --- a/include/kunit/bug.h
> +++ b/include/kunit/bug.h
> @@ -20,6 +20,7 @@
>  struct __suppressed_warning {
>  	struct list_head node;
>  	const char *function;
> +	int counter;

Thanks for adding a counter!

>  };
>  
>  void __start_suppress_warning(struct __suppressed_warning *warning);
> @@ -28,7 +29,7 @@ bool __is_suppressed_warning(const char *function);
>  
>  #define DEFINE_SUPPRESSED_WARNING(func)	\
>  	struct __suppressed_warning __kunit_suppress_##func = \
> -		{ .function = __stringify(func) }
> +		{ .function = __stringify(func), .counter = 0 }
>  
>  #define START_SUPPRESSED_WARNING(func) \
>  	__start_suppress_warning(&__kunit_suppress_##func)
> @@ -39,12 +40,16 @@ bool __is_suppressed_warning(const char *function);
>  #define IS_SUPPRESSED_WARNING(func) \
>  	__is_suppressed_warning(func)
>  
> +#define SUPPRESSED_WARNING_COUNT(func) \
> +	(__kunit_suppress_##func.counter)
> +
>  #else /* CONFIG_KUNIT */
>  
>  #define DEFINE_SUPPRESSED_WARNING(func)
>  #define START_SUPPRESSED_WARNING(func)
>  #define END_SUPPRESSED_WARNING(func)
>  #define IS_SUPPRESSED_WARNING(func) (false)
> +#define SUPPRESSED_WARNING_COUNT(func) (0)
>  
>  #endif /* CONFIG_KUNIT */
>  #endif /* __ASSEMBLY__ */
> diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
> index f93544d7a9d1..13b3d896c114 100644
> --- a/lib/kunit/bug.c
> +++ b/lib/kunit/bug.c
> @@ -32,8 +32,10 @@ bool __is_suppressed_warning(const char *function)
>  		return false;
>  
>  	list_for_each_entry(warning, &suppressed_warnings, node) {
> -		if (!strcmp(function, warning->function))
> +		if (!strcmp(function, warning->function)) {
> +			warning->counter++;
>  			return true;
> +		}
>  	}
>  	return false;
>  }
> -- 
> 2.39.2
> 

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
