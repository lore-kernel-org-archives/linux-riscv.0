Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB2C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxHDPrMolgzumTon4qZEyyaaXaC7eIn4M8vTGzf3ITU=; b=cGgnJvl2KoQ0YU
	DRUa4Q7Cbqpqb6PtOlDNombD2c4zVbK2yTzNWHYSVCCgt+JSnU2sR3wssaDMoeAfHshsyA54Vs4vW
	1SLSPsmgJw1PgUGmjCPQ1BXYyY6w+n/eiC8/d/3I6hk4DrCHJJPInmZ1y59xvxtqtoIxPe+QV1MeX
	mioJV+/dcA5APzWvrT165WAqcC7oFXW4xAsHxNlxB31NkL2RGQ0O1/4OMt0NAHNiBUh1aDJ3JIYPM
	Ejfu4HTduVYljTL7D5GKj4escPiEoq2nV/u4w7TJQ3ujI+gvlgbSAdjkxcVCgGCu4DB8lqcRWxz+Q
	1hR16V9IVI5vvPzLc0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s50AA-00000000zIe-2qQ2;
	Thu, 09 May 2024 09:34:06 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s50A7-00000000zFi-3VmA
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 09:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1715247227; bh=uHRrkhKKY/U0upUZfJkXb4BY8bCTGf1SFZ8EyfT1G3g=;
	h=From:To:Cc:Subject:Date;
	b=reG0mO/yMD0Allajl/2aMO1ahdJMd1FG86iTLZ031D7u5g0tYM1mYE3kORENzH04s
	 GQ9UC1LP2QjvCQCjOcF/3MrO5DJk6oNrTrboudF6/TXbLNoe+iijW7tiuiGnvAeRzw
	 zVyBPSiMtLFK0Vh+p7YsW2wjyYMX9DX/LXbR0ZiU=
Received: from cyy-pc.lan ([240e:379:225f:c000:ddd2:5a64:482:d6f2])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 86B97886; Thu, 09 May 2024 17:33:43 +0800
X-QQ-mid: xmsmtpt1715247223taum3m4ji
Message-ID: <tencent_B61C1370E7632842D61BB7F9FA0515B44D09@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8uL2HVuJBhrc2zAVCXYqfSMQbCILL5ryFnjPQlfSSZSmyhy0OIS
	 51hz1Aj5/VjBhn/J3uDwgpLwGwdPxe6mo0HKpyqEVWoVZD1ju4+BSdIZLKYcr1FqxTGvLrKobGz6
	 9MRknHCRtI6YvQTjMv3elKw/uuseaZvLe+uwd92wJ+4Y/ZrEBJg6rV4kXrp+581iAqZbVyxiE19W
	 WuqjyKz1jdnZWTG747f/PaHiKP+38krSpqFhgycfkgnsx77GiKoMDxQfI8x8Y8ynZhDQV//Qz+DH
	 xja4FqphOyVQUcnHNPIf4uVLUaA47Lp18wJpQqGO8sLWnqs8+8gnoYXvOFgHXuzv4rwFCCOPU02C
	 dgxsiD+mjvY16vcI6QgHkd2+clL+jKlA4liQst7W0+bF7OEvuvmpIksFU703rPDhAQY0lByg1bVG
	 ooud3Hq4c4KlTsDwIhRKRnbenhW0cfSmOya03euiBpH9xJuJ4WdlsSaQygHYiD76It9XTfoFRpZw
	 tUTkXSz3rxx4e4pl3SIQROzzZZ0qkcnl4G+Vg1/C3QaTcdEp0eo2xcwrcW6CrY/Sk168Y/YAwTqt
	 zzQEhV8Z+EqwzKDRo9/tpCfx9ry+bkjCr6VEiK1dlBNkwwmk14el1KiG9m/vN6p79Bvc040hha0O
	 3p7hySI/w3VOuB9/Xqemjuf+YtRjntvFCkMmknFI9LTnryALuCB/mlExTlcVbY0e2DD4POPIn8Fd
	 qQPXkgf7XZtsX8q5+kRyWUA5tYZqz7ekw+SJo+QHKvLNhRL6nn4JorQDFnNzolMgQTUkLlS4Xjhp
	 p7zpW/I7ccH83nQ+Euqv2R3XFEXfHzlFhinZw1Uo78unA2WVwgDed+rOCOkipJwUMTRwI5zgvIdv
	 b6FoBWxUi16ON2TOOzjICCTvV0QGfeNVVNxKW7D/7HrCnH2TB5xwJHLBl5QXxUC0rglWkdMCB7Gc
	 zOluQZfO+YuXCG5LlxNL0YfrT1qh/lAlRQpTHEKQCxYrqqYQ98BTPdz9W/qVQBsPHEDBEWuro=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH] riscv: dts: fix isa string for Canaan Kendryte K230
Date: Thu,  9 May 2024 17:33:11 +0800
X-OQ-MSGID: <20240509093311.1943337-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_023404_570462_9E237CB1 
X-CRM114-Status: UNSURE (   9.57  )
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

The original is a string in dts that has no "zfh" or "zvfh" extension,
but the K230 chip has them, so I am adding them to the dts. This
patch also reordered the Z* extension in the isa string and used
canonical order for the category as the first key and then alphabet
order as the second key to meet RISC-V ISA Extension Naming
Conventions.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
prerequisite-patchset: https://lore.kernel.org/linux-riscv/tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com/
---
 arch/riscv/boot/dts/canaan/k230.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb11..104e08ef5869 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -24,11 +24,12 @@ cpu@0 {
 			compatible = "thead,c908", "riscv";
 			device_type = "cpu";
 			reg = <0>;
-			riscv,isa = "rv64imafdcv_zba_zbb_zbc_zbs_zicbom_zicbop_zicboz_svpbmt";
+			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zfh_zba_zbb_zbc_zbs_zvfh_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zba", "zbb",
-					       "zbc", "zbs", "zicbom", "zicbop", "zicboz",
-					       "zicntr", "zicsr", "zifencei", "zihpm", "svpbmt";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+					       "zicbop", "zicboz", "zicntr", "zicsr", "zifencei",
+					       "zihpm", "zfh", "zba", "zbb", "zbc", "zbs", "zvfh",
+					       "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
 			riscv,cboz-block-size = <64>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
