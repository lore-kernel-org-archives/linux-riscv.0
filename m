Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CC1D232F6
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2QRa0QCWEid5FeTbzOePKppFWvj1nUg7z6rsYF8UgY=; b=IDZP3tfwAfznaR
	h+jLDjdRMrAddtMYhgmTsjAYiDM77RgkMyNHCSxiqW5FBY4cDzxe+XvHdEpUqK8m9Iom/skLEkCm+
	13mMET8IHYbiKa8F828engMLZIWb5I4VCGM0gMaPp7SRg7ahPvzQVrJEtgjFdWbzgU8Y2Uks9dWIc
	M659IebacAnMT7plLko84A4WHAYTqyksUsryPBZkBVeoFXn9ufAGiXK/GtH7Y5SHL+eLEWEyO0FHX
	3C8cHpOx4x7AoyDJGd1NS/1opZTixLqqlDsomx40LrzlMX82ibKO+YPCRv3EN3Ikzh8nLd76p2E7o
	XaYUmoDkJtGOHKWqrpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Ox-00000001xe8-48KG;
	Fri, 09 Jan 2026 09:03:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Ou-00000001xao-3YbG
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:03:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098QQCB3526962
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CYIkrEqrqp8
	jD5QuPnx++ARhgF+TQWP9mqsMoFPAsjM=; b=QYhlGNSa1E8AeS+9k6scumC25RY
	Llo1ynUGgo1yhtVX3rnJ0TyHR8yxA7nGZAWdiDYJq9ySB/O3bjp6GXTDmbCxyp1P
	7HdODDWvrF4RN72k3dg2LD5a74XVPB0lEQ4OcBv0zKvS5lV8RFiv0+TcT7bltSb8
	Kr8OZnN+pUFYLvxCUrWaMI6GHBANnzcVZg8ucs1PPDIIkx7PSwDOnNSEw64yPWdM
	YTMmnGJQw5aScR4WZPRtL19BFXOp5nVETix52Jz+qI2yYubXe0lIykqx21wAQivU
	o3+S2vzQMkk12y836vf4OwBL1DqnxTi2ucQOHcel/cD583VC7OqVsV5NtAQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjhwx241u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:03:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so596642a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949398; x=1768554198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYIkrEqrqp8jD5QuPnx++ARhgF+TQWP9mqsMoFPAsjM=;
        b=SeBBxmW08z2I+fR2o0VCBaazjluR2ij7iXfkDbmdGKskr+TnZI3wOa+e7gscUtv0QV
         +EDQLyQp3bzHbmI14k7JzbQ39nS/yULbUcxbYhB7n3ko0LmXGio0cmtgbO/N70Xpv6u+
         j02sZSWKVTQPeGoCPOB2270DduAWBCVgdyZAOiljfYzotBD+XE5lZlVoUw+PxIFYkcEW
         y8HDMc8D3jwF+eYjojqzJpL7PYkmNFcjDhtZlSrCj/rpeckZffNUn7JgHbaJaKdKCQDh
         fmR4c1QHVhZU+/dXID4OA6PZeLpwDMRVn1FDQf0vRVxsIrBYqyvg/BjzoR6aSnhRF2WF
         YKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949398; x=1768554198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYIkrEqrqp8jD5QuPnx++ARhgF+TQWP9mqsMoFPAsjM=;
        b=DId4p2wXxW64C/dJEyRRNNRKM3XV/HsRdwU4PvlK6jy+2IV6QhMMWk6KjIWs1CBQgs
         DVh9InVLkgpb8JizQcxxe5Pgt4CDPxGkiDCDPoG9YjG1MCEBwMben+iDlEJ8ooGjy1rN
         RO5j90FZ9ZLkhEtd2pXjZXq+tqVi5Q/b5BvXlZEWV8zL9fk/AImmlYoZL0f3WSR3aHw0
         huEDdqpa6xoIH0r3CnPsX7AhhlckbN8UBksQQx+J3rMtvh+6UuDPfSfyBSQoAFRGp5S2
         7ltzuMW53Dx4ERkJ4KoPwWlLLEhh84zNMFSqy6FjatfTgMunFeGBSw8FJf9ZHcJa40la
         AARg==
