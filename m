Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35399C98325
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moD3/Oo6pP7hQDscwIIgRBSoCxwFsvx4x4DwZa2aK/A=; b=idMwrL28705ZzP
	L+Gr9bDAbtIlt83WlmxvBRcKa636FnkVy7Ue0yifJ9KQddrQ+cLOoSlYUQFQe1IBRhg2XjNkGECxC
	bfgsCxkBNXqjY5YZtO78+dZbW1Ra+yDhJPzgf2J6lQpvLSZYXTMmVz55hTaYOHN1RpiSm9Bg987My
	gzadBL39dc2Tb8AmQcbLlr7Stq3k8eGCu9RHojaT4IM5BpCRl8qyjWGj4dJE+RlcIJEbKmhLlSl73
	A/0OjL3f//+mfVfmZReD0HWbDEegt11rTHKkpYmmYE/OZEegc+SUm2S8ABUSxcq/qb2cnoo+5/Oau
	k5mgdIJrsaMLN0QA+JuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7gB-0000000DkEA-1O49;
	Fri, 25 Sep 2026 15:17:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7g9-0000000DkBF-3WmN
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uXMNL24iPvLyDWGuh484cz07PeZoh2YQVYmOCMNTIg8=; b=KsDqsNbg0cveMYPZ1aUUuM8gwA
	dK/SYeS7ewPiCi57WEV1u2vyd+bDlCllP0Uz30uOaIBN/YAHarx4kwbcNtoGoRy0cnaiJ9oVTP+qc
	M6tJDUOussn1BxPVxBAMdfTijF2/ThYAwwK8/MLBCnntC9HFKSpuRpcDjMLuKbsHbBuP0u7QAEK/N
	Ro267mS7FyBnQTDWXVkxnOOzLcdDCVxQs6GBTKv/DcyRufm/TWgrhp6XIbQ7cZsgTk/s69l0xxhva
	JHJQ5x1HvP6NCNyWYiHH38L2h+LMEI+687WjcfZJOJmqtva2bt6v1jN6r9T58Z+AJC6pNWu4/zD4f
	14fYjXNA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA7g5-0000000H2lQ-0iTU
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD7odo3532496
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uXMNL24iPvL
	yDWGuh484cz07PeZoh2YQVYmOCMNTIg8=; b=cPtgrO39pjDnZP+gorSQxD1Vptx
	+efkiH39n6Dlh7KDDFMTOn0lRA3kSo3//th97jjI0Yzip8WEXvwHX/9FqO66fGDr
	7dmDLhFwa8QQNaZxbfF+3FOeFRN+AnqzvQlwGGD3z167tbrp+0zh+n8jExWYAGrf
	rHuR8JaPcihWppx9AFBPQOVVuknZjwBKJn8uZihJpJmbYYuhEZ11W0K/cVURL5hr
	CXe9/jGpu6hchcqb9/I4LmekQlqa9TY6oJQmis6WR5/EjXccwdc0/QcEO19U2i0v
	/tliGRx2iwKxj13f56VkoJWwTmjOPIKTMQ+vpsS+PA4Yb9VM40qFZ3xx+vA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kbs4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785827e6073so229549137.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349447; x=1790954247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXMNL24iPvLyDWGuh484cz07PeZoh2YQVYmOCMNTIg8=;
        b=bB4bu71vzpMaokqQhtetGUYxwS9uXW+UWmdhgS1+oOV77Nfg66sbf7ktjGHIfLyWe8
         wUV0A/S4El0GXxA4L4a8mhuBqSlKyqr1KY7b6BchqqPR5HlGDqHSYrUKbNpJpM4igbuK
         wf26R8encYlOy9vHHGorMQYn4TQNdNGHfXUjCGmRLpgXfq+dTiq8rwXaS5WwEOaQo5VZ
         YjLnwVEXUSaGUrfCBuNp7wawPRqUXVAGBksO31n1WQnUxL/5rZ+AIgJF1OZWTEwKgyPt
         jjY5uyNSRo2stzPyzBSEncfB4bWRd+Bn4bvtFJQiYnzv6I1B2Zuzl22ZJKSdilU1vdMB
         Qi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349447; x=1790954247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uXMNL24iPvLyDWGuh484cz07PeZoh2YQVYmOCMNTIg8=;
        b=VvlFao7+T2fnWDJDXsNBUC3oXl9xl8Lc1KvlcxgqQC9+L0tw2h6gbd6Hb2aO2Z/Iiz
         lHE545YPj8aWkzErt+hRiBb/iP6pX7A945LjSOVr88nsp0xahZfwaCP75FLdjdBSw9yA
         Uof0u2DH15HckmalYpDIUHDsTtsdo/IR4b1sydK7WPVwSm/wlXGMNvQaopCsISVVBw0i
         3pMkKNPxTze9IEd+H7sPf2nr3Ikgxthi4uBSYoVJLd1pX3gyDAPZQfNLJKXFKthfKRsF
         dpZBLdVKSh1xHf29AFU9/HgpbxfMN3zkEXWUcl+u9GA6DnAcMAotGQgTnLTq6f9y1+Vv
         GEHg==
