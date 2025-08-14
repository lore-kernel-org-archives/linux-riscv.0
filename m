Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787F7CA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3aMG8eTJWYikySTjkvIStGVUoRhWs8aA4TkrHvvixY=; b=yFnNZabbIaVsch
	8UROz4nh8WD6zmUlggl5u3QljZYhUCA7Ui5Q1ETYwKyOzDps4HwYTtCUOm9EaE3ddfr2z3Fi/nuu4
	sAabJruC4s0GDWCYc2+e5oRnZ6bmn9f0Df+eVcaVv0PlutpRNDbDWLZErP2VWvrKB3gr8Y8UpASu8
	rRF5IpKkWfKmMKaYxbG4SViiuiQ8oo6WW+vd28R/o5F+5X+2qQMcMxAskXqhpznjmt0W/m7DbRWyy
	qdbRpFQj1ByeCa2t3sIS3Cp2zNKbAeOsScSda5DETlx+QownHIPKGXlT/Fn2t7ImBdyqewDyLJJ+2
	U430NAz9GnUxaYFgebHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbHV-000000008Sm-3Hy0;
	Thu, 14 Aug 2025 16:58:25 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umb1b-000000005lV-04RR
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 16:42:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755189694; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X1ayUfJQ6DxKLvbCksPYrzsQ1oIm5hH5yDRN7Fzl2+xnSKb75olCwJxaA/yQ0aScftXy0n35mHg8yrTAqgYVd2VO5/L8jbHUxeq4fYvolC+AMRkoGcUaVnNrZ2nc/DQn8hA8SIJIL9RcZqzz0bCmd2v9WQT1LcH9UHlvcaPB3PM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755189694; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AwlujCsaw8JXky+XOEnR5Sze+0NX6gB9xBd1ImD69wc=; 
	b=QztjuIkxQ+vcm9bl0gledOSkKyuDUK/Q1oD3jKYmAXCHh+AG+57kLcO6nDKNg16RKNt0Dv04QHvF5jzANIxx6z1jflYzervjhYko4Gl3qXXEvW3qlR8dpYu+7shPVj2uElYZeFJDEAFk4mhMJ6I0ANzW1bCmHcvD0UUHW7aQfNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755189694;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AwlujCsaw8JXky+XOEnR5Sze+0NX6gB9xBd1ImD69wc=;
	b=fCW8G+nNHHF9yikS2mp/9LCxUozS2xPJPLd+QFK+1CAu1C4LTGcpX0XbeqC8yLsV
	bI/0PUMiq1UpygIuJy2XsaUCBWwOuhNmU40Y7DNgmaw409yvLSNTVJ2VaO+sR72JQcx
	F4TjYwgULnZLhqb/BgpME4gat07t5Wqq3Pg3ge8hdyyL9NRb9o4okdBRxHtRvdy3Ilh
	YtkfSqmLGQbXtDiVGC+kX7rKBASL/kOYP8kVdyRmAhhdS7CLnnHSaLvJ7qX0nn0GAqt
	5MNEcwQL4rPpDHikfN+x/r5zGAnYJD3QcBM0SC35octLEmiUEpaR9u1EHKCyGvXOXGc
	KI1MFPVgXA==
Received: by mx.zohomail.com with SMTPS id 1755189691631781.4424820957234;
	Thu, 14 Aug 2025 09:41:31 -0700 (PDT)
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
Subject: [RFC PATCH 1/8] dt-bindings: vendor-prefixes: add verisilicon
Date: Fri, 15 Aug 2025 00:40:41 +0800
Message-ID: <20250814164048.2336043-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814164048.2336043-1-uwu@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_094159_105372_922A76E0 
X-CRM114-Status: UNSURE (   7.70  )
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

VeriSilicon is a Silicon IP vendor, which is the current owner of
Vivante series video-related IPs and Hantro series video codec IPs.

Add a vendor prefix for this company.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 77160cd47f540..215c6b71b9717 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1654,6 +1654,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics (Shanghai) Co., Ltd.
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
