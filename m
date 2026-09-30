Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F40CA5FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 06:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRF1EBmvZ8m5hOql7VgDxOA+eGzLD3Q8a09aCeeCem4=; b=PbAMMpRxEVqPIz
	8x561sNJLMEqEsa3Fymo9yafEBDsLpb66SY3TCseLa3FmOBoaA7jeJQg4OiuqsKDwoYynlOXjO1Tq
	3QUAFzhLOC9e1w7q97BkJZHf2UUMLyWDzFFqf09bUqobgmO2zacxF/IkMa6wK4UwM67qlfe6fV2LP
	tSLmRtMU5+qADuX5RytkzuE9VClWdzZuSJPojh0KS+BCbWbOvWXzpiLUWjP0fETHPHbeV36b0pqBm
	XS+SI9MhR74nSnEhTAJbOjuvFMZ42RWn2L/KMg6E+9f4XkifPsxieBwgHmyet+UMmvFOhz4Lw1/Y5
	6RK8sT+qA/5XNUmvWIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnzA-00000005AIl-2UIL;
	Wed, 30 Sep 2026 06:40:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnz9-00000005AHl-2Ees
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8OWABlvWmQDeWp98OxpVQtoQURxY/W2DmFEPy2By3PM=; b=tvzUr9UQ9Yk9FOwibJd1j6uSju
	ITPoOqTWhFjuPxjmNykCU2sy6UChDm3GmYgOfMXQWl0AO9rxOUFdo156v5NZG4TVOdh1wVWZEtS7w
	2TCwt2zgH/QEP1wsnz/ObqD9oDka8+e8zPtGAP4MM5/Rnshc1Q6XJn8I21MAUCCJuehhzD7y8ekr6
	7f8ccsMVypSSXRrRecW/54+8HPH/FVevXoSoZnutqck7kRwM8ntBKm7vbQwLKxIznKVbB9wsvGAUY
	+3yBZozpVd8aOtO5ue0s7pnp+xBr3OhVM5qcFypIvSKWopLl/wtK89czM1W0iQsy00IMOJX6TWLao
	9poc/f0w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnz5-00000008KSv-2g2A
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 06:40:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U6GsYk2899510
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8OWABlvWmQD
	eWp98OxpVQtoQURxY/W2DmFEPy2By3PM=; b=lRb3Rp2wgIxmPSVMCNFwHXkXpTX
	HZB6EToy7MxH8sWWVGqsHe2yReb3X6wNA3AqacT94Zb7juXIWo391RyeG41UeA+f
	XArqXMRx5Xh5T7ae092ODNQzmPaPjtfY1KrYC/Uldq66O529gz39z65KzydmFzws
	bKsD8OcEnsNMvV3sEK0wgs3FSva/QKf77UgDlAEX42pFAMBPnYknhuFVMu0rLnrQ
	2u2RY6lQHBpmqx19Fn+VdFbU9RQiTbYjVozJYUBaxWyQEVfULIh1nQRh4pFMoqra
	UwdqdLXBcFrKGNFnpwjCRZHpLJh/SHp/ZN8C6yXYB8iCD+8pW25B2NT/Low==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w1402wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:40:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso7381368eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 23:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790750402; x=1791355202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OWABlvWmQDeWp98OxpVQtoQURxY/W2DmFEPy2By3PM=;
        b=iVYSq+spmcDflbQylLNia3l7M5qpqh/9mQcUJayZc/W6za09xgcTfAhmsgi6ioFliQ
         34UA/sSc0c8nUY3c25SxU6sfRUEEPuf8IE83NyETQ1mufGt5kRpoyJzsfzs4KYHGjcO0
         h5jaoYOeuB4k4TgoVC4f1GLLmJ+/I4DLjEfrdIZQuqI2T05vILLXtwFZVGRiUHbTan2y
         U0sehbunq+Jzmolmk7zAG2UuQtopzip2DfsR1Qt0AzpJzbQqEuxKuw6wVvS4xIJuMSl9
         bTC+ue8uY/GLiOnieeYxIcvsOA8VPoRx71GMO6e3kQjxckOergxjNHQ10Ot7HeEN9hgK
         IoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750402; x=1791355202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OWABlvWmQDeWp98OxpVQtoQURxY/W2DmFEPy2By3PM=;
        b=iG3lH/OqvIBLILLaQgeihriAdU91BSafR7oKC5W79s58h9S0HegmzLMnG8H+fEec5z
         XKqTxxpfVRS9FQz6Izj8CNisSaLMrwieL7mIAi7a9TOwsX/cn87MRe1NqR5rcGm3qPrP
         gYP03JwcbG0lxGFCh3wCyAO1j+ccElbfYZHb+2e7zT7vHTfzqmj6U3q8AOk6u5bVCaGe
         jFl4DFxtw4ZKrCrJGBPjlJG3CoTpg0pwIkXZ6X+KWYNMYQ41nAAIlcgVBsY9bY/9K4kz
         upiMfIlu6RRKyy9JUXWmTvw7KvMjCxBwRqlz5KCuqpxQ8y7psz5AGFzB+3Gu7+4+TukP
         iF5w==
