Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DACC88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsL9RIp97C0Qxagnr7v/5ZGqplv/6DtdiXurcXPMBuw=; b=MCUi1kiEU3E+EA
	WW/ebFfX/4qFyQsjl/lvUAipQzBVCzaABiIy1VGuYDBi6jjKqDnJEDaP7pk95UcbZcdA4VU9yqsvN
	hsa80qBEADWYKYoIItCqSb0AJaug3L9EOkGtjhigdsixd9IO1lqpYPOzrP+wIOw1Yj0l8a0fMn0rC
	ZpbqsVamzaYr/LTpqblbvmtsWI2I2qyjwRpz/tTgRjv6dRJsd3okofGzb4iT7+9jsevHqvaLGIPUh
	sCDICUKGbS320F1eqqi6rEGwSja3h0L4Ixvena8/SMHf4th3XHy/YpAr7U5Mhf6okkn1nMQ5ZXaZs
	Vsd9oYTXNyLoYUBmHqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G1o-0000000C63z-39YC;
	Thu, 17 Sep 2026 17:36:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G1n-0000000C63n-14ID;
	Thu, 17 Sep 2026 17:36:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C711601FF;
	Thu, 17 Sep 2026 17:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B581F00893;
	Thu, 17 Sep 2026 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789666566;
	bh=A6BEPHfJejrl2NMcgOgt++Vj4JDcXR1qLSxmja4QVCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FA9DCRPWrubMAvnERnORM+6SiKp9G+5NEqmT8NLgc4cw8+dM5yUrexfPpKjZLgq2G
	 T6oWf4KbCUmdYWp4a6Ywf8JfoTGT19RAZu31rQshkBuXwW7VLXnDk/VYLMkCmg4K8R
	 bM8vXaHND7xJmLktiCGijMcbFy419jIeCIc8G471IqC7MEqrUuNGmUAmdXUYx9OW5W
	 5Zu1pDrZCZsqA61toqo4ozSI8k4UMSZNJ+1guH3onThUccGMN57qEZxQVdY3A8ZVro
	 LoH28RiDHXGljskteGln8hIsDd8zLZeDNYpFqe/qobZNYHPFWTpnkMXfzmbQSQAFNV
	 i6cs5n/Bksa6A==
Date: Thu, 17 Sep 2026 10:36:06 -0700
From: Kees Cook <kees@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
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
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 03/20] kallsyms: output binary data to speed output
 and kallsyms assembly
Message-ID: <202609171034.703D529782@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-3-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-3-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:13PM +0100, Lorenzo Stoakes (ARM) wrote:
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

A clear win. :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
