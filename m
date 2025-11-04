Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD303CCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 07:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cav69KHhcGlS7XY5NwyT7uQu43D0l0HGJbCx+Wn2z0w=; b=OuBXz6yJ/225db
	G1hPOWTJkmXe9MHaAZ9WqNTFiHWTVMz5rjfN7GAMd+7sazFl9X2KVWuV0/JMWQJVK/rnCqSVH6oZa
	oYsh2HK1ZFJyzMn57P5XydfvAV5rM1GJjlunS+ndWZhH8mZjzgtvFZJQWc0S+9V1D0ZC9+i11Czan
	HHhkfVtG2IoyTP3z0VMMUv/OJjsUAQiHlheOz3CVz83obM92hyM+B8YKqmzChT1H5Bcb+8P5PPXFC
	I+Rcka2orq2W7fTU5SU9eHexFhswCPNp0KiQtBMCatUgFTbVyD8AfX66ww4IfSREwJhn5nY1743za
	MHxV8X8wKigLP2UpDVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBqh-0000000BMMs-0Swa;
	Tue, 04 Nov 2025 07:53:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBqg-0000000BMMh-0IYn
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 07:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9DC9600B0;
	Tue,  4 Nov 2025 07:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8A2C4CEF7;
	Tue,  4 Nov 2025 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762242780;
	bh=lGIbceyVZgdKoxAlgrENOyuI7iqdDhBBFcc98C3lKn0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j4yROKUVgRxS9OZJC90/SHA8XCPDVvwVHDTgceh+mCs64FFENtqjNn3VC2cS3YHRS
	 Vh89i49TvVRT0q9eqdMJYy6UnQ4flTEkFee+vNQ+LDBtPs6JzXOg9rqYQ1l4R+DhcE
	 OKQGVXbTY9tU25yQyQP/GPDQop+9ZGgyxC6t3ereLkJQbDn6Ob5K1plMoN0NTftZxP
	 H0zc0vdg/o5PK4tKAehZQ7H8UtwncmtwY6oH+6QVwjaU8ikukGQIRaxvlWW+ISd3QU
	 to0NJLl+MiSLIdyT3IYNIGJSnGwpG80zYDO7P7ohAcYwUyIFI+7D4Iv2WyVwNsWwgM
	 89d6ggsAvvugA==
Date: Tue, 4 Nov 2025 00:52:53 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
cc: Paul Walmsley <pjw@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
    Andy Chiu <andybnac@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
    Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
    "H. Peter Anvin" <hpa@zytor.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
    Vlastimil Babka <vbabka@suse.cz>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    Christian Brauner <brauner@kernel.org>, 
    Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
    Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
    Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
    Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
    richard.henderson@linaro.org, jim.shu@sifive.com, kito.cheng@sifive.com, 
    charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com, 
    cleger@rivosinc.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
    broonie@kernel.org, rick.p.edgecombe@intel.com, 
    rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v22 17/28] riscv/signal: save and restore of shadow stack
 for signal
In-Reply-To: <d442965b-8716-4f89-be88-bc62459af712@infradead.org>
Message-ID: <febe1a8a-a68b-1af8-a9d5-1b5f510ecab3@kernel.org>
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com> <20251023-v5_user_cfi_series-v22-17-1935270f7636@rivosinc.com> <a8f469b8-5750-dfec-2390-09bad4515f99@kernel.org> <d442965b-8716-4f89-be88-bc62459af712@infradead.org>
MIME-Version: 1.0
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

Hi Randy,

On Fri, 31 Oct 2025, Randy Dunlap wrote:

> 
> On 10/31/25 1:07 PM, Paul Walmsley wrote:
> > On Thu, 23 Oct 2025, Deepak Gupta via B4 Relay wrote:
> > 
> >> Save shadow stack pointer in sigcontext structure while delivering signal.
> >> Restore shadow stack pointer from sigcontext on sigreturn.
> 
> > This patch causes some 'checkpatch.pl --strict' messages:
> > 
> > CHECK: Comparison to NULL could be written "!saved_shstk_ptr"
> > #271: FILE: arch/riscv/kernel/usercfi.c:186:
> > +	if (saved_shstk_ptr == NULL)
> > 
> > CHECK: Lines should not end with a '('
> > #300: FILE: arch/riscv/kernel/usercfi.c:215:
> > +		pr_info_ratelimited(
> > 
> > I've fixed them up here in the event that v22 goes in, but please do the 
> > same on your side in case a new version is needed.
> 
> Is checkpatch.pl --strict the norm for arch/riscv/ ?

I run it on every patch I review.  I usually implement the formatting 
recommendations, in the interest of keeping the codebase formatted in a 
standard way across submitters.

> If there are enough arch/riscv/-specific patch expectations,
> maybe they could be documented in Documentation/process/maintainer-riscv.rst
> (a new file).

It never occurred to me as being arch/riscv specific, in the sense that, 
if --strict wasn't more broadly useful across the entire kernel tree, then 
we should just remove it from checkpatch.pl entirely.  In other words, 
probably everyone should use it.  There are false positive warnings, of 
course, including at least one with this patch set; but then again, there 
are regular false positive warnings with non-strict checkpatch (also with 
this patch set).

In any case, thanks for the suggestion, and will consider.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
