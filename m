Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8313EC9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 13:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q5ymJVUzbA70Yd/LAYqiVVBttcO/pAgSenD5i/lVMM=; b=brJs3raKm6sq2I
	U0+CEQlN/PI/f58yYy1BY/M53oh5X+QZoQCTwWDwUIlcv6Hy5WpjKS4/ZJOdb0IC3GykXqOocZQqV
	ZhL4/KEk6MAuvL9x5lz/mIyUAf8W6/zbRKr7VIaNLxWr1OT922vQE52sLAAAfJSgtp9phcPCgob4M
	se9oGFce+K7ksKEUX/NdYmLtA/ZO6e9r45tLBb8N7spRTmn64fhQ9TjgTPuqdWN13sg/Ab/sTTdBr
	n3it2u0Pdt0xSbc+RUz6DKJkmiJKx0TOwviqLR7YlRW26U20BzEiPsb73nmhscDkYqudK59jJXlSc
	kt+H4INY8+jPKw9S0Tcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jl2-0000000B7bR-1Eft;
	Thu, 24 Sep 2026 13:45:04 +0000
Received: from mail.avm.de ([212.42.244.120])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jkx-0000000B7ZX-2Emq;
	Thu, 24 Sep 2026 13:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790257491; bh=gBLnS3+lAYmZ5kf9JL3anFiz4fYL1hWDBsQwL263l/k=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=RLDQjDdgt7QOeFzsZ1IJ2gV5fSFGRDLdlg9Hg8hOOmyV2EaUYEmylWQZ+FbmamP+k
	 9HV4NH3s+lyQW3I1h2631oEqX8jsiRLLD+NeiEvAFJwIds6LhMkPngiC4DpAZuF148
	 rF8+PXMx1S4BlGmJPKxfsSC27sAmhA+jZcky1JOxYk1sBk3xrK7mx2nFDVlwP6F7a9
	 VgAG9vpt9fe4xngdnRoKfDHjNcHMMJSMi9YcdfKQ8wgcK8uOam+rSvOIKBH30ANQIb
	 8qGgu2WsXMnMirt/Gjxf56SfoRE6dGwBEetgfAZn8UcOpCXThvHk37EgDli1ofMjMS
	 Uslygc98EPwNA==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab52953-0449-7f0000032729-7f000001dcc8-1
	for <multiple-recipients>; Thu, 24 Sep 2026 15:44:51 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 15:44:51 +0200 (CEST)
MIME-Version: 1.0
Subject: Re: [PATCH v4 20/22] rust: make exports.o depend on the headers
 generated for it
From: Nicolas Schier <n.schier@fritz.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
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
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 linux-hardening@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260923-build-speedup-v4-20-73128809a4a4@kernel.org>
References: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
 <20260923-build-speedup-v4-20-73128809a4a4@kernel.org>
Date: Thu, 24 Sep 2026 15:44:48 +0200
Message-Id: <179025748880.4172706.14868306891021608350.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=501; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=gBLnS3+lAYmZ5kf9JL3anFiz4fYL1hWDBsQwL263l/k=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqtSlTKzAsNb3KAlPLj0QSENJsIHfwnQ8yLJWIb
 PdD13zZvHGJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCarUpUwAKCRCIxryciJpt
 uGGjD/9ODbOePpr2xjRjWb+mk2Bw35BUrXu5KQ8FyIBaOJfC8LNl3dAG0h/epaiw6+gGCUcqCoV
 Q3pj0r8gWUPb7IFUdyND0fm4NnmizKDSAj1aS/iM+1qF6+KcxebfwTqo6pUukhTKO/1bMk+Nc1h
 sxfRc0hHg8cVc1pw7RfGOYc7/hX0Tdowv6YHivIL+uGvlxZeBMEa0y/udNcjq2yEMWD25XvLqbm
 WKEKwqlOVh/F5nd9/WWCSrQhON7emYprPSD5ecZo8Ymjf9C+IeoxHXELJ/sWNx70XKXS0iDS0xg
 zaThLEGoO3SyycErqFEmC3tU0LcMH9KqgikPrJxgApXyuVZVa43I1zjt2hOPv9Za2Y0nMQz+7NQ
 fDMa084Q7RznP4sbTzAQcMAvEFc2WUAx9FSB/oalarygzJGNR+mK1+IN0jv/Cbso0x/oX5jHNbR
 EA1hTotxHDeyJtcvuvfirQLaLikWABqnJux/0r5MU72ClcJN9WRrxx+/ASsOYEHDCOfI1Xfx3R9
 9UjWiL09yC83csxRGUckCg5Dhi7uDpyAoYEgT4fNNs/H75VgKww6qTGQEHcCHUzIKb4RMu1aT1d
 IQyAZppEid3lBMbaABGYBnrFdZOecoKo06mlo7eC+6mz4OhpE4KG/v+UgiRn2DKgmYHNnizchn4
 J8E8QdflQiGphBA==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1790257491-3AFDB965-3EF13F3A/0/0
X-purgate-type: clean
X-purgate-size: 503
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 863FEA07EC  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_064459_749361_29489643 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

On Wed, 23 Sep 2026 18:18:09 +0100, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> rust/exports.c includes the exports_*_generated.h listing the symbols of
> the core, bindings, kernel and helpers objects, but this is not expressed
> in its Makefile.
> 
> This worked previously because the headers are always-y targets, and make
> prepare built all of the rust crates first, which is an implicit
> dependency.
> 
> [...]

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
