Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9797C61DBD
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oydbztAoEO4AUp/Z9QnDTPEfHt+RKkzkDGn0GHIQcvc=; b=V9BUEKiS1YgWNL
	75p58kJlztfGD5xaiav1TO2Xo3Q/soDJYHAvr5HqwB46JyPF+/1+4O+5ZNI+K84/rNEGADQO35B5L
	HOPstJtOqw81KnQx9OvTyUrzuwk6ipTEbZMno+sD8EN3pyMzyk0sSR2x2gPgC7XM6hfE9d6VePPYL
	xCGT7ArkPAkjYmdLFApxH/wKlMhys/moeL+jPcDMWcKdydQJ22lFRTES3U51WOYNnln9FRN5+OFA9
	rmW7DgquJ1MJZORhADLE4zpstxz13eXEiYzPRqzSDNdm9mxhqgQMTSaonleHo2+LiCMkTWUAwd0Y3
	myEDZ136F4eH2U9fgdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzI6X-00000002qy2-0cnX;
	Wed, 26 Aug 2026 18:12:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzI6U-00000002qxV-2aCz
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 18:12:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGubPX2103196
	for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 18:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dSVenvfxBw53qjjuZWr9MSvP
	Nm3bVPnT5i/8UJYBkTc=; b=Mut5g1fbLlR37Uq+cSyRhoeRHz9YiuCYrHbS7Ver
	mY82Pd4jblSlKnVzgw8WAYn4YcsNFC92IWSF06xmRaNjlgphDGRNS/5muiYg+Hn6
	ZxqLkzlTf4Az3pFztC2svtbwN3u6PXyiixH6zztdbTUuN6ZLy+kf04SLUCasCiLd
	BldZeHABcIzlAeBhT5wW7Bw/BXrHRLc6Q7mJFSjMAoho1xADoWBYMep2kBV8Eqcp
	LY5haTUWvPWZ4+Sko9AAkeQ0UWeoqRN87mdqmi0h7bHes0dLGFhYyPeZQlkxUcOb
	4c/m1Iylf+MVHBobVVsKtrDdDk+dHSEgLJPR6g345OnUVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbs5f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 18:12:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so1490261cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787767921; x=1788372721; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSVenvfxBw53qjjuZWr9MSvPNm3bVPnT5i/8UJYBkTc=;
        b=FxU6QvXKo7bjoQs6ewZOEtLLxNtRt16U9ZWchZHHWQcCXMWdDRXBX1Wr6IkrdHkrB8
         Ndhoehh7l2k6ehFlVjvxUO3/CuvjY+tv3C3sg6GtTw+XdOOWyrItCn87DLBgZAMN1wAh
         EkX4ojQuPvY6iDK3gjQreduMOHy8NYOQOTpupBxLe3yqmZ8+xUNL0EAaxMvWE5tc1Yo1
         D6POnoHZce3f7L5W4K4S3N3iQzJ4gry7pm+9vN5mGCKme4BY423ipFD/u25TaKhjxMgL
         EeofctOEILa3lgKWbD3zCXhZSv7j8lLS/m8IkCwPiiFw5utraJKsyCc2jq8Aj6uqR6Xi
         YpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767921; x=1788372721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSVenvfxBw53qjjuZWr9MSvPNm3bVPnT5i/8UJYBkTc=;
        b=ldRuYYneIKF/4nFQYvnD0P9thsSqwFBw1uoH6kgD62OOIRkKbQN4KuNPXgeRHLeHTT
         KYPRyRGnHzG94Ay7CmO4eqDDRlk57thq7dCKvPE8C5kws+EH+eZLPQ7nuWJfIKOw2pj4
         a3qrX3mltZHcf03xMWoxdbIvEsrS9Ro3nBLDs83MAay7iJRW+xWrdsoC1xXxW3Xy9Ek8
         RoGOWoekMeNREMkmUqKAU8PYFw5NCbbCEUK3aV0PKZrBVJCzGVGid5kDh1IoVCXP5MQo
         cnxK8mXPo4elN/ouJmEh/PCr/VwMa145sMVvpilbzGiN9MjL5x74jTVvzroF9XDPBaa1
         x3QQ==
X-Gm-Message-State: AFuF++lCYSanTMOh/NS4uExjeRU6w3scbvA/O9t/HBkewdtWa7heNWbl
	bgP/J8TXlZQkOwuESDmn5qnlTccb+LXT/vOpVkrvEleFQi5qHzEc5r4ZCCyUqGrOWkW3GfrT5ac
	rNC2IR+piOPdNQUpe8SSCOinq1XatfC+nA4+cURHkWHSOe9MMHNgABpsjswnHP5kl8L7wmoQ=
