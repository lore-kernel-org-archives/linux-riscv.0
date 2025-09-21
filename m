Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02138CAC5A7
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaDeFOjCXwQpXk7OeA4beOICdZJC1W/mXhnRePJ++bE=; b=bYR+/zEg5HjJQa
	+cy6vZgI9VLysFolJVNZjBJRedidSEVlYUfrOtBiX4EeaMnv07SjHhj+HQNQb8ksElNDvZ/ORgbhf
	ZT+aU3yP3MQrSnfwzygYdV8D0ZBLu4dfGzZZsctLRNJGDmoGU+1TbXxIcpWBZRIfBvgFtZFCa0Gae
	jfwNu1McjTx4P6SVXyCGa6V8MduaYfszW9zHnSYXpo96s9IvKLxa/a6kGBQhdKiaW3c7yRuW8dpEk
	bNE4AMsJ633yoJ55ApSZ567vh9wo4s5Y4e9wlXXxBQUWh00FXV6NQluB6cIl4iQms6ZgceHzhyhls
	UxW1ZKsBrs3Cj/JOi4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FZk-000000077d5-3NTx;
	Sun, 21 Sep 2025 08:37:40 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FZi-000000077bQ-1e2D
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 08:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758443829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WurbZSMAucWJMG9KteVgGhWwjgsyMgg8B/RMRKCiOq4+ILUxejB4ENCxMgKzGGoRwVfoWdftOgYd0VI1RXqLbRMRUv3qJ6NbecpPzFCdusyihpMlysxPY58P5LP+1mPT9vsfGHF7XA29xkIijPeewvnLxVa0D5R7Krt4b7XQVWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758443829; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BISvAyyTH0h3AbD1RfOd4M5Y4uTH6JugxkSpXzZ0EJk=; 
	b=Gz9qkt6gLx3oicvXY8PaoTrk1u3+OW5VKy0fwj00pDFDKDSp54BEGZV2Zn3gV0rGMcULDZPkHN79ul9PQ7e6CN7dvn1T+ARbcO7uyYYBtASR4IZ6QR/pF3EcuP34/kgKzJ3tkujcL2xnn+Cxjz20xwnwhs+JtAjmwHpnbrEVA6c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758443829;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BISvAyyTH0h3AbD1RfOd4M5Y4uTH6JugxkSpXzZ0EJk=;
	b=NesjRj/gNsGIUHJsHrhk9FMhNcV6WFDxKodILy/mkysSawpiQoHD0BcvUZFirAqj
	W1bkUEvwT6guxuK9RsNZwzlnvJMjS+WUJLqdAHgDgAZ4OSpxlF+/FmRkplGqFbPiQAU
	F83Qw+GcnLFTIAPvSBFltLi2bbhRm+7uyHlfC3bRv9Ukv00C3Cg+JtIjtKwAWsU+aqu
	moJUPBSOdhvVUIIKddh114MtxmRWBVgJHNMpoC8POj2xMhdNg8Eeq72ykyxzmC/BXgZ
	fDZdruXoXrh8qI85XZyRWceMW7KXt5y9LUTcy+/AFOKUBdVWjZ4nXTDQsZX3/IWU6lN
	VJepNihaqw==
Received: by mx.zohomail.com with SMTPS id 1758443826199803.7477831973885;
	Sun, 21 Sep 2025 01:37:06 -0700 (PDT)
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
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 8/8] MAINTAINERS: assign myself as maintainer for verisilicon DC driver
Date: Sun, 21 Sep 2025 16:34:46 +0800
Message-ID: <20250921083446.790374-9-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921083446.790374-1-uwu@icenowy.me>
References: <20250921083446.790374-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_013738_480312_43A0B2D5 
X-CRM114-Status: UNSURE (   8.17  )
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
---
No changes in v2.

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98af9dd3664f5..348caaaa929a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8393,6 +8393,13 @@ F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
 F:	drivers/gpu/drm/vc4/
 F:	include/uapi/drm/vc4_drm.h
 
+DRM DRIVERS FOR VERISILICON DISPLAY CONTROLLER IP
+M:	Icenowy Zheng <uwu@icenowy.me>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+F:	drivers/gpu/drm/verisilicon/
+
 DRM DRIVERS FOR VIVANTE GPU IP
 M:	Lucas Stach <l.stach@pengutronix.de>
 R:	Russell King <linux+etnaviv@armlinux.org.uk>
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
