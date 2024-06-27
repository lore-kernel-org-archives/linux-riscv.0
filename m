Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8A3C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CY4ZSX7HttaLXKRKDZ0nfbmHpxsYn51AvCO1E6UXql0=; b=peWrPpDNACa6x6
	Tg3IoU6IHGm5etYkUtUO55VDqXGMpkPK+7ZiIzX7vrRWMbOsdUzW5QwjP7MjYt+SjRvJQOAc1p/Ha
	V0V49YggmsrCiIeslDd5qgGHhk3TBKAms3mdnDPj+oYHhooT8uLgcveiqYH5LgNpb1+4DePFyCTp7
	EgZVSOtycki4YBDmvfX2mytyAdQ5sYTrL4gdtPy4D2W8k/LZMU4mj4w7KO2DpCdMIqvm/sr0JI5fg
	GsPstzjWrApIs8P2cvNn5Z6g/QcQqDP3S9XaPqJneYgDScoSJyoYaitatT/49oJ/iI9evACgjrh8K
	M/g7g3kRdAif42Vnb6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7J-0000000Asf2-0JIZ;
	Thu, 27 Jun 2024 15:32:57 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7F-0000000Asd0-0bKV
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:32:54 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Jun 2024 15:31:18 +0000
Subject: [PATCH v2 04/10] dt-bindings: timer: Add SpacemiT K1 CLINT
MIME-Version: 1.0
Message-Id: <20240627-k1-01-basic-dt-v2-4-cc06c7555f07@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=jlJAxtgKZpcQOsCvH4z2K1QJ+1Ic6ECnm70OutsapPk=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmfYXpKAR/bCQvjdy9lSXYBFTh1lzfuFwG3ENLm
 sU1PZ2NnVGJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZn2F6V8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RIbD/0Ypzru6itSvvzThA
 fWnHbEAURPxmubhKUNVrGutgsOcGFV0xKw8OnXD10MizThQVF7Q5oGNR98sxYvaZW9EpGTDJBr/
 uBoLaZCeRoRxQykUGlvr73BGDwxEkcwbPWcF/nbncR06D1OMCohfmFRIESVb/K+a2bRtbLkZGPn
 vXljDi9wqbyAD8BkzM4chLs0BhntIGF2SzUJjddJ1fQm+Z5c4nUqECALKbNKVoko4jkF1Ih8z9v
 WDEswiKS8J0oLHbf1U8w2ZoLYgO66BejC2/RhxwHI2MNAhWex+n2MHAi0GCbX1FHAOU39uotMtD
 YPLB3fzd/lpdA9D+hypeEaQWf7hM41+qHrMYwaJtbK45nMzlHSPkmNA4LGHVc4+HGNcydwRK4+g
 SbC4e3e9Pihj3ZqtKGu1WWs6Qme7g1QM7y0k0hAlfIxl8dk1oFcpmVQkZoajzHHAZI9aEsPVoPQ
 szwRMfWh7e02hhbp+R8BjKivsq1Fm9JmYGZnRRnBoogsZRqdQiSdMVdmfsdSqZJtWVEk0ixexfg
 Q6YoaeiVnGNKQykAANUgx4gaqhVKRrLGJkVq3OlTPRgN0jB2WPyBd7nGcJLWYHkNhioLz53vbjW
 kPZA00kuCTmPa6s5B0BlYO/x5oHSfGOXNIyQAVRBm8V/5iG7IeLEUZf+gTa8NvUyHxeA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083253_250787_58E41E26 
X-CRM114-Status: UNSURE (   6.96  )
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

Add compatible string for SpacemiT K1 CLINT.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
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
