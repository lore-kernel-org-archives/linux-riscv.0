Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2259EC9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ziw+IglBXu8Ky0I4UV0nlmwnG7xQFVnF6CJGygMPcBU=; b=Pyl2n6lrtNo68t
	I2TlrFRwn26pk5ncejfCReQHLxD/X4v5/oz3kbydsQWfYSW5svmf88PT6K1iE2jSG8zQBul6I1MQI
	GZ2HMX2enUsNu+EIcKocxiphsFcP7fNyi/kLIcIoWQnMMoT3xjgmO0X8+0WCv0/jGRg4YQfMnyF1c
	AL938BCYCQ3RsJ1PYNHTJFPSl34pl73/0pqM84JUw0zj1S1lrUZHw7TW+M2TV8o8ctIIp9jSGCfGa
	byahjcTyDSn9E0RjjRG2uFBRuE6UjlrIXrgUjobBl4ocfIy/bBfX0BBCqDqSgvlUbQPYZO6SzQ9bK
	h2fJREbCiTiFUvLSfKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7gB-0000000DkEM-1whX;
	Fri, 25 Sep 2026 15:17:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7gA-0000000DkBy-2Hmw
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6+ZCox6I6XyvCSNnN9WRqr7BjiGU1q6t4GbQWDFuB/8=; b=loZbFf+AkJXDn2tG/GMVjfHLNR
	PU4NqcjVvvNparpvzxkCcbiKlrfyPqL8hltLFgW0KMFMbh/sOO6lutQeiizzR1EFFEXgThsgtwvFk
	lPNfKqP5HW5LR165nhcJJI7vN/cVaYKtsYx+6bZk0ELeVc1AR7Qr6pOURjnJbPGsER1URRf0TirhQ
	IDOD08etqt24xAB6wYQFXi9YbTAWefDKWPPF9EBQwZqlVKxjhsw7HYKjROkeKPrXD7lfWRRdVuSBa
	O7vrPYCpxUPsvw5vgd2kqKxAKPnF90UOXkhcoC0FQAl/VnmBwex6UI6t1cJDszxFKURoOvaiSNeGH
	l8xY1PEQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA7g5-0000000H2m2-1Iwu
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE99OF600036
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6+ZCox6I6Xy
	vCSNnN9WRqr7BjiGU1q6t4GbQWDFuB/8=; b=B+H5VGGLe+ueTu/jsPyM2c7vPxQ
	9CEGbjpLevonCkfYu1jXP8atyL0NfsSliGZpuwdM41akpDy+LYuJf1xflxTsdzMo
	gz1ixDlMiISeeXYA79Nsv7gcKiNC0yZSnUH4uidCfgxiYvPdJEULt23ekOwLglFv
	MSkMmJ/+Nw75s+JS13BYEplEp9Cq5ZC3J2NQM/XY9djuY2bHRSR1wV9QTIrFt57V
	Z9HHd4lNcJtc9YJSxzSFjxZIpXBV5HhU4xKRSpIora0gZzPWlPMPYew3GH07JL7v
	4K/BXH4cpALd6kmOK43l6hEQGn5pqw5lNBpYspV7g1k4VIpSywB3Lmps5DQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsw3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7989d8ef4a6so224141137.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349451; x=1790954251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6+ZCox6I6XyvCSNnN9WRqr7BjiGU1q6t4GbQWDFuB/8=;
        b=EGObKjODDx8Nck5p6HQxQhSYlg/FFqDflpNJUT1raRe1c5wmpfy7PwY4hoerg/PqnD
         mjspsd0gOgomxz5croh0HFCdxGe7w93QLxhzaQN1qIEk2zUzmfT2uSEVFmHKeqQdWB2T
         JNi37qqW9Q4pgXrYTDB2rOsvVd5wsuXavl50cuuiZAmNq82Z8bW20lmctk06XVYp4iPM
         /xzv4Qw6lFk1AdOuU8Jxc7k5UGPRCYyx+/Gu3KSNlgeG6djL8mIuC8rMeUinrOUOa9ml
         GnAGqlkpuHLa37zV7wF+JaN+wDej8j/uQ+/FUauJPbWgOhUMnZLyYhYz9eIBqqdFWRus
         Cd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349451; x=1790954251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6+ZCox6I6XyvCSNnN9WRqr7BjiGU1q6t4GbQWDFuB/8=;
        b=ouBf9KaV5oigxNp9nFJlifFCv03C8UmpkIDAUFK/wYGO69hO+FZMD0XyHw6NSOpwIJ
         wYn4glkbX1S19GvoUIqlajZStxmkW5/kiIKTKfAVOj2W1fQaSkgH6h+2bmfiXTgCuuH8
         Y3e5nlh9ptz97/XdgxNbcd2dfYmCaqS4GFV/dwanv4dIPWakvAJxLMkoQEfIff8Td09k
         LP/rFezVv06fmoB6PmAp124McyiVeEYkWqZWFNrIH1yqBUD6V5pKD20zG87xBZ1G8TEp
         sPkIeFuf2BDxOjxKMl+83NkPVa9KrDHWNFhqnQJ1OQ97eIMVgh2z4qWdGR4tC1tVSUGL
         wdKg==
