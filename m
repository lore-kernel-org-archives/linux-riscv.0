Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AF0C87FD2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OIlpsU7v4ZAKTxUsqikHR1vNVcNyUac5e3UHcLPJtBs=; b=uQyamp/bZS3EDC
	l/q+rICl8IiH3BLa2ydZ/7msIxUOobos/PemL9uR9jnjaKrtZzOV+BeKZrpVXQOVxnno5upzl0qPz
	6VrvI3qV4eDKW9iTpGvHT7Jw1fRiKZhQs6Vh9xfKGn/HxgVam7K8rKzFtiqcXcHRxpFiy5nHh/BnO
	o44KmVx9lc3MpzszqnFM6Ek+AVD4b8xEOVwglgPHZX7TxkMRNJSlbHSzz9XKcwNwF9WNWsWIt68vk
	jHMQqw1HtEL3PLnMXnDqaydND0irSBC6tAkJUvHdry1l/vbnmMM1BdKZ8X88+UXYQo6nJ0saXffXW
	Q1QMNYfB1ZuGtmXIlw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSpE-00000007rvh-0xBU;
	Mon, 11 Aug 2025 13:44:32 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSnE-00000007rcB-0qJE
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 13:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754919647;
	bh=O7QkqLL1Uz4POVfUWaVHKWCebfO78hHJLlMwMJBxzhk=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=Ff8rQGlbObtPPe/hr1o/8f7L6Er69c5p7o/pzhJX1Xb+M3DxnRgdVLGBEbsmaZ4MH
	 Z1bGgLdUkvGePswTCAZmI57h2ZsL1mADpN5Bmvzt3azmJ/xpby0kPyu5ibyw8pYOmg
	 m2+JTt/akjuemCd2GmdsToZxUO2KT++LksRZOPX8=
X-QQ-mid: zesmtpip4t1754919639tad3cd76e
X-QQ-Originating-IP: PmLamziIaIPd032DoPHS1nGO3BKfQSqngcGX7f3+6rk=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Aug 2025 21:40:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18346526074261091734
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v5 0/2] clk: spacemit: fix sspax_clk
Date: Mon, 11 Aug 2025 21:40:32 +0800
Message-Id: <20250811-k1-clk-i2s-v5-0-ebadd06e1e91@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANDymWgC/23PTQ6CMBAF4KuQrilpB2vBlfcwLqCdyoTfUCUaw
 90tRBONLN8k73uZJ/M4Enp2iJ5sxIk89V0IKo6YqYrugpxsyAwEKKGl5rXkpqk5gee4Aw1Ouly
 qkoXCMKKj+4qdziFX5K/9+FjtCZbrmwH4ZibggoPL0DpMbVHujg11t3vih8JgS9fE9C1bvCn9N
 rIfIw2Gslrp3AkA0FtG/HkjlX9dcHulrC2F2bvN/XmeXyuL4D4tAQAA
