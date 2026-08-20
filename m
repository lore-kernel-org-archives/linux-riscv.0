Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7702C5DF8C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhFAqbD2ruQtUAtVrExx+lhprmoYlnYNmtlxHTrl1Kw=; b=3kCXFvKJfs8deb
	jiiwxeg1N3tUZvYNilT1/TLonOB1+49HnzDJ7bQWqqmlRs00y5EqpO6WrhF4w+HH04z3TiyH8tGXN
	ndGUX1n7FxdkYvu3BR0f7XHbH7/Z3/durGxW6YTCZz2HYQCAvcwyKYINLmJQOtitc9R/dC/8uJsqs
	t+3k4OHv0IiLFy6rbgFQbJfNnN6P9WC3svGTvwL+Iq+euGfImrZPSfuO2/90alasno73XF85L7g5H
	9v9VmyHz0prFJgW7KHB3qg0c9JJG04t/pMJ90BRrFjcBgWs7kM9bk6tOk3kKq2P4jmCiFdefpMi4W
	VD/Oj7m+hZ40E6Gu8h8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWZ-0000000CDev-101H;
	Thu, 20 Aug 2026 21:42:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWW-0000000CDdm-2DbT
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7k7S1298508
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vyODiBWKuzm
	uq5TZsRKKzD7ne2IN4bfUAIf/kyMhK2I=; b=Hai/VHYydaPn/Lrgc4Dc8uZKjFJ
	FHchH7uar4NIJHbRxH6Bc7GuM9fDY397iR8kytDPbcydYhD9DzMs/cAtGkldZ6DM
	eSqkHyQ3UiJnfhUanyhAJtPG5v9MdjhtVMAyo1hehFVHPz/cg84midQv5T05a9RO
	yHWCEN9Uls7/dxuOQz6sKTtwTLyEynwBeghq+opWeK4v9ufVheXOqUgGFT7tbAwc
	chMGabjtqgsfQtwS2SOFoXl5T4u98xdPLCKRs7u1rJz5oC/M18qJxgl1wyNhLJlx
	zeNDJixtkBgiUaJEH3dapAprUuf8q4m2m0k623mloJoA8rEfWwN0yVcKwZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn8btbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso2119081cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262127; x=1787866927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyODiBWKuzmuq5TZsRKKzD7ne2IN4bfUAIf/kyMhK2I=;
        b=eUq3dCCGM/hKYDJdbVZyrHBJraUtzFQnBwgU47UuyOQpj5bA8TB+UxGxuEZCwNkbQI
         3fdcQWrmYYKXx+9Rrc710qhPujFnQzMrB22UpH6rvrRa09kfAxrfmDagG8AWXBrnLddi
         lMMlTRRE7qZi0Jf+iV+TXaygHjFgURKEZ43gVjmZxuKgJWHHiWRht5GbctWqQSlCCqFN
         95bKbbwz1efbx5PVbA3n5jSRbeXdoF+hFLmOqtoTKsb4zLo9uXejWc6HTO0+KoKlwmtk
         i4EHUPS1owHX6wkecVUGWcvoMkHBsoM+BUiy8R1E1uCZ9cOcFtcGKsVcrozF1I8TNLxo
         bePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262127; x=1787866927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyODiBWKuzmuq5TZsRKKzD7ne2IN4bfUAIf/kyMhK2I=;
        b=TrhaggZoiGaIWXDDZyuaRLlnbdcqfrywDOpPhp7Bmd8EkCZCzJjqw2NKVZvzhyh7pB
         sghra7SBuTeQxXoBp9IGwv1LvlHSTlrh8nKiv0kWXckUgea5+89wIWpq1cofZp89rzRh
         PA3HAe1Oi1QAks46TsY6sjTXLp5oIBnCMQDfSLrPtxCk2uORmd0qdMR7mIb1e+8CtcDR
         I1NBWnlYyPpKOsoPOKUNmQ2Y/xr0B21niRt4PwR3CEkfp7lqtUTq/w9HR4QAIsnFPAIg
         zFgGmQgP6XxASXGy7NVHoPbCMYIumEwL20WmcpWgF9E5V+PSWQImDi8a2ScKptRTDNLK
         OWLA==
X-Gm-Message-State: AOJu0Yw8KqaR5iOjiHbZ8Ylg1Gxr7jcaPEpqLl9Es3PANPQ9JsUV9Wml
	PwAlWfB8/NJYCVJwz2MArIHU1vyk7DfC1jryMTzAYFWLFvMUS3X5ToY8DCZ8aQg/mCK4t+amqpv
	WHKGiVDkODGfwmgeZoTq2r/qK6cP7MdWCctEJVrRLzjOOFDaueLBYxt5KWjvyDGgppJMcL1+LgL
	EzhQg=
X-Gm-Gg: AR+sD102GPJEL1qc1afxN2DXAvqnMLGaq3KzIHN0P/Xe+jKCjyxXliUaY1pkua3baK7
	VPTsuTD2QhPj18iADarqcsf6wwSxmt17xOWvE2nTYKoNzcG/7N9wr1UPI6VKk0XnGQeImKUynBd
	q/67hcU/VDAj93UX2U0w4XRq7OZQWCnExwaVAZLjrckzV4CyzsEVwnBl24DRbRLSxJkP9W+RJF1
	dCw73kCMTvPAHHjyIH0/kORjhfgAlNyMgtm/gme8qJlKqwKAaA8jW8ImpjfqAZJFwz01LhF4MBC
	i5wmM6d5KPvpeTKyiXNwyTruWqsca/XdZRweTXrNOWZbFOInmtXKZ/GaVvfyS+T+u1McONtXFCM
	0qwAnMDyK
