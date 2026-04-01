Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415F0D35162
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QfxDVkcsXdkUFyeJVMC+PHAGYoqT+ilK+ZT6y/zuF4=; b=IshfSadC+KBXUT
	7kLUEInJI1zpSk4Nxo1LGCE0KMmjOupJ063hG6qOlEu35fgufqrWz8rs4fA1rKiC+WP0c9A6UnImQ
	CHIh5P84ykEE8aOrr8avLdwqu57zfhGPX1euL9d9WdybkOgxbsjbwFoMCU7mj/PMU9f+RPPkAPDFW
	R8N/wIKv5XLSOkhI0y60N+np8yc7b9D6mvS5KiWlp78EnbK42aMzsRM4RV5tuyOFGthUivnWyjOa+
	Hb40XOnvGXB87sAbzRkZukS7KNEyxThu8P8+gG0Fm/aYDIUcNq5BNfVBbIf3+FIVDATOzT3Z6YMmI
	k1U3v/1nmquWXYJPlhlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u43-0000000Eham-1BCt;
	Wed, 01 Apr 2026 11:48:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u41-0000000EhZ4-3ZG7;
	Wed, 01 Apr 2026 11:48:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3E5D6015B;
	Wed,  1 Apr 2026 11:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A4EC4CEF7;
	Wed,  1 Apr 2026 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044128;
	bh=ARQPdLFNgLGMMD7Hlk1KS8FPcB6q/KuXKhlNKcpj/sM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sl4V3Ob2163+RRCKSkLp4ZUuMaSDTTdLiFNQWuFCXKv1Krlrxuela9RxhT+4wUwjt
	 yhYttjDbZQxVHrAv8b/esKNF8VdheRCH3Oqdk/2NAgGn2nejx2h4jXPJbvv4jYQuaV
	 TjMZ/sfmInsww6vddePv9CyGl3rBljLG5MSbIM1HplnFVuq2+FuvEOKtxe7XZRnNrz
	 CMgzmsPy7rtZc6T52JJnndKutrM/pbY6DTPy3eV6rHBgOeGBKJj34eqEze+SU45zwb
	 4y3EKNzMX7CayXffABQD13PIYCldiSPMdtIKe0RW2wa3PA3X1DcERUC8zGiKtwfVVr
	 pDCwDzyZt9PIQ==
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
Subject: [PATCH 14/33] rust: bump `bindgen` minimum supported version to 0.71.1 (Debian Trixie)
Date: Wed,  1 Apr 2026 13:45:21 +0200
Message-ID: <20260401114540.30108-15-ojeda@kernel.org>
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

As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
we are going to follow Debian Stable's `bindgen` versions as our minimum
supported version.

Debian Trixie was released with `bindgen` 0.71.1, which it still uses
to this day [2].

Debian Trixie's release happened on 2025-08-09 [3], which means that a
fair amount of time has passed since its release for kernel developers
to upgrade.

Thus bump the minimum to the new version.

Then, in later commits, clean up most of the workarounds and other bits
that this upgrade of the minimum allows us.

Ubuntu 25.10 also has a recent enough `bindgen` [4] (even the already
unsupported Ubuntu 25.04 had it), and they also provide versioned packages
with `bindgen` 0.71.1 back to Ubuntu 24.04 LTS [5].

Link: https://lwn.net/Articles/1050174/ [1]
Link: https://packages.debian.org/trixie/bindgen [2]
Link: https://www.debian.org/releases/trixie/ [3]
Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=bindgen [4]
Link: https://launchpad.net/ubuntu/+source/rust-bindgen-0.71 [5]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/process/changes.rst | 2 +-
 scripts/min-tool-version.sh       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 474594bd4831..84156d031365 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -32,7 +32,7 @@ you probably needn't concern yourself with pcmciautils.
 GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  15.0.0           clang --version
 Rust (optional)        1.85.0           rustc --version
-bindgen (optional)     0.65.1           bindgen --version
+bindgen (optional)     0.71.1           bindgen --version
 GNU make               4.0              make --version
 bash                   4.2              bash --version
 binutils               2.30             ld -v
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index a270ec761f64..b96ec2d379b6 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -34,7 +34,7 @@ rustc)
 	echo 1.85.0
 	;;
 bindgen)
-	echo 0.65.1
+	echo 0.71.1
 	;;
 *)
 	echo "$1: unknown tool" >&2
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
