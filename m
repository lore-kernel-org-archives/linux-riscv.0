Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF7C5ACD3
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SizIzF2awZxsEgSGviHfFD7OP96mf9FW9YhqHBWbQWU=; b=q7UgQVq5YIqVHb
	UqW68tKq0msnmzJPiDqHnu31n2UEsuaYfWgRMBPAqAKo3uz3X53XrWvv5Y2TJ0ms7GISPP2ONJvnE
	o/p54+T+wDUnZw2g29+fgJAd9MB1tSPnF1EIZ5dE9phDy/7Hkku4Ci5JL+dRGK7CfcCW0nw0UVfxN
	28UOKyMjnitG7T0X3UBOLAedc1W5h39UlKHAgMys020iYkS15xGR6715LwILG7JbKzCX+1xT0nwAy
	l7T+KKU025qH4bNnnRLkDaMETBXUPm4ldlmTlw09faoxYW1oV3ICAmGdfvvxIwwvCAQt0ZlKLzQiB
	r0CmYFyrNe3lgZ0+YfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8v-00000008ZxC-2VOp;
	Fri, 07 Aug 2026 18:18:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8s-00000008Zqd-0oc4
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 18:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=; b=XJn8DVnKuFGGaHyIBWzEOq9ug1
	idjjXz7JCzd8/i4dfFaifoAaUgrfOJMBtxp/DYhAhJBX3v/+V1Nv+0GDSmSsHPoRVn31HtJo+dnBd
	Hu8Yj4jgP5P95M/HSyBvNKxQCteuNJd5+lpyAaoB/qjtEQ/+P32SR0hETKiBbkOYQ4pIglgjzBOhw
	XGOVkd0AaGXTH3fv+8d1WY9M8gVp/axiLLDxHMmAN15PMsztAUICUBCRr1BHhVIGEl7yX459UoxTE
	CNgh+gFkEkkh7hP77p3PrTDCH7+G4ltMU6wjlvv8f754VpMrrBai0FJ9OOzpV01owpks78kuMiGvP
	QUO6mfiA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsP8n-0000000CaHk-21C4
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:18:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOLuh769987
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z/0MUXfJDNe
	HlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=; b=Zu8i+JO8qo5RQBiRZRWeCmE4Onj
	IBnBbwXNmUcqz8k5UNDaQENfARBJ/Mz6/pQcP/wf7vKA4lhk1w7Z8xX7zFjiz7wK
	DPqJ7LqAD+p5gakPY/IMDcgnTclHWiLWmKUDYNrYwmgf1nra3ALUh3eaL9M+W2EB
	QdvX0hnnS0s9PUyI7dECcpBHnn269VJUqbTsF1ssrAayZhXDEezxY2tJ5y2l8rnl
	XdAhsRjVXWrEh2LZgR6MF7hhFUKwKvLQfxVLaR+AvDJU5xYfMkrToHum+kPdzof+
	qhmeYwQhUkjSePCVPHY/duI0pg5irtWg5AA06eEd2Wcthi5Ap8Gm9Al4Vig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu2v2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283fa0656dso29270851cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126670; x=1786731470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=;
        b=b+ItDFPimgti72dAq7xMmlb+r5kjP/WVtKxto31kblmgaIUllQix2skjlpuabXubse
         yiILmEjQ8/lghgYs4BF9MOXDf6xpSi9hPCAMqc99vAKoEmsue1o6UtDfesRAMW40HUB0
         KuNMWykMaCs39c7ubTxsGzGLQ0di3bJfqdY3zP5Ulg9rt/Bd5ulCNVWPIxkXiOj4GDQu
         oN2Fd5YwX83yAQcugrgJmL8hdPTosfFR217K0/v4Zca6xQJXn8K3SvKihFvcurSqsFrg
         qtIlteqWpxfl3BzZHLeXk9zobpKGIsPoBljQrTitioiyujkO/NPXnXQ3BNQPA9vh4w5j
         doJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126670; x=1786731470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/0MUXfJDNeHlErsfNSNArUm0DaS7PuJvPVjEpFxNjQ=;
        b=Iec6Qk8gjca883GEzrG8btH8oqxartrd7ACpCgjctgIl+VY1dfljyMU/9o8ZndekCt
         WpYkJVKVEySpcpAloOK6PFqLkGVZurJyyzzz8z2inkeSoiJ7S9xcFdjvRbwYw7+Rt/vU
         mSqU4GfhNQKfSLBqrx8n4FCMq5l+SLiofTXeBdQrCfOZeSGqb2vNcWERB18n+vqXDRXP
         xLMCbfXpXG/6zzcSzAhGxB2amw+287BVYnCASK4sCfyn3tB1iNBiKJqGlI6u9zbr1/XK
         D9bsR2DU4c7PXtYrtaCr2boTsrXKz8LxVWZEERqi4mO/5/lZ3+m6KG6JC8QWxXGzzVco
         UUcw==
