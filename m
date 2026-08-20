Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB44C5DF8C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SizIzF2awZxsEgSGviHfFD7OP96mf9FW9YhqHBWbQWU=; b=NXRXhYWCLowdFY
	z7c/8YFUxoD5E7ISOKCfdW1Gg7DyiQXuMhd5U9Yx1BpX2aO2WlYmxGzbeNiKzXkFP9ZHdwCupGHDC
	g+FxDgP2BcaXrNITC/C+wbGRNmI+QWk+irbDFNzNqEkkhc6t8UazYFVjqBXZ+gaNql/bbI9OtKzRB
	IxEiwrFEiYgxYnYyc9wNWkzW35tyrOfrtx9ZzPI81P+nSi4gLZhCVt6tRHMkfGNoV1O0sSPFf0ULX
	/x48B1mmMVmwWmq3HGWp3rw1UEld8fNk7xFbCFl2Vt08yffwBXTc+I1afGRWyhYraYsKjHJtKHx6X
	sXsy3Yfw2qXxNh4dV3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAXD-0000000CESo-1B6h;
	Thu, 20 Aug 2026 21:42:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX1-0000000CEBy-4A3O
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Aug 2026 21:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=; b=eUFyFYHugPDRO5k6nY8bWoEwk2
	ldMCz3+QXXhDdxACTlgUI8u8VFHVJ1ejpdIDq8GEoWZu9+XEJB2iwpHoJV6JO0/FjqrlDUi80M/sQ
	IcguIjMV/7dMNMhaAnshRhlFKaBtSe+FAJnh0asvWuvYGYNbfygj7pbCYfpBECIRihd2ecVyk52xN
	lqz4X/2Bhtc5LvbE51JOwk0toPjApew37+z4nN3QybyVFXVm8Wx5JoKaeQo2ACf3xqXYDwvAUU5K8
	WPT+w2HS+geIXu7FkZBDksOJdwlLizss6RyXG4ZAIZ21HJx+8sUGxwbmSblmTRUkyBsJdmXUgk16N
	LaX90Qyg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWy-0000000GLsG-2hGV
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7mI3158548
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z/0MUXfJDNe
	HlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=; b=JLH5GaAuBDa/E6iVIzx0xaiNbmK
	B+2Qr3s958/jGq36s4P/kqmnN92P2ecOp2/jiL6uqTDiTYfBheDK43XhC7ihtyR+
	QY/RNtY9g+VtoRQaIJJLNJPcr3x6VHjgMKoffHxw7T8v+ixItFx7QdQAdz0HxljF
	LPWT8Fv1D3l3f18ioJ484vNtOWk/3oqGgtNYuDdulsCPAzHzQeTlmgKSLGgvqizu
	xvI1QVNH7HMNnP0m9QMDg3LHFLi4c0szZ1QRS2Wf5zAihr88oPCRbMnWNlXOQjrl
	IicLkic1JGM2If3u0lw2lLmXOiUKUsd8oNJGqRMFRoho347H/1v4yAXEqGg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk388k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90a91f4c6f1so3228936d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262150; x=1787866950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=;
        b=ibTPJhq4LdNXJxVOHFYN3ILloNDsDrBbsiPvWDyLpn50K8E89Q8i5kDg5oiClA2f9m
         blJ/nAX2hvpPMdzKeOmtSe4lQ4aEuKybU2TWG4h8zmUAjh5lAv5dReLENg5cb6xLYYUY
         XVEUGZ0UzuZEldGug69dQAJGqup5yfJF/pac2UXFW/sWMr7MtFdhN+wWbSErPDg+QujQ
         Sj5qEY52jq6ojRwbrPNUtd6yhvTL+0F+OjwiCjo1jbnZhrtmOOrspx1JjCQy2JUmzdSm
         ZDQFhqA5bpFY9Eeu3CNIZIe1h8J0Q0SS/n02LMzIL58Wtnv/aP7bJgiG925hTv3ah8lZ
         pRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262150; x=1787866950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=;
        b=jTNr0B2UYCEUhcBFTmbj0RoYQ3hZb+yiwGomFXvUp150PRl3Lj3FsqOmuhu7we4DP0
         McY22fDGaqAeHxQkHY9Ved1flifQIlyHqPvdrXeuKA70sgV78zzrJxRoZCVpKGZe1fti
         B+y5R1wQr4POv7B5x+NrAwKoQcOVd8ksrrWRCkLqHIb8YQdIeX8AhBR131FEtG8BiFMc
         47IjuRXKx8RU21I0GgXCQCCSn+Anp4xKAz4XbkAb74OMwbDJszVQwrfS+HpvRYkZgOj/
         DNmZR/UigF5nJVuN+cmWhzjt2T/NEMGUGnf9OJy0gkCyb4UjAxyw6QOMj3WcjW/clsjK
         Uhhg==
