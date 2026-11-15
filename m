Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F64606A327
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BEq7l0y6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VjtatNVy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AE/v9xcbgYIwsJtXO+/g3p07UfNKapk0jH1Gfc+4XxI=; b=BEq7l0y6P4q/3jnWoCWvrbU6Sh
	aY7lVm4PpZFqx2B3yVxvntQbBUTe3lpyQrPravUEmUU2cMgoqBJibMVXhCRbNPdPQpG6v5xiqIay1
	D7JwxSD+4QxQF16nHFfEhncIkrn+D3eiKgLKgA7keeikhLAq2v5J62PoBpWY54XfeO2eTCG2Y2+X6
	GZcbvw5Q3E5Vez6F1vupzLniQPdzVzibKsQGlBYzOmnDEdmp/3jKOsu2nYOarNX8Z2Qv3itgNFuHn
	ES8Xaa+e13UzG/fmCsGrApyYXmjlOHnSMd3dHl6ykO8txGtA2NKmeYFPPn1Eo/Qz85QGVcbkEBavA
	6MkIothw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVoy-0000000HFmy-2gNx;
	Sun, 15 Nov 2026 08:42:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVov-0000000HFmT-3Ni3
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 08:42:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w6PT2139781;
	Sun, 15 Nov 2026 08:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J0LNhcS3twbB9Ya/CltyDMpIsNPzAzolhCj
	KnYk9xMA=; b=VjtatNVyDZhHOVTCkPyatQe1NwohGti/dVNiwvXCuuTpXovgXVx
	sjHvP+JQfPeJOv5C6zM3OIhiWEB532o19ZG816kH+WhkTIo5xF9Orf9A1/bu5gZH
	GSuj0uxSW2HDjIIW1HVG7RUgU+zLZn4vQ4qG7lauftMcdxvBCOoTzypGZS+9S/+h
	pEFBnTbmOP4Nw/pG48t4qUTWpkHVqcbLxCwDK91/xzleNibdMbIbXUYdl1OYNCB7
	/eecTBg5fyP7bAjbf6O2soYJcrZMxBI2K5xj2WBW25pZO8kabRN4wEhBujVqoHfX
	jNY4S8pDjD5x+Qq4Qm+1hUgwQnDEgDLyTDw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjtqgh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 15 Nov 2026 08:42:23 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF8gKFh2516207;
	Sun, 15 Nov 2026 08:42:20 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AF8gJBH2516198
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 15 Nov 2026 08:42:19 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 4DAE022C67; Sun, 15 Nov 2026 14:12:19 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
        Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v8 0/1] Common csr_read_num() and csr_write_num() for RISC-V
Date: Sun, 15 Nov 2026 14:12:17 +0530
Message-ID: <20261115084218.951411-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzNCBTYWx0ZWRfX1oZ2TSV9Li3M
 kVNk1aarmZO+9PqanKNI7ranfeS73xZwwJiCpLovGlFxyczeLhd6SAW1+2hc0zHIzZkpSz4m+u1
 zMVQLE/oAEceWd6FcbGS985WmjgUM/75EHkLUoE7wRs6I3j9Tl2STlToP33zOVpMQX12mFUcWBw
 IVHyQaSdMjC4LsDJ1/4BThI9Hd9Kh1YhndBWW/C4WyhDhZ9vkZ/7Vz3QHCHrD46Tubijq74vZDl
 o4sxj86MTwsi8z9wF+n2ygrcUEtXJEuVKJCFt5L64YdufAjQ3Vv8dRNz2DEM782Mz2NXzXoYI2J
 HboapCfnX8I1AuBz1rs1ZrPovDO5FZm1PfBZOBkTKejnLKtmfNRLSqmcRfyny0WQs9aq46ajtis
 1gmsQTmyRIc2rRie3kY7Zfd0fktxgwI/Gxm+3Xgc7477nIHlWn8GzsP5YfsyYha/77AQGkb7Yzx
 /buYouWz+LzzpxkidfA==
X-Proofpoint-ORIG-GUID: CD2fYL8w91xyA3ycraO2rOy8cY8pqc4E
X-Proofpoint-GUID: CD2fYL8w91xyA3ycraO2rOy8cY8pqc4E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzNCBTYWx0ZWRfX5BfEk3q1S+D/
 GMFCpX3OOPm9McfSd4NvEWdCL0ciR/Y33uOZONNtE5CBDAdspD+C6wiD4JzMwMSZF4cNDhOQktE
 0GazZAaL41h7igcu6T7u4mbJSA+siJk=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af9706f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=97VCTQuGHz7arqyciaAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_004241_848293_4194815E 
X-CRM114-Status: GOOD (  11.85  )
X-Spam-Score: -2.7 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some of the RISC-V drivers (such as RISC-V PMU and ACPI CPPC) need to
access CSR based on CSR number discovered from somewhere. Add common
RISC-V csr_read_num() and csr_write_num() functions under arch/riscv
for such drivers.

These patches can be found in the riscv_csr_read_num_v8 branch at:
https://github.com/avpatel/linux.git

Changes since v7:
 - Rebased on Linux-7.4-rc2
 - Preserve the CSR range check in riscv_pmu_ctr_read_csr().
 - Added #if CONFIG_32BIT for cycleH CSR in csr_read_num().

Changes since v6:
 - Rebased on Linux-7.4-rc1

Changes since v5:
 - Rebased on Linux-7.2-rc5

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
 arch/riscv/kernel/csr.c      | 167 +++++++++++++++++++++++++++++++++++
 drivers/acpi/riscv/cppc.c    |  17 ++--
 drivers/perf/riscv_pmu.c     |  52 +++--------
 5 files changed, 188 insertions(+), 52 deletions(-)
 create mode 100644 arch/riscv/kernel/csr.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