X-Forwarded-Encrypted: i=1; AKwUvByl1ipVcIMGotzdGppGz8GvJKAqC2qwSIHt6LMAtAT1Cbzm9Spc9Y+F+XF0ciRztPhEsqF4OKOVejhJ+g==@lists.infradead.org
X-Gm-Message-State: AFuF++kzdJ/nQwaswKy4tinBgj9UAYrXG9MLwVpKjdRmVHSQ7kT9HXtP
	nArvaMDDMyFJkXtHW/kjCyeWSjyGl8p7c9PrkEQSfwMXPYiQa2ZYh5owxngdJMuDPVTzwNJtSUY
	0fWpIf8bLjvSqgyS0Wqz/4475KZKdNnc1M1qY35FptJ7RDBBt2KRpBIFsmT3Rh9IdFINjwwg=
X-Gm-Gg: AYBFou2oSg0qJuey6SA08sw74DWiraUU336GpWhNfFXYOnmSILYcvm1WCyUI/ZLOqnj
	imalSb0f6K0LatgG8/MSLVP942vsxBzIsdJX+Bh8j+Kt3V9EelrJhpOcZ2d1Q+WtiYo1zCvndVM
	r1QUkiw7YE6AVESvnPCMx5SIIbW2Ut+XArQz5DdbVkkRKLN+kTe/O+cPebtAqkQjILgvZ0yeaUF
	M++oLLnkEDtTVdQ+jEgVSDn3lbtK38/VLL7A46eHR1Wt7HHSLIMr5IAEf9mDZFmikF9A4dvSbRF
	vvaEM7Vt9qMkhbgm3XjviHb2mGmtjnMqCFBAo/aQ8+04BaezbRivjtRipOOFqOJTF0gmnQr9tkj
	1fLtpqwfibcCLbPITY0UfhUOpgKWjGGSqwseGGwtCnOkCkCXGkDHv0Kv3MPF+GS+bTLKBXzPgM6
	yQONKAXDtptyZQTkzAvPBtoNWh
X-Received: by 2002:a05:7022:ea9c:b0:14b:2397:d8f1 with SMTP id a92af1059eb24-14d3204deb9mr213397c88.9.1790750401349;
        Tue, 29 Sep 2026 23:40:01 -0700 (PDT)
X-Received: by 2002:a05:7022:ea9c:b0:14b:2397:d8f1 with SMTP id a92af1059eb24-14d3204deb9mr213360c88.9.1790750400667;
        Tue, 29 Sep 2026 23:40:00 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14d08fb50f1sm2711531c88.13.2026.09.29.23.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:40:00 -0700 (PDT)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-perf-users@vger.kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, jtaubepe@redhat.com, palmer@dabbelt.com,
        pjw@kernel.org, qingfang.deng@linux.dev, shuah@kernel.org,
        thecharlesjenkins@gmail.com, cp0613@linux.alibaba.com,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v7 6/8] riscv: Add software supported single stepping with mc/mc6 triggers
Date: Wed, 30 Sep 2026 12:09:17 +0530
Message-ID: <20260930063919.608911-7-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX4d3yKuQd3ELI
 OAMtIp4aeb+Hbff+njH9D7IWnodfy3pxaCWV/mTQ9n0FD6IaBSo/41FXJ6Y1JOCOHsgm8961iDf
 vCOEXn8NzRR0wgmY4liWOha8RKmEnbA=
