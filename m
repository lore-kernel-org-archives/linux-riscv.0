Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC16E8FDA5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o9piVWFOzmmvQAZzMdd+JPvbvAQ9V/MB+nlQXaL0Uzo=; b=Y2bVW3Tmru1cmx
	iregtS60vH3fXWGihuCYIJj2E5dMDtNk5+tIwuXHO4hm8jGPl4p+CdIhJZ3x4GRUOt0ObZO/Bn+Nj
	DOWmj0lFz0AnkdXuP0I57CvxFkTVNz7o+kMQ+iZyfYmu05sQ5DbiRb0n9YKIKp+jyi20E3W30zyx4
	QZMJ2HRj/l72LLmQfji9zs3bhUijjyX3dTay1CQlBuUuj5+kIEaX1IAd0fuBsYC/5QYLwmX0WlqC5
	MqFYK4YYTw7gn3hpEaxSSfAEWpJeb3eaEJFCsQxekJBufVtMyk2bWI2y8klpLLUxP/+g1K3wlsK9Q
	n74JBADYOTJ3O1csTGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3Ft-000000012Ii-2wY5;
	Fri, 26 Dec 2025 08:33:01 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3Fq-000000012G6-0F9I
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 08:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766737934;
	bh=WjnZoQgubG/w/UFsn+p1ZQ0l/F3FJ/kjz4hHUkUfm/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=JaysVk8Mm82dWkf7n1f83dOVCz4zdftaHq7wsMZ6uJxRbi0RnQPpLXA5bpl/gM3qy
	 3FxMtu031luaFMl9JDEvO4ZeTqOpuFyG8wmU2PyiGS/mT6AZUMBdT4TnTZhjuvxig2
	 aotDqBVq1/ST9Pjv+GYS1neJNqU8aliIF4/AgRN8=
X-QQ-mid: zesmtpsz4t1766737926t9cb7b6e4
X-QQ-Originating-IP: dIxHJoTdAeMTTH62ybgH7z40gRrrQjFbaucAFSflfcc=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 16:32:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15364710950003848342
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v5 0/3] i2c: spacemit: improve clock handling and cleanups
Date: Fri, 26 Dec 2025 16:31:58 +0800
Message-Id: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP5HTmkC/23MQQ6CMBCF4auQWTukrSWIK+9hWOB0kIlASYsEQ
 7i7lbXL/yXv2yByEI5wzTYIvEgUP6YoThlQ14xPRnGpwShTaKVLfGkUQyg9BaTKXFyh2KqyhfS
 YAreyHtq9Tt1JnH34HPhif+t/Z7GokdnZSp2Z3KO69TK+1zxODfEgc05+gHrf9y+6t77+rwAAA
 A==
X-Change-ID: 20251017-k1-i2c-ilcr-c928d50e407f
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766737924; l=1266;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=QdK+ioxJYZOUfej9gZ6o7Vdbqq5r1P+ouqs79rCNmWw=;
 b=Z2YbsHsGXTjvGiUgFaKcZIEAaaoI3oEua0YOdPQ81oSVXRyS0IsMh1JF0Kpo3kHHxOHZLLL6E
 uEkvnDWJW1fB8MZd58RPoZ87d+JG7ZTuoTkV6SWBIX09Wz6Ye78bi2/
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OBVtUtvshiqcoOH0IeVbbJEivhw42zcHa+Pu5w/4dQj4s5Fo3yW57xxt
	ltRSItltj36/aaGl34ye5FHAPs1HbDu97V3C7l+E6H/VD+U+ob4nSleFSdhH0F7yaQcmy78
	OVvhh3vTmqUDDutmnGkHwaIekSfkI1eL6uKHeceBRI1KueZn4YFfXS3TQkJTmGQH6yGilpG
	q6okbdSw/URr3BQGcKb45/3wgAEX56nSCEv6LHZsM4CWnOUorLK+ZFp+enY7CWjFKu3PkaO
	hbFnFYfRrclWhdMoVpJiI1tsexELEGt63R7kIo5Cqo3QgX7DTx421ugb7R4qSpdcIZurRfv
	G6x6Va0O0+J3itjJPuWV/iUl2/lrl/ilioETEbVVBpsWJAMmC8mztItqCIEyNNKU/NggyeK
	XlziZGntFydEkt9byTFNbISGw4vc/Q21pvlWMhH5WxBCR91ipTwAYdSFLmx274ps+0CEGo5
	6LkBuEqfOQcCk6w9oRL02EnaZS+8T6ol2HCyt/IljCDdh113BCzXOwBLUBRyVnAV3yIubfB
	DYUnS4XpPVkpWcSO/xusDdMHBNWKjHRZQcXu0lsge1WFu+XmpM9bLhue6Rb5gf41JPFYaWM
	1s6vuWGSEJTdVDuJ7G2ejwfXdrZyVE3ehXraopdsM1ChnAvyNmcv6JUlO9tfKybhgqOX6SM
	CSothzQ/pQbFdc2KHHPFuBT5AU0xcGBfiRpaHSL5S/fApUs4bgNcU2w9VGwfyRp9YeuM/rF
	xo/zje6b06pBCx/6YrkRSXWXNTpOyckAbHlDG3lx0brqLOD54DsJswpwlYTrMnX9q6XOXun
	ACQo5dFM5CU8sJ7Po6McOWBObMPe33OQ3TO/LW6tAw77meK+ChvyoUGqH2uSmq/XfcQEJ6F
	AMAdZLDBk5krdsuaRcLqzHrSRsr0cxAOQug9MITRFuw+2pZlagrBVdWN9e/4exai8x641M3
	3/GF0xiZDUyfoxeQnwEcrb+HbCFX4/taqTrY8B0Bm1uM1qW9pkcR8FsnrL8xQqT6Lmlpvz+
	Hv30jmClAzlgtlBLk13SM7NwkejgvARGNg9sCS4R7W1f2wKGvb8R01VWrzEjkIH8MskWWWz
	pRnaB4Z1gYbGm1AjS0tDxcTcxSOrC44uWO6e+aIVzaij1bLpn+133KPsKy1Nz+SaD+dTs2h
	Bx7Uh06H2Q9yibItmGma3T3u/g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_003259_319823_F3ED2016 
X-CRM114-Status: UNSURE (   6.45  )
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

This patch series contains a set of small improvements and cleanups for
the SpacemiT I2C controller driver.

The main change in this series is to improve SCL frequency accuracy by
configuring the ILCR register based on the requested clock rate, rather
than relying on the hardware reset defaults.

The ILCR is exposed as a managed clock via the Common Clock Framework,
allowing the driver to program appropriate divider values for standard
and fast modes.

In addition, the series removes a spurious warning when the optional
clock-frequency DT property is absent, and performs minor whitespace
cleanup in the driver source.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (3):
      i2c: spacemit: drop useless spaces
      i2c: spacemit: configure ILCR for accurate SCL frequency
      i2c: spacemit: drop warning when clock-frequency property is absent

 drivers/i2c/busses/Kconfig  |   2 +-
 drivers/i2c/busses/i2c-k1.c | 162 +++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 146 insertions(+), 18 deletions(-)
---
base-commit: 138e17a35265a036c4cbf7d4a6afcaf69e5d8b2e
change-id: 20251017-k1-i2c-ilcr-c928d50e407f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