X-Gm-Message-State: AFuF++nLvzqhFzU4wqJZAZHxvit3CqZP99VLFlxebuyRRtd7JI/j051d
	N/WAM+z1jHnLT0bmBoRwEurV41IyZOigqRcaLESVprcGFZ7Ong8ogG2RkxYwsnj8De1tJFjLR/h
	gqpnXA25+VniAiETm1KLxoqQQmkJtBeMP8RYU3xWlJ5aUnG6i/dEtYYZqoGowmIYWxs/9EjHi3B
	oeBy4=
X-Gm-Gg: AYBFou1XKlyfX9cx994f7Shyb+MknRaLHJI4i7BBMjbTOM69mVz2Jlo5+iy0D0OxzbZ
	boK2IMEvQx6mHz4/qjMmjHmiClmA2Rj/4yj/1qDhFnqhdYWifQeEqx/3i7p9ANnx2oIVMgPdOSS
	xb1oi+JEXOfVOhluSl2SsOzl1SbSPLKaUIhpkzmkv9hz4RpiOF3SrIMWhveByEVnHHtkWGV37F3
	n8N/P8Q9K77Eny2HSO1AuJrrr3eI5qFMFlfyH6CxKHbsMAdd1eGMkBofjWNG8/Y2DRuY/1+AwsD
	MMS3D+Ecnne1pt236P+LyU874XrCbNrFS9KvYSMczYNcJyFrfz5jnrcBA52F0fdANPZ2rPPk3+J
	50Kf6jfnpggjj5M6dXI4SajVmxAXBgeMd6ibZZg==
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr2471847137.27.1790349447473;
        Fri, 25 Sep 2026 08:17:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5112:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7af1eff69cbmr2471811137.27.1790349446893;
        Fri, 25 Sep 2026 08:17:26 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm8182262f8f.22.2026.09.25.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:26 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v6 13/16] vfio: enable IOMMU_TYPE1 for RISC-V
Date: Fri, 25 Sep 2026 17:16:56 +0200
Message-ID: <20260925151659.419512-14-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab69088 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=SRrdq9N9AAAA:8 a=UCRwF759qLZD2Be3sjoA:9
 a=ODZdjJIeia2B_SHc_B0f:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-GUID: 7REA8i_BhLw5Dx_bpe5rJ2qWBtpS25OU
X-Proofpoint-ORIG-GUID: 7REA8i_BhLw5Dx_bpe5rJ2qWBtpS25OU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXzAUIY5EJ6viX
 N8nq+9tkYf/jS+CrL06tl+ZNf8YLM40u4A8+7VfGHbZD47+0/7LK91I4Hu8hnp1MZtbe4SdoMub
 wOBToCvjuOJGAkrjzgtbmud3cTpi5s6XDKSsWX2LgHkboarEdvbfgb3J6Xt3DVrxDPUPSUA22GQ
 IVFS58EJB11dGXthqq0eWaQ0DEODm0pBwnSjXYlndqs5gLq3UTGjHMQhEVneMGPrJU1J9sq7b27
 rdUE6ZzAomlMYholHS0tW8NPkJlcWhnYEZGB0N4rqrUE0tT9hTMHhIHpIyDRaSy4qz2NZCYGbp7
 jAVqTsp4rLJE8/2Ze1jxUDOOqGQXJ/gYJjmzVEticl/ZunhmmrgWh7CDSawP8ey6FtXYCcM66Ac
 8+uNqnwjWKDjbGFY+zQ+x+ww1AMETOVgMBkp55a9PefEpqd6Cyxq4165CV0Zed6j+ueQzKhm/1R
 PTAOsS9zVaraGB1UY9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfXxtlPBwRNrRkm
 jkYmP19n05xWB/M1IDRgRk6dwdxTjc/u+e0WdzUHf9qUbcxuybIB41vgSb8BfnHKagDVMHUd7Gz
 YahAjXd/iak5cegO109eYUGCzRojCZU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_161733_567659_3F045A23 
X-CRM114-Status: GOOD (  14.25  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable VFIO support on RISC-V architecture, now that the RISC-V IOMMU
driver reports the IOMMU_CAP_CACHE_COHERENCY capability VFIO_TYPE1 and
iommufd both require before allowing a device to be bound.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index b9d6e1c22aed..f7f5b9c1950d 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -38,7 +38,7 @@ config VFIO_GROUP
 
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
-	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64 || RISCV)
 	depends on VFIO_GROUP
 	default y
 	help
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
