Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042A7C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/JA9+jq7ubvLBd3p1UV+OQ4o4a/esJCasbsVwl7AP0=; b=Y3doh8IInxNaF1
	bn6PR+I4bgBrRKdi96F2nmAU1TJhjV5bW1iqAkr+hRCEREY/3YXdwPKyWDMON7Y+KAp075MKNM1Rn
	jF4oIAK9x7keUzqtH2Gx+077NuPN539IDaTffXrz42IdpM8PlFOrSXqhPNg2g71+djVzGYglZXXlY
	PLlnskTVj+MHa3SonhpYb/gVuRLtb+Qj8nZTR8UIRPBVLO09P6flGa64r3fEG6evwCnGsBCowfEW/
	Apf/vcHMaON52uF9sw/ZOenLDkIPO+zyUet8PN87XRk9IlrBvQhogt5yJWFY7bU2fIoBLISmOCA1/
	e4qW7l6AqzavXahoJwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7g0-0000000Dk2E-2haE;
	Fri, 25 Sep 2026 15:17:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fv-0000000Djvg-37fv
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD4aH73532318
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=33RzoCUEUyB
	HwJoR1huHVUdUqsyeuuhOe1aSU0G4auc=; b=cNGXHcQfdJsS88Ah/zsvnLA3/qh
	Zk8IZVgtp/UzxegFgc/lssjOiYDUP7oWc5QEq7ynMc7oZDTTJzIR/KKICSQWWMnL
	XTUL3bu4eyEgF8U7cT9G6RR1Lrm6TTigTKCkWxRpThyZ0cDUTOKem/2qKf4M64VI
	TfN8RWrSPJao/LVLHTGCRKqBPvpZlDnB7aYe+5KEiDcLr7ED42DPKKJXVEdNDzhA
	JKNoy8lOosP2bYUASl75qeQh0LbUw78/Hf9tmSJ7FPXv6FY5lJnnV1Iw8GXTTbAC
	wjXtzxjbrFTBtmP5df1qYCFF84Q8K/vRngw75XgMmF8etHsDflMiuqFnryQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kbs4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98537d1242aso918121241.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349442; x=1790954242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33RzoCUEUyBHwJoR1huHVUdUqsyeuuhOe1aSU0G4auc=;
        b=bxMu6WQYweboRiZFipke3CUFmwwahOlFuQAeLfPATy28J6Mh7shnih9CJuiNYLUIqT
         tXfMjU36W507bULQWwpXxpXGpqhogXUUOWikUGaRbX0FoBP4wasTDtBw5LUWnQAd/C/Q
         t/M+0uQm9TdnAOGnBf+FmtOWIEGBToj81Ve+lgTd4cvudvfrTaZHMpBqM1M9RR6+SuCV
         ViDACy2MmADUexdmG9VaXJS2uEmlcogdXsZAq9YtyHTyEQyIYlZMs6thZmhxN8zAyIsH
         y3jJKjvg53MxkHaeujP6IELICAX0PwIfPLs26t99GVCOWFka6sz74hAcbHxU5XlFdPhx
         TuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349442; x=1790954242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=33RzoCUEUyBHwJoR1huHVUdUqsyeuuhOe1aSU0G4auc=;
        b=nVqyrTzb64gDR8oP/XUbfQJkCmUT+EuRSyoiSjCAGh/8P/tnMsaxSQba1msNyOdlIt
         IT+q7pn6OHjQRbfsEE58RoQ5sXJxa/kNEN232SzrWtKw9wNp1zMe3EuWUhA2iyiquo3p
         bWOK/whtwL74kjNcgyHDkou2m4mW7gIUYSeaqZT+VDzXrNmOzJsM5+ux23YBXVwc0T38
         d1vlBkz1gzKWHQM2wJjbP2U4mYfh486DC7gIpY8KWkvNN2Z9IwTefFncbCexb+tTms1d
         OyzPKLyUhhzrTaDbe55hkh2TmxYsx4E1XML+mjHhQKLJP2xqJqLnZkQpyGt/505tSIBg
         Tiyw==
X-Gm-Message-State: AFuF++kc5ryQG+6bZfR3v8R/SLWr8yfSDz2T9N7PsoVJDX7Doz2MWeJK
	shJHco+IyMMBLRtfHb64f7YAhlj8/HsCLbpogWUwNUnjiD1AAVdQ3fhvJk6p+d4D7RLCUl1gYd+
	jE6ipIUo4WoY2bUhKUi/K+RgW/9K9u+20Amj/xciN7D6snPzPcMw2sbBzPicoZsmm39XSderNAc
	0Ienc=
X-Gm-Gg: AYBFou2vHt2yNoqXO+7LUrE5OTzPqFVZnEUWbiDLx6p8XGpgB+xL6ZdL1SoSJzEo/O3
	T+7lqVySs+3ONTRRMxafigJrXHf2jgGuUHM2WcnlqAJQaHt6GEqNw02VVhhKxbEHIfsAOgXVd6i
	SWJ9b1Ozx6VayyNkiRNNGGHUo9HagFTKfVSXz0y/fn+IfwbByxjOByAOHhOFeGQOz9OL3td6fya
	CsFLv3j19LpQ/okSXYNFITruCdHYInfbMJmCc6yxRowtKa+JGrGZLxaxtKBcF8DwKsfGYiTFt72
	ejoXGzCpeaAmM0qld3Rc60EzBxmqyvXlFU+NmvCRKTU63Q6H6XATnzwcot9IH+HD74DN0velDDL
	kEok8tstq3hmmiBMSndhIzoQZHeGCo+xdTz9wZA==
