Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46143C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88mSGaXs4av5KLEYWRk38e3NWJdiuPHUh4KLTAyR/Fg=; b=XUt3zWGlBTfJKQ
	/FydThz44bfzv0Y29MLS4tLUbf1yCRGXToDxfMlT5H1Owvgm6T9jEPmbcmjFd4N2pLOik0yEx3KYU
	7dhrRVInRjzoCtwiTV6PzNKvUjS1QW9DE2/CVVSvGdFC4H8qBBYJIy27/YT3niS2SIJG+XsfKioYB
	pE4s+A/a0UCE29ohZTlCsUUGxux25/uQr+xnfM7EyY8b03X/G/4QfC9aUhdj8onX1VMp/0AeFeTFD
	lHP8zhHSE4MeHpbxAQwQhJJBe0S6Cymg+p+PAkmHYB0mW0l3uglj57gB01hhT+Z0c8UIRfQ1peOMc
	+yYEBgCgvfWQi/BBDgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8O-00000008ZEI-0m5s;
	Fri, 07 Aug 2026 18:17:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8L-00000008ZDD-2ggk
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GO9Yd2039830
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=95f+Fzhwpw4
	3Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=; b=EWbGobTaVHSvMe+UdI9MKJm5XKr
	Qv9IVzn11B1p+bYyThSwwHPjh54LB3Q4uben3cDYBZKh9s4kaTpms/ZMKKFGwW0D
	m7cdgfhos4qm6iBapSZkRFqOz3dzgeX2hdudydXFujQtEuL6WrbjZbAmLx8qmONI
	0wCcNNoZ/k50YHfTgfyjrnM2WRX2uqlnmVFSCIsa8ZbrWTgAPGvha3JErlVQKfBC
	dQnpRsTVfs9q0eraIgfGKNypp5e+OxnURBEtPdwfuSxONi8Z3rMK0j+k+Xtwo3kJ
	U7Gc/4NB9ywuRYwNuxkukIVgSqgYXgMTaH5UOg81wRN+hQ2VPbt567Duoiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcjb273j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c083f1818so39349681cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126648; x=1786731448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=b9WnmthFHdrLqMrOjKKYgkZbUU+tZwZ2p9LtUzTZz9eyiA5bmvg1UQpOz0MWwDMLRA
         cIacngcmHxqVmnlqfGeXGBqaVDu27FREPwX93s7XIyHq0AP5WRqZwO/HhCoJbkOe8LKo
         AxGVJ5tk6sz0aPuVrBQfb9sBOLiISzajBsCX91+M3LLxcY4WTuzMursiODl0Q/Ki2D0U
         aIL/5Ls7vnnKS5bs9OjUhLgaTQEKKpMz11/4aavpWGBxliudbiWR5US3JaY9f3fL56Nm
         35Ap71h+0h3gTZPwVipc6bIvOXTd+YXBWzIKL9cb4sRAQMw9hItAjAuDljQWNsUf9+qW
         /jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126648; x=1786731448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=ahb/pZnOzeQ2bwz1ZUbG/JmEZMHHNszH3xE6ahxH9BAVqClzCeJCmWsEgW91NQEnpq
         HYMQ80oEj4EpxaeFnTTHNFtNnXO3sT2opOykAWTG857Qnt9vyGzc8Xydm3KUQKIMfivb
         7cGilsPF9GrPTOFgiNufe1oQb62aHS3JFJttlyXJy7StrKyljO0TKH5fAtmHxoRrueHq
         5MhfrR9uvhq05RYIZkHMkmBFstlW4HhNIE4Jj1fKQNbR3XL5CfjRqCylYPoKx5l5mJJ3
         YjPV78fwSIsS0zF1s8UBSpYxwHmSGY/rTdW+Kg03pIxhAYFSHYl+Kov8BcrWM1TR2Lqh
         rddQ==
X-Gm-Message-State: AOJu0Yxx19W3ugkgnW1+W29udtEywXgMWPtrTbFVvplrxun34nQtE7iW
	YtOVuY12DMibCWVHwt1KvTjT1octtAH7fZuLI7p7DQy+ISm3/5+IRwx1AnbirA8E4p/li7z3Upz
	KBAgEoY62cOthi/rUNKmtk+xA2CZ2tZ/ZBwSU/hvkwvxJbB3/cZ9uZ86tos7FjIFLMfKcRdzwtE
	CArLQ=
X-Gm-Gg: AR+sD11cp6CeFeOWlpp6rfFl9HzalhGnbQFUrNISlB/h6zl9Tw1RI3tR41wIOyRI6qC
	8iagyMqm8W4wDMcCj8fEZ8ba2Cn9uk1vuN4/Kfvl2XDjn8iAf0coCuRv8yg5oaS119EoQPWhPy0
	pNQgM5OH7gFZLJsLvW6JQSzPvSv8+xDXxGpShR6/3nRQZMw8fw56U40V4fJRGzUrmoAPo2rloDo
	J7/camzMoAhr8SqJnfLlU7mmqosuXN7/1BxLXkPEmSAACSjTX3JsZa1SwbWTHvCfInt1tG41jn1
	fEjEn/tCtMup9gdBn7DwIbLFqtzbwDXFmknXfCnOGgXAIwdE7j5BpM1BX1QoYHM70CoVUlkY6JN
	Aa8UvaMJLWrj9ggS26ATEw0AfXZGITXurFJw3HsM=
