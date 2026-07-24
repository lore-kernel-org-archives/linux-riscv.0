Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543F8C531FA
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88mSGaXs4av5KLEYWRk38e3NWJdiuPHUh4KLTAyR/Fg=; b=npUtaXLq9bp46B
	b9Tvi2HPYtXCgACudtTz04IcC14761tIeiwHXnBP7ZmtTfSqwYiLOQWwpk4zHw/exNzurTdnTMVbx
	ssag456bXbbpA+9Ev/EiJLE+kTk9gvYktAiC4ab9WsuqqJgYBnXrGnoK3qkHy5G6/YdDqnnFc9O/k
	ggv024voXPGBXzBv/7aMFNSQJaBxGd4i/dBK2ES9asdsKi0ShBdvt/Avdpti2Okpz3B+cirNNcTcM
	tD0DJwTNAZzzwOXfQyhO1CDy+jZIv6hdIyk/Dp1wfZsvekGl/CeAtWTE3H1Yp2p9MjbfmZfWIPB7o
	rT3nv14AgeyI2x5urQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZm-0000000Gf4G-3obe;
	Fri, 24 Jul 2026 15:12:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZh-0000000Gf0P-28Yh
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbHTZ3178250
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=95f+Fzhwpw4
	3Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=; b=GFs837wB4Y/KCyE6CmXhfOmtUwn
	EKo7EGn5liumh3BbAb06RTFqUsZhfBtrRmigfkaGqHaIS4SKxMIY873CLiS4jsV+
	VoCjzJnWuUS/acFswdwC3dh16Xf1zHWbjVcwydzc9sfXiV1gOsOsjRJAeyIkcpUa
	TzIVuDzdKfha1g+myFY/PP21hYyUjFD62g0GPMDhZhVp3f/PYtcEerwwxSIarxoZ
	o4ZYCd3cwbTWbgziCbLIb4Q3uEQ2Yj7VVz9iaao0ULQjKDW7jVsalNE7WcYs2Ycw
	edPQRySdTrYCg0KLHe8cqjPDrOz6qOLgxR0latKxi0Sn5yeZ4JtRe84ukOg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yah4kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc92c5373bso8488526d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905952; x=1785510752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=KOrZcMbZHyB3HdxFqOi5YCuPRXIv/RX2EHyFzr/qbfA/z7Z1MUoKa+AXQuyhmr436G
         gx/XupzGCIrBopQzuHSjoxfkI53NfA7o4A6Zk2SpfnY5wkF9ub37lxXJMPLWOxnZ4aBW
         DFthwCOCdTVJjDNf05YC/9knuqiUUV1sxNYRY11BrR3fa5CjibvduLzMKoQh5vf7ziwB
         duZsX3ebTX/tT3vxoPi18d97723U6grTniKHazc9LXCuNbuGJMQOX1qDUXECKPqmGi8i
         shgGhZa7wmx4Ndg1jImacOubMWNAMD9Am3tTLu8Q0BEMy4NLAJ+0UCN10qEq0irlStSZ
         OivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905952; x=1785510752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=95f+Fzhwpw43Z8OjjMrn3wgehO1wG/e14m5ANO8Aj4c=;
        b=BnvZD+5nLTIAxFPaJx13azFzVO98Uw71Wt1bGX3lWm+l4kxnvnn+XqS6UGUZ/uiHSt
         0QuWJttQp193weP1trrDMCxqD8cOX7bP9jb69UdaA0pydAbvcCaduwOhekrsLr7QGTLw
         Ra0cYkVVTDjljQiHR9i0sToVi1ALt2Dkf2OYHy8Yen71rhcVbWLQG6m4fpRWYXiOY34p
         wE7CRMP30IHn7sWZzQm/d3P1quazLZ6TqWo3/L3O141JeObTgH8kW3ZQqgaxACi1johv
         5Ncz0+wnk1A74KP8vTOn1kYQa+THtFmt52UY8PTArNKUiY8W9CeiqYEpVhBDfPZnmSGj
         g5VA==
