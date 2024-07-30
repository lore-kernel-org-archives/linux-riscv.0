Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D35C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=111sHzQrVifxHwKla9WJpcFfAoOHPf3nlJRWs2zuG84=; b=3xZVRd1HvTjjNO
	sRue9lH9XqgfZPv19s6xr+0EV8LeDGCcUH9Jw2Tsj0Mlcz199HpM4MAMPTd4WS609So/T8D81xUZr
	kyUkg6rvfav+gftxe0ZwnMPYv0rPvAcInWMzCP6Aehx1YE5OqNU/MAGu03S2eKakqU6uzEUT0Rzcd
	oIgNAgbuvYLMHaid7IG7bkNzkfEx3BGP5rHZydYnc01omnK5OCoBEobaQcJvF2HSoXPvfkHg989oO
	bRaXbyFJXKPHVYw8kY+RlSbdiWunOVNh6ZH+sI/5SMoOz55EvaNTDQbtGU0mYSENgUAFc8QTED8/P
	faUR+ZCABXi92Ox2Q8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYakJ-0000000D69z-07qe;
	Tue, 30 Jul 2024 00:29:43 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYakD-0000000D64e-16Nx
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:29:39 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 30 Jul 2024 00:28:13 +0000
Subject: [PATCH v5 10/10] riscv: defconfig: enable SpacemiT SoC
MIME-Version: 1.0
Message-Id: <20240730-k1-01-basic-dt-v5-10-98263aae83be@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=9N8TKrCdY7rbrxOHcrLT0SLycg8GX9M08nsuS3f+YnU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDO7rgtgINr+JB8e0BVYVciQ3xAulX3KY4dzf
 uMplniCQIWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgzu18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277afLD/9/VNEHfzNxkgCfEw
 OqWoylFdhV6U8KYrnno6ywHt+okATJcEGzlV9RqkmXPbEk3heKHAg5+iJbVTVTKLAoGnvC1C0KU
 2L9aFJn9abUCz5Ez+dXt23jA9In7kyq/Ar31XlUH+ok34z9/bWYTwFM1GCMrO7aro5kHCN4/uoK
 WPH/q4OJppFkAnBjBI/JKE6UNJmYr4sl4QcaVrEL0GWAmDpBoYkhSwh3L35P8Lt0BJQ8nCqoJ7f
 E5klJ0btdwP77OPlDNEw0oZZUPNafkrOx6zhgaTs2o3Q0Ew6JzbMIG6jiSJBb9qMu3VkSOXwtdr
 nztZqCVYUJbyYKX5YXDA9+pmPB9ltZUhTarwtPRHminwlM0suXxyp+d0Ao2kfchszUKTvlQuTCn
 SWfEO2BCYqynU/kXqK5tcywtAyzIgA3NqhDBJ9fKnYOcjWH6tYVodjVbsrWHANzJpTW5URhcWWq
 YwC2oTNmncnQDJ+bWCOaTiZ9UzxkkGUEQ/hh2k5y8HtxFE4SfXXaHo1I9841mBNnLkX0uPX2jvQ
 zzk0r8b6OWtYZSGbTbof8LsflJXZzq5u3WOBTgE3TIU0LGBAPGmYdqBAKUtu4/Alyt5YHAZ1TZl
 xPue71c4AcR7mZCFn7DclfKsN5Mqu2GBsiQZ66phAghY52B6bvgXU+TPF8R7wsMIuEGw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172937_526227_5F2F1404 
X-CRM114-Status: UNSURE (   7.57  )
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

Enable SpacemiT SoC config in defconfig to allow the default upstream
kernel booting on Banana Pi BPI-F3 board.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Jesse Taube <jesse@rivosinc.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0d678325444fc..f9b6ef4da589f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -30,6 +30,7 @@ CONFIG_ARCH_MICROCHIP=y
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
