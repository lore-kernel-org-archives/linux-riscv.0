Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EFFCC6B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 05:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUDEkXujT76tfSIEEFn2b0BJD+RsqqNT7XaMX7+R+9o=; b=2vClF+6TZ6l6ZA
	qcvkZ/EP7tQNJuz9Q2FSQIwPbCRmwtiZE221txpmOSbZhNgofFlMWlLuNXEWK3KWOnzsjRMBM34MQ
	AiF3drhdbsZcfZp5v4KMwxkbws1kvr52dMzv74U0Q5mpcWxiuBfpJwKAGskMRmzEIOkbRbJMFSaYR
	CSD5E2cBn1DMNHheV7cySW8i5ryrh3+1pHoM2mNot8aTicRkflBr2V59mjh6e5J59Y/kUmOhL56Yl
	PK9tSoUj/h0VlgGh+6o2X+F82rw9oun+mvdndZIha7ntPdwcvhlnuipHWK5sMrSTczEz8ZXfQWp/0
	kcqBpS+6a40cxsV9P9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVGu-0000000C1zY-1qge;
	Tue, 13 Oct 2026 05:41:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVGr-0000000C1xf-1z80
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 05:41:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D211JO4071765
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=; b=ZukXKvucprqa55nG
	6Ol3JABAIrNuktgDdaGS81x8aQCwhCsqsacUEPXAYQ2SQodmfxUcDvkSWFEOxUyz
	f8f/Lad1MWn4GWQ1p8i6YP9BXhR651v2HYhKXoqgk1vYqEnAE3IiLNSPc/UiRRYc
	IUSKpq/HuRxt5+Pl6CW1fNRR2lxrD3pPYzPv3b4X+Om0T9BHALkjZmCPDON+HPil
	QG47bFVQUKeB4m/XDb2sHPXoTdbUkw7Y+/8Dgax+OZWPjHpQpBSsxpqIpjelGJQE
	YaGFGdRcEpf5lmJ0YdHiYUbFwHqx6GnBJ5eSgDIzQ0P35ZBfWGC59IUZrSOZ9Sqh
	BuPnDw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjtvb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so4285033a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 22:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870111; x=1792474911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=;
        b=kB5PiDodt/1nAziaOFOD7jDIUxfe3Ws0Y87/TaOvsFoqfJsbnrkvZFw1Ick0vbVps5
         BVWkkj4ecrXRUb3LdZPLWFXrMib0QK+vFG5as9PxG9mZ6iFaRZpcnp2Ndam/TRoD6j9E
         s+46g6POc+sLIAEKclJKhevto7sDdACTRVwgyt0bodUpjgaAs9v9vekAu1xsmADasqgL
         7HrF4/sweBfNO6ZlBDw2nndkBkf3B4lluJtxogQo/30NSFw7OaoaNDvUmdl5/ClYWGmm
         +g+zb1LlWM9bmjs9adVkEB38OGB5o62TISOK9KiI/GfwUgbNFzcFR9kTKr7TBiKQdXD8
         C1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870111; x=1792474911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=;
        b=s0cE6woIVPlpRW3wgW4MosWx3JiXHeVzHmcUYNBImhjqOFGWrz3RqrivSJ/XhUuXQW
         iEkkp2M3Vua1G509T/vlhWlk8VgU8RBCgUB/VKKb+TOCjksAOXu9/WwFS21i8OwAA9oU
         yrL7vpV3qVOJBv2W+5H6rUiryxUZsv+72KD2uRb/w7nqIK0bBQmzmWKGWhaeySyYuk6C
         L3FqgURCRSJdfEZmX4YxLXa2MyaeRdeCVh2I8EuXtRdqNmxvNhZLcf0NCJaJfU/cx89O
         10hJE0dIg12nxgSwC1x1qym+s99SUNdjvgUw3WMNUHuIX8UYZewgAEw6qRiCgWXqoUHU
         ihZA==
X-Forwarded-Encrypted: i=1; AKwUvBwoa3cfi63nHHz/21JFUt6JJ1bZ9UxZd0xQFHY8EhpGkExk1rfCq+T1ClObBDEv7mL6XeX60r3pQgHpbw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIFmKEwtURI4X8XmdPP5X1v1XeFL0bH6iiWXKdka8wMMcpk0Z6g
	EN2hhrpvjf2iqbaWLWjqxmK5o7j/Cd3uNFbd4e9aYYVq6mgRbd3d+U/P8PxA2gV9N8fbW8FVEEh
	lrSZOZWDOcECy/VHFEd5kFMrrNMo8rHDIT1CF+14+yQ1bs+fKwm0gEamT7PyiCkyjlggnEkgKHB
	UI6A==
