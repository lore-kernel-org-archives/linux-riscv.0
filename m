Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DFDC2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/z3hRfp+yR+PlsVZIgccHKig6HTvUdgdgwoxoX04xA=; b=mcEQE4gm8JZLe/
	bTAgrsSUwaULebrnha1XFmYkEVE+Mhjf5CqU6TW09dej58BzNXplXmt368bSw1wd1wbr/f1Z3pvfP
	NA+0PeFofw7hy+OqQhQB4AHg7u+PnjzzZpXxt1uUw0zJ1qveCq31l/MDTqWkocNJO+RmLS+WA06IB
	OZPtTdIbDEnE1LCop3Ksa+syqatR0YT5qSmGAwcuzOPcc8enx3f1tQ0zbg6C0NiNCv4fdA2SuL8wd
	bSPx+oCD54znZYH93vXuA4FkNvpFVuqyE0zbx1FThnZf3cbvUrn/jwoHltIUARD8y9bb9Pjgk2AI4
	FFAT2ZtXQAYCCVpAoqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPfG-00000008d8Z-1k2u;
	Fri, 07 Aug 2026 18:51:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPfE-00000008d8J-1P14
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 18:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6hyaE9/hr6o71lnQwh5ZY9FRiUYlYY1mXTfO2PBThD0=; b=IVOxN+H2FATlB3J1/cmbN0eFI8
	myiH1Th6oPF5Hs1mBAcjnLlPzovRZCz0T8vhmjdoWzIj0Bvd+ZcWWlbhWBENFsPq32Rv6iyb304uk
	mR1srqegex3rTY7CEkbqwXGszmFX8igOYqqgVsgh/xRXMGVKvArMjACDpV/aMyUAxEHPsrmzkyarW
	ENoJNPARlfz2wSE7XRWZgEw308ihCz7b9JZ1OYk/CoNDOsR4GMEdkPeLfDmF/fC6McWn12wcO+gzo
	j9iJyG6qoe3+vRUOhssd7oD6TJHUDIJnbnx4+qZX+caUZx7TDViAluSTBwZN53mnBMK9e98+ihWzG
	dUETttag==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsPfA-0000000Cbct-2KhW
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:51:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GbVwE1825861
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6hyaE9/hr6o
	71lnQwh5ZY9FRiUYlYY1mXTfO2PBThD0=; b=Y8nu9gVfTwMvcAKxH2FFXkNZ2QO
	3r/b1LdsjztA7bw7p+FMPwAmPajUf4r2q6trJOIxgq99vJQut3Oy8x4+wG41/8kz
	tIxyoxbItZeEXo9aW2QQ9Jta+Gnb599t/iicNFnbJfCogTs1eL5NBPqn1l5a3WL+
	cxA9kQRuC8E+IZiPC+ZtkFQKdvBEgjHBwzPEzPLzVO4v62VwQTsWmC5g7gKcroCA
	mImiKTJ/Qgzt7je70A0Dbh1BqIlPReKGfc6U4EaycTMdx/GUqI+j9lDfHWjCKqOV
	2oX3gnt2ElEd5trWPLEdKz6MFvTz3w67uD3JnQfIkwlOLlvCGmHpFnl72Gg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwk21gf3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8db414c7so45502051cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126676; x=1786731476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hyaE9/hr6o71lnQwh5ZY9FRiUYlYY1mXTfO2PBThD0=;
        b=Ai2TX01rWpqN0ja2xzPTAi0Mbp+QH49VT0XESZTUrOclCowiTn7RJEFnRIudjVVq7X
         DAEuXIsc/YTlJzqDmJFwoVyVwc5BwO32rd54HNev1UJX7LFqVlFlSgZ22SnSHfj1lb3J
         0KWX54itDd9CgG8JFBp3sY7IursGxe7TPGfXTnvTJ6dsiwm+7bfrM0CmbNAunyTAZ7BT
         uPjBJXhFdEMoLa0u9NOdSSWWq4xxPBOvK+XXl0tZEhgmtxg5GIMB9x6pfSfcl9cIDYvU
         bkDIuV+jmz7TWVj/MqPHQObf4EJQbKSqtZQwQBhccLsp2HinIgMxyl9FGP/npUrnWwFY
         o82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126676; x=1786731476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hyaE9/hr6o71lnQwh5ZY9FRiUYlYY1mXTfO2PBThD0=;
        b=RBLdzh/t4pnZkdk5WSgT9pCzaXcawzdhuO5tAQ00PM644QK29TfXtl9ZU6HyZDYXMB
         8QyoMo0GA9gNSqHF7KFNpOCNm5fiPUKoWOrhcWkTKXx0s2wqF/ahIZKzXlRG9++3qYDA
         oQf6Tt8J4b2m27la3vv7xbWM3sHJSy8sWS2SiBT5xG/awpvXyOEJFtRJrL35c/FlwfoH
         tcvuZq/h5LRI8SQ0T2e0XAKgsHsqXlPJQrKXeHvpNPi7rK6Zlk4R9ij6pbOiM2qL17xT
         CjWFuf9+znfmhY/eGlax7+22UevtkqJRbtxnyod+ZIMzcfmEn6GdQBOQjFCM/NGoxHI7
         9h1g==
