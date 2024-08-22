Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8859C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROGNNaH6Xp9lkSsmgVaI1A43LjpZgZNcXcsL+R1ylAM=; b=cmI+Rex27x/iLv
	EJNUUa5UO2S7/dKWuZDxKjrLoRdbaSM3WylmvQlaVH0t3Rck0LHn5k08MpjsJDWfcORODBhz32xlu
	sCEdHwvAHa94JeuBJVp4PCbU+DzgAcpD4eDzIMGiBr6sHUZR/kUVakdc5zBHAi/1U/Dop2L1ma5zj
	ZuUqOSNwZxsJ4d3kgxXSc3AJXSd59Gdgfy/KJ0aczE5TkFgr25jWHeUZIO70JnqRHz5ruyZAQBZwp
	lOnO0TA3rxhwbtmWaYGCa3mb+T+0pibS82tLvGZy5Y/nqEUYXMU+iho5ZjlWO3PRvHwmZvmg54DCs
	U2zfxBN1HMJXm0sSnI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh860-0000000D02K-02qu;
	Thu, 22 Aug 2024 13:43:24 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh85v-0000000D00z-2Xse;
	Thu, 22 Aug 2024 13:43:21 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6bf7707dbb6so6016026d6.0;
        Thu, 22 Aug 2024 06:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724334198; x=1724938998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdl67ic8HgEb8M4S4PfeCh58b8P52iTtl7Cnr2VuH+w=;
        b=B6id8SkxfkO++KtSjeQrqMXSEmIwH9ONMXwkhUKfJKmqgcxlWGoGzvNa1zfs63FvQ8
         VHq0E7svUHAplzjZE+PL+jHzWfMpzQDYVvKUxuwMV9LfYsaoiHqLI9yYylLYPwNu1ifc
         HlF//O/CFvx9jHHFxbRgXaZH8NEHCn2u1oExVIoBQQFh1bexCjCDd0rvOyIpT6oxV0ql
         qWRSuwbFtpSgIoVxEop5ETGMZh5viyENQS5vcc3FzVoieSkiLILhg9tB6quNEm4v5FYh
         EzVYrsvP5gKIbTt09KEXOpbEfl3jxGGmvEeO2RJoZc41YXvje2UB0iY2GcLeD6KmfLI1
         S8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724334198; x=1724938998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdl67ic8HgEb8M4S4PfeCh58b8P52iTtl7Cnr2VuH+w=;
        b=GqPlG9BSsz98802L3HCy4jvD/OccXmCuqyDvYougBD7/geCcgi3CaczJBh2eRqFz7S
         dIr9TzaPaZ0m4SHUfOvagOwoAP0smoZvi2tLXVH9oVXca4dy9hZNvIImDAdL5J1el+w+
         EpkWX15YBBOwoA/z3S1dblQeyZIb4ymCNMAFJdMH8cX7eXTj+Vjj88NVjVakib52O8hr
         zZ9WzTSOIHbrFoUjzxRmx5oj6Boku7YL4NTWaNw7a6/ONVzZh7Tovqt8gVyNBoy/6S8z
         Mx4M3TAm6/SMdNqJPVxVxFVcDa+/89Xnep6SrMnzClZGklqdiOL3Xy6xaggpzWWAqqfa
         RcrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUma5Hg30Jb5PBglusokSHfk16uiY2ZMp6DgYjeNiTR19MwkJ/lP0RzzQIsa0xORvhDrgW0/IB55nKSvk8=@lists.infradead.org, AJvYcCXwcGFO8nGk8VwMkRzJOnofXFCutYwZp8jRrY6eWrtxMf7skwoXDnGFldAmd06N4sfC3EFSdV77p8K6YryUzp6K@lists.infradead.org
X-Gm-Message-State: AOJu0YzUPk6dEWyWFbUFOTTzd4sKu11HpGZUM6jKZpCoNMMzhUxow8c7
	qZem3Zvd6iPlM+JZIHCdyzWrlYW0TsbPqytw55IXD/O9l5+lLB3h
