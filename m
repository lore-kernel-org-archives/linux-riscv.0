Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CE2C5ACD1
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZbOIb13hDAyPwWslqPE2uVbvQ3GGH99eqFEPl+bnWg=; b=4eggxtCE/jFIRz
	GdaQDzMNbJF4/gsrIBMNmcc22CAj+FU92o0Bi2R5JYul1BNhqlwAv/D9uFNbAAgTju4fJkhmwm0o9
	M2ePHoYFexXTIfgovInoYh9qoRc6QDE6SBykJ2olapn4V7JHKTwLeMBWv1yJoCzNFRBjRlidzreQq
	TR7GlR1SM/xJxQwfmMAiRIu0DaxXCV5H/rj/79C2xMsodejSEVjz3DAeqMvFAl2QtFDeSrzZgG/Ro
	opcqrnKliQyFoVJ9mOqtBotPXXn2CcOfAHx4BQe4pklsBXVHCu5Z+cAlXQ5nNcOH7cCo/TWXIcrH9
	ICXCqgWc2mIhxqdrG7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8Q-00000008ZFc-1BxP;
	Fri, 07 Aug 2026 18:17:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8N-00000008ZDo-1UGK
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677Gbpiv1475100
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pDwQTzkackf
	YyWvS2E1rMtaG5mXeUpuJDpmUY0FaUR4=; b=dKwdx06S6bv4tZCmafXCDcMneGs
	q++is8CYGWL9SS7UCh12/lMJoeeI3y5MAACe5rJYNRZbBNISIBT5sO8W3Rc5b+xF
	Qeh5nQYYiddIsEcuZ8t3+r5tMUKDJSQhubCiOS2zJQ058NPbSM4X3lvp8weSOQVH
	bNID3jUhqFhUo5ws71QKuWwB3UwMquUGJ7Q23I1J9X8qnj5zR6/6Dgc2YyePYPP3
	bq8GT71LT4/xEMv9bQnqYsVCcSt4lrkB4dr7+1vdP/zjPGLI2oid4pHb3Zsloy+u
	/NrfGIp4zRDnXUF9HNfWZohoNnY3V7R/00fxMgDdQFS6ulD9YpeybNGcXTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwk228f6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso54344351cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126650; x=1786731450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDwQTzkackfYyWvS2E1rMtaG5mXeUpuJDpmUY0FaUR4=;
        b=FQYycnDIZmoZ0jfd+0C1Lw43E7XeeINf6hAf4F7MAPpvLXcq1EvNr/r0uZTbw25gG5
         MSLNsSuLCYDU6+vsDtIVqIrmMlWWxbxQOxYJ4CdUPHcnziu1XjBvXgTi34uObbH97NhH
         i5boooIQwV4cTbVooThTN8d7K5hiuPIF3caSL2Jl4J2E+b+60DoY6colojQqxb7zazuZ
         Ay/FQvP6Piw020AK5cZW/BMQnaoqPJHuyO3iX9HF7m4s/v7oFJEpGiHrOxBlTDrAN6ik
         NEYqz6XZkqdbtyn14sRn5dVhedR5m6accGi4r4G3ORc4QniodrEiqBlHMTaim1GHr2AZ
         IMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126650; x=1786731450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDwQTzkackfYyWvS2E1rMtaG5mXeUpuJDpmUY0FaUR4=;
        b=LnosQBMSwelmREpchclviwUePbIdWhQ59zm5rijoo30Am+NNOUp4WUFoZO5IQwK2+h
         pQ8Uu+m6u9kLDxu7yQdJVbc1zGAkanmF0aVYbZxhyi3RqPw8ymV8igaOOPnVHR99EoEn
         L28AY6T5QveLVLsXufIRT/kB8cbQNt6gqvILNMF1s836TD/B1s/RFYStziI8QyTq6aEX
         PR7BdkH/LaykU+Ft2RZQJn+sJYx/74nr4BUOUFHkW6RMiOO2uvUcVDn3KIwBxv33ZrUo
         lMdRxwhHSd4PKhulFLAp9fHTCYKjONqtSg1DoGCxL+NTA2DjkxcClvl9S4ssQ8g4DIf+
         9nQA==
