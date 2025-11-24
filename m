Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B94DCFD317
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bt0lJEURdWz5onE5r2WvCXYu8Ojst70R7U7B2DE0PII=; b=35ttnuaALEG3NQ
	049Ypv/FSlr0vunUFdDsV1LbFDeM78ZAfFRsyGSrX+zGo0XSWi1+LnXt2SI80Byv47Cg8JTnXsLpY
	RlTYMxbPnLvSShpeatfGWYhFGtMxvovfz86+O9QIo7np+mSETTVk9OcE2ZzWMmT3I3h5Yti8r6IpY
	hVzrzmlfWe2wdSOxnPM5lZFICz2zTlB0295x9ARAhkg16JaKz/b1p9lDiGiNF32/Bq1TA2am9PryA
	AYTSCUM3qUCYwok5UWPmLSbeZHPyZ83PlMfcQGXZVHaEtas/6krSuyC0MwqrHFDp41qf2JwUjCFPI
	PhfKV1bN/NUUt9bBX0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUCA-0000000BSK3-3qSo;
	Mon, 24 Nov 2025 10:53:22 +0000
Received: from sender3-op-o15.zoho.com ([136.143.184.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUC8-0000000BSJN-2KkF
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 10:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763981573; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MyLWk6DGeOqNZua+Ib/Kg1BXV5VxZhFtpGoCJ5ZU56Eiznb08Shp0lXGGMCBKaDc+DuD71uxpWDtjUbwUVIDrPJH5/jNkv+lk9wSiy0UDp9Bf2wJT/SmTYnV+Y6q4gUqTGRYjN6szsA8HbM2rUZ//ssCNTzuY4wj10tr/CndQNM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763981573; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5UH1ELIx0rGkAwsYn6mhBH82FdAwuQpZmsddW1CJp1c=; 
	b=hjXqEpxRr/DlpHzQZGTMYPWVfLfZI6oP26BNGuxZ8svTifBWjvoOxEkcFrgnH/5SZ+NWGj0Kd0KXzCKI/Y4ITXKdQVUeI+kLGiFC3aJfzXzPik2i4UHVjhsV787UZyz/2Y+GrsbiUSh0IPgMOscN5PCOAL3eJ98eL49psWVF8GM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763981573;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5UH1ELIx0rGkAwsYn6mhBH82FdAwuQpZmsddW1CJp1c=;
	b=dUhWPqjVSpCRi34J1erETOUIBVwH0DW2X4CVCiYmNM8Yw6xu4qZkUqiv7o54cT/t
	RnibpqKByAdhYRkL09x//Kq0rlWJ/5aIRGGRwIjr3uwWe4NcxvMSUu7Sy02DbvVlnR/
	gXVVGOBA1UC3wfcZd2W8Uks8AgGFH6B7QYghdeHlABOX4V8AUz7OE/phTMzZu3Q0m7m
	y+WdJW3bF2okk8Ts6ibwDHUuCqVbczmNwmsYme4M8IkU8Zo1+1XqPh2bsNcBYi4EOve
	wOt8VdgnDmDlrFXS4E7HK6D57uKRFIk/dRCP2SDqYPIduuIqjJzSmCK+8pHUbuM7gFv
	mqZxoUz/1Q==
Received: by mx.zohomail.com with SMTPS id 176398157093628.493570075381626;
	Mon, 24 Nov 2025 02:52:50 -0800 (PST)
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
Subject: [PATCH v3 1/9] dt-bindings: vendor-prefixes: add verisilicon
Date: Mon, 24 Nov 2025 18:52:18 +0800
Message-ID: <20251124105226.2860845-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124105226.2860845-1-uwu@icenowy.me>
References: <20251124105226.2860845-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_025320_709822_2C9DF8F4 
X-CRM114-Status: UNSURE (   7.84  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
- Add Rob's ACK.

No changes in v2.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba9..88a83031f4d6b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1721,6 +1721,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics (Shanghai) Co., Ltd.
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
