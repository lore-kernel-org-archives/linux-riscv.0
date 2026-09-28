Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6957CA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88mSGaXs4av5KLEYWRk38e3NWJdiuPHUh4KLTAyR/Fg=; b=Ks9H+MVaDhajrc
	gKEAz4PaMMGa2858kSg1LYUxGex/BhedMyKcIuWi9zeGDMvUQgBrMRmULafnJxSCSQNREvIhXCOdq
	7yksAVgSoD6kXCoIMGU3WvGGktJ2xgd+Gcv7rCwbH2EXQ4UiO8N0k29EkBPtdxXlfZWRW9qCOi1MR
	p682gsK7SEYY1ePVOiwR9wmxyy995H2r5nsZVdBC70SxEMU9uR2zwKRytAvZ3w6WeyGPT59XZLD+d
	erEBcA17LVw00VdWC98o30+00BG83A3ru2lke1ft4MSbclejJPmNDm0YtjaTg2b4hl0sbYIEkqic0
	+Vt6CeBnpn2vLKA5cKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOw-00000000lcQ-47M9;
	Mon, 28 Sep 2026 14:32:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOt-00000000lZK-20Jq
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:32:17 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAWjH1042616
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=95f+Fzhwpw4
	3Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=; b=MMdr6s/ssYyFfuRlTdQjkQCbpmb
	f/ssEosnetm8jJ4kwLwqF35IMwwxxbL4dnl7LoGzzMRtqh3+R+xinaj7DNfgQ2Ga
	8Fy160rzhWysrV3GR7XiQJDH+kWFFlADerqmc9BHUEef8rnpccfEYuLFzmMdATsB
	3d2OuWjIf3U7Prn4tYsYMPvq3Yh6ANS8f2CrHpLroXfPgZYFJZ4MPiD20cw34Pcr
	vCMizsLjBIUMxH2yqZe2hiOP18Jmug11NTuvzHNS/3eQDvoYcgZz/vzUVJIcrpMO
	r9JmFn7Ah9My+daLge+eNX8ZN37hIulxY9tCaDYmtwqRS7UJEo6600umIpQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5msr6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b3cd4ce08fso315843137.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605934; x=1791210734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=EaSw2cHvufNNFp1u5ry07CTgh7qWTz3I4gx+/bcWnFG3p8qXqIAMe0L676g/Svfd/I
         XuAhMZ6tQgBN/gtGTdlG+M/SEs2vcSFNBqyDiUOTNOhRpipLTFYp2LCXArnJkrO5cQ3/
         L5ygzNRJXh1KswkSNpW18DU4uuaZOXS+itJq8I5M5Wm6qa3B7IajhZunkKa3jKKTJcfh
         nXWOfUGyRkNasfUGFru9TjO8qvwPtTLI0t0gOt6bwcZGjVA/UdgEA8AO7uGX0nCG2qys
         30DPUYH5o+dJ2/gNmt0WHtyHdiC4FOjG3Mk8Wddqbh2XyoNDY7MnQKEAWStSIBHRFk0P
         cQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605934; x=1791210734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=AbHK8hQkTnHf72Twhfq9adkfvzRSlDeyCtaKDzQH/xNWfczuONt69QHIwJVBMpjDn5
         PjJl8NC2meVvdc2ak/JgFFTVhM7X2FIR7fFeMUVF6OxPZY82Gi/8Y1u1T6txPvvk+Ez4
         Q2Gjiu5kIUvCw2htQqNi5SutNIwyG5SVDTQeaExk/qxOfqgBmNbseZv07n7Ctbs39or0
         ffhoZgECVrZNayQ26o89n88nbpgMMqiv8m1f5o/0vwCmcRbFTYiTqKhBehKyaFHvzgOm
         lKhYzUAO2IOvaGV3lBzAy15aDdgb5FQhAPVddVjxKkDRnXfkD2MXLsqNIX8vPZOXJd6/
         p8PA==