X-Gm-Message-State: AOJu0YwNmA7u1qwe57wetxaJTZZkSJR6UVH+OpnK4StmK+Xb4DCjzFbC
	z5hf8ATAnw0iM01U+RtMoL0QaLmEBk7yLwRWKEoiyQFZUB9/o2hqJcxe0KNLD1DRr3PL69NvGT/
	0AiAEeB6RHnQVV34McJ0tticwKXHiTh8ftvz93LsX/S5kTCa6mdyO9+9Z5WjYFpLGAHW84gIJ4s
	2/BU4=
X-Gm-Gg: AR+sD1190vYcY90eyF6tMQYZu1ZDGXfRxcrapm6fyZYig7gyjuA9V8gwebtQDRtoXTJ
	6cxj0i+FDR7UA4PjZguL4ZiG5Yv+cEhS6WOVoJPAUsw71pnZMN3cvKL9bM21XJaTpW5B0tSgRfO
	EFQ/pFHakTF/mcFI386PIpd2r2GyGfzJei+lRmQGNHHW/GwTlLmiFFOLWNbj3v5wJNaXLvNL0Kx
	jmw6KZJqWVbbLHDXtJavpcJ47375D1X6IHKHK4EfYp4NXXjTx0SA9VvzJchaPJwjZUab95meGiS
	6hmTmzFhjMEboZ7pz7WAvOUFmGzqgdofb6BTBMQuqfBn4baQfDEul747di9xEO0EGYtalUN4/A1
	mu6uBR4r3ylwtkn8AvdIc4jZ9s21Wg6xjFxCwwdw=
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr32374751cf.43.1786126675687;
        Fri, 07 Aug 2026 11:17:55 -0700 (PDT)
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr32374161cf.43.1786126675281;
        Fri, 07 Aug 2026 11:17:55 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cf6fc7sm80926366b.56.2026.08.07.11.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:54 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 19/19] selftests/vfio: Allow building on RISC-V
Date: Fri,  7 Aug 2026 20:17:13 +0200
Message-ID: <20260807181713.228535-20-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: -NRisYewfySi2ogTAZ34wSj922zoHs1n
X-Proofpoint-GUID: -NRisYewfySi2ogTAZ34wSj922zoHs1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX/ROv03KeZkCY
 NdJVA7gB/gVLMIehLTY40sYanI8Bn4AW4kMmJjV3C23Rr0kGRUyRxV8BgOvCVxdIgd0w1Pcr7Tl
 dEGqY2yZ/uBI7pvoghOdufcngQX9x0Q5TugZn7snpT6DAn6/iG5uo6ZsJyjzuxC05azbUnwSEGB
 tYjSiHtktNuavf5JzhtgTVrZXGXpLF9Sd81kehlIJrpwdWZxXlU3P7Et2vLEd123Nq8HLvAssvV
 nCKU+9BsEjNvfATsM246NDp2rpNmLLmmL6MwLoSHxwwLWDjz2jYhZ3EOgO/o6YfIIHV5uOTb+1z
 lkPdYnWj9fWbbtqeXSZVkm4Lx50Bj+MF45wyEnzWlKF07qsjNk3LR/mfCM+tcynv1J+c2ito+rD
 rfVcMHZg8UJpDD0VRcgbLK/ouRFmAgUwwhDG3yK/MCvN3u5mRO5BK7CAmvGBLaZ7CaU0S8YMeac
 RLDcrVF5nVoX7y4H0JA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX9Hz6Iw3tIu/G
 YKZxm6r9WE+c49YWdllDoJCULW9loS9fwfph1JjV7Fld1SRaThyORRl1Ur1hS85S3BcT0oI/rx7
 DIXXWBAF3wL0W3dS+eG05vxoduFTG4o=
X-Authority-Analysis: v=2.4 cv=YJevDxGx c=1 sm=1 tr=0 ts=6a762154 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iQCmQhr-3cNeY7cWxoMA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_195125_174990_6D049AC8 
X-CRM114-Status: GOOD (  12.02  )
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

The generic VFIO and iommufd selftests can now run on RISC-V.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 tools/testing/selftests/vfio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..c39f95086a54 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -1,6 +1,6 @@
 ARCH ?= $(shell uname -m)
 
-ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64))
+ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64 riscv))
 # Do nothing on unsupported architectures
 include ../lib.mk
 else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
