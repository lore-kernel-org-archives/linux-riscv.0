Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50099C5472F
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGtJ42A+vmCmun3NHGDQ0CICEt1T9wDQb8v4VdR3MfI=; b=ly1vE/tALJiCwe
	tevT2bWjN2aN6GJ6DAVCNESMMD/fw/eFS2+2Sww6Q5k4ma/Qp6pea+8XfmoOSnMKEqKa4NqKTlnx2
	+i0M5t1+xXtrN0+W517Lc/Zr8AZhDfKzXUmmvAeQAQQ6DRzKgEEELGggis2Nc7VrQq/yI4Itc6DIv
	TLjdbX03zHlrLxMTsr3e/PLf5zNiXs9rRRgj2P0BFN+kabJWnNXUrh0B4I/QNK/ur6tX2UPCTcc6t
	MnCivOFR1dtn9hIgZ9tHC1t5pW6+WVEHNGc+Cr9bwPxrR4hoIpz2SjZbczl77j+6FIxmXunjvkjat
	uQrc5RsOE6aTw+4/d2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siD1z-00000004MV9-4Bg4;
	Sun, 25 Aug 2024 13:11:44 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siD1G-00000004MFn-1B22
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 13:11:00 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 25 Aug 2024 13:10:05 +0000
Subject: [PATCH v2 4/4] riscv: dts: spacemit: add pinctrl property to uart0
 in BPI-F3
MIME-Version: 1.0
Message-Id: <20240825-02-k1-pinctrl-v2-4-ddd38a345d12@gentoo.org>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
In-Reply-To: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=gWmuyPDq21pf5ffpnoMsUraKHy3KBjlrnMFcvKOQvaI=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmyy1LY7BfomQ4OaNo/voQ9Uklrc1sU+g8YPp7i
 t8Aa4Di2rqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZsstS18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TMgD/4hf3LdOS3W3E1dPh
 5VIydrMUw5A9R0j2+vRxifJAy5ZN+SqDZ55uHUBXL270EUslItPMAaCbs/lamBSlVjPUxCClk6v
 CbsOO57HSArNuFRcnfcQMugpaF1jOSsLlxCdVU7zpCohXrmCKquJZ5UOGkXtuu14EvbgloSS77b
 Rmrs4TtjVyso6keTSrKzX/nYljSyZwBd2N1DxAKSDhmnXqLcZPqsyPwY9EsFmwq5Pzk6PsnU4gu
 fXgLsKYrmnu+Znw6LrnyXh4ckBHwaRbYNj42zBCk0i/H2dle1IwDMFX+/Z3ge+VDautH1FQjUb8
 ZbiZKbsrxGR2opytNN8eAskJpxSiIvERSvidcFmUfaHwr0UN3locGSH7fe08GWGD/yQn3Dj7xXN
 6uHq9ItCxHC3RSK2dE0mzfJY4uEtSIPaBXUgfvCYdAUExHyEJhVZH6jEW6EiCGtmm0wB0oH/JJ+
 1cK5cSIaGgGage1JIhv9RHERZa11SZbpxzl3GJkFBuoDHR3ELyLXSuL/0oK2Q2vtqJsTzi+AXYz
 AVrwwZIWspQVKetlEJRwb4igPRvVT95bHKK8SSbKnekQNmOy5hEuAcLiffSl6iEZGc/eip3F0Cu
 d6N4hCnXaE/7eXskalOq1AKELg3GUiGR5+u8Ap+Zvs8Eqz/0hZrdl69wQAh6E2keG8Kg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_061058_378328_E9A2F001 
X-CRM114-Status: UNSURE (   7.62  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Before pinctrl driver implemented, the uart0 controller reply on
bootloader for setting correct pin mux and configurations.

Now, let's add pinctrl property to uart0 of Bananapi-F3 board.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 023274189b492..bc88d4de25a62 100644
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
+	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
