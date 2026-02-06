Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCEBECD9B8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FURzrsYBe5A4Yar08fpmV9anoKgsLzhOv0S/laRFM1A=; b=1WrwrAfvn6queF
	Lebh1mON/O4bYPjrfIoX2mEcVRm705QEkx0GSfVsT4ABTLxSzr+9xhnvgyCHULBGnsUVCT+geXUGk
	tAae9y3WJmZJXG/RauADEQubLLSaBngzd6JfM5r20srK01ViRAKa5hlNKyslzuVeAQ+N3vXZfOpB/
	uhWDbDYINQ2Aw5IwW9hO1eVQ3y2+TrCX3X6yc9yExlQ5PzyFrfiQG/Wf46lexD1XNC/GYlO/36Fu+
	AXqcQ0BpemTq+cKB7F9kk6u4EHK+wapZIn5fS1MOFFeFXU6qSgmMrDOvHHRhqJU/UeWIVvEYmZfLh
	MAwyN9Fwwf4ZDPvNeuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dq-0000000Ae6f-0wrq;
	Fri, 06 Feb 2026 00:24:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dm-0000000AdzZ-0aox
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615Mjp3m890638
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EC8ltA+v3Xo
	ICkCO8yCorlYHScSXDLet/dXbz3KfPq0=; b=cJRSmg38JMOuMdntpO0GmYUfe3N
	vbKbNGdtb3YYMsf+NOyxBUxolsBt6SxjvkG/96Ll5THqwyMHNvLHcLqTPHnA1Vip
	ySPVKSra82PlaBZ2j5LcdfEuvLy/7URed6mY2eI+6N9dXo4ykr3OD9coEPECyLbv
	10fshGtW67v51yCXrPS6zPp4PC8eE0F+6eFOkgFRQ646FdpuTW1+zLQoxKUORBzx
	TAKpREQy4XGu6AbCrIftWpOwDc77r7rUKtXwzyBdW/DTRPsdO8+X8l2VUb0LRFo+
	n+O1ikY05wWRsJTwYN6HtanS0DjcARZ4e7V+rnCWH3qbMNWNKgmPVridNGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prxb6xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b83787af4cso12716864eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337445; x=1770942245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EC8ltA+v3XoICkCO8yCorlYHScSXDLet/dXbz3KfPq0=;
        b=Th+qIHh/rf+7CQCDOAu6QrsB59fs/lZOJWwBbRZYUs6iPBYv/MYvoqB5VzYEeW25Ft
         xsYOoK5OJQ4oJJS1P92aPxi9X2b0J4aDeZ57Nnp7HEz6LH8DIB9lvbwsK4XBe6w7D4Iw
         Bx1tbpLliCzuBrOgA90xG3ioMjWaRsQ22svv1TAOmEDsxfBscl8FTPv2PvzACJL0N/MZ
         B/MMN8+BSjk/pfXIxpE/5SfptfLGiuQf4VASVeI/fNaMpJj8ZguGyFAE8HEPOgfk5+Yb
         gxdPhoXoKCA/aqucx495YK8tGCM2+P+pCU3okbpwl9Sk9XvIXfxh1fan6e6lqXjYX+OQ
         8YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337445; x=1770942245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EC8ltA+v3XoICkCO8yCorlYHScSXDLet/dXbz3KfPq0=;
        b=BDFBUSlv6SADi7He1vaVknpQCqTgDuYTGKV6X9nMubFxVgUb+9To9kvEZ28CJy1O6F
         kXiNFs3Qqv/jQz50NRNBDT6w/XBJppExDTCCQMetnCWtNlKWfOcBUoACkHcjrFb93rwD
         DWCq1JpTLoefjUrgViBsKoSKYQiNC7Vc1iGZBC6jBxETSWCLsZmr866FJDTRTYUXToU8
         oO+lANaZkDRkR3x5k1chFIWvor0W0s3lRu7mdp7BF3IUnqzP/5DmhebQaXTioC7In1Lu
         4oSI34KYLMLnX+cedM0SZpvijLRmd4R9huzOl/ipwcGdLVlOyGZI7XP5FFSXO4yHt9o5
         icdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2Kkz+7Y7TigzxGmvSwz7hW9zowsUHdNK8hGyk4bxt2BLcoi+jeN9mHDU/G9H8DNvYs4/DQP+X5PAnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzacwVldrJaIkBRtdxIezzfyXGUGsK3MmFgFXCEZRlsC5wMb+CI
	6c9VS+3Sw8/IkX/C5QTaaYEBPn/c0M5DLkVGoOhZS3OI/nYa/lLpGi09HO3sR/IT3hSzQFC40Rs
	CMu5RwFDIL09PA5Qzwy/23QGRb/yV6+2JHtOSFZXpJvwF+iLeBNjxY8VM1imAPncqZ0/MvAo=
