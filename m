Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3628BC531FA
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L//RhYwDM7aKuES/IGnyhWY7wbifkreQRUaVjKctmJM=; b=Atlpun50HnJUEl
	c9M0G+PrGyovUAaZLEbJRPb/q4BOTTbZ7dXtXE4TsJJd34zg+FHM6eJ+V9o/S9hRfXOKUIk3tC+hW
	EuTZpc/phLTCGK4c8bhNYSatIzHfWNZmRP6hlZyBquC0ob7LF4OSNRbBAQqCRjm8ysKAYD/DF7VEx
	7AgFn66uagi8yuioxPE8AKzv6ifO+R6bycS88SeD2r8W4Qg1SekZ+d7PLpPaV4/6T1jiwbKWXuS6z
	gO48fnL3ZW6N/QkgwMEgum9AVklLoe5brdwex2Nz3mnbPdPpU9UY/5YiJyXmODrj1axd4VF1TLBri
	CnDkCU3lcJIfNaJzLD1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHa9-0000000GfaM-11h2;
	Fri, 24 Jul 2026 15:13:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHa7-0000000GfWm-3cHV
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R7YNZfOENHcYgWpnD4HYMuzIRdW2TX8OzaYCiKE22VE=; b=dq/YTQJKPF9waAzP89Kf11YBI0
	vQfe9qRpWQ+KOClKxjUlSScQcbuO8EoL1uQu7e+YuthmrZ6ti0o7jZtXutimufVDhPCzfnqSvGEmt
	6I+6zIr2w5mHnujbeHWzpBlxtC48PJnsEIMDEgY7+ufvTaOM8uj7eztzSp4QqscsAi5GMSSTwf8QF
	ChxTCEh8N5X6HhpSGD6L9pQ0PSIhPBa8OaFmTjiodEhR8cGtikybRDbylgOTrA8gephglpCkCZ+21
	MRBX5V9VzLEEp/DtEGUnv+U4fD0+C643yx+r53OX6zANM4XZNe+QLKDqCN7OWn3JvYp30d9zyK5o+
	g9b/7z5g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnHa4-00000002fx5-1zej
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbFgU3307973
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R7YNZfOENHc
	YgWpnD4HYMuzIRdW2TX8OzaYCiKE22VE=; b=odTxbkPQrLFGXTEGHp3WdEboF8/
	DsFlU8Bnne7tpcNNz625rqLtYKvqzgUYu9PXaRmzZMk+OltJ8ROc37d4o3jeoZGc
	rX2tL9sAdrOq3iJyNDuH2pnuGWJoUSpIuP2Wpsrq7S2l8cLcXa4R77nik3Ikgs1A
	+l7xds+v1du+XVKqtYwgU+LK3q3RKCIRj2upjt3MjpsUE8izWDCNxKpiwmowRPFS
	OFstzidsS2QZnGurARUtzkzDKJV+jWXRlOnA+3SiIRCWBjzFqQmF/XF6BdhNP0yh
	Pi1Vr5ALf362WQDfuKrdT6YMmcTUg5QLSVyYNbrJmtQT1G7EkNtuOyn7OTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahujjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso10063451cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905972; x=1785510772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7YNZfOENHcYgWpnD4HYMuzIRdW2TX8OzaYCiKE22VE=;
        b=Qte+4yejIo5S4gwKBCyvpIx5l7705yqpby1Fyfyi3hovtXpzzf9VYyWTULY+Kd/Jok
         rYzRGy/hgG08TfB1GbW8ARyr2ChHotqgxBsrasWJVT6f6mxPF8pzk5d3GnQjM/YC0Ree
         ov6Omf0Ff3R6Bh3jkAfSqlC97oRLya8OA403qkN/WshFDtS1YoX2aO6xDsj0ChtGi0QJ
         9QCPbT9wMYgkSBFfS3GMZ18xpHsmZ+cI9MMUWHqGDVU0+DLWEP72mBJH9uWB7ApHaR/l
         VT70lyTzx/hznzd5EpkrRU9EpdpqyeTibTVAQ3I0DlyHwSMxKZk+jikNXXgRCI4pFJyn
         GpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905972; x=1785510772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7YNZfOENHcYgWpnD4HYMuzIRdW2TX8OzaYCiKE22VE=;
        b=gyP10GhrmYcIv5vg7LyjieW7MnUXTQJyF7lZAN2qEOtu2lBcW/ELFcHOyLFfxM36tK
         gIaBGvFpLtiCKUeWmHoXXhurpYWruzaPL0Ndf09SSjMIDwiHgeK4n5u8/bfLXKTG8eTE
         zmoIOV5Ob0GF+NoA5YVNo5+DMzsNM5n/+iknnt9U+wk5oTcXigKXPVKVQ2/wamja6w+z
         1EA61q3oASMng4M7CQ2YG3EBmmcCtNQTy5yFVb0mRfD8akIT5IFAY+TeAW2rB2g81CQF
         RWZWhWtt5xdzv6WNqHvTO+VxZuSLgR0m3m6+doO9rKVGAnyGXKs2Uc4xbnOViz9f5gso
         EVJQ==
