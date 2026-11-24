Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1F606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IIB4zABS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkUfu4I4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E+Y5Wkny
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TetIICRod30YkOqHs2lWrQNKWL6wklciLgWW/PnWAHk=; b=IIB4zABSwIB1Ta1r8DuF4E9KFW
	PX/UtLPZToG8BIMkZuG6vVQTVw+a8Izys/aOtfAJISSLLogyV0moEUa2n3hS5nurR/vmks8srTcoD
	r6MpNxZ64FNptrDqdyXmQTNNBGwo6xFfVIHIfa4ZMA3KE/WuWP/ylCoLObMgYngVum1ZxsKY5UTyT
	Vx6f2eAzUP0/gWmybHfMbPtzvd4k5ab8UcB3K59QIqekq9/O3bX8IKmxkPbK+twJcTCCx+vBd1VmK
	9Smsuwa8RGwjlLAFB+zCgPVBMqEBxOBxo6GXhYp0aQuDTXU+c3HO7W78JFPVuTsmuOLlsSwHfW9fr
	OtDp63zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqNd-00000006bDg-2Cfh;
	Tue, 24 Nov 2026 13:16:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqNL-00000006b6w-46N5
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 13:16:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuXdc1736802
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 13:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QRiXeo9zMwX
	nHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=; b=RkUfu4I42DsQVz0A39abPrm8qSQ
	HvPzDG/XfgFBHW8ORhh22QDohUDYyar/ea7BsedscqAZHUbxNcj+d2hKD0IhXgsV
	t2wfvCrKNPalhhgh8ng4gC596NYnOlglUUmzzJ5i758YcMQh15sjPWOP2DkCXWVa
	EjncaMi2Zznb8N3k3Lui3b5JNESuipbMfSpP+Te3MIiXUHseGS7Pb/BlZG+7s1wO
	6lvo6ZCpg4kAVDkb3Hb0G2GuC7OVTe/TXWoVP7RCVi8er5Lmb3nyhSJFdg+G2UPf
	axLShUD56m6DUK72tVhimSq0zxGlXaaXbH4NM4XDwRkKFgcJIligFfZX8UQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2vxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 13:15:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so4178147eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 05:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795526158; x=1796130958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=;
        b=E+Y5WknyIhuxFS1fKUpVnkQXv+/7U4RUVgN9UINpvcDh++7621SFfmB1FjymeXdCaR
         Aa3sLgWpgWW1VDsjrzTBDARY5gFvHBFyL8kz2DNmmgzmjFHn4cr57ctIC1VpsZZyGloF
         UNBBkJkT97jFcdDjjMlSRu8IPoaXkWHFkT0uaGZ2krAZtkTDFzBbabEXdbIIrjVAOLpt
         93eGzs+Mt8WeXR2h6V0drNzNgEAIZ7VS1TO1c1CMKrI/VOO5k0PhEeTpBT6rNYlUSYYT
         70dlzSVgFCj+TY6ApvZnPgMG1i5L/KNKAonUpBkSVZan0WKKdhh78rLCUXM92cQU5hAz
         CY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526158; x=1796130958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=;
        b=v20Q+e/jRnC7vhzAXVws64FD/eRUc2Uo/1OUAD8QB5B8VuHGbo4UR7DZruokI0AUGI
         JrmP6BfwSvfz/kMj5ul+Nfsl5UedzB3SmPG6v7XFQSuvF6WDi0VMx5+C9MiZ77LphoDk
         11cIE8eLx4WF3lC/AkAqYUND7XNZo2bPgKA0AlupOomDfSyJzAKFBmnR+0/J/9XxewHw
         NeAqNGO8K97GREhdRS+QB3QwyjptgrQeHFPJSdrTD9xK2ZqXsPg/Ysa9HtEFyFu2oJFk
         n/2kiBYE5BsjcRLvPx6cRZUPeD/gnJX4cjtuuYU50/hAtZgLchF6Ki7MQu35EvGZ8sTo
         /vpw==
X-Gm-Message-State: APuU4Z+H198MFIpLNi+Dv5sLsTrdz4SAq2edG6sKsFtos4n0OSZ4KuxU
	5jzIWvonqIfLc3/olBmRDGIpcrf2ymhWnhRV6zseJol5kPvr43hhdzKnGu0wRCUHpiHJXTFwG9Y
	2ShL+D+zYdpg5GAP5XIdGqusnnVlYaFyhv3eh4ZEV66ZxlezsLxnoiVYfoUGIG6WCDxyC4YE=
