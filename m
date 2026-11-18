Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E15606A8AA
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S6Cczvjp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Uz/uSht6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ikoZgzFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FqdXdtr8KJ8gkyhI6pYaEzcW2wwV7geJJOoqNl0L16s=; b=S6CczvjpEclWXINEpIW+kS5ag3
	jAwy8QJsR1q5l7hJBb0XQI8+dluCDiOV7JCcZC96bJfbkgcvMSFy9HmB1vVfbtqU2I50Cs+ndsPMM
	OErEYAGHqh5Z4VGqIRyLFRdBJ25aJWIMZx58V4RLwypu49aUrhyB38iPk3yY7XURfvn+2jEwzPLCd
	JMdOLmO8noYn035sxXNXKEYstXSL2O8DjnJDxNP45M+eVdeaBue8+badwi8lRVlijXiZCypvZQMl1
	qSA018RE9fUMb7mZgA6evqpm8tKqoiYDBGOaNZzKyuQaoBlyywTLZwTg/Up56DSmDqrn+sUaXx9zQ
	6SUvm13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcKd-00000008RCp-0odZ;
	Wed, 18 Nov 2026 09:51:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcKX-00000008R8e-1fH0;
	Wed, 18 Nov 2026 09:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GEqcAgK15eeXpYQukbQ0RIX1lyiENIPKUtbJylU3N7c=; b=Uz/uSht6rayTD7gnjka4oZ6GC4
	+ekrraPM3KCPnbhIP/6B86sctUPn0WJBYfc9IuTt5v1OaQLfyd39WS+v/QQFUSm1XI+DmLgLRbDbk
	8FEM7ArqqMTx3rLGj4Rry24zYdQCyI/tuoHWWr9xJpbvEx4lEQGrTfa8EoXavEpbKDL3AOKg4iOU7
	x0pXust7j3haQUWGhSVYKmp4mIs3qc/eF17yDmvUBiSYuvVDBnpAtMBy3304vkKpRbHgaO4+QC2J6
	2IHekQ1yEZ9e0RA9mxN//AGikiZ1vVwh0mKfz+CITdMw5bhCNSVP9kciP9JU2xH3AL8Zfs6XEElgS
	kffFUQkw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcKT-0000000Fsxt-07Dq;
	Wed, 18 Nov 2026 09:51:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kIvx143962;
	Wed, 18 Nov 2026 09:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GEqcAgK15ee
	XpYQukbQ0RIX1lyiENIPKUtbJylU3N7c=; b=ikoZgzFM6zUlByKKAkTMIiPFw6k
	puGpihutv6RxtlTWqw5FZHyNQOUMOFjY+HEP8UOOiULSQbe4T13Eaw7oRPlrFAC1
	1Y46J52ZoWcO4DtSHhw/6DRRYYvDlj+pvVe9nXl6R7cTuW1svoshfMcnZD3AF1cc
	Mon8hQ+8kGX/dWDk6aEWaiO/MRL0u4b3P45RpDxIxBROBKGArslhlpaA/qVuJgHf
	Uj6uWq/rwVYF3wss8bWeQMs50GScJgT+Gf5lFxM5+ka3ZczgzPi5a5AQyFqsUmyw
	yhSTSeDIEvz5BuGA+M1jPNFrzl72CoHakcjhlkdW9somSKLlFhgrYNWJILw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8tcn2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 09:51:14 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9pCUi375656;
	Wed, 18 Nov 2026 09:51:12 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-vikrsi-blr.qualcomm.com [10.190.111.249])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AI9pCgV375591
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 09:51:12 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 4853235)
	id 7221A24881; Wed, 18 Nov 2026 15:21:11 +0530 (+0530)
From: Vikram Singh <vikram.singh3@oss.qualcomm.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
        namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        atishp@rivosinc.com, anup.patel@oss.qualcomm.com, will@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        beeman@rivosinc.com
Cc: Vikram Singh <vikram.singh3@oss.qualcomm.com>,
        linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>,
        Anup Patel <anup@brainfault.org>
