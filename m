Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09D7C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynsJL2W4R6VKR/eC2A0OHQuzP54WQKH4dptQuPQi4Fg=; b=t3x5rMOcL2wVDu
	PRjsKNA5+XC6vvhAwUCNbQ/eikw3e3fHk/xiCYG3PuQnafxpGEW9TlX3/pSRhjrjN0uLgRZbDW5JH
	eTIloPcQz55OkfM6IOMYy20ZAYIVRIVrHOweYuGK/D7RxbQmnFf2U90UBxkVmBys6tZ32kDjpIBdx
	ZHlYBHP6ruhjQYGpVZqerkvj3LG3udZ7m36AE+yWzufaai8B0L3C2EonbD4qrwRcv8vP5oWLW/mP0
	7eEYKUNymBFcEXVojCsT1bxuFG8XBQCyDTNBuBgl+7G+Tq4tX8Rj11ZlLD+T9Ef9WgfBcWZF2VbmG
	WuOy9TyDWoTiVHxTbdGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr6z-0000000AsUv-2xhi;
	Thu, 27 Jun 2024 15:32:37 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr6u-0000000AsTn-1BFB
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:32:33 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Jun 2024 15:31:15 +0000
Subject: [PATCH v2 01/10] dt-bindings: vendor-prefixes: add spacemit
MIME-Version: 1.0
Message-Id: <20240627-k1-01-basic-dt-v2-1-cc06c7555f07@gentoo.org>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
In-Reply-To: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, Yangyu Chen <cyy@cyyself.name>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=920; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=EJxb7EeTC9u7CCdTJTxx28CPOGa+wgjU03pSv3TtRsE=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmfYXfZMfeOnLAd+tWnxhngeusAefsZ+c5pev+Q
 Okj1g4AdqyJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZn2F318UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QRgD/98O7jkOqAavN5KZS
 lMvJzyEW6LAEmNlyCJyxwdyUayJtH8GIZJgUWRVdt7ZX7j3De/gRwkjRmeVuzj10B8q8MDGXHNv
 3TCZ0F0DFhJoWtByqxbIkKNXtGzJF82Zy4kIOhbsTS4Tc25wvUiSqM19my2DeR18Yu8O4AY6Rgw
 AA2VZwFTSFu+oK87nwdGerGGQUCSY/YORBN2+pGMLa3+NItSvRyd9YAbo7N6h/smGaCnGFFwFHO
 npkERepOD1AZipXwXNJ6coqrqqBJ6Hjh4ljZJ+OgZTLSUTdGb/2aY+VclN0AF7saAFQYr/aMe2d
 vQ1yHOd00kQyEOegy8PT+SYEd2x+8C1/zSFPVF6PLpBo5GS+Kv3VzuNwFqtpAuvc0QM9ajr5Biq
 jxCCQKn52dnx+s7wLLh1rgAb++1lEBfEX9SrWpMY/cEavhNEw5j5ONYSHQEE1zvRt5XqrZ2AzpE
 jZ2Im+ZEfkRIwGw62CEGOKzhNID8XnwadTDPYomSGJwLWQnlo0/v/6gekxutdGo2PuE/IelbyCo
 oIWZg8sTFab16kVerHXlpvCcPBVdlOSgru0NFHArR7f5+IML/U1eg2Jc1/M2v7edcw9ZUAgL4E2
 Rg7Y34eUg8WOWRB6hBU8RhPCRCsO32WySw9et6RwPkqJ0t2uUxJ6NJcMg/uJf9oDW3pA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083232_547106_F410A701 
X-CRM114-Status: UNSURE (   7.03  )
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

From: Yangyu Chen <cyy@cyyself.name>

Add new vendor strings to dt bindings for SpacemiT K1 SoC.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1a..7ee6e4a89376e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1362,6 +1362,8 @@ patternProperties:
     description: Sophgo Technology Inc.
   "^sourceparts,.*":
     description: Source Parts Inc.
+  "^spacemit,.*":
+    description: SpacemiT (Hangzhou) Technology Co. Ltd
   "^spansion,.*":
     description: Spansion Inc.
   "^sparkfun,.*":

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
