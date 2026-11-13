Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3A5606A32A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ssEPyrOz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FrhoC+OM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SY/D6qAz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TetIICRod30YkOqHs2lWrQNKWL6wklciLgWW/PnWAHk=; b=ssEPyrOzcV/Qvmm/VznA1DuX3t
	c+UnVje5a0vD/4TxAASpqefFK2BcPvBTmPVBU0ca7WG2tf3UmQiU38K0CgcYaQv/ckkQRGupBYOao
	ab/XOvpaGmp2nZTx1aNfhwPEc+wwFbRaafQXkHQZ20TgBcttPGDPIXPBtQpm6JSEgEG57d3G+yEqV
	kpkK4m3jmBKzOeWMcJAJ54462ltR0Z3apVYrNwqnjOsfNKNk8wAYxBna8vCAyAo9iK+6dS3wsnVya
	EdOGyGeZsVn6mcf9mniDhcq+QgJxCcC8IrCRA1GvMqJVkjY6M969mp41FsTk1x6K0BftqV/rU80NX
	I2XLJTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqG0-0000000Chjm-4AeD;
	Fri, 13 Nov 2026 12:19:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFj-0000000ChY6-07GV
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJTdl2796700
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 12:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QRiXeo9zMwX
	nHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=; b=FrhoC+OMLohCAfHhW9LHtnY0nhn
	tsSnndN5ygSt0Ud/df2WDrFtHnl/Q4LJHMiwEeNMBbrQ3+neP7PM0STflzcYG1/t
	dNQ8gDrvcSkjMqT0ibPFnF4sVPKtuUv73kVcO6JHHxdHMGYShDbReoPoplyNIQAt
	jyPo/OLqzpBFiDiblRab6aICcFpie7EJn5rc0EQP9mvv1RewMrO8KKAK/wQasIw0
	5WVdodYt7wbnjoFBTeFwmnvHmW4i6Q8GusSs90jRLxqCenC3hZ4RFoA09+RNnPeH
	wbqwuCKiSq2n4jRqS3uipI4W6HUToR++cP5bJ/jmkKZmXlnZl23mimawKVg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6s98a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 12:19:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1006384c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 04:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794572373; x=1795177173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=;
        b=SY/D6qAzX61vlou6YBx/yvMd2pg23+vdWKOSIwnFV5tC6+mwG4ElZWSMjAexsEMu2o
         hI7Vgbl6lodZ1IvtmsJc+QKleTk58lsSDO8AOgwWQFRbmocqmCcxeNCRqenjIneUsAY5
         IJU1mY0MfKGgIL0CtCvKTIP3+s6P0rhgRNDt8hezERTNkpP+/em/usCM6c9OG09Nybym
         qZawz5R8kwZ3KUHi3xQeLVgKFCINvbmU1vcd0Wi2E1j9Y+wf7VBwygkoOOn8nTwmRZEl
         YoW3T8X14ad9rM7eZHQvE9IhFS76EPF90U+iwzeUdhS2xFfYZhJo2jtG9IzKAKvK1ynY
         piCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572373; x=1795177173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=;
        b=iCfMtb57ITOb0OQJcNCEVloIA//hY8o1xcjtELKfWe0RHZmdxjIlLrpBkt42QPj7zj
         /r/ix4Bp+uqagCRyURlgtBvGeGtosKozla9KJNI2wyli5z10XZiBBWFWdF61HZfS3DQm
         ZZobu+mHJEwce/NTu++O2qosDpKDh5iuM2SoHn5p8f2a+72NK11lmX0ygtfq1hzP4xfW
         gZzvpT7pSD3n+rPdz3i1+XhSwnURnY/Kk3TGvuUp53F5dHFHx7PicQZggGd5nkc/cF7T
         ZSgzlHs0TEtBPnEykBeJuYMJInbQVDfOp5RSVrhqtNKiL3wnm8rau/KMPgWhJUujVTxh
         NOSA==
X-Gm-Message-State: APuU4Z+iP6Cv4jWMIZ6vsMZvHWHIv7FokgK0PEjqaVGe/vIH+/fjv9Bg
	g3zVvUxIAq/EeU1FZHncIDEbZIfbySWZAtE6XjwpiKQRZaW7qV2AL11qaavSBQreeGIY7S7Sxd2
	9FKjbil+8xYivZCIxVDgaPISFt9KRrxDr0IROWWeZOjU9j9PLwevL+6kIo/MgIpYvOAKLyUSWRC
	6u4Z4=
