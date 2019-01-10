Return-Path: <SRS0=4zRh=PS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B82AC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 18:28:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391D620874
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 10 Jan 2019 18:28:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LiV3+6jA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gdlPRa+d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391D620874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TggF+LoDgPJDOOeMCZQBaBdk1NPeZsI2WZRCzAjxyss=; b=LiV3+6jAM7AtPm
	tPGcPoLJLa6WkmSTGxoiARFJUvWej7AR7WKMmyRZ7WGq8fb7PH/4YbhRmtcvL1LrwNDpvr/9Mc853
	xD/6P4wZU2fVnQsGieMefpsfbxQaDZswmL+w+Avp0FNts73lKTncQdUo+A4jTuO5CkUgrFjLoGJMY
	W+uUFL1cJufYxzggPLoZDv7JnSH1voOwTOswAq+QZpstVP0MvW7A7DcNqVugIXiCHPWytjzvE7Q65
	1n92DCrE7GD49HAiqfeeAACgc7NmoBU06nN35ezn5GaIDzMy+jcmXkoyFXfVbtxfVguTWarJvYLp6
	SNcNxsCs/ErS+oWMV88w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghf4b-0006uL-8d; Thu, 10 Jan 2019 18:28:57 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghf4X-0006tS-Nu
 for linux-riscv@lists.infradead.org; Thu, 10 Jan 2019 18:28:55 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id x0AINqQQ106018;
 Thu, 10 Jan 2019 18:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=5ZNY641nCm6DYJt5GEGBHX2a629z51pNuxkvw8yAe8M=;
 b=gdlPRa+d6DGlDvzUlD5Dhy1jlrlxJHyxX/M4U8zE9ig9JekJPTsLYn+u+7xZR9L3P3F3
 xLWW5scVBapGULdPYPLnShmYMYf57+pBZ6QotGv5XBiRo5zWv8ILmiWFJvJukKgP8435
 H5BdLXXZ8xE/N2FeuEz74FHvHZl7lep2RIYNXlB9rsijURTHt7BUvrdZn8Ng6s5lM1WX
 xHdT7yU5masHcsRsCuLyDS/XpnWKJOwCm3Wi20BLUZ3LSOqG0wsi5VWxNSAOXeWO4p3d
 O09NDNKqFX+byicTktwWShve3TYd892NTlDrZitSPAXwW6UcSPPJSPPleP/ZFJ40wyWl cg== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
 by userp2130.oracle.com with ESMTP id 2ptm0ugxw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jan 2019 18:28:38 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id x0AIScjH007056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jan 2019 18:28:38 GMT
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x0AISZmV017389;
 Thu, 10 Jan 2019 18:28:35 GMT
Received: from [192.168.1.164] (/50.38.38.67)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Jan 2019 10:28:35 -0800
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
To: Alex Ghiti <alex@ghiti.fr>, Alexandre Ghiti <aghiti@upmem.com>,
 palmer@sifive.com
References: <20181210062146.24951-1-aghiti@upmem.com>
 <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
 <6c5bccf0-f185-4db4-96fc-5439bf8f6330@ghiti.fr>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <6e20f18c-0313-168e-ff86-f0bf3b90a46f@oracle.com>
Date: Thu, 10 Jan 2019 10:28:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <6c5bccf0-f185-4db4-96fc-5439bf8f6330@ghiti.fr>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9132
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1901100143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_102853_907467_50B04A47 
X-CRM114-Status: GOOD (  27.21  )
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
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, ndesaulniers@google.com,
 mingo@kernel.org, atish.patra@wdc.com, linux-riscv@lists.infradead.org,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/10/19 12:09 AM, Alex Ghiti wrote:
> On 1/9/19 7:23 PM, Mike Kravetz wrote:
>> On 12/9/18 10:21 PM, Alexandre Ghiti wrote:
>>> However I don't see any strong dependency between free_contig_range
>>> and those configs, maybe we could allow hugetlbfs users to free boot
>>> reserved hugepages without those configs activated, I will propose
>>> something if Mike Kravetz agrees.
>> Yes, that should be modified.  I think it would be a simple matter of moving
>> free_contig_range out of that ifdef block.  If you would like, I can submit
>> a patch for that.
> 
> 
> I think there is more to do: free_gigantic_page is only defined with
> ARCH_HAS_GIGANTIC_PAGE which in turn is only defined with
> CMA || (MEMORY_ISOLATION && COMPACTION). Moreover, if
> ARCH_HAS_GIGANTIC_PAGE is not defined, gigantic_page_supported
> will return false and then function like update_and_free_page will
> not reach the call to free_gigantic_page...etc. I will send you a patch
> when I have fixed all of that :)

Yes, I spoke too soon :)

>> Somewhat related, I do not think your patches enable dynamic allocation of
>> gigantic pages.  Not sure if that was an oversight or conscious decision.
>> I am not sure this is a highly used feature, but if you can do it on riscv
>> then why not?
> 
> I'm not sure to understand: do you mean picking an already allocated
> gigantic page or really allocating it with alloc_gigantic_page ? Or
> something else ?

The term 'dynamic allocation' may not be accurate.  Sorry!

Yes, I was talking about really allocating with alloc_gigantic_page.
It is possible to do this as long as the hstate for the gigantic page
size already exists.  If nothing is specified on the kernel boot command
line, the arch independent code will only set up the hstate for the default
huge page size.  x86 has this at the end of hugetlbpage.c to create the
gigantic page hstate as along as all config options are specified.

#if (defined(CONFIG_MEMORY_ISOLATION) && defined(CONFIG_COMPACTION)) ||
defined(CONFIG_CMA)
static __init int gigantic_pages_init(void)
{
	/* With compaction or CMA we can allocate gigantic pages at runtime */
	if (boot_cpu_has(X86_FEATURE_GBPAGES) && !size_to_hstate(1UL << PUD_SHIFT))
		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
	return 0;
}
arch_initcall(gigantic_pages_init);
#endif

I believe some other architectures do something similar to automatically
set up hstates other huge pages sizes at boot time.  Totally optional,
but you might want to do something like this for riscv.

-- 
Mike Kravetz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