X-Google-Smtp-Source: AGHT+IHPd/emMpe/HlyJz5A8zoG1MQ2R+I3aFfYWd3NjI3tG1Nm/rfs1sEJSU53wBMynWLouK7H2HQ==
X-Received: by 2002:a05:6214:4613:b0:6bf:6b6e:95b3 with SMTP id 6a1803df08f44-6c160c44047mr68047206d6.1.1724334197887;
        Thu, 22 Aug 2024 06:43:17 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c162d1d242sm7731876d6.16.2024.08.22.06.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 06:43:17 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.nyi.internal [10.202.2.48])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 16C45120006B;
	Thu, 22 Aug 2024 09:43:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 22 Aug 2024 09:43:16 -0400
X-ME-Sender: <xms:dEDHZs-Uu1QrKkiY-oVdLHzWtxqROV2farUj6grkkH4X-fGNWEAUxA>
    <xme:dEDHZktyWpS3ITVw6h89oq81ca9j_3hKKZ_Vq14gZuz-jFubxeBlEOVXSn6gAJ8q3
    ao4D5FFAR4YzSj7jw>
X-ME-Received: <xmr:dEDHZiBktsutJsHa1EDcwS_U3aKQBNlH10nc5Qeqfbb17_kgryGFLlZxeRIwsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvtddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteeh
    uddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeehfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhinhgu
    sghorhhgsehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprghjohhnvghssehvvghnth
    grnhgrmhhitghrohdrtghomhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhn
    uggrthhiohhnrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilh
    drtghomhdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdp
    rhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoh
    eprghprghtvghlsehvvghnthgrnhgrmhhitghrohdrtghomhdprhgtphhtthhopegrrhgu
    sgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:dEDHZsfNAO2KfbEz1kaXZ_nbhnDePpyUV1gRLFjtHVlMaNflg6iZJg>
    <xmx:dEDHZhMs8CPRen4V_NIyCqBFPKnZ4_sN9UCLAWbcQFrM1oVZaahJVg>
    <xmx:dEDHZmlyRrHJ8PnL-3vgbYRcqbaNA4U5IsLMGLpi571JC6kYee4bJA>
    <xmx:dEDHZjueMr_6ePqPIv3LdRePtsn5wEwdSWWYW5z6pFHU6oxEuMb_5g>
    <xmx:dEDHZvsty_NFU9voKfT8TVM2to8A7PqU9JWozXcbc_HkfyMAjmPlXZ-3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Aug 2024 09:43:15 -0400 (EDT)
Date: Thu, 22 Aug 2024 06:43:07 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: a.hindborg@samsung.com, ajones@ventanamicro.com,
	akpm@linux-foundation.org, alex.gaynor@gmail.com,	alexghiti@rivosinc.com,
 aou@eecs.berkeley.edu,	apatel@ventanamicro.com, ardb@kernel.org,
 arnd@arndb.de,	benno.lossin@proton.me, bjorn3_gh@protonmail.com,
 bp@alien8.de,	catalin.marinas@arm.com, chenhuacai@kernel.org,
	conor.dooley@microchip.com, dave.hansen@linux.intel.com,
	gary@garyguo.net, hpa@zytor.com, jbaron@akamai.com,	jpoimboe@kernel.org,
 kernel@xen0n.name, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, maobibo@loongson.cn,	mark.rutland@arm.com,
 mathieu.desnoyers@efficios.com,	maz@kernel.org, mhiramat@kernel.org,
 mingo@redhat.com,	ojeda@kernel.org, oliver.upton@linux.dev,
 palmer@dabbelt.com,	paul.walmsley@sifive.com, peterz@infradead.org,
 rostedt@goodmis.org,	rust-for-linux@vger.kernel.org,
 ryan.roberts@arm.com,	samuel.holland@sifive.com, seanjc@google.com,
 tabba@google.com,	tglx@linutronix.de, ubizjak@gmail.com,
 wedsonaf@gmail.com,	will@kernel.org, x86@kernel.org,
 yangtiezhu@loongson.cn,	zhaotianrui@loongson.cn
Subject: Re: [PATCH v8 1/5 alt] rust: add generic static_key_false
Message-ID: <ZsdAawBhPXojpDA1@boqun-archlinux>
References: <20240822-tracepoint-v8-1-f0c5899e6fd3@google.com>
 <20240822-tracepoint-v8-1b-f0c5899e6fd3@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822-tracepoint-v8-1b-f0c5899e6fd3@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_064319_676891_5C47B601 
