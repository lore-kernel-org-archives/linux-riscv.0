Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF510CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwElG1lECxKZV2cD7xw0cjIW4vuf2SnQr6gQ6ggXujU=; b=1Qt/y50CSo8Cts
	4KY1UCvSm/+laECzmW6MV08c0NgQgWSIkl9PbbnboL4ngWrqK0At3EY8/y1xQohXXFBzGK3reD++L
	b+5yzm6KoKukxV5dFCcIHF25L6he0T8aXOkPe1PQE6A6vvDLnwQqxondHnGUkYLeGRad5SKywcHcL
	UmLKvZJ+35Uz75e66pjkaV9qNZUSwpDzKwLPPYSrcvPiiPNooC/C+ntJdL1it5erGWJLfCrf6MDHn
	al+1kSQRR+AT1X9o+J8ArKCulQ3/cVD/TlIdrxRZGW3T+g2LFA0bEsnJLZUKs03uEzS1B90hF76Pr
	8Q8I8CnbhsxylrZ2+KHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgH4-0000000C3KY-0f0A;
	Fri, 02 Oct 2026 16:38:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgH1-0000000C3JQ-3AkG
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:38:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FH8B42823399
	for <linux-riscv@lists.infradead.org>; Fri, 2 Oct 2026 16:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e6P8A409W54
	xuekpmuoPC4b08ic6FRICkqYkILbMjjo=; b=p2MstG8CMvZ02YFurKyDitqM9nf
	U2vCwtuCzEBykfyi19gxp+QnUJlA+lzWLq5yzznJaj5foXNCKsPKoVJwA5Whai+P
	EPIxLvhm34VMeQ+jzIU2KLkyeX6kCLwJz0cQWMwfMRoqgykMznozDbdRKXgjYD8A
	FOVDQAxgxe8CjYkvDhH5iqdxKGWp0LCehxtjqUzL95CdjOpx9zRCJ2n3kAMFEWdT
	ft379YP35M76qZPsyT3lSOvIIphQrx7n0E+x53IMG1StnFSIdGSaIDNfILZsvtAu
	MLJlBRCNMLz5jwE2cy2FknluH1BtpHRPxHmb2b6wQPMHp6XdQXi5u2+tX5g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp2acc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 16:38:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso10762556eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790959095; x=1791563895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e6P8A409W54xuekpmuoPC4b08ic6FRICkqYkILbMjjo=;
        b=V0JVwj5V4wrH/n7IL4EfkHmRvXH+NVMoXWGD77Th+JkxBsw88U9S3ENJ27HxwY323X
         jII6hTB7MTmYcCKDMmecQmYTM5PgJhqz3EL2gHYcFBGqCK5q0OlxtNl096m14HrQRc24
         bS/pSiqLzdIQyx+4xdc8AJAaU5hDZdhg4+Dq9hCve2+gqfZOP52HucPXLf/Zqw1ait9Y
         mJ2JSw6wqV07dmm9S/K75ajHTNY6xie07jtlkhy2i0F6b40X4sEy0D4srRpBzH4jBXIQ
         lnaVuxdyhwVj2wJkt0ltRHeniiK0C2+PL2KTBllyeHj8pvwCEAAFoGrJZyLFZTiiWOIm
         zVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790959095; x=1791563895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e6P8A409W54xuekpmuoPC4b08ic6FRICkqYkILbMjjo=;
        b=QDHZyVfagWntvA3MDEmfKshOEGcid26L/r0BIg4gdSjBLe5viD7u9N8xp5x50hQcnC
         e27eOe763HoqouSBrOe5WSCYb19DcBdWJeG6p/94DIOHFcLmrl7g2KUmxDJVg99ZSTqV
         RKg0d+7+b5rLkU1Z2a8cKb2DKHBiztDg87E7Ep469pF0kZ1fPtNANMfl23pVV9vPV39O
         Uuo/eV7hAw8OThKj3XulGlNSmQQL+d2YrKz1vXjmiN2/HWKpVwUuvkPgfgoFP5YruEIw
         aXYhAKED/QDlg5bUWka3cBIIWypnTrJFZBXUwAwIqzCBlrjsI7WX6ZuOikWpvwv+FKfL
         JgFg==
X-Gm-Message-State: AFuF++kHCoWZ/37VKv61wJceQqfKN3Zx3ihLfzxVa6NhlA0JOzYbqimQ
	hYjBDZ+Em0tcM+DjdVQpwtxsbR6rYJZmRynp9a27Bn+Clggjs4WdpSjpiJbre3ihUzUD1vOwEVl
	p3qleoNKe7kHBGsH1GbF/tenBuYkHfzmcWzEyzgpXGTdd2+7EyLace6nJEm3IkQmZQAQo+p4=
