Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CB2C61DBD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oofwvjJcJuXAt1EQyUzkdh8Zmbf1AhlwEEjmfmgibb0=; b=YsS3elwtUjy+tN
	1SMbscIoZLvwFrkXlXagWaFKkF60pqN2khWsSciKOY7moHcZtO/mJkFImH4rn0yhQ8N2PuXumRM4H
	SXXq2R2tqQSNrUZb7JIwBWgWPMc2d0CPwyOy3utyqq/t9Sm6fs5aR81y51pzPyT+NrqaNrqLfqr7i
	BvBSQ7neG8DM6zjTzi6PACN20vnYpyR1yPVW+NhxQYEK43QXIh8Zq1wY6OF5jnGUKRRy06idSj887
	U7R1sSOf9eEjEBxt39z4uKI9otpY9ZQOD/SW3O77IE/svkKaPJaZCbJaFauxnis46AfyEjsIYGMN3
	UawCMwOlDBPAQhfbJfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv6v-00000001EaL-1inp;
	Tue, 25 Aug 2026 17:38:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv6s-00000001EZs-47Dd
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 17:38:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHUF2e1551803
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 17:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cc2qLo0Tp/EMyoBVnm3JR30X
	IdL8CsTsQTOfYO8+Ce8=; b=RkWlouPIHM5xuQgSTdyCQXIuhY8avRGlKGVG2rdz
	5+dJ6WGCrZcBoHaiNcsPlae1uF1pxOiaO3i+1nd7vzpYC4OSNacnUQnRMizmNA9d
	FgHVl2Rdk78C5Qt5vLnWHwEyl0VDwsKRcDh1azz+cE6dM7ty+N+l+1mU+VVoBB06
	zaUjo4V/inQRtaBgwlkJNqZ5es+OYME4gwfIeR+apk5nB2A57LgdqSVT+vwnWZG5
	I+vkaYoPIKmOPcvUxlJS6DfdtmCSWcRxspp3Q4YakRZax6jDe3RCc8320UjqwCay
	U2Qs12LSubZQICmbMMGzLH4javh/r3bqx4FMTIlyQzXkwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgr81a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 17:38:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52e2d1bdce2so895291cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 10:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787679533; x=1788284333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cc2qLo0Tp/EMyoBVnm3JR30XIdL8CsTsQTOfYO8+Ce8=;
        b=HoLrJVPE02sPd//HlHOxl2+FFLDe80xwpiWK/Bf/60RncDgUWPTqPjWnuI/jMUJ8nt
         eVErWoL505VxMK4MP9t/h1DBY7cIU4xGrwkMgczGmz17PCGYWJprjSVy5gD5OcXZProE
         +i1JgCJSxNRPG3mUYvYaEAGoCKIJP57UnsToIqtj3EP7CotzZl/fazWC0eoJWD/odyf7
         HhIX7K0eDr80XRGYEg1qDua1tCfqkahxoCOfKE4qkVN2oq1wQO7yGDgMDWFwGx09MQUB
         sUY/nEn7+mRqPBWO4Z4tciff4aM6wOThL/JZXla0wfn50mVrdJH9/NRJXuFvxDsJtifG
         GhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787679533; x=1788284333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cc2qLo0Tp/EMyoBVnm3JR30XIdL8CsTsQTOfYO8+Ce8=;
        b=OV2nmBEvIVQXiZPa/rOMO1Yzzfwy0ARAuRIj2ET6oC2bTupc0/PaPonhxFQqjMKGvg
         qQyCBj5hiOdbBzbWmBmO3fUCIRAcRzP+Z6waQPhZLq8kKL8VV8/GRtOJfDfXbtuP7lYO
         U/U9wyyaGqzJHO0HQeLYg02yKY+YOXldLJuGa0hv9CAzi7NglDEjMq5skLmCkoOBB7jn
         o7Atxb/4vb6qU99yD+MwcqYcO+KlHuDwJw+voqRCyymbLQv5EhrSr18O7klTD8LcVQVy
         jkimPBi3lt0RvMFWFeszOmNG/1qmOMxQR/nMtPhwMXIaIlNsEOmAcm13nVEwVp+nrnM+
         U41g==
