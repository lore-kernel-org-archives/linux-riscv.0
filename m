Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B0EC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spRW/mc/YH0slEdRWs3O7zcdxRyB1lsU5X+/3RxnoJc=; b=uCFH/+kfd4ZXTk
	J3a66ybSekyg+iYZjFz/o7+dyvRXm0UYgO1MvFhn+NSNs1kw1W7Pd+pkFImNSC3uPGJ/02OxzQNVE
	rn2pNKEs2rlyXd3y0N2hHeB8wxtkpU1Uk/KiKLbJd0z40owzM3m0Ic/KsEGbroyJtvBex4zOfYM1/
	wbncOeDXOyIe58R2y3cC02TEB9AzX6C5KGwWPulJBmq3Z0kx1aiEHHItILJ80CHTuUfQRgRYiuXAU
	WAfzH5PhxNTQi3QTA0EamXLD+Uu7cdvtKxhyIecB4vnM31EuxCRmBkphn38+9bJe/YcIeeKowgwe0
	gcjDz1UXcGCyz6wyNjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Q5-0000000AYya-3FKL;
	Wed, 03 Jul 2024 14:57:17 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Q1-0000000AYvN-3lIR
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:57:15 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 03 Jul 2024 14:55:08 +0000
Subject: [PATCH v3 05/11] dt-bindings: interrupt-controller: Add SpacemiT
 K1 PLIC
MIME-Version: 1.0
Message-Id: <20240703-k1-01-basic-dt-v3-5-12f73b47461e@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=uRDxzRoYQ7f7fJazlLn1rqbODikLZ47/5BjNLxbuT6w=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWaENPQj8iXtrdapEWZeKRMe8hkFBF/6q52xM
 hpXpz2JlHmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmhF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277drnD/sFlyiJvOUffW+pp9
 06mCWwC4Jprn2bPlLQrl1NVJHukpthpKNBHVfB7Nz1PwS1+4XKMQpxcZd7uoR1QMOzeFF3UjVnz
 NQLwIMQli9f8Qbg7+OyCatDYjSRxfbWjUwSxHsN9WBr7HPnNnzUycddyWZcThY1GppqeUMxRxhu
 vTePyd9Ykb4V0j/AozyzaWcYBlYQgx6tdyNLTNh9Cwz28uTvWdZZhlfRbolr9WPHl6eOcnqH9NB
 NQvvu6s7ToLimuGAtIoPEh7W/iJehnnPeY8qIGcxbyDVmaOKY3fg0ZD54qn5OUcFJU0acv3FfjH
 9/zDFLRp7wJZabC+mkqDcs+fQgKRgoyiB29nvZ6IHvYwfdOYs91fizOpYGqAf3c6d+8yc8Rd93V
 Ms/I1DSB7mIYDDf7uTIV2P1To0cBFJLvaIts0ZF6MnW1HJdaiNoG3L/YAlitak6TICB1VBMnYdB
 0wQ/oUeTFI2oOmkZpD5m3WyRVfZK9+J+4pM5ZJ0dzLupqbzUTHkhidkyCooJJOjojZpxMbW2SlV
 s4pho7FgGZ5evKVeJcX3WqHCJpnjzB1QqVvMGmCjkjdNgn/nIGf+8a7tKBoLROWYrYKAman3RRB
 5JxeoEdcA6BwIqjaMjK0HfnHnw0O2kiii6nAJrMPGUPM6l280mwV2/5Ez6yswC3CNckw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075714_006855_B7143FEE 
X-CRM114-Status: UNSURE (   7.18  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Add compatible string for SpacemiT K1 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276bd..f473ca3479efd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -59,6 +59,7 @@ properties:
           - enum:
               - canaan,k210-plic
               - sifive,fu540-c000-plic
+              - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
           - const: sifive,plic-1.0.0

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