X-Gm-Message-State: AOJu0YwUmPF2Fgx8v3H9sHy3hOew1R3ZBU9UCsHi0M12Ok2Yeq1uvNU4
	5QlG9/DnHfmIlkqDDh3XudvV/5JQrSBk8fnWuvA57f2vDEgRgoJ2FVnW7f94CdojuIvwpEDhNDB
	3Uk5p0yxN4JWK/QXbpHcBL1FL5N30f7U7CF7dwnC2XmuXnx6HG+fQr5zmc5ktxbmzxTmMf79Yr3
	pfgzM=
X-Gm-Gg: AR+sD11BPXTEtzynutpt34X+aCSOQcYdyKQJW23bp0PcslhzgcFRGfA1FvmAf4Kbxxi
	iMNRmYkXK0H+lusXHXi5mtlYbicTkuMnIEs08YOcFYl/XGUertTGw6B5+a21sc74R7iR74oRsi5
	TwWhd4PziCoRMz11FvKgIgJ4p+825Sf9X9lXjvsjOz2FuKF8qmNvkmGn5cF1HqTXk8S+2sMCBTU
	/gP9bYAXDw58qOq8YNeupAfJXQ9aHdpsoicN/+xUZ5gNuRPhNn79zyVAFRjd+stZakDfQbkd+Jt
	pMHxK7lENeksoFk1XmO04vRrMIIX6VZFjPG+qfymKRcC+D2DtAVTnHx0XivYog/UrCuvanNztG/
	Cu17GrLPaOxOpuVtZ5SSh8FaFuLy1eHyK90gu
X-Received: by 2002:a05:622a:6206:b0:51c:11a0:9af5 with SMTP id d75a77b69052e-5283df52ff1mr73705471cf.70.1784905972502;
        Fri, 24 Jul 2026 08:12:52 -0700 (PDT)
X-Received: by 2002:a05:622a:6206:b0:51c:11a0:9af5 with SMTP id d75a77b69052e-5283df52ff1mr73704791cf.70.1784905971900;
        Fri, 24 Jul 2026 08:12:51 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c4ec7849fsm230083466b.5.2026.07.24.08.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:50 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 14/14] riscv: defconfig: Enable IOMMUFD and VFIO
Date: Fri, 24 Jul 2026 17:12:18 +0200
Message-ID: <20260724151218.965929-15-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX7YQXYeO0Dios
 d0XGiBlj2No1N4qDXcvyVmqE/J3oqNrWN81H59EiAapWBDw2MS0qK77JF/bFWJQjeKnTPbtSnKT
 u3CCrbr6iJ72zWA/2/kBOSIevB1/PtU=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a6380f5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GqzxFy3tBpXcAUtZkFUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 8zG5klYjW9TSW4fg4i3Z6PvYZxeMwtTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX/35ZTc2DnuSc
 U8dLc628K/0WDcDNeYA2Aw4pDqHzn0dTiyDJgoAu5lrjrczE2LI/ITt71lIXt7McbGMPtp5SIxg
 WSEX4dpl4Rw433VebvBUWbbUsLXmNsrSBP34MBYXPPgQKN2S0fIRRzYvX1lsIZHsxlfzU2AiuPX
 9iT//W0cYpWTVPbuPjEzzNGK9EfqvGRrVwI/Au1c5I2gAT9ULmwgT8DeHLAyFVhnjllW3s0+5+Z
 G14RYGrTuqGrVGQ64qO+FJIuWokxJujEETZDVEp5hJWAGfUIFPY+VLk/uotk1RH19BAKPw1GNiI
 2im97bzZGtBPQkTqyDfTYMEsfS0RpFYKoOzOWtUx70DY0lTa8Zz2Y4M9RqYsFb8T5gwFgWzWFin
 IVRsS9PU2sI/4jSelOtG2vacLdbRfpBmT9GrSEip9E1l5QKLLZqxsEehvI+/w7CpqJT/n4/6nPK
 88F4VeNWBk28q6adVxQ==
X-Proofpoint-ORIG-GUID: 8zG5klYjW9TSW4fg4i3Z6PvYZxeMwtTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_161256_834979_5DADE4C5 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Now that the RISC-V IOMMU driver supports MSI remapping through
iommufd enable IOMMUFD and VFIO.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ed605b5e3162..fb3cea5712b2 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -249,6 +249,9 @@ CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
 CONFIG_MMP_PDMA=m
+CONFIG_IOMMUFD=y
+CONFIG_VFIO=y
+CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
