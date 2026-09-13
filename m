Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A837EC88E5C
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ni5XWeU/esfssRMd6T4QYxWtuqE+hmq6i4TobdQ+wg=; b=f36DFCqHmdSQ9L
	kFqdpl8KkfVCYYKahtH0uq8RvcKEw/kbxjWKrr06vfznMElC3E1E4XBlvaHeOCBeLMbYot+L3hZdF
	KCoMuY4RVQPE7kd+9zTkuK0SlkpjNlGpHl4TVTpvfGx9iSGuw+6C/NGtG+boa5sud6aJOrZeFRjLS
	cHOPRTTSBOE5NFZWceF11M+PpmAtl7vpnv8F35w65N3zkHUikyf+1gMUK83rnvpGy0O9daaNIUicd
	cIcKlOmYyszc1TKjq0Xm/tM+N0bRmOxknT6EUNHpQgdf0OTMJfldeGE6usiSyd7hUUEZdY7lyGxUD
	ZJqyx7SBvVnp9fMmY2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mzb-00000001odG-3CFT;
	Sun, 13 Sep 2026 16:23:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mzZ-00000001od6-17NX;
	Sun, 13 Sep 2026 16:23:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EF6E60E6E;
	Sun, 13 Sep 2026 16:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA5E1F000FF;
	Sun, 13 Sep 2026 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789316624;
	bh=vtYp8z3axuR00LAAJx7wcEMTWrvbqi7ZGt6zNtV2N10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TD5bh3+4leYOdVE9w6uBmkVkidWFUpUIpGqq5jNTV6vVy6DL3LUuZkEB0bBnmv1Uw
	 nog3RMK5DVwkPMpQvJagwvCiv9Wa1363qfxVz/LpD/KzMHp+iMPNBO50bZXnimq/5h
	 hYnPK9jOgcXJ3UFM/FOhT4MeShNv+TMQCQqZhjBKGvuD4KTIYaO/2WLiLPqIcoihiu
	 oCBRmHvv7RhB86eFc4UgGsGNMIcGH8az+sZ/pc7pu948MwGKD30rycv81MlL5PatSG
	 xsTiAFHcHzUJgKsW4srIw3fe4q6sY+Eg/F/+udI14JqucjyadfXa5RgFbeHpwO0VXz
	 TjQ4nzy282meQ==
Date: Sun, 13 Sep 2026 17:23:30 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 19/23] objtool: decode instructions and resolve branch
 targets in parallel
Message-ID: <aqbMdhXDANI8JG1P@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-19-5dc1ac01672d@kernel.org>
 <aqXXF6otLbLtnhWw@jpoimboe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqXXF6otLbLtnhWw@jpoimboe>
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

On Sat, Sep 12, 2026 at 04:39:49PM -0700, Josh Poimboeuf wrote:
> On Tue, Sep 08, 2026 at 09:55:19PM +0100, Lorenzo Stoakes (ARM) wrote:
> > +/* Only an object this large, e.g. vmlinux.o, is decoded on several threads. */
> > +#define DECODE_THREADED_MIN_TEXT	SZ_8M
> > +/* Only decoding and the branch passes are threaded, so more gains nothing. */
> > +#define DECODE_MAX_THREADS		16
> > +#define DECODE_RANGES_PER_THREAD	4
> > +
> > +/*
> > + * sec_offset_hash() keys on OFFSET_STRIDE windows, so the instructions of a
> > + * window share a chain and buckets beyond one per window would sit empty.
> > + */
> > +#define INSN_HASH_BYTES_PER_BUCKET	OFFSET_STRIDE
> > +#define INSN_HASH_MIN_BITS		10
> > +
> > +static unsigned long total_text_size(struct objtool_file *file)
> > +{
> > +	unsigned long size = 0;
> > +	struct section *sec;
> > +
> > +	for_each_sec(file->elf, sec)
> > +		if (is_text_sec(sec))
> > +			size += sec_size(sec);
> > +
> > +	return size;
> > +}
> > +
> > +static int alloc_insn_hash(struct objtool_file *file, unsigned long text_size)
> > +{
> > +	const unsigned long nr_buckets = text_size / INSN_HASH_BYTES_PER_BUCKET;
> > +	const int bits = ilog2(nr_buckets);
> > +
> > +	file->insn_hash_bits = max(INSN_HASH_MIN_BITS, bits);
> > +	file->insn_hash = calloc(1UL << file->insn_hash_bits,
> > +				 sizeof(*file->insn_hash));
> > +	if (!file->insn_hash) {
> > +		ERROR_GLIBC("calloc");
> > +		return -1;
> > +	}
> > +
> > +	if (opts.stats)
> > +		printf("insn_hash_bits: %d\n", file->insn_hash_bits);
> > +
> > +	return 0;
> > +}
>
> The dynamic insn hash sizing should probably be its own patch.  It's a
> standalone improvement, and much more obviously correct compared to the
> rest of patch.  I suspect it will make a big difference on allyesconfig.

Thanks, will split out!

>
> The rest of the patch looks ok to me, though it needs to be reviewed
> very carefully (which I haven't done yet).  I'd like to see a Sashiko
> review (I wasn't able to find these patches on sashiko.dev for some
> reason).

https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d%40kernel.org
seems to be it?

I will work through the reports for v2!

>
> --
> Josh

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
