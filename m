Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DB8606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oiyepC6A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jflbb6hr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPnHchSI;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEWxbEgf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TetIICRod30YkOqHs2lWrQNKWL6wklciLgWW/PnWAHk=; b=oiyepC6AZ9pv+9aM6A+Gew8dZg
	r4p1HixzHxpQg1w1mzxOQtnHmxT5xUeUkNAm9BRkh1TRvNZMnpdFG56NjxcxVklMxzl90N+mDJIu8
	WuytB2qpId4ArOwl+KbVZIJkxM2YkabKfKuGcstXdN1KkK2MtwCm8LnHLpLmc5Bqcjrdpa+OrCipv
	bzYeZtLrmJ39kF3J4qOshLS2GVg7sqYTK08k9cN58ZRhP6LgVgZOore9Z0PB8bi+KO78YgxpIKSU+
	Q99ES2Rzq1xm6GmtNT4QYyCYoFlkKrWfPooV2lca0WAzq92UVte8d05NMNB9dcJPJkBvJ+69oRXgw
	/E8G81qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbrs-00000008Kpg-0rl0;
	Wed, 18 Nov 2026 09:22:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbrq-00000008KpX-47ia
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Nov 2026 09:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=; b=jflbb6hry4PBS4RN7NK2o5PEi8
	dAbdr4U6aO6wycgDwnLwKxgwWdjats6ZUTDYJuGWIqTAAoLiH8Qv3ckFaOzh57dSL96sycx5Uazz0
	WFOZS19yUHN5gvNLZPs4qqWl7XQW3iruDP5Jk3xRCHvK2du+HUzj9Kam94jtQk53y2Jqv9EH+NsPD
	XcfDZQhMhGpdOoSoqy6f/DgioF4MJnvXu9/Unv8tMPwgi0ghBDRvFsLKMWrvs5BKpOuMQ+FvBXGvH
	whtVw7v18fQY7UxZOnDhTnDPs2sxeB7TXipgfeU3qsJm6ZzbUCmaUZ36EqAkDSHK5kbNR5Yhoai1A
	S1naGwYg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbrm-0000000Fr5i-2CN6
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 09:22:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9KfvZ2896592
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 09:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QRiXeo9zMwX
	nHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=; b=bPnHchSIw7DFE82b6lZrJvQD+W7
	xpwVnP5+/1XSne6m9lc/quPgzd7oayERc7YApJNgv/NpuDEXQ6CFJek8YcRRqfuM
	/FBE5rcQFZ0pb5yDGlMypcdHtCjnjOmrCx0wGP0JOtoOV3pU5GXhtSSyJuscrcKk
	MmSkOXHC8UeqIkw/OfHaaj8ncD+9VKv4GP0Bo8T3XeolnI45QNjGdhNsy5yLJ8H2
	G4DXLrbeVVhdCKS8X/UWDz4TtEV3/u64Zr2LXoL2QzZf4P4MK0CxB1zEulY8Cg49
	51MxkuMVtpj7DLzOOZ1yQBnotWst5X3knTwE1OD4kea8i47N2E8rWdAx9eA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8j9fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 09:22:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso3083110eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 01:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993724; x=1795598524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=;
        b=XEWxbEgfAo2smYRFPjby3oQ6dg47FX3g43zmRmcfcgdQq8Ku2/r69Rze8b4VpiTApF
         z9Lt/lRNRgJDyuxqKHg7uROOu5lajBI1cZOuNI7uZO7S0tKXnl6TyLQud6U/3bqVDdTd
         6Ebm3Ee80IvgEESdPPXT0vr60ZACTFjiV31yu3Fr2hlF/5K70gDLm2cxd/vkeE0YjA/c
         KCAJVnXAmFE8vz4+XMA56YJjhyCuLs9nvRmPS7n9nBkRyv56CLbmRjzZA2yZbHTjp8mf
         wQNH/SIdJ6zucytCmsJFLd5lgkErym8qsiVJftw8ziLzmK14bflfL1VL/tHQBWIECtjK
         uYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993724; x=1795598524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=;
        b=BZ266hS0LLn2sEqVS7btoktVOKhIhb94C5X8uhJB3RiWXnxuacHAI4V/qsbXA+KGX6
         AUxXgcQ/Clt5HGpirzl6424MucHIWnjT4lH7kEtE3KqSXHdycnbgsxf+v9QdSkS4FGLs
         yfnj+OyJXlUBg6JUVLzAwL2G6rDcZWUlm16s9AhpLmoNsLaOuP2wOrPRgjCnhWqgtlp8
         odP2zT7H9jOiEd2QfY+Y7hQVtSCK4+EKb5i6lJAa4PJ7D9IIXlgOSrzLEoJTCSNeMahU
         IxSIu2syzbMO7j7T7GabB4aYN6Fc0r2uId3B4Hzc+Czi8zQgnmXTR7UMfp83D4OgB6OE
         OXLg==
