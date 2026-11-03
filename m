Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C29606B6C0
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kymjs6Kp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=pAx46JpZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vu2OHYnDUaAlWDZJTRhOV/q/G6/c59KMXkRJs8sN2UM=; b=kymjs6KpS52JW8YAUP8nd6+2jj
	5OrkSqKj1+O9qjZK0zzCHx+L2eSTcfA6P12KwEFX9JQ78yp8eYQkHyKXhCyBBePczXuzaINVqq9Na
	QD929moHAAJUUUVw8DEicHlfrdfXKRh0pWN8jvnvugMYXZAJEY/SSmIfZ5Q5+gGh6vbCquP9tW3hm
	ZNFX+mkM2o5tTEQZy05ZGzzQRKV4cuhoP6QE1yU6w05vulKEJMK2d6VyJBBsqDZ6Ib6alOOtfe2Id
	8pUPQIrwzXBQNu+ydpqDOV6X9NiundrdjF4GiTU2LlajsjCqsCBNI8vYtZPPa1KnCWxcb5+3BQzby
	jFLFi9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA1W-00000001Zua-1NYv;
	Tue, 03 Nov 2026 08:37:42 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA1H-00000001Zpn-2QLG
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 08:37:40 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37Pb293472577;
	Tue, 3 Nov 2026 08:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=a
	Iu6pEYpp53YfCiyYllM4lyrdWdbqBwyNFhZJ0QDrzY=; b=pAx46JpZrDqRu/evI
	Aq1MDV3s7qXci83vln0VfpLn86YkJxSdZk5HrL3S4IUdtPlNVFtRFbPOkRM5KLz2
	L/J882wXKhBZh6sT4BdkEhA74VTKhF1fJ8xpSffZnukqJ6nbk6c7ovUj+jxyug6R
	ag+TzyypwY4ageUGsgDGlxD0G8sJaD3oUEymlqfn1Lfqn+Q+rREEI4g5zYoIHdxN
	pgQYqf1fRnWlI/Jf95Z5B1ZjMYi1kjT5nh5WU9CHBXaoRMggw0n2fzClQe9NGezq
	TF8ny4FU0f7G941ktXWVbXZBWVdHqYABarOrkzKk3koKGCuciZCE5YHlWT8+H5wV
	9+AFw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hn7ft239c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 08:36:55 +0000 (GMT)
Received: from [127.0.1.1] (172.25.5.26) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 08:36:53 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Tue, 3 Nov 2026 10:36:18 +0200
Subject: [PATCH v3 2/5] drm/imagination: Limit access to the RISC-V
 firmware interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261103-prep-meta-fw-arch-independent-v3-2-563dbaf1b779@imgtec.com>