X-Gm-Message-State: AOJu0YwWtcRjJKGkGZITPtwmzfbQoa6J4ygOcD83y0k7d18YZelgsBZD
	GNls1RfZLoZat790aRKcdXvypjknPJMg2uAhjub//d7oRlYYZ3huJCbifPQwYIxETlyXOytKQa9
	GT8CvXDLvgI06fppoHtvuDt5NXvAPcrOmL6BV4icCeYm2Owxek2Z7HgTs9EdLxHXJsCN+2vpL/Q
	6ANYo=
X-Gm-Gg: AR+sD1190hStOlkjzNZ1rX4hF3g6CwT6ohxg5RK7eh4/O4KvfE5pHY3R5W3jzpZb0fT
	1uJWwE/4fERTMGJzwUFSlEzrw+AtHqAp/8AMiUseSkP2h6+XWQrcieV0vtt4H9bjYpB38Em+Sjw
	TfwhGMVXgw5BhZrAlWRLwtZbzj6zNoA7jk4m6vnfBcxIgE0qMBoqwJ0kHs7UTUiDBpBI80eiyfc
	frG43ll6MFIluNNE4uKp95v7p3y9A31BH8dVdjVlGeQ+mN7dIJOCQdw2/Wedgn/BFVOOKyRpJva
	3wOfqEPKl+lK8nDgdyy9psL/JPewPB/Qfc0edpvqrV6R9fwNi+84GUnmN/zWEoX5vuRY3S3/q0F
	Tpy5BaWsQjlrwB4MgXvwWm/xPlA297IH85ei0WLo=
X-Received: by 2002:a05:622a:a10:b0:51c:a9a:b0ed with SMTP id d75a77b69052e-52d0b191dccmr138504351cf.26.1786126649710;
        Fri, 07 Aug 2026 11:17:29 -0700 (PDT)
X-Received: by 2002:a05:622a:a10:b0:51c:a9a:b0ed with SMTP id d75a77b69052e-52d0b191dccmr138503641cf.26.1786126649289;
        Fri, 07 Aug 2026 11:17:29 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cc386esm80002966b.45.2026.08.07.11.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:28 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 06/19] irqchip/riscv-imsic: Compose MSI updates through the hierarchy
Date: Fri,  7 Aug 2026 20:17:00 +0200
Message-ID: <20260807181713.228535-7-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 41DVX9xu3BJRetL9q_khRI70FJT4c2Xh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX3SxCWmkXf0kI
 38v3+NJMhSDo+03xDjqzWbKACOPRdkVZc0XTtHZB2h1IBoiunZC6PYkhHrOH+ooYYA3tMCyVzSM
 16GpJLK6vCWElwK2nQdOVxx9M1oS1QDju2uL4H6b4Y/ABYICoOE4yhHBMS81NvB6yq/dL02sND2
 12JJgT/Z8do+1vb2dzTWxyVaZ9VSRqlKhn0tW1GD8RXEtXJHG/SfazNAY/HND5ab6MNNZ+gXLhe
 FOyISdcrGxUvxrs4js7Jl3IzodsN4k7y3ILa4pi+WpG2kgy4AsClwpLWyAkFr3YZFhAeYfvARYc
 m5Kh/fWFEU4hOiHbUqO7d91c5uaPSo+7L5oEYV+EYAEKG+Uy33F8vNG7CkLQSDHsokvq6kR04Tp
 nMl8PqfjITCChp+G6x050J3zzHSzUkL/gvfG0GUvV2vgH+WOQwMzq4302LKPUKmqIn86a8Lf0NZ
 x1LPpPTr8EYwjhr7ZRw==
X-Authority-Analysis: v=2.4 cv=bcBbluPB c=1 sm=1 tr=0 ts=6a76213a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3qtCRIp3mPeaHrg9mH0A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 41DVX9xu3BJRetL9q_khRI70FJT4c2Xh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfXxwjOwI5MPt4J
 Qvk429GWeCoP9prMIqXvjJcqTV44jB2b7ffXm5tbLYCPjTz1Tk9U8SNXWL8GD475S6ENbiaYkgf
 B4/hl5U4j2ILDMNyHxydS4BEYUusrTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111731_511482_5AC92B3E 
X-CRM114-Status: GOOD (  17.52  )
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
