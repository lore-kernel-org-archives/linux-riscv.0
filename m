Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B8E9D827
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKWRrQqvExsS3aS2Y3QGyYeqzH4j+s/XGFRl6hbPC4A=; b=4F12nCjj1N0GDz
	OAIuhbdJiauOBeOEvUt/1WeOFKUYcIO4Cf13pH7bIRCB9vMbmtzWeeereuJEpMgnsJxmgaTSqmM7b
	MXDnT11Ga7VqjzK2rlbv3xro5n/ZZBpQGYx2h3r8NGgNzRJJ65MuOqLLU4C3G1Lvr6AjOjTtsSBJ5
	ZR2wLClLoCt4S8m2/gxBANLBQ3uK1MW1fKqKCMMc/eMX5YmXa2wl3C+FBHqaBWQxWhmDCv/kZWKIe
	+bEtwV/qHRDjxokYG7SY8rymidR3ECDHMKBiGy6Gg0NSHPDKrK8tAW6OAjKHSkO1fwL+o6IyUK0Kg
	sZu5Lwokz/aCiQCp2C9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XK3-00000004an4-419D;
	Sun, 05 Apr 2026 23:56:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XK1-00000004alt-2kCn;
	Sun, 05 Apr 2026 23:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16814600AC;
	Sun,  5 Apr 2026 23:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27803C2BC9E;
	Sun,  5 Apr 2026 23:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433364;
	bh=H/Ay6Jkav43FJVWalNMqy1drrqBC5z0jZaYEliYSxsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QWwho++CAQHqbiJSHYjIFW+3zbIRsYkzI2NhaXD915XErZ5bX8D0JSqumwCvnboQC
	 JA2kZyy0PbupBQQ6NzUS0I5RoleMORu4/mJ8QJHPf8WuIxsJK2BntYwSEFYuKrHgs5
	 VPKZomQQHZR70NsihUxiVAScWTSo2yfHf8uJ/qsMQd0mTZH9HvJHft2Dn5JgiAXnIO
	 3PdrXjw1Cnt6FYPbyK/FBO1nONRhPiI30ad4Kc7dhk4L7g63i4MoWAU0uWhs56aoAB
	 o0/TRdl5mjZSVEIann5jDzC12StU6bGXcn2XxNGHneIkfSLv34y3M6cbP04LdQktPx
	 m2gUzuUeHkCMQ==
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
Subject: [PATCH v2 14/33] rust: alloc: simplify with `NonNull::add()` now that it is stable
Date: Mon,  6 Apr 2026 01:52:50 +0200
Message-ID: <20260405235309.418950-15-ojeda@kernel.org>
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

Currently, we need to go through raw pointers and then re-create the
`NonNull` from the result of offsetting the raw pointer.

`feature(non_null_convenience)` [1] has been stabilized in Rust
1.80.0 [2], which is older than our new minimum Rust version
(Rust 1.85.0).

Thus, now that we bump the Rust minimum version, simplify using
`NonNull::add()` and clean the TODO note.

Link: https://github.com/rust-lang/rust/issues/117691 [1]
Link: https://github.com/rust-lang/rust/pull/124498 [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/alloc/allocator/iter.rs | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/rust/kernel/alloc/allocator/iter.rs b/rust/kernel/alloc/allocator/iter.rs
index 5759f86029b7..e0a70b7a744a 100644
--- a/rust/kernel/alloc/allocator/iter.rs
+++ b/rust/kernel/alloc/allocator/iter.rs
@@ -42,15 +42,9 @@ fn next(&mut self) -> Option<Self::Item> {
             return None;
         }
 
-        // TODO: Use `NonNull::add()` instead, once the minimum supported compiler version is
-        // bumped to 1.80 or later.
-        //
         // SAFETY: `offset` is in the interval `[0, (self.page_count() - 1) * page::PAGE_SIZE]`,
         // hence the resulting pointer is guaranteed to be within the same allocation.
-        let ptr = unsafe { self.buf.as_ptr().add(offset) };
-
-        // SAFETY: `ptr` is guaranteed to be non-null given that it is derived from `self.buf`.
-        let ptr = unsafe { NonNull::new_unchecked(ptr) };
+        let ptr = unsafe { self.buf.add(offset) };
 
         // SAFETY:
         // - `ptr` is a valid pointer to a `Vmalloc` allocation.
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
