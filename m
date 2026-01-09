Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D40AD232FC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ch90eI5/QJxk7BmyXwp5uYpI3a3xN3Vsc8OCuHBoL8=; b=Ar9VpyMt/K1wui
	X1Gv1NDyqkIuJLXJgozOrDDSRXBb3pjQpRrO5ZtC9yokHKJxuuz/IaXB33DCRSBJaZ7hm51yoiAvE
	GcyTLeOsl5GM7pYxWqy2Skmxh/2e8YoMv9WaIQHt7urVtVtEwtLcd/ePtqrYFG4sIsU9bGYN1xuR0
	nKHKhg163XXdoDi8TVgxodA6vtv7wYCidRiKGWVFo0ES8C1ongyqfoeFQM6VdNObjDA51+Z2t3HUn
	PxMQX3+94+Gv+JzRSc18fo7g0fo3Qs7QSSLUnG10a1ANakGi8GCU69ZdIn/8jE7Ea8Rck7vGUKvQR
	qUlgwlcAfw9tts4Carqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Ot-00000001xZs-1hSX;
	Fri, 09 Jan 2026 09:03:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Op-00000001xVr-2Cq4
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:03:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982bZo2184030
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V1pVonEOJuX
	JcP7BoStX++5XFX/aG8G2NnylegJ0870=; b=ntRZbJyg+8my8ljnN0AGP/4c3n3
	nCAtVLnBl9pTa3b2lggy65Q7ADypQisdrHZExjNrjnO5Z5uMomhdJzwelhbMxUmt
	lhl+3bPl1KFvyJ+v//7x6a6vnjHfY7/OzVAECTsPKpwZjq+SOYyaIPPPIa2XG52N
	e12ksXNY5bubRJEnCadm1c8u6UMd8DiRXP4zIj6Xh7jLywh+NKoMDJ93Ts3y4hEs
	P6swjzvLc4gk01QCiB3cLhAJWkJIH5oQcPEb6KWiC8yfCBScy30F0u62mMsVWzq4
	0sDADrmHWOUncbNf7NFqD3ZfvLDoW04Q+JF1x6p7y0pqUDjXi+NQTa2NEeA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn8676-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:03:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b4933bc4aeso3853371b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949394; x=1768554194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1pVonEOJuXJcP7BoStX++5XFX/aG8G2NnylegJ0870=;
        b=h8hl+qatOisGi5X+wBbAVJBGxtoO4NvwihHuI+aNIEdDF6A7sjKQQOiYyjuDIkLvJD
         KMd0PvjiOpYYAqjcDcGVwwj6j4Y68wju/Ae+n28AqvMCi525Mi4Cf27TCY7HwjUQEbGs
         m3Ppxm2p/lm9lG8AqBjRfHas7PmZwpFyNWor00udN6kfweJe4josPtoieEwFXpQuOwCy
         iG/0JMgg+mp97VGqgmnUbcftISuBHGDOAqv5gNTvazKznJ1gzDP9549KQzluUugyYJa+
         UjuA5Ny7Zfd64tWxjNquBOmtCg0Rt+VPqTkF9GPyRzOmYfn9udVCwdCjyfCQG/VaYCc7
         Mv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949394; x=1768554194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V1pVonEOJuXJcP7BoStX++5XFX/aG8G2NnylegJ0870=;
        b=WuT7A6kZkZp6cdkQc7UXO8iUd5Ibstwz25ByI9006Q9B0FtjdYb7mFaA9PFH6QJSVr
         2cP5y0QwQmefNALo3k39bRt4D0Fr8E73LnjMQ9KnYBkHv8/poISW3uUo/7j20dAGwo8r
         aBr6pVuc1RSMqsoINq8YfpxFJAQIzTnx3PUWEKncywp40Bm1HW5ma7xMpPqPNlvil7Cr
         gzpSvUEnCfyX9DKC7J+wCw3EYNI+Z6fQtkQessB06cKnx+J4eR2ecs2ApN8GfvfrItp3
         FQ/ducTKhXbzSAT7eMrVITKzRPDsZd86GEjsaSyzaNaN7dLA9H70waLFl6JTSEn715dh
         H5FA==