X-Received: by 2002:a05:622a:58c4:b0:51c:963:cafc with SMTP id d75a77b69052e-52d20a814eemr36934171cf.41.1786126648157;
        Fri, 07 Aug 2026 11:17:28 -0700 (PDT)
X-Received: by 2002:a05:622a:58c4:b0:51c:963:cafc with SMTP id d75a77b69052e-52d20a814eemr36933301cf.41.1786126647693;
        Fri, 07 Aug 2026 11:17:27 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7cab285sm938856a12.9.2026.08.07.11.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:26 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v3 05/19] genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
Date: Fri,  7 Aug 2026 20:16:59 +0200
Message-ID: <20260807181713.228535-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX2DGLCAqR+WQG
 3C4iiCJlnw6Wekv28IsMdbQa5RR20cTYB4yZwSxhJsFgtsLrnoFvLZDxhxLZgzxmBbeckcZgu4E
 uce/woVsPsE37EM9iRyGejtxNMyF/clZCXjAq+oBNiBIO90CEcPTIKP+Dlm4Gdc2iaATedjA+Pe
 i+7nJpZUZup6cm6s1fGgIQa8XIr/A0iSrogVbOi1BGTqR2RvvPun6ruYdfcCG2bjAMPtWADLrIo
 f5TmkqmT/lFsfOOJ0dwz320DGNMl9JVjPyOnWHR0IDSMyiXfBytQ25skK02aL+j+Lf8rX5NO9aV
 Z6RvShQiIC33VuxXXoq3infuTJzm2o8OzGhZEVo+JqrzOPwNUoW5/6PS1DDMv9k/cI6SaiI+nUC
 FqeyGN+6Gn2Uhna5GbyN8q0U8tlI53MfNWOxjjJ4URxLGoq+jEDSDmN+LZJEKS+iqenp7G8zTrE
 FXpsnBwyDKZq4gd0a2g==
X-Authority-Analysis: v=2.4 cv=QsBuG1yd c=1 sm=1 tr=0 ts=6a762139 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=cHhBG6FuOey2j-0mYlgA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX0NvsyEAgKgqV
 y9bUUzLbN6ZWStd+W7MTbZBjpj7gUHGlNLx+Mlutu5bPLlYXTVKU+G9AxSIVxWtOuIbUskRm/V5
 EcTFOdybZ+IU61elPrACxB1A7R7RjJY=
X-Proofpoint-ORIG-GUID: x586oeMbKF1KquIaCVmf_iyjMjY9QMhA
X-Proofpoint-GUID: x586oeMbKF1KquIaCVmf_iyjMjY9QMhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111729_704877_DC20C5FF 
X-CRM114-Status: GOOD (  18.10  )
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

Add a bus token for MSI domains that remap interrupts, needed by the
upcoming RISC-V IOMMU interrupt-remapping domain to distinguish itself
from NEXUS domains. The token is generic because remapping itself is
the only property that needs to be conveyed -- there is nothing
RISC-V-specific about it.

Such a domain implements init_dev_msi_info() via
msi_parent_init_dev_msi_info(), which leaves 'domain' pointing at the
NEXUS domain while 'real_parent' points at the remap domain itself.
Accept that combination in msi_lib_init_dev_msi_info(); no other
msi-lib changes are needed.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/irqchip/irq-msi-lib.c  | 8 ++++----
 include/linux/irqdomain_defs.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 45e0ed3134ce..9027dfbab15e 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -36,14 +36,14 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		return false;
 
 	/*
-	 * MSI parent domain specific settings. For now there is only the
-	 * root parent domain, e.g. NEXUS, acting as a MSI parent, but it is
-	 * possible to stack MSI parents. See x86 vector -> irq remapping
+	 * MSI parent domain specific settings. There may be only the root
+	 * parent domain, e.g. NEXUS, acting as a MSI parent, or there may
+	 * be stacked MSI parents, typically used for remapping.
 	 */
 	if (domain->bus_token == pops->bus_select_token) {
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
-	} else {
+	} else if (real_parent->bus_token != DOMAIN_BUS_MSI_REMAP) {
 		WARN_ON_ONCE(1);
 		return false;
 	}
diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index 3a03bdfeeee9..954cf585b3c4 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -26,6 +26,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_AMDVI,
 	DOMAIN_BUS_DEVICE_MSI,
 	DOMAIN_BUS_WIRED_TO_MSI,
+	DOMAIN_BUS_MSI_REMAP,
 };
 
 #endif /* _LINUX_IRQDOMAIN_DEFS_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
