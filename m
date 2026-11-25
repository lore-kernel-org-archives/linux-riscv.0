Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B9606A68D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pWAz59oU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=DyztP2jM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dg4BvVvTn6jxCYlHezkCoU5gdG1YiUinrVT0+038/9o=; b=pWAz59oU8OPZEA94BzHhAJ1sDI
	63o/TKOVA5Or5WK1MVfxA9wjsTPCqh5QZrVAChLDjkuItcWlaKE8/yWOVxV0xgllVaL/G8NKIfmh7
	Bx+0G8m2zo0dqevS/CwCENMm4b4f++EZxGhj0s5jqwZCg+LyfbyjayZYQdNoLaA6h+0VQcdXLM2L6
	8NjwBd2x8x4Ueo5XcsvfoZr5oHjVqsn6CmM6de6Fc8ahl+TtYwI3izYXJ4td0//2ZMCn9SS81IuMY
	2pbS8GA2fNC0NWRmgIPxNUchiXUqJsLuPJhZE2h6jlddadZQC6qN3LZb/Pds7Are05Yzjdd5XS1Fr
	AQL0yxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBVU-00000009hyD-3iz0;
	Wed, 25 Nov 2026 11:49:48 +0000
Received: from mx07-00376f01.pphosted.com ([185.132.180.163])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBVG-00000009hlo-33XC
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 11:49:39 +0000
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AP7prcw1962352;
	Wed, 25 Nov 2026 11:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=D
	T6kM67LeVqubhl/XQzUsjrbwfVvqg+O4AplUmwA+EM=; b=DyztP2jMvjhW2dAAn
	0P4ZdcdZDl8rmt21/NTBoui+Tj+YFEvOyMGIZSK/+mOeNJvj0JMAoreYnaqSiZSh
	HEiUZ6BSRaz4Z5soUsc/si9vGBsjIiPM5ynMJZOrhEHjexEZVzMwouJatv8pJElQ
	azKd7spDeZ7C9rWMJlTSwaJUco1VSWPLv9v2Q4oLjHq2jdKdPwh6asiQ1XcCVuAd
	sPRTz4t+ieKyh6KmMMyLdUCk4bqJxZ7sTDS60kqUyWVfk8EH500ql2BHLcNErrfQ
	Ju50u/hrqxuL4u5MN9KXMLms/T6mmTotLwCyq+ue1baoqDv+7vwrICLo1I7LgZku
	FbE1g==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4j3491kdye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT key_exchange=secp384r1);
	Wed, 25 Nov 2026 11:48:59 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.203) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 25 Nov
 2026 11:48:57 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Wed, 25 Nov 2026 13:48:30 +0200
Subject: [PATCH 2/6] drm/imagination: Fix size of FW header members
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261125-b4-commonize-fw-segment-loading-v1-2-69657fa52ac3@imgtec.com>
References: <20261125-b4-commonize-fw-segment-loading-v1-0-69657fa52ac3@imgtec.com>
In-Reply-To: <20261125-b4-commonize-fw-segment-loading-v1-0-69657fa52ac3@imgtec.com>
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
 Ghiti" <alex@ghiti.fr>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva"
	<gustavoars@kernel.org>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-hardening@vger.kernel.org>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Matt Coster <opensource@mtcoster.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795607333; l=1243;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=wSXEtBNYX4VW/9eHmVJwMwRIUWDpaPN0ooAORqioPRs=;
 b=m/LbOEwqR6ZJz4lj7z/qGx1EHXodqW9O1g1JhtAaOAG7WNnsXdu56uZUo3aSLZgbkycwOlsJv
 iLHYb2XJDw3BAEypWZdJesfYxtuFGKZdgD4RfFl3z1OwJLVO1JehIZ4
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX7/K6c76/rDgo
 /p0jFeSetx3U4aOmlLmItmnUoQMCs3iaZMxrawSkkabW9zpL7alw6mUw9pRv5aqMnluyzbf12sq
 Bkkt57e14ljZcKxBbxPCVH1x0SBEfamcIpmQtugFeF7FgqudOcHlCIuAdAuizGKvWWvcYDGRE5V
 ha9NHco4eoqQEm00CxQv+WBhbOBRu1wXzsCaWt5NWA3ZXSi07O0S9dGC0hqSttPq/tX6g41QR+H
 XIjXRbbks9qOxkDI86LssLj4NiwiFkJUoQm+vO6IMQnioP5g6d6LVkQLFuBjEaIzOB/R3acifLQ
 Mb3EOZvWVUhgvYb9/zHsJIP2A807sy9aOu2zo5PpuE2t6olJ+HWAIERAvhN0pPxNQHDLj5LAWzW
 YYIWggnKFw95JqN6TzWZgSxTgSsVbFh6o05APF32NJpkQ2WIIHesFYP811MOJIL13ajMwnpJYrR
 kcTppoCtpJCMG6lj1pA==
X-Authority-Analysis: v=2.4 cv=OaENnRTY c=1 sm=1 tr=0 ts=6b06cb2b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=4EFqt8Tv61wA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=iNbrFeQbgqLfWq_HSDUA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX1AlL2Ielwx2F
 RvuWjdcTwJxaahPoL8j2vTH6yfUzclYrk0Zo68ROxMbDVHmvs8p/N08FW8/zM+XBO0kHpINAKfV
 JZg5NV9ZTObWgn+XUv4ZoP4pjyTOebU=
X-Proofpoint-GUID: QTRFWEKYns1hBUn_zlItTi6g9GARBSEH
X-Proofpoint-ORIG-GUID: QTRFWEKYns1hBUn_zlItTi6g9GARBSEH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_034935_112865_4C88FC55 
X-CRM114-Status: GOOD (  11.28  )
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

From: Matt Coster <matt.coster@imgtec.com>

Don't use enum types directly in the FW header structures, since these
are not guaranteed to be the required 32-bits.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_info.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_info.h b/drivers/gpu/drm/imagination/pvr_fw_info.h
index c3639440610e..3ad79c59d5b1 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_info.h
+++ b/drivers/gpu/drm/imagination/pvr_fw_info.h
@@ -104,10 +104,18 @@ struct pvr_fw_info_header {
  *                              section of the firmware image
  */
 struct pvr_fw_layout_entry {
-	/** @id: Section ID. */
-	enum pvr_fw_section_id id;
-	/** @type: Section type. */
-	enum pvr_fw_section_type type;
+	/**
+	 * @id: Section ID.
+	 *
+	 * Values are given by enum pvr_fw_section_id.
+	 */
+	u32 id;
+	/**
+	 * @type: Section type.
+	 *
+	 * Values are given by enum pvr_fw_section_type.
+	 */
+	u32 type;
 	/** @base_addr: Base address of section in FW address space. */
 	u32 base_addr;
 	/** @max_size: Maximum size of section, in bytes. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