X-Gm-Gg: AZFdTZdW0cPtP9Dg54LCa1ruzql/OsJTWvPUUGaxrZ5s0Fjl0pWw81CcEweBoH0CIoe
	Vi2lZrgLksYPYh3+EIdPybPyLswO+lJFZTmFK8S9FV5BdTZOB1fIIa52JOjIbeywOG5xsFUClLJ
	Urwnz5vfDlUsCxxoOY2xHIMd20sZpS/lGxqIg5lQufBVX3oVzT8u9sec0SkoZicRWxMngsoU7in
	taVsBcjgnSGswRzCyYEnQ1HzWPx03IrmBsCy7v4LP9S6StMMyEAnQZZq0NBxLLyRwqWjER6Px14
	9yr3a+Flzi+5dWQN75QVsrCQm/CbdMm2UM8mTXJggTXvZLnvs6zRZ4tuwskbUCOmK9NZ+BpWYoA
	3Vtt8kGVv96AtBlanNmoxJZAih7tcgT9GFLzvevPv5/CAd2nKukxv6O47sLAsSotHhlkzgLamkY
	QsIHzMmUdKDiMLMG0axU5vu/POZ7H5sarFwR7bN9znJYwIGYSCjq3qitklK1CmCQ==
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr12860634eec.2.1795526157540;
        Tue, 24 Nov 2026 05:15:57 -0800 (PST)
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr12860609eec.2.1795526156998;
        Tue, 24 Nov 2026 05:15:56 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm56371320eec.4.2026.11.24.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:15:56 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org,
        anup.patel@oss.qualcomm.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v4 1/2] RISC-V: Add defines for the RISC-V SBI watchdog extension
Date: Tue, 24 Nov 2026 18:45:41 +0530
Message-ID: <20261124131542.613271-2-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
References: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b058e0e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JCsno87Pq3fPI6XBcfAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfXw/dBWpX1E+Ri
 ozAC5nR6Frnh0hM27b4g8u3Ao4tZCyu06siJCV98v9IsZPiZm5iUChbmSQRLyhc/fjNOZn4XWjF
 5QkbmkDkDWnG99fPrHviA4pFtgDSQtBgwWcrgdlSSK1zRBI34KX2WJ4e85DRvWJP6raq6pBD+sM
 x68JxZ+D5nRJjEqEuDKNGPE+gTNXDMRedI3MIiknMHJHLsGkRNBYparAGhTY6tuB8OfvIwe626p
 tEXrmrCcF1nbEQJgpkzop2kWypNyLfX1/ixTB9HmQbiBU21h9LGSZCTY/GphMkHNj2alRC68wur
 fRJNdzOsL+bRq8AQs/OixMlVzm8UUYUSsW3SKQBXJESSmLlOuAuHIu3/NYrNYKoMl0hT4rNs1SG
 oM6JDU4DUGUeVfSHhGkaLYStUDdgsXcZac2L6jS4j4E1iuN9s6gGdgO6+kVYmgm2P4PGu8dqua8
 QX7Q3UxBykj5F2dsNRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX2KLAMCo2XscW
 mWCKjtnRoGQasENAIxucRfHe8tiVPl9Nap0zuUEA4L5tw2y2K8fw86soRkjUpnQf4xq5FBB97ku
 cu2UlTJF7jWemelAiARgGBWkm7CUn+4=
X-Proofpoint-ORIG-GUID: dAD5nmdDM9Nu5owTIb8QUnsSKsiJlG-p
X-Proofpoint-GUID: dAD5nmdDM9Nu5owTIb8QUnsSKsiJlG-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051600_173693_11041754 
X-CRM114-Status: GOOD (  11.87  )
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

Add the SBI watchdog extension ID and function IDs for supported
operations, including start, stop, pat, and attribute read and write.

Define the attribute IDs exposed by the SBI watchdog extension, including
watchdog capabilities such as MSI support and configurable watchdog
parameters.

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 arch/riscv/include/asm/sbi.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index fd6266a7b339..f2b0b0c9f6b1 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -40,6 +40,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_WDT = 0x574454,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -536,6 +537,31 @@ union sbi_dbtr_shmem_entry {
 	struct sbi_dbtr_id_msg id;
 };
 
+/* SBI watchdog function IDs */
+enum sbi_ext_wdt_fid {
+	SBI_EXT_WATCHDOG_READ_ATTRIBUTE = 0,
+	SBI_EXT_WATCHDOG_WRITE_ATTRIBUTE,
+	SBI_EXT_WATCHDOG_WRITE_NOTIF_MSI_MESSAGE,
+	SBI_EXT_WATCHDOG_START,
+	SBI_EXT_WATCHDOG_STOP,
+	SBI_EXT_WATCHDOG_PAT,
+};
+
+/* SBI watchdog attributes */
+enum sbi_ext_wdt_attribute_id {
+	SBI_WATCHDOG_CAPABILITY			= 0x00000000,
+	SBI_WATCHDOG_STATE			= 0x00000001,
+	SBI_WATCHDOG_MIN_PERIOD			= 0x00000002,
+	SBI_WATCHDOG_PERIOD			= 0x00000003,
+	SBI_WATCHDOG_TIME_LEFT			= 0x00000004,
+	SBI_WATCHDOG_NOTIF_TIME			= 0x00000005,
+	SBI_WATCHDOG_NOTIF_MSI_ADDR_LOW		= 0x00000006,
+	SBI_WATCHDOG_NOTIF_MSI_ADDR_HIGH	= 0x00000007,
+	SBI_WATCHDOG_NOTIF_MSI_DATA		= 0x00000008,
+	SBI_WATCHDOG_ATTR_MAX			= 0x00000009,
+	SBI_WATCHDOG_ATTR_RESERVED_MAX		= 0xFFFFFFFF
+};
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
