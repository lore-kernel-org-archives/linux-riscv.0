Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB1EC369A1
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o4fqnfXMDo4VJ8Ugn/5KR8W96VXdF+3M9FSsnibQXI4=; b=pzbrLiR/4wd4t0
	3C2HrrKqw3g5DRDc9XAzhin3RV0SRnQf5eXfrT4tDovWkUgP4oAc2y4gEcRJfLWOdlePwTLxaFH7l
	7k5S29GN2OR51zdDhb2BWYEgFI/N0tddD82y8752xBKoqLFuPHwsapHaDmsr3OFfzeTMpJR+JweGo
	FAV1N1yaqCSvmbg8iVCvUeaf8FZ8pPsv7Gh1wFpK/ogE6TdUDCm3aehi1cThZrvu6FLiG1nNOyMZm
	lhf9YQVWNtHAXOio5PFM6jjKqwAl6EQHNZ0l4Xy4p953ma+MEjQQ9FTmI9fq5n4P1O7VQtnZhr/H5
	h6bWXDe1d8lXrtg24fDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Up4-0000000FYXA-23aS;
	Sat, 12 Apr 2025 06:58:38 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Up1-0000000FYWl-3lUS
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 06:58:37 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 83F6134375E;
	Sat, 12 Apr 2025 06:58:30 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] pinctrl: spacemit: add clock/reset support
Date: Sat, 12 Apr 2025 14:58:09 +0800
Message-Id: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAEP+mcC/yXMywrCMBCF4VcpszaQjGlI+irSRS5THXrTpIpQ+
 u4Gu/wPnG+HQpmpQNfskOnDhdelhro0EB9+uZPgVBtQYiu1QiFRjEo8eYlbnkScRuGMdsn4hBg
 11N8z08Dfv3nrz870eld6O0cIvpCI6zzz1jXSDziYQCpotOpq22CUjcFW0WlDiZK0zkcL/XH8A
 Epo7/KvAAAA
X-Change-ID: 20250412-02-k1-pinctrl-clk-9649d6ad22c4
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=QsbjXf9g0KHcl2pW2oeDCXs+ggm19RHnbgB0Jzpj7qA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+g8MCzI4xaMkCaGqmhNnl4gmZ0/osJbfjon2/
 pBZDSlZ5WWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/oPDF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aXPD/9svBo5ReNzesn1DC
 jmQYaxMpduobLF5moqyjeGAjXr5wuJ9sEgBCb7yN9IDYtHiXzne03GirwGAAApzyrURJZ7LlA9a
 RkqVPMZwGfnj1gxO7IBbj3rGvOWYB8p8D0j/3X8ZePDLXap1svdcvNFZWSHcsafFC6MBz6lrzBc
 IFJHhD0O/sNUKuIt8FYeZ8WTq+aDjCoKFCMmCxiU0wnn7Tpw7hOEwgwtDbf+tQVAFJ1ZzMx4OF0
 Uxg2vAHEJK8M3TM+iP7l8ATnOetfybw3myF+hbMHAKX47SB21wr3ADkkHg5DSvX6FDSkFr4+JzJ
 Slpi8nFXlbO6aEXe2D1lnijNdrqb95xlPECCJN0k1pmRSet0/Z2ZDCVWtIg6Bg/i312ftf0lu3Z
 +Zv/Gvx7T7x4EcaBm5MBANopZ5k1LxXABSpBoYOweSoCYjjZDDUam4Ee+sbAkeOTws4V65IMPh9
 7G0eTwMnj61QhvrujUrvfVEYCFKZGnEHPxvTiwgKA0E9gzqCj6viSrwsZiXZv7gpJS//sLWFrth
 xptM+xhkRlcz/HXf1dyi6iO+Nbf2f23jmZeeMXwFw5c7hfZtGGxJWnbbl0hDkAkVinu9mCbPmuD
 cyVIlucKZ608TnWYtqwIWixliFsWOzG4uw8r7XIGa5txNFK1LHs6X8R+6QAyIwGubeFQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_235835_968275_B0B39F8D 
X-CRM114-Status: UNSURE (   5.48  )
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

SpacemiT K1 pinctrl requires two clocks in order to be functional,
also one reset line from hardware persepective.

In this series, adding clock property in dt-binding, and activate
them in the driver. But for reset, making it optional for now.

Notice that, devm_clk_get_optional_enabled() API has be choosed,
which will make old dtb blob still functioinal with new kernel.

For DT part patch, I plan to submit after clock driver merged.
This may result dtb warnings in this version due to the mising
clock property in pinctrl dt node.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      dt-bindings: pinctrl: spacemit: add clock and reset property
      pinctrl: spacemit: add clock support for K1 SoC

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.c                  | 10 ++++++++++
 2 files changed, 28 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250412-02-k1-pinctrl-clk-9649d6ad22c4

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
