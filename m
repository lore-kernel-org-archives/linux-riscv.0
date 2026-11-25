Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F9606A695
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iziXZOk9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=kbC85YzK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GRAlTN8kjTvD8Y5F5wPPuNMelnD0eMaqyK8bMaRP7Y0=; b=iziXZOk9EEIJqnhrls4H2MnjNQ
	QpQdeyIKuEuOubAnwr0bEDy/vFa9WU3m7eRX7HKbbdspT08VkiUGHLllUCWx5p+3HPIsqluGvuhtp
	svPAN9dOahc2573bYxEtWjNzNY5zZbwHD+o5OwwbGfixR433KpafVbh5hGU2ybGgZ1MiNmnFMSp0P
	U7eTGE2oD8qYO5bVSTDf3TL7RhiNF7vHBR9+Ue/+w18o1EfBRzPod1mOOUpWmVCy3VUOr3aGnMpQV
	k/3RuW6nE94mXlHcvJjJiS4wwTzWRbQ4xHeBDW1HjhfLm17UpUeV2Tpp/L3JW32ZgvLe4tBYDrY80
	LAYH8xfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBVA-00000009hjf-2mFi;
	Wed, 25 Nov 2026 11:49:29 +0000
Received: from mx08-00376f01.pphosted.com ([91.207.212.86])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBV7-00000009hg1-09uB
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 11:49:26 +0000
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AP79Js51860080;
	Wed, 25 Nov 2026 11:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=c
	e5JvCWjxkbLgLwIua+N1v3pyOdandUPeaQMGVLon3o=; b=kbC85YzKOQxmNyzWj
	s/Uhoeq9zF5k5wIaLt/ppbiuP1sl6lLeF/YDkPOXZRRPjP1itopWWahDJztxwkMH
	I59ToNLnpeND95Qsa0IddolBiDpI7LjvkUmSCo2qTdZdjKkSdDApdhDxV6Vi9ltY
	WYQsQro1gzBIXLgeoMWQ6YPmCJ9bgQDJ1tM5tqisW7xIwaOBSgu5P6boUw3vjuEE
	kIfuP2+ej9wYL+lqMzv+jP/6dBgHbKFUSLH1LAC1ldfF+RsLjV+TLCoK8KlGqX/1
	DlMGfLklYddB4G6/02doCYu5IxxM1n6C5WhK5LEYUJ4ZennYXByPBZBPZ0ZAxmKH
	ZsyuQ==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4j32ev31p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT key_exchange=secp384r1);
	Wed, 25 Nov 2026 11:48:57 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.203) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 25 Nov
 2026 11:48:55 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Wed, 25 Nov 2026 13:48:29 +0200
Subject: [PATCH 1/6] drm/imagination: Remove get_fw_obj_gpu_addr()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261125-b4-commonize-fw-segment-loading-v1-1-69657fa52ac3@imgtec.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795607333; l=1492;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=8iH000nnA3gLzcQQjDaJ6UCxN6ehPOwjRAQyE4EjKEM=;
 b=mN7vFwAc21jQWae0s5+z1O4jGGuMlVKt5NwFqkeK9ZHApPa9JFMMcAKeePTGRH5u/R5wRwEYK
 TQ+n+so7yXwD3YNMEkw8ngStgPlwfWIdzHUJWujgZfiapBQ/620s8Ch
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX54cMBOOVrI8e
 w1CJj87benYV9u8dXO1NZ1mdTtZT3mVbGbXlld6hHny7LsBY+BokGuT0Rt8McPyMOK0221myw2f
 acHza4qNABulS2hVRHKhxLd+KFiO9Bw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX3Rceip49RCjb
 S6ZTVZDGOHWy62jX/FqCY6qxdJPv5RHcJQgTPHo4svOcVRfHWg81kWwyBVMQN0fkRv4kYgkUII1
 t8Zle5pld0TxZrCDeBAM2jfptk2GEGqcEj+QuN64HjlmWTZdKGF6cTDLDfaejKkxx/85ifaOMDe
 z1CYrcQ0u2Qj0b2mInP77NhEFb2wor7pNI9WRssrv2whk+vFR8x/SVYpMa0nyqy1RB1sCrwNQId
 TOyvFS2H2KiCUSnAOhTMmOA7fVbYS3WDXUin7pz9VEuJa/+vH9hRJLEcgUX6yKxwDbVFyRSs+ck
 oBf/MGaLxw0svgbd5IIbVWzqXOHDA7gvmHJj9adH0lDGWpAN5aOsjMdJPniWU/Oykoyrvoj62+2
 vuSdfXl7xbyiYvCMRV/Z1mHmx2b0E2qAInQSbSli/bLJtzGghe84UE9FE5Hpkl2+gEjRgaSVjvF
 VfvUV2MsM5r01DpbyHQ==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6b06cb2a cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=4EFqt8Tv61wA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=IP9JAmHCEJnWvg-4tKgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: e7lErjGrTsDUT1TlRKWJoI0uaFBTMbd6
X-Proofpoint-ORIG-GUID: e7lErjGrTsDUT1TlRKWJoI0uaFBTMbd6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_034925_373922_71CB6410 
X-CRM114-Status: GOOD (  10.80  )
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

This is just a duplicate of pvr_fw_obj_get_gpu_addr(); use that instead.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_meta.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 38a91dcb66cb..74a0e4d255c3 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -357,14 +357,6 @@ configure_seg_id(u64 seg_out_addr, u32 seg_base, u32 seg_limit, u32 seg_id,
 	*boot_conf_ptr = boot_conf;
 }
 
-static u64 get_fw_obj_gpu_addr(struct pvr_fw_object *fw_obj)
-{
-	struct pvr_device *pvr_dev = to_pvr_device(gem_from_pvr_gem(fw_obj->gem)->dev);
-	struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
-
-	return fw_obj->fw_addr_offset + fw_dev->fw_heap_info.gpu_addr;
-}
-
 static void
 configure_seg_mmu(struct pvr_device *pvr_dev, u32 **boot_conf_ptr)
 {
@@ -384,7 +376,7 @@ configure_seg_mmu(struct pvr_device *pvr_dev, u32 **boot_conf_ptr)
 		 */
 		if (layout_entries[i].type == FW_DATA) {
 			u32 seg_id = ROGUE_FW_SEGMMU_DATA_ID;
-			u64 seg_out_addr = get_fw_obj_gpu_addr(pvr_dev->fw_dev.mem.data_obj);
+			u64 seg_out_addr = pvr_fw_obj_get_gpu_addr(pvr_dev->fw_dev.mem.data_obj);
 
 			seg_out_addr += layout_entries[i].alloc_offset;
 			seg_out_addr |= seg_out_addr_top;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
