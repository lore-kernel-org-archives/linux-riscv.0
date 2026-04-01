Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD16D35177
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2QJ5bMSPvvxYjoEeSvVD1xDigYinAMSBN0XX5WZNrY=; b=tLicznrFBBKeZO
	H3BjLTSZQdVVQKdhjWaTsvmdaI+YSLXlK6ymNffHbNKITbMAHOTilkppysGQM4GhQKJGwRkrL0Fop
	JLpzB1mwRjL5M2VIXXhM6eSgu7WYkD0+c9fZRikmnRZ3YSEXCgOEzPB6GNYpltFBCJZ8DxSA3arFL
	Ofw5HURcLmE69LOBtHE8u54a7LLhlcd6n0Xn9s8XAUg10LRFCs6CL4Y3WYjLgulD+IMGzmhHyhxrW
	2ZoQRbsVx7ihUhNm+QtT9jMBreTs4BXFsJciECwfIeyNmM2qk457h2I8r4dvv0yMMLZmn8uvt2OYJ
	raACtWPgR0qhm9l/0wMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u3s-0000000EhRL-2NPn;
	Wed, 01 Apr 2026 11:48:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u3p-0000000EhOh-3i71;
	Wed, 01 Apr 2026 11:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36E8760142;
	Wed,  1 Apr 2026 11:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE8FC4CEF7;
	Wed,  1 Apr 2026 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044116;
	bh=ljnXuX5HwPO9n952btUletHJHOtBVyk1Xf5y47SLQh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7CRYS4IETw0CEZ0NBFJ9NJ7Srw9Q9SJGBqB5dx9NagMuyqc8NAQ7QI2LNuDqTtsU
	 cXTdniFrOXotXLNiYoIzv8/FMc6rjp6Y9iXHw6ytzNYDyy7kY3i5pz5PnDeYZJ42+q
	 k2jEvdGxqyQrAlfbok54A0BLe7rt8A0yaS6MmErdKMwP/VqrnqKQrd3eneqJSPBmjc
	 I22A+exN4GmReO/dkLfFCgCVorndbUnr4Y8X3K18TdefNFRwsg0z/MSWzMqqu0Ugjm
	 4uwsza3aByQxj2gKMRIC+jyTTFP8zqXpD23dJHCcbI0oNlhL7k6OePQoJ+l2j/j1NC
	 vn7gNIS5m0nxg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 13/33] rust: block: update `const_refs_to_static` MSRV TODO comment
Date: Wed,  1 Apr 2026 13:45:20 +0200
Message-ID: <20260401114540.30108-14-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
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

`feature(const_refs_to_static)` was stabilized in Rust 1.83.0 [1].

Thus update the comment to reflect that.

Link: https://github.com/rust-lang/rust/pull/129759 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/block/mq/gen_disk.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index c8b0ecb17082..912cb805caf5 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -140,9 +140,7 @@ pub fn build<T: Operations>(
             devnode: None,
             alternative_gpt_sector: None,
             get_unique_id: None,
-            // TODO: Set to THIS_MODULE. Waiting for const_refs_to_static feature to
-            // be merged (unstable in rustc 1.78 which is staged for linux 6.10)
-            // <https://github.com/rust-lang/rust/issues/119618>
+            // TODO: Set to `THIS_MODULE`.
             owner: core::ptr::null_mut(),
             pr_ops: core::ptr::null_mut(),
             free_disk: None,
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