X-Gm-Message-State: AFuF++l28PlJVF0iob73BEHFhVQEjUnoeNB8tYvoVwc0iwBmpclohBhY
	fpGEH+vAzrYyu7lfqQ778PrCQ7xxGFpoWdAyPn4pi2vgp6FRH6gOBdTGlILRLqKagySVo6PT28g
	Hja87ILXKI3z5SAL1U2ST9u9ClC4tZ+eSF9vthNiNUvLDZRSonPm1UsiuOwYT5RKD/w2FGPxEQI
	1Yx/w=
X-Gm-Gg: AYBFou24XCv3bBL2wP2kAcjRI9CJn9PgCWFkJBc44ffGCXHs/CmbaCjIr0+nsi8EFMt
	/G7J7PjyjBbQgNDgurHjXhMuH1Lfdmo5W1sXvhMmJ3/60c2c+Wb1YDQ28Up5vrl1JOzbtl+WC1H
	Amxpha9EMg8/lkv5PFjJdm91fVL6MKn8gwIZIJXAW+wVSAC6f8ZrWKqf9jWtZk9Nqz+dXgBeKOr
	w7pLV1pLdQd4fA5pRqGj/KlxwB/AdMv9Tbeeo5UCmM7nTsJmwHMo8OAZuTX0l8BGFPA23E+3AD9
	De4Cayb1n4EMpIiL1nxui7L4M7bpfrtNasws14Y2sYjFF0aC2HTk8l4f6czLJhCe5j/KQM1XURk
	WZgKM2p4LCGqP4mmBPnJ0ptU82VcOsxHQtOplBA==
X-Received: by 2002:a05:6102:4497:b0:7af:4a46:4c12 with SMTP id ada2fe7eead31-7b1c4a2ca24mr880480137.2.1790349450916;
        Fri, 25 Sep 2026 08:17:30 -0700 (PDT)
X-Received: by 2002:a05:6102:4497:b0:7af:4a46:4c12 with SMTP id ada2fe7eead31-7b1c4a2ca24mr880459137.2.1790349450416;
        Fri, 25 Sep 2026 08:17:30 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm8224246f8f.4.2026.09.25.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:29 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 15/16] riscv: defconfig: Enable IOMMUFD and VFIO
Date: Fri, 25 Sep 2026 17:16:58 +0200
Message-ID: <20260925151659.419512-16-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: VDfGDrfgRVNDQg1F7IkGAf74OIgerRtk
X-Proofpoint-ORIG-GUID: VDfGDrfgRVNDQg1F7IkGAf74OIgerRtk
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab6908b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=B9Crq1QHcyRNgBBHHYMA:9 a=zZCYzV9kfG8A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX1yOAsbH3Bck2
 kRXU4Gm2M/+pTg+5J+3g/fglDsSiGhi5cTCc/ZhIqdPfmWHkqyuqKzHSdhIbJDZIRTzMJ1PHV3s
 6JDFy7DfzdKFdC06UnSVZ9zep/GOvAo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX5uyXAhRX3wxG
 L8iSsRMCsgpNBPmQOGB4SdtwMA/qUqAuJj2J69C4yk8gGmptE+fgDoEG5Q2fSRkrYSQY+g/OW5R
 UJ2bFvez5k1so6HY51TAs8aknKDPqHUpP/Hhno3j6SeQw8TeIO77qTtMRf0HIiGQcylN3R0iocD
 TZdKNUXcQZ/EtrxzdpEJ7V8nc9RxDFD37OXWkn1Sqku/dySS9yu3V9n4bo1gNqa9pDEbU+VpuOd
 4Yqi5KJ+CeW6oUrCsSMwoODw53kRuTZfRHKG786reAcamb5IGMY5UFqRkBbD6Arv1G1YPRNghbn
 KcKTjKop2kV1xYrED2ozHDkyo58y25RqzvCBoVhHZ1zzTL3m1k2I7I3cG4Guvi7I6Hjg9IF5+3+
 wbcxFBspgsnhc45Wg4n+mkdkZhBTi4wPTN+1dQ7PzQVmdQO8p+787mQ40WNxRf3DWftbRCvUHY0
 LlX3p9tnb4OjOSBoC+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_161733_629198_DCF0A4F0 
X-CRM114-Status: GOOD (  10.34  )
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
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..daf382c05441 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -251,6 +251,10 @@ CONFIG_DMADEVICES=y
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
