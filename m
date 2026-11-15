Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D369606A336
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 19:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gM3eztHn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=cZ2PH9iF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bsZ3wOzL0+ywRIaHr7SLNMakin84g6dxagL5XZNWe7k=; b=gM3eztHnvGjIS4zNf1ki3DmrMR
	1HvFueDD2Z3vCVvU4GuZQZrwuy7JmPglxixxRDLs62ui7qjJ6241Qpx8cUsEizXYEjOyc8764jP2P
	A6DUZzcEi5qvUGttziZ0VU/cZfkyuxmQ218jt3gzhJSj8Kf+r5OYUc+IgmaHicvSbMa3DoW4bQV4T
	U8M52ffnjgt0cyGhVCQmN60b10Q+jmquQRIgI8lmqM7amdOcAQ2V+WPTdywfRXaiVFeTxhgk57rSD
	WDbcfdoVy9uZNWnzPaNRxyCuQPfHiUCjs5AknM9wXCaL4/p5xXCWO5J9ygJrGbG7lCL9es+Ge8ZAF
	ljlT2oeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgHv-00000000P0O-36uE;
	Sun, 15 Nov 2026 19:53:19 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSgHt-00000000OzK-01po
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 19:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1794772326;
	bh=z8Udy+gpKS3X/0jkZQA4Y95ag0ehIFXEGZWv/GeBkw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cZ2PH9iFTQ+VBRORVMazOMTts1QCCspB2vi1ekqjU7ulTotDrWL0V/vxpVwTyazPf
	 PGGnG1ooq8tKWntpZZsSq+1DfyP0euayW6/VY+pYx1YONH9K7GFlKBMRpZWpse9rmf
	 4dne2atDuWxKvKPkAQJt2ftQ2s9++5mFD3NsX2leEx0nUYDHiCsOoXA109nQoBNnD2
	 +WCk+pY6RoOBAw75TuPS/ktgY9skbEL8aByrzTOlKnbTf764Xc7ImcVyhl+dsj48LI
	 gY4KXZ+aVIBUw94/O+mVKmVppT1vCgBT8Xz5SYhnxPR8osj7pKg/6aYVQSPZUAhrAt
	 E7oE0KQmU29Qw==
Received: from hay.lan (unknown [IPv6:2605:59ca:364f:d400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 55773B2202E6;
	Sun, 15 Nov 2026 20:52:03 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: spacemit: k3: use pico-itx 8gb memory configuration
Date: Sun, 15 Nov 2026 11:51:00 -0800
Message-ID: <20261115195112.32120-3-e@freeshell.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115195112.32120-1-e@freeshell.de>
References: <20261115195112.32120-1-e@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_115317_213230_152531E9 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The boot loader may override this configuration based on stored ID value
in EEPROM TLV and if it does not then the smallest common sold
configuration of 8gb is the most compatible option.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index dda420900aa2..8d1cd468cf8c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -25,7 +25,7 @@ chosen {
 
 	memory@100000000 {
 		device_type = "memory";
-		reg = <0x1 0x00000000 0x4 0x00000000>;
+		reg = <0x1 0x00000000 0x2 0x00000000>;
 	};
 
 	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