Subject: [PATCH v5 2/7] riscv: pmu: Add Control transfer records CSR definations.
Date: Wed, 18 Nov 2026 15:20:48 +0530
Message-ID: <20261118095053.3871267-3-vikram.singh3@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com>
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd7513 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8 a=QMCXY-WxTZ0vNH6C3ysA:9
 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: ucLrZj2WrdUoivCwijnJkCHabW3fvGli
X-Proofpoint-ORIG-GUID: ucLrZj2WrdUoivCwijnJkCHabW3fvGli
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX5VpvScIGrU2b
 +adyhwJthdzaojn6HRm3PMQLWsdrYofDyFJUeLhgVGGVHEHx7qCshKaW7QJRkBgH9C5JxwoIdHo
 9DMlUpiiC89UKITaitjv46aJD//0aZui88OwvulSd4GWUqj69LrVZbKcQWClro0OE1VPP290kJG
 NjJ7KPpYzgw7BXapZOPZ3rUPTVj4yvXdZFQnfxUQiukVnrrGCsRzz/knCRsAAle8jpib8JWW7nR
 sJqXRprtNFZaeE7lEndlVKWR/4cCed3o+0+WjMpfZtmBAmxtZ3JPWA+PfUBKCaX2E9cufHXxy5x
 uHqhgGVy8chuui3MYESn+9gHieZ0umOwrq5XukuN30loZo/YiFCuOCISyCu2at3wogdsHEcyNud
 RqpTQGFQNogqWZDwwC4RA7kMZEEIqoo4dtt8zLSI0a6p4NIle996cf6nnWl+e7zUlifL8BVaXoO
 0MtcbgjjAdWfS77Bx5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfXwS8ubWa8LElL
 4451QGKbog6MJYhEgWO+Dwuk1lLrvuS11J5A0949tGuTs+hjLNpyY7TDqhkbjnK5lLyQEzfqdXM
 wS0/Thic/4d1Z53gOMGTjlA+BLhP56Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_095149_448373_182F365F 