X-Forwarded-Encrypted: i=1; AKwUvBz0S2gZSbmZDPhXGm3SBcVUDGBK+bbyJbWmoyYxIS0npaWnqdYNksY56HS7Zub86fvrG5a3glft425xzQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJZlh3sRPPJRpUw72flKBW47N/KTRqfG0KNVYFn5Wc7Jj1KeQbo
	fTAFciHbivrfXqtU7sOPrGts5wGwDTiIFQ4nowLP9JKm2KxEClExtG16mdmLHA+BKuKk33rAygF
	PxeTCiGa87jzdfFUKcGNJ1KBvfCOflhxbYQm6PH2xFM/A9dpCbazlkYG0OhgzI84gNkAf0CNzbR
	RwuSQ=
X-Gm-Gg: AYBFou0aUUarSksilkWs2r/uUbgy0MHaGYSj/ruHRVhmJrWGndeKXcfuShlgtnfB1Th
	9V4BhRafksyRXYXNhLmZQUpD0BtvDGDlO3Mnzd3M3TmaiGR9ZgagvunJc59KzTzOTKB/8hXtPB3
	KySSfkuSy7hqYI6AYzvfujmZnPQHDEgXgt4uOqZj2bNRCQ3VNAr3TBRSGvH5FV8fse8kM8odFDy
	NYHuBK6HebypS+234lh2cgBhG1EfOCoLD0Nqrb9rC4mA5wNjUOG2HtkNqEYuqTm/nDDMKUTK3zN
	11svXznxrfwKCVMTkhPkvJcS8hAd3iQb/QQBZYVAvQES1vxlcjNxGP8EJvvfOzSYfNmIrxrz8sB
	lki5zIUAzWq+1uAFsyoZE9MxWPkEi2+3C4lyFWA==
X-Received: by 2002:a05:6102:3306:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7af1d09c695mr3831197137.11.1790605933737;
        Mon, 28 Sep 2026 07:32:13 -0700 (PDT)
X-Received: by 2002:a05:6102:3306:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7af1d09c695mr3831186137.11.1790605933082;
        Mon, 28 Sep 2026 07:32:13 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cba0ffsm4345440a12.5.2026.09.28.07.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:12 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [RFC PATCH v3 09/14] genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
Date: Mon, 28 Sep 2026 16:31:08 +0200
Message-ID: <20260928143113.49838-10-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: pf528ky3in4iuW2ChGG0AN0NpG7KLLNx
X-Proofpoint-GUID: pf528ky3in4iuW2ChGG0AN0NpG7KLLNx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX7nYvmcusm6k5
 fhbSzU1fRJmbhonT5tFYWBxqZV2m9dtfe9M9xq762ouDfbupQZ4bgu4XusX0+U5PD5w7bc7GJGA
 GFh7dssthG6enfhrejiIBEpbtGF3Esf6F3jEpH1Xypqw8hKK3PoUqNTyTaqSd0BozfyLaYcZzPH
 Rqw+S5H8mWnQVf2TIT0HCpW0Du9ZTuejNnlyDVWhf+UOp4ONK51Xy+ILq4KTufB/AIMOLtisg1O
 mtWkdG6GvDTeWcddBz2vnrLnUCOjllzzZJR/5xbcO+UX4MH+H7bo+rJ9olplKzlUZwedrXfcRp/
 b0SsUcPesre3QWZZOpUh3VftC5MXh7deOxE+njE1Qpnj2tGRjxpAL0FkmQ3ocAXUv8imFlxI2Y0
 PuJHOVHPoIOmX1OKDBzlghBblE3pDurJgn2cPXy1K5lrYBX8GvGtjwzdKa9B+XZfEW2ziQxtQpG
 e/iBST43xn2pEY3lHhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX5M68K2Eh7tlF
 Mv+s6JiZTxhE7TIsn9w3lberG/8bis8bI/y6aMJzCaofKzLNZX2i/Fd0o4Jp4a9FrErXS71Jrha
 m8JA7TwjiBCUN7CGUriJLxwQen/ARf4=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba7a6e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=cHhBG6FuOey2j-0mYlgA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073215_662861_77B5B6C0 
X-CRM114-Status: GOOD (  18.67  )
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
