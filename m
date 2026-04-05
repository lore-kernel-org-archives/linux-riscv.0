Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD52E9D827
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 23:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/L2VHGpKT19DQRpkVqNbvLYeK+wWKF+UcULQQhZ53c=; b=kOPACaS/p0YUMZ
	744H+xtBJCb08ax7RNgR8BSmteePtaH0RwLlHiKPrX5sRooy3tHMjwGHAsIPYVyuY7LursX+x7m3C
	O5J91Pt21HbeC8GbGt9n60rcWf7lplaWnbT4bblyjD+AtneeNixr/nKjfsS08dVXWUEUwwDgz5GwD
	uqCqF7gkn7KXdhEHkiJ9Y7RmSiOYXNBAVMz8vDrv4dpyLZqkkK5E82Nk5h4qCn+P0PcVeBnAC0bKV
	H+LhytFvO0UgGAWWOtr5tNys1Bqxzkk0GgsTVs91F7BT2q3C0lbgmGEo2Uvlqdi/YYYv1fP0U403b
	UeBQTTrX+DZwFPvOdAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XJ9-00000004aGP-1Qr8;
	Sun, 05 Apr 2026 23:55:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XJ7-00000004aEq-3hir;
	Sun, 05 Apr 2026 23:55:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51C7560103;
	Sun,  5 Apr 2026 23:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B924C116C6;
	Sun,  5 Apr 2026 23:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433309;
	bh=nKHljoFNdh6GE6jo8Il2V+4MwOz3gplkmJ7uy9RqO8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8O6kikOLR/V/02C2dby6Y/oProcMBLuoWXI5fMzDgnA9/gNHDmG5OW3v12U4+ApI
	 M7D5j3PQs8Qn+TqxBWio6NqZavJX48yjJQcSrZWhm8UkapxbQBbJSMLn6Rr4hL+BcU
	 oBrMFthjMoPxGtYqz9gtVtvfzl1E29Z2GrDcd8+s/AFhsdXRbbFjVuYvp+FvDnANfA
	 WiH9Ua8ujabe8zcqKO6Z20ebB8N4ELMduY+UjyCpId461mgHnIQFj2ULWzmdcI+jvd
	 2FtIsQzI1tFD6BdmI8fKDyTf0fLsclaDPgIVP/+AuFxyuGsxjKdhSm5o8sCv314tib
	 yJ/keu9ic/DVg==
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
	linux-doc@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 09/33] rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and simplify code
Date: Mon,  6 Apr 2026 01:52:45 +0200
Message-ID: <20260405235309.418950-10-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
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

With the Rust version bump in place, the `RUSTC_HAS_SLICE_AS_FLATTENED`
Kconfig (automatic) option is always true.

Thus remove the option and simplify the code.

In particular, this includes removing the `slice` module which contained
the temporary slice helpers, i.e. the `AsFlattened` extension trait and
its `impl`s.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig           |  3 ---
 rust/kernel/lib.rs     |  1 -
 rust/kernel/prelude.rs |  3 ---
 rust/kernel/slice.rs   | 49 ------------------------------------------
 4 files changed, 56 deletions(-)
 delete mode 100644 rust/kernel/slice.rs

diff --git a/init/Kconfig b/init/Kconfig
index b8a1ab0d49d4..c38f49228157 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -178,9 +178,6 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
-config RUSTC_HAS_SLICE_AS_FLATTENED
-	def_bool RUSTC_VERSION >= 108000
-
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 138d846f798d..621cae75030c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -140,7 +140,6 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
-pub mod slice;
 #[cfg(CONFIG_SOC_BUS)]
 pub mod soc;
 #[doc(hidden)]
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index e9d37f307f2a..44edf72a4a24 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -107,6 +107,3 @@
 // `super::std_vendor` is hidden, which makes the macro inline for some reason.
 #[doc(no_inline)]
 pub use super::dbg;
-
-#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
-pub use super::slice::AsFlattened;
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
deleted file mode 100644
index ca2cde135061..000000000000
--- a/rust/kernel/slice.rs
+++ /dev/null
@@ -1,49 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! Additional (and temporary) slice helpers.
-
-/// Extension trait providing a portable version of [`as_flattened`] and
-/// [`as_flattened_mut`].
-///
-/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
-/// have been stabilized and renamed from `flatten` to `as_flattened`.
-///
-/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
-/// by different methods depending on the compiler version.
-///
-/// This extension trait solves this by abstracting `as_flatten` and calling the correct method
-/// depending on the Rust version.
-///
-/// This trait can be removed once the MSRV passes 1.80.
-///
-/// [`as_flattened`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened
-/// [`as_flattened_mut`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened_mut
-#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
-pub trait AsFlattened<T> {
-    /// Takes a `&[[T; N]]` and flattens it to a `&[T]`.
-    ///
-    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
-    ///
-    /// [`as_flattened`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened
-    fn as_flattened(&self) -> &[T];
-
-    /// Takes a `&mut [[T; N]]` and flattens it to a `&mut [T]`.
-    ///
-    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
-    ///
-    /// [`as_flattened_mut`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened_mut
-    fn as_flattened_mut(&mut self) -> &mut [T];
-}
-
-#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
-impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
-    #[allow(clippy::incompatible_msrv)]
-    fn as_flattened(&self) -> &[T] {
-        self.flatten()
-    }
-
-    #[allow(clippy::incompatible_msrv)]
-    fn as_flattened_mut(&mut self) -> &mut [T] {
-        self.flatten_mut()
-    }
-}
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
