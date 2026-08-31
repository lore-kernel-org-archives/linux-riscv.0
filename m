Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186EEC624C6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rhZkhbH+cDQeBiM+qFlX/uultk2ZNIBYC8zBjZ1NQ8=; b=Ses+hyg/oTl5Ad
	uY6x1iZ39pvqRZMFepsAIAWxbzkrhgb8sQc6mhGgz6hv1VcWDxHGe1I/d8lorHpcZuu9bSM5cn1O0
	lVW3Rz/w+AovfMQ4UCNbdR/nK4/IDBGEShXppx4kfrxXMe1mqhGhhuHVpAxp5Uzki34KobGRj8jEo
	cPVlwSGsgK7tK9dmLzW21/9gYF56ZAkoY6vypL+/+BKcSx3S3Sx/KWYa2fR7F6RBYgisg/KlPMCx+
	3Dr4KzNHDmWwccsYR87qEhb9l4pT9UjMgG4ChJs9tJPkSViak7viUaFVQG3u7Ttxfa5EslKSjKQGB
	a89Q6MIA5CRFaD1Jf5Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Us-00000009lDv-3VY1;
	Mon, 31 Aug 2026 15:00:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Ud-00000009knM-0lAP
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 15:00:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETQnM3703688
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sXxW/4DEUBO
	CwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=; b=XgdBwRPKuAeWSavL6oW2JczLZjG
	eruDKqXwZhkDW9VXSRqb7p93b8wMZmjMP2uWRLyyZp0d6Hi4f2lhZjpbhuRCgHyS
	wqYOxXVcdczKG6KsxWZqXHXT3bVm8wQ5f4ODYRGjv86K/rsKEBEdwMG6p/CcISGU
	rjgC70ovoDBe8V6y9X4wLg1y+/vj8GrHIRdsXrkHbL21Hm9xLJCKc57jN9+GYVPx
	JsHMgoQDJLRefNAjblb4tTe5qq4F1I3ePdl4d23XQsn69weEJmfOUVF95m9JUNc5
	Xhv4niPvSAnyS6eft7ByFTt6d3hjg+YWAXZXXiA3cpuzSVTKSrLyfOJUXiA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yascah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso455755285a.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188413; x=1788793213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXxW/4DEUBOCwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=;
        b=LUO7zkTs1TSeyZjI7DGex5/QgPwbzEMaf+gINY6G44FdpeA/rWUruGZ2YvL/Aaq9/S
         Ov3UOdv7G0qxqU6Bnp3sg/IQi9Q7wKpH10O/tnSWrVwBbUWuzuSLVNSdCpmskNzCndTN
         kzTnmFSTXY7nzQdiB0HFOhWD4RY55ly69hjgtokvKOZ17agnt9JIDdB7ITtj6yKGottE
         McGxMlSEd9FS6oQXCgatvn2y3HbnmdMzy7WGth6ggSiCQPwd/VjjMBK9UPuI5VY1VH7m
         U6J+p/tP91D+6nWwOQd8zSUoLZH55yKXwkpAXR11Gc2O2SQnmEggvhiIBmKK7o/gIhzY
         w6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188413; x=1788793213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXxW/4DEUBOCwZCmYrY7nB3sSKdx+Hk1vdDeS7TRF7I=;
        b=U9Vlqd6xTxUS0y2iI1A+AiYi46C8JtE4AXCGKissbtoCgiqGInpyqXoqp+c5UC85GQ
         2bPWJxbWJuSXTGLclVLwDpMUcogJ9yCobz9xCBnojmHwoipHQzRclmTIUc/cv1PJtXRC
         YC1apT7cWb69dfHFfEWaLNo4+DtdZo8xz+dBG6ZBMVBS3FzMD044RTNeZ8/yb6Q5krKN
         Uaid81SbEEGOP+37R8WsdOJ/VvIWIimpC4Auf3SbcejHEumW/gx1ewaN8S/iM+xp6X3g
         mcZj4oZEzzOzFLlgmi3lcM9wVOXt1HLK2zO3GotSwUAt8QolEksWpP6juKwnJrfd2Shs
         /IYQ==
