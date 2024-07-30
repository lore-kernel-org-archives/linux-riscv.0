Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDB1C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZ0gdkcV2/mKyphuuLaV1K9aajR9m1rktbPhLU4QW8o=; b=X949aSj5FQ8owC
	OK218pEdCqQa6V/LHSVol25Uc7HamRI3bqg5iNWqBwMsfpI40PG4YpOLggG4GUg6eTsptZ6Vpu+AS
	O7dnd8OqtcEPYtyldhG+i+Pk6CMTt2ahNNfsM/enk0Wpe8Smdv7NBoapW+yNbuErU+a4maiN+E5H3
	pmmG+QDiWXexMW5up4ZImskqzMHGR89rhdNv0bGoiu+zxEhREplWBsph4xh0WenS0QOJX02aVqVIM
	AcUVTo13fQxtTiKd/D6Q+7CFqMzH6bxrY7WNVpOGTWn+yfyrGsh7UFwm1u1mvpvqToKFwx8pz87S9
	um/AWRQZipRjrEztur/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajz-0000000D5rA-0HCg;
	Tue, 30 Jul 2024 00:29:23 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajv-0000000D5oK-1Nl1
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:29:20 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 30 Jul 2024 00:28:09 +0000
Subject: [PATCH v5 06/10] dt-bindings: serial: 8250: Add SpacemiT K1 uart
 compatible
MIME-Version: 1.0
Message-Id: <20240730-k1-01-basic-dt-v5-6-98263aae83be@gentoo.org>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
In-Reply-To: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yangyu Chen <cyy@cyyself.name>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=5e5axpOVSop7tU9RM2+kMzY3QIqZVpK1c93FNqEco2I=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDOuNXR3NdHbzKjlSS1pwkQ+g3hHoXXLyABN9
 wZ6kr3zqkCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgzrl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QebD/wMAI2kHdel9DrnTv
 ED7niiWiEgrQhvXvWMbYbqZjR4d7J1G71a3qHtw9FKoa0iEZpWnI0Y6lWY9LJZNycCKepSoHQjI
 SP3cCNCeeFfKxcB6aMRd4tl1L3Nn4umbANH0zrohviYOzKCFqCHGuBcIktMQCZsVNVQm6tyvzEw
 kqvhyeEajh8nIeXdyJcJ5gIcqtaVYHPfLoefDOfaYK1TiqdQMk3+PAsV3PjJASI182elhDCnE+W
 nzgxK2EIVdnDshUeZSNsGog9CWY/IKHym+ZNfZWqOkWH3d8Zx0k5wrfxmMvYVf3X+czhKwAnyMM
 CarvDADQqLJJQKbGVb60E8egC4aX9uH3o5JkwDvGxdH7noW1CfZ3YLNWU3lAScspInaD4CsZzMd
 nzTBAMudXWmyCyn3S1fG0QS90OHfs1obVtTrEPSbBNSVfpefGfsZUOwAf1s9IUnAKxTPE8BiELD
 7RZ3UviAySbnk7rJUtspQQc/O7O6PcvOgKAC6dMqCXJ/U99neXfFdRQiCj/gZmDwfUXABRXTlep
 jtwG3bIPkaqCggqdZDln2k1Z7iqq/8Pc3IFrCFbLCc1xc+nHs94CGWEpwumUL9crnBMCYohuMfX
 Z8OpwQG7d6W2wFvhCeQOoaP7sE9mfPMfaxEr4mRWUyBOpHgspNzCgS3+AKp/8npBg9QQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172919_450879_DA1E8DD5 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Found SpacemiT's K1 uart controller is compatible with
Intel's Xscale uart, but it's still worth to introduce a new compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 692aa05500fd5..0bde2379e8647 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -111,7 +111,9 @@ properties:
               - mediatek,mt7623-btif
           - const: mediatek,mtk-btif
       - items:
-          - const: mrvl,mmp-uart
+          - enum:
+              - mrvl,mmp-uart
+              - spacemit,k1-uart
           - const: intel,xscale-uart
       - items:
           - enum:

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
