Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C646CD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFs95uyjFkzjpw0CapO/LdszfGnxnOExdd+33GVPh4A=; b=agSm5QMPMUwF3u
	aFrm6/l71DQ8qFSy1GRkcteW5QIoHisPJ5qSZHG4pjNar6rJY8cGlF17ZPSU50NOeFxNLr5HfNemj
	soKYiw4PDLQXn/EoXmsiw4eYn03lEdyMSNp7JR9HhuUDeNwh9TY2rcAFCOXfCX9LT8ch+Tae+cBa6
	PuL5ktSyIMN7SiHjsZpPge4t9h/YKj9gxopUl4xonCvhXDV5xYzd9qW2sAsTzpSzeR6KuLKZLvcRt
	OboFx9hl1UitNIKLp/GC6lOvVe1tAxhKhkQm5YaGDJqYUgJzHaKaewHqo9mjROeOwXw+4LYS+XoIw
	db09SPH9GBrxMD+350GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Cn-00000001mWA-1CUY;
	Wed, 13 May 2026 08:44:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Ck-00000001mTq-17H4
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:44:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9KL2321248
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BpdgYqVS356
	+a0fEP+B5YTQRF4fTcXzt0S0SRfD6Nlc=; b=UmLLDQ0eXSzNMvpwnLG5/XnOyZN
	3Y8BRA1m+a4WyZcjb9sgMyCKUQ+NPMzjS84X2m6RKMGTWNoehW5uJYRVawYCpZuV
	Tbnomd29MYOIGQHX0OQgiB9yJWSKfVgJu06ejrnP+U5bmKH+GWLPkJb1yrAkWDsY
	oJbWG5cENFhsctGn8qCpK23+br2yfOw31dTRp9Hrc8vg17He39SpmTyuFgD3iZhh
	wjxDYdpLW0HsnJc6xnTcfF4hsU5vzG8v0szRlR1Dam/7j6LrjXQ9oBRKxHm6RpgI
	4QeY50BLqf8/+vSQQM7jgNWPN3QX25XADJ3vP0T6WrYl5kx7TePxCt0A9uQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu93cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 08:44:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babbeff9e4so77896535ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778661873; x=1779266673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpdgYqVS356+a0fEP+B5YTQRF4fTcXzt0S0SRfD6Nlc=;
        b=Lv3n3s/V/Li9cP+YieXfOEWTrG6aeNPVhzR5b2VbLAlJ6+mipLFLFgTN/90OzKoLNq
         gMC25VHIn2cOVnNdnc8GZ3Me0U5aRe9Xrxq2Jd4bKgkn3fYPsgRViy7VUOE0arRqqpQq
         b3gyYlgc2mPcvQCq6CQ2KN21+YP67ZSNye2vsLKgo4OQwSWOMZnSwCkcv/Uqfs435O+P
         NvvBdln2+b5Nnm2eJqKtiiwvWU0cm4nMqSR6kkHJhULMsDoYRhW+60gXmKk1/Yi/nt9d
         IBgrZFgvVNslMXmdALlA03d91EdHEcrglX2UCiTZ6hsEbViEUSupFIbPwrze99T1MZYX
         hpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661873; x=1779266673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BpdgYqVS356+a0fEP+B5YTQRF4fTcXzt0S0SRfD6Nlc=;
        b=kAN9R1ujQG1v8Dhvoew+B1fjSQVw+guz/IfDwaK+zVB+5/3QhcdWOh4LgZojLAzAuU
         Riah8Y9PDBk9pbGT8FTZ1+jczh3a+vNAlRfucRAI9ddEIkhOp25Z2vBFfoASQ9zlPPWc
         E2iM5SHBWUV8oz9Onoc9B7MnfNxNNxnreI2u60q0/dFqqIlLa13e6PsfMmXIRbw+rw7P
         Q+K158d8dQgdUe61wO2/cr0o0OjgkCVN/5LxOEEc1FhAVh4xns1rLcJlDSY/qFhCO7Yl
         Zh/3v2CyEsgufJDPJCdiA5ieYfDDZTAq5nKh3i0GAQZH1dsjKrfaulP619l9fxF9/qJg
         sLOA==
