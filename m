Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D324CA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SA1yiDfWAmgeCDAmniwrpdc4GheCZ6Yk4N1ag9QW7VU=; b=UgkvpiE1x1bhp2
	g+V2iUtarSuhNGlNCZAdX6HX5hfG4fqyVnyOdPR7XwPtsj7jnBYfXE7fftOkSLE7/pGA69E0Y2M0N
	VX5RST7703QA/El8p3yZ+ahbctDZMjEDH3tAunqRTcAckSvYw74HXamIGRwofueU4Gt79ECM0x+Db
	r4fU/HFJioGMZdiCskBZPLWOVH2EcmCbxYPHDdyGsQHDOaZht0i79R2jZTQU4j9hdrrav6tnoyHg8
	+3RtanawoRnA1EP3WK4wVbQHxyQD7RlnrMuId5EL83wOBSOaUq1l/EOfEdV09DNK4enXQY4P9yn/N
	kg7M0zz58vImLcn+Q0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBeq-00000004EUY-1PZZ;
	Sat, 16 Aug 2025 07:48:56 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBeo-00000004ETS-1AsK
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 07:48:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755330525; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VJuCYtbP8mrUQI9T1j4bi2711bcd1Ushr3otFT0qX9HfnUBl2yyrca5PiG8z2/j2LUn2yaOLEZQEw5bpGF4soUPnK6OrWeQmranSaxj/it98JH47ji/zQ8nCJr2LFWuWBfqd1C1v6caNqpSTHy/oLOMiNrYqs0c2RdUpF6SWmXU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755330525; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cN9lFebZvsPmUPzA51YhqeWIG+6E3sTLNVCRnql52zU=; 
	b=lsN3UfO1JlPm8BG0r2TtNGoDnKMfDwmIJ3BcTgo9A6rlKgLtsaLSlZ4whakDVutmWOkH7aIGToeh+hDmFA5jPtl/tyz6EK9MiCMJMCvhcYXj6H+9/EQfw1JjpcSUqaX1arzoSDQNte3xI5WWrDB7yOmDir8Wimw8/Cf7DVXtwbM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330525;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cN9lFebZvsPmUPzA51YhqeWIG+6E3sTLNVCRnql52zU=;
	b=T+Ewstl5U9bHCOwOiew8z7hoW8vCH01/LbakLU+sxXKDLII9KDCemLjAerWcZtUa
	TtbWv1JhHUp04mJ3yG9XbCE7PVokb7U9UMYp+qUE9XhEk5Qb3jX3jo26aplbEXz6iKE
	KnDyJlrKejHjw09N8Yq7IsEBAuExfB3fvUoDvUV6quPKp3PVrwUcvnNZs3HnJLD5cxV
	QHW/u8qzmZUb2yIl9C8zLEVVYbj11qpNrg5ySI7BiCvX0ugMQbSeerG0sTaDHKeUdPN
	af2LNR8on3TeSmsd9J6rP3kJ5dbkEAa6LanGb8L5yOzfTcoDk39qzNaW4dOZZLkSEq4
	5CZP32aLPg==
Received: by mx.zohomail.com with SMTPS id 175533052326799.97496694678875;
	Sat, 16 Aug 2025 00:48:43 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/7] drm/etnaviv: add HWDB entry for GC620 r5552 c20b
Date: Sat, 16 Aug 2025 15:47:51 +0800
Message-ID: <20250816074757.2559055-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_004854_379500_C5785355 
X-CRM114-Status: UNSURE (   8.24  )
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
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