X-Gm-Message-State: APuU4Z8wjPwGkqz3b8oOmqF4tGAmwFiFKlFFXNPU1i2X9lbBASIHfDIs
	iuUqOEDMjqAI7Kcs6190m+9P4v0ooZm+CbRylNDwPC2XnpNScC7T0P3bOfOJNeB+pjB2Ilwrz2/
	jyF0CxUi1j785HmwKq+ZiktVVfB9jG7a1mUpuySKXCZTQgv/8e0hFX8Y4xBMAEfR1myLYRBY=
X-Gm-Gg: AZFdTZd7pdY29Ku46QgYJ0BNilK6Z3kCd7svMU6SOjgVPFQWfTGrpgkdahKNwowWq4y
	i3P/eULzYGb6MjYfnRtQb9hykp4E3qhR6aiOX1zyD4tMVxmc4NKUHpYX7qesSW/wsonU2PCcqAQ
	j55v4UP3RuLhPWpL5VpZDmdgblZ/0Q58hdCcXrXrXdHj4296UYAbm/DQhVOzGsn4oah8Vadg7bV
	CSDKAazYqWujIvi6ocdv5kUVABrPbL3iCD+aCtMUXmHIejbc7XZFjqmU3wCazdqncmmqRyms+ZD
	NMl+tJpFtr3tg3BNcX8E2robVdRDsDz93qVxIu34EsSAmKhP644chYPh24rLpDdnoQp/x50fou8
	dmmBfAnaJlYgVDpOwTPDAscc89fzfuiw4RoeiRDRY6Cc78eYK89/rt+kc9dbLt703ng7JFUrL2w
	hcfRtpvc1AOPX3RVgopOQ5+KVNMSWKE0zVT/eAahBZMV7RheEay242dgN/OZWrhQ==
X-Received: by 2002:a05:7300:fe4b:b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3828036f24fmr2247983eec.22.1794993722556;
        Wed, 18 Nov 2026 01:22:02 -0800 (PST)
X-Received: by 2002:a05:7300:fe4b:b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3828036f24fmr2247958eec.22.1794993722125;
        Wed, 18 Nov 2026 01:22:02 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm9194334eec.5.2026.11.18.01.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:22:01 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org,
        anup.patel@oss.qualcomm.com
Cc: linux-riscv@lists.infradead.org, linux-watchdog@vger.kernel.org,
        prajwal.n.oss@gmail.com, Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v3 1/2] RISC-V: Add defines for the RISC-V SBI watchdog extension
Date: Wed, 18 Nov 2026 14:51:46 +0530
Message-ID: <20261118092147.2017658-2-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118092147.2017658-1-prajwal.n@oss.qualcomm.com>
References: <20261118092147.2017658-1-prajwal.n@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: UVOI3PTwj_D4XelYzrYL6l39tStwqV1u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNyBTYWx0ZWRfX0BcmhTt6pptz
 pYWLzxbnKzPsamLeoCqJ9juvJIo34MCkUMPSBxJcAG7Quhek5qr6SpRvL6X+x+Wh+AQNoatXLv8
 AGYUIZoyU7qPQdBUeldHi/tECk3heI0=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd6e3d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JCsno87Pq3fPI6XBcfAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNyBTYWx0ZWRfX0yYpumWqfb1T
 Tpj6fvyYbQCGvtM/wA7Sf467e67U9pgovFtPtey2uUcOwwX0HQZgH6uXyaEM3WBOJk6MV8ca3kj
 sCyZ3hHKKgE4Y4wod+hQ5b0pt8i9ID1nxkEreHu5VFtgNpYFeUEjcFroRNgzlEH+qK/imhSrcyJ
 Ibht7ieQXoMfYHDi31r7GTbU0fP9qniAPJt6fekSpFrBjnaf9+5oLsyibiUTO+ZSAYUUKyPmeKY
 J6JgxPMHirFpiksVe0yaRTYVxqZ/338upVcejAnEoNTvykG1H+6WopqtUQPvN9fv/vGh7yETeLp
 B4IG+pQk4DzCsdPBlVSCtN+bFVda/2GsL+Ec88jMLU67WMTugYe1CvQ/u7qysUj5M/fpEVTv0v3
 skbgooNddNimiPA7WLXIHkmnThwJh8aGyn4CgyYdrZQkFendJdWV0J621/cDpCoP8QYovgfqNaD
 07pwOP4x6lmy3FFm+TA==
X-Proofpoint-ORIG-GUID: UVOI3PTwj_D4XelYzrYL6l39tStwqV1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_092212_504689_1965E97E 
X-CRM114-Status: GOOD (  12.24  )
X-Spam-Score: -0.9 (/)
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