X-Gm-Message-State: AOJu0YwdtIHUzJLg5/OrJydVgztyLxTvaAZQbeXwNxX1NcKJQsvPd0z0
	4saYvEeA6o5jKDy3pwjpagxQntsoB+vBeG/Md/7Ynro2hnSDaaKT88slAD81oAxeCOxlZfKWTNV
	18P0eAmLx9RvQQCpTv6j/JKW6gWsowgfUFVx4lIHu5kiyqIjLHAYO3mNHby3AakJYUQSDJNtPo6
	wL4UI=
X-Gm-Gg: Acq92OE3vOFojuCKEC743OB6xYM5VWpu8ASoK7dYqAnAIxuxtGFJcIl7ZPFVszeUTH9
	iPoeRx6yiIbVeGnbldRqNLakdMRLhtbm5qD+8zmjqXPzU3Mq2jVu96h7jPkyYrLdGLZfg9BBpK3
	q9fMyuaKNU/yXHjJXyi5LDVXOZb4SFEEXsiSFIXBr8S86QHSrOOKN94bvR7MEVdHqhTsXwCftCl
	YAIf2A1bDpSDqpQx2ayRw6nIaS82pmv4PoKOWRYvV264VcNaQ75KDx7ddW9u0GTHVIw+QqA1GqH
	rBZVCcTKCNk+or1MpjuG2lgBIIIpJbndiIEBUuz+fKECcQaGqYakHZV530SPCblRu6ZxVvVB/bA
	ihinThn0+5MxIeZC2tqPdvECwggnDDbsKyUvf3n/dwZmSLkrqmmdNCRHeZ4SQLuusy3DwFIDgUQ
	AB2KJhAl69gxzHXESuhMPMVyR72pTqAK7U8VFftyU/LjlDSg==
X-Received: by 2002:a17:902:aa8e:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bcfd48a8bdmr42628675ad.20.1778661873031;
        Wed, 13 May 2026 01:44:33 -0700 (PDT)
X-Received: by 2002:a17:902:aa8e:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bcfd48a8bdmr42628535ad.20.1778661872580;
        Wed, 13 May 2026 01:44:32 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm169158725ad.5.2026.05.13.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 01:44:32 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v4 09/10] riscv: Select HAVE_ACPI_APEI required for RAS
Date: Wed, 13 May 2026 14:13:24 +0530
Message-ID: <20260513084325.2176952-10-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a0439f1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cq_Hu0Mfxj2oTTqF29wA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: cBk9wvKWaDwaNNilNa7-NFsrsUrgjLd0
X-Proofpoint-ORIG-GUID: cBk9wvKWaDwaNNilNa7-NFsrsUrgjLd0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4OSBTYWx0ZWRfX42SpGrJeGBls
 wY72UPWDfy72ODH1BWktIF+Z+JNHGFW++H8K4KJtzCF5dlW1LldhCSzal/o4yinJzSXgR6SmzBA
 N8SKhk3RMnqdNtD/xHx0Z3D/xZJO4gpeLQA3lRVYoSL55pYna8YhVqvidC1tgrb/rjDpXDapJqW
 5XHJfumZPc1lh+R1SFhxeXMfAjUpgRc5fSTXQ+fClq3Fhz4kDOzi/tWMwCUy5LNbwxM/U0m1cUK
 p3gvkyPelFs+V5qfxBVCV1tu9maKLmOMuUsWT3E1ya/ET+oG6B5o8cgKY25KFOlndrE6dVIoq5L
 8q+56aSueOX777wF9UTBhrERYCLH8OxiiIjanSOHDmjXAfQbzv8jllnvZ/ou6VATEmOfwtAnGD+
 u+rRdnSAf84TqXlYalfKQk2cNKK5Vk48P0JwjSwplFwtouCZ5GYBpxMObQySMCULqF/AMX9Mc3h
 9tJFRaGqOLyHN0KKfmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_014434_314674_EF07330A 
X-CRM114-Status: UNSURE (   9.42  )
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

Select the HAVE_ACPI_APEI option so that APEI GHES config options
are visible.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d235396c4514..b94b19fb4249 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -187,6 +187,7 @@ config RISCV
 	select HAVE_MOVE_PUD
 	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
+	select HAVE_ACPI_APEI if ACPI
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
