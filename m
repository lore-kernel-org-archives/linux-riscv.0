Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39972C4360C
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:00:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C98E861108
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C98E861108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e2gcM+qa41WAMAbVAq9wfYixFXRLP/cbkf+euAk/3+0=; b=MJZXqZgnPLBQ9/1atz6zVAY5G
	nCPUslA0DFhf7EOIAhuWxjI9rcPRnJhdQjbBg5qMmbEZwsHDGQm/nh/f+/hMHzXOjeAG9PKhvEt83
	X8sEw9wBKkPxwe+ueVkT6GYjXxGOXsZ/hbkZGVqtLotfthRub09bX/IdlRWAbXIa0sE4ImSDtog5J
	910PdY/BiOHFswIHdG2IumOC/YkwqCbvbV9om7jbJiTitL16y2ndI3uZ+S6kY0np9fpp9X3j0BmN0
	B1joLr5o3xQ8/Wu6YLsKGPAAcJzsZV5a0DhdnDVDMQG7sUQYX9+tr7SB69r4LvsNchkrr8oqGWKii
	PsD3VFtMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUrg2-000s9V-2N; Fri, 09 Apr 2021 14:00:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUrfz-000s97-KV
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 14:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XFFEfKJkqI0cblOf5FwUUYuSIdgH8aHKQzvMyAmhhbs=; b=AMFZKWZCSFggdCTrj8y5ssjMs2
 GjjoNHXfPOkQA54QPn0wqo065zRYYDgG6vwOPVnLe2izPIX2TpLaZDyazDEKFfXLAAT337HRni+WQ
 BA3csAzV6W/s0yhImYP+PzIoYfLmfT5CbwtwS76oOQ2Nffw3qvtuYhRY/tTKdNvuNI7U0QOqbpODA
 kQKRB1VtJY17RKbb3bvdYmjFkrowiJ2+EaDMwE5vEoQhee7wIjW32x9RZPT8RH+ORWV1uT0QQ0LOU
 weLTINvk2W9HbTOEsGsx0+/3qufUkXtkJzljQKOYZY67X/XEg+HBrtKm3YOEWGlYdNMnNH4PzekuB
 tPsraBlg==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUrfw-004ZG2-MB
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 13:59:58 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139DXFvl006445; Fri, 9 Apr 2021 09:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=XFFEfKJkqI0cblOf5FwUUYuSIdgH8aHKQzvMyAmhhbs=;
 b=YOm89OMV9N+/shncIstSmpxga+5iljrX8Ix2EYSSMjdh/N79U6FE/uO9Unvp9ljpK2Lj
 6p+dRmZKuML5QY1mCNajg6Fd02zXQKHGrW56l3DFTSQtBAhq8Cot1EPdhSit9D4YajJ7
 k8q/MxgpYkEd1nje2Ga0BC+aQuz+8blD9zo+TpiNIlu6+FmrwSCLPoD4CbWzO8PFQ6HF
 tUrTx/JCvWlyweo984LTgIrQJTAbXlIUcgM31ZGOvP1zBZMMLnnDh7ZJZcoWFbVqbnRz
 GWCGFdjRH5e09hZL9ydno+clvDNW9QHfqmsh5kOU5pwzKBkcUPNq8ZlTvpsD63BssfWM WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37tqpj17yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 09:59:48 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 139DXH0V006635;
 Fri, 9 Apr 2021 09:59:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37tqpj17y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 09:59:47 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 139DrgsL011946;
 Fri, 9 Apr 2021 13:59:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37t3h8gu2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 13:59:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 139DxMwF32506338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 13:59:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 961E45204E;
 Fri,  9 Apr 2021 13:59:43 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.82.136])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 76E0852051;
 Fri,  9 Apr 2021 13:59:42 +0000 (GMT)
Date: Fri, 9 Apr 2021 16:59:40 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Alex Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: Re: [PATCH v7] RISC-V: enable XIP
Message-ID: <YHBdzPsHantT9r8t@linux.ibm.com>
References: <20210409065115.11054-1-alex@ghiti.fr>
 <3500f3cb-b660-5bbc-ae8d-0c9770e4a573@ghiti.fr>
 <be575094-badf-bac7-1629-36808ca530cc@redhat.com>
 <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
 <YHBEsDuEvPAnL8Vb@linux.ibm.com>
 <e7e87306-bb04-2d4f-7e7f-aabd40dccb3b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7e87306-bb04-2d4f-7e7f-aabd40dccb3b@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p0Y_zNbmBtgimotIB8cP0gNNYdSw6IOG
X-Proofpoint-ORIG-GUID: tyMgkQAFlemVP5BNFX_swMNENNfT-rn8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_065956_998974_B5395CD6 
X-CRM114-Status: GOOD (  34.30  )
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

On Fri, Apr 09, 2021 at 02:46:17PM +0200, David Hildenbrand wrote:
> > > > Also, will that memory properly be exposed in the resource tree as
> > > > System RAM (e.g., /proc/iomem) ? Otherwise some things (/proc/kcore)
> > > > won't work as expected - the kernel won't be included in a dump.
> > Do we really need a XIP kernel to included in kdump?
> > And does not it sound weird to expose flash as System RAM in /proc/iomem? ;-)
> 
> See my other mail, maybe we actually want something different.
> 
> > 
> > > I have just checked and it does not appear in /proc/iomem.
> > > 
> > > Ok your conclusion would be to have struct page, I'm going to implement this
> > > version then using memblock as you described.
> > 
> > I'm not sure this is required. With XIP kernel text never gets into RAM, so
> > it does not seem to require struct page.
> > 
> > XIP by definition has some limitations relatively to "normal" operation,
> > so lack of kdump could be one of them.
> 
> I agree.
> 
> > 
> > I might be wrong, but IMHO, artificially creating a memory map for part of
> > flash would cause more problems in the long run.
> 
> Can you elaborate?

Nothing particular, just a gut feeling. Usually, when you force something
it comes out the wrong way later.
 
> > 
> > BTW, how does XIP account the kernel text on other architectures that
> > implement it?
> 
> Interesting point, I thought XIP would be something new on RISC-V (well, at
> least to me :) ). If that concept exists already, we better mimic what
> existing implementations do.

I had quick glance at ARM, it seems that kernel text does not have memory
map and does not show up in System RAM.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
