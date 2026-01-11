Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30122D25030
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jan 2026 06:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aORSaQtLqdeSlh5wIE3dMHs/pCWs/gmK15i4OJdM+0g=; b=2ylP2YZcYKbA5O
	gLeZk4Un1ms8AFOi4DCEK/yTINFwB2B3kydfWmrcbPFWuh9G89ufxYfdgyYevvqRvLnVNmau3IDfN
	EwZAFXTNsbsOiNw7SPDBh4RUhwQNSD+jL9FIt/2jj+N+/d6MIAf40x9bZg6Ga0rVpy0JGwbVEHSzb
	ytPv7Yj1bGU4s5GFhWBEINFmtHKjFScaDH6ckigm/ZGBlK2E8uJ6lT2HzgvcKQJbmjiQzbS/MVFYg
	kj7E/e7Fcl8/FW73gzN5n4auLCtGVITQ8QmPAq4Fpo/jprNqRpM4Wjwp/pFfFYWOROktb35wZdAik
	+OaBV1yJpEf81WaCSsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vep8i-00000003ulq-004r;
	Sun, 11 Jan 2026 06:41:28 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vep8d-00000003ulJ-2mcK
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jan 2026 06:41:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768113679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=56OMBFVuoHClJkZZhp3ixlpb+rovPKePY3VizP3ZGbQ=;
	b=PZgqvYkXinKCwk2kRUnekJ0UqA/TlWSZy6Zmjk6rkt124fjOObvxMyqxAwZFX+0c/GWc+F
	9TICcZctdlSFh+5ZwGQ2Fr86ruDEwetRPBKOvy7xx1MqK76IzUomFcDxsk4H0gd61iV/F/
	LGzexdUWei0yzekxfC06+P6tOzlAJZ0=
From: Ze Huang <huang.ze@linux.dev>
Subject: [PATCH v3 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Date: Sun, 11 Jan 2026 14:41:01 +0800
Message-Id: <20260111-k1-usb3dts-v2-v3-0-f5ebd546e904@linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP1FY2kC/3WOyw6CMBREf4XctTW3Rdviyv8wLvq41UYFbYFgC
 P9uxbXJbM4kczIzZEqRMhyqGRKNMceuLVBvKnBX016IRV8YBAqJHBW7cTZkW/s+s1EwIdBhMEq
 hMFA2z0QhTqvvdP5xotdQtP2vBGsyMdc9HrE/VLsgldNKmQZl4yT6YLmSCmsdrNlzjdZx4aWGr
 +sac9+l93p1FKvsz6sSZCT3jcWgA3FzvMd2mLaeRjgvy/IBi8H6b/YAAAA=
X-Change-ID: 20260107-k1-usb3dts-v2-220c0fa7702a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>, Aurelien Jarno <aurelien@aurel32.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768113671; l=1479;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=+KO+tJTbypwCAXRGtXUM10wZGIF4dsIDTzPaW/QdLso=;
 b=uasPhocpKwUD8x6PNrkPiB+R8GULdBE/ICIXH1cQFjlK1p0FLNvvl0JKTNrF318otD4enECsa
 KXlxQlROv9aASdgsmgvWzXG6f2qH9/kZ9q8f3NPftr5vtd5fCTi7mwN
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_224124_330403_C541C26A 
X-CRM114-Status: UNSURE (   6.78  )
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

This patch series enables the DWC3 USB 3.0 host controller on the
Spacemit K1 SoC and enables it for the Banana Pi F3 board.

For testing, the following kernel configurations should be enabled:

CONFIG_PHY_SPACEMIT_K1_USB2=y
CONFIG_PHY_SPACEMIT_K1_PCIE=y
CONFIG_USB_DWC3=y
CONFIG_USB_ONBOARD_DEV=y

This series is based on the spacemit k1/for-next branch.

Link: https://github.com/spacemit-com/linux

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
Changes in v3:
- rename vbus and hub regulator to match schematics
- reorder node reference to keep alphabet order
- drop regulator-always-on in usb hub regulator node
- drop unmanaged vbus-supply in usb host node
- Link to v2: https://lore.kernel.org/r/20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev

Changes in v2:
- rebased on spacemit k1/for-next
- Link to v1: https://lore.kernel.org/all/20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev/

---
Ze Huang (3):
      riscv: dts: spacemit: Add USB2 PHY node for K1
      riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
      riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 46 +++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 32 +++++++++++++++++
 2 files changed, 78 insertions(+)
---
base-commit: 4f67c877a9069c60dfb1767038fba5180bc12d68
change-id: 20260107-k1-usb3dts-v2-220c0fa7702a

Best regards,
-- 
Ze Huang <huang.ze@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