X-Received: by 2002:ac8:6543:0:b0:51c:1117:c7c with SMTP id d75a77b69052e-52df59aa4b2mr15893131cf.25.1787262126891;
        Thu, 20 Aug 2026 14:42:06 -0700 (PDT)
X-Received: by 2002:ac8:6543:0:b0:51c:1117:c7c with SMTP id d75a77b69052e-52df59aa4b2mr15892411cf.25.1787262126339;
        Thu, 20 Aug 2026 14:42:06 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90e3170sm8164685e9.5.2026.08.20.14.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:05 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 07/21] irqchip/riscv-imsic: Compose MSI updates through the hierarchy
Date: Thu, 20 Aug 2026 23:41:36 +0200
Message-ID: <20260820214150.545737-8-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX5gHiSV6TqLRZ
 fsNOFVducHw7MZMeWdEORLQEsNIjeWAHETFQbvPaGLmaBi5lxvQbDMMvwrS7GDCvhPIjWkVvRvy
 Z2DYNxwtn6oECH+cjAANdgmDBHZthK89WkaHW/hU2fa2/SDnYMDMQpdpvpyeGOra42miSvr/DFy
 P8LDB/jVUWprppE0bC2697S9jEfiHwohMvdh6TYhdalCM65utJE2LUp/LtMutzCKSFgalgGljgX
 9je4p3NlRM0VqiDSNEJsHtD8Iu5oB8UXvfWvbbMDeHyESXwjuYUSGgPGSfQlPKDid8iqyk30gYV
 HosnGSKDfxscrhF6RxE/TN1Xj1rBUbADb0HRudCLbcS4Mo1dJ3nB4aoln5rE6HV63BsCGV0bF6P
 SarRtN4jJrga9fg6qw9ox964W3TJVA8R/pOjjYWLWgCuhwAEaXJWOFxuQGWO/8njiDhzuUHazpW
 AWMNN4xnKHDgo96ep5w==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a8774af cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6bvwFovRZacPTmdMXs8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX2b0vQTGicciy
 qwr/R8uEUI47kq8kjnPbN7kVKuh/sekp4vkHpgbOY79Q16uUds8MNeSYUmyQxXhy/76GGo5qw5w
 NFcDbWi9zBnR1jgYLmkuC3DBo6g+Lzo=
X-Proofpoint-ORIG-GUID: 2MLBa0P3ho8-7HYEMFaiw8z6A4FA9Z8Q
X-Proofpoint-GUID: 2MLBa0P3ho8-7HYEMFaiw8z6A4FA9Z8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144208_571087_7ADA5793 
X-CRM114-Status: GOOD (  16.46  )
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

imsic_irq_set_affinity() currently writes a newly composed MSI message
directly to the device. This bypasses intermediate irqdomains, so an
IOMMU remapping domain cannot translate the target after an affinity
change.

Compose affinity updates from the top of the hierarchy instead. This
allows each intermediate domain to update the message and any descriptor
state before the device is programmed.

Non-atomic moves temporarily use the old address with the new interrupt
ID before switching to the new vector. Preserve that transition by
composing the temporary message before publishing the new vector, then
compose the final message after publishing it, but before the old vector
is retired.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 27 ++++++++--------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..5634641dc223 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -90,19 +90,12 @@ static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *msg)
 }
 
 #ifdef CONFIG_SMP
-static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
-{
-	struct msi_msg msg = { };
-
-	imsic_irq_compose_vector_msg(vec, &msg);
-	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
-}
-
 static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
 				  bool force)
 {
+	struct irq_data *top = irq_get_irq_data(d->irq);
 	struct imsic_vector *old_vec, *new_vec;
-	struct imsic_vector tmp_vec;
+	struct msi_msg msg = { };
 
 	/*
 	 * Requirements for the downstream irqdomains (or devices):
@@ -153,20 +146,20 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	 */
 	if (!irq_can_move_in_process_context(d) &&
 	    new_vec->local_id != old_vec->local_id) {
-		/* Setup temporary vector */
-		tmp_vec.cpu = old_vec->cpu;
-		tmp_vec.local_id = new_vec->local_id;
-
 		/* Point device to the temporary vector */
-		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
+		BUG_ON(irq_chip_compose_msi_msg(top, &msg));
+		msg.data = new_vec->local_id;
+		irq_data_get_irq_chip(top)->irq_write_msi_msg(top, &msg);
 	}
 
-	/* Point device to the new vector */
-	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
-
 	/* Update irq descriptors with the new vector */
 	d->chip_data = new_vec;
 
+	/* Point device to the new vector */
+	memset(&msg, 0, sizeof(msg));
+	BUG_ON(irq_chip_compose_msi_msg(top, &msg));
+	irq_data_get_irq_chip(top)->irq_write_msi_msg(top, &msg);
+
 	/* Update effective affinity */
 	irq_data_update_effective_affinity(d, cpumask_of(new_vec->cpu));
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