X-Gm-Message-State: AOJu0Yz75/LXP2LBqqPjyRgVUIZYOP1KWdghkMMZtW2W2U8m5XiOlbJ1
	cr4ZimOJz/M/h6FXY4JHafLnAzkpboKhRtdoQYLvpcZRXRwRKst4u/8Z2kVVsoT3IyH7zDoUaPK
	o2b9IAEJhUZx1jsRxgTaxwXZNbPOOb7y5zbwGRjSuHok1Z+YK06czr99tS6OXea3aJ4aUNDnEtq
	q8K7o=
X-Gm-Gg: AR+sD12tW06XWttlyL3tJIDnI2J1V+oVHSZ6es/9gcwxHLwToQa6RLhFFX671b/5/PD
	0EJZuyEr0EL3T33nW5dkTE54QiaOAgdYeF3RJGCmsgpSVNQNN+DvlTz/GI6agx57HtAQBRuyQRe
	45SxJ9KetDZFGK2gz6xtVT49j19ZE6JYOa5fDP38gusGrO6LSQtzBs07jVz2NkzXU3ymc6pwRUG
	HaLp7IBuA8bmoDLtaR1JPwERqk+2T+7f+ALE++ykdm36RyXNDyGBrmcl1LYiN5ZMZjxSqjScaNE
	dwLIhYemzohHgs3Thu2xsRv2mpeARUhnYy7cxZpQzhLm2j6+S0YMu1vhZyKBNRXa08Wh7gWGb6L
	7umyzEG4PYRYmBKsbxDSuT8b8fJ3ub6fwBPMx
X-Received: by 2002:a05:622a:164e:b0:51f:798:cf23 with SMTP id d75a77b69052e-5283df62e39mr72262781cf.62.1784905951988;
        Fri, 24 Jul 2026 08:12:31 -0700 (PDT)
X-Received: by 2002:a05:622a:164e:b0:51f:798:cf23 with SMTP id d75a77b69052e-5283df62e39mr72262181cf.62.1784905951407;
        Fri, 24 Jul 2026 08:12:31 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f151fbsm365176566b.56.2026.07.24.08.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:30 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v2 05/14] genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
Date: Fri, 24 Jul 2026 17:12:09 +0200
Message-ID: <20260724151218.965929-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX5ZbKYD8FIglt
 RCwzFfN0A6S005SvoyDy1WhjD8RdRITQVSs01j8zrk9koF6qCh+lwy9+2jfBrBxZ/IVKitmcMgH
 aqHoBFmMIAFCdRjmKUK8mOIMLHwvWek=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a6380e0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=69EAbJreAAAA:8 a=cHhBG6FuOey2j-0mYlgA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: zub4MIVPVATDwNRk27E-ujuzK6NRiSUG
X-Proofpoint-ORIG-GUID: zub4MIVPVATDwNRk27E-ujuzK6NRiSUG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX9ZHg86/0AMyB
 cidHQ6KWufvHIccSW8ZFT2YsBqtVEn+Zi3BRJZqGw2CQ1PwLAJ37AzPjBapthjVQ1t1kV8cnHqH
 JlBOfWo9B6vP4Ir4iHtTcujfgwcZWHCNlwlJv/iuOHMmTTrpbBK11QiGhavAIZkhf64wGIORd+I
 QFVbZw/9jCJRFhzPFVbn+V4zmtW0JZD/6jET0K+EaMkU1MGPCyhEKTP60yhN6SSBlUArMoQxgeA
 v9xowpGpYvx2iB587kmiUF4RhpISvz/+bYhxx9s7hewYQTpyZ8J4e9xUrQCiZW9AfdDMKhJWsti
 JnybHn5e37lyGhm+owuDrqduqFP81qN8fll99HxgQU3B2EQCQdfhhSNNjg/VElUbuqbhQV8tStE
 oUk7y5GpDw1hoNHwy1OxPfItm/igDb62+GH9heyS+M2oUtuVHGoTtumNwiMHp+2b9+TLKCOIPc9
 offKFC9Bv9cLZhs/rWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081233_685340_AB7073C2 
X-CRM114-Status: GOOD (  18.45  )
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
