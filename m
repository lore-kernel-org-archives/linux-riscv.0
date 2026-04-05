Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DFCE9D82C
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86Yh/zzNwLAgYtgFluzIT2ycS3KkMXfY4yaNA8e+xjc=; b=PKg6zwz1p5LNt+
	cHi/V1pFsnIDHpWYQlKpN7YgeJeg5LogqWvRIXiMyLKnAumc2BL52tHfVaBIbPDLA1IL4JoU8uKTH
	wSKeZQnmYcwtZnLDJdp7OaxXCgCY+IlGWwHStA2UvlNslom8n/p6FHOWfTquyqJM3xLSeYnjDBHi+
	8w809B4fLfwvfzSIoY0ITnwmgo+kmiSSZoVkWCWqE9CMl142LvQvvZ3m33IHerBWbu8BE7bEruaCW
	7WElcnCB6q9RuTKkvPLRU0Zi2+eG1jPXN5MG1GlFPRL5SsZxuH8NgafJZyE99eaHnwLKT6ViLOgxx
	vmGJT7YLTEPoAMRNgZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XKU-00000004azc-1ToT;
	Sun, 05 Apr 2026 23:56:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XKR-00000004ay5-2O9f;
	Sun, 05 Apr 2026 23:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fwdCnGdEe1u+XcXGB8mt8q0I2nOQsZv41hWUFwziGaA=; b=oM/G/nwQZtS+nXHAjXxkodanzK
	TNhHCrRPUf9oNYSVtIsYMGQ5IUhaMLfXNf3LPiS/FGB+Xpku/AhQSrNEc+v/ajiCRr06q7filcL23
	v9q5c97QiQBtu5+HZs6Ns/myviF2z1lbImbwd5yOTiCzJNNeG/IWa7M/DqMJqamglMjX4Ywh7lbSk
	qkUc2smp8VXFmUSMWv1aR/f+WGuyuuwV4vGyGVrdERs18p/mxnHgN8GLJIi6E4rtuImXbfCwcFksa
	lgElpkQsQbbZaJp/BhbK4XQjks3J+lS9FL52TNNgfrix0UGYtgF3dgx34bj6Z6XCihN3J23gb+TRd
	LhvBrBJw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9XKO-00000006E4y-1MHT;
	Sun, 05 Apr 2026 23:56:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 062F540663;
	Sun,  5 Apr 2026 23:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4322DC2BC9E;
	Sun,  5 Apr 2026 23:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433386;
	bh=epQs3AsyxZ8hhy5ISUPTkOTvgvbeYkZEdG041MVzF80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D5Jq/KNe79Oh6OGcaoN5PmN2FFcrPk6GXdZcnPkCCDQp2UqHYQ9SjPNHV1332T+nF
	 T+EMIfEl65JCvssoBOyMtZZKNAxU8TmRe5HaKPPwK+gBHmI/vYuqdH1BJv358cKnCs
	 j84VKway/sOwJ1457dvilIKK/J+Q/OQaHKwpmKO95nCh4B7yrwTBxi9e0NrjaZTtt9
	 crDuyneI/9sBvcynswhVdLKgIKdEhefPzcWdNZgBm/jAYpMGU+0smar730LDYpqwvX
	 AJij9W0+y1c22mbCnukDGTJao+rlNiw93Km7Z7OnP8ZZkoqeUHZ03Xxf7FbRHImwOl
	 bXVw24EbqtJYQ==
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
Subject: [PATCH v2 16/33] rust: block: update `const_refs_to_static` MSRV TODO comment
Date: Mon,  6 Apr 2026 01:52:52 +0200
Message-ID: <20260405235309.418950-17-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_005628_758328_F7D33A6D 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
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
