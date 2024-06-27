Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8172C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AP4svg+nsXVeimlLwZsgOHt5o2DGMG+nlFEiKHRIO3Y=; b=0AI2pSrzoLxoSf
	eynXxorru0sqUNJvAj1K3XLgV84x8eXeij1iF4LcZSBdbHHAkhBkrdkLhjJTj8gb723lexEXZgaZW
	0dWcUTLIAXaxp/tQrem2q1Qq0Sm/STE0ad3wVWGrqB+GgYzT9B6wVEwhobFVstZoGIBSbNRATsYRc
	C9LJ19YmqPpzL+G6vQB9yFYEBgxQNyoo1C/cg+QrgTDuC868nRZaQhfTZ1d+avKgfP9wUyXdndz4h
	ArfAgD1l7woR/Dyrgcf4PXFVRBrpFwWLHjFMrJHLR/T1RK8GccCtTGFeGGLbLXUO2bKIFcW/Qz+Bk
	AV00K6ibCSe3+zrxPuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7y-0000000At5O-24qu;
	Thu, 27 Jun 2024 15:33:38 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7w-0000000At3m-1dRm
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:33:37 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Jun 2024 15:31:24 +0000
Subject: [PATCH v2 10/10] riscv: defconfig: enable SpacemiT SoC
MIME-Version: 1.0
Message-Id: <20240627-k1-01-basic-dt-v2-10-cc06c7555f07@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=694; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=0K4ao+VU11AdvF+9uh5x4EN2IBtmFYnrwob9vqhF5jE=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmfYX95TEqSfytY8nhsyKLbPKKtiu66fvm/DZGw
 igFFx7X+taJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZn2F/V8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Z0PEACbVCFa7pvmng4Xz0
 58UY88QmMGAR0UL/tB5Ag4oPNQKQX0VdrLoYcRsv84toABHKLJJ02XgfR/xBKC6TmcFid+m8rro
 5FDSCQxgNZgDCZJST95bu1b+90Z2F7lkZ0CeD6LiJ4WPSb8zUNbjg3EUFQ3z1i47vEnWSbi3Nv2
 9Lep8tCguQudnUxrTUrSC+BckMqD6MZmvOxUwFu2qDahl7KFEIGklpwAX/8p4Qs9447MPdyGb7D
 jJO4znTG7VKvIyuLV6AcpanVkdNmr2+9346yhbKFCsNlX4t94cAW9+xjjbCuFDKTRoPG0PBgeNn
 f2dQc8GdrkjUUvqVIyJcd0TpwCIsQ+NQ0byZS1rZnXxAakNt1d1y0gixI2tUcZEek4eVAv+8gGZ
 YcGpF2CXHWfCoeQBEgUosB8GY+jiH7/8UG37ug3zuUZDWzaKxgZ5+jMjpb8oN/OaziKQoNwkjUp
 A2mcHuob7zMTgcgrTb3A6RSt1HRPruSyXpv8kVwLaWzasFZaKpUgKL2f2F8AxrSIJzKZFUMBRcZ
 ca9qPPkJ6oPJMSX/EyYkoBgQdsDV6eQtwlrOflRPYYOO0U0t3GBiUd3VN5MdAlblPZp0EZoAfZ1
 MYiDvhsUVmTIkfuiv6I77pyQ5F+p5etJoK6N5BnfHVzp6k2XOKIt/GFe+cEWV0TkbTdQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083336_506657_C45A8DCA 
X-CRM114-Status: UNSURE (   7.76  )
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

Enable SpacemiT SoC config in defconfig to allow the default upstream
kernel to boot on Banana Pi BPI-F3 board.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8acf..5287ae81bbb78 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
+CONFIG_ARCH_SPACEMIT=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