References: <20261103-prep-meta-fw-arch-independent-v3-0-563dbaf1b779@imgtec.com>
In-Reply-To: <20261103-prep-meta-fw-arch-independent-v3-0-563dbaf1b779@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alexandru
 Dadu" <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793695010; l=2210;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=wDgtp6LBF/C29pe2CVlQTKRn+Z/Fia+UZ37qNopawhs=;
 b=w+Gyv3TMuwx08RVtch0st92wmz/6eNI2KWeTPmwweMCdhYtrj340UsGsJhTiIPRV6BhUWady0
 OqGZzRkzTCKCbwOHmnSs4HYuLrR3CoEejAfUxvaO1BUJGUcUhhtFRyw
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-ORIG-GUID: mkaN-67E4oe6FEKjsKq0jtBvvKHKDx_v
X-Proofpoint-GUID: mkaN-67E4oe6FEKjsKq0jtBvvKHKDx_v
X-Authority-Analysis: v=2.4 cv=HaSB3SE8 c=1 sm=1 tr=0 ts=6ae99d27 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=h_3jC4m0AyQA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=xwwprR_ITuhyIuDbuUkA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfX7XA1Fz5OQyaA
 /b/lKbyJaGC6WT29xFrwg87hyTMkU++GcLqs/0rDcWW3ybqYH/J+GnCKTOa/cDp6u7efZ9sIBYl
 lqO4sQcnQyNnOFlCTt5+OkQOToVlbBc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfXwnLfLIbpGe8V
 sO8sen0vpRU/tKGfNMVZColhRT8stt2GN4uyw0yWq31crqPXMc8bXs8+agY/fvqq9Ddf1aOmk5h
 5sMsLDhK/rNqi2yo/snSplgpaw0qhIiqCcI4kWDILS8fLXWGt5+5VQV6xvQBo21ufmbuTwcEpuo
 BmkkNbjzDqm3TjJXvFuF+h0XpERdF21ZAi1XqM0AN37kqiC9R3WAJfAIE1xZNHQqWDQbUkJEXc0
 K4OxTFfzRmmNmO3gQohIVpJIh0ysJFBX4KPNe4Iml/Aj5ymkVZpShbiEiuU+m/yQo28QDMto9Ff
 wJrV1Pp9CMBgzA7MJfU0YIb5o5lsip5/OFxFBvQcLUA+81ZmQ5e/lBmPIORF2Cq++i/0HCbcQsC
 v4H8iG7dxSKuv122ssLciaeTMUksVArwz9XJaKUj7jTN0yWTqTkHglfnOiVKTOMIxYtp2SbNGWE
 R5N3lyq/2iX7Sqknx/g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003727_892654_AD2D13FE 
X-CRM114-Status: GOOD (  11.14  )
X-Spam-Score: -2.8 (--)
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

From: Alessio Belle <alessio.belle@imgtec.com>

- Rename the RISC-V firmware processor header adding an "internal"
  suffix.
- Add guard to the RISC-V firmware processor header to prevent
  accidental inclusion outside of the RISC-V firmware specific logic.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_riscv.c                     |  4 +++-
 .../{pvr_rogue_riscv.h => pvr_rogue_riscv_internal.h}          | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_riscv.c b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
index cd84635bb88d..0d4dd45520a9 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_riscv.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_riscv.c
@@ -7,7 +7,9 @@
 #include "pvr_fw_mips.h"
 #include "pvr_gem.h"
 #include "pvr_rogue_cr_defs.h"
-#include "pvr_rogue_riscv.h"
+#define PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
+#include "pvr_rogue_riscv_internal.h"
+#undef PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
 #include "pvr_vm.h"
 
 #include <linux/compiler.h>
diff --git a/drivers/gpu/drm/imagination/pvr_rogue_riscv.h b/drivers/gpu/drm/imagination/pvr_rogue_riscv_internal.h
similarity index 81%
rename from drivers/gpu/drm/imagination/pvr_rogue_riscv.h
rename to drivers/gpu/drm/imagination/pvr_rogue_riscv_internal.h
index d971729e18a4..ba18c2a82205 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_riscv.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_riscv_internal.h
@@ -1,8 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /* Copyright (c) 2024 Imagination Technologies Ltd. */
 
-#ifndef PVR_ROGUE_RISCV_H
-#define PVR_ROGUE_RISCV_H
+#ifndef PVR_ROGUE_RISCV_INTERNAL_H
+#define PVR_ROGUE_RISCV_INTERNAL_H
+
+#ifndef PVR_ROGUE_RISCV_INTERNAL_H_EXPLICIT_INCLUDE
+#error This file may only be included if explicitly defined
+#endif
 
 #include "pvr_rogue_cr_defs.h"
 
@@ -36,4 +40,4 @@ enum rogue_riscvfw_region {
 
 #define ROGUE_RISCVFW_REGION_BASE(r) ((u32)(ROGUE_RISCV_REGION_##r) << ROGUE_RISCVFW_REGION_SHIFT)
 
-#endif /* PVR_ROGUE_RISCV_H */
+#endif /* PVR_ROGUE_RISCV_INTERNAL_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
