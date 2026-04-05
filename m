Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2424E9D827
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yItrWqTapYnonlDKfMeVgK6ymMnIEFSbPM+pehL+y/I=; b=I+ebQaQIC8EZuq
	jMsG8YEa7FBuNYPaTtoCBOfwI8MBaVd3iMEVeDOSbzZ4EiWFpMsf4kv/3NtvUFGI3C4NPsl54vFSB
	AFh1g/GxOwYZJh+bkqNNOyn+wdp0+s6RSOh4KaWwnZ5lJVykZ0sT4/B0tJUsx5nXxa7tlUI3dNzCT
	czYcvhF5NoE2mut05IiXR+6itGNNLcWWQluqkDgsjfZ3MEmnWHEhYQJWoEhPZ2EyyodSS6lAuU5Q5
	Fn4rp83w0a95r4cnTqsUzQjvOBWmwfHSQgm8FQjY6qVEy4KO32vRNSsQ10ofNJn7fJj6MzNDILQ5B
	UPz4TO9P2XKFSqW9/+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XJt-00000004ahH-1FCh;
	Sun, 05 Apr 2026 23:55:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XJq-00000004afs-22UH;
	Sun, 05 Apr 2026 23:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6F47600CB;
	Sun,  5 Apr 2026 23:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DC7C116C6;
	Sun,  5 Apr 2026 23:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433353;
	bh=5w/hrnObbKhvO+jKV9Ekcn8KO5lrvAgEuh7kkEvfcjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pFKlWdbIbGq0s7ECR/XX4/m1j5ueBsd37sKXJ5uePknRDz52bcxRKKdQUe1jTopVz
	 My33xj+WU7MHbje6Gh0L7CxJ3KxzvwAzOCWOcACpPEKqFS6mcKRf8vZJADvLXmZb8Y
	 o52+2gns0KIFCn54pt8VBrZ+FWo9rC1to0WiGTYC13dYbxzXvTcpelifn0bJwujKk8
	 86EYB1I8NJU19juZwmDdg9wxjSeTqxQvMdO4C+IKLVR+fihXZU6p1+0tn/pIcBpd8O
	 l9nnLvpiSxsgD13f15cAIkVKNBh1pZpZ73szNIqI8iXIz7LHd1T89xgFnRcsHNKyFY
	 9vVjtBOKjhKqQ==
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
Subject: [PATCH v2 13/33] rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
Date: Mon,  6 Apr 2026 01:52:49 +0200
Message-ID: <20260405235309.418950-14-ojeda@kernel.org>
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

`feature(split_at_checked)` [1] has been stabilized in Rust 1.80.0 [2],
which is older than our new minimum Rust version (Rust 1.85.0).

Thus simplify the code using `split_at_*checked()`.

Link: https://github.com/rust-lang/rust/issues/119128 [1]
Link: https://github.com/rust-lang/rust/pull/124678 [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/transmute.rs | 33 ++++++---------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index b9e6eadc08f5..654b5ede2fe2 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -66,16 +66,9 @@ fn from_bytes_prefix(bytes: &[u8]) -> Option<(&Self, &[u8])>
     where
         Self: Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot
-            // panic.
-            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_checked(size_of::<Self>())?;
 
-            Self::from_bytes(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes(prefix).map(|s| (s, remainder))
     }
 
     /// Converts a mutable slice of bytes to a reference to `Self`.
@@ -108,16 +101,9 @@ fn from_bytes_mut_prefix(bytes: &mut [u8]) -> Option<(&mut Self, &mut [u8])>
     where
         Self: AsBytes + Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at_mut` cannot
-            // panic.
-            // TODO: replace with `split_at_mut_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at_mut(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_mut_checked(size_of::<Self>())?;
 
-            Self::from_bytes_mut(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes_mut(prefix).map(|s| (s, remainder))
     }
 
     /// Creates an owned instance of `Self` by copying `bytes`.
@@ -147,16 +133,9 @@ fn from_bytes_copy_prefix(bytes: &[u8]) -> Option<(Self, &[u8])>
     where
         Self: Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot
-            // panic.
-            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_checked(size_of::<Self>())?;
 
-            Self::from_bytes_copy(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes_copy(prefix).map(|s| (s, remainder))
     }
 }
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
