Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CDEC5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rhZkhbH+cDQeBiM+qFlX/uultk2ZNIBYC8zBjZ1NQ8=; b=kFFR+s8WNMt+0F
	lNTbYMaAeHREYcM0ZCo75bzfyEWIdZLEPR4xcdhXtBzmU2gx4pB/v+W7UINzppvMV24pDEntFVFgw
	0xWxDysAKJARUxCyDw09LGgUA4UBc9y4Ka/j3SJBb5aJqcAnwrVTKOiS/H0pS+5m2J92J6btQr76+
	3ONomAVtAONcxvP0e3QzcMS89Qz0pqujhLEWZmOhF/osLcmS7Knzc+7hZjvMZTgQ/REglaKY1X5ts
	9bgtns1fmz6g4mafnI8xXQK4IRYdmneJyqUQfL/1bKU0xESC1IxCy/KKHiNdQQATlZZvRFPuU5J5W
	D27ByU3o9ZXghO2U7bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAXD-0000000CET6-22LM;
	Thu, 20 Aug 2026 21:42:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX3-0000000CEC8-00Nk
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Aug 2026 21:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sXxW/4DEUBOCwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=; b=dWw/AQ6AYKmVynhxBsrGXKuICd
	oHkkYSD+a7OomPBeKp9qJtbrKsfr1duYnHRYR02u8xZj6Y6uPt2EiRHvFtIeE7suLnV4vTq4NWQyy
	JKGlvYDjoe4S64iLHxZliSso75rdbR2rvs2tyiccXHkMqLPSFxwOQSuyw7pCDikKcH+nRSuoSG1RV
	xuN0vB2P7JTwcJ2EBPlEsR3yaNnJP7Y492q3YWbOx5XiuOTMAjpZRoTBKPBSGBBhP5L7zSWzXYZxu
	0Kc8WayMR8Js78kvokkTkA14NK1DkqWqjUCZw0UWTkqql00KELmLmQ4fOI9HqUBLPMWesi4F0hVp3
	nI2R59DA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxAWz-00000003MZe-1Pjt
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7x4M3941497
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sXxW/4DEUBO
	CwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=; b=YuMxvZkCbrYbvw5aKnSye5M4SJ1
	94imcuc4Iz+gZFvaYCduzX/Fq4useYPARPXnsMTGaO4aLuxcv+acc5+OWl+VWWnB
	Ksi0zh0EFAqwbsi5CUxlfX0I1kVEeZtSh9pF4b4GuZR8hrdU6/GWIqJG/0CNRlMX
	HJRKEZmkz+p4ElTbgC3LWGOW9S8HQuzqs6NuvuLk55ean2NykzKHtESeG1ooj+KS
	RTkxGvcAvQjtfitixdTDQdbQ0gobfJaFAEcW+nl0XQAr/Sq6A8ulVnveoxMoB7mP
	X20Axo7YCLHLn5Assa8PnRFvKPMe2PVdHZBXmMcmxaPFado+/ucyFWjWNtg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7uubh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so38515185a.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262154; x=1787866954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXxW/4DEUBOCwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=;
        b=awCxkt4DScM2HTfbPvZqJGnfG8ncxyPUSCMOBAhI5UfY0Cu0WBGXE6bL5/Sbs3IHE+
         45bsFyDKOt7tHVBkw4Vzdib/meASPD4JEyYD0PfHtgqeRbk0mUOqZByUGhIy6HKUYqic
         aWQCAt1+qw/nVAS6yfVwO/zyz2u/N4BtDTkGHqwGspte4pwjRmiMc/3xN3Eus9CSSXVo
         KQ1wrWOXTVghrAjAQsWe7viw8o4JBvTZ190tQR2T3lJ20E7yEQHdI8IsI3Of1fqcMYj2
         ayrzoEVpEdoXPGeP4lW4Ul92a2C16GZqRtMHUi4tQlj/MeuE6s4V72rpCGhlKYBUh/PZ
         35KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262154; x=1787866954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXxW/4DEUBOCwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=;
        b=JuqIHI0HLWiF6hYIM6nwutD0d2YTjl0iN7ca69KU80XWQej7ioq6Z4X0KcJuzAKfQz
         FUjAsMQq/wySi+Z9d1vLflKCNtMR8dZc7KwrRq84fT4aEpM8k4yoYAKqh+R4YSA3UOax
         Xi39tQdKjXQoRVGBLDY/b+JvadG0tWRD0Xjt0902rpdDKt6trjB7Mavitdlxad5m7SN3
         97hwGFyvd54ZjHAOfeDA8smekIfHFqbVwT7i88pdU0We/LUpY/30WDoVOrVsIq55scyC
         RCcwLdI+ixBdBVIoV8oaI9yBVfUWtkGnBmzqKpw+mONBZLPOfYSSYz4k9goOKLdiJ/aj
         lwXg==
