Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E535C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvTZCaaZro7zAoq5uyfaYJNOvxy6nXEzRQIG/y56IO4=; b=kUW1/h6wwb9dZ4
	/UY2yetKjf5C5s4ZtW+b1HzUPYM+eaxsz28YKT6W0itHE3WhKsVLAuTakQi7vY0Fu843HS5/5CVIG
	KaSyMqfwDa84SljiahxTZNZfVkhMP0/HXwW5BoG0vDDIUZXmIZVw3ukTWxG7klguo/BXSJENYFPzK
	FIXlBX1KobBD3bEIEM1UowSPH6S9GFrRxpDhF4H9yQpL1cuQQ0LvWPSV6La0945p4vNZpgVMLLx3P
	r5/6x8apcFN+HWaJhMCN0P3s2lIofg8ULDPRbQgnj+5pZR+BQxu4SZx7SuFNLcNFPkh3PiqCTt3ML
	WbnOyzsyUd+Pd8dCM4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k0h-0000000FDk3-1B7H;
	Thu, 10 Sep 2026 19:00:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k0f-0000000FDiw-36zB;
	Thu, 10 Sep 2026 19:00:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id BC4EC60AAD;
	Thu, 10 Sep 2026 19:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C19AF1F008A7;
	Thu, 10 Sep 2026 19:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066832;
	bh=qVLCzCol0ztHmPBF0fa8Jwjb86wBY4YsV5QLOxzKWYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fpt2DW2DYha1MqdROAQMJuWiFYGP2IXkY29JJawBo8RZ6Ij4EMIJzWGzzTj8Fz9if
	 fwvuecYFpKATLPy/E6JBQLSpVSg5fkTPerDXEl5QcC3WMZ1ExStoj3AKX2lAf3yBfy
	 ohO/V2c3DDBc7QRsB4WqARy0H46e1HQjPK9yvegAcLogsjQFUHTyjrCOze21/9RJcF
	 eoPJkrHBYKOtulGI2+dAKmgMwkVWoUWR1xs5RvxLdWYAvmSeC9oTy6tA5kmjNhu4aA
	 9IZ47udxuU4aDKE+9Q2nPRPOuTqaTza60/Br216MGndlCKBlzO1A9KjVvaklnLHWFb
	 rb81xbPcYsw1w==
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 01/23] scripts/mksysmap: drop the MODULE_INFO() symbols from kallsyms
Date: Thu, 10 Sep 2026 21:00:15 +0200
Message-ID: <178906667516.724141.3737829890204628745.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908-build-speedup-v1-1-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-1-5dc1ac01672d@kernel.org>
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

On Tue, 08 Sep 2026 21:55:01 +0100, Lorenzo Stoakes (ARM) wrote:
> Commit 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> keeps .modinfo symbols out of System.map and kallsyms, which assumes unique
> IDs have a format like '__UNIQUE_ID_modinfo123'.
> 
> However, commit afb026b6d35c ("compiler: Tweak __UNIQUE_ID() naming"), sent
> in the same cycle, changes this to '__UNIQUE_ID_modinfo_123'.
> 
> [...]

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[01/23] scripts/mksysmap: drop the MODULE_INFO() symbols from kallsyms
        https://git.kernel.org/kbuild/c/3e2276de

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

The patch is applied to the kbuild-fixes-unstable branch and accepted
pending wider testing in linux-next and any post-commit review; it will
generally be moved to the kbuild-fixes branch within about a week if no
issues are found.

Best regards,
-- 
Nicolas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