X-Received: by 2002:a05:6102:f12:b0:7a1:4799:33eb with SMTP id ada2fe7eead31-7af1c684f67mr3145038137.5.1790349442247;
        Fri, 25 Sep 2026 08:17:22 -0700 (PDT)
X-Received: by 2002:a05:6102:f12:b0:7a1:4799:33eb with SMTP id ada2fe7eead31-7af1c684f67mr3145016137.5.1790349441793;
        Fri, 25 Sep 2026 08:17:21 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355826sm8069686f8f.18.2026.09.25.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:21 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 10/16] irqchip/riscv-imsic: Add MSI address list
Date: Fri, 25 Sep 2026 17:16:53 +0200
Message-ID: <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab69083 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=iYRKoqeTzvuv0UILnrsA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: E895MfD-fdkN9vLa9q2KSdBL_utEU7r6
X-Proofpoint-ORIG-GUID: E895MfD-fdkN9vLa9q2KSdBL_utEU7r6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX0wfTuJTpHOF9
 Qq3isGHcVFrafGTLotnUTdW1+wY+a+45YSWY46BYf6Qwxdd1UlvqE/XbVXdsYP9EA2Xv+cPbrFN
 9lnGIvhhH8VCPkq5ev24O4/02hgPu9iOCGh9ljk/60Xqx8D9/evc1pzcIbce2Rgl8Dygvdhp+Kn
 JtOLixlFvnfpVVT54cLSmi46EJPweAXvjR0OiwGKRjGO/v36tQwDneY7ciI+mjyDayYItvcjIWZ
 HB4S/lvpnIreV7WqrRuBfLkqjCn49+9lrER47SsI1bzf1KL70aNy94velh61U5SdydU/g0Iqwpa
 wa0C0niOQAEJDqvWo/R/2wa6YUQ9WGXL57iqs+1G4otIqtqemxqxxJsuThGZkBo1XIRdXkRoFmC
 NPwgnOyvo4+ZH+7Kdgx7Q582rDBOOfhng0Zp5WL1+TQ2pCvA6okEfHP22XXlSsQ13rr5iWXatZb
 P2+n8Uz14E92FrcOunQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX9IExqlLBRXVM
 bbIuWuU3YCW0l2IQe3Lc087FiN71aQebUxluXusJYfhnp3ax6t/YoTgOwG6/p7J4H9PzA5J6xSE
 KJ0JWwDDl4VOXs1uhvTCYCKIXrStUus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081723_822983_86595D43 
X-CRM114-Status: GOOD (  17.03  )
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

Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
host IMSIC target into one contiguous MSI IOVA range. MSI message
composition then uses the target CPU's position within that range.

Build an IMSIC physical address array indexed by logical CPU.
Require every possible CPU to have an initialized IMSIC page before
publishing the array. This preserves physical address zero as a valid
target and guarantees the array has num_possible_cpus() entries.

The array size and each target's index can therefore be derived
directly, without storing duplicate count or per-CPU index metadata.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 32 +++++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index df38a7670a89..abd1cdb640ea 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -709,6 +709,31 @@ static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
 	return of_address_to_resource(to_of_node(fwnode), index, res);
 }
 
+static int __init imsic_init_msi_pa_list(void)
+{
+	struct imsic_global_config *global = &imsic->global;
+	phys_addr_t *msi_pa_list;
+	unsigned int cpu;
+
+	msi_pa_list = kcalloc(num_possible_cpus(), sizeof(*msi_pa_list), GFP_KERNEL);
+	if (!msi_pa_list)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		struct imsic_local_config *local = per_cpu_ptr(global->local, cpu);
+
+		if (!local->msi_va) {
+			kfree(msi_pa_list);
+			return -ENODEV;
+		}
+
+		msi_pa_list[cpu] = local->msi_pa;
+	}
+
+	imsic->msi_pa_list = msi_pa_list;
+	return 0;
+}
+
 static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 				     struct imsic_global_config *global,
 				     u32 *nr_parent_irqs,
@@ -959,6 +984,12 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		goto out_local_cleanup;
 	}
 
+	rc = imsic_init_msi_pa_list();
+	if (rc) {
+		pr_err("%pfwP: failed to initialize MSI address list\n", fwnode);
+		goto out_local_cleanup;
+	}
+
 	/* Initialize matrix allocator */
 	rc = imsic_matrix_init();
 	if (rc) {
@@ -984,6 +1015,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 out_free_local:
 	free_percpu(imsic->global.local);
 out_free_priv:
+	kfree(imsic->msi_pa_list);
 	kfree(imsic);
 	imsic = NULL;
 	return rc;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..e51c61dcced3 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -50,6 +50,9 @@ struct imsic_priv {
 	/* Global configuration common for all HARTs */
 	struct imsic_global_config		global;
 
+	/* MSI target physical addresses indexed by logical CPU for IOMMU mapping */
+	phys_addr_t				*msi_pa_list;
+
 	/* Per-CPU state */
 	struct imsic_local_priv __percpu	*lpriv;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
