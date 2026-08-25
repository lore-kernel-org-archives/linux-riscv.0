Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFFFC61DBC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J18XfX9W7EjRd/wFRrlit13RdCC2gqs6mrFrQIJ9FVI=; b=Jb+hCYYSlPbDCU
	Yp59SUDePhF8OWGc9/kuFoU74pGIakC5lVxFilbxe0tGzIptEn0ONSi7Om8NG1wmsY6i7hFejstP4
	WVr/HB1GTluI1lE6h2Gm20FKlxzf7+uCGOiZCvOHNjM52yL0JYhNkT6xJk91vBChSN35kkZJeREiY
	Kq1+rkb/VhNr8EhRzkhFU2OiArTw4C+8AV4/9oKjj1+Y4f+VfpjnCdJz3SOR/huXeDcz0BUNuI2NW
	27Lvw5ZBN+XGyI8sIPmgiJtw4/LtQm9nHF4TRH4wC5qVz4fVe7HfJ6lrqZkjp21893AjADswdr+us
	gzitlHV8TbGkPg1STznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytnn-000000015vW-2w9V;
	Tue, 25 Aug 2026 16:15:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytnk-000000015uv-3izs
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 16:15:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEU2nO1624889
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 16:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QpPCKnkowjV4zGekfA+MRvfy
	Y49uQf080rvS3Bt68KM=; b=YFveKJcQIpXLugm7dfLrfS/O3dcyba6727/ymst8
	gD2PbVa3OW/xZm/ZuHhcYs/0h9TTnBg8qxUNSOp54GiuT+3zF9Xp8BuNazqWiqoN
	WzWtjwYsmfWBeYG+Eu0/W4RsPqaDZG/8fHCFACbSrWQXHsHVOVKRscVniOZpV1FA
	69eyDBhvz9PcHRwV8pgXuq6morIvdqFHthNjO7zTt2NDTBqLhVBnsyHWsq9a4QYf
	APsz44u7B/qVgP6MnvNrcqqQCwuMiPSsndisLzp8RzauyQNzv7vjkYie71HKVztJ
	3v2Hod1DwQ+Na72oqSzwExB8Q2BoKJoZMH8aUcqrdXEcaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93natxj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 16:15:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso71441361cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 09:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787674503; x=1788279303; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QpPCKnkowjV4zGekfA+MRvfyY49uQf080rvS3Bt68KM=;
        b=cGBjLqEALw1g7bV2DEOCQRJJuEzEp0M3yGRofcgZK9X6NwpObB9O9q7BM2fVIRWIFp
         g5u39hCB69oJlHA26fEctvEZeXPCdfgM6FgtI2OVyYseV5X6RKtzz2hDc+mFKeUZl3sB
         XjtODwNiuijiiv5msn/dmV5wpJdVCqvZ70tY0Dz8oSvLGLEM/J4CK+/21DtE5KK0slkH
         DFTXMqcqCHk+9DNNjoSllsoV/qmCXuEfKpTVUJ4G/Dxv7XfuQquQ1CW54m02pFsgzpOO
         rCSYV/GkNnxcvlmCejJ0PPq90QFWSOnrrIc/ct9mJoVK7FXfJq/4URCep+6Hz6iH9W2L
         reJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787674503; x=1788279303;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpPCKnkowjV4zGekfA+MRvfyY49uQf080rvS3Bt68KM=;
        b=IE+2rRzdCvWWDHisL3LJMEa4y3PMkpqIClRtnKZRxK63pD6ekJ2dURAuOMI6JTX8c+
         rKjoxMzILCcIWJg6I3cy7khxlhI/awy4NzpJ9Qe8JYReQ4nyvaTo9stT8bAwH/fgLTNR
         KWY73WIL5GiAjLoAkm18sF07k2gnexzH9CY1NeW/nDyWZD3XAvDcAF6Qg/loNgU48LCL
         7bE1HAcVKTc2DtGL+yRXmIILowVJ4R9nRsX1vC62TZ0qlmdrF6PyM8+/WLE4jF8qY65d
         MhKgEzb8v9WWlspgR6AesumzfR1cYeoldQX8aMa48xqRJwUvzhp3MJzm5NN8hH5m8YhG
         ks8w==
X-Gm-Message-State: AFuF++mxvQ6L0P/zZiM3IiuCQNxdSTxBHT4jC9Nrt5aOE9akT1mjKse9
	0i5yOnAFbhknLK0CiSjqsx1TIFDz3hBvbrEZy4kHyHMabnLgA/hagrKfKRaLPqvNxBkc6XF6wqG
	AlNEYXtVXt/GT+3grVtLMI8GssQH9BGB+nLQY8u+ETEP9oFRUra9NkBdNTxNPfhihoWb2QfI=
X-Gm-Gg: AR+sD10cbrHyIScK59kJXgP1AMx7fuWiBk2PEUtaF4bB2byGe7+FyMV0Klp0QjFnntz
	g9gJ9h2bGD0Ah6mbTwCYWXFTCd4ru6mEyBr/sIR/FujNJHuhrzfuphVSs7RXQKs9AxgIGOuHcZI
	Lr1H4z7PDCjKVvGIdW2QcIU59aVBnmPb7kMZoc9okMp1FfIHo7ZuOhwXJMWw/iDbEHXDTsS04wc
	y3wm2BGtIErnhYLzBWdjsMsAGa3J8BQ/3KWqXTUTS5+iq5atuenyNUuBO5LKAx/m50imvIFbueS
	SEPCIgeIM+Tmw+s5O0KY5FfioU8h9JaLvmkaeMwli4W6vecijCBDVv9WQQTJIgUSRC/T4dl3p9m
	PGAW1OsYDnDbQaTF4b/tIIklNjhxwJQYrgaI=
