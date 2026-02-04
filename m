Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B9DE9D406
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dCI4KpSLUwxVoGrdklZo43HgWkL3q1xWZUNky3RYLUs=; b=MuZfAmR5l1xvB1
	Zv92Tnj2Iglqtzfzja9FvFiPJidCrXOx1rO8IuuYUDpjCPCt43RAukGhQeGCrjdHcW4fC1zlmjZot
	Dd+yxmkIY0LAAd8LucVx2BONMDFZ8b8U2McHpVf+auTxdadywnjF/i9p6ZAAOYQO/DHsAyrpy+LS/
	gJ6yYFBS9s0RaHY4ofCgwEwhmMBgEnvyesK4sy/MaeQz1zosBQcI8OOTCUjGiSrzqZtewsVkkE2OI
	6rKC41XGRbqH9g9a+RHKCEK//VnJTDQA8quaEmnhPoimmh3gcY7e1ZDUrBiIuglTVvhzSLvnoaJ6+
	ZPH3CIK6ljGzrX2Q2nnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfCw-00000008hpw-1aZn;
	Wed, 04 Feb 2026 15:54:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfCs-00000008hp0-3XSn
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 15:54:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CISlw1880671;
	Wed, 4 Feb 2026 15:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=svyOtfh05i9lAYJpnQjECk/4tWrxOyuc+Jp
	9H07cFXw=; b=pgS9gPAylFCKMlO7wv+z2AF0ro0Ln69p5PzXyPd1Fjot9UZyhTR
	jG7jHRg6OqYkXLMCClYagunhx0PD4XACw2X7/gwuIMz2KC+c02iwSVB6PeuSjWrp
	zHb6jwNXDjW7nf/QEafKGSkH+Pe6GU8i06o/csKmToLkrYcqoL7mRLccZGbt57h6
	i+2wwUyfB+LMKiZgJi6aZURnsCk9EgngtaQqMED5KnMjNrh6EnjFoixtRF/anYxQ
	tx3RzKqtmpEnx3d+ZvH3r3aT6WTZU53/8l/bjVgShVybzwWllivOu38u1dmOyuDD
	ZxZwDNcvUP5/OQHeoSIBK025/dphgNZbR1A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43n9s286-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 15:53:45 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 614FrfjW022392;
	Wed, 4 Feb 2026 15:53:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4c1atmke63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 15:53:41 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 614Freq8022382;
	Wed, 4 Feb 2026 15:53:41 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 614FrerO022380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 15:53:40 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 101D522C9F; Wed,  4 Feb 2026 21:23:40 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
        Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v5 0/1] Common csr_read_num() and csr_write_num() for RISC-V
Date: Wed,  4 Feb 2026 21:23:08 +0530
Message-ID: <20260204155309.763597-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDExOSBTYWx0ZWRfX5ZjjbsI9io7G
 7Xjzoq+Mk478kr7GVY7arkXA16tk+x6NpX1sj2/YEAAEdy0CVvoO+LzElOIKCPsWCqbrdK3aGqW
 F3dvigAeMvZdA6JJeeXHZt5FoZJYk8zM6Bf79clJkNsCN2D+6MtRmIc/B6ADyQVGZUDzghcNrTh
 nRv1LvCfbSGjF7O46puwe+5N6mQDZCJOsrE14qKLJy8toXvwhV0Bdg/brDAaLPaBcYIam6ZzPKC
 eSdS0fDCTasOO2Ptdb1MKVX9lq9Dpiz4GCaxCzjnl4AtyCBHrI766IpLdCILA76XSSxews4WXe7
 XVCMd9mrbvNZ2RiH7jN8rdkCiq9L84YZRZdEcQNpvmblbRc+FzsQRmc8JQ16gYKOvP955d2eknH
 MfTrQTmjgLiYf7wKAuFMkDLF6GUm9SFGIQdNNHlU2BB2bqDQ4v/wobFtPrthCOPb0vc4jEnhEwm
 2rwITiguKSkzZdOlEDA==
X-Proofpoint-GUID: IYWU7pmDWoa_3IE3rO-THZXhu88FWpWi
X-Proofpoint-ORIG-GUID: IYWU7pmDWoa_3IE3rO-THZXhu88FWpWi
X-Authority-Analysis: v=2.4 cv=b42/I9Gx c=1 sm=1 tr=0 ts=69836b8a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=97VCTQuGHz7arqyciaAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_075419_003784_2282DE24 
X-CRM114-Status: GOOD (  11.36  )
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

Some of the RISC-V drivers (such as RISC-V PMU and ACPI CPPC) need to
access CSR based on CSR number discovered from somewhere. Add common
RISC-V csr_read_num() and csr_write_num() functions under arch/riscv
for such drivers.

These patches can be found in the riscv_csr_read_num_v5 branch at:
https://github.com/avpatel/linux.git

Changes since v4:
 - Rebased on Linux-6.19-rc6

Changes since v3:
 - Rebased on Linux-6.18-rc7
 - Updated commit decription of PATCH1 to reflect the fact that
   we are removing sanity checks on CSR number which are already
   taken care by csr_read_num() and csr_write_num().

Changes since v2:
 - Rebased on Linux-6.18-rc1
 - Added reviewed-by tags

Changes since v1:
 - Make "out_err" mandatory for csr_read_num() and csr_write_num()
   in PATCH2 as suggested by Sunil and Drew. This also helps further
   simplify csr_read_num() and csr_write_num().

Anup Patel (1):
  RISC-V: Add common csr_read_num() and csr_write_num() functions

 arch/riscv/include/asm/csr.h |   3 +
 arch/riscv/kernel/Makefile   |   1 +
 arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
 drivers/acpi/riscv/cppc.c    |  17 ++--
 drivers/perf/riscv_pmu.c     |  54 ++----------
 5 files changed, 184 insertions(+), 56 deletions(-)
 create mode 100644 arch/riscv/kernel/csr.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
