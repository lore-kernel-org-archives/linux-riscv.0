Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B29C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZ+V9fxGLMzuNQmJOAF6OXrjV0olFF0hpJmOB+eFWMk=; b=hEBgkZfafhaBXL
	aCenDawCPvAAXXevmnMJJgk8bI7qQE1qUfcVDtJyT97HFZ404PDSuVhyxGndXsPVoEQ9ciB0KFqLU
	OiV1rVIRpXc13sgqFe5Y2payMBvxoBDi/8xjR5Q5psNKMMfeL4JseNq3tLSqjwgvvEG/ZIDipKPz9
	65axlxz2A8o/FYCgKlo8/QMLxNUblTANfwZuj+oItZzW+TjJLMjd/hEIfmQu/FTAwT0w7FfgmE3Mk
	DwkGxuO1YFbPlX7/9TDzsPef+n6qBtYgXcbRqrKGSGGUSGKG6XGZq8BHL8Ed44Jjld8kbDwui/3ME
	8AokiXHGaNjN6AX1yOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYak5-0000000D5x8-0bHM;
	Tue, 30 Jul 2024 00:29:29 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYak0-0000000D5sI-0io4
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:29:27 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 30 Jul 2024 00:28:10 +0000
Subject: [PATCH v5 07/10] riscv: add SpacemiT SoC family Kconfig support
MIME-Version: 1.0
Message-Id: <20240730-k1-01-basic-dt-v5-7-98263aae83be@gentoo.org>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
In-Reply-To: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yangyu Chen <cyy@cyyself.name>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=TZ1awhNq6EKkublblFnuZdsCVGMYEwJa+AbJQ5WzjOI=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDOxlXrjQ35yc+QEj2xiUXXXJUJmrW6p7WJ4k
 ZCFOZ8U9bOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgzsV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277VqcD/9W2TAjj+tuyuCeHb
 k0IQxn8FUa6KhbRtNBbL9kH2ujokaTt76xTJgzjdFKzUZV8jwhiWn9i1HOf+mIlJQfNDon28ira
 37q4DX4Ddmg9GapQCoos9ruDzzJTJSSROJuZR06dsMyr4JzLzitGowipC8jjTRv2I1HrVsT4ddM
 ZgVuFLynLo3p/iLbKnlcJNKzl1R9p9jyHBgyyB1zrtU2KZltsNoiQyDbSWRRiW/HC+P+pKIKrhe
 QpBd94W77ysFXF3R19IT47cns+4LuWC/rAUdvoVnPEaAxlW30AhPQc+9S/udI1uqVRYLY2kRWdR
 umiTfth6CqbfTpf/KqaxIL5MwhchvEpnMcZJA5YINKVcwtxmjrrWL5/g2qP4RJ94/Flm8/vJItv
 P5L2jf1z4/uNDQ9dSnQqRl0begRabAJytuRKea8tlX1B8AjwtpAMiFYx5lzxBndJtj4rGmTHuV6
 R58pNtPicGBTxEM0KLJx1u5N1q2aCP0WJiCBaeNhUv/7NIxOd4ZnV+sn0zlUiiI3v8dxLaTk3A3
 AjULZ7LIKgYJFsMDAT59tmwB/REpcvZz8ewvYNqt9bZ3TRspA6Dz/FUVp0iZFlo/RaFb265zI7D
 8Oep7QGxy5AWAWizyNXEYvIuRWb7IMQRyzQaLDv13CgwL4vp2/5dhklD/8r6yXJMu81A==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172924_339216_2C50A50B 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
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
