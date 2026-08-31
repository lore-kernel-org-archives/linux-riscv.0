Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B67C624A5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zelqcoOw6rxZwgKPQD6lFAuZO15dwhc3/zcZirQaskA=; b=0G3LMZzL90BN3N
	23wTgBNbS/bi1f+yWD1BT4Z5jtKUuqgPLITww/TxsqDtwbK1ucoJhSVsOeRIuGXBEVVqnQjQVY8Ax
	A0n1C3R52fCQjOaWOz2Z7OrfwnfLtlWn45Q8OUqG72GhglgocsbVgKq2rLw0BVq8XUXGgd1z7a92C
	VgcFh0742KwyUPwrEwbFlWOQ+n8KaivPG2zxM51FZTuXUXhWDRXoV9q5S+E5Fw8Pm5I4M1s4l1yzT
	xKIEqKz1rZRWiyfm/jHciBulB5zpLwpB979khSJ8rGr8xxmf3mqNf8+MVT8aDpnWlgXCV37rcamm3
	J1UkMINEFO1s+9K/5abA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Ut-00000009lFA-1Bqe;
	Mon, 31 Aug 2026 15:00:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Ue-00000009kqM-3gJC
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 15:00:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETc4F121945
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PUy1Ahq33tP
	rFwLZFHXp5jDvTROASK+cDxI2gHSvBWE=; b=FYpHZc3cCM72E3+XZmksRbmc9/Y
	Y/JbWcmIM7mJIbW6570Doq8DLaazi1zvFxgFtg52INa45kGJflDERYZmA/p1MfxP
	CDpzMDl37f81WkDNjjDwGYeDRAZSkLO4gJdeyX2x2kQoWh0ZzPV+EWYJSxwOSBOC
	DcQIHq+65cc4FvV7VvcRaEgYh2vup0xTYIb9XyGcaVc2e2VbO0Y5ErqRXfNiSHy0
	x7rjQpUFSA0RKfl1TTyBQpWHQXUF89blhiVX8xShmGaHW3+Mwh0fX0DnxaJahpYC
	3FYfOA+Kepzfzdh2Yw5S+2SiRen68mHov2Nar4KK8dquUhqJTlbBt8HMtSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pma2r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e53b8a302so499015985a.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188415; x=1788793215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUy1Ahq33tPrFwLZFHXp5jDvTROASK+cDxI2gHSvBWE=;
        b=Lp44+GyjDAWP+KOI0Oxe0BvCVvAS+DZJs6rf6BYmTn4wq/XLjKn3bnYHAZn50AcITM
         oUK/A2HD+ODOhmfyKiziHmGTupinMzK5qcTZGCwWUg708W4FuTR9Ifv0Q1slvHEHB9B5
         9uX/QY9eiXXnhkTaOoG70DYtTvXwy5eZ8DDx9yl5Mph+lg1EbsCCSRmp7LczqXco/ung
         SO6w2jnjZSf+xTB1JOzQEWgfXu3nlB6147AwDLKxRRC6pUr27ThcshAh+iSz0nVg5Yv/
         PzbuNqZBLA5vjDQhtYDnq6qSNnDvnfBIlvupoNkN20BfHxqe8SAJq3fM3JkNpfkJJQWh
         I5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188415; x=1788793215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PUy1Ahq33tPrFwLZFHXp5jDvTROASK+cDxI2gHSvBWE=;
        b=PAZieZt6gjXMXDvgkQBUaJvss8kd9ElttLSZDlezmW+d97tpNtQBbrClu27o183ryA
         eXDj7Oai2Jr82v1R+g4NuIrKdK5dpUxPNb8TvIGMl6hbPV9iH2mtZo8kXntH/CyIvURF
         m7Y+MEEAndANEFnLzYn5Fy1NYkKxR/p+YdxsNCRn4LJcZP3K7IRYKXduEu/AoQ3i95Pc
         +33iHg+Fk/En9ZCxX60rVu9UJbNWFgjaoHTUxiiT6mGb8oVmRdoYIc+3qyrZELPt9sCR
         WaFanmccb/aupBB279UGvkP+Ty1ZUa1+5s1CigYI3YMyHBt/PkGtlJzalKzd2ICM4bl1
         vCGg==
