Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4EC606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mOYNdAls;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FBmpacEv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dq3o3tAt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qoODuQF9/cLLxOTS9KaZhTYgDdKHCKasjmDIF2P5GrI=; b=mOYNdAls2cXW1pVMviuQov6GFF
	FWGsQHTI6cHmZE4RrbvKTdGclVZweDLIo4LRZoQwaBsa8Y5xUghVdTQte/Pvhvs6/PND6nQUD5Qyn
	PKNK1/BThdFidJkHYdCHw4HDAnNJRRTLKEIyeZj9ASbmm/3gY/uIJ4KGBvZBNHjZS3/q6Aotf9uUX
	0EfrOv8NCyK3+7m+++KeuPq9TLwz8U6qnVViHp3qtSkX9FlxOJsKjFLrQewD6SJju0EGyQUOsq3LY
	U0ogAL9Wh/0+/rEm72Pyb/uvnKc/wrTD8RftoDPkmapQOxELlHq5YUx0p/qVE6TG48MFJI7p81f/J
	9LnHfHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPtE-00000009HYs-37rX;
	Thu, 29 Oct 2026 13:09:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPtB-00000009HWw-3Mlo
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 13:09:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdxXT067947
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n+Lh6rrQmbo
	J2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=; b=FBmpacEvz7WWL70DvADHpRxoXt0
	zU6RXP/3YrHk4NgguGOt+CIQaQPonZl9O2E7UDS8xva+EouG3/FwtumYWdThK+Dv
	sCyb7P35FGhJ+eXCwK6cb6m0l9qIOnjFOL6Fpcar0JRlaMf/vKGu/e2HuTUbuf8x
	Tr92J9fojzDi0O9IxKj/p8TDwsfMyFPfcxrNghQC6HI3VzD/GeRMhQoskQqs0usy
	HstpnvkobixH34s/cxoO8ph2m5H3MvmC8ljcXyWcHoyqNzf2RDT2aVuh5vopqvI/
	JRG0hmwTj0369/of4djdlJOkEyFaKUzkZxgkAKQaRVa4ubTZdYA/MwVVkXg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshsvdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 13:09:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so1221498a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279391; x=1793884191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+Lh6rrQmboJ2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=;
        b=dq3o3tAtq9VhoGf6WymPqhIl0fdShTMcGnyQYbkPFVhRNHOzlL+VU0u+neV9gfMSDI
         duZFYjoj4WKr71iVePgtsrp5nNO6k276UIhuFLexbx7xdrx1TeSyPkR7KwPaEzQT+Gvs
         jkilZFDFRxwbCmLmokABMxaXtxOxPw6nWBXYYE9BWOIy3r2CYzHLw/3oBptqHkQEAI5d
         DIC5sxly0dePkHJzhw+uO0dzQCkwoIzyESOVvM9CfcNUth+3CTZfiZMDYbrzuA0cgLc/
         QgnDcOPPc4uPVpurHlDafu1LxjHD69D/c/YqpTqnbj5xSIzT+mh33xEaI91qTbS6bJ2H
         EyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279391; x=1793884191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+Lh6rrQmboJ2pE/TjLmm6XJm2rAHnagTnCqmXiNSEs=;
        b=TmuP1hCqBxX1RTMuYoy+9oKIFl1o7mWRpg2kNzUPTrQZ8q8bygAH6N+GB5GwaLNpYr
         DBVVTm/ioR+rF37tmG067pgr1Kb19mkUfYOo5QYs1ABerT/oipydGjgoqfi+WC9yeVeX
         aIE1Ds77m0zZrgSenO16NyalofpCfaoy4yvxd1x1/n6Qs1bTovi4FaXuFNbinvHd7bxO
         PYzfhpnVAu1d2MFcppO9UibyJ196PsnSZn8Vc+TTr/02u8j4Ppke2K10f5GUImfOIJgA
         nkrmSJ43+PmrRwhOEVEto2Rr2ytKez3b5SxlhPfMYYCxd9Thca1kbce3SOegZWQD1NVk
         gSNw==
X-Forwarded-Encrypted: i=1; AKwUvBzOZt5ImsMRDUX/EKS1HmvmXoCfLorV5CazIBGgXC+mXEE+4RR15lZbAlCfHAsvblVHUmUzuEgZkEk7WA==@lists.infradead.org
X-Gm-Message-State: AFq9FYK5v+AnF7gqgCPHqd7heM3Zcuk25UCCqMRqxVGpbjw18NrDuZn5
	gCSEH0i2IEshvpYnv2Q4R+9GG9q0NvSBWCnweVDhiGFaiz53rhdV7eL4tIHXvs/2Qt6AH4O+Xb6
	aHJkDvnW6+A4s2bOOcEj0t6gwfgELGElE19+pAsi1CZjSxdI8bzWSqDbBPpS+MenvCPe3ntY=
