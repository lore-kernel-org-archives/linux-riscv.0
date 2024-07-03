Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EE3C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Qy3ik8/ffTl3P1B9FJRXCMac4ix+orArKpMYnnBOFc=; b=lr8gdlQ/8x9X8a
	dZEZe6Qvn9kqIwHTCV8/aO3drKLQYvi26GSmf48YlY0QkKpGypv+TDrC1kCjZ9SdmLnl8kVHmaj68
	RF//f8HRUgUoxT+U6C4J4ZIZ8af+VfC0W1Ep4sC0Cy+4wrXHFpHvTTm0Mdd2jOgFcrAS5HeTNvcFb
	omNYIdC1g1HMVVV3Xkx9kGjYMChEz03iUiylTqyotgXofNoiNTGbPqqfpvFgKIy4UPSM2laM8IGl9
	W4dNp0jdayQR1OXFBZiT6XQ4SP+EkVRkB/yxTtvdpHxzaAF6XXO1E265BYiNVYplVDvEv7ZIZxULT
	Dg/16EONKhJE7cBmt6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Qn-0000000AZXn-26FR;
	Wed, 03 Jul 2024 14:58:01 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Qk-0000000AZVh-36rQ
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:58:00 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 03 Jul 2024 14:55:14 +0000
Subject: [PATCH v3 11/11] riscv: dts: spacemit: add uart1 node for K1 SoC
MIME-Version: 1.0
Message-Id: <20240703-k1-01-basic-dt-v3-11-12f73b47461e@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=FYb/IeaNJbgi8XBjYSx6fcoQBA5pfVX2DSvIBY85iWY=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWaYVMojX7yGUCMGenZ/G6Y12xM+vfgob0zGX
 oDH4tIc8fyJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmmF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RQ0D/9YAmhX6GyKQ4NyWq
 w20Cus8MEtiGSC59i2CPEuPyRHQJwZAbJs5Sk+bGc0jFd2Qv6Ag0N9lhypO+7iljgKLU2xvasO3
 HlePbBJXSNVziW92BkVPYhRgXGK7nZtSX0cO4y4wfy3100sWL8Z/DkRqemcCB+36PMsJ8novdex
 He+lVXSjMNnwG+LxaO/r+PLABcxM0EZR1VZM1D8AXQPgxASkcryBkQV6mZ+RLf0s0Im0HXiOIDK
 Jisdxq2uQ4gQpjimV71Tijj2T6xqE/iTMXfshPAKAIMKDsqAtPmwN+dOHalMRXdmfhvHQL4OJ5b
 /t/A5UuvO5VJnAPOn9sFDLoonhCw/RZswNfMAN5M4/BXZXB9/+xyZkqAogbdqfCpYSI9j8U+qqf
 OzH4x9U12KA7ty//rUhOk67rMWclum5lvhfDRwSlSaOEKTi8Awde6yb1azaDQK0Ig5rmVpZoxOC
 qhla1d6lByRDxb1MdSiY3JxJ187RAOuqrryjqKwj8o0qZ8vl62gRHXymRD3uLTtWnQAr7rl4w9n
 Zq10wH039wIbCoXdMy8qQhzYMLKiMApHpK4b1h2KUo2lrJFUYB+mBiPm/cJ3KmKpwx//htBgbF9
 73tkA8O799TBR0S8L49RppoScBvnV0qRfTygcVZFJ8G2P5s/PY7BiE/y8zfIbPZmA1xw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075758_921755_76FBD38C 
X-CRM114-Status: UNSURE (   9.55  )
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

Devices in 0xf000,0000 - 0xf080,0000 are reserved for TEE purpose,
so add uart1 here but mark its status as reserved.

Signed-off-by: Yixun Lan <dlan@gentoo.org>

---
This patch can be folded into "riscv: dts: add initial SpacemiT K1 SoC device tree",
if maintainer finds it's too trivial to have an independent patch..
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index a076e35855a2e..fee8921513c1f 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -372,5 +372,15 @@ clint: timer@e4000000 {
 					      <&cpu6_intc 3>, <&cpu6_intc 7>,
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
+
+		sec_uart1: serial@f0612000 {
+			compatible = "spacemit,k1-uart", "intel,xscale-uart";
+			reg = <0x0 0xf0612000 0x0 0x100>;
+			interrupts = <43>;
+			clock-frequency = <14857000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "reserved"; /* for TEE usage */
+		};
 	};
 };

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
