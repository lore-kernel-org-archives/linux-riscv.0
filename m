Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47607C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCKfTBF92sm3cXE44/hIDTFD5GxcjpN8TwhxUaIlmpQ=; b=XRgL6J1K7csRi4
	T/qG5bW0yMIdk5A05KmFFIVm4kxI2XJHw5w1y/6IqM+YX7uNYoJyt0GOrkhhxw6aM9u7dvZjFa1ZA
	onc2S71GZCzGv1tkgWMFfHrQptinqqnxwWLm25DJ+gUWXjowkShEfcp8ViRXdwwgZsaXGkVgbdr9d
	Dd9MSW+7AcRD86JF3uJbnTUxBQjU+Ur1ODaDF6hbT7YZhRThaJb8f50TD8DVfw5eQCwKIbzmgab8u
	RfERTm4frrPAyeurWpJrhTb9KXUsP4rZEa6y9ZzBgACmISHb3lwV79bp7cP5Ip88hP4/Ah9TApwJg
	w4f7G5Vb+Vsn6Z1zeyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42rF-0000000AEjI-3BPw;
	Tue, 08 Sep 2026 20:55:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42rD-0000000AEi4-2LoK;
	Tue, 08 Sep 2026 20:55:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ECA3407BB;
	Tue,  8 Sep 2026 20:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769721F00A3A;
	Tue,  8 Sep 2026 20:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788900955;
	bh=Y87Ru0xfYAGxRwASt8W2uZE0vluulQEq4vWCkr2qehk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QyylYyUh712yA+wXv0MkQw/+SKQgxmL401+ubHQJwu+ZIzBE8vWqhj+V4R6TMaiHM
	 Y60hJq5rQ3/d9d5CNityd7xig6O+4487SsyyzAbI5j9JWEqg1fBPN4mW7Y0xf3E57W
	 oEGnEeBaKJnD4+eeJylQ06J8g6mUkNnGrMBWzpyf+bPrZStFN+yY63wBlvPS6YeupJ
	 SmNBcrI1XpyFQx9QaXKXWXDETpxFWmsyd/pCLcfeZuXv9msSqXrxIyTaDgz7ecm0jm
	 QsJMlDs7cKdvveUp91Za2I0LitMt5Y1sCLbcdrH1DKRVcK09/RvD8ADXffWwOfymjH
	 IyU9PE5QiiKvw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 08 Sep 2026 21:55:02 +0100
Subject: [PATCH 02/23] scripts/mksysmap: fix escape of '$' in the __pi_
 pattern
MIME-Version: 1.0
Message-Id: <20260908-build-speedup-v1-2-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
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
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197; i=ljs@kernel.org;
 h=from:subject:message-id; bh=pcsijpekNt+DxklwcjLik4aRG5CCfOXcviThDorMTJE=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLIWlJker97TJDyrb4PQ+6XPvAN8LNze3ZELTohu0v29J
 yLUj39BRykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACZy/i0jw08mn4fvXq4u+Fa8
 i/Fq9u+vctwXl2RL3vaT5v0085vVum2MDK9+Kl4Xyq24lPJZ8b3/vJj9veGOjkp52yRuKrG/+/v
 8BhsA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

Commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
converted scripts/mksysmap from a shell script to a sed script.

However an error was made - escaping of '$' required \\ escaping in shell
but only \ in a sed script.

This was mostly corrected in commit 7a6c355b55c0 ("scripts/mksysmap: Fix
escape chars '$'"), but this fix missed arm64 PIE namespace local symbols
like __pi_$x and __pi_$d which appear in System.mapand /proc/kallsyms:

$ grep __pi_\\$ /proc/kallsyms | sort -u
0000000000000000 d __pi_$d
0000000000000000 t __pi_$x

Fix the escaping properly.

Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")

No measurable change in build time.

Assisted-by: LLM
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 scripts/mksysmap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index 56a8b8bbdb37..856b26ba2ac0 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -35,7 +35,7 @@
 / __efistub_/d
 
 # arm64 local symbols in PIE namespace
-/ __pi_\\$/d
+/ __pi_\$/d
 / __pi_\.L/d
 
 # arm64 local symbols in non-VHE KVM namespace

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
