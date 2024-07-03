Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C7BC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZ+V9fxGLMzuNQmJOAF6OXrjV0olFF0hpJmOB+eFWMk=; b=EL1HRNL7OAdbTM
	aA6v0eBcG90BgBKoZq6ylMvCl5Jh/ihIVQG/NFnZzMTfan8cx0FRJ1AlyZzmqrAb1L4kTGIUtP8J/
	n2rmJjZAP/oCSjE5a+insMF2OUc2MEiYK7l7izdo+xdf78vphc7dmPa5zCqCsszFTH+YooLnJjJxS
	iT0IDYGxjkaVwFehW70lUhuEfbtyAHog7VLY9fceMDX5fQ1jiN/FJIv2pQzbw4QjXYHobnyHsqYGF
	ZMUhzp2FrNrWFjaw0xJSFbKLi1CmHho9gufM73W4XrXT+kF5LfNcheOPlv3Imm+m4nBrFPyJUXluf
	jRhHZqO5odXwXHWJDQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1QM-0000000AZBr-2DUl;
	Wed, 03 Jul 2024 14:57:34 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1QI-0000000AZ85-0vip
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:57:32 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 03 Jul 2024 14:55:10 +0000
Subject: [PATCH v3 07/11] riscv: add SpacemiT SoC family Kconfig support
MIME-Version: 1.0
Message-Id: <20240703-k1-01-basic-dt-v3-7-12f73b47461e@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=TZ1awhNq6EKkublblFnuZdsCVGMYEwJa+AbJQ5WzjOI=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWaL0Vk9GaOtkAZTL4O7bVWSsJPW24ebsFPh9
 KQOugsd2gqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmi18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277de/D/9C5KHNsyrSizjVeK
 0Iqug0ujH8tUvvpgfSiXa6T2o2UzdTiPGnGALLjKMCGYd9THx3K2WNzVg9J27BwXPOOnn2Ionzs
 3oIRMtmBI7SSpIpHgpRKAO3R7QS6dwN9DDNOzca9h518OgOgqEgZgTlQAnu1FvdzLAhAN0ZrlHn
 OsXy6OKQgZKgJL8H1qsYVK/jE0AbjAxrp0Kg7RY8mSjfNIL7148lUAEYYCYjZTvnLymUTN1RExI
 3b4YJ4iynTkDI2UoaxkvXc+w2Yk1jwqR50DIkyK4tTzHqzd7Rc3kyZ6Z+GO/DYF1774apsk7d7Q
 KtVGGtTsNXfN8/tEcq2SBBo/TTz59MnCLlLbC50geuMQ2zarQ7EOoJDCalhTuBQ+S0Zf+wWJbtS
 IGfgxj4oJsiOOGvgSdgfzvKxFDnauNOfr3VbQmUUxYQA7aacQsaWI6XuVaSy2I+VtcodnGm6fFW
 0CnaaLfS+YCAyfAEoGkf8nz3CC9qpFmPbx8ipXWwO82VZP4pLWlv+fOxkF8aaZjNs5YJ5cnVYd5
 pFVQgMMDPeAi5WEiYmmu9v0a6TwuPPKW62hPgIXSDr3zOkEJE3omAJZbSbvdOPEZCR1OkknUZUw
 42dYL9nTojHm8f412XksZ+p0M52MqJ8VjdnO0PiXSPi23V+0GbyGNh8vdLTNVg0oxcXA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075730_325963_38E9B680 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
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