X-CRM114-Status: GOOD (  10.16  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adding CSR defines for RISCV Control Transfer Records extension [0]
along with bit-field macros for each CSR.

[0]: https://github.com/riscv/riscv-control-transfer-records

Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20261106173942.3175069-3-vikram.singh3@oss.qualcomm.com
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/csr.h | 95 ++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 621f84d1898f..063351d9b406 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -350,6 +350,97 @@
 
 #define CSR_SCOUNTOVF		0xda0
 
+/* M-mode Control Transfer Records CSRs */
+#define CSR_MCTRCTL		0x34e
+
+/* S-mode Control Transfer Records CSRs */
+#define CSR_SCTRCTL		0x14e
+#define CSR_SCTRSTATUS		0x14f
+#define CSR_SCTRDEPTH		0x15f
+
+/* VS-mode Control Transfer Records CSRs */
+#define CSR_VSCTRCTL		0x24e
+
+/* xctrtl CSR bits. */
+#define CTRCTL_U_ENABLE		_AC(0x1, UL)
+#define CTRCTL_S_ENABLE		_AC(0x2, UL)
+#define CTRCTL_M_ENABLE		_AC(0x4, UL)
+#define CTRCTL_RASEMU		_AC(0x80, UL)
+#define CTRCTL_STE		_AC(0x100, UL)
+#define CTRCTL_MTE		_AC(0x200, UL)
+#define CTRCTL_BPFRZ		_AC(0x800, UL)
+#define CTRCTL_LCOFIFRZ		_AC(0x1000, UL)
+#define CTRCTL_EXCINH		_AC(0x200000000, UL)
+#define CTRCTL_INTRINH		_AC(0x400000000, UL)
+#define CTRCTL_TRETINH		_AC(0x800000000, UL)
+#define CTRCTL_NTBREN		_AC(0x1000000000, UL)
+#define CTRCTL_TKBRINH		_AC(0x2000000000, UL)
+#define CTRCTL_INDCALL_INH	_AC(0x10000000000, UL)
+#define CTRCTL_DIRCALL_INH	_AC(0x20000000000, UL)
+#define CTRCTL_INDJUMP_INH	_AC(0x40000000000, UL)
+#define CTRCTL_DIRJUMP_INH	_AC(0x80000000000, UL)
+#define CTRCTL_CORSWAP_INH	_AC(0x100000000000, UL)
+#define CTRCTL_RET_INH		_AC(0x200000000000, UL)
+#define CTRCTL_INDOJUMP_INH	_AC(0x400000000000, UL)
+#define CTRCTL_DIROJUMP_INH	_AC(0x800000000000, UL)
+
+/* sctrstatus CSR bits. */
+#define SCTRSTATUS_WRPTR_MASK	0xFF
+#define SCTRSTATUS_FROZEN	_AC(0x80000000, UL)
+
+#ifdef CONFIG_RISCV_M_MODE
+#define CTRCTL_KERNEL_ENABLE	CTRCTL_M_ENABLE
+#else
+#define CTRCTL_KERNEL_ENABLE	CTRCTL_S_ENABLE
+#endif
+
+/* sctrdepth CSR bits. */
+#define SCTRDEPTH_MASK		0x7
+
+#define SCTRDEPTH_MIN		0x0 /* 16 Entries. */
+#define SCTRDEPTH_MAX		0x4 /* 256 Entries. */
+
+/* ctrsource, ctrtarget and ctrdata CSR bits. */
+#define CTRSOURCE_VALID		0x1ULL
+#define CTRTARGET_MISP		0x1ULL
+
+#define CTRDATA_TYPE_MASK	0xF
+#define CTRDATA_CCV		0x8000
+#define CTRDATA_CCM_MASK	0xFFF0000
+#define CTRDATA_CCE_MASK	0xF0000000
+
+#define CTRDATA_TYPE_NONE			0
+#define CTRDATA_TYPE_EXCEPTION			1
+#define CTRDATA_TYPE_INTERRUPT			2
+#define CTRDATA_TYPE_TRAP_RET			3
+#define CTRDATA_TYPE_NONTAKEN_BRANCH		4
+#define CTRDATA_TYPE_TAKEN_BRANCH		5
+#define CTRDATA_TYPE_RESERVED_6			6
+#define CTRDATA_TYPE_RESERVED_7			7
+#define CTRDATA_TYPE_INDIRECT_CALL		8
+#define CTRDATA_TYPE_DIRECT_CALL		9
+#define CTRDATA_TYPE_INDIRECT_JUMP		10
+#define CTRDATA_TYPE_DIRECT_JUMP		11
+#define CTRDATA_TYPE_CO_ROUTINE_SWAP		12
+#define CTRDATA_TYPE_RETURN			13
+#define CTRDATA_TYPE_OTHER_INDIRECT_JUMP	14
+#define CTRDATA_TYPE_OTHER_DIRECT_JUMP		15
+
+#define CTR_ENTRIES_FIRST	0x200
+#define CTR_ENTRIES_LAST	0x2ff
+
+/* Temporary addresses for Sspesa (Precise Event Sample Attribution) CSRs. */
+#define CSR_SHPMSPC		0x5d0
+#define CSR_SHPMSDATA		0x5d1
+
+/* shpmsdata fields */
+#define SHPMSDATA_CNTRID	GENMASK(4, 0)
+#define SHPMSDATA_MODE		GENMASK(6, 5)
+#define SHPMSDATA_V		BIT(7)
+#define SHPMSDATA_METADATA_SHIFT	8
+#define SHPMSDATA_MODE_U	0
+#define SHPMSDATA_MODE_S	1
+
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
@@ -563,6 +654,8 @@
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
 
+# define CSR_CTRCTL	CSR_MCTRCTL
+
 # define SR_IE		SR_MIE
 # define SR_PIE		SR_MPIE
 # define SR_PP		SR_MPP
@@ -593,6 +686,8 @@
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI
 
+# define CSR_CTRCTL	CSR_SCTRCTL
+
 # define SR_IE		SR_SIE
 # define SR_PIE		SR_SPIE
 # define SR_PP		SR_SPP
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
