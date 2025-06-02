Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376B9C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 17:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iTaE/l8JiBVyY+eOaOzYEXzQFB5uCQ7pNsI2XEixb1E=; b=RAe/jNupXXrpdf+ucgx99jTXY2
	LPusDBivgL6+NTeAN61WYY4mFMNmLOMcuLwj8kSnsg5p6E81Gs5fz0EVmqnywMhfgKEQKRbsGxdVE
	TfIQ9URfBTsvJvbseVB9PilsvvQRQxMocw+YpaPd3O3dTH1kqURK2h+sNA0L4KomoCHPRWWx5vJ/D
	IQysE6lUC0ow9AuM0KtlcVLYqoKLBVfXh5aZxxDROpjUiTivKlcEAQA9zghlGXBWzlX/8OZ1NCW5N
	EXS5u0b3A/tbBLU3ZIg3iGhRyeDGarztGsgGufAqhfPf+lbRFqDK4Jyne7PsdfHmopGcV5E4NjmY0
	ClMPYfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM93b-0000000841d-26VN;
	Mon, 02 Jun 2025 17:34:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM93Y-0000000840g-2jqS
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 17:34:42 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3277196b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1748885679; x=1749490479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7Ht/H1UyIPcdQ8V1ElKnvDOHVJ4Pkco8wdtlvd6pYM=;
        b=htE+mLaNSs3SzRme60ey799A7WEObbDVDu3yTv/1w3rYh1Y2XiirAdcVwU17T+8QLa
         GpUiDj5+eCFZCCofCn48eZ8HyngkI25U0X+oVAb8Ew1UHojldpqRHlHcp7nqEaySdMGP
         8dIW4+sELBzuy/pctAqp1HAFGHGVNyAVWT5FUT7ZkxRBC3mdk65H1ySU9CsSoki08cD8
         nz5ydMUmTiFUMR+v34/3cXbzMtBDTEvqCUHr/SjOzpZMJYT9n+vy4cc8882RCqjFEotV
         1IPnKjUK7Drmet3+/0IGyN18fzd60u1Kf49EAj5o+aic1dQuV8C7bDe+YlYB3Hrppehx
         xZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748885679; x=1749490479;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7Ht/H1UyIPcdQ8V1ElKnvDOHVJ4Pkco8wdtlvd6pYM=;
        b=ZuroXoenEK/VjFtdAJ8CXjSmUu18ha26x1IzHTcYN/d8VEybtAXS6/Wb7AvfPpnLHw
         /jfDD6Jcs2cldlIT5Hq5jnOvTO+l9WY/RnMuafQJ8ePolVVdklh/ULmXhotZsxs3WsgT
         SHpo6N4kG60XVDgaKxiHs0/JosIAsUJEdd2uHNSRoju8WYZ8sH1gEPeNhv8Del7x2yNO
         EvtHQsGoS3WtW63o4EASueMUX/N4Q1lfMQqFt4YQp4JV1HljH+3ufr3QANlzdwRwKgRQ
         L5aH1jbmdM7SJr5zsT3wJ6V3XOi9UrK4NYo4cdV9228Nt+jZlupXqbPZZg+qDr2/eD8B
         29Rg==
X-Gm-Message-State: AOJu0YwLTO2L7AjCknR0F5mRGyR7XRJe9604CMHSIvv+i5rhQGhLdnoP
	a3jHKzXMzjfbYuOX3vVmRcqG0Ub+orsgu7NKbV3t2WhpkhqPXXVdAgPqe6SD1+AhD4VzEOoLuJA
	iUKpf
X-Gm-Gg: ASbGncttViJzCs6PYc063qZZO5choVpuugAt2ZGzFlh4RYo8sVaeONIeSqvWRBLIE5/
	UauL1ROO50XivYojJxeQMJ+btiyrfRppYMcYn31yUYDU+E0LELCNjmnWOtJX/tn0ugruHg3V6xP
	GftI03MRtbRBWq50Bcqk+8f4ddp9QJ5pc/FxSjbP5GslCe7mKpafv9rKcUcqLxZ7CRCMYo1u0ZM
	RqDdd9toQUMQigpvAg3S7ZllZPslxSrEee7ARLiYnY1lK3xMCnRGtYXGvAnMPXD+lKE8ZtYQiKn
	fNGBRAl8wPXxFhOYqc+DFq578vBrZjmNXWM8EzD0qHLxD4CxnuI3qNSvCqDBqXh5Gg==
