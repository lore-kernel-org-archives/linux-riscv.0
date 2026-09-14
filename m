Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0943BC88E6F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Er27pdpy//pfbfooytKnz0odwpaJwEVsKNAXW0jmUc=; b=aHUZIt3GXNpFDe
	O8lxtgou6LCYQGiy2ebUn2Au4pbAkHMt26nh7I4VDJE12gYLMXfcax1f8/GcPqQLzsQ7M6moI0wLJ
	KdKQ+V8eIvrt+XkDRoJDWPM9HZ1Z8s4EfH5fqJ+s80mh3AmWY2PTXP2KuRPjGRFgDV4ELxtOeU+ff
	Io5t6swNfPFGQp6E80UpbBHkY9OZ7DtRpDNMyNQ6BZ8QkNWUIIxP8Wu48EM2OsPSS9Um/69ToGtC+
	7PaywrWBOQ3XjKnDsNghcnYMElil2NV5QUsUuP0C96Ct/dRVgIvqSClvZi+/tInlqnjBClDpl2fNd
	nKahSExHDAj4MogxHEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Aox-00000004PJS-03JS;
	Mon, 14 Sep 2026 17:50:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Aou-00000004PJA-2xX1;
	Mon, 14 Sep 2026 17:50:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1002143E41;
	Mon, 14 Sep 2026 17:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61DA1F00898;
	Mon, 14 Sep 2026 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789408219;
	bh=e67qZ3QCn2L8qyNk+mdAvO35N1up2MXWgPivIgLpess=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VzhPxfhrNGwUFy/l2g4I81wR8gE/J718KmUtsDuY/Uh6uBvIcRmhC5kc8HQt0wGA2
	 brpSBw73lF6qYAafp2WUtJU+3pucoX4YyQOUUaz9p4ygq6pNrUXZIMlbn4gYEXsohf
	 bhstkaAV1y+GgJQzeladwBwQ4/xbaBeFfcoyFp0d/FdRjbO+4+HbiFSpuQoczjcEfw
	 sBB7VEeWFU/QcEEEiSjFBYIgF300IaDeV+5AG/C7MAsOZOlCW1sCy8cOGc/cQRr7qT
	 VvtxBqcopXv4rrKOLi6jWjhgFHFOUqy4WC82WwOIBmeDMhNiG05AJMZ2nPVLgOKFOD
	 KhM7mBnSCMeuA==
Date: Mon, 14 Sep 2026 10:50:19 -0700
From: Kees Cook <kees@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
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
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <202609141049.4B795585A@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609140844.FA7E848A@keescook>
 <BCCCC1E7-25B7-4A8D-BDFC-D5D1FA295F6C@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BCCCC1E7-25B7-4A8D-BDFC-D5D1FA295F6C@zytor.com>
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

On Mon, Sep 14, 2026 at 09:49:50AM -0700, H. Peter Anvin wrote:
> On September 14, 2026 9:39:07 AM PDT, Kees Cook <kees@kernel.org> wrote:
> [...]
> >diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
> >index 0b1ffdf9f7a3..fc38c5020b22 100755
> >--- a/tools/lib/python/jobserver.py
> >+++ b/tools/lib/python/jobserver.py
> >@@ -29,6 +29,11 @@ $claim child to do the actual work.
> > The end goal here is to keep the total number of build tasks under the
> > limit established by the initial ``make -j$n_proc`` call.
> > 
> >+Setting the ``SINGLE_THREADED`` environment variable skips the reservation
> >+entirely and runs the command with ``PARALLELISM=1``. This is meant for callers
> >+that run many short commands in parallel themselves, where each one should use
> >+only the job slot it already holds.
> >+
> > See:
> >     https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.html#POSIX-Jobserver
> > """
> >@@ -68,6 +73,13 @@ class JobserverExec:
> >         self.is_open = True  # We only try once
> >         self.claim = None
> >         #
> >+        # SINGLE_THREADED asks for no reservation at all: the command runs
> >+        # with PARALLELISM=1, using only the slot its caller already holds.
> >+        #
> >+        if os.environ.get('SINGLE_THREADED'):
> >+            self.claim = 1
> >+            return
> >+        #
> >         # Check the make flags for "--jobserver=R,W"
> >         # Note that GNU Make has used --jobserver-fds and --jobserver-auth
> >         # so this handles all of them.
> >
> 
> If we are going to add dependencies, can we add *any* scripting language that is less stone tablet than POSIX awk?

What are you referring to here? The jobserver logic is all Python.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
