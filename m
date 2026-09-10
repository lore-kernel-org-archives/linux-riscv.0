Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B10C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2TEJaCgVbckw3kTEE7k7zTogBAvY22+RzWvj9ptehA=; b=S8ldnW6avhholH
	g4Knxw/pKSSFVa51Fq+MQvRxVWTc+Xh6nJgHrG0rjso90yAdR4cgQ82JNmdbFLQQLj6fMJhND0C5g
	hFL2MhhsPtmCX2QYQeEVlP7CRebrWPmkMWZ56FL/r9kSpLGOBVhXSa0xcPcNmgqQ5ikL36jtLXbN/
	c0mNj4+L0309foCO0v0NeJ+tz5WYmfTtBtv8QHvjqBv5xftHTCN+++nTFIiwvp+e+cMd2U/3kmjh2
	r4XonsoDD72m8cLDiKTrEhEwPEuY0+NfAPhqmPjM7kGlkWpKzEb83fh3HXfzStNeJwZBUF3PQT/x5
	SXhTLDSaKCd/l/zlmu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b5k-0000000DsuZ-3yYg;
	Thu, 10 Sep 2026 09:29:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b5j-0000000Dstp-0X7W
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 09:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xKhavT2ReA2W483I2xKkmSEJ1FM7bdVhooTyy/B0hnc=; b=poE8HfWxeEisEh7wOzzyct9nNq
	sihfzqzqkOpVAI8ALsZ95AdtR4dW+2/yvJ/f68nQ7cO3/hnS1ATYp4cszqOr4hvn2ylzAfHytQ+6H
	7B3sk9tBQc17RreszrFrxWDLvUm8u9vINqp6YUh1jBU2A9M2HO2BhdhwzMNjuGqAt25JoMPhTUJdh
	mMyd2LIkdWj3Ws8K9QQb2ICLPt6fdDHV+yaNF8aqKA3sCQOZRTpChuJn1Zq5jV50CA21B3st06tYS
	zP+IAzX8JjQgOLL7O5rBgVoeo/NbkCCTDeBwAeuaMS8krbFDfqJU96bN8S6/FfcbVeBXa3FmS9na7
	erDXsVFQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4b5g-00000002GKy-1EjF
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 09:29:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-485850cf499so4848006f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789032546; x=1789637346; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKhavT2ReA2W483I2xKkmSEJ1FM7bdVhooTyy/B0hnc=;
        b=NqvcrY7lbvUQ94LjXSZHZuDfqh7A9DsmapYhmy/R1CSiT9jCLLXzidd4OgZTobd6rX
         J6TIEgpl2qbPIzbkQVvaeER40rFrFTyaDLBmisott9AUiOZ5RiCC7q+xidPqa3R4I/Lc
         91ed2SM2K0e79L6aYDSpqG7xjDL8jE8iaubI2FJSEj2ZcyB61z60XHEQfvnZsbCRYaBs
         4p3vQNWEYHUPY6XURofCwreFHtkwzmZ/+DGhgwgAKC50vg956WMxxmtG8XaUaba1AX9y
         PfHmHmLBgfA3a8U5rbJskFUp2ZTtOXykUWSsu0zsuz/j0pKEPfcgP6e48/LSGa1UUbeG
         +Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032546; x=1789637346;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKhavT2ReA2W483I2xKkmSEJ1FM7bdVhooTyy/B0hnc=;
        b=KCZX6S/fhjfBFBotGkc3fois1iQr9JM2GTYphwXKgNZ+EX7EQ1Ailj77dgYPX9iKHt
         wIClxCXznvgp4cm0Q6+BOP0yMWVzifobm8z/UcMAG+DwPagWgNn/OyHHLToQqLaaYjh1
         BeiNj7S0pepChYJXNmshjiXEJlu4/WZQKX6/L/6t0QNk+E14g4m3+w7Pdp1ilJPaitQw
         5McnfZNRfqgs0y095Lrl8CWCnhkdqPhFwk/cglklDXodHf2HhITg/r0Ykr9aggomqf2s
         wIYOQhm2lbpgwRs4I1JYb691yvhT1FRr9fcrtjwzkjGQ6+Y+9GzpoHj0IC1svy69u3gt
         bG9A==
X-Forwarded-Encrypted: i=1; AKwUvBxu9GqhwpZSTXwQQ2gxufqZQ9KGNe8FJcXD6dsQUkMbQ+fZ0yLeUNPPtxeHcTtypvIV5sNjJ/KZeM8mvg==@lists.infradead.org
X-Gm-Message-State: AFuF++ko6khHXeO+7KEiSulKcOuZp2/j9OwEJabDJL5OOALnyZb3Nplg
	i9UquqLwJUhVtHWenrV4JF0ch/aZfM1ZcxwkOm0HI57MCU8mQgWx1eaM