X-Gm-Message-State: AOJu0YymtsTzzYo6RJyVcMRtNNXeu1Ll89O8eJ6t4bmnkK+RBQ+OYLbh
	MmsMckoyC4ob8IGv6lWEyhM/i6EAzQdoeeQo0unP+yc+scBBa7MPYzDOZ7aZGgQelMZtg4+GwED
	ztNqFqxrUu8ISEE+i6gD0J6UQR+MD7u3e/pCPeQrV5b1JD55VUX86CHQqvkI9yv9H3L1lN3xwsm
	Fk1GA=
X-Gm-Gg: AR+sD128SuC0SnB4KM3IBhj6jV2Pt4xg5eQYFAEm1Ylix5R9Wgxi7q/+UOLqZy+TFrb
	n2tRU5ke22Ai3D/FtCts1Q7y93dxKy2cOB5WpE96tiAnR7bu9DE3KTDe5QtmIIPOesFl3IvHKFP
	/XeDFJROUDcMlkHMCQEdOr4KZPDzBBQjuGFuY89C9bHHDvsPi3HFX/HTFzTQKTBYn6HaOuD/uos
	529ZOZ044ci6ef2T6Gyu82cUhHw7PPJahHjJRIJZTB8tnQ81XLq7qisXLt2Ot7JOpAUOeK/RG6z
	mc0LXirZ/IOsLhG9G+Sm+VY+kC8RaIWDCcagK8K48ICdfxCLyh9n2k/mqQMwVO6eyjlMvQVlZDs
	tM/SJlKQzJhst5aw9LUBfBIP2y4jve1ApzNq76vc=
X-Received: by 2002:a05:622a:a16:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52d236b1137mr8327201cf.9.1786126669916;
        Fri, 07 Aug 2026 11:17:49 -0700 (PDT)
X-Received: by 2002:a05:622a:a16:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52d236b1137mr8326531cf.9.1786126669484;
        Fri, 07 Aug 2026 11:17:49 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90eb4sm80115466b.35.2026.08.07.11.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:48 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v3 16/19] vfio: enable IOMMU_TYPE1 for RISC-V
Date: Fri,  7 Aug 2026 20:17:10 +0200
Message-ID: <20260807181713.228535-17-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: QUvWXYzUWi7A2HT1V8cyi-KXFLihPlH3
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a76214e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=e-vb6wPzIjHU0Swrx_MA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX70lH+DoiZHVY
 rthQvO6xJaOmti0ox0Rz5iXrv8QFKY/uplp9OmuX61z8IHal2nZMKauIu20ABKTFHF72/BMyIG3
 9/FRRZWUmfAY6fCxxXE6X/wOVHYzrww=
X-Proofpoint-GUID: QUvWXYzUWi7A2HT1V8cyi-KXFLihPlH3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfXxZaSc0ZGUllI
 gqG7kZFkTdM2eP+Fq0jWlkl/Ef7ADstFFvtPXOmnC48e4rvQXSEa6DHUSAvteaPOrvG+U+ydtgq
 dZIrGRqSR8nmcSFJgQ62YmI4DAdCuPRQnZIiL7Utf9dPL2/kTnMjyJy6ul16bam+CgNQWhEKfyD
 llo8hc1IQMPjfJxez4dlSO0iYQpZlyU4jMAC9qgkp4zD80rxoPjU8/1V7LC6lYibOvfM7K7GPQJ
 HktWO5YeKt2FFST1MC9XMuRUNhaNkTO1oFirnBJuwysnRFulXOa+JUdygGczE1L29ihhXIMM7fF
 Xbq8jmzbOxR+4VUoSfNsvFLXgphGDecTW2kPfDDOmW/jdg3sUn3KqmrO2QqTfet1soNrlgY59vI
 htmkJHFhWDEOZHvullm9c/ZA+nuskbYhak0cU4dsBjufpzKZ01SO4iDxLmv648591OYEgvrsaK2
 SWgCbhrw/rBU4k//nrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_191757_880284_08374BE6 
X-CRM114-Status: GOOD (  13.04  )
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