X-Gm-Message-State: AOJu0YyH6mWzlSWfxLO+LeIAwr1fMYAgNWTKPEPhJtQD6AdH8xGv02bd
	IcViuX8p40wA4/vSDDy82TlBYTka6I1FO/4Z02pXBeLQ2aYa47wGJlTT3jEWtxnVBdTRzczMJeT
	fa/2rwS1PGzyRS1N+38g/Yi0Yqw3Or02ntK6Y32oXAMYpZu1AavcCpSpBXngfrWawYyJ0/Xsh60
	TD9sA=
X-Gm-Gg: AY/fxX6oLsVjgrvsrdWtRUlobmeoP9/Y9GwmcD/jTBczRK/WZFwH7QZjrSLZsegRutR
	LnU2RVXggfAXfe4WUvKHYMClvwF4Um5gKrWJ1nH4cSGNtffcRlCAR60Sm/b2qtR1P1Dp3VF177x
	bLajx3a80DFvTao0OBHpZvI9J//i8jaPLMn3NsEo0y9M/MkRUcEFi0BW/rqnCe+xIVN4Zv6gDzH
	w+Lla+0ELzw5cKXdJsF/R2BPjlVVVxlUlwCGw7pH/MBe5wgTYy//DrtkQGpEPZlQU2q+YjWhFwm
	Z3Z8qDvUaVxMRjHYPONqxa5EKEIVGe51lQ6FKC9RejYTLdiseAov6Xs31zJJUuBrHNJPknUze7k
	j1PDm55vF2MJKQuHUuTmdKHzCLf4KwAeBK2kTuCxnOTsW1aF2MeCRSXFBnTrDOh6YIZKud1WXzN
	hu+JiUzIN57pEFMv8MP7y+xMxFMls+DkZ8CQ==
X-Received: by 2002:a05:6a00:4394:b0:7ff:e71d:49a4 with SMTP id d2e1a72fcca58-81b7d85305cmr7454248b3a.11.1767949393894;
        Fri, 09 Jan 2026 01:03:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu6Dzzr3vQDc5S1B/XHUHzgN4IyrQ0Y+ZBxjQJDn6l/lNEm6JmdGsaCaXI4BvbmrSGPo9+sQ==
X-Received: by 2002:a05:6a00:4394:b0:7ff:e71d:49a4 with SMTP id d2e1a72fcca58-81b7d85305cmr7454225b3a.11.1767949393427;
        Fri, 09 Jan 2026 01:03:13 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:03:13 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 09/10] riscv: Select HAVE_ACPI_APEI required for RAS
Date: Fri,  9 Jan 2026 14:32:23 +0530
Message-ID: <20260109090224.3105465-10-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: nXemTnu-k6zFJn3UEqFAD6kjyKwlTRwi
X-Proofpoint-ORIG-GUID: nXemTnu-k6zFJn3UEqFAD6kjyKwlTRwi
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960c453 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=B44PnEIMzw-PxGPnmokA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfX0PVZShFZUUA8
 YQq5cZJY/+0eS0aUZGjYeI5ZEkrPMEjiL4LkY/uMr2B/dBKG/XT7gJY9EgQs7yS+nPP2LOm99Lh
 C1Yi+eopYi4Udxb+wzYDmMPiMiCih+kp/Tr0wWVD6Wzxo08oBcngxBUhf7k5qyHETk0dFQbTyIn
 /1fGNAwArBvObyWyfIahB4pztSRrfOfhHysjoxflaK46OQWhXmugZdOkxPchC0EkIGGMhFc3rJS
 D+oQ9Nas74/fUfSM66FAJjIqWjN8yAaFfsJ15BH9wjXhCfn5okz+vBIEVVvDnyN+JAVLgsgE8nV
 raSmiSdXmNAOBrpil3OkWqrL90lcsF+3LvH/1gbhNVuqHzNrpxjnc2mPLlpffgzr41r1zFg0dS3
 sobsTvt9iIcFb4MvjcS5mN94QI6HCXMgwrOC+Zea8Jfqtr+v2MQJBEuiLviD2t85jpaqou1eQ5k
 qi6QvOwNqDoDtrib80Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010315_635952_EEF70271 
X-CRM114-Status: GOOD (  10.16  )
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
index 6b39f37f769a..ef3f052e97c5 100644
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
