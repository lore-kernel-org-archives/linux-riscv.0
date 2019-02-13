Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B0FC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 07:38:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC2C222BE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 07:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aFpAiC4i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC2C222BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n17EwMa6RzhzmcinmrKT+3N3yrFEX+MpNQpmi5pbKQs=; b=aFpAiC4iLCGXxM
	6i/J1hIjRC5v7zh74zCcWGQpdyPOQZ3ZawJt5Lay3FjroNe6bOuGww5QYV+pDioFn2rmWnHtWrPiw
	IU//EWL57L95rDrlmsijCYag6VxOtChu/1grAI1PMrhC1dDRNLOG2gYIcabZga2g38vUFDqZZCrr8
	zIyeQ+233kUH+DsNHNiOGqrnl2DOcVqDy4qask0pujYMOM9qLwrAdppcqf/tok+7GNrNZOQkMYCR6
	PMkLsAlpifJEItGxIkeYVhxBSSHfjhGxFq7Nn8pbi09g0ROzo3SWvfR3nKk/9SLb/tsEBD5gHPyDu
	J3bLR6s3QsC7oovus3+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtp85-0007Zf-Ul; Wed, 13 Feb 2019 07:38:49 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtp83-0007ZF-8j
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 07:38:48 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1D7VaPs074590
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 02:38:44 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qmck1w4rc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 02:38:44 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Wed, 13 Feb 2019 07:38:42 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Feb 2019 07:38:39 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1D7ccIZ63832314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 Feb 2019 07:38:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C35E352054;
 Wed, 13 Feb 2019 07:38:38 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.59.186])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 1C5E452052;
 Wed, 13 Feb 2019 07:38:38 +0000 (GMT)
Date: Wed, 13 Feb 2019 09:38:36 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 6/6] RISC-V: Free-up initrd in free_initrd_mem()
References: <20190213063127.28703-1-anup.patel@wdc.com>
 <20190213063127.28703-7-anup.patel@wdc.com>
 <20190213064419.GA27012@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213064419.GA27012@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19021307-0016-0000-0000-00000255D897
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021307-0017-0000-0000-000032AFFDEB
Message-Id: <20190213073835.GA18267@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=812 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902130056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_233847_429385_CD6C1AF7 
X-CRM114-Status: GOOD (  27.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Feb 12, 2019 at 10:44:19PM -0800, Christoph Hellwig wrote:
> On Wed, Feb 13, 2019 at 06:32:24AM +0000, Anup Patel wrote:
> > index 9cd583b6d1cd..c22b873de856 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -97,8 +97,9 @@ static void __init setup_initrd(void)
> >  	initrd_end = 0;
> >  }
> >  
> > -void free_initrd_mem(unsigned long start, unsigned long end)
> > +void __init free_initrd_mem(unsigned long start, unsigned long end)
> >  {
> > +	memblock_free(__pa(start), end - start);
> 
> I'm pretty sure this should be a call to free_reserved_area instead.
> 
> All regions reserved using memblock_reserved and not freed before
> initializing the MM are marked reserved and don't have valid page
> counts, etc.
> 
> So we need the actions in free_reserved_area to actually make the
> memory useful.  Now every other architecture except for arm64
> seems to do fine without a memblock_free.  I'm not an expert on
> memblock (but I've CCed one), but I guess the reason is that once
> the kernel has booted we don't really care about freeing memblock
> area.

This late in the boot process there should be a call to
free_reserved_area() to give pages to the buddy allocator.

memblock_free() is has no real effect at this point, no idea why arm64
calls it.

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
