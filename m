Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1DBC3271E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZ+V9fxGLMzuNQmJOAF6OXrjV0olFF0hpJmOB+eFWMk=; b=fJAFxIoTrshmgw
	QtSv20tIEFwFE6oGiEBqSTchy5hGqhs83mL3HPL1vdKTbUC91rVKoDH+cyVG6BcPFl2qKpK/VWZGn
	rZBL0HNboFnF9IBL4hf90VZy3RjqG14o6sD5+7Cg4hunNbQEIUeoLzDp/lZSiywXOwkFpR94wX/G8
	LICs/5TvUesUDFE6cXo3c14PePjUC1soAit0CxPXpg2yEC14OtFnwQv83YLg0HkRt6X9fQhWYDXYS
	UKNZRrPJZQ0Th/Li0S6v3SpHlWfUw/VwlqbDWhydCbe5VvEvodISDASxriwLyeXF6OFL7DLd8F+W/
	6eXI1LlrfZQTsEOW4cng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1PK-00000005jaY-0pBk;
	Tue, 09 Jul 2024 03:20:46 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1PH-00000005jYc-2kuN
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:20:45 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 09 Jul 2024 03:18:50 +0000
Subject: [PATCH v4 07/10] riscv: add SpacemiT SoC family Kconfig support
MIME-Version: 1.0
Message-Id: <20240709-k1-01-basic-dt-v4-7-ae5bb5e56aaf@gentoo.org>
References: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
In-Reply-To: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=TZ1awhNq6EKkublblFnuZdsCVGMYEwJa+AbJQ5WzjOI=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKwyWHRKjqv9+VfOYY+IDPu8L2fFYb0E4JUMb
 XMbcx8u9pSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysMl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277fKtD/9gqKue5HzySoVFsY
 glHTZTUCPfgoXuZz/wuh2aFKIAsiotbB4LR9teG9/4KoMWjr3jfOqfMZ1X/AJVi9l85OPzbY/VB
 RMcXeZPskoKN1uPIC4/UYq92+nVrH03GFDAQzXw6VOQ13+iY3nwuYIDjb3FxoQOfRsKsI0Hoe+1
 boEo3mmyWRD7wu2GcgUijNccgykByP4J0wc9VbycxJJtM3Do4PxAQyS3aySoPhQmFktm4SKjWUJ
 +yl/Mr0Ix1auEjwSMliURg9Xk4F4qxZTpjlTvrUyPrDkjwUqv82HBv8Rd06TQ02Cm7NrubtUpVV
 0K3+MpdYh/pcOhOA+KmckoanfBEFGHrs+wRsKwomvhB/cmaX5dwMOB+Gu1dAxd0wJCX4idNdOPa
 6MmTz67sGQaBdaZyuQbT53+rPvL9rAkLR36KuI7Xbm2w1RBELgRhBigQpZQTp+IqTepUAtDYeSp
 8w9ujTU3vY/P0pd9lk2ZmGG9DfsTBL74zUBaEN02A2lahhWf+MMUvmF8gQciQA4ip00vfeuCh4w
 H7g2cFrUDCMC936U7luR6E03TgRlrOmWoyJEiNhT3yjrjq23NimJFF+0yIB7P2ovEuz5DsPBdib
 qhhzatFyLODbDDlS4gt0Ugt2MdQpdiTq2xfNAoJhGsmYCI13J6l9Odpz7wmBxCK90lIg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_202043_816826_1480C1D9 
X-CRM114-Status: UNSURE (   8.03  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

The first SoC in the SpacemiT series is K1, which contains 8 RISC-V
cores with RISC-V Vector v1.0 support.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index f51bb24bc84c6..1916cf7ba450e 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -24,6 +24,11 @@ config ARCH_SOPHGO
 	help
 	  This enables support for Sophgo SoC platform hardware.
 
+config ARCH_SPACEMIT
+	bool "SpacemiT SoCs"
+	help
+	  This enables support for SpacemiT SoC platform hardware.
+
 config ARCH_STARFIVE
 	def_bool SOC_STARFIVE
 

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
