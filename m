Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1471606A324
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 07:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yk9fZsoZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=so7Rhevw5DaykxuL04OS0YPcK+fXy88p41FdSI7JDE4=; b=yk9fZsoZEXAW08UwqpXC1Pbhk5
	WIpVKJ5SWfVm9piMa/99k5PqrWIdkao1mAEBJkyb0eUIY2EGvHYqLjALL/rLyJsOju7CMDbaNFniX
	5n8qNNmmsyPFAfWngVFp+NnTBHiPXK3GY+QOerYzTRUG6G+JxHyWfuuDz9YLwIX6fgxYpRgxdXuE9
	CGYRfQ/boc+R/R3ab7BLuubRJWRmI2Du9PpaPElW8qgMsZHmEntMS+zVEUOsJ3O+LBU2Gg+p+4GW5
	iAFuKJG495Izq9FNMq/pAW5rUTFNmz5K4gLet5mevsxDjW97jAXEYE7VUPcYFm/h90E3qJovRZurJ
	I6feda9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhLh-0000000B1jd-0WeN;
	Fri, 30 Oct 2026 07:48:29 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhLc-0000000B1hc-3xTx;
	Fri, 30 Oct 2026 07:48:27 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-05 (Coremail) with SMTP id zQCowABn0TusS+RqhTm6DA--.1494S2;
	Fri, 30 Oct 2026 15:47:57 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 0/3] drm/bridge: add glue driver for T-Head TH1520 DW MIPI
 DSI
Date: Fri, 30 Oct 2026 15:47:48 +0800
Message-Id: <20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDQAxA0V+RrA1kUsZWf0VcVCfWFHwwsQ8Q/
 71jXZ7FvRuYRBWDKtsgyltN5ynB5Rl0w316CGpIBiYuHF0I18F5JgwfHHVRDKbobxR8y9eS+xJ
 SuETp9fuf1s1pe7VP6dbjBPv+A7nOOaF2AAAA
X-Change-ID: 20261030-th1520-dw-mipi-dsi-580d5b2792f9
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.15.0
X-CM-TRANSID: zQCowABn0TusS+RqhTm6DA--.1494S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryfKw1fKr4rAFW7Gw4rKrg_yoW8Zr4kpa
	nrGFy3AFykJrs29F9ayF48XFW3Jan5JFWrGrW7Gw1vvan8u3WrXrZFkFZ8WFy8Jrn7ZF42
	vFWIg347WFnFv3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUUo7KUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_004825_356317_A51408C1 
X-CRM114-Status: GOOD (  11.59  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T-Head TH1520 contains a DesignWare MIPI DSI host controller paired with
an internal DesignWare PHY, as a similar design (but with a different
PHY) with the Rockchip DW MIPI DSI.

The functionality to write to the PHY is shared between these two
implementations of DW MIPI DSI, so it's extracted from the Rockchip
driver to the common code. (The same sequence could be seen in the
HiSilicon Kirin DRM driver, but that one hasn't been converted to common
DW MIPI DSI.)

Tested on a Lichee Console 4A (with a Mingjun MJ070BI30IA2 panel) with
further pending DT patches.

One question remains: I have to copy the extra lane bandwidth headroom
from the Rockchip driver, otherwise the Mingjun panel cannot keep sync
to the display signal; from my testing, changing the hardcoded
PHY_STOP_WAIT_TIME from 0x20 to 0x2 (which is written by the vendor
driver) can also make this panel to work w/o the extra headroom. I want
some advice on whether to keep the extra headroom or changing the common
code to make the PHY_STOP_WAIT_TIME parameter adjustable.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Icenowy Zheng (3):
      dt-bindings: display: bridge: document TH1520 MIPI DSI controller
      drm/bridge: dw-mipi-dsi: add PHY write function
      drm/bridge: add TH1520 DesignWare MIPI DSI host controller

 .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 102 ++++
 drivers/gpu/drm/bridge/Kconfig                     |  10 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  21 +
 drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c        | 530 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  86 ++--
 include/drm/bridge/dw_mipi_dsi.h                   |   3 +
 7 files changed, 700 insertions(+), 53 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261030-th1520-dw-mipi-dsi-580d5b2792f9

Best regards,
--  
Icenowy Zheng <zhengxingda@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
