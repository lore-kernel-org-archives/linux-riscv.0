Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884E0C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKv+LtSHCebn87Irmqe1v4WAwJxuEm0P1ZsC30fOdUo=; b=Tt+0JqRwct0tZH
	gcv+aWm6fPDjVc/kJFQSr0riqhp5sIK5xmlM0rWX7La/+MG8A8w2NofxwxZZjPif7CxXJ4sIltreT
	mypC7j1a04wggQCOBEw6MsIf79l4dfFBj1x8BsPc4xuHPz/271YYD1ugNLdxyuIubKi2U6bc0kkcG
	2eUafpU/lJBs3TSwXkTriGyPEsW7Nn3EtH2fVgrjbg32Ctg/fOR6ksu8Nnwf1rIJ23K6QBK45Wz/f
	wrXQ+Y7tkdZ9sPsZ9bGPVWuQW6jnr7pr4DBwFysYNWd12KzH2jZUrlsrd9K+PkVwNi8kZVy9S5RcC
	kouU48B89qHMfZeXlR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c5b-0000000E4qh-0tv7;
	Thu, 10 Sep 2026 10:33:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c5Y-0000000E4pb-1WlS
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 10:33:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso58503085e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789036382; x=1789641182; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mRawg4Z5mHetwl9Q1bHnfv9ACubJE6CgvdpEZZ5c2ZM=;
        b=ZFjPjNVX5oYxmkNajGjHXafM/MVD+ek4ydnMexp6iA5x7ADDeTgRVtgyPvAzvuc3bt
         DHVWrB37/ofB/36blYhw1+U1TR0A7CnNjFbSHlscm6uCN/cu6vDjqOaoY2WespjnWBz1
         krhclo7BmnXgE7jRV/AdvsdZxCRpqlGqSdX6rn1awjnrzydJ47hcAPa5kSc5uOLU2A7D
         z1MKQcv7NtM0u25lchuxpkSRxZ2WiC398ONtNrtqCATLSu02KuQAaa8KK22wBGKvwi2M
         j5qgfk1yNj7VoMQlZLELmeEpBQj19lCmU3ymPii/dhnPyvPRDeWwIS8+0Iyc0CeLJssN
         Vcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036382; x=1789641182;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRawg4Z5mHetwl9Q1bHnfv9ACubJE6CgvdpEZZ5c2ZM=;
        b=URNeKjY8tNmq4AGyIbOgP6jWW8cDsyPl3isMAyfBSewoAQowcx2YzCu60eMX3uwmbp
         Fvg4UtqJ4TW2hE/GdSmg5Y/AKzlWckMky23InxKVsrzA5veW6rDGbxFVUkBpQkEZJ4XV
         buQt3XlasvzN5YWPdWqcxNrGxRCQeyZZh9IGKXaA6WdVLGEOINVxy7seCV3FIYNqlWS3
         u/mv11Al7fy2MCSJ3In/pZ1eun8cIfz6pIFGIOe0kZrF0knfKYkMORnHKyimOE9C5CN3
         SXYelyDxcDTAM5fqwlgEyEZ/SnhhPbUDmzl8TU9QQJ3NYoolNKCDjQVh4Oy4Mp+fzCg+
         q2Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzSnfIEVW3fNLHWypU3IQioiL4kecgPy08Y19ozUEVHAb+Y3afa7DDW8XYfI7cxYXb4QzZcbJXTr+a19g==@lists.infradead.org
X-Gm-Message-State: AFuF++lLw4RvWRFZi52OhR0cEJ5X18cztpGMWexNvyMJApBpWXztuF3W
	RpnTqjjydBNzGTi45Q2PSASqZmyGn+4BDqFEfZjAoil8J10O6uxwws1A