X-Gm-Gg: AYBFou1FhoYsmIJN3/CPdfv013LpFnCu5Q0D+DjW1O66YsR9abbmQE43/hW7mccrUQR
	fv65zB16tBTZZc2yQkHx8q7k7gqE8wBV6gnY7D/LCkaRksB9FPCK4LrKKHBebCoF/2XzK3IhaPF
	Wp+oc4ZHShAkl85eSAvvkDS0+qVDyY1O5JzH99QWI93I4EEgEER2eb12fsH27ue1FwNbSPMrP0Z
	a6J/lJO6F83NsvjEO93qQAt0pQOSJoKDz8j1bCv4QOGE8cIaHGqAZ2+aZk5klPY1cHxvZqVuNR5
	qld1dJwVqwLh+9bOV7yF28NhG5InXargN2FZv4GCeBd7bOOYI66I3vu5ldWJP4BX04mgRVJ2SRa
	PZ/pyzmazrI3u7D/UyzSQD93sqOg1zG6+BFICKMeGKdsPQl9naIY2E6Tc+c1Vt29PquT/NA8egH
	Wjke2BCCpLy87AY9cmiIkvo1J5q2xEMud8LVELDkNSpw8zJkUq/l8cgje2cSQtfh8EKmHZ4NFqw
	A==
X-Received: by 2002:a17:90b:2c86:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ae581e3385mr4148815a91.48.1793279391099;
        Thu, 29 Oct 2026 06:09:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2c86:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ae581e3385mr4148793a91.48.1793279390665;
        Thu, 29 Oct 2026 06:09:50 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:49 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 3/4] riscv: Add perf_arch_misc_flags callback
Date: Thu, 29 Oct 2026 18:39:12 +0530
Message-ID: <20261029130917.3714691-4-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: A0-pce2DzowYbz4frRTFyr-X53rxgGSc
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae345a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=IJwDnuRGQWnalj_uV-oA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfXzHVoKh1wYwC9
 t0bNpb7Bk4VIuI/KFQLQtRLsg9ljZXAVsKYtsVTdOjTfJ+fxJw4sagQwwIsvFXuPpeRzpBuIxEm
 c2JHCekvnutUIEoPnA8v7NNALlDhLsM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX5A3C+hRcRdfP
 scYCuW1gfwAU47v5blstNK8MMyIvrDAjdJHlNw5/B02QwW3QC+e9y/qJ+beAle8qV+ZqpHznxnb
 XzV7hNCMeQu+sh0gYcJHZNjMeDDy9cTT2istJNIIGj0LqAjkIR1WS1ZiZ6LhD8R3u/+gd5vjiFm
 XQHDUIB1NggbsXR5Jx0yL+rK/sXMxD5eqUas+UDkBUKb4pDXrAIS8x7Jz5NXSzSzuLmrcCku2/L
 YosZKTtnUvtjqDcvPUv+6c1QLM5cZn5Mnx919ASOxIbIaaSoM5p8K73aN1cGCeCh8UpHM3SDo+t
 IPJlQrkoN1snJBeXaJFXjATt/ma9LF192UhElJK24Amca+56nfj3AVK7JjGVFlp9YkVeawin/Eq
 T1DzzsN1K4qf+z+AfS4w5V2sQMDMMo1ETcilhKqCWTatXoX3Ojd8RfnOD238AeCcCzDMRVqsNXd
 4h1oqQ/rkjhBcgGmm+Q==
X-Proofpoint-ORIG-GUID: A0-pce2DzowYbz4frRTFyr-X53rxgGSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_060953_959516_59800FF5 
X-CRM114-Status: GOOD (  13.59  )
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

Similar to X86, add perf_arch_misc_flags callback so that
PERF_RECORD_MISC flags may be set based on the regs provided by the
SBI PMU perf driver.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index bcc928fd3785..cf13702b185f 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -9,6 +9,14 @@
 #define _ASM_RISCV_PERF_EVENT_H
 
 #ifdef CONFIG_PERF_EVENTS
+/* Use sstatus bit 2 to convey whether an epc in the sample is precise or not */
+#define PERF_SR_PRECISE	_AC(0x00000004, UL)
+
+struct pt_regs;
+extern unsigned long perf_arch_misc_flags(struct pt_regs *regs);
+#define perf_arch_misc_flags(regs)	perf_arch_misc_flags(regs)
+#define perf_arch_instruction_pointer(regs)	instruction_pointer(regs)
+
 #include <linux/perf_event.h>
 #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
 
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb870..9b68d21b3a51 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -6,6 +6,21 @@
 
 #include <asm/stacktrace.h>
 
+unsigned long perf_arch_misc_flags(struct pt_regs *regs)
+{
+	unsigned long misc;
+
+	if (user_mode(regs))
+		misc = PERF_RECORD_MISC_USER;
+	else
+		misc = PERF_RECORD_MISC_KERNEL;
+
+	if (regs->status & PERF_SR_PRECISE)
+		misc |= PERF_RECORD_MISC_EXACT_IP;
+
+	return misc;
+}
+
 static bool fill_callchain(void *entry, unsigned long pc)
 {
 	return perf_callchain_store(entry, pc) == 0;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
