Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7637606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ELmJFcVw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6/kW6SS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cR5MFdbD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SsNvjj1DjGx39Q3PyRyNbzhuNirajmiv08WjSqwY/j0=; b=ELmJFcVwiHMum6H86oM79oKcpA
	3etGttITLOh0lyQrhCKdEjnYnLdiQkxMsrG4if5fkG1iquyG/yhP81g22mAcD3Ptn53v2XWLJtIZJ
	a7/WRoiWYNVrpKGFGVjX2kYH1m44+eP75MqEPyg6EBcPm6eKpbItJ2qaJspFfDD+H8MHawd7ex3Pz
	UJG5sSLvQhORD3+aLhaddbD7XIRiJLPQ5xU4RfYcTd410iV+0j1LCvok7VbLjvSrsTeAVfvK6rKHx
	DDTgDI2OLnZrmS44THOnczIZaUEKIMEe8/uCrK8D0vkCdoY0+7FO78E5gxW+F4804FcYaW3TVzBjx
	+eWp7xiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPt6-00000009HVL-2d6c;
	Thu, 29 Oct 2026 13:09:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPt4-00000009HU1-0wjw
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 13:09:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeIiL2761942
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wYJ+1mP65rm
	03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=; b=p6/kW6SSbiy4Oh0c2cki7HvH5sq
	bko1iqCXSSHyFK1WGctUvPXA9GwRNuyqo2AjDleBsX5UwQieQyxkmnhVfgrXcbeD
	/Nj21atD0YgeIy/CBwHdamQYf79wPs1CU9q+m72Q04DoWMNb/nOO+W1+7Kr1Sisx
	OUmYZ1M7ahleo6oVwF1a24UofOMhWA02jgG+jpIp1vs0pPwIJMCCGhWXZ5/gI5Fa
	VxVpU/KJD/lk79A88VyAZukV//k6DlPapvOI397X35V431xu4SDzkGouVuBsjBAx
	hdAs/s5NaMPdLidNsPj4rgoE9dVlD7wL1YJEF2NivjbCoH/f5JUYsD3a8Iw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b0wmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so878515a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279385; x=1793884185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYJ+1mP65rm03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=;
        b=cR5MFdbDUNclrCgaB5zTNy2TuUWunjz/axJZWwjsSdHU/aoErkXTsHN7H5wPhnB1yq
         S3MmFOmu+OFhmN+RhiAoQ4cYmF8mStC3SwtWjQnhLKUWh/A7FUrj28ZMJ/9yu2G1pQVi
         KaCaHMntqax643lMAUjryBXQf/oqKQjVcgupjsMFd79PNkthhIx0uujz3Tv7wflrGeW7
         b+2nORVIRn78WYkBebvXFcmFQ29ST36BZCrjRT7xR+z6dDFbndFSgETCIvJbz6a2jKPd
         velaqMhbszWGp6DJiiMCHCo4uANDIHP/IEd3XA1GKTXlvwmz+BsEiawYaZgtLgKqBBmi
         Aviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279385; x=1793884185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYJ+1mP65rm03gu3ZTDNgby+9J5TH5hIzFpteU1U8PY=;
        b=vF19tv2W1MUyLN7ekEwUxx0d13w8ns5vzEX4+N+bU3xBIEJ0OyOgRdz1X6bU4iAzNk
         OIYHjPC04Y/up5xobgNo+4VPKA/cCwH/lwfW9Jhcu7tm5fvgev6WtS4wD5NivYzeiL37
         sGuNGDJcFzH6zeL2OvxkfdZyjRWUPuKkFGW7+cjQrlFCG6ZobhZiMpKBKhsJ4gLJfgIQ
         AT0KQ/lqT2e6VmZM8mt742rDzH0sWdwCRm7sYb0IurFyWz2Bnq3cr1Z8/CvOG6j4q07+
         4dkh/WoWwfA2QMf7GUx53zyosimxnQFkEwzKMxp6dzppfe1UNRGGrqkIhMSNYxD+29PC
         PK1g==
X-Forwarded-Encrypted: i=1; AKwUvBzJEudoWxcz8sJAGRIuv2wqMi+VsyOp59LeJ2jdPTIvninFmuK4xO4/kg+CYR/WwjLtB1wFWbP3tNcKxw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJeEXhF8i8uZy2vIKW82YLo8mtbuPIdd6D7fOQVkb9dlhAZXl6j
	1beqWOQs8oeARjngsPJMJAoxHOwtSLQiHWs5oyeREBUNUTLG58Vf45U4aejZcLB50e70oeP3oJ4
	HBlF+Qtvvuf6u67TqPhwGv4eCawDO5c93ZhMJc2+WQaekN6CT8CTHJU1ChGC11VQiypQuTbE=