X-CRM114-Status: GOOD (  30.29  )
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

On Thu, Aug 22, 2024 at 12:08:07PM +0000, Alice Ryhl wrote:
> Add just enough support for static key so that we can use it from
> tracepoints. Tracepoints rely on `static_key_false` even though it is
> deprecated, so we add the same functionality to Rust.
> 
> This patch only provides a generic implementation without code patching
> (matching the one used when CONFIG_JUMP_LABEL is disabled). Later
> patches add support for inline asm implementations that use runtime
> patching.
> 
> When CONFIG_JUMP_LABEL is unset, `static_key_count` is a static inline
> function, so a Rust helper is defined for `static_key_count` in this
> case. If Rust is compiled with LTO, this call should get inlined. The
> helper can be eliminated once we have the necessary inline asm to make
> atomic operations from Rust.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
> This is an alternate version of patch 1 that resolves the conflict with
> https://lore.kernel.org/all/20240725183325.122827-7-ojeda@kernel.org/
> 
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/helpers.c          |  1 +
>  rust/helpers/tracepoint.c       | 18 ++++++++++++++++++
>  rust/kernel/jump_label.rs       | 29 +++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |  1 +
>  5 files changed, 50 insertions(+)
>  create mode 100644 rust/helpers/tracepoint.c
>  create mode 100644 rust/kernel/jump_label.rs
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index ae82e9c941af..e0846e7e93e6 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -14,6 +14,7 @@
>  #include <linux/ethtool.h>
>  #include <linux/firmware.h>
>  #include <linux/jiffies.h>
> +#include <linux/jump_label.h>
>  #include <linux/mdio.h>
>  #include <linux/phy.h>
>  #include <linux/refcount.h>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 173533616c91..5b17839de43a 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -20,6 +20,7 @@
>  #include "slab.c"
>  #include "spinlock.c"
>  #include "task.c"
> +#include "tracepoint.c"
>  #include "uaccess.c"
>  #include "wait.c"
>  #include "workqueue.c"
> diff --git a/rust/helpers/tracepoint.c b/rust/helpers/tracepoint.c
> new file mode 100644
> index 000000000000..02aafb2b226f
> --- /dev/null
> +++ b/rust/helpers/tracepoint.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for tracepoints. At the moment, helpers are only needed when
> + * CONFIG_JUMP_LABEL is disabled, as `static_key_count` is only marked inline
> + * in that case.
> + *
> + * Copyright (C) 2024 Google LLC.
> + */
> +
> +#include <linux/jump_label.h>
> +
> +#ifndef CONFIG_JUMP_LABEL
> +int rust_helper_static_key_count(struct static_key *key)
> +{
> +	return static_key_count(key);
> +}
> +#endif
> diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
> new file mode 100644
> index 000000000000..011e1fc1d19a
> --- /dev/null
> +++ b/rust/kernel/jump_label.rs
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 Google LLC.
> +
> +//! Logic for static keys.
> +//!
> +//! C header: [`include/linux/jump_label.h`](srctree/include/linux/jump_label.h).
> +
> +/// Branch based on a static key.
> +///
> +/// Takes three arguments:
> +///
> +/// * `key` - the path to the static variable containing the `static_key`.
> +/// * `keytyp` - the type of `key`.
> +/// * `field` - the name of the field of `key` that contains the `static_key`.
> +///
> +/// # Safety
> +///
> +/// The macro must be used with a real static key defined by C.
> +#[macro_export]
> +macro_rules! static_key_false {
> +    ($key:path, $keytyp:ty, $field:ident) => {{
> +        let _key: *const $keytyp = ::core::ptr::addr_of!($key);
> +        let _key: *const $crate::bindings::static_key = ::core::ptr::addr_of!((*_key).$field);
> +
> +        $crate::bindings::static_key_count(_key.cast_mut()) > 0
> +    }};
> +}
> +pub use static_key_false;
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 274bdc1b0a82..91af9f75d121 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -36,6 +36,7 @@
>  pub mod firmware;
>  pub mod init;
>  pub mod ioctl;
> +pub mod jump_label;
>  #[cfg(CONFIG_KUNIT)]
>  pub mod kunit;
>  #[cfg(CONFIG_NET)]
> -- 
> 2.46.0.184.g6999bdac58-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