X-Gm-Gg: AZuq6aK+qZebpD898xHgYD3uFJmCC2JkbGcXpAqg2zJhDYwGK2wkTJez94spNP1mCnj
	54+SOR1KOUpXNCgttNvXD4rx0iGvfLzPNMl0Hzad7QdK5ImAxlDmAo94kfxbY0tVmlYluSlWbqN
	LYAc1m9LrOQ5bO5R8nrd5kgfmg7QK3GU28CO/Dtx16AsUpNVHGClbvPd5ZDiDJCvBUh/LBF+5kX
	tUmoh+2CRrQ+9mgBrISTRI9oS4WRHoErKLYywbC4gMY1eEc7deDzENU55DAOwxwxIm8+0Eae4uk
	YdfFsggVkobwMdaCaDRYpOAwAYuGIxPBcM02uFSQsK2YOwgs3BVhokRk90R3e8c5bH2hJKoGnG0
	lAzQ7uHX2a9wGSE649SU=
X-Received: by 2002:a05:693c:3105:b0:2b7:20b:50b4 with SMTP id 5a478bee46e88-2b8564995aamr446335eec.19.1770337445028;
        Thu, 05 Feb 2026 16:24:05 -0800 (PST)
X-Received: by 2002:a05:693c:3105:b0:2b7:20b:50b4 with SMTP id 5a478bee46e88-2b8564995aamr446319eec.19.1770337444543;
        Thu, 05 Feb 2026 16:24:04 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c7f5fcsm588702eec.29.2026.02.05.16.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:04 -0800 (PST)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH v1 07/11] riscv: Export have_user_pmlen* booleans
Date: Thu,  5 Feb 2026 18:23:45 -0600
Message-ID: <20260206002349.96740-8-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: jqtr4qg9vwkfgi91t0E21J0f3XqRIAhu
X-Proofpoint-ORIG-GUID: jqtr4qg9vwkfgi91t0E21J0f3XqRIAhu
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=698534a5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Z9wp2c3QuIO3T_A-oVcA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfXx4vQX/Jov9+1
 qf+cZTR/Lsu/WhiKVA2SNox8Zp+1SLlbjSEupnQ7PoEdwansnelw7CMOvjpXQmqRTG05LuK0glM
 Hq9Z0NNvPvggBHpBKmQsjKICYsbUC63j4TAWQm3m+lnCW0kyPg9Xq0679jpwEgsNALxS5KJzzBg
 Mf/vBmaofdZNLn9a/jbR7kx4PnXkrD8doJbWCeRmtv4w79N1ktYg5mzgopHeNOr2OTDsR/NkjvY
 b6xIIqAStpl1NOTzuEpcfhTEMfKMNpbXQe4E6FWbG/fj4R5i0TJ67Qjb6Ef1Tpbnf94h6fbT5f/
 1Sbx+rx1Hqw5DoJICK27Yu/PLQ/SxP7fxzKvmiZMjUjN+utuA/wYMD1Bp2MsWDWG3HgCnOL3P7S
 JDiXyrQZ2IxKl8Pe7BweIyDZoztkK0CNlNCmHLJFG2qyB51TH4wEVvxT12iVUihN9my+tIlQn9g
 SWYllSAhUDCvpfMQSXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162406_181950_198E3331 
X-CRM114-Status: GOOD (  15.31  )
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

A following patch will need to access have_user_pmlen_7 from
another file.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/kernel/process.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 31a392993cb4..4fa14aff7f8d 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -274,8 +274,8 @@ enum {
 	PMLEN_16 = 16,
 };
 
-static bool have_user_pmlen_7;
-static bool have_user_pmlen_16;
+bool riscv_have_user_pmlen_7;
+bool riscv_have_user_pmlen_16;
 
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
@@ -306,10 +306,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 	pmlen = FIELD_GET(PR_PMLEN_MASK, arg);
 	if (pmlen == PMLEN_0) {
 		pmm = ENVCFG_PMM_PMLEN_0;
-	} else if (pmlen <= PMLEN_7 && have_user_pmlen_7) {
+	} else if (pmlen <= PMLEN_7 && riscv_have_user_pmlen_7) {
 		pmlen = PMLEN_7;
 		pmm = ENVCFG_PMM_PMLEN_7;
-	} else if (pmlen <= PMLEN_16 && have_user_pmlen_16) {
+	} else if (pmlen <= PMLEN_16 && riscv_have_user_pmlen_16) {
 		pmlen = PMLEN_16;
 		pmm = ENVCFG_PMM_PMLEN_16;
 	} else {
@@ -407,8 +407,8 @@ static int __init tagged_addr_init(void)
 	 * Assume the supported PMLEN values are the same on all harts.
 	 */
 	csr_clear(CSR_ENVCFG, ENVCFG_PMM);
-	have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
-	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
+	riscv_have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
+	riscv_have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
 
 	if (!register_sysctl("abi", tagged_addr_sysctl_table))
 		return -EINVAL;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
