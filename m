Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFFEFC6182
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0B4qfXNxeLAWcsB6VSVVtYHS5ilGt2nH0gfxUgd1Z1c=; b=T8d0Clz9h64gsI
	1mQBA4PgHuarczx5y2RcGNfca8doxuQ4OgMU/jRlTzoAzBEk+JlG1VlUFnt1mnc5om5JISrOLTaO1
	loBRBZOqUIiY/pmN5ixJEtHNrooUlDzEq6bdBs1MQ+GMqWJjmTyvPxfgHbSLNchAgygMOVwL13sog
	K5cSKi8ivyG8abC/EXVUWSM7Q2zgiMZuW17k3i8/iTv7NxUTviQrs4n6ipcRsgkphGsqgLlAzFYpT
	PdLkUvX04pUHpczLAH4e+H7IrFfIZEGrE7UbMA9EfMBxP1qs3Q+OMbuFhC/RiXAO/EamHb1PxLCLQ
	P42g5YekQ39lvf18hImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc9G6-00000009qga-25pE;
	Sat, 03 Jan 2026 21:34:02 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc9G3-00000009qgF-2IHL
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 21:34:00 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0046A340B46;
	Sat, 03 Jan 2026 21:33:53 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/2] riscv: spacemit: add gpio support for K3 SoC
Date: Sun, 04 Jan 2026 05:33:37 +0800
Message-Id: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADGLWWkC/23MywqDMBCF4VeRWXdKnJJouup7FBdexjgUEkkkt
 Ijv3tR1l/+B8+2QOAonuFc7RM6SJPgSdKlgXHrvGGUqDaRI10QWFeHrhm6VgK0dDFs9TrPRUA5
 r5FneJ/bsSi+SthA/p53r3/qXyTUqJGO5MU2r+2F4OPZbCNcQHXTHcXwBjargr6UAAAA=
X-Change-ID: 20251229-02-k3-gpio-89b6e95cdf65
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=LNEHI1LK47UuDs1IClEHqp6dec6h83YhXQvnLUxZhl0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWYs3YkiFPcy8YvUqnl5KvLFpO4Qhw4QBwSTkD
 h37dS1kqayJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVmLNxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0LlA/+P6XX6vAWVcLXgO+/CYveGkd4/PNNN4e42snZvg333GHAmWfrxwf36
 CaKPXUXa0E2T83Yij+14iXXT4odx7ZYuifXeQNfDet1V1T/MA4JkpP3pGS9ijrHrLlISpxOKwhY
 7FYnrY9ZI+Zep+AGmfw+1FG4uPqYMQ9QdkmIdH0Vhk5sat8YiaOgtu2QaEAmkiNZE2QBGDajsox
 66zPJOT0rCl8Q+tZEVsfnCu4TNyVqMsUn/ZG4TVmsrLEIWqCGqjQ0IbUrLyY3irmOzktn1tD09h
 oGR8xJalMxQWpv4AD01ECbdrQJPsnViSjU9/s3hsikyXDwg0nlEqTMUgetRnzotviEWFt9hqFEi
 c1lTXkl+rM3eHOkyc3FEKrps9v/9qL+t0lOZwkVIh8Hd6o2FJ4GHCCCdZtIaHSqOBdRfWvWPUzW
 ay73BssyUB8FLigBD9zxn9hVpeA6+mR7ep/PbxfZThd6grc7mxUtuvieu5WFFNBdOIuTg0MZsBI
 p9bzmy+3bKc2kVTGZkvEoTs9NQ0SKQ3LVzqCScu6EiECaSPlJPPZi+el60ctkfy8mY910NxMxJZ
 82Z0b7RFdggFZoP86VBlsW2QTiDkEHcvo5K51VUFIAk91iVRWUm2ht/nAsZafSovVn5LWIhJ6Tz
 aze1CT8PkqEkq007tHRDLVyT9MjqXs=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_133359_623532_253763E1 
X-CRM114-Status: UNSURE (   6.42  )
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

Introduce gpio support for SpacemiT K3 SoC, the gpio controller
changes its register layout and bank offset, while mostly shares
other IP logic, so adjust the driver to support this.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- collect tags
- refactor gpio register read/write, introduce helper function
- Link to v1: https://lore.kernel.org/r/20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org

---
Yixun Lan (2):
      dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      gpio: spacemit: Add GPIO support for K3 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |   4 +-
 drivers/gpio/gpio-spacemit-k1.c                    | 163 +++++++++++++++------
 2 files changed, 120 insertions(+), 47 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-02-k3-gpio-89b6e95cdf65

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