X-Gm-Gg: AYBFou36vkh51kUhMzk+xqbdKGqwyjjBThUfB2I5I8La2FbU/3M0p2EH5qQIYNlASeB
	Dwd2Yc26k7kZsq/javvmqktk9sqTvfLBwSVguFemeI+6495vi8cIgMnjzquOR10rc8n4RwKY7X6
	puq6d8qRCx5M5Ynsdox6uA6egTKSiXzpUy7+FgCARznGQozFiBdi+Cw5xxOoX4Ba+W+bwfdMuxN
	XUW0yytSeveb2DKI13XIwKVAef9kHDvsDxb6epq1AGmpKI7rNQP/+7MN8POXKktB4MUX+WGj+rE
	2jiP56zxn0aRS+4UfY0sXqVZnRm26vm6KKmF/6jwK/C5E8AHxpiRUv7kGXECLPHVhCBYzfokl3E
	h8P6bwDUJiA+eJocFUD8AzCZi8T7hTCWyTV986hmRy4+O4ByY0Ngn9oZ5alfDJdm/RPYV2fdzkv
	MVZo1kBoG5vuv8/xjlpKdDetNXrbv8ka2jj9aC6arp3hZY4PteZTO+nYyfENqL6Wio/ufF6X3si
	g==
X-Received: by 2002:a17:90b:4ac3:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae580a9d51mr4661279a91.13.1793279384713;
        Thu, 29 Oct 2026 06:09:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac3:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae580a9d51mr4661254a91.13.1793279384272;
        Thu, 29 Oct 2026 06:09:44 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:43 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Deepak Gupta <debug@rivosinc.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Atish Patra <atishp@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>,
        Hui Wang <hui.wang@canonical.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        Sergey Matyukevich <geomatsi@gmail.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 2/4] riscv: Add detection for Sspesa and Ssplcofi extensions
Date: Thu, 29 Oct 2026 18:39:11 +0530
Message-ID: <20261029130917.3714691-3-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX4jubK2YyrsGv
 8YiGVNFhkqZKscf/BBvuFPGzh66VILt/RkYipcV8cPjsWKHHW6B32We6DSRSN2I4SA/DaDUADop
 Kd8SpIksZSsr+tmZutSV94U623JcitU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfXwCF5fIUdb2L3
 /C8Y2Gi9gDmOgItVigipOuTps1AAcgEshVXxfTHuP8Sen/gOal8R0ESxUxrrUAk9s+cWbQWX7M/
 9ekfZpRDaFzszSTZwpjaEabJikpEANO6cCGfrDiEN1fEZfp2PcsKFE1VFEEOBfLUT97vJHdGuxA
 v3V0L8rnlmeIku1sdQgeje9gJ6Y58TpA0hKz2q1t29rRzc9xOiG2oMFnpUiJoRcG/X2npSg2ak1
 d9l8R5BSadp9Vm1+Ca1MccV+QPiJ0Xk9VWFyFI7uNiMaKnWzfkqlPc3h16InLgxQaH5qTLWDZfS
 joQO/Au1Uv0Bs33yXCePoG5hGirII/KvZB8oW1PIpmoOCAg+XLh94iJaMF61oJqi2gs/yi2OHKV
 nVgsNwsCC/me+EfI5D7DtL2YUU62PiAQlrb9qRISjlvl3yDqLdR1MeUy60UQquNe0dhVCJptJ2X
 eeYIISvOdR5qxRCVGWg==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae34599 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FU1YQ2pZR7vT3BSyOn4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: J17Rtm0TFB_lkrEK1qrUFx8cxb3I582C
X-Proofpoint-ORIG-GUID: J17Rtm0TFB_lkrEK1qrUFx8cxb3I582C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_060946_267183_5F2ABDA2 
X-CRM114-Status: GOOD (  11.88  )
X-Spam-Score: -2.8 (--)
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add ISA extension detection for the RISC-V Performance Event Sampling
extensions Sspesa (Precise Event Sample Attribution) and Ssplcofi
(Precise Local Counter Overflow Interrupt).

Ssplcofi requires Sspesa, so validate that Sspesa is present before
enabling Ssplcofi.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 621f84d1898f..220d1dfab89e 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -350,6 +350,18 @@
 
 #define CSR_SCOUNTOVF		0xda0
 
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
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2654..030a946c73ef 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -122,6 +122,8 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_SSPESA		116
+#define RISCV_ISA_EXT_SSPLCOFI		117
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7329792978cc..46405bf2dfea 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -287,6 +287,24 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_sspesa_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSCOFPMF))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
+static int riscv_ext_ssplcofi_validate(const struct riscv_isa_ext_data *data,
+				       const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSPESA))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 				    const unsigned long *isa_bitmap)
 {
@@ -631,6 +649,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA_VALIDATE(sspesa, RISCV_ISA_EXT_SSPESA, riscv_ext_sspesa_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ssplcofi, RISCV_ISA_EXT_SSPLCOFI,
+				      riscv_ext_ssplcofi_validate),
 	__RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
