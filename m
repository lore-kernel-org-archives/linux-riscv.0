Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94572E9D827
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwaQ8EyrjI/49gfKPZ7kMM1JVLNq12Yriu17cWaC4nE=; b=SXQLQ1acEspLS4
	xGiM/EZ9gVeNAXcSIdbMJySzZleZAQC+3n6NF2ckTMJXVef1owPQDra6vBSKFwF7lKAaOTcRHKen2
	Rqe2isvx/Nee+pK54OZkuL3kMaXqthws1k0EtnreZjh1mOSdSVq8s6tKrv9gdWHRyv1yGyI4T4dsh
	qrMR1P3R10qzC6nWPhDKU8m7xdgRWV+EM2LLmb8E0V+JIsHkZO/GsqkSBIsTmQwE1zATjh5j+OYcv
	vFKAISq1kW05C/bSjtSCbdNpti98l8Jw9/MsoBGxPuXSYyjJteCUc9pWio0WG30Q7hXOaIqCOm7UO
	cbhrHP/5Ryy9K4AduQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XKe-00000004b62-0WrM;
	Sun, 05 Apr 2026 23:56:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XKc-00000004b4u-3rHu;
	Sun, 05 Apr 2026 23:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=773x+kju1ryvALqTX8YdY0ziNIs8nn/FqgqTRobgGgk=; b=UIJc8svuy4+HEzsUb0PoxKe2nJ
	IR2StvhPzQXqcw9kqnjMRFDb8FfMA3CW7ePvc9HqAFvWBk7bxpuYfFiXiRackgBKp4PtJcY0kGS+V
	lsVPAgEYglV+L0wfJ8iJYqp8CGpJ4ADOseq2WvaqG0iHexsjqyTZFC5N4Dub33gk+dhW73DsbSdZt
	F4dQeEMWUuUvkbnudIDGK2sUPb9cOhdUrtk6cxKNMtw2VKECY/1S7gC/7bZW/rKfOi7pAvYS2EADV
	2WprL5LQQC/mlRuWe4pXk169318bFHX0lslSxLPahTmUBuhCVSfCTJQv02G2sbn4SbPgedyriEcrn
	W0f0a+rg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XKZ-00000006E8R-2kiO;
	Sun, 05 Apr 2026 23:56:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33E81408A1;
	Sun,  5 Apr 2026 23:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F8CC116C6;
	Sun,  5 Apr 2026 23:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433398;
	bh=5Jab/7lBf0p9Y+zm0mNBBz7PFxQVXiWRK5KI8/o7D7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QnGoHDW3vwcivvmNOjw9o2bOSnSiuXt7aIdxa8w364voeOtuXBDKRMXu1RrUL3xeZ
	 J2FmW1h6MmTnqMjPgvotZtm9XroKgcD0uX7aDtypilDVqaCL8uTlxRvph7lumugK+8
	 iodWD9nftj/RuaRmrf1nUD8TABFk1CZNavco9mtol/2XT+eI/VlknEJJjda7b6Nt6L
	 Rb/8AMVE63lxKAX080HZgZZI2fWBTcVmYtNiB/2T5n5WhsMv6r77G7q/iT2SdggpN2
	 ZuLsqQImLYMozcnF9ceFfZNqKay8184qpW7nCgXBZ5baOyb/Njj3jsrriLjAMaitQC
	 h3qzSTuZ7BE+Q==
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
Subject: [PATCH v2 17/33] rust: bump `bindgen` minimum supported version to 0.71.1 (Debian Trixie)
Date: Mon,  6 Apr 2026 01:52:53 +0200
Message-ID: <20260405235309.418950-18-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_005640_071122_ADA0B7A1 
X-CRM114-Status: GOOD (  11.20  )
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
Acked-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
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
