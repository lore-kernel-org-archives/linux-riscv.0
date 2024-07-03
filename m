Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C45FC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ku1XXO5vFl49knj5zAuyVkFmhodPHenesSyk5+uogF8=; b=UG06LbMKR/fL2A
	WR8J7S7d+EUJbpClQEpRwkoCw2hwkc2Musaj9dVPY+aEipOsj2QFAAC2aP8lV9hfl6Eard9Y6ruH8
	Q7kazIdVIqfN2QUYfPsRyNxDus3/4VqR9VnT5jr/EDXmqG48UmRDgAZP2BCQwqPfaJ674Pkgpy5Ug
	lOurKujatgGfhQbJxturueq14ihTMx3M4ix6LN4UxQCSltoEHack4evnZU9Fpt+2wlZ4io3k/d4gK
	55oP1he8q5BDpnTFP8jKvPvkpIVIstJkJoHiOWT2I96D+Z6oU5OdbcYVYLs3M1f6lXq8qOb42Ez6n
	nX1YaGB07yIzIkMQoLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Px-0000000AYt7-1PCD;
	Wed, 03 Jul 2024 14:57:09 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Pt-0000000AYqs-2iMA
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:57:07 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 03 Jul 2024 14:55:07 +0000
Subject: [PATCH v3 04/11] dt-bindings: timer: Add SpacemiT K1 CLINT
MIME-Version: 1.0
Message-Id: <20240703-k1-01-basic-dt-v3-4-12f73b47461e@gentoo.org>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
In-Reply-To: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=wvQLp2j2KF1DXU6LoDgHk1K3AJ3TNpJmOxUxNu563OM=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWaBQQWp2aqU7XrcJxPyTUTtEBp/XuiWNB0on
 QEC4Emvr9GJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmgV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277eNMEACTWkcnPQGnphOvUX
 2NETv2ds+L7S5NhdBAVGxckgr2iZaoVn2Lxk1nDwMSP/kKkO0XIX/nXv/hDkyd2iEg80rAaO4iQ
 GnkaJVteLjezf92iSA+A2VIVCDuS8lao2ii+isw6bFW17zGQyfOPvauo+T7/d5RYg8EtbqcQXv6
 jnUTZmiyt4Exy3vFHbTFfdIs5mZwG2NYYwX6+P8cjXOalemLMUtDjWnysPfyeZ5a0wZtgyarlmU
 cV2j5glZQuiAIg+jZ46wNfqRa7l8SGiTqZOd7rr+3UFl/y/uYux0Suy0B5z0433EC4A6xqhTv4W
 mmNlt2EFUG6sYLxjPnlARyf6rSuG1UBA6JgS0CHFEtwkQHUrJZxqoC3l838at4j+c3Nu5FAlmcT
 6iWTwlqWV4ULGD9ASrh2UhQ4oiczgWUI/FYU7NtE/T75C5VMlkCPb7wWIREM8FBlfpqUADmIwnv
 Z99kyMn6cjbgDj31xwmFYVLAx2K4ZeCgHFWVR1lSYVMo/8Obbd6MFg/YvnBdN0UzyuLt0t2ziGE
 UkvK8daG+5RBcFbv1qvTlZ+KtZZhtIkQzV8dD2GiOqPvGxzBiG87WuY/dORM3b+FOQJ08JiG3ah
 bpB+EhfRFxHN6IvauFCds6cHI3sGs1/CyHgN8H1g1zSKJtScxxtQ9pwWoOXLQJAsS/kA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075705_767082_9BEF6ABA 
X-CRM114-Status: UNSURE (   7.06  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Add compatible string for SpacemiT K1 CLINT.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index fced6f2d8ecbb..c2e68587a806a 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - canaan,k210-clint       # Canaan Kendryte K210
               - sifive,fu540-c000-clint # SiFive FU540
+              - spacemit,k1-clint       # SpacemiT K1
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