X-Gm-Message-State: AFuF++kjJyDb2gUMO35UCL0ZYeef28qy/DCqlFozU0bhbLSo2oPWZ7FY
	8vInNQ1RhK0LgOoUlIT+UKquK6Fl9+XV66/IGFcl2FQDRIU1zwQxyJ276tKWzNuBhpXvaGNeYwR
	Ghc5ztpOlX5JKG0t3aBvrsM4gjy5xv/1eXrHMv1sy/Jw+H7bFaqmyl7JmggFwEBRWepsWiuw=
X-Gm-Gg: AR+sD11EZQ5/Jwe5S5ma/QSyvzMlEesa1C+IVLO7jKXyMi6fTLLg0pG/C2SA3LT/2c9
	jC60Dv06/86BlGvixqGpu8thN9C0/8ZF5kkQxrTDNr/REy5v0NJN+leJyelROqF58nWZfNbejd6
	d+KhDuhxA3y6Rxbn/hw0zDQcXDd1vro3msIL9Ra5wiyWLC+OnvIpidt7ehWIfWaoWj5SPPYDuud
	B5n3ttO8MEeshzXtibG96FVlHgGHF1JXFTXg1Se0IJkSsuo0SAWhC9R44E2UlkkQBTg4FVg+Bf3
	ThT6ustJz8sUFeSiwWAnLV6MQmshM/w6mKVqIzojjwT9Vx09w+25XnV9RGr+ct6PaqZTtH2tgfw
	J4ZuuiZAETTaWZCfCkPSa3ZYaZOJd6/l/9CM=
X-Received: by 2002:ac8:5cd0:0:b0:52d:9c11:8938 with SMTP id d75a77b69052e-52e4239d940mr5792801cf.29.1787679533067;
        Tue, 25 Aug 2026 10:38:53 -0700 (PDT)
X-Received: by 2002:ac8:5cd0:0:b0:52d:9c11:8938 with SMTP id d75a77b69052e-52e4239d940mr5791811cf.29.1787679532405;
        Tue, 25 Aug 2026 10:38:52 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d5d64ffdsm28297715e9.2.2026.08.25.10.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:38:51 -0700 (PDT)
Date: Tue, 25 Aug 2026 19:38:50 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <iltwtfmgnmofsroo7eqrvjx6yhqbptwutywq65mgm7adudz7pq@2mdg3dhvtoud>
References: <t2l77h22pz2jg5vsgoth6324u36szra3orgr2g2xo7olyuhzlb@53wnsyhz7aqr>
 <20260822140625.GM244917@nvidia.com>
 <r47pwpyoc4ynv57vtwer73dwikqkev5nfy7kqyba7sqzh5pryi@teiqr5a4cw4p>
 <20260824125204.GP244917@nvidia.com>
 <fp5myre5qaersxxshitgoupbzkx2zwo3rsz3q5jfdiarmtwknh@gmfhz3cxuc33>
 <20260824170417.GR244917@nvidia.com>
 <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
 <20260825140334.GA3325090@nvidia.com>
 <cxbneh42ui3gbkoqrsnoatxoec5exzbprfbgxcy4iekqmbceho@gouiwn5q5uzs>
 <20260825165209.GB3325090@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825165209.GB3325090@nvidia.com>
X-Proofpoint-GUID: 3WRPD9xhP2l5K2HxzieQaFwJsl8NLf82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE0OCBTYWx0ZWRfX3Nc+0bHF27Kh
 BkaoOQFMN7aTRmQwZ+v+1KP3otVWGA62jYgfvm2gyoFFL34XHE3LGQqy4gg0QYSzGd/KSDaS/sa
 k1rJLCojldj8BAteXFSnwMW34J1vE9EwAU+Vc6IjnhO3m6sW3O/gb9Wm/tcS3hSwBaW/T2oBl2+
 VtUk3MrYO9BXExNVEt87qbjCgJkY96+6RgHHMaqS3jo8IgKC5CnmRBk9a6M3+sIr6n1Up3EjOOY
 gho/NrkqO5m5tK/WApofuIxe5kFLJXFuuW/UHE5Ks0r+GA+dK/SXY2NpTAbjFYJ7NCbz8tqc5c0
 FKpBsSF6sIUdAerLl3cJ/7/Ygd7IuDH7udjCnqqlhqZgx2l4A2jaF4FjTYmSUdk4j91AvWLgr0Z
 1Yd/agSuc7qNodSFJjiUKi2cejA76fxznfPJJvgVCbxMffoYi/5YjgSGJP+vzgX8Ukgfrys0gG5
 u7WLcakPobPLjca4t0Q==
