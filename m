Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CB6C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZF2bB+DhUFHO1SxZiwAVshLC+69MmRmCZXNf1qhg8o=; b=vik333MoionpEc
	s4yu8Jq0JoJF1SJbEK6+PuGMxS6LhLYXTWygaqLJxfOzNkZZPcP5nv5dCYFmP2Cnqb1jC6ADtSnbE
	YN3xhXj6vIvm3zyTuspRv3lIgDX0ZGEm3jJQGNFXILMmCUUC7DPTfJbtr98fepg2MHzqUWPljgznj
	rfiuRsiaOUQRAC1/9jgsiEpBKNTvezWDeWf/sJiFmy4Q2aylPqtwep3PdZdOY8GeEETI97EljgmzA
	g3M4kQuZ1SxKkkVwewevOja1LMzxRkCMz2HlpRSCibNWHY2ueaGUhE8dOYycH3VVl0QamguppwBuu
	XoNQDKtU0JjtlC7vQbIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dqf-0000000EKl8-2MO8;
	Thu, 10 Sep 2026 12:25:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dqc-0000000EKkR-1esP;
	Thu, 10 Sep 2026 12:25:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C9226600E2;
	Thu, 10 Sep 2026 12:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C331F000FF;
	Thu, 10 Sep 2026 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043144;
	bh=r3Gniwpo9ILrHoRb1aFF/nqXCtCQyWfCq/qLdr8+214=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PI8pDV1prtOGYW7AWbHlLpNTedtkWAPrIKf1M5A7RKP0hM+8yxmyoUu6OFEVzKG/q
	 XixS2nm/5Eou4W/qCEB3ONp1Yc9ZySHO3GOg3k4oPK0F+5UPjC9PFm6ZW6SwjCcivm
	 9Ix17KysnbobtA/5+LI+/oa9NAk6lS57l9t3ZAlcJcP/DM5W+fxMmXWRhVgFkMqB7N
	 7xbpELojA6FZ71lAWC+hAB+XLJAikRriFccjpI8n+0t10y+9OF2Bo8NK/7xrY72Tg1
	 wxA/kLVbRVcP7aI18eu+UVFWzMsGpo1WD8uaVzVKCtPcgRQTaYdb3Iy3Y+/rhyOZM5
	 jRCLkt9dwKK9w==
Date: Thu, 10 Sep 2026 14:25:26 +0200
From: "Nicolas Schier (FRITZ!)" <nsc@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn?= Baron <bjorn3_gh@protonmail.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
Message-ID: <aqKhtoJZC0tt3OGj@derry.ads.avm.de>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
 <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 09, 2026 at 10:22:33AM +0000, Bj=F6rn Baron wrote:
[...]
> I tried implementing this a couple of years ago, but back then
> if I recall correctly either binutils ar or llvm-ar was unable to produce=
 a
> thin archive referencing members of another archive like Kbuild expects to
> do. I'm not familiar enough with Kbuild to know how to skip the thin
> archive production.

You might be referencing to llvm-ar <=3D 14, cp.
https://git.kernel.org/stable/c/a48bd961fb20
https://github.com/llvm/llvm-project/commit/d17c54d17de22d2961a04163f3dbc8e=
973de89b8


-- =

Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
