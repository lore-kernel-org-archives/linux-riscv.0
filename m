Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C6BCC6B39
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zsyd+sxKFKLVt2G98CWuqZW8LU4cqk2dGVcM88JATQ4=; b=XMbHtS5q0n6ZZB
	bjlr+HKtD4ipIy7ewLB8W5RLFO5GmUjG3On+BzhWXkz+kUHJCVemieqbu+cMwujbI4fQrFbPWpPBC
	dug3B6+73VoQKrHibyKAwjj/sAG4e1+Cpp3vSrYuGNZIom1LLHSxrMSkg0MvOgixpz+QXby0HwMmA
	P10HDKAP61E71L4xday4DIjg90rWqxfD6M/nvxvtJtYiYv+k2ezQD9DAgBuwBcJkk+jOJbjhav7Md
	SgoB0ILGoy3D4j0Aw4LbzzHfZRGl3Rd+KrLij/QZftjFATPdIo8ewNzVUhboK7rymvdQWbT2wBQVQ
	ojVGOuIxtdiE8gcYWfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNbc-00000000b9O-30UW;
	Thu, 15 Oct 2026 15:42:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNbW-00000000b7l-11vz
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 15:42:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so43164605e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 08:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792078967; x=1792683767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EVUVXTF9B/pmjVEVo0zfJaBGiZoNVg7V5lse2RyO7M=;
        b=cQMvStURwczQ4qNDDBqWh+tKfrY89kGtdx/TRjv7R3kNvC3QlzYY2lyQGxjlMlZwut
         ZbWLIZ4DAf2JzJyActRsHtnj+M0E3CLQ15WWJlwTDNR3TQ6Fs9uGEkD/V2bwqQXGtX/H
         nPG12wv3oFpBrrVlCnX35Qhk7tjRYEmY9SVzQLPJn3+8miI72KuJBfydSBPAye29WU7A
         XYAVb69jaEXSErNI2yqHhAibq/kCN9wwPk52jY8QEt6aoeU+05m2RK6c51xszVbW959O
         0dW8FU5ozFkGsFk1f3tYKoK4ByZjYAMeWXH6Jn/pERbTjGpy+F565rsq49DldxcUAQ0R
         aYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078967; x=1792683767;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EVUVXTF9B/pmjVEVo0zfJaBGiZoNVg7V5lse2RyO7M=;
        b=m20pHl1lOWbw0dvrknBqUOnnsv3/HKvYcTLTqYak1Hv+HugwI8rRJEPkXUblYXAioh
         jcnVmBkI5TKUUs+buMNrkZl1u2v/j9PcLWZz0CyVrW4+q1pkWmTpZr2ttFqFl9HTTWSf
         SP9WNuvRV5VTZDUmdGAqIMRr3ODCvzxSBsbmm5S38H789wZFax+vym5WQlYvVY0OpqoW
         Klkm/4u4/lmT+WVKyHjoUcEfTQwL+MCu3a07muhd3/dm5D8tGGeAPPqoJSlIzpp3vDVt
         Dk1EQQOqVTnJz4QC8zvD8Afx8BowTeJlcle2dUf9hJdLu0iM/gVmwlXqz9H3Pt4lji5q
         RQDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlRzGTh7gizpp35/vfmrfi77CbTdjQXUasBD/NCpmYmRIIk33ePdAVX665V69X4V/jdo0ymFzqGVVH6g==@lists.infradead.org
X-Gm-Message-State: AFq9FYK8vYtOum47Yp/0I7KfJ1eAk7Ktx/SRnSGBmgmfFt9XqGWMrCJg
	oj9Ew0EoOVhVRavLQ7H4gD0dbqHQZsHk6zkkf9fQLN1+NhRJ27uwRGJZT4bsdxnp8Sw=
X-Gm-Gg: AYBFou3N0sJdvKHYCr7vFlq3a28U18NpVDZLgW90Krbv8A4zAmqg0Zj6EBBFkUcprXx
	sFTsGRoXSYtsPiFYDp03Q6VI5NGufCWrPUkFWUs0scaDPNip15jQoVqqodvglBIZBuJTaIyVapS
	fLbqW7YwvBG8DlksMiOaRY69rOTtmZk88B9EsFXV984z3eWPctByuDrHbEnBeZ3ZqS6j5Lv7sXG
	ySO4hqx+cD1dPH0yYssvY1Bvfdb96lygFPSTmbVzVCF490FROlA0QwfvoIzj+DA/4o9bYBmeKli
	9PyWj/3ON7hvdKf4AoFxVfxngVPtChkLQXhqsUEfrYJ6UMGq7023XfXrqo6HT6UdNlxlKKu0Kg6
	bMD5FPOtCrTFXp3U7EUBIATo/nRkND51t6ZtVdgCogWqCpzonIitwGKKQS2gtRIQ6o/SSqfcwwg
	qNuSQFpK++g/JidhLmWPd2y5A2jNaTYjWW06nv/vLBTUjX4hw7xjOARemiawjQzi13xoleVhMgs
	jwVOT5kuC/XV/L9kF/CPMuFm3BQsb/x1JB91pRihKmdMA==
