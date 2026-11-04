Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1079D606A334
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 16:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gqfwIr9Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnFXmXXM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hWawEZR5/z/Z/pyB6a9Gr0SvRA5m/PCi36Dsz16RGyo=; b=gqfwIr9ZtEm9uzzi6UAkw2rNOh
	Y/jamhDh42+2oqK+1WJR4Jw1mltOF8DQLbB8fT6wjdY0yi2ZE/CojahYC0lo1U2xaBDxMBrNGJuHV
	zzQVOoHP3fUQqnXNl937XjL8J2kR1QBr4DFD2Nm9THtyCzihxfzvS30E7Cqj1L87Yijk1aVRt6n/J
	XfbjY67xoda9fYoK7D5WS0yWhfZtrV/Uwm7/ARdsNdBdm9bY9fHwzdCNAtbYNg4HNbDwgjMW8Wspl
	O8TP5xBlGCGKE1DosOYCacyUpFh093kzL7tRzCoWbcOJSIV2y6H+Cp/NLEm8jOx7C1dM8scUPBzpB
	lTzjErAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOde9-00000005ubF-3Nuz;
	Wed, 04 Nov 2026 16:15:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOde6-00000005uaT-2llG
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 16:15:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fip7C3272812;
	Wed, 4 Nov 2026 16:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jVH1WdWwc2cqdtMVBuZBwnu1HjvA+uxsgPv
	wECRUhpU=; b=fnFXmXXMdq3zSC4C1/z2hdl0xwlfzKa4NklsoNHi7Az+RTp+VaH
	SagXqyFTA+e6UnBA2oRA4WsiO/0OUvM1rlZbCAHnMw8m9Cizu4VzrTRyBJJ1Scjq
	jqTPmafJ2nKTQZiwr/B1r2+WbCUi1UsojmATfFgfVr3qAfOj313SZZm6xXgeQcwP
	gNmB5JP616J+H7wx+v3CXwwwQELzMbljV69Nv8ApRk6QrMmQdlo/9ZWJoTJiHnKH
	r4Tgt96ryftShLVbLKwB11gfyVVM6i8t+DiZX27NrPf7JzzYCDF3DM5qtq7hLObf
	yfTmfw+NEFs06/5CrVEB2mI5I8Kr1vlvYRA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bngeye-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 16:15:17 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4GFD7Q3122607;
	Wed, 4 Nov 2026 16:15:13 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A4GFDi03122590
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 16:15:13 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 4760222944; Wed,  4 Nov 2026 21:45:13 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v7 0/1] Common csr_read_num() and csr_write_num() for RISC-V
Date: Wed,  4 Nov 2026 21:45:11 +0530
Message-ID: <20261104161512.883885-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfXwMYEfbYYzoib
 W+h30IjHo3dnZrnVT/XF9ew2yAkco9QR85L0BcNfw/N6JNedVcBMyye8b4NhWhRXDImfWSflRiv
 2zPiKwtid50WvqJSxLCXW/yDWpnjo+e7i5mb6j1op9YsDM5t0crobsXG+xRDPL62ln4zqU92jNM
 fol2mrT6pVfEwn+qAir9ChPheAMlPdCoDvIrkIjxFst33GyOfug7S2BcpxETH8dYCVGAPsM1cHX
 N7Ko+GhMMTY6cgmoAOppTeYqJq5x7a1PEdNEi0qxYhlfW+bNWcyrogPSDNXXqpLUkLEkvnjqMBE
 RNSxN1KgD2hpqgTCGcOfYV9anPnaSgEU2ioiMWyB1KIW9G6gSfTqeMRi6A5Pm7406xgW0wbzu4Z
 rSIqBy3Nei1L909fk3yj6s6johG1qVWNbHc1VS/BMXY4JBij4uGJbZ9AJkvdFtmUAWvgzgRc2+K
 8nJ9DV0wOjF49+fdfqw==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aeb5a15 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8 a=97VCTQuGHz7arqyciaAA:9
X-Proofpoint-ORIG-GUID: JMzeAe4MiFqyn55hnuHbxmeVbb85bzpS
X-Proofpoint-GUID: JMzeAe4MiFqyn55hnuHbxmeVbb85bzpS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfXwIYoJ9rJs/kg
 D2DK2zbs1LT4A1R8BtQR1mgPwI1V/re/cYbFr3j2Tc8SeiU3oKZKF/MsOagfAdl7308NEAAgW+4
 7Hsosi0teXdwjWlEbLxT4E87sZHeC48=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_081530_707156_53833372 
X-CRM114-Status: GOOD (  11.52  )
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

These patches can be found in the riscv_csr_read_num_v7 branch at:
https://github.com/avpatel/linux.git

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