X-Gm-Message-State: AOJu0Yz8FNAC9CawibGPlVpJrz+6EK7oPcdOY7QcuSco3wuF07Lw4pS9
	jYISz32U2x+/OSi4LeEy40R6LJlSkRFP5QTRAgjjbVEcU/xaVqHBebHRhr9qFGM0qd2FWp9NUku
	9QOG1+PF1yemxaLPTAigLwWftewiO5/mXcJRvEUX/bAigLwRYdGip5BPC3XZpURbV1FfrkM2LJ2
	SWAnM=
X-Gm-Gg: AY/fxX6MG2w0106hq1F3wqPey2QoCJxMMStArIg/es6GHC7QdKT3snsTcESv+pWhujR
	CCMYAsBMP+wlXMH+rURtJcLE5E1t7/4mhYINtbvEUTrRgvFh5A8Tt2obXtgNmV04wl+Y3GPLAXc
	b2Su3RiuKhbS4ccZQVLTYrBYR+Eg4VS3CMLvigweN6QQTp0kwl9KpVFJn94WE3u/+aN0yvxFD1i
	Oo2AmNLyAuqOQPaMjj3SsqXROx3FuP1oJhmCQ6IbTW6b2rYuDupaqmIDkvB2HlkfjgfKQFDGxZV
	fpT2RiIAjXhppjqdckmF4JjZMSesotLNm7P4Wd4mYbywwKY5cRVTTtfNv2Tyoeijo9MuQZd1GPy
	yEDgR9Ohm3TcYxPlNjXX7HXCntzbT+guIuNSGp4ObBCIV3C854cgGlP+QcuLSutbhDZYZyyLf3s
	uhlFZP6Q9VRZHq44cnR69tuevxewQs6I9Yow==
X-Received: by 2002:a05:6a00:369b:b0:7ab:4106:8508 with SMTP id d2e1a72fcca58-81b7de5ded2mr8194210b3a.28.1767949398518;
        Fri, 09 Jan 2026 01:03:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZwwdauYHJ7mo9yWi9RFBYJfFv9+fHWbIuLHl8/MaWDzNNkxmOHuFcgwapDAslrzzgxq5nlQ==
X-Received: by 2002:a05:6a00:369b:b0:7ab:4106:8508 with SMTP id d2e1a72fcca58-81b7de5ded2mr8194191b3a.28.1767949398002;
        Fri, 09 Jan 2026 01:03:18 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:03:17 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 10/10] riscv: Enable APEI GHES driver in defconfig
Date: Fri,  9 Jan 2026 14:32:24 +0530
Message-ID: <20260109090224.3105465-11-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX5G6y5/1Nk5DI
 tJe5/XyWtPRaie2NUzLEMvxcz0hdTnrC60byGfbQTNTwKKh2jzm911cgauio7AWEQxyK4y6MFPA
 BOTdf4mLga/0FWkmzgoO1hzacHsd4fkTnLZHE302ZLiuc0aceTpX6yvIPri7LxuqKWYW+OcgWos
 U/NG5zxeAxtR/Ei1VLj+c7g8GEbwzc17tGlnStjSlJoRPcv76nzbbWbID4hZvDN1GQnC+VmWNxl
 lgDH9B/UqvMGFkE1XV04WfCwFluUcAlZknXMBtVw1WyLyn3/3xlt6yRfpw5EyVB15iTERhkCSt2
 t7IwiqC0DF3vdUpMe6Oz2aTCQmYn1LKG8Dl/JastDfXrDbqzhQnICJuztQmH+YddU7CqDrVHYtI
 I3tzp0ZxmzBTsnDhqWyhW07dL8NBoSBxKsZbVcEGnlcYdA1dqRTJ1Smn4UInGtKymfy0oVMkOb9
 5RGTj0Pt4l531A1Nelg==
X-Proofpoint-ORIG-GUID: DpByIOV7IufU_IisJJ-WXA6m2AtwMNDj
X-Authority-Analysis: v=2.4 cv=ENILElZC c=1 sm=1 tr=0 ts=6960c457 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xUlk1AThICIXWUt23vsA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: DpByIOV7IufU_IisJJ-WXA6m2AtwMNDj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010321_035739_FB8F8AD3 
X-CRM114-Status: UNSURE (   9.91  )
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

The APEI GHES driver is very important for error handling on ACPI
based platforms so enable it in defconfig.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index cd736a1d657e..38b4a802c2d5 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -46,6 +46,9 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_ACPI=y
+CONFIG_ACPI_APEI=y
+CONFIG_ACPI_APEI_GHES=y
+CONFIG_ACPI_APEI_ERST_DEBUG=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