X-Gm-Gg: AYBFou0YVH4MpHuy95NAYkH1yO0983PcybHcsDgOYgBoI/aap81jqL/06ea98fAy6hW
	/IEzJw5aik+Q6oB7qSJHw/0COUj4xRtEN6n9tdQQ5Le3FhoBlgkhc6PGXntI3A8dMnQnBOCJ3Hl
	QJHfk1fpNqHkPeforbFaoQP8a6kl08xPnsnkZcydFGUOtw2HHQjhV/Txtf8F1VtTSpy/3tV5SQN
	bG3hH6FE1j9KpWqDjaEj6C4lMhULzs1RUpDPU3Syt57Ec8LOf4kU9UQkmZFt0DUasy9nrUyiD2S
	Wv7sahOeEi6sJ0CiysaLx4rw6jakN6sODp3T25eRYtvHv1t6qDq9oPy9sTLWTE279CNa71TQyHa
	5yYGQps63eYY1VrJ78c+ys+cBnxHXYDc6kyAS/4lToG+5qVlRqcW4Vn6IFg==
X-Received: by 2002:a17:90b:2f0c:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3ab3ac9b91fmr10370196a91.43.1791870111232;
        Mon, 12 Oct 2026 22:41:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0c:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3ab3ac9b91fmr10370183a91.43.1791870110729;
        Mon, 12 Oct 2026 22:41:50 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:50 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:29 -0700
Subject: [PATCH RFC v3 2/9] tee: optee: allow RPMI transport builds on
 RISC-V
MIME-Version: 1.0
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-2-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: tgi99VvcujkqNlJPdhaCABIghVWbuU3u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX9gnqV8LhJLTZ
 +DcfUbdC1C/8xAd7vateryZo3SxaNPTq9U5hm8oXl2qD7wpLDyPqWjYkkdXWoqnP9Uhv1yG/KyO
 nnsZsYaGNZZl6WCrwhI6zxfc2bJknh8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX9lqGUWVVHque
 ZlCK3j8A4hH4gpzUQPpzzuMqvp26bANFhM18DaM1DZ0fLvDdiqgXFUzs36XcPE1EyxdFvqW6Irs
 8HjEolLmRXlXPpWzUxZZknD0GqeCgNvK3PnYX1LcBLZPg+AJ/ymCzD37R+Zn8SFof5k5BLP+jAB
 wYpYdb6W4GWCox7fjNFKTDGPzjQ176pNrwcPbRvQIjWdn9B6WWobVf1XjhwFcr+Xnd/mTTr3T6u
 Zpsc7el9trnWn56oLcp+Z/mB9bzfeBoyxN2qu0wwp46ibY3b/4kFTpZ8HkZmshdje+z7XTqmntB
 e+4eUcq0JAncm2dRr3Mo4ejIgj9iakPrLR1ukXOP338Yg4l0wd7Rz+ScdFr6CRFbOK0MQzSkxi4
 XHyEoy/NcFRtwM8DJzXyMl8wOyZRtldkOsJUtXlZYC1+oeAyfXS5w05rvSzbcdQti/l+9YuICr5
 tVUYtrQTfqOmOiVCTcQ==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acdc4a0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FVoukCuPRgDGiLv7d_oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: tgi99VvcujkqNlJPdhaCABIghVWbuU3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_224153_639286_882C8A5F 
X-CRM114-Status: GOOD (  13.95  )
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

Allow the TEE subsystem and OP-TEE driver to be selected on RISC-V
systems with the RPMI TEE transport enabled. Prevent OP-TEE from being
built in when the transport is modular.

Common OP-TEE code checks the memory type when registering shared
memory. Add the RISC-V implementation so that code builds without
reaching the unsupported-architecture error. Reject mappings with
explicit non-cacheable or I/O memory types.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/Kconfig       | 3 ++-
 drivers/tee/optee/Kconfig | 3 ++-
 drivers/tee/optee/call.c  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 98c3ad083940..ad754b647a3c 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -2,7 +2,8 @@
 # Generic Trusted Execution Environment Configuration
 menuconfig TEE
 	tristate "Trusted Execution Environment support"
-	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD
+	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD || \
+		   RISCV_RPMI_TEE_TRANSPORT
 	select CRYPTO_LIB_SHA1
 	select DMA_SHARED_BUFFER
 	select GENERIC_ALLOCATOR
diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
index 891dac63cab8..cc057c76de62 100644
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -2,10 +2,11 @@
 # OP-TEE Trusted Execution Environment Configuration
 config OPTEE
 	tristate "OP-TEE"
-	depends on HAVE_ARM_SMCCC
+	depends on HAVE_ARM_SMCCC || RISCV_RPMI_TEE_TRANSPORT
 	depends on MMU
 	depends on RPMB || !RPMB
 	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
+	depends on RISCV_RPMI_TEE_TRANSPORT || !RISCV_RPMI_TEE_TRANSPORT
 	help
 	  This implements the OP-TEE Trusted Execution Environment (TEE)
 	  driver.
diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index e046aff61828..267513cf4ec0 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -604,6 +604,8 @@ static bool is_normal_memory(pgprot_t p)
 #elif defined(CONFIG_ARM64)
 	return ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL)) ||
 	       ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL_TAGGED));
+#elif defined(CONFIG_RISCV)
+	return !(pgprot_val(p) & _PAGE_MTMASK);
 #else
 #error "Unsupported architecture"
 #endif

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
