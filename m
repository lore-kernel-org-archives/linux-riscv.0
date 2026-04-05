Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D58E9D828
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 23:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OD2OiL5elZrNrVvp2JcYj3v+RcHvOTzy2H3sApEiiug=; b=Dc0hJ3mRZDDsp4
	hz7VIpMImXlGSyKOKjbCHlI3UbDyYSY3ePij4xE12u5WkmmNEUrh3GWtUzq1u0fdWaG+xTROhdr3a
	5yu+v7+NQEXqEDmOhuB7T0CUeJxChmo0c1nkY6nErH5LLOKPQqPDVSbKHsVYNj0mGV7VpheFg+syq
	hpS0jzxPJDga7Pt8sQoajX0jTOOnpmrwgD40sgwUlzIMiHcbl0fdJrEQ+Lf639fNSgm9r/q75gqrE
	xOhEyzadAzlJjjLN8Rjk3Kd9E7bwmUVgoEYPgVZtjyaaD+wfkGYYffYILlvIeX68nF/PDYAitW30u
	h2eovtvgZ/BaZS7gQ29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XMP-00000004c7R-14A8;
	Sun, 05 Apr 2026 23:58:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XMM-00000004c5y-2aB7;
	Sun, 05 Apr 2026 23:58:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF559600AC;
	Sun,  5 Apr 2026 23:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14A7C19425;
	Sun,  5 Apr 2026 23:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433509;
	bh=+uAzwzhajFxAA8rib6hw5ihE6F38Ir1uk4Ke8nADAT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S0Y52XzGRmB43RgfGDFkHin7pnQro38Xf89fl+vv/EjSwvic8hMveYt5cYlW3nycO
	 deNzfkR1lB2hbs36DJMWohpvE5Oy0p3rMrKJ1hzNYsP/gFxDbBBrYqRDxxAVr9Klde
	 3WaoLJ6wHtg3BzXSKCQFH0FMysZsko45cPJ05GTdm4/eJVVUxz2U6vcUEdF7Jth0tB
	 8NGfw2aUbMBlX6YEVe7grn/ZP3D3jAqnEl24sS3j6ofBTvE4dTN8/Ng4Ox6Tmk8ku5
	 WD8F1YUimCMA/13jnyecrGpIyYsoFKhMKg0YCGt/aA5dxGUmbZDigYCj1+BOErfqzu
	 cHrUifwInMzJQ==
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
Subject: [PATCH v2 27/33] docs: rust: quick-start: remove Nix "unstable channel" note
Date: Mon,  6 Apr 2026 01:53:03 +0200
Message-ID: <20260405235309.418950-28-ojeda@kernel.org>
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

Nix does not need the "unstable channel" note, since its packages are
recent enough even in the stable channel [1][2].

Thus remove it to simplify the documentation.

Link: https://search.nixos.org/packages?channel=25.11&query=rust [1]
Link: https://search.nixos.org/packages?channel=25.11&query=bindgen [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 1518367324fe..5bbe059a8fa3 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -68,8 +68,8 @@ of the box, e.g.::
 Nix
 ***
 
-Nix (unstable channel) provides recent Rust releases and thus it should
-generally work out of the box, e.g.::
+Nix provides recent Rust releases and thus it should generally work out of the
+box, e.g.::
 
 	{ pkgs ? import <nixpkgs> {} }:
 	pkgs.mkShell {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
