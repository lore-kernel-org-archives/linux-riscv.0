Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2B2C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:55:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C2C22224
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBFPe3z6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C2C22224
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ca6vtQbInjwzTgo9HprUYYRQB3m1sb9Q8Fq8x105r7Y=; b=JBFPe3z6Xz0MXQAuDOqX91J+H
	ARCIURBQTKZT0oqF1791DGeYxLAs3K6gyZOtcJSWrQ2iQa84YBrlWV0nUI00HhxPV4qmjHcJUxi6O
	S8xDTe9vz0vu2B3pK/hOHGy/5rVihbVDTiclkwPBbmSjOkNlMkLByDMkYVn/W6brlUISdU1UR3Opo
	tXqW0N5wsj5ieA0fItErc3ALBgRGsYLFVcKVlEoGPlDkdw/mRkgfjUU8o7proVJbTSoRj1qNyvTFf
	CZzD8Bh7dCwcbWMAkIJlnWCKg+6oUBfrLFeNHmK3FTLiVZmfqsbSEhCHVbJlliXvYaHFDgI+7EEJ6
	XKRGKOUTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvJX5-0004Py-If; Tue, 14 Jul 2020 11:55:35 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvJX4-0004HQ-0Z
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 11:55:35 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06EB2nZE053842; Tue, 14 Jul 2020 07:54:05 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3298wueepw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 07:54:04 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06EBs4S3070499;
 Tue, 14 Jul 2020 07:54:04 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3298wueenm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 07:54:04 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06EBnqI5031118;
 Tue, 14 Jul 2020 11:54:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 32752839te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 11:54:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06EBqbSA43712804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 11:52:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45F7811C04C;
 Tue, 14 Jul 2020 11:54:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C9FF11C050;
 Tue, 14 Jul 2020 11:53:59 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.206.228])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Jul 2020 11:53:59 +0000 (GMT)
Date: Tue, 14 Jul 2020 14:53:57 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Pekka Enberg <penberg@gmail.com>
Subject: Re: [PATCH 1/2] mm: pgtable: Make generic pgprot_* macros available
 for no-MMU
Message-ID: <20200714115357.GB1166045@linux.ibm.com>
References: <20200714100051.345018-1-penberg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714100051.345018-1-penberg@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-14_02:2020-07-14,
 2020-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=1 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007140085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_075534_117037_4771D509 
X-CRM114-Status: GOOD (  24.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 01:00:50PM +0300, Pekka Enberg wrote:
> From: Pekka Enberg <penberg@kernel.org>
> 
> The <linux/pgtable.h> header defines some generic pgprot_*
> implementations, but they are only available when CONFIG_MMU is enabled.
> The RISC-V architecture, for example, therefore defines some of these
> pgprot_* macros for !NOMMU.
> 
> Let's make the pgprot_* generic available even for !NOMMU so we can
> remove the RISC-V specific definitions.
> 
> Compile-tested with x86 defconfig, and riscv defconfig and !MMU defconfig.
> 
> Suggested-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Pekka Enberg <penberg@kernel.org>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/pgtable.h | 69 +++++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 34 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 56c1e8eb7bb0..ed9026ad7c31 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -647,40 +647,6 @@ static inline int arch_unmap_one(struct mm_struct *mm,
>  #define flush_tlb_fix_spurious_fault(vma, address) flush_tlb_page(vma, address)
>  #endif
>  
> -#ifndef pgprot_nx
> -#define pgprot_nx(prot)	(prot)
> -#endif
> -
> -#ifndef pgprot_noncached
> -#define pgprot_noncached(prot)	(prot)
> -#endif
> -
> -#ifndef pgprot_writecombine
> -#define pgprot_writecombine pgprot_noncached
> -#endif
> -
> -#ifndef pgprot_writethrough
> -#define pgprot_writethrough pgprot_noncached
> -#endif
> -
> -#ifndef pgprot_device
> -#define pgprot_device pgprot_noncached
> -#endif
> -
> -#ifndef pgprot_modify
> -#define pgprot_modify pgprot_modify
> -static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
> -{
> -	if (pgprot_val(oldprot) == pgprot_val(pgprot_noncached(oldprot)))
> -		newprot = pgprot_noncached(newprot);
> -	if (pgprot_val(oldprot) == pgprot_val(pgprot_writecombine(oldprot)))
> -		newprot = pgprot_writecombine(newprot);
> -	if (pgprot_val(oldprot) == pgprot_val(pgprot_device(oldprot)))
> -		newprot = pgprot_device(newprot);
> -	return newprot;
> -}
> -#endif
> -
>  /*
>   * When walking page tables, get the address of the next boundary,
>   * or the end address of the range if that comes earlier.  Although no
> @@ -840,6 +806,41 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>   * No-op macros that just return the current protection value. Defined here
>   * because these macros can be used used even if CONFIG_MMU is not defined.
>   */
> +
> +#ifndef pgprot_nx
> +#define pgprot_nx(prot)	(prot)
> +#endif
> +
> +#ifndef pgprot_noncached
> +#define pgprot_noncached(prot)	(prot)
> +#endif
> +
> +#ifndef pgprot_writecombine
> +#define pgprot_writecombine pgprot_noncached
> +#endif
> +
> +#ifndef pgprot_writethrough
> +#define pgprot_writethrough pgprot_noncached
> +#endif
> +
> +#ifndef pgprot_device
> +#define pgprot_device pgprot_noncached
> +#endif
> +
> +#ifndef pgprot_modify
> +#define pgprot_modify pgprot_modify
> +static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
> +{
> +	if (pgprot_val(oldprot) == pgprot_val(pgprot_noncached(oldprot)))
> +		newprot = pgprot_noncached(newprot);
> +	if (pgprot_val(oldprot) == pgprot_val(pgprot_writecombine(oldprot)))
> +		newprot = pgprot_writecombine(newprot);
> +	if (pgprot_val(oldprot) == pgprot_val(pgprot_device(oldprot)))
> +		newprot = pgprot_device(newprot);
> +	return newprot;
> +}
> +#endif
> +
>  #ifndef pgprot_encrypted
>  #define pgprot_encrypted(prot)	(prot)
>  #endif
> -- 
> 2.26.2
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
