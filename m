Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F288DC982CC
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 03:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DVq+syVABeKyOurh3QCdSWgniSrDIfsTXqEF8Z94hRc=; b=u1DqJpAsEts+WE
	3K1qI4FNLW8kcRMYUnjE9XyvHiB7/s9d2cKbtjlfBZVqz+uMu8l7erwFgRO88+mVYbJ6h3sCnd5/X
	3pTX5VH12N1NoIjvVQiJqhlb9A2HeAcNIN+jcgqPsBj5twbtLm5Buc3UHhzLY04d7POD4Y+sFf27l
	55hAxraaR53O2DGQ8Kb7mdESWXDCHtAZhktaHKgrJ+Ru58abSYBKHAaH4uxzV0r1jCsS5oBLBPO2K
	jVzHp2G1XBAQCAyWpO50cOM8mnPiD/abRl/NnGgWSvlVheThzttzVmz0tTbt6BTiyCDK7Y/qiGjJo
	rUrbb9DcRgCxksP/CUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88Vq-0000000GpeD-0IXB;
	Sun, 20 Sep 2026 03:46:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x88Vo-0000000Gpdu-0gk2;
	Sun, 20 Sep 2026 03:46:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B536601FD;
	Sun, 20 Sep 2026 03:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2021F000FF;
	Sun, 20 Sep 2026 03:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789876002;
	bh=RAgjdNuY0GHwXBswA5NShTSJab25cAeZ2wGxG0I/vUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pq1c/x2eNDaaA3FhHkOhGuCnsEwXECeh01hVEHOpDv8HFPU3D8PLxh2wVU0nylDaJ
	 7EaPp5slBBZUiOqsjhzEs7IgscKJPgdM3bXnpCs8IVuHJRaG5hD0rrtfwkhInaUah2
	 UEwXWAbH8m3JDS27foafZhT7dYncShEItD34AqEMdXClbdFXPJauYFWvvxe4hWYd96
	 N8ZnwsnLY9Xqn+sIDhK7K9lW5wcmPeM+9vJTKsXnZtJMmVVGCpp7vNL+wlt5H2W4zk
	 L6Y0Pud3rjcJlvf9NtFTivJRz4pQVpslkC4pi8p+/DINuR9TeguqodaZGqQrIxp572
	 Ic8aE8TCrC2FA==
Date: Sat, 19 Sep 2026 20:46:42 -0700
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
Subject: Re: [PATCH v3 09/20] kbuild: implement and use depcheck to check
 dependency timestamps
Message-ID: <202609192045.24A5A4E876@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-9-9ecf4163ff36@kernel.org>
 <202609171117.35BFDCC13@keescook>
 <202609171229.31BB336E1@keescook>
 <aq6_JcIy6gOsN4oa@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq6_JcIy6gOsN4oa@gremlin>
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

On Sat, Sep 19, 2026 at 06:02:46PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 17, 2026 at 01:59:26PM -0700, Kees Cook wrote:
> > So, yeah, it makes me nervous, and it may make incremental builds less
> > idempotent. But I can't really find extant problems and the demo is
> > slightly contrived, but not exactly an impossible situation.
> 
> Ack thanks for this!
> 
> There is definitely an issue here, your example is fine in the stock kernel
> but one run late in v3.
> 
> Solution is to have depcheck treat any dependency that is itself a target
> of the same run as never being 'fresh' (it already reads every .cmd file in
> the directory so has all the dependency information it needs), so that's
> fixed in v4.
> 
> Confirmed that it fixes the demo'd bug here, that touching a header
> rebuilds exactly the same objects as it did before and that noop build perf
> was not harmed by the change.

Oh very nice! Thank you for finding a solution there. :)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