X-Google-Smtp-Source: AGHT+IHqk9sd8MgQO/+IV1VsVTOXgNTdAhQ/UWef75Kdpm/xKRHH/Gr5dTE83kS0Oroq2nzDth9N/Q==
X-Received: by 2002:a05:6a00:2282:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-747bd9e6baamr17101217b3a.15.1748885679321;
        Mon, 02 Jun 2025 10:34:39 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:e83a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-747afe96943sm7912120b3a.33.2025.06.02.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 10:34:38 -0700 (PDT)
Date: Mon, 02 Jun 2025 10:34:38 -0700 (PDT)
X-Google-Original-Date: Mon, 02 Jun 2025 10:34:34 PDT (-0700)
Subject: Re: [PATCH] Don't worry about a local OpenSSL either
In-Reply-To: <20250602173204.19552-1-palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-6874B4EF-B454-404F-ACF8-37ED6D4037FA@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_103440_693975_279895DF 
X-CRM114-Status: GOOD (  13.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 02 Jun 2025 10:32:04 PDT (-0700), Palmer Dabbelt wrote:
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  .gitmodules        |  3 ---
>  .local/src/openssl |  1 -
>  Makefile           | 57 ++++++++--------------------------------------
>  3 files changed, 9 insertions(+), 52 deletions(-)
>  delete mode 160000 .local/src/openssl
>
> diff --git a/.gitmodules b/.gitmodules
> index b1c74a3..e92e092 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -28,9 +28,6 @@
>  [submodule ".local/src/wireplumber"]
>  	path = .local/src/wireplumber
>  	url = https://gitlab.freedesktop.org/pipewire/wireplumber.git
> -[submodule ".local/src/openssl"]
> -	path = .local/src/openssl
> -	url = https://github.com/openssl/openssl.git
>  [submodule ".local/src/curl"]
>  	path = .local/src/curl
>  	url = https://github.com/curl/curl.git
> diff --git a/.local/src/openssl b/.local/src/openssl
> deleted file mode 160000
> index 293e251..0000000
> --- a/.local/src/openssl
> +++ /dev/null
> @@ -1 +0,0 @@
> -Subproject commit 293e251e6f0367a9aa0d3d46037b19d1a6c91b20
> diff --git a/Makefile b/Makefile
> index 8337efd..a0a90ed 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,11 +1,11 @@
>  SHELL=/bin/bash
>  ENV=PATH="$(abspath .local/bin:$(PATH))" PKG_CONFIG_PATH="$(abspath .local/lib/pkgconfig)"
>  CFLAGS += -O3 -Wall -Werror
> -SYSTEM_LIBDIR = /usr/lib64
> +SYSTEM_LIBDIR = /opt/homebrew/lib
>
>  # Some helper functions
>  gitfiles = $(addprefix $(1),$(shell git -C $(1) ls-files))
> -ppkg-config-deps = $(addprefix .local/lib/pkgconfig/,$(addsuffix .pc,$(shell cat .local/src/$(1)/Configfile |  grep ppkg-config | sed 's/^.*ppkg-config \([A-Za-z0-9-]*\) .*$$/\1/')))
> +ppkg-config-deps = $(addprefix .local/lib/pkgconfig/,$(addsuffix .pc,$(shell cat .local/src/$(1)/Configfile |  grep ppkg-config | grep -v optional | sed 's/^.*ppkg-config \([A-Za-z0-9-]*\) .*$$/\1/')))
>
>  all: \
>  	.local/bin/pconfigure \
> @@ -14,9 +14,6 @@ all: \
>  	.local/lib/libbase64.so \
>  	.local/lib/libpson.so \
>  	.local/bin/mhng-install \
> -	.local/bin/msmtp \
> -	.local/bin/openssl \
> -	$(addprefix .local/bin/,$(notdir $(shell find .local/src/depot_tools/ -maxdepth 1 -type f -executable | grep -v ".py$" | grep -v ".bat$"))) \
>  	$(patsubst .local/src/%.bash,.local/bin/%,$(wildcard .local/src/*.bash)) \
>  	$(patsubst .local/src/%.pl,.local/bin/%,$(wildcard .local/src/*.pl)) \
>  	$(patsubst .local/src/%.c,.local/bin/%,$(wildcard .local/src/*.c))
> @@ -66,8 +63,7 @@ clean::
>
>  .local/bin/pconfigure \
>  .local/bin/pbashc \
> -		: .local/stamp/pconfigure \
> -		  /usr/bin/pkg-config
> +		: .local/stamp/pconfigure
>  	touch -c $@
>
>  # gitdate
> @@ -99,7 +95,7 @@ clean::
>  	date > $@
>
>  .local/lib/libputil-chrono.so \
> -.local/lib/pkg-config/libputil-chrono.pc \
> +.local/lib/pkgconfig/libputil-chrono.pc \
>  : .local/stamp/putil
>  	touch -c $@
>
> @@ -116,7 +112,9 @@ clean::
>  	$(MAKE) -C $(dir $<) install
>  	date > $@
>
> -.local/lib/libpsqlite.so: .local/stamp/psqlite
> +.local/lib/libpsqlite.so \
> +.local/lib/pkgconfig/psqlite.pc \
> +: .local/stamp/psqlite
>  	touch -c $@
>
>  # pson
> @@ -137,10 +135,7 @@ clean::
>
>  # libbase64
>  .local/src/libbase64/Makefile: \
> -		.local/src/libbase64/configure.ac \
> -		/usr/bin/autoreconf \
> -		/usr/bin/makeinfo \
> -		/usr/bin/libtoolize
> +		.local/src/libbase64/configure.ac
>  	env -C $(dir $@) - $(ENV) autoreconf -i
>  	env -C $(dir $@) - $(ENV) ./configure --prefix=$(abspath .local)
>
> @@ -150,24 +145,10 @@ clean::
>  	date > $@
>
>  .local/lib/libbase64.so \
> -.local/lib/pkg-config/libbase64-1.pc \
> +.local/lib/pkgconfig/libbase64-1.pc \
>  : .local/stamp/libbase64
>  	touch -c $@
>
> -# msmtp
> -.local/src/msmtp/Makefile: \
> -		.local/src/msmtp/configure.ac
> -	env -C $(dir $@) - $(ENV) autoreconf -i
> -	env -C $(dir $@) - $(ENV) ./configure --prefix=$(abspath .local)
> -
> -.local/stamp/msmtp: .local/src/msmtp/Makefile
> -	mkdir -p $(dir $@)
> -	$(MAKE) -C $(dir $<) install
> -	date > $@
> -
> -.local/bin/msmtp: .local/stamp/msmtp
> -	touch -c $@
> -
>  # MHng
>  .local/src/mhng/Makefile: \
>  		.local/bin/pconfigure \
> @@ -188,26 +169,6 @@ clean::
>  .local/bin/mhng-%: .local/stamp/mhng
>  	touch -c $@
>
> -# depot_tools
> -$(addprefix .local/bin/,$(notdir $(shell find .local/src/depot_tools/ -maxdepth 1 -type f -executable | grep -v ".py$" | grep -v ".bat$"))): .local/src/depot_tools_wrapper.bash.in
> -	mkdir -p $(dir $@)
> -	cat $^ | sed 's@__TOOL__@$(abspath $(dir $<))/depot_tools/$(notdir $@)@g' > $@
> -	chmod +x $@
> -
> -# openssl
> -.local/src/openssl/Makefile: \
> -		.local/src/openssl/Configure
> -	env -C $(dir $@) - $(ENV) ./config --prefix=$(abspath .local) --openssldir=$(abspath .local)  -Wl,-rpath=$(abspath .local)/lib -Wl,--enable-new-dtags
> -
> -.local/stamp/openssl: .local/src/openssl/Makefile
> -	mkdir -p $(dir $@)
> -	$(MAKE) -C $(dir $<)
> -	$(MAKE) -C $(dir $<) install
> -	date > $@
> -
> -.local/bin/openssl: .local/stamp/openssl
> -	touch -c $@
> -
>  # curl
>  .local/src/curl/Makefile: \
>  		$(call gitfiles,.local/src/curl/)

Oops ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
