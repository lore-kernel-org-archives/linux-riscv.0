Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1962AC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADOiRCqxmKDO+Ixes2aEboPEVgnW/imJkWQPH231mrc=; b=t0WmB8fcGPBM8B
	Te/aAV0C6NKT57846YBlCJRjYSqIdasmhTSLJBTZTnT+nuL2Zgn7CddTDskedD/NfnDMMbVcC7exZ
	rGTum8BEbpEeOI1cRIVeYBL6KNZKe8u4my0jR6XgLekF3uwRNGPpZB0pTBOQ1cQT19qRX7F+l0tGm
	zdvTAIv/Yxbp3twColiaa6pevK8DmGWU0dAUScpHgslEtYbQDBdmwV4U7/++kkf0X/2pj/zh0UOoB
	lAE6mnAOg5K5TYpl7XDg+LD8GX2iZ+F5qk7E3wbihgHjg4qJJejia7i2CfU0LrG8qlAGIZ4cx4RyL
	bc/vhs3UzIxaF30hN0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYU1-002erG-QI; Fri, 24 Feb 2023 13:51:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYTz-002epv-KX
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677246691; x=1708782691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TCkNh4u/HJoVJLn9r2u33Qgna6ijjTAiufIVVsHyKZ8=;
  b=kOYy0+sn9SEHEp6T9vQQfMjuSgnkLBnKOBka1XdbeDgFwNmrvEDifYqh
   nTVZiOStR7Qvf7MubT7M5tiVXABZr5cfzxk7eYVWr8IaCUPzzLKRrXnje
   I2VPvUnPetobXWNuNTsuT9js5IKfW0yyEKKiWDZU1l6d6a+xmDDPymQ7w
   BJiVmvnbiF+0KiEl9SOaCwt3MdMP1uQdmz2jRAfDE+vzDTOGQMac7NnHT
   eBYZu/f3JG43Au0RuafAbd2JktblD22OuqRJYItED1sIkFPWesOrqpQWr
   PIQGZ+i6CGxSV12fmyn6KPMbPMJFY/YhlBuycRL0AK33n4qmFeWZEUbUv
   w==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="scan'208";a="138923429"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:51:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:51:30 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:51:27 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <conor@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, "Wedson
 Almeida Filho" <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: [RFC RESEND 1/2] scripts: generate_rust_target: enable building on RISC-V
Date: Fri, 24 Feb 2023 13:50:43 +0000
Message-ID: <20230224135044.2882109-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224135044.2882109-1-conor.dooley@microchip.com>
References: <20230224135044.2882109-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577; i=conor.dooley@microchip.com; h=from:subject; bh=QsTuP87FnJv8kjQnYjXUt2ZRgTNJmBC7A5v4jw6v4qE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk/DmwoqlM8Npu9+sKdL28fS73Q9jNZKf9sgbZD2yPfwx82 iky711HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJ1F5g+F8XuWHlXfFyzvi1cvPVXP 79fxB5a97XGz96eFm8fugdi3dj+F9fO585oFbA/1+8r/1+zsLbO0rUyyad3v9ta57G6jPHH/ABAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_055131_771374_617E2209 
X-CRM114-Status: UNSURE (   7.44  )
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
target for rust.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 scripts/generate_rust_target.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 3c6cbe2b278d..72428fc66502 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -161,6 +161,25 @@ fn main() {
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
+            ts.push("arch", "riscv32");
+            ts.push("data-layout", "e-m:e-p:32:32-i64:64-n32-S128");
+            ts.push("llvm-target", "riscv32-linux-gnu");
+            ts.push("target-pointer-width", "32");
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
