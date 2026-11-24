Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9D7606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G3DjpiTP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eLbmMmotB5QsrgrQiyk2lg0CEmaDF5g5dVNtI1fsJ6s=; b=G3DjpiTPA5nQd1gz4uI9z9voyk
	X++AtC/ZBWJo51rcCjTwJD9Dl6C8yDAPJdYKh0mMxL+qfsHjaG3wn7CQhxG+MjaHzmpf8iDdIoCgr
	cJSkJudzGxbtHHKLca7hsaWw0S2p5/qZWT8uskTu1LeiUbV/e5iVgMlCvnPtcCJByAGbSPxOXvpPb
	zGbsMSUQj77fA5/DrRJ2qYfrqKNIaVrmqQ0UAUSwF6oTpeNpnYpkq2+NR2z4UlKrPfRwEjoNOO0/q
	o9SurCRd/cdhhNoievpMAS4qYnU/5kqdQIuHMb7gQEXYXoKznVj3kQDRnUuXXN9EpPTMkqAHiXgVB
	YG1jvx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlOL-00000005p0U-02xq;
	Tue, 24 Nov 2026 07:56:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlOB-00000005oxm-3d83;
	Tue, 24 Nov 2026 07:56:40 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowABHbfcVQwVrAUaUAQ--.8758S2;
	Tue, 24 Nov 2026 15:56:06 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 0/2] drm/bridge: add glue driver for T-Head TH1520 DW
 MIPI DSI
Date: Tue, 24 Nov 2026 15:56:01 +0800
Message-Id: <20261124-th1520-dw-mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NywrCMBQFf0WyNiWPxiau/A9xkeZhr2BbkhqV0
 n83qQsRxOXAOTMzii6Ai2i/mVFwCSIMfQa+3SDT6f7sMNjMiBG2o4QTPHVUMILtHV9hBGwjYCG
 JFS1rFPMK5eMYnIfHKj2e3hxv7cWZqZjKooM4DeG5VhMtu7+BRDHBjeCe195yUvsDRKNjpU1le
 lQSiX0klKqfEpYlSrfCK0mkl823ZFmWF34qUGENAQAA
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
X-CM-TRANSID: qwCowABHbfcVQwVrAUaUAQ--.8758S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryfKw1fKr4rAFW7Gw4rKrg_yoW8trWrpa
	17Gry3JFyDJrZ29F9ayr18XFWfG3Z5JF98KFW5Kw1vvan8u3W8Xr9FkFs5WF1UXrn3uF42
	vF4jg348WrsFvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjTRM6wCDUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_235636_526872_1440E013 
X-CRM114-Status: GOOD (  11.19  )
X-Spam-Score: -4.2 (----)
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
Changes in v3:
- Fixed a remaining `syscon` in the DT binding.
- Link to v2: https://patch.msgid.link/20261119-th1520-dw-mipi-dsi-v2-0-9ab5f9808f87@iscas.ac.cn

Changes in v2:
- Changed `syscon` to `thead,vo-syscon` in the DT binding.
- Dropped the patch moving common PHY write routine to dw-mipi-dsi
  common code.
- Fixed a few problems pointed out by Sashiko in v1.
- Link to v1: https://patch.msgid.link/20261030-th1520-dw-mipi-dsi-v1-0-753f34fd304f@iscas.ac.cn

---
Icenowy Zheng (2):
      dt-bindings: display: bridge: document TH1520 MIPI DSI controller
      drm/bridge: add TH1520 DesignWare MIPI DSI host controller

 .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 103 ++++
 drivers/gpu/drm/bridge/Kconfig                     |  12 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c        | 570 +++++++++++++++++++++
 4 files changed, 686 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261030-th1520-dw-mipi-dsi-580d5b2792f9

Best regards,
--  
Icenowy Zheng <zhengxingda@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
