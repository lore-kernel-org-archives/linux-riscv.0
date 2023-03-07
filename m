Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58F7C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0OOgRSpmi8c76NdFULgAw/FxUVQDuuh8L9Ajbcuyh4=; b=xwGRFF1Uo4yEQd
	Me3DWsU9fTqhlgazov2U6nMSq7H0w6BL8bdDFpSKoQPMzbeksLgRDX6sJUbbhYpJ7c7c4jxyHGRPj
	LLrN/3vT09Qo4wn9ABKerh8zhMdDZbDL4BqyqLsS7P/1s+95XqG19A/cmTR1hBUBA6I9AkHJgRCZU
	GS4prIdff9LTpaH3qL0z+6TLr1nBUCe+vl/LwPOc4vjkp7vdP0+Qj0bc4/w0MAjToVz1TJLHgAReu
	vUXR1SWtQsM88iBt+gZh55OzjFMs47pkcVRW+wK1n3tvB4wVqf4K7oTNk4jDYoHzlLlgEnptmD5G4
	O/B0loi9QNOECC5elGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUVf-00HFDp-Di; Tue, 07 Mar 2023 10:25:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUVa-00HFA9-Q6
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 10:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678184726; x=1709720726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XVOGB1MKbCD9q0kwWf3Y939WJhlxGIP60HVW5R87Egg=;
  b=iKXLsR5hWKZvFBqoMJ8snCDSXZx39fKAI0CYjMUE9+UsKHXgpar+TlFU
   BHRk0KBlBMAbuPzJjim3wSd6+qyFpspsYreHuWiqoCTgvtlCEFrWHze5m
   Rj1POo0DiZy5OYjkPdGOzzEmg4oC11cOlDX7usryaAwaHYUlWsA87mV5p
   2/yhYsNkq1XtxAeh2PER7TnBl9DYN+ng9db8b9646EP12VMOgEl4md4/g
   OpEa11JWf8z8QhXOaGF4rIRHr535xmgcQqrVkjRIAS48UI1VmmdDeokdr
   sf3DwU/2u+VpaeVzezvWRxKBQK9XUK246W61y3AYaNqv7HmlZksFyNoLw
   w==;
X-IronPort-AV: E=Sophos;i="5.98,240,1673938800"; 
   d="scan'208";a="140694259"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Mar 2023 03:25:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Mar 2023 03:25:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Mar 2023 03:25:16 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
	<wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: [PATCH v1 1/2] scripts: generate_rust_target: enable building on RISC-V
Date: Tue, 7 Mar 2023 10:24:40 +0000
Message-ID: <20230307102441.94417-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307102441.94417-1-conor.dooley@microchip.com>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=conor.dooley@microchip.com; h=from:subject; bh=pr00Ws4xP6t9YpK/ZLk9y5gdrCaL6G8nYnSeAmZhBfg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsAs9qpdez1rj9zF+iHerL/93bMvKB8jeJviVJhybu/Gd6 68z8jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEZyUjw2KV9qAllV8z2ve1q2iqfm rlu9qzNcK9bYd+ztKJZU6ZjQz/ayUOsLFt2TB1drtIkkjf9F3xt/UNFiqeuT6LKXBXxOtGTgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_022526_985003_7DE4A7BE 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Miguel Ojeda <ojeda@kernel.org>

Add the required bits from rust-for-linux to enable generating a RISC-V
target for rust. The script, written by Miguel, was originally a
config file contributed by Gary.

Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Despite removing 32-bit support, I kept the structure of the if
statement, despite early return being stylistically preferred, for
alignment with the Rust-for-Linux tree. I'm happy to respin to sort that
out of desired.
---
 scripts/generate_rust_target.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 3c6cbe2b278d3..85d690f764389 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -161,6 +161,22 @@ fn main() {
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
         ts.push("target-pointer-width", "64");
+    } else if cfg.has("RISCV") {
+        if cfg.has("64BIT") {
+            ts.push("arch", "riscv64");
+            ts.push("data-layout", "e-m:e-p:64:64-i64:64-i128:128-n64-S128");
+            ts.push("llvm-target", "riscv64-linux-gnu");
+            ts.push("target-pointer-width", "64");
+        } else {
+            panic!("32-bit RISC-V is an unsupported architecture")
+        }
+        ts.push("code-model", "medium");
+        ts.push("disable-redzone", true);
+        let mut features = "+m,+a".to_string();
+        if cfg.has("RISCV_ISA_C") {
+            features += ",+c";
+        }
+        ts.push("features", features);
     } else {
         panic!("Unsupported architecture");
     }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
