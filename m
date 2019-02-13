Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CF6C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 10:00:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E18222BA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 10:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iBy8MmsS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E18222BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bh+xvMFMBKJ6t972AecBLU6DoLqy1brsn9NtTcpgAJA=; b=iBy8MmsSKWHz47
	qE/NCsWMtXg453BcYND/eR7PNCkJL2/uz9Uz1VkaFnf7kyQCDZw7BccWdvnwI5ALGGxdDWOADaSXW
	fEFfhbHpKfypVtUnAqVCD9bpxdaUApafUCdA/1kGjxdTFrFWWgxXyu/f2OEop/HGJnr22uVNiLeyN
	ODMOE4IE+P9eE4v5o206aeqKp9UYsXxXlMmuOZo2inAkZaXrlQwiYGL0iaMlThmLJ7+tqB3ojifp7
	GgR1izysV86kMssCmpaSV/lMSZycczpbGGVWbxt+H9RTq94EWO5YE9b46JkKkIbF+XZAprOIHSNZy
	seLWTC6YcpYkEskz5Q/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtrKq-0004ND-8C; Wed, 13 Feb 2019 10:00:08 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtrKl-0003Tf-Mq
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 10:00:06 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1D9uJYQ082924
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 05:00:02 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qmfm5v3cc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 05:00:02 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Wed, 13 Feb 2019 09:59:58 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Feb 2019 09:59:55 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1D9xs2E4522336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 Feb 2019 09:59:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BB76A4055;
 Wed, 13 Feb 2019 09:59:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA14BA4040;
 Wed, 13 Feb 2019 09:59:53 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.59.186])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 13 Feb 2019 09:59:53 +0000 (GMT)
Date: Wed, 13 Feb 2019 11:59:52 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v5 1/6] RISC-V: Move free_initrd_mem() to kernel/setup.c
References: <20190213080647.68204-1-anup.patel@wdc.com>
 <20190213080647.68204-2-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213080647.68204-2-anup.patel@wdc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19021309-0012-0000-0000-000002F52C8C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021309-0013-0000-0000-0000212CA4A1
Message-Id: <20190213095951.GB21478@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-13_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902130073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_020003_858961_E5E608C6 
X-CRM114-Status: GOOD (  22.77  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 13, 2019 at 08:07:17AM +0000, Anup Patel wrote:
> We move free_initrd_mem() to kernel/setup.c so that all initrd related
> functions are in one place.

A few patches after you move setup_bootmem() that calls setup_initrd() to
mm/init.c. I'd say it makes more sense to move setup_intird() to
mm/init.c.
 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  arch/riscv/kernel/setup.c | 4 ++++
>  arch/riscv/mm/init.c      | 7 -------
>  2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 77564310235f..36f60b4d2147 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -96,6 +96,10 @@ static void __init setup_initrd(void)
>  	initrd_start = 0;
>  	initrd_end = 0;
>  }
> +
> +void free_initrd_mem(unsigned long start, unsigned long end)
> +{
> +}
>  #endif /* CONFIG_BLK_DEV_INITRD */
>  
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 658ebf645f42..504a5e491f5a 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -14,7 +14,6 @@
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/memblock.h>
> -#include <linux/initrd.h>
>  #include <linux/swap.h>
>  #include <linux/sizes.h>
>  
> @@ -64,9 +63,3 @@ void free_initmem(void)
>  {
>  	free_initmem_default(0);
>  }
> -
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void free_initrd_mem(unsigned long start, unsigned long end)
> -{
> -}
> -#endif /* CONFIG_BLK_DEV_INITRD */
> -- 
> 2.17.1
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
