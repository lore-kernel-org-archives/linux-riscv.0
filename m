Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DF7C5DF66
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffRUl8XlxDwuN7Z2QG/xEwWcmvP9IhHDwdQh1sy37qQ=; b=zcsSNTmoiX3lWQ
	KtEFnoyPObvkAWf1qV6O8VKfLrm+u1crgbN48ZwMPt3xfNworl0Y1lT3rzudh6AvYt9WaRi6a1By9
	1YPJkoW/+Xv7XMpKvda7We18966tAWpiYjsSXRFE1yUBGGFDJGKokYLgCq23aOLFf8rbbrOPOfLeB
	9RwugjIOsIlQmoqCwPb4lzwf3S9A1wzX0WdoJLCqhG4zliIWf0gR+TFqSGH/dsE4wM2aCDS1nIVu4
	wwArexvtjIK1Rxcys2BZYSGIyFXNkSPwQ1Z40Olk4tIwYVxMjQqjYmiFr5Fn5KsqrnmBDuMdQn9WR
	hfyx5dmdO7/oxras3oKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzna-00000006TKo-12uM;
	Mon, 17 Aug 2026 16:02:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvznY-00000006TJW-2eZv
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 16:02:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYs8M2767905
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 16:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8RiPQfwx0pL
	oLXHhtNA18dRwBbwALk5r5Jdr0ruDCL4=; b=dY+W6B/ZvAjsEv7MMvIr76Joway
	9aVIm7i0f0IjcyHigafb8URiY+Ur8ftIsgEV8U1bbUIMkzXWpveH6qYKS3DZ+HVS
	29GAgCkewLwfFCNn/Ox/jiu8g5zDhEcO8t0YhFcvhnXeo873gLhVzMv1tyza3bGC
	HRcT7XlnPnp/FHtlRwCswAzZIrJDxILt3FBF3xB3gidBqlf9PtB5gs2civstG7cj
	Z9nsWg6BYUjm0ff9MF0n0J+1O+iuNduBSzvsQ9hSLld4xY2Irg6GptdhrdarMPMd
	5RjF3hfsqgFV1t56DOuPJgE9EOgf0kAVH1muZ4PbItrksuj9oi72da/PCUQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wrej3m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 16:02:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso4241167b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 09:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982570; x=1787587370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RiPQfwx0pLoLXHhtNA18dRwBbwALk5r5Jdr0ruDCL4=;
        b=GFkYSnQugoTPE2c/DbiLwekHGIgTbIkNFSFe7jUH2CllPJ7UE9Fdk0dozTGw6T78E5
         Rs6Xe88tpryqrAplRg4VXUOpzVuJ6mpYQ1TrKlcHN5v6xSvyS5kzWbh+enzMvMgXH65e
         1/wQXUVdcKxZD1szUN7UyUcFfNcpK2sNZnXrkHxdA6EsDKXkCFXMCtFDzMekncH8zcJO
         b1tJBmUEMYRs7O52+2/yP/gMXayN0mavjJzgIEg870COKkK0unsj7TOgiGZD0EyYft3p
         wpjEyToTh2297SKQwxlONJQ3Z3G9ZZnFyfQJ3uXR7/RsfpRj04DpAd3x3UPpDtYyOUeY
         nZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982570; x=1787587370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8RiPQfwx0pLoLXHhtNA18dRwBbwALk5r5Jdr0ruDCL4=;
        b=l/WCRCsVa9Zg5bQva7f57HSY7bRYcWhH76NH+Xkk0I0s0ehd6TyiGhRIkBzlDsSg95
         Tu5xlOqWM8G2+a7wS9s1FNpDmYtFmoVKBdSNSmq+qwNqikDzKT50TG8ZeMQFa7xOnvvP
         2DpFl2WIQZGGoRxIoNlEZHEtB0Jjx/8/WLBDvznOZ23xfhOyT5BowoZEnbX86eOKYHJn
         Y4z2gRP+xnifr/QbwFogG141rc3oDY+CODiV5mGJNCQbdAGW5d8KOgTyyjyiyPVupjk9
         Q+aZqRQUCReddw2qIhZOu9xwKnweuPlpARs/zdTV+8LVcgzd9yB3diW3xlsLptVfDtKA
         5nQw==
X-Gm-Message-State: AOJu0Yz73EEQ11O+cv4kQ5s1VyHW7Z++kinN6pIKnQ853T9FqcHFid5D
	DQtJ8L6y9xWDtoXfMMcRIEFt6HGIn867Dehit8TmgKjtbrj6w49FsEX/hIVJR6Pfg8+zF+ktqMs
	WuoDWFAq1qsJ+UGm4c/Ik6n3vs7KjYp7/jt61v+KrAK3R2qplQ9jd3U9u7epOUmVVEFPW2pY=