X-Proofpoint-GUID: i25unE9nJjY7Wyyr_PT8tZIrswqUs_qC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNiBTYWx0ZWRfX4zZ6/NI37hZi
 yplKlC1PIoVkAaSIB5z2Jg0Q0rWGox6TyU6wPAaGCw350ZQHuQsmYLgvzcD7vo8GjRyKiSSOWHJ
 jTYlfgdUbUHuNqArZc4/GmUCS6WBsSl0g33ccVCHEFRW+TCI7MmyrOvQxK1eJDgjZuUq2oktiM6
 BogrBl5Y34YjZ49mnJBm1fw7Y1fhApxEmcorcgNuw+6w5YboRMYRv+OlEcAmxulKg1fZGkiuCeE
 oM0haYn8k9Dd1G18hARinWuzgzCE+ME3YHvU0fqhx+H1RN4bCMxDlT4D3uoJBINH6QvQXXeBGS8
 bTfeHXDhBbcdAXz4mPSUcfWzA5UT8Nq5Wdq5Es2yDRTMCEoSzmQdTdpF/X2QqBEbzmDZNhDXWYs
 Yx0vyDft/iAkt0EpTWYiiwrprLlFmYSIoGcF7PU4dwaYDIDRPeKiAeQWvQQRkqYTK+pdpAezhNt
 Z8bFvkAUfNBEoCMoFbw==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcaec2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YfvAyfKA-KDybrY5ebIA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: i25unE9nJjY7Wyyr_PT8tZIrswqUs_qC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_074007_987844_272FA93E 
X-CRM114-Status: GOOD (  24.19  )
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

With mc/mc6 triggers, after handling breakpoint at current pc, there
is no way to tell trigger to skip same breakpoint after the handler
returns. This can cause loop of breakpoints at the same address until
the trigger is disabled or uninstalled. Debugger may keep the breakpoints
enabled and if kernel disables it, there is a loss of state coherency.

To avoid the loop, software disables the current breakpoint, finds the
next instruction that would be executed after pc and puts a breakpoint
at that address. When this breakpoint hits, old breakpoint is reinstalled.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/hw_breakpoint.h |   9 +
 arch/riscv/kernel/hw_breakpoint.c      | 256 +++++++++++++++++++------
 2 files changed, 202 insertions(+), 63 deletions(-)

diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
index ca2ef93c020c..93cbf39f4b4a 100644
--- a/arch/riscv/include/asm/hw_breakpoint.h
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -280,6 +280,10 @@ struct arch_hw_breakpoint {
 	unsigned long address;
 	unsigned long len;
 	unsigned int type;
+
+	/* Single-step callback info */
+	unsigned long next_addr;
+	bool in_callback;
 	unsigned int match;
 	unsigned int chain;
 	unsigned int select;
@@ -289,6 +293,11 @@ struct arch_hw_breakpoint {
 	unsigned long tdata1;
 	unsigned long tdata2;
 	unsigned long tdata3;
+
+	/* Saved trigger config for single-step restore */
+	unsigned long saved_tdata1;
+	unsigned long saved_tdata2;
+	unsigned long saved_tdata3;
 };
 
 struct perf_event_attr;
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
index dd6f63953969..9597ed362537 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -11,9 +11,12 @@
 #include <linux/percpu.h>
 #include <linux/kdebug.h>
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/math.h>
 #include <linux/cpu.h>
 #include <linux/cpuhotplug.h>
 
+#include <asm/insn.h>
 #include <asm/sbi.h>
 
 /* Registered per-cpu bp/wp */
@@ -328,8 +331,11 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 
 	/* Breakpoint address */
 	hw->address = attr->bp_addr;
+	hw->tdata1 = 0;
 	hw->tdata2 = attr->bp_addr;
 	hw->tdata3 = 0x0;
+	hw->next_addr = 0x0;
+	hw->in_callback = false;
 
 	switch (dbtr_type) {
 	case RISCV_DBTR_TRIG_MCONTROL:
@@ -347,6 +353,93 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 	return ret;
 }
 
+static ulong get_step_address(struct pt_regs *regs, ulong insn)
+{
+	return get_next_insn_address(regs, insn, regs->epc);
+}
+
+/*
+ * setup_singlestep - Set the breakpoint to next instruction after current breakpoint.
+ */
+static int setup_singlestep(struct perf_event *event, struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	unsigned long insn, next_addr = 0;
+	int ret;
+	struct arch_hw_breakpoint tmp = {};
+
+	/*
+	 * Save the original trigger configuration so we can restore it
+	 * after the single-step fires.
+	 */
+	bp->saved_tdata1 = bp->tdata1;
+	bp->saved_tdata2 = bp->tdata2;
+	bp->saved_tdata3 = bp->tdata3;
+
+	ret = get_insn_safe(regs, regs->epc, &insn);
+	if (ret < 0)
+		return ret;
+
+	next_addr = get_step_address(regs, insn);
+
+	/*
+	 * Software path: update the trigger in-place to an execute
+	 * breakpoint at next_addr.  Build the tdata directly without
+	 * calling hw_breakpoint_arch_parse() so that bp->len, bp->type
+	 * and bp->address are not overwritten and remain valid for the
+	 * handler's matching logic after restore.
+	 */
+	tmp.tdata1 = 0;
+	tmp.tdata2 = next_addr;
+	tmp.tdata3 = 0;
+	switch (dbtr_type) {
+	case RISCV_DBTR_TRIG_MCONTROL6:
+		RISCV_DBTR_SET_MC6_EXEC_BIT(tmp.tdata1);
+		tmp.tdata1 = RISCV_DBTR_SET_MC6_SIZE(tmp.tdata1, 0);
+		tmp.tdata1 = RISCV_DBTR_SET_MC6_TYPE(tmp.tdata1,
+						     RISCV_DBTR_TRIG_MCONTROL6);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_DMODE_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_TIMING_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_SELECT_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_ACTION_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_CHAIN_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_MATCH_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_M_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_VS_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_VU_BIT);
+		SET_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_S_BIT);
+		SET_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC6_U_BIT);
+		break;
+	case RISCV_DBTR_TRIG_MCONTROL:
+		RISCV_DBTR_SET_MC_EXEC_BIT(tmp.tdata1);
+		tmp.tdata1 = RISCV_DBTR_SET_MC_SIZELO(tmp.tdata1, 0);
+		tmp.tdata1 = RISCV_DBTR_SET_MC_SIZEHI(tmp.tdata1, 0);
+		tmp.tdata1 = RISCV_DBTR_SET_MC_TYPE(tmp.tdata1,
+						    RISCV_DBTR_TRIG_MCONTROL);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC_DMODE_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC_TIMING_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC_SELECT_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC_ACTION_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC_CHAIN_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC_MATCH_BIT);
+		CLEAR_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC_M_BIT);
+		SET_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC_S_BIT);
+		SET_DBTR_BIT(tmp.tdata1, RISCV_DBTR_MC_U_BIT);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	bp->tdata1 = tmp.tdata1;
+	bp->tdata2 = next_addr;
+	bp->tdata3 = 0;
+	arch_update_hw_breakpoint(event);
+
+	bp->in_callback = true;
+	bp->next_addr = next_addr;
+	return 0;
+}
+
 /*
  * Read mcontrol6's hit1:hit0 field for trigger @idx. If either bit is set,
  * clear it in hardware (the Debug spec requires the trigger user to do
@@ -401,10 +494,10 @@ static unsigned int mc6_read_and_clear_hit(int idx)
  */
 static int hw_breakpoint_handler(struct die_args *args)
 {
-	int ret = NOTIFY_DONE;
+	int i, ret = 0, bp_ret = NOTIFY_DONE;
+	bool expecting_callback = false;
 	struct arch_hw_breakpoint *bp;
 	struct perf_event *event;
-	int i;
 
 	for (i = 0; i < dbtr_total_num; i++) {
 		event = this_cpu_read(pcpu_hw_bp_events[i]);
@@ -412,85 +505,122 @@ static int hw_breakpoint_handler(struct die_args *args)
 			continue;
 
 		bp = counter_arch_bp(event);
-		switch (bp->type) {
-		/* Breakpoint */
-		case HW_BREAKPOINT_X:
-		{
-			bool hit = bp->address == args->regs->epc;
 
-			if (!hit && dbtr_type == RISCV_DBTR_TRIG_MCONTROL6)
-				hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
+		if (bp->in_callback) {
+			expecting_callback = true;
+			if (args->regs->epc != bp->next_addr)
+				continue;
+
+			arch_uninstall_hw_breakpoint(event);
 
-			if (hit) {
-				perf_bp_event(event, args->regs);
-				ret = NOTIFY_STOP;
+			/* Restore original breakpoint */
+			if (hw_breakpoint_arch_parse(NULL, &event->attr, bp))
+				goto exit;
+
+			if (arch_install_hw_breakpoint(event))
+				goto exit;
+
+			bp->in_callback = false;
+			bp_ret = NOTIFY_STOP;
+			goto exit;
+		}
+
+		switch (event->attr.bp_type) {
+		/* Breakpoint */
+		case HW_BREAKPOINT_X:
+			{
+				bool hit = bp->address == args->regs->epc;
+
+				if (!hit && dbtr_type == RISCV_DBTR_TRIG_MCONTROL6)
+					hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
+
+				if (hit) {
+					perf_bp_event(event, args->regs);
+					ret = setup_singlestep(event, args->regs);
+					if (ret < 0) {
+						pr_err("Single step setup failed: %d.\n", ret);
+						goto exit;
+					}
+					bp_ret = NOTIFY_STOP;
+					goto exit;
+				}
 			}
 			break;
-		}
 
 		/* Watchpoint */
 		case HW_BREAKPOINT_W:
 		case HW_BREAKPOINT_R:
 		case HW_BREAKPOINT_RW:
-		{
-			unsigned long stval = args->regs->badaddr;
-			unsigned long bp_start = bp->address;
-			unsigned long bp_len = bp->len ?: 1;
-			unsigned long bp_end = bp_start + bp_len - 1;
-			unsigned long stval_end = stval + sizeof(long) - 1;
-			bool hit = false;
-
-			if (bp_end < bp_start)
-				bp_end = ~0UL;
-			if (stval_end < stval)
-				stval_end = ~0UL;
-
-			/*
-			 * Prefer tdata1.hit from SBI trigger readout whenever
-			 * possible. Fall back to address-based matching if HIT
-			 * isn't observed/supported.
-			 */
-			if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL) {
-				unsigned long tdata1;
-				struct sbiret sret;
-				union sbi_dbtr_shmem_entry *shmem;
-
-				raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
-						      *this_cpu_ptr(&ecall_lock_flags));
-				shmem = this_cpu_ptr(sbi_dbtr_shmem);
-				sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
-						 i, 1, 0, 0, 0, 0);
-				if (!sret.error) {
-					tdata1 = le_to_cpu(shmem->data.tdata1);
-					hit = !!(tdata1 & RISCV_DBTR_MC_HIT_BIT_MASK);
+			{
+				unsigned long stval = args->regs->badaddr;
+				unsigned long bp_start = bp->address;
+				unsigned long bp_len = bp->len ?: 1;
+				unsigned long bp_end = bp_start + bp_len - 1;
+				unsigned long stval_end = stval + sizeof(long) - 1;
+				bool hit = false;
+
+				if (bp_end < bp_start)
+					bp_end = ~0UL;
+				if (stval_end < stval)
+					stval_end = ~0UL;
+
+				/*
+				 * Prefer tdata1.hit from SBI trigger readout whenever
+				 * possible. Fall back to address-based matching if HIT
+				 * isn't observed/supported.
+				 */
+				if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL) {
+					unsigned long tdata1;
+					struct sbiret sret;
+					union sbi_dbtr_shmem_entry *shmem;
+
+					raw_spin_lock_irqsave(this_cpu_ptr(&ecall_lock),
+							      *this_cpu_ptr(&ecall_lock_flags));
+					shmem = this_cpu_ptr(sbi_dbtr_shmem);
+					sret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIG_READ,
+							 i, 1, 0, 0, 0, 0);
+					if (!sret.error) {
+						tdata1 = le_to_cpu(shmem->data.tdata1);
+						hit = !!(tdata1 & RISCV_DBTR_MC_HIT_BIT_MASK);
+					}
+					raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
+								   *this_cpu_ptr(&ecall_lock_flags));
+				} else if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL6) {
+					hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
 				}
-				raw_spin_unlock_irqrestore(this_cpu_ptr(&ecall_lock),
-							   *this_cpu_ptr(&ecall_lock_flags));
-			} else if (dbtr_type == RISCV_DBTR_TRIG_MCONTROL6) {
-				hit = mc6_read_and_clear_hit(i) != RISCV_DBTR_MC6_HIT_FALSE;
-			}
 
-			/*
-			 * Sdtrig may report STVAL as the lowest accessed
-			 * address while the watchpoint can match a higher byte
-			 * in the same access.
-			 */
-			if (hit ||
-			    (stval >= bp_start && stval <= bp_end) ||
-			    (bp_start >= stval && bp_start <= stval_end)) {
-				perf_bp_event(event, args->regs);
-				ret = NOTIFY_STOP;
+				/*
+				 * Sdtrig may report STVAL as the lowest accessed
+				 * address while the watchpoint can match a higher byte
+				 * in the same access.
+				 */
+				if (hit ||
+				    (stval >= bp_start && stval <= bp_end) ||
+				    (bp_start >= stval && bp_start <= stval_end)) {
+					perf_bp_event(event, args->regs);
+					ret = setup_singlestep(event, args->regs);
+					if (ret < 0) {
+						pr_err("setup_singlestep failed %d.\n", ret);
+						goto exit;
+					}
+					bp_ret = NOTIFY_STOP;
+					goto exit;
+				}
 			}
 			break;
-		}
 
 		default:
-			pr_warn("Unknown type: %u\n", bp->type);
-			break;
+			pr_warn("Unknown type: %u\n", event->attr.bp_type);
+			goto exit;
 		}
 	}
 
-	return ret;
+	if (expecting_callback) {
+		pr_err("in_callback set but epc (%lx) not at next_addr (%lx).\n",
+		       args->regs->epc, bp->next_addr);
+	}
+exit:
+	return bp_ret;
 }
 
 int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
