Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8E8C52D7C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 17:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BpeHNMq7ntXQwnboonZDyM2dpPab37iH2DPhpLFJI0=; b=K6qo4yctyhBdOe
	23zMCs82GYIR51TJf73nYhQuXh7l2lSZ4QsHhBdQ0ds0PTr/cIx+8MBNFVnYY1MTXWSfs99WwQOZ1
	WMDl7BHxMFRWO2Mvaa3h0Bo66M00btwyAatOsTPRxDiU6b9+hqGMgIlOD44OpYT2C5HRApgbylXMM
	Yn5BVYEGPImtO9C4hBfzD1DZxy3WPzwy58sut+hloFcmJ/+vVfQmODX4z5GM5rcdO70sp5HfzyWHw
	akH0ov7UL9HioRFZap0To2Lmn4RgXdEhJCVg0gEsmlYkepYM63KaoGI/CYBtCF/PrDpTufPRn+X9r
	I6BKF5SsPWHk/VvnIJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgoox-00000009s2R-20pO;
	Wed, 21 Aug 2024 17:08:31 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgoot-00000009s1N-2TjA;
	Wed, 21 Aug 2024 17:08:29 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7a1d024f775so504969785a.2;
        Wed, 21 Aug 2024 10:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724260106; x=1724864906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WItMaeY5hi8+K3FTWN8onrZqOVRFgwo42FK4ki6Up7k=;
        b=ibEQ6TGubbJo3sXt6kZRNRHsuWDMoJ24nXMkE215bsmon2zXief7vN9t/XO/u2d8d+
         LQB7JdF9odB8nYGR3rnZtEjKc5VXdimOsmk2NSRX3s5c3fDlPlNYvraG/1bKm+lptKVT
         dCMfo1alGEUykLXWVvmz9rE0AbPe7RyMhjFhuq/CozIKbC3yWBG97+It8jCV7ArV67pi
         b4kGRhqXm4gPMNONTl4aXpnOnFh6AI+ps0yUnx9ELAAAQ0SPv+59RjXQr45jLEOMmQKb
         zIHP3ZaqufUEdEfTu+zWE/iFiFlyIHJsXT8eVr+oP38xc+WSElJJ4Gfo4rC5/EyMc+NC
         GGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724260106; x=1724864906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WItMaeY5hi8+K3FTWN8onrZqOVRFgwo42FK4ki6Up7k=;
        b=UtJCEfRTlqlD7R2srrC4ba4I6NSP33EENFhjwFQ7HPsp6Lc8o34SyU9mWE9UimedOh
         9t1a1aXCracsKx5Li2euPAc1PvRyvkUM/+TGEoeRZpYemJalicnr8Ph6bLKPG8iHRX/s
         uKuxO+EmBT60ragLN0bwvx14i2Y/j4C4kJzYS/8HN3wtFUmph+JMKRPDZgVCDxElOouZ
         gc1i3qXJ3KQtGzsDZpxHbXyyKAeghJtflQm6PgTCCUj2axKqiQ3hcnFwCATVR07s7oUV
         YGaDpEzvS+n7pSil1mVpFWyjPAp0WeirMk+owNCSLhKwpLwK6AgGDs5kTvCDw/UNtmn1
         s1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDRf1TPv4a31IAUAUbDQAqWQ8J2Ps1O/OmnbK7UZxX2HMxGWnN0xhv1aH+V5sY9mTPdOHkckJ5i4QGo2/D5sRv@lists.infradead.org, AJvYcCWhVcekAhRaCW8NAsYgsnLJBX/RXomJdSA7TlbaDS1OlrcP6TG6r20il2DWBgAVBvNh4o2UrzTBBI1hK9E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDfnKz0TSI7Rz20yBzJM5AzsgCD3UrZX6HVOqglbLBkpZfJJsS
	Qm44wWY/VyE21Aqqb7M8toJ/3BeHKLNzZ+VE2DOuFHuhEFiYqIba