X-Gm-Gg: AYBFou3j0/QMDNkA3F8TuztXO1yhcIOibHydwKY71iza4Nw58R6cZPPC0YV53J5sASU
	o3lo35pWJCMaBeYiz6k6wTXHWd+iwCXr9M5QKTCYOpGw9wsKZeDU8xpCcdOAP7EV5LGDtKoone8
	+IsCnVsrgNZdKYYH+XMlj6rEcfLYGlDb9sCXYutLMrLS9VKbaovOcx+fZxyfXvs5Fk8NC49upOa
	8wCMbiIDhlLC/2afwuNrxC337BYwwdBE9vCQFwN7zdzc6XivqB6nG5UuvbtMGe/tj2oF5lofA5C
	HSFyL/AO7O7RDnqzZc+bu6tSsWUkuTS86RqJVlU12Jzj5xd/jXUQUFnS5fMjMe3vRxvMd0S+TJe
	Pm3IIF3MMxSMj2QrlDMHlNf/fKaUhSCDBqENVut/EtHDBurBbysNCPEFTxrd/RFWCqGGHNlfjf5
	zTjX1oLxJxu/drno+W2FeXcO8ZNRFPeGQO6sdcOFkaY1nvlnzGmHvTMMkkUjI/zxebi6Rqa8Y7B
	6BBPPVZDpS2fWKaR7oGuqeXGtKI9EYv5XDp
X-Received: by 2002:a05:600c:138b:b0:49e:2a61:a17b with SMTP id 5b1f17b1804b1-49e2a61a41emr9166915e9.5.1789032546119;
        Thu, 10 Sep 2026 02:29:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc23fcsm106027125e9.3.2026.09.10.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:29:05 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:29:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Alexey
 Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 04/23] kallsyms: output binary data to speed output and
 kallsyms assembly
Message-ID: <20260910102903.1b211f6b@pumpkin>
In-Reply-To: <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_102908_428500_A474ADCF 
X-CRM114-Status: GOOD (  31.27  )
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

On Tue, 08 Sep 2026 21:55:04 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> kallsyms generates an assembly file that consists mostly of .byte entries
> containing compressed names, token strings and name-sorted sequence
> numbers.
> 
> For an x86-64 build with 158k symbols that is a 37 MiB .S file which takes
> 0.57s to assemble each of the two to three times it is built over a kernel
> build.
> 
> Each time it is generated it also takes kallsyms a similar amount of time
> to output it.
> 
> Avoid this overhead by instead outputting this data as binary and importing
> it into the assembly using the .incbin directive.
> 
> Tables that are wider than a byte remain part of the assembly to ensure
> endianness and relative relocations are performed correctly.
> 
> With this change, the output assembly file shrinks from 37 MiB to 9.8 MiB,
> with a 2.6 MiB binary data file alongside it, and the object remains
> identical.
> 
> The generated binary file is deleted correctly on build clean along with
> all other ephemeral data.
> 
> On an x86-64 system with CONFIG_KALLSYMS_ALL set:
> 
>                        before   after    delta
>   scripts/kallsyms     0.24s    0.18s    0.06s
>   assemble             0.57s    0.16s    0.41s
> 
> Per kallsyms invocation/assembly, for a total of 0.47s time saving upon
> invocation.
> 
> An incremental build on the same system was reduced from 11.15s to 9.65s,
> indicating a total of 1.5 seconds saved over the build.
> 
> The kallsyms runs and their assembly are on the serial tail of every build
> that links vmlinux, no-op builds are unchanged.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc       10.8s     9.9s    -0.92s (-8%)
>   x86 defconfig, touch mm/vma.c, clang     10.7s     9.5s     -1.2s (-11%)
>   x86 defconfig, clean, gcc                29.5s    28.7s    -0.81s (-3%)
>   x86 defconfig, clean, clang              29.7s    28.6s     -1.1s (-4%)
>   x86 allmodconfig, touch mm/vma.c, gcc    45.3s    44.0s     -1.3s (-3%)
>   x86 allmodconfig, touch mm/vma.c, clang  42.9s    40.2s     -2.7s (-6%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  scripts/kallsyms.c      | 97 ++++++++++++++++++++++++++++++++++++++-----------
>  scripts/link-vmlinux.sh |  2 +-
>  2 files changed, 77 insertions(+), 22 deletions(-)
> 
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 350d118c3b9e..61c5eb537ed4 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -5,7 +5,10 @@
>   * This software may be used and distributed according to the terms
>   * of the GNU General Public License, incorporated herein by reference.
>   *
> - * Usage: kallsyms [--all-symbols] in.map > out.S
> + * Usage: kallsyms [--all-symbols] [--pc-relative] in.map out.bin > out.S
> + *
> + *      The byte tables go to out.bin and are pulled into out.S with .incbin;
> + *  wider tables stay assembler source for endianness and relocations.
>   *
>   *      Table compression uses all the unused char codes on the symbols and
>   *  maps these to the most used substrings (tokens). For instance, it might
> @@ -102,7 +105,7 @@ static void sym_arr_free(struct sym_arr *arr)
>  
>  static void usage(void)
>  {
> -	fprintf(stderr, "Usage: kallsyms [--all-symbols] in.map > out.S\n");
> +	fprintf(stderr, "Usage: kallsyms [--all-symbols] [--pc-relative] in.map out.bin > out.S\n");
>  	exit(1);
>  }
>  
> @@ -319,6 +322,40 @@ static void output_label(const char *label)
>  	printf("%s:\n", label);
>  }
>  
> +static void write_bin(FILE *file, const void *data, size_t len)
> +{
> +	if (fwrite(data, 1, len, file) == len)
> +		return;
> +
> +	perror("kallsyms: write");
> +	exit(EXIT_FAILURE);
> +}

It is pretty pointless checking the return value from fwrite().
Most of the time it is just doing a memcpy().
Instead call fflush() and the ferror() prior to the fclose().
(Or just rely on fclose() giving you that error status.)

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
