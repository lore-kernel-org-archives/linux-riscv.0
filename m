Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8CACFD317
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chsz/FtwPupzwS+9fP1wsKMjOMxgEvqHSUp0zQh7eSQ=; b=z04rA+vskjKb5G
	FWMQmP9O1YD20olki/ey/JF9gv7FDOTM1Tp/Sqk7mDokkQyfIrZQdQ7zyrOiVHVOlh/01/9c4Orzz
	tk0GD05YlMNwmT/EjBVkBI7IGoePRUB29uha1GVVfd0h0vN874coJH+KQ0NzcnLa+L6N1syO58N+n
	ILuE5dOjX/slEiLsm49NIH0Y525tnr6zjniBsn/Ugak96lG6VZBny7al/dZK9bfPUtVt1QWZp9JVG
	snvOroRNQDvSfP2WBGiKw7hawcBuL80qUE/Ep8Pxs1HqlJfsybQVatRsFQdso6HWa3gOJ/v/RFfZS
	RbmOTeJ3DDxRos7RQKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUDU-0000000BSpZ-29Iz;
	Mon, 24 Nov 2025 10:54:44 +0000
Received: from sender3-op-o15.zoho.com ([136.143.184.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUDR-0000000BSoA-2O9s
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 10:54:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763981656; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XpU39++R37qlJp2d+Mp1cCGlpyCF61ysYGpDrvcHmz8Dr6fpNZHSL170E9WbEbRac6CO8ZjvB1S+mLKc7gVbzq/mEpqWNDK2DQedea6mo6dCLL2kl+WBM2t6PiKCesMa5fYFaF/XVQNYVtBsg21F11d7FICDH+ZV8x3qDWHyK44=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763981656; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yCmapMaLaNG37xTznoB5gCrEYAm4J91BwEmE73mfTLw=; 
	b=RuDgVNyZBuE7cYaHdxWmG6jkhM863Bh6j3l2S4GsHjNqSLOVlOQ9qxRwFHzJRLbL8jZ/iXELTOAlR2WIJtys6S6tAutf72Ms9/5QBGo8kK+6ja+rChbKcLUrgsuYf7FWHQtMy5K7xgieAvJkXz/oqiaHjKQ08e2Uer7s6v2Z20E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763981656;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yCmapMaLaNG37xTznoB5gCrEYAm4J91BwEmE73mfTLw=;
	b=oPs1y//7t+6M89Qq/XCiFuXX1y2rnNzNZFIhOYDMRkryts15hWFoPFr+uzlpqjoN
	r+DIw5f6T1U39RfVgOL1Kq5th73OiUWA8KnDEW00l2coqMvrxp7LQ6jnlhINRa7r0i1
	luKMKAJv3SKmECD3apfhJF5iEhMhO+7TGtZtN+2Gax3H4QZ7SMfUYjueKg54cTZ3Byf
	5wbPjs/iBTmczggJqQCEmL5moHxbmbv5VPQw7gn1eqTqJXP2JWRba2DaGZ8bEW7Hfrr
	BzFPGemJ6rUO84eDmS09t7cCcWUqBWae17CDaigjOMzjvXeC4LpeazStY5vba/LjWqZ
	vrMicdgxBA==
Received: by mx.zohomail.com with SMTPS id 1763981654092198.7339131486251;
	Mon, 24 Nov 2025 02:54:14 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 8/9] MAINTAINERS: assign myself as maintainer for verisilicon DC driver
Date: Mon, 24 Nov 2025 18:52:25 +0800
Message-ID: <20251124105226.2860845-9-uwu@icenowy.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124105226.2860845-1-uwu@icenowy.me>
References: <20251124105226.2860845-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_025441_688666_0CE4D8E3 
X-CRM114-Status: UNSURE (   8.84  )
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

As I am the author of this rewritten driver, it makes sense for me to be
the maintainer.

Confirm this in MAINTAINERS file.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v3:
- Switch to my ISCAS mailbox.

No changes in v2.

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32715100a1e10..45f879ee02dc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8538,6 +8538,13 @@ F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
 F:	drivers/gpu/drm/vc4/
 F:	include/uapi/drm/vc4_drm.h
 
+DRM DRIVERS FOR VERISILICON DISPLAY CONTROLLER IP
+M:	Icenowy Zheng <zhengxingda@iscas.ac.cn>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+F:	drivers/gpu/drm/verisilicon/
+
 DRM DRIVERS FOR VIVANTE GPU IP
 M:	Lucas Stach <l.stach@pengutronix.de>
 R:	Russell King <linux+etnaviv@armlinux.org.uk>
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
