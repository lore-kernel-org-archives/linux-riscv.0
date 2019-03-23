Return-Path: <SRS0=pIoZ=R2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7901DC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 15:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4362421902
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 15:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B3liupKE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4362421902
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cW5NMJtINziNfnQEMY9qypQzyaws7HAM6KjgJia2emA=; b=B3liupKEmTwt2p
	ecQIhSh8wMMb2wXYFtleTzOfVPy5d3oRh0SmMI2Kdoygpqa+KdKzwxqnTL0AqjfdlZbSLw7QBkBxS
	B1MetU9H446DbP32D41FzRB+UzOsbJEG+P7i1BPb+lyf5vQST+My8ETx9CTlKzaML98obKk+zD9cu
	ppPWJR2esxzLX4xqqK8Ag9Od7AhHIqDzVelSITNx315GxVRjGp7IPJqLjA0/aBHaU7lpeAmjdCkq3
	tyLHf05tZvf/FRUdhg7eW7/vjTB2nY5Pp9Rl33MkiWYN4mV0l44GifsndWMj1ZHmgfdeoiw/S7PrH
	lEWoMqGnIJG0Bv4KH8rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7ipQ-0000MY-9p; Sat, 23 Mar 2019 15:45:00 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7ipN-0000MC-PK
 for linux-riscv@lists.infradead.org; Sat, 23 Mar 2019 15:44:59 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2NFhmnx015267
 for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2019 11:44:57 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rdgy9m3tk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2019 11:44:56 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Sat, 23 Mar 2019 15:44:49 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 23 Mar 2019 15:44:46 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2NFio5N56557766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 23 Mar 2019 15:44:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8178152050;
 Sat, 23 Mar 2019 15:44:50 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.207.22])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id A99975204F;
 Sat, 23 Mar 2019 15:44:49 +0000 (GMT)
Date: Sat, 23 Mar 2019 17:44:47 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v2 5/5] RISC-V: Fix memory reservation in setup_bootmem()
References: <20190321094710.16552-1-anup.patel@wdc.com>
 <20190321094710.16552-6-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190321094710.16552-6-anup.patel@wdc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19032315-0012-0000-0000-000003064858
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032315-0013-0000-0000-0000213D6798
Message-Id: <20190323154447.GB25149@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-23_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903230121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_084457_934306_1F90E664 
X-CRM114-Status: GOOD (  27.09  )
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

On Thu, Mar 21, 2019 at 09:47:58AM +0000, Anup Patel wrote:
> Currently, the setup_bootmem() reserves memory from RAM start to the
> kernel end. This prevents us from exploring ways to use the RAM below
> (or before) the kernel start hence this patch updates setup_bootmem()
> to only reserve memory from the kernel start to the kernel end.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/mm/init.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 2e2f2567964c..99b42380d17d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -18,6 +18,8 @@
>  #include <asm/pgtable.h>
>  #include <asm/io.h>
>  
> +extern char _start[];
> +
>  static void __init zone_sizes_init(void)
>  {
>  	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
> @@ -93,15 +95,17 @@ void __init setup_bootmem(void)
>  
>  	/* Find the memory region containing the kernel */
>  	for_each_memblock(memory, reg) {
> -		phys_addr_t vmlinux_end = __pa(_end);
> +		phys_addr_t vmlinux_end = __pa(&_end);
> +		phys_addr_t vmlinux_start = __pa(&_start);
>  		phys_addr_t end = reg->base + reg->size;
>  
>  		if (reg->base <= vmlinux_end && vmlinux_end <= end) {
>  			/*
> -			 * Reserve from the start of the region to the end of
> +			 * Reserve from the start of the kernel to the end of
>  			 * the kernel
>  			 */
> -			memblock_reserve(reg->base, vmlinux_end - reg->base);
> +			memblock_reserve(vmlinux_start,
> +					 vmlinux_end - vmlinux_start);

Sorry for misleading you here, but this can be done outside the loop as
well as the calculation of vmlinux_{start,end}.

>  			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
>  		}
>  	}
> @@ -177,7 +181,6 @@ struct mapping_ops {
>  
>  static inline void *__load_addr(void *ptr, uintptr_t load_pa)
>  {
> -	extern char _start;
>  	uintptr_t va = (uintptr_t)ptr;
>  	uintptr_t sz = (uintptr_t)(&_end) - (uintptr_t)(&_start);
>  
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
