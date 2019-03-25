Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665A5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 07:20:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F6C20830
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 07:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BAg6CBjh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F6C20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3lw68FFH78FiOYvXv6jDN7480VA/7f8P8yZggvHNnk=; b=BAg6CBjhZZ+aa6
	mduxY6W3TA7CIMFEFBxLi/JnkbDWKEw23T8cuTOZACq2XuR4OAOAokNGurhSxKBlexvS0d05yd7+M
	wlYgKBHMOwk+b5EL9FDLryVUzaVhzcjr+/hOpl9vwK6DQq/VqcaEKbBZgCpGSaRv6Q88wr/FnGkOl
	/auQiLCMFkADc6VQLOnPEhVe81L4909L3RcKDs0aletFqcwv+Kt7Rd01k4CnEhYOQ5tk8etggYLXi
	M5eeEWfq91ZrbO2/n4/oTTpNmErAmdGFRMeM3jkih27jWTRA/3hOtE1xeZRNF0L4ETwvoyEqXl3t3
	0IznK09VuuT/qTz1e96A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8JuW-0005sy-Do; Mon, 25 Mar 2019 07:20:44 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8JuQ-0005sC-03
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 07:20:43 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2P7Dwxx061435
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 03:20:33 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2res7humye-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 03:20:32 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Mon, 25 Mar 2019 07:20:30 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 25 Mar 2019 07:20:26 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2P7KPQc55116010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Mar 2019 07:20:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B35974C05C;
 Mon, 25 Mar 2019 07:20:25 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD6164C044;
 Mon, 25 Mar 2019 07:20:24 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.207.233])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 25 Mar 2019 07:20:24 +0000 (GMT)
Date: Mon, 25 Mar 2019 09:20:23 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] provide a generic free_initmem implementation
References: <1550515285-17446-1-git-send-email-rppt@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1550515285-17446-1-git-send-email-rppt@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19032507-0028-0000-0000-00000357E015
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032507-0029-0000-0000-000024169150
Message-Id: <20190325072022.GD2925@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-25_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=978 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903250055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_002041_368226_FE594FC0 
X-CRM114-Status: GOOD (  21.85  )
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
Cc: linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Richard Kuo <rkuo@codeaurora.org>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Any comments on this?

On Mon, Feb 18, 2019 at 08:41:21PM +0200, Mike Rapoport wrote:
> Hi,
> 
> Many architectures implement free_initmem() in exactly the same or very
> similar way: they wrap the call to free_initmem_default() with sometimes
> different 'poison' parameter.
> 
> These patches switch those architectures to use a generic implementation
> that does free_initmem_default(POISON_FREE_INITMEM).
> 
> This was inspired by Christoph's patches for free_initrd_mem [1] and I
> shamelessly copied changelog entries from his patches :)
> 
> v2: rebased on top of v5.0-rc7 + Christoph's patches for free_initrd_mem
> 
> [1] https://lore.kernel.org/lkml/20190213174621.29297-1-hch@lst.de/
> 
> Mike Rapoport (4):
>   init: provide a generic free_initmem implementation
>   hexagon: switch over to generic free_initmem()
>   init: free_initmem: poison freed init memory
>   riscv: switch over to generic free_initmem()
> 
>  arch/alpha/mm/init.c      |  6 ------
>  arch/arc/mm/init.c        |  8 --------
>  arch/c6x/mm/init.c        |  5 -----
>  arch/h8300/mm/init.c      |  6 ------
>  arch/hexagon/mm/init.c    | 10 ----------
>  arch/microblaze/mm/init.c |  5 -----
>  arch/nds32/mm/init.c      |  5 -----
>  arch/nios2/mm/init.c      |  5 -----
>  arch/openrisc/mm/init.c   |  5 -----
>  arch/riscv/mm/init.c      |  5 -----
>  arch/sh/mm/init.c         |  5 -----
>  arch/sparc/mm/init_32.c   |  5 -----
>  arch/unicore32/mm/init.c  |  5 -----
>  arch/xtensa/mm/init.c     |  5 -----
>  init/main.c               |  5 +++++
>  15 files changed, 5 insertions(+), 80 deletions(-)
> 
> -- 
> 2.7.4
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
