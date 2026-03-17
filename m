Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3044CFD8741
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 11:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2mvtfVhRa6gaq5lP6uprPmDsDzTmEjC9OAjeNFGsggc=; b=Uqzs4FZHmPuqC8
	Uk1saH0cwS/8dLXYaoA1c8wJwXkNaOrKxWlIFx4ye+vtWHaaCXfCEDDINZt4zBaqAhLAJ7xY9H9Eg
	It7bfaNpLhBVWp60uDTAT21HlMzeXlP5nX9bDpEeLPL+tjfJZ1/KbyLQ1+bhSW/0tL4GtCk0LGLP+
	Az55Y9t4DsNbal+sMVnyqM4N6wAwsB4lVxVFFcfnIw68ducXbzGraPsmMqJUXtLqdb+cbJHTzvqYj
	ujt+tyGD7KKxuxX66GhnwAIjQ1rEcwSzkUqyOR4IP2LEfPNNSQeVsa1uji2RvsDNtjU72+pDfYo7H
	NVko3C89XnnA76opgDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SzX-00000006Ee4-1RtQ;
	Tue, 17 Mar 2026 11:53:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SzU-00000006EdV-1xrc
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 11:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF92241AA0;
	Tue, 17 Mar 2026 11:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70ABC19425;
	Tue, 17 Mar 2026 11:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748419;
	bh=+wB0nGlH3b98xGNxnLGieC5pTIclHz8kRT9qETUs/0c=;
	h=From:Subject:Date:To:Cc:From;
	b=Jq1vwglxOtlUBYjWwJ5bIKm8Q/z0TEN383Polxq5j8jMCK7IAuZ60OOppr7pv1KlH
	 AIWALVG5OVxid3z5P01Ca01vSQjYhNhkCFbrAYA/wdvz83x+pAqxqMG66bm9yacJRb
	 GEeR22OVcAD1je0lFoOjeTRNBNvgZ61oHkb1EPkVDOyuPGdShxx7RgwO/IcvAa3Abf
	 BTPeiDuUl3IQuOM7rz16bY97caG39wKohNb84dLD+V6TsLV3n50nYDFFYwEFJWqH2t
	 y/8cbmC/spPavVMEFw6NN/NJsF70FDz8nqlppRtRZcgTZrm40O6S3dGocGrQm+CtTJ
	 9iSupeQJU21Yg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/3] usb: spacemit: k3: Add USB2.0 support
Date: Tue, 17 Mar 2026 11:53:01 +0000
Message-Id: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ1AuWkC/x3MSwqAMAwA0atI1gbaFMV6FXHhJ2oQtDQqgnh3i
 8u3mHlAOQor1NkDkS9R2bcEm2cwLN02M8qYDGSoNM4SGsLV4ak9GdQzhD0e6DtbeVcWBfsRUhk
 iT3L/16Z93w/szAejZQAAAA==
X-Change-ID: 20260312-02-k3-usb20-support-9a1893655e9d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617; i=dlan@kernel.org;
 h=from:subject:message-id; bh=+wB0nGlH3b98xGNxnLGieC5pTIclHz8kRT9qETUs/0c=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuUCwZW2UlGpYgBrQH8C3+68w1GroLUHKcSLj0
 XZAoRkZb+6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCablAsBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0hCBAAhKhdNqfFymkohpiwXtIs11IO3/6AVb0PeoU/nYJlSqpJtBgGDwbvP
 ZV9XFtXt/iX7fl2g1ESc3XzfHW6lQSUzT4chacU6q2xHRGoIVhI+tGQyemcVJbR7tw98lfoaJZt
 z/uUZVbl+Gi/XmpnURT8L7Q/a/7HUGHQBVjXvdNM+SO1qe0H2x83khTyrBMVUymNzSFl04+59sr
 NyDLbc57RYeXZAMRStpOJkr6zY9rcjY2it8b4rkiXO8CefBRRxZRqgLpQnML/5gOTp0qoCaFHai
 CR1zO6htjU92YKEGF/LRfrJov2mIp+jOoYbNIAQDtnZ9JLwGviEL+DKJXsVHXXX5ASDwfjczAwu
 6ee093nJuPgrOljmKbap+tzhLQFXdBsVLnLGg5twm0x9JQLTBmaJCtk0RmaTecMa2uLM1fQHWF7
 437V1erwPXCLWiyyiqOpqv5ZGgcgO0iPqHEJvRPlb6JRLUhvlye8S8TFC9pDpr7FRQ1PMHPS8+G
 XQRXiOEK4h9Vfo++PgEqfb/N9WdVpK3hJlRUB8an9ztQ+tjDjbpLIp0iChuttONVevLJoBokGDw
 QMohqT/jJMago9zTuN3PzFlP9cmnoNBjg69bj04W0xl4CSwa5tPeFA/HSW7D8H9dEnhsc92NAva
 cyDeEGCltMt5Lhv+aj3OM3SYUsd1Zs=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_045340_551953_11FA923F 
X-CRM114-Status: UNSURE (   8.34  )
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

There is one USB2.0 host in K3 SoC which actually use DWC3 IP but only 
provide USB2.0 functionality, and with only one USB2.0 PHY connected.

This series try to add USB2.0 support for SpacemiT K3 SoC, and also
enable it on Pico-ITX board. There is a run-time dependency on USB phy[1],
Hub[2] and reset[3] patches, but each series should be quite independent,
so I intend to not add prerequisite id for the dependency here.

For people who interested, I've collected all patches and put a complete
branch here[4].

Link: https://lore.kernel.org/r/20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org [1]
Link: https://lore.kernel.org/r/20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org [2]
Link: https://lore.kernel.org/r/20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org [3]
Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [4]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (3):
      dt-bindings: usb: dwc3: spacemit: add support for K3 SoC
      usb: dwc3: dwc3-generic-plat: spacemit: add support for K3 SoC
      riscv: dts: spacemit: k3: Add USB2.0 support

 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  |  6 ++++-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 24 +++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 31 ++++++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c               |  1 +
 4 files changed, 61 insertions(+), 1 deletion(-)
---
base-commit: c4c6e209dcf903ada6ddb4a0baca01ce8459a379
change-id: 20260312-02-k3-usb20-support-9a1893655e9d

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
