Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFBFCAC5A7
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRKhIihXJMvdBU8nGpMv72vjFqX3aRdIXIHdp1XfzLE=; b=T9PXDMNqxiex60
	I3jBX17z1hNbT5autFJjpQWXgG1AnZguhpu2lB3PIZLSpICiK9+QQwObjLeaWdWLqwyC9maFqpCja
	s+PRidBAeOULlkjsYc8FJXVsA+i2nRKAtqgLKEojEQ1MoMwvC71Xz/BO0NZueVkUKgKuRKmWYIXOZ
	BxIBF6Bh71XGFHI0KiqcZ+x3v9WpLdIPAaJVUtd32lLXssKVX3Utct0EHTzKGyLKg2mx0cPZPEQO1
	Z1DCWeuWXmEFfbaxsT5nvHfupXnLps2fT1i9Xjs6VQ2gqY7GfjUcYKIlZOIMKxCCRDqICYsKZbqNo
	uBV8/IUTMqbszPcfNwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FY1-000000076gO-1UMw;
	Sun, 21 Sep 2025 08:35:53 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FXy-000000076fN-301F
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 08:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758443726; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gsMA6quhUM1kWSDHXIaOjv2msYYcL73neNuoI0yUGWd3pgSG5k1Nr3xw6/iGmhE8or6WTSU+h02o6J00Q4G1C+WD/PD+k2L/VwpJghuhigvkDjrnEzBN63GcSoSp6Rb93CxgmCx5qyJ/GsNRdaJ68+jcl7bt3X3n8ITDcl3EMug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758443726; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=efmETRccs8kLEdcb77jPapZRIKSB0g2ptOw7m7XUf8o=; 
	b=WdwDiKpYm/wKw4bQhJGHMnrN12dA8NOAOUjExt9h8TL7Iy5ptVcweo9Xp+Tqglmy2FYhbQpqoiyHZSSh50ocvSUex/l1YWXWlWphMoKraw9QAiv902vWpgTOSv/CFJHuZf8n/InvZYzGoFPS43ful4Pnsfnt148XqfyHeqyUQoc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758443726;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=efmETRccs8kLEdcb77jPapZRIKSB0g2ptOw7m7XUf8o=;
	b=oYhd4n59U9zx2jaqND+0Vfz9I9c442p7Q4nnhK4NOZkLBr8dIvFb4yn1uPv645M9
	2sYPqBY1FJk0XC6bol77PYKZ9tEIUB6ETO3755/n24t/GFR1VHAxCFtxekFo4VRFx76
	r3lCFrRUYDOeNdKm6R0f6JqayBW4lvHEAmraA8BN86y/uhgk9IP+wID6uG0ZMUBnVOi
	Xi6lqK8keXavlInpSJyEYXNBdV5MzEDYWJjueoGSbUZcJRPC7kjGTttKQ9HiAnl/SDO
	rR7OmnTRXfdIYrjWafohEzaNRFZuXw8LEhgXVisza83K5zjb1MbO+PBBsYmC45M74YR
	XGsYU8GADA==
Received: by mx.zohomail.com with SMTPS id 1758443723225109.34629747101064;
	Sun, 21 Sep 2025 01:35:23 -0700 (PDT)
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
Subject: [PATCH v2 1/8] dt-bindings: vendor-prefixes: add verisilicon
Date: Sun, 21 Sep 2025 16:34:39 +0800
Message-ID: <20250921083446.790374-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921083446.790374-1-uwu@icenowy.me>
References: <20250921083446.790374-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_013550_806214_1205BE25 
X-CRM114-Status: UNSURE (   7.55  )
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
No changes in v2.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9ec8947dfcad2..b24ab511251b6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1656,6 +1656,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics (Shanghai) Co., Ltd.
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