X-Change-ID: 20250717-k1-clk-i2s-e4272f1f915b
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754919637; l=2110;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=ZUrL1GUtAJCNKt2pUUAfCSXGuuvKhhmY6ZNaHjLFvb8=;
 b=ZhX2jPCvEG84+TItAjUbaat0PpdHLIomj/YTf1ls4//wep425ReggVi+xVcUYktiqWQ5FYuE7
 xd/upGgv2hiDr6c5qsx+zZPwUReCwkZUdfj9R0bYg5jZTE86xd8Vs+r
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Mm8wiweyIX9LV3Bf2qXVvd82YLT5C0Cy7wm59GaEYcy4SjDAsl1v0yk3
	ihU9WIn79bSuX/efyVRPAww7GqjKIq7epSCcQiD1fjRu5pl2v1paPJCL8ymVdYEDkFSLAcc
	WGy4Ye2JfH5rS8XP1x+ic2H5NKsgfQXKBjpaAORNqwIVe5edy1iwlLhXHU1o6MGDK/qnFEN
	gT/5cuB9wP1rXjSuyuhFZeHM7kmIEDNJlPs9BnDO4ibU9K9tPa3Nob4Y7fkiD8xHfaien19
	1G0REdeCDTQ7Z1MEyBRzlGKhj5zKK0Q7WxtG8VPrsFfpR1rJqAmMp2ymCJoiTY2ZkMKh6dW
	MUJmTh/PN61UDj209drdyVUbArAtfCj35IGBGei/ZYvx1m8pkRCNVfV8tMyMn9cgmltxdhU
	IykyN9fv7BYA9opgSqi+NmEsZlvB7E4agVfVyzN7ieoh04R6bBiPNpCL3VFf8KYnHhCLvCq
	SnV8FaoliDvJDeORc96aQaX3R/60f2pqjOrI+1d1EDrZj5wSWTLsqk0qICaUAkMJk0/axbM
	r8zr9QRGStlARai7ZerIE+MgeqMatQ7M4D8bZYEdOYvUS0IoR8qWcscpDZEFo2ZLVhRaqD9
	K2XCsg1xXNamXbLB1+VA6WkkhXE48POXkSV8s4YRFUI3F5OwIj8hZGtFHcd102/8cjT2LiK
	38ydklrv0ZQzlU1H24XBZoRXII1OeqDg45sYXa22DkrTy8iZTmLsVt2Zfw0j8cm/HQjPrWz
	XCmCY6/hIGfo9rmj2XQyisSF4pscYH6pwFhWJiIYiMVhj2lw9eHud8DTGJYf0BlGGqr2hVU
	aB2o5ylV57l6bKe40ls8guK1AMvPP56wYfV9PptXbVnfpue3cfX36i2Nm1mU19uHLomHnEN
	hR/+B/ir5mwxH8GwXNsfj2Qx1u9muE6TVzaJgB001XXS3WgDme7DCNg77WwiZD2x+34qkCa
	z+YIAUSlC4jHeEEUDgEkZ3BKW15G7RW5tbJvY5kjpRNPybOhlphhlheAdu1nojAGNCf8SyX
	0Vp4sCKR+XDBFD7TWvB88pHvUgxn2YkflWmG0KMcxQgdC3JA3gCfnrVfduheU7xXxzN8iUP
	Zc7rl9xxMYEfV92FevHhoW9LvfbY5cCK0qT5o3ql/GntLtOARxSihCVloybyAdRwQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_064228_690953_BC1B126E 
X-CRM114-Status: UNSURE (   8.77  )
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

In the SpacemiT public document, when the FNCLKSEL field of
the APBC_SSPAX_CLK_RST register is 7 (3'b111),
which is a reserved value. And BIT3 of the same register is
a reserved bit.

But the documentation is incorrect. In reality, the value 7 (3'b111)
of FNCLKSEL is not reserved. Instead, it indicates that i2s_bclk is
selected as the parent clock. Similarly, bit 3 is not reserved either.
When FNCLKSEL is set to 7, bit 3 determines whether i2s_bclk is actually
enabled as the parent clock.

In all other cases (i.e., when FNCLKSEL is not 7), bit 3 has no effect.

Importantly, whenever FNCLKSEL is set to 7, bit 3 must also be set to 1,
otherwise the selection of i2s_bclk becomes invalid.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
btw, the public documentation for the k1 clock has been updated.
---
Changes in v5:
  - move fixes tag from cover-letter to patch1/2 and patch2/2
  - modify commit messages
  - Link to v3: https://lore.kernel.org/r/20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com

Changes in v4:
  - add comments
  - add tags
  - Link to v3: https://lore.kernel.org/r/20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com

Changes in v3:
  - Fixing ABI-breaking behavior
  - Modify commit msgs
  - Link to v2: https://lore.kernel.org/r/20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com

Changes in v2:
  - Use virtual gate instead of new function for sspa
  - Add Suggested-by tag: Yao Zi
  - Add Fixes tag
  - Link to v1: https://lore.kernel.org/all/20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com/

---
Troy Mitchell (2):
      dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
      clk: spacemit: fix sspax_clk

 drivers/clk/spacemit/ccu-k1.c                  | 29 ++++++++++++++++++++++----
 include/dt-bindings/clock/spacemit,k1-syscon.h |  2 ++
 2 files changed, 27 insertions(+), 4 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250717-k1-clk-i2s-e4272f1f915b

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
