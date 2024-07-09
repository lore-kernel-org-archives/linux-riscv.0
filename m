Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8B2C3DA45
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7NpUpmxaXgnuiA1CT/EXcdQo6/AOmpR3/vdYEM/vOc=; b=W8MUeri1P598bg
	8iqgggbkPl88dN0uDc+zTeDgVEQdZ9VoZ+CgEv53IhQ92PFR6yNgaokxgzu4ArGsiD9vGBJ4JBULo
	QYzvq6tNPMDIZfFowLfVtLhJ+ENl/Meete+tTZ85/JwLada8iLhCCc/s/SbhYK1/iiIkTmWa+sSLE
	GFdBYi1GT8P++833k5B7QXtX2dn81q9rjWKmqV4+a8aQO1it8s0NGI3z/wOa8aFejku17JOOqnWgi
	9FzQZ3qN6nygNFPJLAImzKFdLNPrBF53N7NBfeUgpt3a71j7gxAgwjPFQZ8DQO7D3QPJC/yII4JSL
	LNrCmfO4PPn4qHT70JSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1Pz-00000005k23-2edm;
	Tue, 09 Jul 2024 03:21:27 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1Pi-00000005jrI-3sOa
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:21:14 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 09 Jul 2024 03:18:53 +0000
Subject: [PATCH v4 10/10] riscv: defconfig: enable SpacemiT SoC
MIME-Version: 1.0
Message-Id: <20240709-k1-01-basic-dt-v4-10-ae5bb5e56aaf@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=nL3b7ahT6PV/xD2KFpmUqqi2YSsxtqrz+nMpwZze7nk=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKw8UJeiNWb9cOf0HFjpYkqCDrFZNYSjTbzd+
 tu3iV1QfX+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysPF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UG9EACH6x0kZ5oN0KPPGc
 JZC0huaCNkqUkLvkzX3zhXIkvTyZX/wLcOxTJleNI0GTR+wAII/BfL04DOkhN95b+6jI/5OtsF9
 k1bG5cUaj37XpAxGwJ/r/ryD+sq2xzzX2m9FLfSLBu7jjtt5Jn5xjDxGQH+iWFQu6JtVk9ff01A
 L952+9XIP2idSo8j8BhPYksc68FqGEvRDnQfwzCqWEb6ByetyGgyeOcBpwz9UQyalfkzHihe4am
 1y/Noo39uDoVcV1pdjCrbG3arTtYnKn6efO390QbP3s2DHJWTqeclgwns+nMKQR2MLSkVWLsG7e
 LAMDYtfEQra74OiE464xz7M89R2gzLyoWbeVV25iYvoEEq3F1YP9Y37o6jNG6lOBqbe2XC6KAI6
 /EY7XtghXBkBCzTd6uDbVinMKRZfc3QaMa05j7THgNBehSvDbpQsckI6lKveEanl2CFeECLshIq
 8mktzRHbRlApRodX5PMEkZ1hMWrRCWxsz36M5UX2wFGM/OUDZwApdu+wXcDOICXViZEkIjB3lVi
 XFgFjgiIZ/nvqtE7VWkrgZDBQSQFL2dGeLS0hGErXSuDZosPzEEdpF+1f7NG4RqtIoF3cUsEzXm
 njmGDohjJYR7vgsIEJtkTrCeRVzi/YcGVPoty1rDoGd04XM1Yy+5DGTBxbLo41xqeNJg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_202111_109536_16733DAF 
X-CRM114-Status: UNSURE (   7.71  )
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

Enable SpacemiT SoC config in defconfig to allow the default upstream
kernel to boot on Banana Pi BPI-F3 board.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Jesse Taube <jesse@rivosinc.com>
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
