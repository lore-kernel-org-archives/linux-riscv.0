Return-Path: <SRS0=dPMk=55=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBA5C2BA19
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2020 17:06:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C0D206E9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2020 17:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TwLYb6bb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kktfuV3K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C0D206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/QHTJEbvK5wYmg2dWl63irRcFp2irztNeFiTFWafoM=; b=TwLYb6bbyWaLGl
	hSXO1jMEtnK4iuUOwYLu+MlB6zGBH1ruU3rQRtZfhOtaYElyC149rB62HfUXfUz7RnG/Guj4Vl8rs
	fP7Ne8zoKCWsdilAY0EMGW4qGAXAIqxirL5dbc6i8Zks9Yyn6Gpcs6URATvRttyVT2f//ypnF4SPe
	shdMNEU6VDPE9xi78wkESWWOCkwBC1VuaZBU2+eroalaMl5NByPCe3N+FYi2bE5UdDmGrv38xJYb0
	v7vRvl9wy4nkSqi0JJ/+/CRgBDM+RCBPvUY9vQDvcZr9pzVI70OEkYmGZLOWEverLOi5g8QMqISmR
	JjwjhTfAsPjMpU9UTguA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO2X3-0003BT-Fd; Mon, 13 Apr 2020 17:06:01 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO2X0-0003Aj-Fc; Mon, 13 Apr 2020 17:05:59 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03DH56CR151699;
 Mon, 13 Apr 2020 17:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=R/QHTJEbvK5wYmg2dWl63irRcFp2irztNeFiTFWafoM=;
 b=kktfuV3K3lSuFHBc31Ythkb5SLenATE1abhmvREP6KJho8IZK25DiUJDRqDQpY80dSlB
 zPKH4s1foBQcVIjdX6VteTFGLWt1In4vXh6UzrVmtOnamoWJsw+sNkaoGUEteL7Wj6Id
 TSK835Gllrv0py7zpZNvy9pWpkHJe18XhM0YR+R855Lxj/R5mtRO/U8RN0GwMx1Q8Im/
 c9b28/VAT/sCGDL4wnkRBwLKlEoDTQEILj5wqFoG9ey6BDT5YsIgFU0yG4+FjoBk4xb/
 nbySP3Xdz35peCoj4Mbp7NAABCO8dUFBIWIufIqDvvSWCR9DwJBRLWf5sZIItwDNTtMR qw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 30b5ukyrq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Apr 2020 17:05:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03DH1t0h105739;
 Mon, 13 Apr 2020 17:05:05 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 30bqpck4ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Apr 2020 17:05:05 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03DH4vor012212;
 Mon, 13 Apr 2020 17:04:57 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 13 Apr 2020 10:04:56 -0700
Subject: Re: [PATCH v2 1/4] hugetlbfs: add arch_hugetlb_valid_size
To: Peter Xu <peterx@redhat.com>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-2-mike.kravetz@oracle.com>
 <20200410191613.GD3172@xz-x1>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <8d2f8066-98af-4db2-8ffa-f78533a50674@oracle.com>
Date: Mon, 13 Apr 2020 10:04:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410191613.GD3172@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9590
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004130131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9590
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 bulkscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004130131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_100558_616120_8EFA20B7 
X-CRM114-Status: GOOD (  18.23  )
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S.Miller" <davem@davemloft.net>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/10/20 12:16 PM, Peter Xu wrote:
> On Wed, Apr 01, 2020 at 11:38:16AM -0700, Mike Kravetz wrote:
>> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
>> index 2eb6c234d594..81606223494f 100644
>> --- a/arch/arm64/include/asm/hugetlb.h
>> +++ b/arch/arm64/include/asm/hugetlb.h
>> @@ -59,6 +59,8 @@ extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>>  extern void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
>>  				 pte_t *ptep, pte_t pte, unsigned long sz);
>>  #define set_huge_swap_pte_at set_huge_swap_pte_at
>> +bool __init arch_hugetlb_valid_size(unsigned long size);
>> +#define arch_hugetlb_valid_size arch_hugetlb_valid_size
> 
> Sorry for chimming in late.

Thank you for taking a look!

> Since we're working on removing arch-dependent codes after all.. I'm
> thinking whether we can define arch_hugetlb_valid_size() once in the
> common header (e.g. linux/hugetlb.h), then in mm/hugetlb.c:
> 
> bool __init __attribute((weak)) arch_hugetlb_valid_size(unsigned long size)
> {
> 	return size == HPAGE_SIZE;
> }
> 
> We can simply redefine arch_hugetlb_valid_size() in arch specific C
> files where we want to override the default.  Would that be slightly
> cleaner?

I think both the #define X X and weak attribute methods are acceptable.
I went with the #define method only because it was most familiar to me.
Using the weak attribute method does appear to be cleaner.  I'll code it up.

Anyone else have a preference?
-- 
Mike Kravetz

