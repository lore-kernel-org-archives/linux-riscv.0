Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358C8C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7ovhAfKizZpUQ8qLNbGQnRc3aWia9ytYjyVB2S0XWM=; b=S+XGkn3B0O1J/M
	M3j4y7cOC6EKARbHUvOaBJRZTKE0lUduP5G4UGCE0liU+gFiFSsC7/b7WEO36R1Y8lDYEl4ky+INw
	0nDeYaHj7vFtErhU8hw0dxD0+TEb6hmtWJafPO87rcCWe3R2dofQpx53R3U6Wb0o+KPPJRzIhu2W8
	Ew3epuTsXpS7t0QKXzleuSMlbSs8H3xcnQPqWIcSjmUzfMCfDEyoCM4AYKrUA4EV6dewDfXWBEcKd
	ShqBGFHu69m+8ZGGiO6k8YeDCOBTUkkBCocOyg4by/RVtJ+Z4jU56mYkJmz2G2FWPksBITSXqD+9T
	IPafGtT3BrqSWKVZic/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPOGD-0000000Dfxn-1kdB;
	Thu, 04 Jul 2024 15:20:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPOGA-0000000Dfvd-2pu8
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 15:20:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f4a5344ec7so5557765ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 08:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720106429; x=1720711229; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMtQ8G7gYG0PtXSm+9oSte5ras/tptARhMk8vAyTBpM=;
        b=y64DtX3AwNtme7qyUGQdHeJdTwwGqGTVma0Ena3aWPvFcC9Lf0Mcl/FkYyeWjHBtvL
         3wDS89FwMjUudxUhQPilRk/q8S16u0uneAdu5BU7NKnZzq2D80ywTN3FVVvp87QH//dF
         IxmbfjGLyQiNnRHDPiHj78WP3I+VzmWtUmBAeZNcjGVqMpT1Ot/yCEq0+sfFJMJw8WVJ
         +aF8cYnRewggbk1EFN7IXkSH5ouZ58JeoRH8pxg/jRS9IMOtJK3+US5+sSFotLY+bf0Z
         j5kW1VY/RbadphEuzVzRQOka3xvzkAGz+Tp4K3M7BsFsSW5h3wzmWOpJd2hvBrwfllqp
         tk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106429; x=1720711229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMtQ8G7gYG0PtXSm+9oSte5ras/tptARhMk8vAyTBpM=;
        b=cmTvddKkYG7w9rZFoHzJgqe2JFPgMXaftZOO62hk6+xanOskJY8cyxzi2HEp6P4Po1
         HlVPEOGKBf0zL1HYZ03cP0OObCXuve8zPE4Ck+kQo76Ev6+5waFG/4ZdnGy28UAa6GBE
         2iCR+lQKxleeR4BobGKfUoyjXPOfJ519Q1/Yn073ugpc9zhjCWYff+kYP4QO/9oFvoga
         KXZM3lKnSXD1bgdJTf+CqWSSY+67KgMJcQoeR2d/LA90d29dGWDN9vfLwqNTUmbzIiQM
         hpta6I9KNTP2JJCW4oRjUTY1E6N/6FTPWHaxPJ+0dfVLEl6ep8HxYNBFc9AqhOcNLpIu
         ZKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvAMn9BosqJlo8Yn140L5H6g+tEL7P9nn4Bty53hQfr0nJqY/EjC2mPtJueoeIxeAS3bbJPmHDtAE93SwsQoI9prlG33Fhxdur69i0j2tN
X-Gm-Message-State: AOJu0Ywn2ctZ9rRHMtLU4aysauEL70b9RqSG3G1oI7EppqLW97PTGeNG
	xnDRJ+xrwCWSN0MO2WPeHiPhywjlVcLrHHIZAc8lGF4bZ8yEFHNB+FDekblW4Q==
X-Google-Smtp-Source: AGHT+IGCoEg+2iwgq2yFecGonukG4K9qxoer7A69funkZsv0Vc/pIw4JkTQQWYN93RAWKE9BO0pBlQ==
X-Received: by 2002:a17:902:dacd:b0:1fa:1a78:b5a9 with SMTP id d9443c01a7336-1fb3700ccffmr27138855ad.3.1720106429108;
        Thu, 04 Jul 2024 08:20:29 -0700 (PDT)
Received: from google.com (201.215.168.34.bc.googleusercontent.com. [34.168.215.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15388bdsm124081885ad.168.2024.07.04.08.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:20:28 -0700 (PDT)
Date: Thu, 4 Jul 2024 15:20:24 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Peter Zijlstra (Intel)" <peterz@infradaed.org>,
	Sean Christopherson <seanjc@google.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v4 2/2] rust: add tracepoint support
Message-ID: <Zoa9uMODCjTfM741@google.com>
References: <20240628-tracepoint-v4-0-353d523a9c15@google.com>
 <20240628-tracepoint-v4-2-353d523a9c15@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240628-tracepoint-v4-2-353d523a9c15@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_082034_735968_A30CD9A2 
X-CRM114-Status: GOOD (  22.88  )
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

On Fri, Jun 28, 2024 at 01:23:32PM +0000, Alice Ryhl wrote:
> Make it possible to have Rust code call into tracepoints defined by C
> code. It is still required that the tracepoint is declared in a C
> header, and that this header is included in the input to bindgen.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  include/linux/tracepoint.h      | 18 +++++++++++++++-
>  include/trace/define_trace.h    | 12 +++++++++++
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/lib.rs              |  1 +
>  rust/kernel/tracepoint.rs       | 47 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
> index 689b6d71590e..d82af4d77c9f 100644
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -238,6 +238,20 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
>  #define __DECLARE_TRACE_RCU(name, proto, args, cond)
>  #endif
>  
> +/*
> + * Declare an exported function that Rust code can call to trigger this
> + * tracepoint. This function does not include the static branch; that is done
> + * in Rust to avoid a function call when the tracepoint is disabled.
> + */
> +#define DEFINE_RUST_DO_TRACE(name, proto, args)
> +#define DEFINE_RUST_DO_TRACE_REAL(name, proto, args)			\
nit: IMO using a __* prefix would be a better option to describe the
internal use of the macro instead of the _REAL suffix.

Other than that, this patch looks good to me:

Reviewed-by: Carlos Llamas <cmllamas@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
