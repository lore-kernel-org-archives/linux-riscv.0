Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1155EC3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UO0Cqp6pnYZV4FnstLI+kzC3z+zWfQkCC7EnkBvGtxc=; b=icPDTgbgMWAPAz
	TKmjpQrMA9YF96CexPmrCCfdLBQoun6XXMy5c5JO3OZQ6wxA4ElhBmdhaIJIbB80Fzc94fitd+dt+
	3U9KPzFdbxezRvrKv8RXv7Z6YQKJM8LxYTbl0mAZRHjBZrs8MC08fDqu2KRcgBcepZmJrAafv1JLt
	jP7tHjpRaK3bpUxuScXzonwY+mMVBMa2PkFYr5I3d4G5yCfRCtn3Ueez3dCZWA41igfHWKF09GdNJ
	U24oKLxkns3Ilr6LY6p3z9HhyI21UvtbrWMyS76OVPGyDYYnyEVdA0aM5crl9D1GKa1XlUFKM5rse
	0Md2ciC7o0jHsc+Wq+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajp-0000000D5kF-2xsl;
	Tue, 30 Jul 2024 00:29:13 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajm-0000000D5io-1hFb
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:29:11 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 30 Jul 2024 00:28:07 +0000
Subject: [PATCH v5 04/10] dt-bindings: timer: Add SpacemiT K1 CLINT
MIME-Version: 1.0
Message-Id: <20240730-k1-01-basic-dt-v5-4-98263aae83be@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=G8BK6D9+YiBDVaveYkEZ4DtFvpj1iVXn+rNymf77fpM=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDOnEhV0ygT96MAh5y2z7oZE5HmxY8sHw86XP
 3un4WrhWCiJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgzp18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dkmD/9gdgvA2CjooJueVf
 i7RzHiNaPKfCE6ei5R/ssBZ5rkE8zxipnsZAuCXqtHmpcxMVp85xMiMzpTR68HeRaJHDhwi6GqC
 r651A1FykZKtXSfZD+MX0xu3zYKhu/QXZWb6CJBlYt/R3MI/BVw+t0+uW09nAP0vEPShGt+UJSo
 I7lC18QohWnnKZ4MFPAwg/1+Qzz+lzkHXEOU+RaeVLvXBfGwwHb4vOhqiI+s78EMDruoxBGaUK0
 w++A0aOAWiXj6f4mBoGfpXYSvRDFcOGSnTCMJ0BC6i/lPi0g1OVEIvoRD7XWeItAAalT7LpYHOi
 PwZ/+alkssP9eNcE+rwXSMkKIQxdd+pO4Fnqf9axNdjYg+7rtaJiQA+0bZcFiKWEjd17qVgXmJ5
 qzFdwW5S74AAWrIrptVmdgzwK3+QaMhT2JMLugh/ErLd1DCjZ9tLJMCS4BA296NK0oR3h59GPyc
 wYW9qFOjSf4Fq6ScY9ok5UC32jyyaiFOZhTD1XBT149q6exgFh4EccEug2YxKqTBQNLNWOvbxtr
 LWsM+OHETHI/afF+fI/ZI7eakACZOWjjy48ndx6yP4jV6YD3AtDSONTGKXxWk/oE+p6Mh0esv5P
 Ol7QnDdldA3EVOEBHCJNsdYpLHpLO6cJS91tKIBJ+Mank8gLMXs/EM2TikqxAPAfhjIw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172910_529823_09765AFA 
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
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
index b42d43d2de488..76d83aea4e2ba 100644
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