X-Gm-Gg: AR+sD13Qox1u6NeF3ntJVZKd4/3k4sx2BJ/cYXDHhk5h/LOWoAhfofnpSdjoPkUWrEi
	VTZGSIIRnV2QHQ7ATHUaCsqpJknJ6gAGDminMxyvUboOKNLQS5vVwQzkAnMTZkfObBCZbyAQIGE
	ox+RQYJk5AXp5pLEDKPnFd6xcd7KhhjM5Zc4fRj49eQ9OEf9Twa+HqdcT0lzjceO/Bx100m03E9
	6IumVtDWyXDiOxvJH+DW1PMODvIEoq0kpy+4vCzqf7Mrmr8CxvVI1/Xro6QV2YctAdk7EJa8HTH
	xvrMG2g8Ir/1dooOyIRZo/Cr0ylOfQjja8KrukRopCjoRszvryYdAO7GSsdh8P4Ldorm4tmORQy
	cvIeQM8Ze4OYEYUqWTfyCNewDTB7ymNyLfjbK1/GOUNF9RSSTy/7fCqNoDQAtn0uqVWHnpScgqL
	6BMSwx9wP2MUqQd/sMjDm0wZmQaA==
X-Received: by 2002:a05:6a00:4c19:b0:84f:dfa8:57c5 with SMTP id d2e1a72fcca58-851b8814c56mr1673012b3a.13.1786982570461;
        Mon, 17 Aug 2026 09:02:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c19:b0:84f:dfa8:57c5 with SMTP id d2e1a72fcca58-851b8814c56mr1672923b3a.13.1786982569849;
        Mon, 17 Aug 2026 09:02:49 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-851b6f8b189sm562883b3a.34.2026.08.17.09.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:02:49 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Charlie Jenkins <charlie@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
        Deepak Gupta <debug@rivosinc.com>, Thomas Huth <thuth@redhat.com>,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Sergey Matyukevich <geomatsi@gmail.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        Andrew Jones <ajones@ventanamicro.com>,
        Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
        Xu Lu <luxu.kernel@bytedance.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Hui Wang <hui.wang@canonical.com>, Guodong Xu <guodong@riscstar.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] riscv: Add detection for Sspesa and Ssplcofi extensions
Date: Mon, 17 Aug 2026 21:32:18 +0530
Message-ID: <20260817160222.3313295-3-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a8330ab cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gAUTCzGNcO5YByAtzVUA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Y7-xL1_4M53W2lwzyFdwyT6nj07_d_zU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX0vz2rvz9bPBD
 64yINHXVzszgb2Kymd8r5iKShqSftwNMGTjSbmg7zD7kHEPXFH/NDTBcIBLp66eishnrk0UTNBB
 0E5tG5UjULHJOXQ5Fbeo9/NjuXZqDT2yaOmifh13afG1DlLod/uFvZFq/aGA+shk9s5am3udSwX
 U4e91yycnrtpC4IUV0nh6a+y81ag5jBsEu88V5IzmsofB/Vf7QXd9mHW2vEQuDN+MpODbJO2hFI
 5xwziQChTSvzsEQVNM88L3261oisCZ4HiH07lpIMFQHnA4JTwuusNyyCoAiW8aiOzh4QDHABWcz
 VATA9bJZjHdQuisao5wphnOB/NpvDyolsTgYTrGGRbCjPJN4Bt1S4nR8WQVf0ta/GIWeScEbFkM
 T3A1P8koq2yzeybi0j+MynyzgqCudwBN0NEzeeEPw8U7b9DrgmGp7qIT3CVFowIz1uEQyO/Lm18
 GY7h9NUSt1khPYV9qrA==
X-Proofpoint-GUID: Y7-xL1_4M53W2lwzyFdwyT6nj07_d_zU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX5ZBq1/1bN8sM
 PeSx4yGzHVlWfVqu34ko+GBEi/bNEFaebvSSGayXTiIICeQY17ChSSWghT1gBHc2HTQ5KqlkI2F
 QBqheBIEEmEwCMgP8o6Kty8oeMwxcNE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_090252_793747_C870DB74 
X-CRM114-Status: GOOD (  13.52  )
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

Add ISA extension detection for the RISC-V Performance Event Sampling
extensions Sspesa (Precise Event Sample Attribution) and Ssplcofi
(Precise Local Counter Overflow Interrupt).

Ssplcofi requires Sspesa, so validate that Sspesa is present before
enabling Ssplcofi.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 arch/riscv/include/asm/csr.h   |  7 +++++++
 arch/riscv/include/asm/hwcap.h |  2 ++
 arch/riscv/kernel/cpufeature.c | 12 ++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..a5f38ff35336 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -316,6 +316,13 @@
 
 #define CSR_SCOUNTOVF		0xda0
 
+/* Temporary addresses for Sspesa (Precise Event Sample Attribution) CSRs. */
+#define CSR_SHPMSPC		0x5d0
+#define CSR_SHPMSDATA		0x5d1
+
+/* shpmsdata fields */
+#define SHPMSDATA_CNTRID	GENMASK(4, 0)
+
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 7ef8e5f55c8d..68f8632bc751 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,8 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_SSPESA		106
+#define RISCV_ISA_EXT_SSPLCOFI		107
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74..ab415704e317 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -287,6 +287,15 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_ssplcofi_validate(const struct riscv_isa_ext_data *data,
+				       const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSPESA))
+		return 0;
+
+	return -EINVAL;
+}
+
 static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 				    const unsigned long *isa_bitmap)
 {
@@ -582,6 +591,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(sspesa, RISCV_ISA_EXT_SSPESA),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ssplcofi, RISCV_ISA_EXT_SSPLCOFI,
+				      riscv_ext_ssplcofi_validate),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
 	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