X-Gm-Message-State: AFuF++n3dPJTorez3WAHTVrsR0vWqQegaHRk+L6FPL/1jGVUo7YN4w78
	oevV0qtyKf9tFpsNZId9QxIbv3zXIZrJQ8VgAW/f1b0uXDxdMqMpasArkn73g+4CfSUYn/ZyInP
	NjR+igWH2+ZNoGQdpwacKomzxkI2ITG9i4lFaMBqpnx2fKRhFcgwjolJtqHA9/Q4Z4Kh1p24SsC
	SYtxw=
X-Gm-Gg: AR+sD11TrX6XEQ+CQ7uqWV80VC/9+nJJ1ieBUSwtOCxX+Qlng423EAErQ1ANmPjQb92
	ui8KtcwK2iMbHcCOV5B9mQQ/u95pRK+xg5KzN2q5MI3FZEBv3RasgSmD1SIlPV3iljlwf5YrrX7
	SO1bmvDTbWmbrKbVqnpEOHt1EzAlD3cbOLlWBZ+2yN+lAY7sAoN3cJvJ6MYIf9Bi/7THa4kwAq6
	PYxyvTW1YVJaI2uIl5NnuxKk2ZJksedIpZ/7wwoq3JPK2FTWsZ16cMu1Th68SKMhLhusr/UTCb8
	bfPtbtqU284E4wui4x1IY2SZRK3+/Yd6PRBBSD+JNfTfOBm2WzRdoLeu2jxRvXm80wIG7Kcm+N3
	BNec5NWCQcACAHSwW0a6FFHVbaoe7zr+L8zY=
X-Received: by 2002:a05:620a:f05:b0:937:5ab5:53f7 with SMTP id af79cd13be357-939481bb845mr213388785a.43.1788188413212;
        Mon, 31 Aug 2026 08:00:13 -0700 (PDT)
X-Received: by 2002:a05:620a:f05:b0:937:5ab5:53f7 with SMTP id af79cd13be357-939481bb845mr213370085a.43.1788188412396;
        Mon, 31 Aug 2026 08:00:12 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm414356655e9.6.2026.08.31.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:11 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 16/17] riscv: defconfig: Enable IOMMUFD and VFIO
Date: Mon, 31 Aug 2026 16:59:42 +0200
Message-ID: <20260831145943.313726-17-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX6EKu5vI90JJq
 nQtQc/Ji2AJjPXrQpcL72paNbyy/mkcfZCD6I0l3kfSzFc2wFYFNtred+z6Z4UY060k7h7EXMwL
 97bFzBHMOVlvKOc6VE6qLy1hGOExPJE=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a9596fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=B9Crq1QHcyRNgBBHHYMA:9 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXxQ9T5NSv38Wt
 hI9GywYS2ct+QsF01Z9yLKmdDu/yX/qn0+h1StXtSAN+xSr7gSN2No5+01a4ZNoEJOgd+7Kjm6l
 XAr10NlsrVIztJpW+LrnILHfsWoHb01n8dR1AIhE76yaCmECXow8vSz0iGOy3RycZyp2Ov03ehU
 lkcKGsOpareY3YR5BZsUqFWDhDeqNQSj+bC+O1wUO50oP4stmaJDqc8Vvb14w0secSf9dWHTyYX
 NW0QWPGAhWU/k0OBs1HGxsrpfly3KlVWmo8doBwfl1zfILbsOata9mKBzW1OQ01NXa9xJjTMLj3
 /3ScNkrCOOcYoQnSc3/4jCEnAM26rQmbSDr+SNsljVJw0xq07AW2iYEyNm4OaoV5wEX1qz3dSbe
 M6O3g4IVckTJOVpZH7aZrknZEvPkH1VikSGCg3zRcActJ68FI/vbxZ0lXIPe18iqS3BcjClyzNt
 9abOG2AR9PkoDoVZ8qw==
X-Proofpoint-ORIG-GUID: CtK5Qoi8U9O-hj_cqNbUOuHpV-oGpqN8
X-Proofpoint-GUID: CtK5Qoi8U9O-hj_cqNbUOuHpV-oGpqN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_080015_404542_240987E0 
X-CRM114-Status: GOOD (  10.77  )
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