X-Received: by 2002:a05:600c:8b82:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a18e4b887amr354993855e9.27.1792078967287;
        Thu, 15 Oct 2026 08:42:47 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd66c5e6sm52172585e9.2.2026.10.15.08.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:42:46 -0700 (PDT)
Message-ID: <d17b00f9-2a6c-425f-9697-6bc8f31f7a7a@suse.com>
Date: Thu, 15 Oct 2026 17:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/22] modpost: cache section relocation mismatch state
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-hardening@vger.kernel.org
References: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
 <20260923-build-speedup-v4-13-73128809a4a4@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260923-build-speedup-v4-13-73128809a4a4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_084250_328959_5E3E8571 
X-CRM114-Status: GOOD (  32.41  )
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

On 9/23/26 7:18 PM, Lorenzo Stoakes (ARM) wrote:
> For every relocation modpost invokes check_section_mismatch() to determine
> whether there is any kind of mismatch between the source and destination,
> and if so which classification applies.
> 
> Each time it does this it invokes section_mismatch() which iterates
> through the sectioncheck[] array every time it's called.
> 
> When walked a relocation section the source is fixed and there aren't many
> targets, so the same names are looked up over and over again.
> 
> Therefore cache not only mismatch categorisation but also whether a
> mismatch even exists for a given section and look up the sections in the
> cache.
> 
> Special indices (undefined, absolute, common) take the uncached path as
> before.
> 
> This results in very significant speed ups for allmodconfig incremental
> builds.
> 
> modpost is on the serial tail of every build that links vmlinux.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        8.5s     8.3s    -0.14s (-2%)
>   x86 defconfig, touch mm/vma.c, clang      7.7s     7.6s    -0.13s (-2%)
>   x86 allmodconfig, touch mm/vma.c, gcc    33.9s    29.4s     -4.5s (-13%)
>   x86 allmodconfig, touch mm/vma.c, clang  31.9s    27.9s     -4.0s (-13%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

This looks mostly ok to me. Below are some nits you might want to
consider addressing.

> ---
>  scripts/mod/modpost.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 75374c64b8cc..0fd43c8a89ea 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1155,12 +1155,67 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
>  			 name);
>  }
>  
> +/*
> + * mismatch_cache[section index] ->
> + *   0 - uncached.
> + *  -1 - no mismatch.
> + *  >0 - mismatch index + 1.
> + */
> +static int *mismatch_cache;

It might be cleaner to maintain this cache per elf_info, since it
logically belongs to the processing of an individual ELF file. This
would also be consistent with the existing symsearch cache, which uses
elf::symsearch.

The description could use 'to_secndx' instead of 'section index' to
clarify whether it refers to the source or destination section of
a relocation.

> +
> +static void init_mismatch_cache(unsigned int num_sections)
> +{
> +	mismatch_cache = xcalloc(num_sections, sizeof(*mismatch_cache));
> +}
> +
> +static void reset_mismatch_cache(unsigned int num_sections)
> +{
> +	memset(mismatch_cache, 0, num_sections * sizeof(*mismatch_cache));
> +}
> +
> +static void free_mismatch_cache(void)
> +{
> +	free(mismatch_cache);
> +	mismatch_cache = NULL;
> +}
> +
> +static const struct sectioncheck
> +*cache_mismatch(unsigned int secndx, const struct sectioncheck *mismatch)

Similarly here, s/secndx/to_secndx/.

> +{
> +	if (!mismatch) {
> +		mismatch_cache[secndx] = -1;
> +		return NULL;
> +	}
> +
> +	mismatch_cache[secndx] = (mismatch - sectioncheck) + 1;
> +	return mismatch;
> +}
> +
> +static const struct sectioncheck *get_section_mismatch(const char *fromsec,
> +		const struct elf_info *elf, unsigned int secndx)

s/secndx/to_secndx/, and the fromsec and elf arguments could be swapped
for consistency with the rest of the code.

> +{
> +	int cached;
> +
> +	if (secndx >= elf->num_sections)
> +		return section_mismatch(fromsec, sec_name(elf, secndx));
> +
> +	cached = mismatch_cache[secndx];
> +	if (cached < 0)
> +		return NULL;
> +	if (cached > 0)
> +		return &sectioncheck[cached - 1];
> +
> +	return cache_mismatch(secndx,
> +			      section_mismatch(fromsec, sec_name(elf, secndx)));
> +}
> +
>  static void check_section_mismatch(struct module *mod, struct elf_info *elf,
>  				   Elf_Sym *sym,
>  				   unsigned int fsecndx, const char *fromsec,
>  				   Elf_Addr faddr, Elf_Addr taddr)
>  {
> -	const char *tosec = sec_name(elf, get_secindex(elf, sym));
> +	const unsigned int to_secndx = get_secindex(elf, sym);

The const qualifier can be dropped from the to_secndx definition to
match the usual kernel style.

-- 
Thanks,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
