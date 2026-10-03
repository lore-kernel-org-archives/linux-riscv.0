Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6334CA5FDD
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 12:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+KxUm4OwxCIdqKBI8t4nIZzOsdpS7jLszpMC1z+0uA=; b=3Wqh7Yo1goRSWS
	Y+P+231yC0a9YyRxMP50havTLlc16IzXMqcKOxCDxVZGyQda1DYJ6XHuH/rPXZGDXgomPGkyfeNty
	DrVCwYNTnsX/OAups1tEIqW00zKNDYZkt6Q1H/qhX3naX/ltoIZgo8B+JUFNV4GIhk2aQCjbjQLvv
	qKtYpUUwa/XceF7iLblQXdAZw5Jj74Sp7sduTLxhP0JrHUth7232Nw30hqZRa7XTDC+a6y/57akxS
	nxCuoKD/HJR+ynAa0MvqvqSZBzpoB6xxWAYAclF0NTfipVjb5E7V2Ci+rXT0Qch0r0zjOGgGl63HQ
	zopKeLKK7RWRfrlrzCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCySt-0000000DSFt-3LU7;
	Sat, 03 Oct 2026 12:03:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCySq-0000000DSFV-3MaV
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 12:03:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Attko365542
	for <linux-riscv@lists.infradead.org>; Sat, 3 Oct 2026 12:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ld0OrougPNfBp6Ry3148Z2Li
	9neJoj1Ak158VsVyVmo=; b=iaPbbMLi2rtDwRfy/OT6hy7GqUujdf404T8d/T9O
	sKhA14+aPKlNSOfIAqwoI9Gqe/qCTLjw6wpZxa4xs6HFlfDxQzBEX42km7tthw4Q
	GIU/WQkR1xGKW1jPoz/QxCZEoDAca/pBbLT2F/9RA4ZZT8gI1+6SWavNpYhubaOF
	KEvO4F+TPCjusBwwIroVCK1YeFKbVF5gKW0IfqNIUOQKCA+LnZXRAUNZswGfOxAo
	MG2bnrEScHPcrhNycWBdjGhCjF48ZJoNeU1wXl8VODbMLgQS/HNwfKFAe6BWhmQQ
	tS3EDMQk3WIr1adwX45D1p9BWFvjjHfz5KD21rtUI3WrNg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa0sq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2026 12:03:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso168838e0c.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2026 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791029018; x=1791633818; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ld0OrougPNfBp6Ry3148Z2Li9neJoj1Ak158VsVyVmo=;
        b=Ca2Mky9MiksGJzUX6tVMNbK1PQ9gWAkakYaK8KFriWejPyyKA0K/VXVOfjromf6v8t
         IUqQ6bgl+FppfdgRzQjFljenapfp2xUbv4yrqI0ykIkS5H3viTtO+DMR8kfURiRn5krQ
         m8Yb3IyfuipXE1/kzvj5TWBxtZHML7iZhiiXyqyi1wyjn6y49CIk1zHMjcwyvzCwCwvm
         j2xSTJi+zEh5+hnM6ICEiGmP6HxJQjYneFfXGsjgxn/gAOex1D8rKp0ofUZalNmsv+qa
         zGZX7kAJ4RH8d5E8JX0tGWpg3a5XFLlf85eq85JQjrtOxYMzVpzFXc/5U7A0hhowjJL1
         aS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791029018; x=1791633818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ld0OrougPNfBp6Ry3148Z2Li9neJoj1Ak158VsVyVmo=;
        b=fG5LewhVt3Z4dlZ5tNijH0KSnHj8p4E4ovUDU5zlrtKvyfQUy/S6zJD3NH0tqLk/dM
         x62f/e18l6cBk3mAIVIPEpmnpk+gGUYQQD0ILZ95mdbppC46a7ucTYokp3qN3TueUE9o
         qpqDq2uNZnxZgZZCmxbKXc3wncF4QplP+a7xaVrxjjrR1Di6hR39u0wssziYV4/rW9bo
         AS8Ypd9q/ezblXTGYHosGQRTsFuYEuIIKIiEvQWPrR8AgJdGL672+IdWNLagZ6KN3b5B
         nSfYokVYAX+jINnXPnaOr/9ix0BGPXpn8kZ2DHrRK2GfStGn+KV+FeyVw+MOHuJZ44l7
         yjcQ==
X-Gm-Message-State: AFq9FYLw2qMeQ6wDSoG8V9kOP/auR7anCi0zuKqPTillatgYk2Bs5NCQ
	n65Bj/Flsn59jTr1LwE+EEhKU7JXiSwF0v5qIY+1i48M1+vl+F0sZhS/fsiyH+h28BzvIrIbYoU
	uk6VTvu9VP6v45AooBSTyjh3vdsy145hBs+HBCgGwRQu6F+A85Fu3OUaQ0sMBS9vAlt0ozVQ=
X-Gm-Gg: AYBFou2BYt7PYzESn1+mkiRLf+bIEPNHP/TcIRmjePsn15WuImSESLidJRuiWELt0PE
	fRZaP2SMi7JDI4s72yfr9wRlloI9w8CRnmxIx4DSHAs7s5uY5igzha+Yuh0gs9uC27YE9TslOk1
	AiFCsPkcaE499RX7qFU48CdPYDK1+eXAHIhH5dCeJGqvsaAVRfJkVC8+HLNTYo7Qbgc+dwsKh2p
	tDYRYS9n3FKqdBiMRP0A3CU754Wk14KPOh24gpVSAm0BCbOFbrh8qYBqZ2nxvMS36164pjhQFgi
	91nhQ4bek1CnpeHhyla+HUdIlC1TpMJ4ZvRj3czb840sW0uWdexZcQE6enyK/2K37wfG8+RP2ga
	aqUtdGtPqi2Kfns6FiMcmxWbg+MLG