X-Google-Smtp-Source: AGHT+IHloTpPhwBJcAwCjVbulS24eS8+KaU3vw0LVPvn/6e7Y0C/8iW0lYK/XMYHaaRgSg14m0g3jA==
X-Received: by 2002:a05:620a:3953:b0:79e:e302:7392 with SMTP id af79cd13be357-7a674047d68mr352917585a.32.1724260105540;
        Wed, 21 Aug 2024 10:08:25 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff0e0982sm641638485a.98.2024.08.21.10.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 10:08:24 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 662A01200043;
	Wed, 21 Aug 2024 13:08:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 21 Aug 2024 13:08:23 -0400
X-ME-Sender: <xms:Bx_GZmzlhgzQJVimnzAq8DxkpCEEKpKZnGHwldoYfUXdg3qTwPgi8A>
    <xme:Bx_GZiTTFPe4MJvfGmjNx0AxL4-1ZD7TswYcaddbnjYZldyUG9Pt2OppqcYIOguY1
    JQGMFB0T-nQcxFySw>
X-ME-Received: <xmr:Bx_GZoWWIL7HXb49O-zcMWQoYmpV9g2_DBlD_yAMWBvba-oDlVDwgairALU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddukedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdortddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepjeelveeguddvheehvddvkeegvdehgfejhedu
    geejtedtheekleehieefvdeulefgnecuffhomhgrihhnpehrshdrshgsnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhm
    thhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvd
    dqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhn
    sggprhgtphhtthhopeehfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlih
    gtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghho
    ohgumhhishdrohhrghdprhgtphhtthhopehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepmhgrthhhihgvuhdruggvshhnohihvghrshesvghffhhitghiohhs
    rdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtohepjhhpohhimhgsohgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggr
    rhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Bx_GZsgAm5iZZrnJVUpKXpZr02SBSmpFjeWNFwzhlqgPdEzrefaVfA>
    <xmx:Bx_GZoDJVqHQjTYl6ZVUyugDuuzBW8gqsXd5uzJaI4CsR11L3Ba1CQ>
    <xmx:Bx_GZtJn4-2Fu9KRHH7nM-ozEKYWsqeAxcj9IWJ29R77P7_zxK83Vw>
    <xmx:Bx_GZvBxT92fkYDS8tuxiscs6WnAoGuTqsD2n-cO7I1ATfN7cRCR9A>
    <xmx:Bx_GZgzwIc3BoB_vKKok2EbMxkKW9NG_NhxnFRf9dZN79pUet8in8PZ5>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Aug 2024 13:08:22 -0400 (EDT)
Date: Wed, 21 Aug 2024 10:08:16 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,	Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>,	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>,	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,	Ryan Roberts <ryan.roberts@arm.com>,
 Fuad Tabba <tabba@google.com>,	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v7 5/5] rust: add arch_static_branch
Message-ID: <ZsYfAFrBFVewchGM@boqun-archlinux>
References: <20240816-tracepoint-v7-0-d609b916b819@google.com>
 <20240816-tracepoint-v7-5-d609b916b819@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240816-tracepoint-v7-5-d609b916b819@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_100827_664267_9CE7A40A 
X-CRM114-Status: GOOD (  35.30  )
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