X-Gm-Gg: AYBFou0UE6fab2w8u7EyUsHFH63fAHmTpncxY+CyHlUVnMKYXQwaeSX9ojJhcKbzrpG
	nVaJZKwFFbeaPKoZikPfJEmn1L7F9D6SdN8W1rx3HlhfE0h0sysrekS+so/evy9EN69ham+WvKi
	k2eVq0ztxLmFuvjrXnJoHj2n8JxzmNaa67mzpywSexpyJK9Rc0CivRiVC0OImvW8LpQ4yZq6Rba
	nUsub1MSl2iTnRTLGcaKgp/iTjvMMPq74Yj29LyHek2H9fLwjkYUAw3P41P7sfubiBBfa+Sqapi
	OFPwEfOvQRSxwURF5YamK8oIT/FA5Ke/v8IXYY9VJtxeayMFcv6bKbbMBG50iS7waaYNQooqJIM
	wNGofAo1UkLaRvaGoV632nviiWjADcFzQtHHm+1XVGyx2FneaPFGTOB+LX4MPCy/TJb3v+5MDv+
	RDh6nauigfH4u8JI2asxvAtRuBLA3iZO6/+A94TdlmiDSfhamNHznW9A18IZjejxxLz3Mtd8T89
	tSk9W0/f/Ak5VOO5VgZfeMtg1nCfXUg6pjb
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6c:be0b with SMTP id 5b1f17b1804b1-49cffd457a4mr308628235e9.17.1789036382123;
        Thu, 10 Sep 2026 03:33:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bfd04fsm60049095e9.10.2026.09.10.03.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:33:01 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:32:59 +0100
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
Subject: Re: [PATCH 17/23] modpost: perform srcversion hashing in parallel
Message-ID: <20260910113259.743b9686@pumpkin>
In-Reply-To: <20260908-build-speedup-v1-17-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-17-5dc1ac01672d@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_033304_457315_D95AB78F 
X-CRM114-Status: GOOD (  34.64  )
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

