Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D57C28B2E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 07:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUQIlQf/beUCZswj3Qqa3UyyAI5f7k1oi7OiHJmTlXs=; b=CBMFMSpvJ/OIfH
	miOM4ZjDBmDL3hWCF7R1/orBZUKsCSr/H9DITptSVA1cwofLvFSNhO9Up1eeSxWWVqMANwY8ZVaZb
	mkgGaVSld4jLU85Xrml9bmJ2k/a538fi392l0dRMvEhuQWsAM1IMMrwhLwWV20cIvhQlG7jogLSEC
	tA1W5/dt/6nc4vLSSDSjdSx+Hj0P+HGyKKJhfpAJ3UGPBqVHwii0hs0AdCkCD9Q4EKV+RHMdlslV2
	aIwGEMrOGvkohX1QeD3D7MUeoQ3eKXwenWdZQwul6x0z27D5UrJp/QnSfh7oKeMWq6am9gx4GBDnv
	mtxARgbyurLXV+5/XrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tru9f-00000004r1g-2HXo;
	Tue, 11 Mar 2025 07:35:59 +0000
Received: from naesa03.arrow.com ([216.150.161.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tru8P-00000004qda-3ScQ
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 07:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=881; q=dns/txt;
  s=NAESA-Selector1; t=1741678482; x=1773214482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3hrFC8akR20pQMYn01FDGTaAf1FudakKyQp4tQR7was=;
  b=o4zXMtgnCbJpRw4VvbbJFtNqrzwlvf21wMVnP6sBjYATBiLZGapjRDRZ
   adrJSWlD2g0SjG+bjZ9wA9VTTt2WKbSe1dwK6xysXYZRT//V6GDgBxHfm
   XrRn/pr2eegXCDZ/cQv5z0H0ovLqYVUjPxiYgSUtaKV+3bStGKiW6YPZy
   vhFcPGP/u56fh4z5bXzjmzJLIkAi/vtf3AgLZo8hfrPR+8fnIox8MFC4o
   3qqVNzoMa0BZPxJH0zeBrvg1FpO/aMIlnPUyq121Lo2sjpVDT6SqBjxaw
   N16I6GGEstZ3Wy6H1gvjgQMyaEGBbsXre9EariZmwj02cdGa8xc8a2FeK
   Q==;
X-CSE-ConnectionGUID: bmKcuMhZQIytBBy/3DG3KQ==
X-CSE-MsgGUID: ASBBqzq3TOKlMP7ca9xtnw==
X-IronPort-AV: E=Sophos;i="6.14,238,1736838000"; 
   d="scan'208";a="79624738"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 11 Mar 2025 01:34:41 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Tue, 11 Mar 2025 13:04:33 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] cache: sifive_ccache: Add ESWIN EIC7700 support
Date: Tue, 11 Mar 2025 13:04:28 +0530
Message-Id: <20250311073432.4068512-7-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Mar 2025 07:34:33.0098 (UTC) FILETIME=[08437EA0:01DB9258]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_003441_920885_4A014454 
X-CRM114-Status: UNSURE (   9.80  )
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

This adds support for the ESWIN EIC7700 SoC which also features this
SiFive composable cache controller.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 drivers/cache/sifive_ccache.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 6874b72ec59d..e1a283805ea7 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -118,6 +118,8 @@ static void ccache_config_read(void)
 }
 
 static const struct of_device_id sifive_ccache_ids[] = {
+	{ .compatible = "eswin,eic7700-l3-cache",
+	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
 	{ .compatible = "sifive,fu540-c000-ccache" },
 	{ .compatible = "sifive,fu740-c000-ccache" },
 	{ .compatible = "starfive,jh7100-ccache",
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
