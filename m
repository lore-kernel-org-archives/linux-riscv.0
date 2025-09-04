Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB35CA1015
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0vozL7BpWYY2Hn+yXbPZIZlayX+IFYbYiBSGJPafks=; b=tx2Q1z4BIyWBCM
	/EK+CPNgRihQJqBOxcWp8+p59EaypOZbCzArJ+iS8qCTLmuvF+piKMYYTjNj+8N+K2W0OFHX1DKel
	QAjtLrdBQj3ZBoaaopyP16axWybcXZQY7AEDnk1nS6uLgClyP5UWFKwbIAzCEXavuEFI38HtbXfM5
	dGL+QZ7OavR9JFuQWleuw88seqLzirusf9BiTSr+CPL6uOLZzNyFw7wql4oZE/deVlRtXqTlIQIvB
	8syt0YidyAsqJz0BEKCJFdSrY94CACdb4ZPVUidDJgHegszVOoQrQ7tpoM9KRJOw25nGwWXyqGMNL
	av4XcYd5hrY7l5YwyWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4lA-0000000A0WS-3TDr;
	Thu, 04 Sep 2025 07:51:56 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4SZ-00000009t0o-2nMm
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 07:32:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756971156; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PDtkBbrQP67DLJK1tUaSkndCHxlHgp018lVKYCP/0v0oHiGqRFSzi9JDmtUVwk3c5w2CZxLQHOcuFks3tOSMS4o2uvMa+tHyyJwws1NdnaCPgN24AYLyJXaBbBqdS0nDmm6/axTHyKtkfmmNjmRFZFyD9oVtIC/bnCNsy4rcd5s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756971156; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pGOtwpWAaJdT+GipksIOXm3viEyCHLpm9n12DMU0+8E=; 
	b=gVI/yRgvVZkw6b52L/6b47hAio/riXqrtDGHT2YZVTym0w5H6FaOShq8dg9DRfDuzMHm6Ca1li9ZFtMjbKUEcvEH7xDrIZIBl5KmT3KAKMOYevJ9KjNDDbB/0Hj0FowrBD3PabskFLlNZUwjespdHq1VIL2FN0sNGr/36mpGTY4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756971155;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pGOtwpWAaJdT+GipksIOXm3viEyCHLpm9n12DMU0+8E=;
	b=md8MrtZ/RtRPcNhasxRSGp9SelkBRsMJNu2B3yj595f1EFXLAq/7KAdAVXyqXMP4
	+1g5sq4zhUWJP7Rn5OW6DqrYm4k6ouqgczWKEeh4iEyCaeaiOOqP+wn0Kngk0uZiIgi
	RFSbRAiYodsgIDiRz9N2j5+S0KNwD2syJHLLfST8sNlEbEmzITbvG0YcFDTJAcA/14O
	PVS1qFscbtl1hdAz0x2OFkga5Qa2/6yFJCTCNFB955Zl6ionDoamaJDQlraWhFz45eD
	XgL9XBxqRbg9UycTDzxTKOhc6RBbH63xiMFsBfCM3wGWCvNjvcPZFQkbX+fYHqkHKqb
	1ZlWvwrYQQ==
Received: by mx.zohomail.com with SMTPS id 175697115302280.71846743294384;
	Thu, 4 Sep 2025 00:32:33 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 1/7] drm/etnaviv: add HWDB entry for GC620 r5552 c20b
Date: Thu,  4 Sep 2025 15:31:45 +0800
Message-ID: <20250904073151.686227-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904073151.686227-1-uwu@icenowy.me>
References: <20250904073151.686227-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_003243_762716_2DC89C4E 
X-CRM114-Status: UNSURE (   8.46  )
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

This is the 2D GPU found on the T-Head TH1520 SoC. Feature bits taken
from the downstream kernel driver 6.4.6.9.354872.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 8665f2658d51b..6a56f1ab44449 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -69,6 +69,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.minor_features10 = 0x00000000,
 		.minor_features11 = 0x00000000,
 	},
+	{
+		.model = 0x620,
+		.revision = 0x5552,
+		.product_id = 0x6200,
+		.customer_id = 0x20b,
+		.eco_id = 0,
+		.stream_count = 1,
+		.register_max = 64,
+		.thread_count = 256,
+		.shader_core_count = 1,
+		.vertex_cache_size = 8,
+		.vertex_output_buffer_size = 512,
+		.pixel_pipes = 1,
+		.instruction_count = 256,
+		.num_constants = 168,
+		.buffer_size = 0,
+		.varyings_count = 8,
+		.features = 0x001b4a40,
+		.minor_features0 = 0xa0600080,
+		.minor_features1 = 0x18050000,
+		.minor_features2 = 0x04f30000,
+		.minor_features3 = 0x00060005,
+		.minor_features4 = 0x20629000,
+		.minor_features5 = 0x0003380c,
+		.minor_features6 = 0x00000000,
+		.minor_features7 = 0x00001000,
+		.minor_features8 = 0x00000000,
+		.minor_features9 = 0x00000180,
+		.minor_features10 = 0x00004000,
+		.minor_features11 = 0x00000000,
+	},
 	{
 		.model = 0x7000,
 		.revision = 0x6202,
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
