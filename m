Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B341CCFA04
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 09:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vfBcSHjWIYDUhuP19vQu6qxVhCQSl/5ce4p6M/Z5VIM=; b=ltDQ7cu+ez1f++
	jz7owPDKKmPlo1U40bvuhYvO80GdQboNkaM2hreJjG9iBgpTnTXnYyH353uJ1iWBoekW7BdTF+msH
	Mc+x1sYKPBstKV6zb+3F0lskQUdv7X1DoaU43hrDbIgPISRR0+kANAamBHUpZu2K8N+Mcna4+zwIe
	U1znCtd55KuXHfoPeKSaiIxX1LZmdn1i3yVq88ZYfDWr+jZ1dEvW+Xthrru2VoczUQ/RvCmt1tYqz
	jEe0ieQUX4z9NL7dVVfKc5eY+3gSVZZxky49JvKhYaUgSGJSZLKxbtdukPCOoXc4zo5H1pUFrXyEZ
	F+5lR42xCn2Tj0LiOevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF7Wi-00000007DCV-2ctz;
	Sat, 01 Nov 2025 09:04:00 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF7Wf-00000007DBp-1BB7
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 09:03:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761987822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9g4umT06lYMRrIWBhnN/oX2rBXZTFT6Aq7ZWIZM3zcc=;
	b=VOCQm3gZpSHROT2ogm8w86JEYICDHuulZ/v8UhYPtaF++QGfa2DSyFc37YeRojlZ4iqgaT
	UP8HiPHge1xstoNWZkRwmXL9YNo9uoM8iGe6EtVLy/0/A+IzMgxu4lMHyMPTwgg2O8/RED
	WKyohW/8Qa61+H2I6aCjfXWX0nH9Hj0=
From: Ze Huang <huang.ze@linux.dev>
Subject: [PATCH 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Date: Sat, 01 Nov 2025 17:03:24 +0800
Message-Id: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANzMBWkC/yWNwQ6CMBAFf6XZsyUtVQrEGP/DcChlq40C2i3Eh
 PDvVjjOS97MAoTBI0HNFgg4e/LjkEAeGNiHGe7IfZcYcpGfpFCCPyWfqFVdJO5KzF2rKlfqCtL
 hHdD57ya7NTsH/EzJGfcRWkPI7dj3PtZsLjJZ8mDl/9sjkdlqNTvvMallJfRRZEoUuhRccnx1G
 K7Bk6VoQpZEF2jW9QcQGBA1xQAAAA==
X-Change-ID: 20251030-k1-usb3dts-f8e2fb39f879
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761987811; l=1820;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=BNDOpTBqIHfhN5s3DzIpQb6oNVZm3V416PNj1AzPqUQ=;
 b=1byT/ixmKTzrTCZvS/cB4k0sP1v8oeqKfXPzsLpQlo6hJLNh8axUbETazb6yxaD+mnu+bJAvi
 Q6qCzqKoMAaCg76bUIEgvtCNq0mqC/j7jSlk4wdYilujHQH2FlkgVO2
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_020358_004724_7C67C454 
X-CRM114-Status: UNSURE (   5.47  )
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
Spacemit K1 SoC, and enables it for the Banana Pi F3 board.

To make USB 3.0 work on the K1, we need patches for the USB2 PHY [1],
ComboPHY [2], and DWC3 [3] driver, also, ensure enabling the following
configurations:

CONFIG_PHY_SPACEMIT_K1_USB2=y
CONFIG_PHY_SPACEMIT_K1_PCIE=y
CONFIG_USB_DWC3=y
CONFIG_USB_ONBOARD_DEV=y

The series is based on v6.18-rc1.

Link: https://lore.kernel.org/all/20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev/ [1]
Link: https://lore.kernel.org/all/20251017190740.306780-1-elder@riscstar.com/ [2]
Link: https://github.com/torvalds/linux/commit/e0b6dc00c701 [3]

Thanks,
Ze Huang

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
Ze Huang (3):
      riscv: dts: spacemit: Add USB2 PHY node for K1
      riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
      riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 47 +++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 32 +++++++++++++++++
 2 files changed, 79 insertions(+)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251030-k1-usb3dts-f8e2fb39f879
prerequisite-message-id: <20251017190740.306780-1-elder@riscstar.com>
prerequisite-patch-id: e6c36ae11fd6bb6238b3f256221856869db6958c
prerequisite-patch-id: b7bf3a95a8baaea88d776db7d9e46ced879187a1
prerequisite-patch-id: 893145648925a17c16a5de55bd6952f18e8b7d8e
prerequisite-patch-id: cd96cd9ae2fb4a1f73d34046952dad346823f80d
prerequisite-patch-id: 0baa531df5c47ffe9354ac3885e89bda9ae9b282
prerequisite-patch-id: 3beea086bdfd0ce6ffd011a8906319b1ba253c9c
prerequisite-patch-id: 755e4f791e363ab2f0ac0a4459d0cfd289123800

Best regards,
-- 
Ze Huang <huang.ze@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