On Tue, 08 Sep 2026 21:55:17 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> modpost does a lot of single-threaded work hashing files from each object's
> .cmd file.
> 
> This makes the build slower than it needs to be, so do this work in
> parallel.
> 
> This is egregious for allmodconfig builds - for instance x86-64 can end up
> opening 200,000 files individually and hashing them all serially.
> 
> Parallelise this operation by maintaining a thread pool for the hashing
> work.
> 
> Combined with the per-file hashing commit this cuts modpost's run time
> nearly in half for an allmodconfig build.
> 
> Module.symvers and every *.mod.S are byte for byte the same.
> 
> modpost is on the serial tail of every allmodconfig build, however
> defconfig does not set CONFIG_MODULE_SRCVERSION_ALL and is unchanged.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, touch mm/vma.c, gcc    33.4s    30.2s     -3.2s (-10%)
>   x86 allmodconfig, touch mm/vma.c, clang  31.1s    28.1s     -3.0s (-10%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  scripts/mod/Makefile     |  1 +
>  scripts/mod/modpost.c    | 72 ++++++++++++++++++++++++++++++++++++++++++++++--
>  scripts/mod/modpost.h    |  2 ++
>  scripts/mod/sumversion.c |  3 +-
>  4 files changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> index fbd5099e0441..fdd486184f9c 100644
> --- a/scripts/mod/Makefile
> +++ b/scripts/mod/Makefile
> @@ -5,6 +5,7 @@ hostprogs-always-y	+= modpost mk_elfconfig
>  always-y		+= empty.o
>  
>  modpost-objs	:= modpost.o file2alias.o sumversion.o symsearch.o
> +HOSTLDLIBS_modpost := -lpthread
>  
>  devicetable-offsets-file := devicetable-offsets.h
>  
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 550ccd753ed8..882169e51851 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -16,6 +16,7 @@
>  #include <fnmatch.h>
>  #include <stdio.h>
>  #include <ctype.h>
> +#include <pthread.h>
>  #include <string.h>
>  #include <limits.h>
>  #include <stdbool.h>
> @@ -1717,8 +1718,7 @@ static void read_symbols(const char *modname)
>  	if (!mod->is_vmlinux) {
>  		version = get_modinfo(&info, "version");
>  		if (version || all_versions)
> -			get_src_version(mod->name, mod->srcversion,
> -					sizeof(mod->srcversion) - 1);
> +			mod->need_srcversion = true;
>  	}
>  
>  	parse_elf_finish(&info);
> @@ -1736,6 +1736,72 @@ static void read_symbols(const char *modname)
>  	}
>  }
>  
> +static struct module **srcversion_mods;
> +static unsigned int nr_srcversion_mods, next_srcversion_mod;
> +
> +static bool get_next_src_version(void)
> +{
> +	struct module *mod;
> +	unsigned int idx;
> +
> +	idx = __sync_fetch_and_add(&next_srcversion_mod, 1);

When I've done this is the past, adding 'a few' items was faster
because it reduced the contention on the counter.
(Although there were probably some very cheap 'actions'.)

> +	if (idx >= nr_srcversion_mods)
> +		return false;
> +	mod = srcversion_mods[idx];
> +
> +	get_src_version(mod->name, mod->srcversion,
> +			sizeof(mod->srcversion) - 1);
> +	return true;
> +}
> +
> +static void *srcversion_worker(void *arg)
> +{
> +	while (get_next_src_version())
> +		;

I don't think the extra function call helps.

> +
> +	return NULL;
> +}
> +
> +static void hash_srcversions(void)
> +{
> +	unsigned int i = 0;
> +	struct module *mod;
> +	pthread_t *threads;
> +	long nr_threads;
> +
> +	list_for_each_entry(mod, &modules, list)
> +		if (mod->need_srcversion)
> +			nr_srcversion_mods++;
> +
> +	if (!nr_srcversion_mods)
> +		return;
> +
> +	srcversion_mods = xmalloc(nr_srcversion_mods * sizeof(*srcversion_mods));
> +
> +	list_for_each_entry(mod, &modules, list)
> +		if (mod->need_srcversion)
> +			srcversion_mods[i++] = mod;
> +
> +	nr_threads = sysconf(_SC_NPROCESSORS_ONLN);

One thread per cpu is probably a few to many.
It might be worth adding a command line parameter for the 'max threads'.
Possibly with -n meaning 'all but n'.

> +	nr_threads = nr_threads < 1 ? 1 : nr_threads; /* On error assume 1. */
> +	if (nr_threads > nr_srcversion_mods)
> +		nr_threads = nr_srcversion_mods;
> +
> +	sumversion_init();
> +	threads = xmalloc(nr_threads * sizeof(*threads));
> +	for (i = 0; i < nr_threads; i++) {
> +		if (pthread_create(&threads[i], NULL, srcversion_worker, NULL)) {
> +			perror("pthread_create");
> +			exit(1);
> +		}
> +	}

The main code can call srcversion_worker() here.

David

> +	for (i = 0; i < nr_threads; i++)
> +		pthread_join(threads[i], NULL);
> +
> +	free(threads);
> +	free(srcversion_mods);
> +}
> +
>  static void read_symbols_from_files(const char *filename)
>  {
>  	FILE *in = stdin;
> @@ -2729,6 +2795,8 @@ int main(int argc, char **argv)
>  	if (files_source)
>  		read_symbols_from_files(files_source);
>  
> +	hash_srcversions();
> +
>  	list_for_each_entry(mod, &modules, list) {
>  		keep_no_trim_symbols(mod);
>  
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index d5f6d82837d5..10d5f8f2f293 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -127,6 +127,7 @@ struct module {
>  	bool has_init;
>  	bool has_cleanup;
>  	char	     srcversion[25];
> +	bool need_srcversion;
>  	// Missing namespace dependencies
>  	struct list_head missing_namespaces;
>  	// Actual imported namespaces
> @@ -213,6 +214,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
>  			Elf_Sym *sym, const char *symname);
>  
>  /* sumversion.c */
> +void sumversion_init(void);
>  void get_src_version(const char *modname, char sum[], unsigned sumlen);
>  
>  /* from modpost.c */
> diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> index 5501d6aa0bea..4521b92ef868 100644
> --- a/scripts/mod/sumversion.c
> +++ b/scripts/mod/sumversion.c
> @@ -249,7 +249,7 @@ static int parse_comment(const char *file, unsigned long len)
>  /* FIXME: Handle .s files differently (eg. # starts comments) --RR */
>  static bool stop_char[256];
>  
> -static void sumversion_init(void)
> +void sumversion_init(void)
>  {
>  	static bool done;
>  	int chr;
> @@ -402,7 +402,6 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
>  				     line, strerror(errno));
>  				goto out_file;
>  			}
> -
>  		}
>  
>  	}
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