X-Gm-Message-State: AOJu0YyjmNE6/cAYEKJX87dkOoPMcUudU5r33i4OXkrBTyDXS5f9JwL/
	ZNbSA6G720pVMubgsY0us4ZpSPx4w2avrOAup2l+NxquoiCUWInZqLwEDLlc6ggOpLjcYxR+YtA
	p5lIv++Luvjh6L4YAPz3WMNa85p9cx+Rqwr8duSNH/qcyD5Pi4bWRTGrQHor4PTT5WmL0+JT8bf
	cSQD0=
X-Gm-Gg: AR+sD11xUne0whOOYGTat8MTiYTmnBdyLmvjbgnddJTk1QivLCwUvcGYyaH6xJODb0B
	EP7y5UkiH5KYBp96gudZGdFUxKEdPs6MKlKj9pF1X2VPSo+nHn0hk8hp393MN1UhH/2I395cuk/
	uB/N6JfG2XQoZWxHJe0AxCR+V1jeVJUk0xcEE5qo9A+ZOZXH8SuFOxIQN0pyQH8egOZhuXArDHT
	GwVpak6olt///LkCyVVwUrMAlJ5nuRAscHC+4nIwbOv80TH340N9dVfdPa3E9RQEi6U7MO/I4zz
	DwbxkOIMI1SKjrF7+5lfOU8BMVIY5wB4v9YK9TjMQeufxyoAMiGtd1cxlFC3DRfjaLKXGIOlSCs
	zy3qFd7um
X-Received: by 2002:a05:622a:1487:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52df5a7b373mr14203731cf.40.1787262150208;
        Thu, 20 Aug 2026 14:42:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52df5a7b373mr14203261cf.40.1787262149813;
        Thu, 20 Aug 2026 14:42:29 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b915cda6sm8427905e9.14.2026.08.20.14.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:29 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v4 18/21] vfio: enable IOMMU_TYPE1 for RISC-V
Date: Thu, 20 Aug 2026 23:41:47 +0200
Message-ID: <20260820214150.545737-19-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: jhRxdS0jP0x_bdTYTn1OvGt73zP_zARz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX6sKWLF4BEIRL
 aWOHLCo46p80aVR6yvxIUly6CmM1Zk+k8lgVGtbTXUAdAdus6g9Qd/HRZT7H/yhoFdJgC6XYP5/
 gpMVPLjvbDubyXZa16YHcDyR0oz/cTA=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a8774c6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=e-vb6wPzIjHU0Swrx_MA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXxxIR8oEZuQJX
 xKzxmbP6mRPryw4h3Yf7qaQ8KTJW5tOPyAq+BORQIvK+Ad9PK8++WD+ulraDvnGob0f/pY33l6J
 h99/4dnlkpb4dZoqPEfvUBsnyqniMCQEcWKOaO6Nbga+/y5IBdLIcneY1aUgeQDinij+gGgJSUi
 GJTOZHGa5ujiGRMbH/SEgZxa5iBf2wGNPFfCoj07LqnfotxHW/cgxF6XF+NIg3fn9zgaEbfs+9m
 24Wv7yG8PhBlaT74lgyW4dmJc/GngGZ3rd7X1Cfl6y0Qc0E28qm8dbacSnRmdnYxhAl2zVdd4HJ
 WabrbfCpDj8RmvgGrWOLw8ZK1/uCft0DLxNmrx8ho4VTEphJV3VGGoVvPrK00xsCdfWg01eNWeC
 Rz2ARt5oBL+IMfKgbif4Sor4+6ULmLNkZUkB9F9hWHAVBUhuCHGIfV0MIL0SKLrofZYGLnbftjk
 4Xkf3dUl024mIYWm8aw==
X-Proofpoint-ORIG-GUID: jhRxdS0jP0x_bdTYTn1OvGt73zP_zARz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_224236_977901_253892F7 
X-CRM114-Status: GOOD (  13.66  )
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
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index ceae52fd7586..ad62205b4e45 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -39,7 +39,7 @@ config VFIO_GROUP
 
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