X-Gm-Gg: AR+sD10x3PssPFBuVDCaqFqbWltKPHxH6AEg/Kxw/Iu8SiNWfZY0A3CYYdf81g58/at
	4q+bmkoLA+mQr9CS8JBJpMUFlTM78R9eyUeMtQhi4WL+ln9Wtq18VM+OI7OPh0msw+UlS7XPKUY
	IM1MlXuz3jD/q1RRIwAVL9BreqeUNcOCmPJmMi+uWSzHXZKmHRyoHI/DPdr0TEL6eigWv7XrPr4
	cFgw7apmzD/JJ9TH4HmjZ5jnRRJeh+vZdSrtSqA2tgkFN3/jouyARdSDNd1aS54KfWgzStK5Yre
	c8ltY9X05DukRwJ4Dp2Du/qkcXT4ijHTVJTIxR8bBBDBj28+J0fMCIrK/D9iSZkxVKx8KdH6NHT
	3C8kMfBys
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr11665711cf.9.1787767920821;
        Wed, 26 Aug 2026 11:12:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2d3:b0:517:6fc2:4760 with SMTP id d75a77b69052e-52fa1a9aa93mr11664871cf.9.1787767920295;
        Wed, 26 Aug 2026 11:12:00 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499fa55f458sm12784615e9.0.2026.08.26.11.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:11:59 -0700 (PDT)
Date: Wed, 26 Aug 2026 20:11:58 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <l3xyzbhqfremod6swwiks54znvoqy57hmqpsdlpcji5czjja4w@4qgiuwhwlie3>
References: <fp5myre5qaersxxshitgoupbzkx2zwo3rsz3q5jfdiarmtwknh@gmfhz3cxuc33>
 <20260824170417.GR244917@nvidia.com>
 <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
 <20260825140334.GA3325090@nvidia.com>
 <cxbneh42ui3gbkoqrsnoatxoec5exzbprfbgxcy4iekqmbceho@gouiwn5q5uzs>
 <20260825165209.GB3325090@nvidia.com>
 <iltwtfmgnmofsroo7eqrvjx6yhqbptwutywq65mgm7adudz7pq@2mdg3dhvtoud>
 <20260825175901.GE3325090@nvidia.com>
 <pzutriwhwe4whonj3veoo4hzxmq5tlmmyui5u6gt4bgl5wxxrg@qjsq2pvd7by3>
 <20260826163234.GN3325090@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260826163234.GN3325090@nvidia.com>
X-Proofpoint-ORIG-GUID: ohuXOjCQFk2kEHdqAtdY8BLqwAE88AZt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfX0d5QkixR2UwT
 rvh2dUuegQ9u1ES+/m0hkI5igd6dAsn2BcoqeWobpUKE4Lu00IAHgoiIboBuuyAyPni8UQ2xqUw
 pN4cWha4tc0qwcehpTYo3WPbY7zFrOU=
X-Proofpoint-GUID: ohuXOjCQFk2kEHdqAtdY8BLqwAE88AZt
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8f2c71 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=b5O_Hy56fsZqd-xyW_cA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfX7t0chbTw2Jdl
 +tDVbUgjTxE+eA7zq6Cj3FcVnfWVWnEZgNVc4GeXB16yIHTsOm+ImZ/EH4oH3DTpbuRuoQdmvM+
 PX2rXPXxTnKvl8TQ4DmLx4QTyvzqsgAgInu6OagoMyNtDrJsbKdW4J8nSIpSOlmS66l0AlqVdvm
 0X+uktYRKhslLLrP0IoMC0mZ6ld77B9OptSUqFbJ7Ck6aUTPnlh7U1O1Ba6t6AVeo6kjGb2mISv
 4wGzL+2OPff0xwZ+6HkqmYqDm90soRUSmZT3ojkdgrqdkZk0+awGJyPWbTfuhHdun8xuRvQmdUD
 ix/54Gg1a1GHpmTRnMnni5pSJ9NMIExu4n2IyTERVJbiTa9ESCS60EofrL7i3piTXJCYlOapPPp
 CduNTTYqHJRNOczwMP+lCqs4G+EawnQZvEf86j77OC94YlnREqXpoIBZRnaqHS+IGzBpV+tPlvK
 BsHJJKeMVpsYw070UxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_111202_662350_5C9998B3 
X-CRM114-Status: GOOD (  18.13  )
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

On Wed, Aug 26, 2026 at 01:32:34PM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 26, 2026 at 10:23:20AM +0200, Andrew Jones wrote:
> > RISC-V uses the same basic model as x86 (an IOMMU-owned interrupt
> > remapping IRQ domain). x86 makes that domain per-IOMMU because its IRTE
> > resources belong to the IOMMU instance. RISC-V makes it per-device because
> > its callbacks operate on the device's attached IOMMU domain and preserve
> > that device's existing MSI parent. The IRQ callbacks provide the lifecycle
> > hooks, even though the mappings, MSI table, and device context all remain
> > IOMMU state.
> 
> The irq domain isn't per device, it is per msi table, many devices can
> share the same table, and the VM should have a single shared table
> across all devices. That's the core uniquely RISCV wrinkle I think.
> 
> IDK how Thomas would like to model this, but you will get a better
> result if it is very clearly explained and asked.
> 
> I would like to keep the iommu out of it, so I prefer if IRQ code
> patches in its MSI table pointer broadly the same way AMD does.
> Though AMD doesn't have the restriction that remapping only works with
> a S2 domain :(
>

The per-device irqdomain model allows multiple devices to share the same
S2 IOMMU domain and MSI table. Unlike AMD, however, the RISC-V remapping
state belongs to a replaceable S2 domain rather than the physical IOMMU.
The IRQ hierarchy must remain stable across domain changes, so a stable
per-device irqdomain which operates on the currently attached S2 domain
may be the closest practical equivalent. I'll explore this further while
reworking the irqbypass series.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