X-Gm-Gg: AYBFou2dP/g70sNqEmNvaNCEH4ACiGsZ5kNNcVs7y4AgDFCwXvZwpoOEyDNNRtwzxnN
	3K5Y313+YYECZ+pf9UZGdn2bDHiLCThcrcx1kyUm/iYlGl42+Cz7859zJMvveYDPhv0IWa1N7Jm
	V7ISX3JKELTcYbXXZJ8hjemO0Scj0eFi4HIO2hsvkxG/FuYI4qSpggqV2FUJyC4PN4GN8je1CVJ
	g5LiItZnidWUeQ9BM0gflkuhEndGJCN0ZkLCBcsrJJEleuSF1oh8EnT7hF+Aj7mc1qyQ0k5jf2f
	Emn5nEoH2pfvsoReBcXkbo05Qrl2oDPV7labxpX0aUGi1RmF8upD+waq4vmMmPa/JUbLEU2WPw4
	tpi71O1N9ZpkEFG4x6bAcA7gWBv5yliT2rwGXFShAVnyjSzfw/Y1zofiW7VSQNAmGrRt+h5WM6M
	aeMfM7DkURIEV2Iw47YR5ky/wUJppqkwx3r1jAnNUNApjPZ2yaHDNZCk6FdoRT
X-Received: by 2002:a05:701b:4210:10b0:199:e38c:29a0 with SMTP id a92af1059eb24-1b50312e577mr2414317c88.31.1794572372709;
        Fri, 13 Nov 2026 04:19:32 -0800 (PST)
X-Received: by 2002:a05:701b:4210:10b0:199:e38c:29a0 with SMTP id a92af1059eb24-1b50312e577mr2414297c88.31.1794572372124;
        Fri, 13 Nov 2026 04:19:32 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm6423629c88.7.2026.11.13.04.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:19:31 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org
Cc: linux-riscv@lists.infradead.org, linux-watchdog@vger.kernel.org,
        prajwal.n.oss@gmail.com, Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v2 1/2] include: sbi_ecall_interface: Add defines for the RISC-V SBI watchdog extension
Date: Fri, 13 Nov 2026 17:48:56 +0530
Message-ID: <20261113121857.1640918-2-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113121857.1640918-1-prajwal.n@oss.qualcomm.com>
References: <20261113121857.1640918-1-prajwal.n@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXxqS5VAGCJy2X
 vri9124U+23fmce35sXleTlJYZoL/H/qW0hxM1TsJaWeXA1M4ZhZX+2yL2GwtMSatZEGr2ss0hg
 cQbPrQ/q6dDPjq+YTiMvJAmDYBWx1E2WUi6s0+plaiMRkNOUG2Ay9/egNrAZ6QjicKg6hH5RKj9
 XUcKN7IqAcxywMfflZLzAjFHVnYRBCIxbrT03sN81ZLXnKTWIy/iagvASTZpwTI4pIvwi22b7mw
 MGZyV3QXzhTRfAoGfKp9I3wlftI+NlECg72fP6bF4KnxYg33ZJXHMJFcmRujIhdaqWUT7dC1Qoz
 8zMu+tePUiIYZ6DM6dbfBFKpjjWu8t2VWNz7mCnWc8BIi5lqHEgJnCSa82+Hkw12srdvIiJKmWN
 pcwFUm+EhrblAkLSShlqbDS0G8PEgtbWG1lr0s2TDyEm0MRiihwbUY/gqwcCJtWticxneFqoa6d
 RgqZN71MSPsjJkmC88A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXwHS+P549TAGE
 7HSppjb88KuBDjbhs9e7dYOOK2fLKm+fJCO1aRrtQpD7Yy4yCuDQrS7h/mxHFfN0e1S1ZbBF990
 UbH5hCxJ8A+b6gybgpTTK7il5XLDYqo=
X-Proofpoint-GUID: NiKv0UfUTASPei_u5H9Xg3I_w9Voha79
X-Proofpoint-ORIG-GUID: NiKv0UfUTASPei_u5H9Xg3I_w9Voha79
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af70055 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=JCsno87Pq3fPI6XBcfAA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_041935_200822_B8006A9C 
X-CRM114-Status: GOOD (  11.47  )
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