X-Gm-Message-State: AFuF++msI3QbI+3R5bVzP8bAyc1NUJA7zxbbbmz9Tbxr5LjHUPHf7g0Q
	eHrm4vUxqFMoZoxVzFqwLAM4aiT6U6kkfmezza2obZSkuLD20xjkjaqa5hbVYBw2m2Z3j+LND/n
	3CiRqPn3UVaBLUXs5QTDGGoTGE1nY9U1agnB8WXsz//FeS9TuePpVTn84lhy/6aG8gWhJIuGAaK
	d1XV4=
X-Gm-Gg: AR+sD130RnuU4AFKRfjZ1vSJDAwGEEzaRrIL9uAA8ZgXKCAwysJBE+0jA5idUfqAEMm
	2N/QlL+s88M83LVQusK+WgaJ0zr3w3KavQnaTYy79Qyv8tm6WmdiLgYTSYJUMaBB/l1kf3Lq2Y0
	yCvKgr1DdcPTkDifIYz6YAIkZTDggf/Rd4J5s6dJzrXh8F9MMfQOOvE6Cdl2teMx5C6Nq5volBM
	qQ7tVWHIiybTKxPSVzGxHykrdxoK9DteXSC2IVHeQcuTsSIja/uvKTFzQ22VEN39/kNd3LdnPHp
	udleAQxU1o+flO6SsKVgo3jcbsiUop2/CrU0pmYVnVsNxrbM5akYQuorQRgx5JKuHM3FzfxWhtc
	NRSr+z9B+pLQAfnQiLzOhGOo19NjEZ51cEJc=
X-Received: by 2002:a05:620a:3188:b0:939:4a44:5f99 with SMTP id af79cd13be357-9394a446245mr25534685a.10.1788188414827;
        Mon, 31 Aug 2026 08:00:14 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:939:4a44:5f99 with SMTP id af79cd13be357-9394a446245mr25521285a.10.1788188414092;
        Mon, 31 Aug 2026 08:00:14 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd775dae8sm136267455e9.9.2026.08.31.08.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:13 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 17/17] selftests/vfio: Allow building on RISC-V
Date: Mon, 31 Aug 2026 16:59:43 +0200
Message-ID: <20260831145943.313726-18-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: supD4uc4riCMXJN7VtQENkm7teF9sE2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX/KbflIaxzHGn
 /qKI5RrCHyy2taxfceJL+5BZIdslokhOLAu5cAxYOe2W7VsCrcAbdMHO2yhxs1ORjyG754wSHqH
 dJG8kCacmmoYtZCpLHM4qKCLO3XEtDtjgNC56n9il3x7TAXTxy4l7z7YiT2n4hvnxqts/CTsZj0
 M2ESds6FBmoH3ex9Ithvpugu6mRGdHTN5//IFzKn/fqDJ0OVpVIXHVcMBh4aj2IeUBLdvnStMfV
 XejEo9YuF32v5BFSQ1sStU6yMh0OKi+vLscSU3bZ6ylGrfAJte8iuC82Gv+ishv/72s8XNwxaau
 tm9g2XENhTKP8xvLxSQ4S6NA3Ie3Qr5TKMTg7wP8oyJcL3EBgF31cPWfbBoBROQ++iUAlPHCLOH
 //ajGI2Rb0efDq8KkZR/Z5VrUbrEhwEdfd47tYkxDAOQoCBj8vEhscLzlwcqwN8sUt8NOzrDElg
 eTJdknolyNdMgO3mmlg==
X-Proofpoint-GUID: supD4uc4riCMXJN7VtQENkm7teF9sE2h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX4JYWm808OIrR
 zvTLbSPRzdlGppL2TYs5mZWxnJq2PxQ5MY2ezYetbU0s17iPRXAu4/tGPwsaCpDt4T76s7upxEx
 loCbwb68+Lb+P1mGz3ZA9D36P117pZE=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a9596ff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hTGq5wxE4AYYcur-NToA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_080017_060962_07244634 
X-CRM114-Status: GOOD (  12.64  )
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

The generic VFIO selftests, including iommufd coverage, require no
RISC-V-specific source changes. Top-level kselftest builds normalize
riscv64 to riscv, while direct builds may use riscv64. Include both
names in the architecture filter.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 tools/testing/selftests/vfio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..2c7d8ea81b61 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -1,6 +1,6 @@
 ARCH ?= $(shell uname -m)
 
-ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64))
+ifeq (,$(filter $(ARCH),aarch64 arm64 x86 x86_64 riscv riscv64))
 # Do nothing on unsupported architectures
 include ../lib.mk
 else
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
