Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0A8C982DD
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 19:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANEjQV5hOaYbZPG6MoqEcb0l9zVGSEXPe97ijPi3K8U=; b=sjutHXAgle4+O4
	+OrTo/WFahIuDItDTYg8b98hqvtXS6HTVf41tl7uXe2x2RjMt9zXIWkdb0S3A/ZOw44gtY+iv3Ts8
	WEkmZOxS8vIUJ9ZwXwgAbfGHcQlzk2/Lax/SKRpoVcdkKE1LRHrVpCxyQIxyTa3EhdkAGqijjh3Bc
	yBAQNvuwakmCMqbsY897ikg1IMd8VIcO/q+VyN//oiVGLMgLy1XinsiAMsXqH100BJBprcFMW6tVa
	nTa+dbtGmm96EpfeGl9Hk4qg169uppguzxhaPMUhK/s9K7IphVe/zbeXED/tSgo0FW7Z281YKXyhk
	8xGhJgklbD+LEmI4bX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7eFQ-0000000FPap-0vQL;
	Fri, 18 Sep 2026 19:27:48 +0000
Received: from mail.avm.de ([2001:bf0:244:244::94])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7eFM-0000000FPZu-2mKH;
	Fri, 18 Sep 2026 19:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789759661; bh=xc9TLOdz9Shm4TKmH/6pS1wap/ev01S/nSMVw3cWtfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pa5ZU1udssDZ876Yy4o4IBichzZhOR7QEhjKH6E5ZP2IahZ2K/0W4pdO7vIJ1A67B
	 sN8QwI7QAqroUzatF/Q7twY+IVVg5NlKTTx+QhN91UdJxk/cCd7LNrD/HoQRCdKpm3
	 5o1BJlm50C8/qTKTo4bx7wDWWJ0ZpIYpSkxnnzV86DnQ7STHP4CciKh5eVXV/vaGqy
	 ycFLa4r6L3ZXuyu2Ks56AWocHYwiKR90SpVfuvRUKI21YoCoZoDNX/TQkFSBUErGmT
	 raLS6ipTgDZNBeO2QHtF+LVJTB0OoKhExntepvKWlTVwpv6dWg/+RNVqh1UcABk2/M
	 AUfyXKl3m9DbA==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aad90ad-03cd-7f0000032729-7f000001a22e-1
	for <multiple-recipients>; Fri, 18 Sep 2026 21:27:41 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 18 Sep 2026 21:27:41 +0200 (CEST)
Date: Fri, 18 Sep 2026 21:27:39 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 05/20] kbuild: only emit vmlinux relocations when
 required
Message-ID: <20260918-rustling-coati-of-poetry-dcc9d9@l-nschier-aarch64>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-5-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-5-9ecf4163ff36@kernel.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789759661-32FE3EE1-8C64E93D/0/0
X-purgate-type: clean
X-purgate-size: 1573
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 482D3A0494  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_122744_847158_F985D043 
X-CRM114-Status: GOOD (  17.18  )
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

On Thu, Sep 17, 2026 at 05:06:15PM +0100, Lorenzo Stoakes (ARM) wrote:
> A kernel build consists of more than one linking pass on vmlinux.o and
> vmlinux, at minimum two, and with CONFIG_KALLSYMS and BTF enabled on x86-64
> for example there are 5 such stages.
> 
> For architectures that build their own relocation tables (x86, riscv, mips,
> s390), vmlinux is linked with the --emit-relocs parameter specified.
> 
> However, this is only required on the final vmlinux link.
> 
> Symbol tables of trial links preceding it don't need it because they
> already check that System.map matches kallsyms symbols on each build.
> 
> GNU ld is slow at emitting relocation tables, so this results in a
> reduction in build time.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        9.5s     9.1s    -0.42s (-4%)
>   x86 defconfig, clean, gcc                30.1s    29.5s    -0.59s (-2%)
>   x86 allmodconfig, touch mm/vma.c, gcc    37.2s    35.8s     -1.4s (-4%)
> 
> Note that this has little impact on LLVM ld which performs this operation
> more efficiently.
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  Makefile                | 2 +-
>  scripts/link-vmlinux.sh | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
}

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
