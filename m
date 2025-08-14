Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B9ECA0EE8
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDFgHunnEZ/IFwzr1bgCB/O5YG97Yc3qatOQYqFbOr4=; b=koXPcmR2lpvlbb
	hpZNIfSYgEtIJn55bfrpY4tPFhI5eSLT6khnDNE818DDezWNcQsWk7kTE3R580CngVa8gvRMPIByo
	za4ZRuzVhkFdIamZ25MvuigefC6saC9RGXXNQlzJE0DGLB9VHEFFF8qeo3Uyikr49t/CwXCQEdwkS
	NOLDoKoiOoUDKuRsMZG5j0WgXGMk6MIvQNtsK61m8Ho/eaSkVtTvITCg2jLL9tX19Mgb3A8f+ZIs8
	4r1IBivxFsXj3s/sWsPGBnqzkPrOwhsPXpriT6G/kApLrgPJ3qWjmpNg62enfR2fmekxURCRWbHMB
	RZK0DAWn8a1tC9Nob+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcGk-00000000HFu-3Gnm;
	Thu, 14 Aug 2025 18:01:42 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umb37-000000005zI-1B7i
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 16:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755189791; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZFVoaYb0BqXsCSXiY7Nt3GjCO/emmFJtWURWBkSKPzSG28oW6RH69rPSaZLEPwsBdDAqQrR0Up7jwRCAmiMl+2tU25UZAbWkoZdbAf0d1YLJZ/dxy+w/gDQxMmGe1fllk+bsh5aAJFEGM7RR4HHlOQpOztflo8BjSwxpEryCudc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755189791; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1/iclKhHRrvz1RndiLfggvb+V2P6DE4+wzZACrQdYXQ=; 
	b=PR74O+iTV635aQ+9dTX6kbR3SQUxshF5pVxH2ZoRFmXbNFB/f5F4ryJxgoNSNUuHCe8UvVCrIrrNeWtKFG3ME/3dZR/ojgkpaK+E6ego3V7Tv+0Ciri7O2ri8nz81hi9Kt+EmO8yYixXcGvsy/VznJrHqXgZ3lQgBgKPM8EyWvo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755189791;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1/iclKhHRrvz1RndiLfggvb+V2P6DE4+wzZACrQdYXQ=;
	b=FFckGQ8PrNiZ2CQY/GtDz7o2T+13e1b9kz3693PfFhJTAf1Scpp2WQqKMew0Gwh0
	Zx6zCs4lzMXSy35XGn++MTl5eWVl8H+NIMf6+rmvyreNA9xoEwy8XTgVK1OvuBOFiWT
	9vVZvGYqDNNvREeFxtxaqTyfNBLC0mUCgw0XQawDjTFpPyrUMIUxN8Twe9JR6sznWQE
	p4tD4Its+W4UyqIF4G7S8nSGBcDQD0q2xzrEH6BctKxO4nZn/HI3r7Z1QsMgdo1wTNf
	uj8NdBewPIsFR35vmaBgiXKZtxRsg7QmiU+l/Usvf3MwCFMPpOYZ6EGX/MaLeUFu0GI
	X+5kxT5bpQ==
Received: by mx.zohomail.com with SMTPS id 1755189789177857.0751333859133;
	Thu, 14 Aug 2025 09:43:09 -0700 (PDT)
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
Subject: [RFC PATCH 8/8] MAINTAINERS: assign myself as maintainer for verislicon DC driver
Date: Fri, 15 Aug 2025 00:40:48 +0800
Message-ID: <20250814164048.2336043-9-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814164048.2336043-1-uwu@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_094333_376381_915CEA99 
X-CRM114-Status: UNSURE (   8.23  )
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
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb84e36ded6d5..8c604de979680 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8385,6 +8385,13 @@ F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
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
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