X-Gm-Gg: AYBFou0NQ84zVUtOmrtQNj3WfP7VbrVxa+M9EuVKJuj0CBqvNxm4ShfkxIyvza7LQZW
	XPhEGB3V3JzbS5ZlpAZVWXZfu7wgAuVHhfZBFOI4Mrjdx14udrxRWHdi0ss7RKzACTQmmUhWmyc
	3+OJwUjCc+KI+wN0s4Xu55nhYpMAVlFXs9ww9/g8JsO+xFMZ5MriHUXMLYwVI/I0OsSrwBHC3Nr
	xej0T5+4jCk3buA/lLcKI9GN6dcC9PJ5gjW0XIPyyHIDj5duxS1gw8XamRnx1m7spE9UabxaTJM
	Q1IiEVC0+xAsREmI5bBcMPXzzMsjQkAp2UiCWH4vXrzmgLyi1i9EDBLVZCj0hfdVdFw3ts161qc
	wWS3MTpD/zjU2aD66jpGbk0Fkj2cmwbnbcTTOb/35E6hCGAWLDpl/9NtK6HAprsdutm9KpPYRKA
	k8hwU68wbLpYR8
X-Received: by 2002:a05:693c:20c1:10b0:351:595:750b with SMTP id 5a478bee46e88-35105957899mr2170001eec.36.1790959094486;
        Fri, 02 Oct 2026 09:38:14 -0700 (PDT)
X-Received: by 2002:a05:693c:20c1:10b0:351:595:750b with SMTP id 5a478bee46e88-35105957899mr2169976eec.36.1790959093938;
        Fri, 02 Oct 2026 09:38:13 -0700 (PDT)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fd5620sm7756398eec.21.2026.10.02.09.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:38:13 -0700 (PDT)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net, anup@brainfault.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH 1/2] include: sbi_ecall_interface: Add defines for the RISC-V SBI watchdog extension
Date: Fri,  2 Oct 2026 22:07:57 +0530
Message-ID: <20261002163758.2919372-2-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002163758.2919372-1-prajwal.n@oss.qualcomm.com>
References: <20261002163758.2919372-1-prajwal.n@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6abfddf7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JCsno87Pq3fPI6XBcfAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: qdp6unf3K8vF0pU6iadRoicSTsCjdQ_T
X-Proofpoint-ORIG-GUID: qdp6unf3K8vF0pU6iadRoicSTsCjdQ_T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX1ySx39axDuvq
 O0Zr7CRnQUcXAnJzOJAcUevTnd2ybns+bsYFHCdYSbqLpUslVgwDpeAq+fzOBpsCgeqgBrIO4nB
 l3ntJzpFRKhscY5rST4sX7MEnjq9j/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NiBTYWx0ZWRfX47G64dAOKAqB
 PZM2zZU0wl4KjVQb5e+TW6NwrDHNCLz815siq/BaMNRDdKxYvo8JvqlZOduxQ0pXaZKd6Vb/E4Z
 cjZyMWyDWlUP4Yhm3ZYgC4MIUzK9p7UV/g/JjK9J/gJIKEkKn2klUwioKe5r/fsfhCuUsaYxfPX
 BauoBrfDpJ/iNHiyUHtNOp0A2zWVUaqRUYw54CoFuDzGpfTQWuyXd5PMaiUh2jXuXdtP9PUrp13
 GMvJIV43NpNPdZOt8bQ0Mw8syU14sVm1vI1hHDI9lAF1jogpSt2JkUUHaEimN8V6A4GwHlVtMiU
 wowJGJzyK8f0UVIgq4jDMgdlENW+TR36a4TTmJDsiOaIald/sh8zfGmKEjg2nvgT4lI/sUC3t8Q
 VC00qruYr7fzVtfbkTZsDic/hEGKVfajBoNQTwW20NepZqWgflKAMT9FKyoC3gXY00xvemCCB8T
 hBesbMRHUkJ4rgv0KMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_093815_800379_E211A9F2 
X-CRM114-Status: GOOD (  11.65  )
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
index 5725e0ca4dda..b67ee507c517 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -38,6 +38,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_WDT = 0x574454,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -534,6 +535,31 @@ union sbi_dbtr_shmem_entry {
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
+enum sbi_ext_attribute_id {
+	SBI_WDT_CAPABILITY		= 0x00000000,
+	SBI_WDT_STATE			= 0x00000001,
+	SBI_WDT_MIN_PERIOD		= 0x00000002,
+	SBI_WDT_PERIOD			= 0x00000003,
+	SBI_WDT_TIME_LEFT		= 0x00000004,
+	SBI_WDT_NOTIF_TIME		= 0x00000005,
+	SBI_WDT_NOTIF_MSI_ADDR_LOW	= 0x00000006,
+	SBI_WDT_NOTIF_MSI_ADDR_HIGH	= 0x00000007,
+	SBI_WDT_NOTIF_MSI_DATA		= 0x00000008,
+	SBI_WDT_ATTR_MAX		= 0x00000009,
+	SBI_WDT_ATTR_RESERVED_MAX	= 0xFFFFFFFF
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
