Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78295C79FBF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZ8A0tY23TdVKS8dJeSTv3O8yJi1uKheCGKst0tDDy8=; b=Q5k1C5P+5kBQ2k
	Y6lbZPZ3Rw4e3zL9qleo2+Bw8P3zoVB+77BuHtudwlpUXUf0mvrGzPtEgRmOS6ieJr+nC5uDmBLez
	lFyIH5zDt3kfZXea1q1hbLqhQV+vSyZ9+liAEkBIafNzH2gSDaSqtqvftWSFFyGnuzJtGDyoEH3ei
	jx8hcMLKh7i32DUaQErCl6btiN7d364R9MPUz93Gu0EHkbg9M/H3Fz1jdewxCA5T9LxqmxohVIhYN
	yZgQVm/4+1vcEMzWJCEKZ9QsZHiGZj6Pm78UtI+5Qz+zxkLJSnEefeyAV3LrYEvaPtE56kLVgEWKl
	1CIZnr5kO4sbxTUSXmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k0j-0000000FDlA-25bW;
	Thu, 10 Sep 2026 19:00:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k0h-0000000FDk2-15u0;
	Thu, 10 Sep 2026 19:00:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id CC90F447C0;
	Thu, 10 Sep 2026 19:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 156B11F0089D;
	Thu, 10 Sep 2026 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066834;
	bh=adpUAXMLWlwls3uA0tHpuBpUMbpToZc2bhx+dPqey8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Uo6MJqkiza5YQp8bmOAnZZ7Clc3G4MCqQgdKfnCBsPBugXp/06M0nPAXCsmC8NpwI
	 sXIcCQcWDcUKPDlMwiuyrKxmuiuj/of1ACyYxanR5qSG8LOCML5FtrJ7/T429DaAEq
	 GG8p/bKvaUOzzKlZEPxAneoX1o5Lz0hX6QrC4vPGMGXR55tnZVsvE81ITy6gcMjJ6w
	 TmQiePj48cDDpnvMR3NrRqPFm7ZLv+5rKuhm0n1HGvXyj7T7UNuJOoVs00l/jQxE1w
	 /8HTbwN9Hd38NoU2MTSbv3XawJfpUUhnYe9+RygWi0HdpC0JEr7CWkIpFzGtKzdaYQ
	 vCh3f4bpTQdnA==
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
Subject: Re: [PATCH 02/23] scripts/mksysmap: fix escape of '$' in the __pi_ pattern
Date: Thu, 10 Sep 2026 21:00:16 +0200
Message-ID: <178906667522.724141.8105989008359153155.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908-build-speedup-v1-2-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-2-5dc1ac01672d@kernel.org>
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

On Tue, 08 Sep 2026 21:55:02 +0100, Lorenzo Stoakes (ARM) wrote:
> Commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> converted scripts/mksysmap from a shell script to a sed script.
> 
> However an error was made - escaping of '$' required \\ escaping in shell
> but only \ in a sed script.
> 
> This was mostly corrected in commit 7a6c355b55c0 ("scripts/mksysmap: Fix
> escape chars '$'"), but this fix missed arm64 PIE namespace local symbols
> like __pi_$x and __pi_$d which appear in System.mapand /proc/kallsyms:
> 
> [...]

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[02/23] scripts/mksysmap: fix escape of '$' in the __pi_ pattern
        https://git.kernel.org/kbuild/c/b99d1f50

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