X-Gm-Message-State: AOJu0YwFG1uuiNzwnrPcv6BAihsBtULnQkSWBIx6ykTR9xUKN3g9/14x
	HYfFqhGD5hUHOO6QAAS4Lzys3WBdmT/kaDezhPIOQboL5FbzDuAKoxZF41mi10OCdlJH8OLLyDT
	5Mu/dQJRopZVQ23Tyh+EtTuoPbkF6JTvdvRKmaGyxFLMQCvZZEZsrv7q0gX44NXaCuNZX44dCSq
	MGttk=
X-Gm-Gg: AR+sD13T2cjyfG+wwBnr+2Q4qNdOjStVYwBnhSpspF4seV2bF2Y53ivzyZvca+6BSO9
	sJ+4R+iJV+sDiBfcx4QIXmz4jmFSGHYFApCpQdStvCMofO3IZVItV8mtO+RewO+VshLPmjqPTzt
	bwTN53SLfJGgusquKSU4ssA7F+VrxQzojdqDQlwGMd+ZY/PFGJBCC8koY8scl6yH2CMp11aFXj8
	FAPL4cwqW5w21O7Vt0qh4IEDT9YL5QKNgumzGufNxIkf9vVWxCy2CIwV3WnTGlGeEmPFw1/S4fJ
	nTz55lLS0Ft4akuwiP5bEsizrFIOZuAVYa5jdUCPua8js71UHGuZx2/uwW+BVp67afbPQTcJMd1
	jME20eIla
X-Received: by 2002:a05:620a:2983:b0:937:260b:4d8c with SMTP id af79cd13be357-937395747cemr120518585a.33.1787262154653;
        Thu, 20 Aug 2026 14:42:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2983:b0:937:260b:4d8c with SMTP id af79cd13be357-937395747cemr120515285a.33.1787262154260;
        Thu, 20 Aug 2026 14:42:34 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e54sm16782276f8f.11.2026.08.20.14.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:33 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 20/21] riscv: defconfig: Enable IOMMUFD and VFIO
Date: Thu, 20 Aug 2026 23:41:49 +0200
Message-ID: <20260820214150.545737-21-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX/Dj/2q3JHi08
 Dr4G74RUvFktMtW8U+imp/kG+UhNENRgG2WrQuVl+losxqLRbcmaiwYTlKV0Eg2XXYO4EGeY2S8
 xE/9Tnw/qQzRfd80SuPNKxJfQaPCVNlC6WZTjb/1xjOYf3f0FFBLXUv3lqLJbPgdzVD6c9LF03p
 /yjjV3DgUyFRj+UGOiYuyX422UOg9L6KKX6vhCTEgeN7mMa0vkNgCaA4WjEtMO46MAkN/42hKE3
 YBnAr5TrF4VIWB0+Xs/I1KQnlfF/DdxciL63zkqTnwnN4TQ05Qdbj9+ft+7r0CLfCwGtr9V3FpA
 QLSiZeUdAVvH73R9yF06oF86ZjFOCPFEoa41CQ2dMNcAV76Q40cs2ZBHDI4jvj18Om7Hm7QFQif
 TSr1QAArMa0G6GF5xnND2Tvwp77X4yYrHFktyBEoR91mz8JPKyAKvtERvH61f7zmeolxvLMElPe
 rCX3ccsDmyYm8TlcqMg==
X-Proofpoint-ORIG-GUID: nCFmldlBtv0Zer_7RDEHVTI88LoD_Mng
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a8774cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=B9Crq1QHcyRNgBBHHYMA:9 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX3YEltOSmMKu7
 /TNYIXXy7AsAlAnh53jC10+TiCJuai6tMboJ7OeC67tfWrfLd53ODUjvW6MTw8JI5X5ai7VBDyQ
 1cQDRr5j6VFez0DfCfD3bqHVDeJHU2M=
X-Proofpoint-GUID: nCFmldlBtv0Zer_7RDEHVTI88LoD_Mng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_224237_840456_260C0152 
X-CRM114-Status: GOOD (  10.73  )
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

Enable iommufd and VFIO in the default configuration now that the
RISC-V IOMMU provides the DMA and MSI remapping needed for userspace
device access, including assignment to virtual machines.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ed605b5e3162..bae9a0f32f89 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -249,6 +249,10 @@ CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
 CONFIG_MMP_PDMA=m
+CONFIG_IOMMUFD=m
+CONFIG_VFIO_DEVICE_CDEV=y
+CONFIG_VFIO=m
+CONFIG_VFIO_PCI=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
