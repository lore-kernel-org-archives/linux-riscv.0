Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAFBC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ex5eOdxzVUWIhrP3bZfw/LNYwc95Z75v5o2aGSg9FI=; b=3Bu71Xh5JIKcEI
	3ZJFtMOOc59psZJgn4rU+sa9HP0UEVMwdVMVLljMrnygUu/B+TiVOOGyBHptc0vITutmneBtXmuxC
	MKWsW+WnVNzIRPKkPR8zlad0axWHln8DA3Op7yQS7BT0JYLY1wCNnGh2iW4s06bNjmm8hM6rzNoD1
	lzEF0U2HjLd2lwd3bNT/OW+kLoSEof5JlhgYbOOAWIkPfuaAyNbscpoUx9AKH5UrRdxI/Dy5M7zBN
	HQth0X7fwoEDsXbWhQHa/bwfzxbpZvIy1knkh1jjYqiOT7ozquPB+KCN10DH5cmfc7J8QERH0rktu
	HP9NRNH9hv0sbTgDqi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUmct-00000002cP0-2WHp;
	Fri, 19 Jul 2024 12:22:19 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUmcq-00000002cNE-00aj
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 12:22:17 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 19 Jul 2024 12:21:40 +0000
Subject: [PATCH 2/2] riscv: dts: spacemit: add pinctrl property to uart0 in
 BPI-F3
MIME-Version: 1.0
Message-Id: <20240719-02-k1-pinctrl-v1-2-239ac5b77dd6@gentoo.org>
References: <20240719-02-k1-pinctrl-v1-0-239ac5b77dd6@gentoo.org>
In-Reply-To: <20240719-02-k1-pinctrl-v1-0-239ac5b77dd6@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=IXxokw4qYtSnbyMY4T9bSgXF/QqjkCxAt8uxZe28KNw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmmlpej2yFgvx2t9dDUL4fj4bTcGGRW54F661BW
 iYGaFVAryOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZppaXl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Wc8EACTVYI3H7nEd7I878
 oMvouenk+DQntt5kSUV55ZJr1FcbatebzNuZnoXJCvJRny2dJ8F1DyOoj4jDQbNmUpicwjWXITU
 Wr4voaVOOsc5q0vq/6/nIn+uAMwXuD5J/q6ENtuvGchL8eyrgeZbwpsAWHeaNgxVnsQ2IbnrAue
 cZebSkNDdK+axEcvrlcTe0U+6SQ9oPbr2qzohH2l7o0GUSkF/JvB20Hq4XaV/SYVdWCQt2QIA/D
 V6/GVSEclM8NSRkQ2kQGz5YEqmRP+IQ2J7p0/5ZL+lZ2KZDliOMqrHGg8m1sTv66zJfitR46XVW
 /1SR00/0NlwE0Ce4EQ5mFlar/WtQaxBHt4OWU+sCyA+PGQg6KF1I5SytGUxr8Rf7S5BZA7EOyq+
 F9aKzvOQ2JxwGDcf1XviV+HHvdJ08oT9IegJpE2a9Q6QDOr6/1TsVvS/5u3VEAfQ0UO18PHoN+R
 nbVj/nOiZyydUHa2fzWyzOgannnlWkVwyrCk/BdwpzGMgYGEPfDhzDurH2HzPBUaQXvJ2/YO+hv
 8nXRfYdCTSGwgRaqaqSHIlaFtyhA8saFy9yZ9/w9P2AmLygW16jYz5HJH90z1S2y7bTL6GD3KrQ
 8z3xkISD0581I9i91lVzGebRbtRodWm7GdQfHAvZtSjUltSiG1qXXEydUfYe1vGl8+AQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_052216_285898_634B35B9 
X-CRM114-Status: UNSURE (   7.83  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Before pinctrl driver implemented, the uart0 controller reply on
bootloader for setting correct pin mux and the configurations.

Now, let's add pinctrl property to uart0 of Bananapi-F3 board as
the pinctrl driver enabled.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 023274189b492..2361269a62217 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -4,6 +4,7 @@
  */
 
 #include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
 
 / {
 	model = "Banana Pi BPI-F3";
@@ -15,5 +16,7 @@ chosen {
 };
 
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_pins>;
 	status = "okay";
 };

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