On Fri, Aug 16, 2024 at 11:07:42AM +0000, Alice Ryhl wrote:
> To allow the Rust implementation of static_key_false to use runtime code
> patching instead of the generic implementation, pull in the relevant
> inline assembly from the jump_label.h header by running the C
> preprocessor on a .rs.S file. Build rules are added for .rs.S files.
> 
> Since the relevant inline asm has been adjusted to export the inline asm
> via the ARCH_STATIC_BRANCH_ASM macro in a consistent way, the Rust side
> does not need architecture specific code to pull in the asm.
> 
> It is not possible to use the existing C implementation of
> arch_static_branch via a Rust helper because it passes the argument
> `key` to inline assembly as an 'i' parameter. Any attempt to add a C
> helper for this function will fail to compile because the value of `key`
> must be known at compile-time.
> 
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/Makefile                           |  5 ++-
>  rust/kernel/.gitignore                  |  3 ++
>  rust/kernel/arch_static_branch_asm.rs.S |  7 ++++
>  rust/kernel/jump_label.rs               | 64 ++++++++++++++++++++++++++++++++-
>  rust/kernel/lib.rs                      | 30 ++++++++++++++++
>  scripts/Makefile.build                  |  9 ++++-
>  6 files changed, 115 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index 199e0db67962..277fcef656b8 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -14,6 +14,8 @@ CFLAGS_REMOVE_helpers.o = -Wmissing-prototypes -Wmissing-declarations
>  always-$(CONFIG_RUST) += libmacros.so
>  no-clean-files += libmacros.so
>  
> +always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/arch_static_branch_asm.rs
> +
>  always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
>  obj-$(CONFIG_RUST) += alloc.o bindings.o kernel.o
>  always-$(CONFIG_RUST) += exports_alloc_generated.h exports_bindings_generated.h \
> @@ -409,7 +411,8 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
>  $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
>      --extern build_error --extern macros --extern bindings --extern uapi
>  $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
> -    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
> +    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o \
> +	$(obj)/kernel/arch_static_branch_asm.rs FORCE
>  	+$(call if_changed_rule,rustc_library)
>  
>  endif # CONFIG_RUST
> diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
> new file mode 100644
> index 000000000000..d082731007c6
> --- /dev/null
> +++ b/rust/kernel/.gitignore
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +/arch_static_branch_asm.rs
> diff --git a/rust/kernel/arch_static_branch_asm.rs.S b/rust/kernel/arch_static_branch_asm.rs.S
> new file mode 100644
> index 000000000000..9e373d4f7567
> --- /dev/null
> +++ b/rust/kernel/arch_static_branch_asm.rs.S
> @@ -0,0 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/jump_label.h>
> +
> +// Cut here.
> +
> +::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM("{symb} + {off} + {branch}", "{l_yes}"))
> diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
> index 011e1fc1d19a..7757e4f8e85e 100644
> --- a/rust/kernel/jump_label.rs
> +++ b/rust/kernel/jump_label.rs
> @@ -23,7 +23,69 @@ macro_rules! static_key_false {
>          let _key: *const $keytyp = ::core::ptr::addr_of!($key);
>          let _key: *const $crate::bindings::static_key = ::core::ptr::addr_of!((*_key).$field);
>  
> -        $crate::bindings::static_key_count(_key.cast_mut()) > 0
> +        #[cfg(not(CONFIG_JUMP_LABEL))]
> +        {
> +            $crate::bindings::static_key_count(_key.cast_mut()) > 0
> +        }
> +
> +        #[cfg(CONFIG_JUMP_LABEL)]
> +        $crate::jump_label::arch_static_branch! { $key, $keytyp, $field, false }
>      }};
>  }
>  pub use static_key_false;
> +
> +/// Assert that the assembly block evaluates to a string literal.
> +#[cfg(CONFIG_JUMP_LABEL)]
> +const _: &str = include!("arch_static_branch_asm.rs");

Have you try this with "make O=<dir>"? I hit the following issue, but I
am rebasing on rust-dev, so I might miss something:

	error: couldn't read ../rust/kernel/arch_static_branch_asm.rs: No such file or directory (os error 2)
	  --> ../rust/kernel/jump_label.rs:39:17
	   |
	39 | const _: &str = include!("arch_static_branch_asm.rs");
	   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	   |
	   = note: this error originates in the macro `include` (in Nightly builds, run with -Z macro-backtrace for more info)

	error: aborting due to 1 previous error	

Regards,
Boqun

> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(CONFIG_JUMP_LABEL)]
> +#[cfg(not(CONFIG_HAVE_JUMP_LABEL_HACK))]
> +macro_rules! arch_static_branch {
> +    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
> +        $crate::asm!(
> +            include!(concat!(env!("SRCTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
> +            l_yes = label {
> +                break 'my_label true;
> +            },
> +            symb = sym $key,
> +            off = const ::core::mem::offset_of!($keytyp, $field),
> +            branch = const $crate::jump_label::bool_to_int($branch),
> +        );
> +
> +        break 'my_label false;
> +    }};
> +}
> +
> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(CONFIG_JUMP_LABEL)]
> +#[cfg(CONFIG_HAVE_JUMP_LABEL_HACK)]
> +macro_rules! arch_static_branch {
> +    ($key:path, $keytyp:ty, $field:ident, $branch:expr) => {'my_label: {
> +        $crate::asm!(
> +            include!(concat!(env!("SRCTREE"), "/rust/kernel/arch_static_branch_asm.rs"));
> +            l_yes = label {
> +                break 'my_label true;
> +            },
> +            symb = sym $key,
> +            off = const ::core::mem::offset_of!($keytyp, $field),
> +            branch = const 2 | $crate::jump_label::bool_to_int($branch),
> +        );
> +
> +        break 'my_label false;
> +    }};
> +}
> +
> +#[cfg(CONFIG_JUMP_LABEL)]
> +pub use arch_static_branch;
> +
> +/// A helper used by inline assembly to pass a boolean to as a `const` parameter.
> +///
> +/// Using this function instead of a cast lets you assert that the input is a boolean, and not some
> +/// other type that can also be cast to an integer.
> +#[doc(hidden)]
> +pub const fn bool_to_int(b: bool) -> i32 {
> +    b as i32
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index d00a44b000b6..9e9b95ab6966 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -145,3 +145,33 @@ macro_rules! container_of {
>          ptr.sub(offset) as *const $type
>      }}
>  }
> +
> +/// Helper for `.rs.S` files.
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! concat_literals {
> +    ($( $asm:literal )* ) => {
> +        ::core::concat!($($asm),*)
> +    };
> +}
> +
> +/// Wrapper around `asm!` that uses at&t syntax on x86.
> +// Uses a semicolon to avoid parsing ambiguities, even though this does not match native `asm!`
> +// syntax.
> +#[cfg(target_arch = "x86_64")]
> +#[macro_export]
> +macro_rules! asm {
> +    ($($asm:expr),* ; $($rest:tt)*) => {
> +        ::core::arch::asm!( $($asm)*, options(att_syntax), $($rest)* )
> +    };
> +}
> +
> +/// Wrapper around `asm!` that uses at&t syntax on x86.
> +// For non-x86 arches we just pass through to `asm!`.
> +#[cfg(not(target_arch = "x86_64"))]
> +#[macro_export]
> +macro_rules! asm {
> +    ($($asm:expr),* ; $($rest:tt)*) => {
> +        ::core::arch::asm!( $($asm)*, $($rest)* )
> +    };
> +}
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 72b1232b1f7d..59fe83fba647 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -263,12 +263,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  # Compile Rust sources (.rs)
>  # ---------------------------------------------------------------------------
>  
> -rust_allowed_features := new_uninit
> +rust_allowed_features := asm_const,asm_goto,new_uninit
>  
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree
>  # modules case.
>  rust_common_cmd = \
> +	SRCTREE=$(abspath $(srctree)) \
>  	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
>  	-Zallow-features=$(rust_allowed_features) \
>  	-Zcrate-attr=no_std \
> @@ -318,6 +319,12 @@ quiet_cmd_rustc_ll_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
>  $(obj)/%.ll: $(obj)/%.rs FORCE
>  	+$(call if_changed_dep,rustc_ll_rs)
>  
> +quiet_cmd_rustc_rs_rs_S = RSCPP $(quiet_modtag) $@
> +      cmd_rustc_rs_rs_S = $(CPP) $(c_flags) -xc -C -P $< | sed '1,/^\/\/ Cut here.$$/d' >$@
> +
> +$(obj)/%.rs: $(obj)/%.rs.S FORCE
> +	+$(call if_changed_dep,rustc_rs_rs_S)
> +
>  # Compile assembler sources (.S)
>  # ---------------------------------------------------------------------------
>  
> 
> -- 
> 2.46.0.184.g6999bdac58-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
