Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3A2CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xM4qdKCzpqQoQPgl/R+5n5XtIz4+CGN/9hl7pWKJQhw=; b=NnzDt7zPtCfepD
	5Zwk2RlojCn6qD/NeAGf9OGpKxxwVEFHFWi5x8vyDA6ttHCET+BoosI84spoKvRb+wRLOjh7TJlPc
	aUXHu+4H2x1ooMCd0AzCbQ1uQ4lV5Lkl2JrxoUBJmr7vEnHKhmDCZ7nPXfnvRm0wd+3QV0XT061mw
	CdyS1IovtoLvHqpoCLPIB0hplRcNkLEr4HnTial2cBX8EXCSuVTDU8sPAczVvjoJdcuXuPKtW8GxV
	STINP3h+YWgd6raJUCQkEfhRefe6mLFYWEMAnbQp82J+DdAMBXswXqHLSxKmJThxelRpSyTM7M+lz
	YnEYoi2RYSmouXg21elg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDijY-0000000Fv3m-01CD;
	Tue, 28 Oct 2025 12:23:28 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDijR-0000000Fv0j-0V5p
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 12:23:25 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251028122317euoutp027ae80c9a092f4dbee2655e48006d8809~ypyioQJZ70282502825euoutp02T
	for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 12:23:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251028122317euoutp027ae80c9a092f4dbee2655e48006d8809~ypyioQJZ70282502825euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761654197;
	bh=S7Qb8GD7QtIdkNg1sJYTbyBiBhynyekDP/0KBPsG5fc=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=W39YBq8gRkSQRtmiqYbhAmCfOap53lZ4hkYWh/z6xZuBhkZ4AR5bJvtKO6Kip+d8h
	 AMu6xTCU4OjpicB+jSJ/h6BmVSExYtvmu5N+KxQwjqGxlcfGSDHesf2OTIOgE/S2MQ
	 6bcTdPwtJmmGqXghLFxtr96X2pbe2jwJcZBY9e8s=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a~ypyh4s3HI0846208462eucas1p2I;
	Tue, 28 Oct 2025 12:23:16 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251028122315eusmtip2aa7fbb6e4d59ddf58d1f0e5dabdc826e~ypyg2_QJ10792007920eusmtip2f;
	Tue, 28 Oct 2025 12:23:15 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 28 Oct 2025 13:22:32 +0100
Subject: [PATCH 1/4] rust: macros: Add support for 'imports_ns' to module!
MIME-Version: 1.0
Message-Id: <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
In-Reply-To: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,  Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,  Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,  Danilo Krummrich
	<dakr@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>,  Drew
	Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a
X-Msg-Generator: CA
X-RootMTR: 20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a
X-EPHeader: CA
X-CMS-RootMailID: 20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
	<CGME20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_052321_707468_F3378B20 
X-CRM114-Status: GOOD (  12.16  )
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

Kernel modules that use C symbols exported via `EXPORT_SYMBOL_NS` must
declare this dependency for `modpost` verification. C modules achieve
this by using the `MODULE_IMPORT_NS(NAMESPACE)` macro, which embeds an
`import_ns=<NAMESPACE>` tag into the `.modinfo` section.

The Rust `module!` macro lacked the ability to generate these tags,
resulting in build warnings for Rust drivers (like the PWM driver) that
call namespaced C functions.

Modify the `module!` macro's internal parser (`ModuleInfo`) to accept a
new optional field `imports_ns`, which takes an array of namespace
strings.  Update the code generator (`ModInfoBuilder::emit`) loop to
iterate over these strings and emit the corresponding
`import_ns=<NAMESPACE>` tags into the `.modinfo` section using the
existing `#[link_section]` mechanism.

This provides the necessary infrastructure for Rust modules to correctly
declare their C namespace dependencies.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 rust/macros/module.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 5ee54a00c0b65699596e660b2d4d60e64be2a50c..408cd115487514c8be79724d901c676435696376 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -98,6 +98,7 @@ struct ModuleInfo {
     description: Option<String>,
     alias: Option<Vec<String>>,
     firmware: Option<Vec<String>>,
+    imports_ns: Option<Vec<String>>,
 }
 
 impl ModuleInfo {
@@ -112,6 +113,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
             "license",
             "alias",
             "firmware",
+            "imports_ns",
         ];
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
@@ -137,6 +139,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 "license" => info.license = expect_string_ascii(it),
                 "alias" => info.alias = Some(expect_string_array(it)),
                 "firmware" => info.firmware = Some(expect_string_array(it)),
+                "imports_ns" => info.imports_ns = Some(expect_string_array(it)),
                 _ => panic!("Unknown key \"{key}\". Valid keys are: {EXPECTED_KEYS:?}."),
             }
 
@@ -195,6 +198,11 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             modinfo.emit("firmware", &fw);
         }
     }
+    if let Some(imports) = info.imports_ns {
+        for ns in imports {
+            modinfo.emit("import_ns", &ns);
+        }
+    }
 
     // Built-in modules also export the `file` modinfo string.
     let file =

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
