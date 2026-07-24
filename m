Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800BEC531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZbOIb13hDAyPwWslqPE2uVbvQ3GGH99eqFEPl+bnWg=; b=heZg72YTqEARsz
	LrNw9F6XLshT3dGZJb8qfmQWFjuNO97gHBEqvLk5j2/JBNtqGBenmyYpZ1DIZt3Yl+GobsjgFZfW+
	6C877IMzpbAoMX1t9RA6vHTmKRmsITjI3jhvWaBzC3LH95PISP0l5Q+e3WnndhsiIed6r6hsBlLbD
	fJ1JVle/a3FvKuPomml1GN2G0NGphjWfXVcn1bIO2v1sRfeWNsb5EiK23rmzC7bUhRyexDYefoSUx
	D/sOB5z2RFkbCCgtffyu4ab1y2uC7u+V93wgVOq6Xq6idTmBQBaiedfSZHwJGPLOJ9Q5gCaWYt9/A
	zh998w5g029cOSXpDRrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZn-0000000Gf4L-030H;
	Fri, 24 Jul 2026 15:12:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZj-0000000Gf24-2rD4
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbAjx151521
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pDwQTzkackf
	YyWvS2E1rMtaG5mXeUpuJDpmUY0FaUR4=; b=fuE/TVdzS4YIsVQCtTo9S34dhoc
	hsHIrW1AGwfbOytZnTqzLuMvT/WZl71500gSakWVU3lre5JOovNL9uQoCWc3vQZ0
	pLcv+aLZ9mmHUN1K8yj1iPP1RjSk9Oo9YkmZIy5cAof7EZ1yGiJaAvv7KCi3inDq
	uO5/ziq6eg1/MWVSiag9J9e4Z1aVKoQ042ofGv6wG1L45aF/0v9uRExVIWIKNLYZ
	J9nc1kk3ompOc/iULZhqtmGNOK98GODoKTmLZWloxwnLTRL9N25j+CgLBgNYWNQC
	GaN/y7Um+IByOombta8+pAAnHBNZ1YLo+iuuP2SnAEOiW+jkDjktF1nd55w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck8h75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52827090cc5so9591201cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905954; x=1785510754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDwQTzkackfYyWvS2E1rMtaG5mXeUpuJDpmUY0FaUR4=;
        b=SdEd0C8qXCknIxoLDeKCDPkEZ9aFtZocZgFjkfz9U4UirzwYzGwJZ+Hfu7flifYTiy
         rofCwBNi5IyRx+e6ru0Dg9J9p8SAtS+Q1mA66cTKru/z/DVqSg3f2LYNz0gsskcFbW3u
         k1F+wFAsqd1EhhJEszZMqr7S5eR4QpqUKdLRPvA2lPIXpqXozHX6W0yw2ICVJKStm1c7
         iS7YIM5Crurmukh/oAO7slAp6tRwKpBXchoJ8dfgyjdYbipeL/wkYb7ptzQ3drVqDKx8
         xETFVjAGlVWuyVmGXNYUSOWFKJpvnOaHyct11UWPPkHN04tG54j0dFs1r0Df0uqqYf7v
         ibxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905954; x=1785510754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDwQTzkackfYyWvS2E1rMtaG5mXeUpuJDpmUY0FaUR4=;
        b=ZoMf6CFqy86aVq4BONsWCr4XA3rakD8+l6eYe2MiIVLZrfkcmbrSueSt+PECAxGC0s
         TwvEGs3pUmhhbJXDrRpQdYzvXbOrcoSbBckz4JgV0KawaN/DUzY0sB4Q86yVU5ZGb1vb
         MXYSx8KDpf+8+8o+9TpCjX1m9KMvWbK5bl/Hh5Qe6jcXYamylMX+HwOYPum74s7iw0kz
         CQXepPiZ4s7j9IJfTw9Fi/x7C4hzFH8gREaipzmG93fg5r7iGUO0IF/hwbBtY5Wqyv2l
         +EpefzTqhBDQuMzFErFKZETsc6Yrt6FX5VorIcfNWfzDSA/I6lLVn/E8B976zzCIv5Ym
         85nA==
X-Gm-Message-State: AOJu0YyK3WhGADaTVaQUyNIGwwkoqPVix/f1C0Otlyc2kQkd3agjuijp
	dXneuzKq+3CHUqz9DVBi/wMWLo+mgHNIrcUl7NK4zuRcbNMuUGNBMZuOoHGOidxtaHBm9f+5rhk
	jiPytfBKC6R6LWJKlOFq9FMd8nxuXNFKTe9MjJtjPFP2qGnnKiSp5GsLe874rb+bMoibmFIjzuL
	bvsHY=
