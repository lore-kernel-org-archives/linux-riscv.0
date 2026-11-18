Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D86606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=atl1flSF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NT7Fwi35
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Cc:References:Date:From:To:
	In-Reply-To:Mime-Version:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2qZoWeyMr2Q+R+Qr6nWuJy6+HH974UFiwIShKS2X1PI=; b=atl1flSFtxxmv5UcKYGybUcLh2
	8aD2JVe/k8VTwoxlkw6YQSIyzCOcBBYmSkNZRZxdDdfGoIQoEhiLse9zI5W4Pc3ZVXQ3SJj+KfsdY
	DNCiX91BVqpWWkXqrpBK1s3t3vxuWGPcwUbmfEAHeZAg7TznMKZ8tW/sbOoP33NTWRsqg+3glC6ya
	N7m8Rft+wYMT1XHXgP4SnBsMR/yI4QLC4YQZhSydt/DrbNW1u8F2zk2SuWBmVwYyTbOKa2XC0HCJo
	gxNZrRHT77P3k2d3HRFyP5UYITkn/mHlH3+GCsw9nl39MCrNoIBRFVTV8YKLuYW4JfCA0Ix7hSeDj
	wA/VSPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUq-00000008Fsa-1aJe;
	Wed, 18 Nov 2026 08:58:28 +0000
Received: from va-2-16.ptr.blmpb.com ([209.127.231.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUo-00000008FfO-23r9
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992302;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kEr9Wg+aGMoays9Uh761p22Cq/vcC6/mglbKhWQGwFU=;
 b=NT7Fwi35WYG8eyjqbJshaEWz596512Btcq5FAovqfyWG4z9R3fBynpDhhAUJVSYkJSFWYq
 tQfxvAG1xUe0H1C5pq1f7J1TlzavnFd19gXQZZrdzx9CHyH1WjAG2CmlFfyUmlb+xiAIyP
 hPBj+7fSEoa0scvO1ZWCj/lnTqI4CJGEilYo9zxiL/EvWmhb/Z54+Ae67io5GkQpBCzY9f
 l+1WV5zGH6Cc0TxxPeqcY2y2xNpDUMxkuQVZWc0wJH0ztU+ruWrPb+MEqN3iLQSZEDGt4a
 8eEjgu80RzNAwWigtK+Kh4CeJDIZv7Gt5q1m4dPgX0UEERrhV9Smu9qQaWfzhA==
Subject: [PATCH 9/9] riscv: defconfig: Enable the FML13V05 EC keyboard modules
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:19 +0800
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Date: Wed, 18 Nov 2026 16:57:42 +0800
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd68ac+8a9c3f+lists.infradead.org+yang.wang@deepcomputing.io>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Message-Id: <20261118085742.1817536-10-yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005826_607105_6B6243C5 
X-CRM114-Status: UNSURE (   5.38  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable the eSPI controller and Chrome platform configuration menu. Build
the EC core, memory transport and keyboard driver as modules so OF
modaliases can load them on boards that describe this hardware.

Keep all configuration choices in this final standalone patch.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 arch/riscv/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 383fdd07a..1ddb8cd5f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -145,7 +145,9 @@ CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
+CONFIG_SPACEMIT_ESPI_BUS=y
 CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_CROS_EC=m
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
@@ -277,6 +279,9 @@ CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=m
+CONFIG_CROS_EC_SPACEMIT_K3=m
 CONFIG_LIBNVDIMM=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
