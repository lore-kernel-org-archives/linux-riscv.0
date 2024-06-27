Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424C0C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OlGr3vWd/oL+KpPmBycVbAX8geA9qeMtE1sA+nPWc8=; b=2rd5Dbd9wmFTv/
	zr/KUanGVOWNmyKOIjQvpyxpCcomVVhQogidP1Ex8Vx4vxciJyC0eRiHTGmpI45eTLGJyLlJ41Ppy
	RQC/92t8eZr8yETGC4ZMDKZXl9J0DPs0548tdLeFoX4qLbDPwDne1VNdTAQN8hL7QoqgxxNwSqzEP
	sKvCZHquZhWCj1NMM5/qjONQTahCZOxAnomDTVIC52aTAZiD+8nWMpvZs+OxnEKoaVK/ggpyjXXbQ
	GqxidxVgO6telOwiq+yur9okUqongP4XOw/k+qWELC+Jwd0cpZgopYg83Jt2OHnnx3W7Sma8NQO6Q
	L74lEtzxYvMP3j1WJ5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7d-0000000AsqD-1Zyj;
	Thu, 27 Jun 2024 15:33:17 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7a-0000000Asnt-1CZu
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:33:15 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Jun 2024 15:31:21 +0000
Subject: [PATCH v2 07/10] riscv: add SpacemiT SOC family Kconfig support
MIME-Version: 1.0
Message-Id: <20240627-k1-01-basic-dt-v2-7-cc06c7555f07@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=QhxdebjQDEUABfeb5LjQhHiNUi7MTwtATrqBh8H66dg=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmfYXzmTS+2JpnJbJvoOONQhD++Wfb8XmCgGE/+
 sYRZ006SfCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZn2F818UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277R2XD/9bCRE0TdkI2qNV+6
 EysBBloVSrobHMW3LIZaChi7LyJbMzgp9FdMj5100Ha55aO4k7tA1k+Qpqb72fo5DmUvglFJrnC
 vGgFNiZPaN6xiXVwmXc41KxeecKuCkDAbt2CdhOE3ASyQIBBb5bltniozZps5tTmoigI3JsRELM
 OaN/KbI0Hp0Z0dwQT7XBLeIdU/uo1dcPR1neRyrp/xNFSwlsFx5q9jIgmfRZ5Zcu0exIFi+Wzl6
 +bJsCc8VfLMNJkGKIekTEUZtw98eC/YYSEo1Bu0lh0G3pxLleCOTKD8wd58SDU59NXvot6orvxy
 s8nRqZU7MSmDVpcTc19vvUiECXCvGYtMRysOrZnAt8C+DWRdUwHGLE8IAkgnlDNJNTLqzWqmcDd
 9CPY2wXpmItnKPW1aNFF8a4j890wvTlb1kki3nEvePjJpVAbqoSqUOrbtPX3RI8oiy8sMTx4Tth
 rjApkBWRW+K36NDdDncoe8ZUlXYqExyaS3iVGFLM509orSD1/t8yD5eMpsveflwClJMSZpmnsCw
 /HEhcMlUnD9KmZa3xVHZOMzylQjKEK8RVyzjhMKctzY8n/S8Zd1fRgNsDoxli6kJUR6o9tsRHn/
 blu2ZX7wab3ziNdvbUBp++B4o/jn5BRgicz36Xy1s/wtjrYaEqvN54afcu2FeC/KBlVw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083314_407291_4BB6F3EF 
X-CRM114-Status: UNSURE (   8.08  )
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

The first SoC in the SpacemiT series is K1, which contains 8 RISC-V
cores with RISC-V Vector v1.0 support.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
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