X-Received: by 2002:a05:622a:2c5:b0:528:3d62:16c8 with SMTP id d75a77b69052e-52e2f1560f9mr82775461cf.31.1787674503074;
        Tue, 25 Aug 2026 09:15:03 -0700 (PDT)
X-Received: by 2002:a05:622a:2c5:b0:528:3d62:16c8 with SMTP id d75a77b69052e-52e2f1560f9mr82767541cf.31.1787674497799;
        Tue, 25 Aug 2026 09:14:57 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b43cesm24652066b.49.2026.08.25.09.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 09:14:56 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:14:55 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <cxbneh42ui3gbkoqrsnoatxoec5exzbprfbgxcy4iekqmbceho@gouiwn5q5uzs>
References: <dug43layphru76sqleerwtryyerwa4a6n5s4xwrk4iyfru4o7m@al37eknignld>
 <20260821172015.GL244917@nvidia.com>
 <t2l77h22pz2jg5vsgoth6324u36szra3orgr2g2xo7olyuhzlb@53wnsyhz7aqr>
 <20260822140625.GM244917@nvidia.com>
 <r47pwpyoc4ynv57vtwer73dwikqkev5nfy7kqyba7sqzh5pryi@teiqr5a4cw4p>
 <20260824125204.GP244917@nvidia.com>
 <fp5myre5qaersxxshitgoupbzkx2zwo3rsz3q5jfdiarmtwknh@gmfhz3cxuc33>
 <20260824170417.GR244917@nvidia.com>
 <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
 <20260825140334.GA3325090@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825140334.GA3325090@nvidia.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzOCBTYWx0ZWRfX3OdTClsPEjwS
 JWGxXUBubpCVRGAWNneA7T+cBP6oMADwa4IgwtOC/jwjQKx3F3H7lIpFSZm60r5LWlQPAPEwxfk
 rwdhjQHN7DhIOTwECamWpkfBW0kLbMo=
X-Proofpoint-ORIG-GUID: SVPPMuyLaD-5v6TrP0Jt5kBA6L_Mko6B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzOCBTYWx0ZWRfX7yy08HCUZV2j
 Yvm30jirkIyH2WkynoHSg25zzU+kWELezKIgqqu9hcGI/UH2D3ytxcyO3XdHubutG5Iz6jATGM+
 PK55SLth4awPvIMOcrzu54sfZB9bVjcQ4f5PVIK3LCNRpqANWMW2YCXXYa/Z1HfTMX1W4li193R
 1lAVYb3F1GW71F5vh7smytdR/geo0m1pQ8ot9sjvVlV6HLPXjs+aBPwHUwkXGR365GPtW1v2uEa
 UDQaezzFvGhMg8nXvmXFBQnxz7JT6IqyLTtnukUSMvjudUW+2fD88LXrFKj1kv+D000PQr0T5Ns
 lZSyzAvCpmt9wTYt6PCRImn5xxalAwuVyusiW4Rb83ENeFrwqXmbp0vDleREp78gs/y2duDsrPb
 Wl9IfBOg3kK2fb1n/Lnj9KkjtTUmjhq6DE7zoho3hTAlvFhjzFWagGCyMzXE4r3Mr/CdnProjbL
 z9rpoQXr9nJG8uKWKGQ==
X-Proofpoint-GUID: SVPPMuyLaD-5v6TrP0Jt5kBA6L_Mko6B
X-Authority-Analysis: v=2.4 cv=W74IkxWk c=1 sm=1 tr=0 ts=6a8dbf88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=LqIzrL5QFeEt-TcFteMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_091504_966549_C0F64F20 
X-CRM114-Status: GOOD (  25.02  )
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

On Tue, Aug 25, 2026 at 11:03:34AM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 25, 2026 at 03:24:01PM +0200, Andrew Jones wrote:
> 
> > The irqdomains remain per-device. The MSI table belongs to the
> > corresponding S2 IOMMU domain and its configuration is bound to one VM's
> > IMSIC topology. The current prototype rejects irqbypass from another VM
> > once the table has an owner. The irqdomain does not sit on top of the
> > vIOMMUs. A vIOMMU links guest-controlled S1 domains to their S2 parent,
> > while the per-device irqdomain is the IRQ-side entry point for updating
> > that parent's MSI table.
> 
> Doesn't sound like the right design to me. Pretending it is not bound
> to the S2 just to make it global then blocking multi-VM is not a good
> place to start from.

The MSI table fields are part of the IOMMU device context, and the
device's irqdomain is how IRQ operations reach the IOMMU driver. The
table storage is owned by the S2 domain so all devices attached to that
domain use the same mappings. Sharing an S2 domain between VMs would
also share their DMA address space, so rejecting a different owner for
the MSI table is only a sanity check, not an expected limitation.

> 
> It needs a design where the guest remap is linked to the viommu so it
> can be per-vm, somehow.
> 
> > For the host remapping implemented by this series, each irqdomain is
> > per-device because it is inserted into the device's IRQ hierarchy and
> > provides MSI remapping through irq_compose_msi_msg().
> 
> And this is an entirely different thing, you don't need a domain just
> to call irq_compose_msi_msg()..

The IOMMU irqdomain does not merely call irq_compose_msi_msg(). It
implements that callback to perform host MSI remapping. Without this
layer, that remapping logic would have to be put in the IMSIC driver,
where it does not belong.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