X-Authority-Analysis: v=2.4 cv=d8LFDxjE c=1 sm=1 tr=0 ts=6a8dd32e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=-nfrO0Lp-Z-X3alJsSMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3WRPD9xhP2l5K2HxzieQaFwJsl8NLf82
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE0OCBTYWx0ZWRfX9xKKcmKC6jrv
 qIT+/t+adDO5biitQfiPtnr0lYnTh5l+kCk/NN1OruAqu0kBWS3uYOFQ1xkm8IID7WiH+ESWWvl
 XiN7L9C/lhYYIgs9kUkHtp45prxwXPc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_103855_060167_6E1DA9FA 
X-CRM114-Status: GOOD (  37.05  )
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

On Tue, Aug 25, 2026 at 01:52:09PM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 25, 2026 at 06:14:55PM +0200, Andrew Jones wrote:
> > On Tue, Aug 25, 2026 at 11:03:34AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Aug 25, 2026 at 03:24:01PM +0200, Andrew Jones wrote:
> > > 
> > > > The irqdomains remain per-device. The MSI table belongs to the
> > > > corresponding S2 IOMMU domain and its configuration is bound to one VM's
> > > > IMSIC topology. The current prototype rejects irqbypass from another VM
> > > > once the table has an owner. The irqdomain does not sit on top of the
> > > > vIOMMUs. A vIOMMU links guest-controlled S1 domains to their S2 parent,
> > > > while the per-device irqdomain is the IRQ-side entry point for updating
> > > > that parent's MSI table.
> > > 
> > > Doesn't sound like the right design to me. Pretending it is not bound
> > > to the S2 just to make it global then blocking multi-VM is not a good
> > > place to start from.
> > 
> > The MSI table fields are part of the IOMMU device context, and the
> > device's irqdomain is how IRQ operations reach the IOMMU driver. The
> > table storage is owned by the S2 domain so all devices attached to that
> > domain use the same mappings. Sharing an S2 domain between VMs would
> > also share their DMA address space, so rejecting a different owner for
> > the MSI table is only a sanity check, not an expected limitation.
> 
> That's not what I'm saying, having one irqdomain controlling two
> msitables based on how the iommu happens to be configured, and what
> device the IRQ is is using does not seem like a great arrangement in
> general.

The IRQ domain is per-device because it is part of the device's IRQ
hierarchy. It does not own the MSI table. It reaches the device's attached
IOMMU domain, which owns the mappings and MSI-table state. If a device is
behind parallel IOMMUs, the IOMMU domain implementation must program the
same mappings into all of them, just as it does for ordinary DMA.

> 
> We have enough problems keeping the iommu and irq layers in sync, now
> this is making them even more split. It makes more sense to me if the
> irqdomain has a singular msitable and the iommu progams that into the
> device context, not the other way around. This of course implies that
> each vm gets its own irqdomain plus table and all its VFIO devices are
> joined to it.
> 
> This seems broadly similar to the other arches where you do want to
> have some kind of per-vm control point that the VFIO devices are
> bundled into that programs the remapping HW for that slice of the
> system.

The per-VM control point for irqbypass is the shared S2 IOMMU domain and
its MSI table. The per-device IRQ domains are only the entry points from
each device's IRQ hierarchy into that shared state.

> 
> IDK what Thomas thinks..
> 
> > > And this is an entirely different thing, you don't need a domain just
> > > to call irq_compose_msi_msg()..
> > 
> > The IOMMU irqdomain does not merely call irq_compose_msi_msg(). It
> > implements that callback to perform host MSI remapping. Without this
> > layer, that remapping logic would have to be put in the IMSIC driver,
> > where it does not belong.
> 
> You've lost me there, the host does not use the msi table so what
> remapping logic is there?

Right, the host does not use the MSI table. Host remapping replaces the
physical IMSIC address composed by the irqchip with an IOVA that the
device's ordinary paging domain maps back to that address.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