X-Gm-Gg: AR+sD12mkqz+UYwOs1mUemyLTWiYvp3PsHpWL76uJiE53HQR3pW3+6CXT0+CdUkyXvs
	u21B4y4fTQy2i8tebj1gkDP6VqOGWmqKvp07J8GDqmCdB8ZRgixegMEiGlQ0KQ5DG81nzY/pJCm
	XykxaI5jXAl6xalhbcIR0hxPKFCBx2oDCslqiQDvKPLfsTpiWqDx2YzxN8vjlnAIA+1dAd/RJmv
	xoyQ+zFumKxovxfqpHQKKtb2D4dDqcfPiwdnl3OHH+KyVS5l7JX/EbN6h9bkPLi8PwnXCiyEhkK
	OnsW2NK2a3nRUmVaTk4K6RVc0cY4Rqa5ux12XPU+Qph3amaqA3rLPppufCHTNP0VXWbFn2uu9zq
	bMVl6NdyPfx/O4zd1sDg7ebQvjIzlbHYm5zzf
X-Received: by 2002:ac8:6546:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-5295d377f21mr10370161cf.24.1784905954098;
        Fri, 24 Jul 2026 08:12:34 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-5295d377f21mr10369761cf.24.1784905953639;
        Fri, 24 Jul 2026 08:12:33 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af243fsm367656066b.26.2026.07.24.08.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:32 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 06/14] irqchip/riscv-imsic: Compose MSI updates through the hierarchy
Date: Fri, 24 Jul 2026 17:12:10 +0200
Message-ID: <20260724151218.965929-7-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX9Vt8RL4PQroR
 Vrhhr4HXNWZosJvrvCLedjk5Ybb80jnggp8/kmkCe73Dap1OkfrWWbLz0+bEZXE8Rp4Z/pbXyVZ
 4GstosnJD8yBRm0gNQpKwDy43Uz33sy7PndoiiDeDyXkmVKFuC2bATKPQdOJbsqMhMNPqFbaP4O
 vetUCgrzWA91F3HSe50ajQUwkcHV9bh20UMyi1VsIe2cyYx+Hf4YMdyjbooqLD3rUtKwdqeg4a/
 gde665kDWgTRaN7loIS6PbLrwk9O24WRVf2bEJ6Ar6nNa+K7jxHFl2bgiK5WFBFeOEUU2TOATLm
 tapMLX5ZvgWq13RiIT9GAhxCrsYo4KbGU6itx8Jd5gfafqdCrvlqc1iip4BiMNCZ1Wx25Fvx5Z6
 G41yKWXOPUmmjIxKFvl6z5RhzMa8XXGga69WdHuycppStV+2hmOI2zOKsGwCbxh39srva5/uqs6
 n4vF0kyw5QxF1tx+uww==
X-Proofpoint-GUID: Co7oLNjOG38BbgXA_54QwKgNoImr6WEJ
X-Proofpoint-ORIG-GUID: Co7oLNjOG38BbgXA_54QwKgNoImr6WEJ
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a6380e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3qtCRIp3mPeaHrg9mH0A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX4R8FcVYrUozK
 9e9PHiHoADP6KGEs2qpxNutl+7mKMtSdaZu6camNb9GhDsX1INIwK1Jjxgz757XpKGIS/QMEVKl
 WUUDSbkbp6pyHlfs9vsSM05+ik7ydsc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081236_994855_3B63BB12 
X-CRM114-Status: GOOD (  17.97  )
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

imsic_irq_set_affinity() wrote the new IMSIC target straight to the
device via imsic_msi_update_msg(), bypassing the irqdomain hierarchy.
That skips any intermediate IOMMU irqdomain sitting between IMSIC and
the device, so a remapped device would keep the pre-remap physical
address after every affinity change.

Compose MSI updates via irq_chip_compose_msi_msg() starting from the
top of the hierarchy instead, so an intermediate remap domain gets to
translate the target before the device is written.

For the temporary vector used by non-atomic affinity updates, compose
the current vector through the hierarchy before d->chip_data is switched
to the new vector, then replace only msg.data with the new local ID.
This preserves the required old-address/new-data temporary target while
also allowing an intermediate remap domain to refresh or clear any MSI
IOVA state cached on the device's MSI descriptor.

Moving the final write to after d->chip_data = new_vec is required
because irq_chip_compose_msi_msg() reads d->chip_data. Keep it before
updating effective affinity and migrating vector state so the device is
retargeted before the old vector is disabled.

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
