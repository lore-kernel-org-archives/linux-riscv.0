Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470CC606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tGzk2quY;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=ZP/Vu2Hf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WOiFd92ffQ8y5Gx64wlwulz8Mep8Cy2OCQ0KBy7nG9c=; b=tGzk2quY9rOTKcFRpd43HPDEnq
	hMjgMCxXhr/wSfJQg+9pEGZk4gWk0lMoIZRRUZIHCaxfjl5sTOX6aFuKN7qjXxVOE5zSHFeJBxEfy
	BL6EvDNY4zvRobIGB6YgUqHxrxRAcJXnwvpc+QQYlbwOPsssQiV28Z9hxb9VeXnLiwu2c5x8udX6o
	cDqvBeC6U6qRZf6h4uOnJqqsnDkZYvmSUY+6jKa7UansWAsmQmu0G9CNdSE6MOjQ2WoGoqaPPzvSS
	W+I29TXUVffFEgvGKCjtQNfqqu49I09PM2JQdMjg1dwp/4ROuVV10Ei4KmoX2QiGZ/zG/7Noe5A0J
	BaVNJp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGse-00000002214-3go3;
	Mon, 26 Oct 2026 09:20:36 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGsa-000000021yP-13EP
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 09:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793006432; x=1824542432;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=XcUFy86mcXwBkdVbQzI9DqvGN0xrj3EmlcdsiyF9xIA=;
  b=ZP/Vu2HflTJpEImHJ2VwrltBiDU4Y3DF/VWWllrv+PfZpcudknSyXzwz
   0SyAvdYd4R989Qx404yAAZmY/rwePgDBBKaXO9NLwU2VRglAMbzFTzQAq
   eN8Qwh4TyDv612ARYyqVG72m0TZo+OsZKIi7pFuK1iwyZXiZabdACVT17
   3WbI3uy416PhFRXgyFI+q0R2QEWFLUavVbgwH5GUDk3Zi3lqHoH9zHDt5
   1P/pGpb/AuMFjqj5FiUriFITSkZ28C/k9yusPCscmFeoYTULVb34scQph
   I8vHtrEb/Z5Lnz+DJDVtRFU9R5CJzsHAavyMG2gYXO5y2CuVUFe0GWo3A
   A==;
X-CSE-ConnectionGUID: 2TKWzQ1YSHSHH7JVJ6W+JA==
X-CSE-MsgGUID: 9J8el1a6QQyYbRKSdt+FkA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:20:24 +0200
X-CSE-ConnectionGUID: gKvA0zqFSmmoyalL2Yt+MA==
X-CSE-MsgGUID: /ZycMpbtR/OWvQOwYg+9Gw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 26 Oct 2026 11:28:07 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 26 Oct 2026 11:20:23 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 26 Oct 2026 11:20:03 +0200
Subject: [PATCH v3 2/2] riscv: accept the atomic extensions this kernel was
 built with
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261026-lrsc-only-v3-2-ec29c8190fb1@mobileye.com>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
In-Reply-To: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com, 
 torvalds@linux-foundation.org, olof@lixom.net, 
 aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_022032_583343_312B3F1F 
X-CRM114-Status: GOOD (  13.71  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_early_of_processor_hartid() rejects a hart unless its
riscv,isa-extensions property contains "a". That rejects a Zalrsc-only
hart even when the kernel was built to use only LR/SC.

Require "a" or "zaamo" when the kernel emits AMO, and "a" or "zalrsc"
when it emits LR/SC. A normal build defines both toolchain macros and
still requires the full A extension. The legacy "riscv,isa" fallback
keeps its rv{32,64}ima check.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/kernel/cpu.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..5d1e39d16e59 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -82,12 +82,32 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
 		return -ENODEV;
 
 	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
-		pr_warn("CPU with hartid=%lu does not support ima", *hart);
+	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0) {
+		pr_warn("CPU with hartid=%lu does not support im", *hart);
 		return -ENODEV;
 	}
-
+#if !defined(__riscv_atomic) && !defined(__riscv_zaamo) && !defined(__riscv_zalrsc)
+#error "Need AMO or LR/SC atomics"
+#endif
+	/*
+	 * Require each atomic form this kernel emits. The single-letter
+	 * "a" extension satisfies either check. A Zalrsc-only build defines
+	 * __riscv_zalrsc and checks that extension only.
+	 */
+#if defined(__riscv_atomic) || defined(__riscv_zaamo)
+	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
+	    of_property_match_string(node, "riscv,isa-extensions", "zaamo") < 0) {
+		pr_warn("CPU with hartid=%lu does not support AMO atomics", *hart);
+		return -ENODEV;
+	}
+#endif
+#if defined(__riscv_atomic) || defined(__riscv_zalrsc)
+	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0 &&
+	    of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < 0) {
+		pr_warn("CPU with hartid=%lu does not support LR/SC atomics", *hart);
+		return -ENODEV;
+	}
+#endif
 	return 0;
 
 old_interface:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
