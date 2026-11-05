Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB611606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vLrISjIB;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Iuz2OVSs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GnsgJW2mlQ+s1yt/HWxhuGjv8euTu3V4QWfjC3NRB1Q=; b=vLrISjIBmncvF6RiDYx4KTvQLW
	fbrkF/kEq2CIWYab7iJSJ7wJsP+twVrQyedRgD5EtQuCJFJuLvZyGE+k9aHuuGQfTfwmkKFp95zuv
	OQPBIa/8Mt4fb7xYvRbBRDUbMCDs5MwkOSma0TwsMl15HEJ+3N4XZyZnRjsjZAS+obIHA5c+k0OhD
	qiS+kmvjY8k53qH0JT6Yv0x0ktJ6hYkdEy/qajYyIMRxVnXYEW/W4tH8JYmdQpaDFfx4jZ4mOrLeL
	/HDrw5DhR7FJK84t+N7ZxwDhMu5bLAjZD+31diWC6EGTJ700JLH3BBhu6LryFuyybaELeqO4MLeNm
	iAzijEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsmN-000000089GF-44sr;
	Thu, 05 Nov 2026 08:25:04 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsmF-0000000896w-2clD
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:25:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867053;
	bh=BeP9abbyuRADpO9tnoSCSAKZO63Jhkhje3D0pWwoNIw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Iuz2OVSsP8SPiXTU/qhyEhZS6w2BtkyvrKE8bfjLM5H8pWcujjQTzO1QecB1jIxJE
	 o7/8xsnk/ew+1gnya7zy92QRi8gAaYRkCMmH/y6BwtwQc468ApghSaGdTnxSO/QqLA
	 wg/0NDbGAI7m1iOjYMx/Yh6CE/L+so5mGImlnfNU=
X-QQ-mid: esmtpgz11t1793867052tca6bfb24
X-QQ-Originating-IP: feuNNwSfwKUpywoniGYAh6GBHSA4qT2mk7H4i1Lilj4=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:24:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3347373038067916414
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:50 +0000
Subject: [PATCH 5/5] riscv: dts: spacemit: k3-com260: Set Ethernet MAC from
 EEPROM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-5-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=qFPgZ4k0mozVoqhTFNoQ7QRNK6lvGtsHRAAIgvK5R4g=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEWuzf34v61HMVzu9qcVXXnaf8Mje2Mi26c9/9S8x
 +d4ngxrRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwET8mhj+KTK5HtkWlH/5ysTk
 6JAG2aLCSxecgjNOJzAzrJ1Sep/tBCPDtqTcmyJ1VqFVLFkRz9c/2uO1/tmC9IssPKfPbb764Ps
 iRgA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MzOrCbSXFQdfbPpMec9TkpiZkLfXp6P6XWjwK0P+OoDYnnETu/uza61p
	8SC6jdq15yK7uZThzNKNdxwbsg1gR3CurBYB9CI85zG+dxwTbQCOjUZqDoq1aTLltCljuJr
	XbblYLHb8G5GTN75j6qszg8KQHk/+O5CEvjAU+2bRh0cfJuwtoImnWyAEWiKCSJM7DT4x7z
	N9b8wz8gDgW9yJX23dAtg88Y0vVi5q03bWnFbS5hzC3ZX07YWlYGwwl55UysQQjjPXEu458
	+cp7uqR5r8BBj+uZ1joQ0tNWluEX+IBjeWI33kg6+RVXETxanX536FRWPLD72diKcf5Y5x8
	irBCpTNHvGgNPyLMgKD4XUgf+r4AwBvjSgrn664A2D08ODWxpKP272KYkUEOGuyDOaR+Xb1
	wSoCcMOjhJ3GRN/yfRWLDKy7CBZ7X7hpi7grHjAbGnZBpmc38KkBZxX21h8uF6vRyUHgz05
	Z1UEaeo0QofysqfDaStmUGhhTQPtI0dpEbcPidPV8GPs/nkGMv6DsJ95W4IWU/gZ2CVuCEQ
	xA477ncs8w6IGv1CzUcCyrB+4BAIy7j3ipZ6/5NOJBqVJJdoTsa75bB3IXt5BxaGSQ6bw8P
	/ozLhwlJn9MipwyqS3nWuMKDFfwyIli8xeg0hrNdo0oLi5Rra+UNrkYC2pQ+HT+yZRHWu7i
	zuP70c40QBkNMDxHtLUnpr1SfD90VxGjOQaPB/A50gjbxMXbT6dN6XQX3hKpbrJksUDoV7S
	8ZeVxvK/l0MRc681vvzaUPmnkgI/i0iMRNx1x+3yftlHVtQBcAiNt7sgLF8dzDigbYixuCv
	DHgtJscfPHN1hF4KRwD14mja5apfPxKtSuZaT4cQdnDBS8GL+04mm0SqJelJ+1jzfD+0/QL
	IhCNLmN3WWSuMVqdfM80mtppbQVkeY3GN23YujNX73jfjURp8O4uOWDCE/+bCZEFt7F4MoE
	oKdrECeW1BhU95swvL510MKB2jOqwkcBRA2MjKdaZYiEEMjK0oNa4OaqMR8vY3h65wEYgLs
	WmyXoJ3GBMH6gEI9mXfOUNtaHxp9KYqVzsytgeJkgjrcHp2RRa/gYLUKkTSDJEuiLu372JO
	1XpCbc/8cms5qC/QPlJFnRJLAQdE3WqHigqxezEXROqaFxE6baPTnVh2mXHRWTkhw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002458_986057_A13C985F 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

The EEPROM on the K3 CoM260 module stores the board MAC address in its
ONIE TLV data. Assign it to the module's Ethernet controller, so that
every carrier board using the module gets a stable MAC address instead
of a random one.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index f94607cb2eeb..1f5c958c9d6d 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -42,7 +42,7 @@ eeprom@50 {
 		nvmem-layout {
 			compatible = "onie,tlv-layout";
 
-			mac-address {
+			mac_address: mac-address {
 				#nvmem-cell-cells = <1>;
 			};
 
@@ -216,6 +216,8 @@ dldo7: dldo7 {
 };
 
 &eth1 {
+	nvmem-cells = <&mac_address 0>;
+	nvmem-cell-names = "mac-address";
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac1_rgmii_0_cfg>, <&gmac1_phy_0_cfg>;
 	phy-mode = "rgmii-id";

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