X-Received: by 2002:a05:6102:6415:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7c175c521afmr567406137.25.1791029017733;
        Sat, 03 Oct 2026 05:03:37 -0700 (PDT)
X-Received: by 2002:a05:6102:6415:b0:7c1:75c5:c4c with SMTP id ada2fe7eead31-7c175c521afmr567402137.25.1791029017224;
        Sat, 03 Oct 2026 05:03:37 -0700 (PDT)
Received: from localhost (109-81-9-204.rct.o2.cz. [109.81.9.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394c937csm97187345e9.1.2026.10.03.05.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 05:03:36 -0700 (PDT)
Date: Sat, 3 Oct 2026 14:03:35 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 01/16] iommu/dma: Prepare MSI physical address lists
Message-ID: <pph73bajtpgp3u5vb7xjqmbrz35zs2lw7fpkhobg5jdzbjw2vq@usg3jbbneskp>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-2-andrew.jones@oss.qualcomm.com>
 <18c9b030-8dc6-4242-8e66-0448ee125d7d@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18c9b030-8dc6-4242-8e66-0448ee125d7d@arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA0NyBTYWx0ZWRfX1uxHOMni6A/v
 Q6FGOOr70wu7wwGVUk1CPMX2RJVq1LCZzhZb8hh+0reCraFGNjyJUXaG1sIh6ka57YACR1VdYQC
 QnZhcWK/DEqQdMDr0mM9O09w3K/jBauqlCHEfLQYn9YcCMkO+OT8KfSmXYV0J+8qU/UkPIuLX+C
 sJkiOEs4dnMbMRog8MkErAAnis/lBkmaiyvuNTOrHhmGvq+09/cSypG2socM4hba5dz+E+/5uTG
 ftUy/4qCX9vwU5BuE7Xv2zbPbjdoLIwM3H5HEVLLzoFIEe6y341PL4jbAaTidfcbe1y5K3aYif8
 8fGbi/fPGVQV3zP4b5GCw4T857H+tDRalx5pex/LCQB4TmCjj4r78upcfimFqm8cl4MND9vzJDg
 i5zd6nOzpXvpwhY0ly8eCHCZvUqRxyS1ryWMttPha7jkTKBF5GzAoG9NPeXxsU+x47dbMJGeyux
 jDo5QlhsCLJpm1mVz4A==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac0ef1a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=0bpig9kOJEczWR0iouTWkw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PG2Lv3-wYJ-N5-kAUs0A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: Ds5RViq-i02jOwdEzmp9_R73FAJDcd07
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA0NyBTYWx0ZWRfX1NtcZcRvioIL
 Im4JUgTUJotW9clHAPaigVCu1tD3ItjBDljxTWOfnl5zs0wNUTNkraW0IPDcSkZTA3iAEOSNZym
 Y7xnOfL+lWtA9DlSrXAb/zHPIsmC4Uc=
X-Proofpoint-GUID: Ds5RViq-i02jOwdEzmp9_R73FAJDcd07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_050340_979122_F6879457 
X-CRM114-Status: GOOD (  21.11  )
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


Hi Robin,

On Fri, Oct 02, 2026 at 05:21:18PM +0100, Robin Murphy wrote:
> You already end up adding what is effectively a RISC-V-specific
> entrypoint, so you may as well just carry that all the way through to
> its own effectively RISC-V-specific implementation

The list API came out of the v4[1] discussion with Jason. Preparing the
targets as one contiguous IOVA range lets the MSI descriptor cache the
base and IMSIC compose the address as base + CPU offset. That got
rid of the separate domain-local lookup table and its lifetime handling,
which I think was a worthwhile improvement.

I'd like to keep that model. I'm open to splitting the implementation,
but most of the added code seems necessary to prepare multiple targets
together, regardless of whether the list is fixed.

> it should merely be a case of whether a) this is the first call for
> the given cookie so everything needs mapping, or b) it's not the
> first call, so everything must already be mapped and we can just
> return the IOVA.

For DMA-IOMMU, yes, remembering the base would let us drop the range
matching. We'd still need the contiguous IOVA allocation, mapping loop,
rollback on failure, and locking across the whole operation.

For iommufd, there are also separate things to track: whether the context
has allocated IOVAs for the set, whether a particular HWPT has those
mappings installed, and whether a group needs them installed when its
domain is replaced. Having one fixed list doesn't by itself remove
that bookkeeping.

The current IMSIC caller does always supply the same list. We could make
that a requirement, but we'd need to define its scope: per cookie for
DMA-IOMMU, and how it applies across groups and HWPTs for iommufd. The
current interface instead takes an ordered list and provides contiguous
IOVAs for it; the range matching makes reuse honor that contract.

> At very worst, a separate hook to just pre-populate msi_page_list
> with a regular page for each IMSIC address [...] could probably
> suffice without any other major structural changes

Is the main concern the range matching, or the shared mapping path
itself? Apart from lookup, both paths need much the same allocation,
mapping, locking, cleanup, and descriptor handling. Keeping those
separate seems likely to duplicate code, while factoring them into
shared helpers seems likely to bring us back towards a list-based
mapping helper.

We could handle lookup of existing mappings separately for the single-page
and list cases while sharing the allocation and mapping code. But I'm not
yet seeing a substantial overall simplification from requiring a fixed
list. Is there more bookkeeping you have in mind that could go away with
that restriction?

[1] https://lore.kernel.org/all/20260820214150.545737-3-andrew.jones@oss.qualcomm.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
