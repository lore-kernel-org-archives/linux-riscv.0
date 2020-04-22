Return-Path: <SRS0=xrvF=6G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E2CC54FCB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 16:57:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7214F20706
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 16:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U9NBQF5t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MYqyVkvM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7214F20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFL7+e4rirW/BkUxDvX7Q/JJpL0GDaD2BXrkYZ/Jcqw=; b=U9NBQF5ttqfEwo
	U5owv/GRBYqAniUWuKKmj4ue2E2Tsbb1YPUEhn5JzFtxLulJoCJ8IA+zhDw+lNLuVjd6A8k0EDrFW
	+fXIlZIS3G6INOy6LbJ+xR5MEr3J0MUg1GoWhAaqEC3MX9Q7+G/sXB3t0KinB2GzcS7nm2WtG+v1g
	iepa+YpIG3rUSuiyBruWcwzp/WGlCuCQSL0f7h1N9hjLI6wa70ctt5RUO74jaTjHwG6htXX2v8NK/
	v48VQ/14RHucyDtnnYUvJj0FIEFU3Hj8v5ICm45bNql1LC7LTYVxjC5BqS2nmcAWQM5WXHdBid31w
	kk29P6VxD9fONrACJoow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRIgj-0002DC-Lw; Wed, 22 Apr 2020 16:57:29 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRIgd-0002BH-MJ; Wed, 22 Apr 2020 16:57:27 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03MGmbre004744;
 Wed, 22 Apr 2020 16:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=LFL7+e4rirW/BkUxDvX7Q/JJpL0GDaD2BXrkYZ/Jcqw=;
 b=MYqyVkvMM2l3bcO0sT1OP4Def5zhIfw/QdGlifi1bpsPSISeIps2HlN6swempAZOHxXU
 Xuwr7UsHf04EjB4t+Bx9Iryi2BwAf30Z4vB0a0cmU9iZJLT2BhOnDAlxqqp8uH5BLXmm
 yLz0SYoMr3BnkdKC1onkAb1OOYCfyVsD6yoveKI8U5apJsHviWgi1LC2od6TwBZfhW1s
 8mVD64RprsPOCCsEabcXnkybmZn0gbNZlHNE3QhzDHsievUxgYz9ZV/pJVdke7G4VMta
 Pr6NAwDyxeSmgA9PCwLd2+I+VrpMva1Va6GkzI8Go+hHrYfD6lzFVPuAQgtNlWxdAUD9 1w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 30grpgrh3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Apr 2020 16:56:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03MGmInv111640;
 Wed, 22 Apr 2020 16:56:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 30gb1jxhcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Apr 2020 16:56:24 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03MGu7au024097;
 Wed, 22 Apr 2020 16:56:07 GMT
Received: from [192.168.2.157] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Apr 2020 09:56:07 -0700
Subject: Re: [PATCH v3 3/4] hugetlbfs: remove hugetlb_add_hstate() warning for
 existing hstate
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20200417185049.275845-1-mike.kravetz@oracle.com>
 <20200417185049.275845-4-mike.kravetz@oracle.com>
 <87blnj4x9p.fsf@linux.ibm.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <d39a33da-6095-c616-6bff-6af8795922d1@oracle.com>
Date: Wed, 22 Apr 2020 09:56:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <87blnj4x9p.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004220126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004220126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_095726_419448_B690D72F 
X-CRM114-Status: GOOD (  17.53  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Peter Xu <peterx@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Longpeng <longpeng2@huawei.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Nitesh Narayan Lal <nitesh@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S.Miller" <davem@davemloft.net>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/22/20 3:42 AM, Aneesh Kumar K.V wrote:
> Mike Kravetz <mike.kravetz@oracle.com> writes:
> 
>> The routine hugetlb_add_hstate prints a warning if the hstate already
>> exists.  This was originally done as part of kernel command line
>> parsing.  If 'hugepagesz=' was specified more than once, the warning
>> 	pr_warn("hugepagesz= specified twice, ignoring\n");
>> would be printed.
>>
>> Some architectures want to enable all huge page sizes.  They would
>> call hugetlb_add_hstate for all supported sizes.  However, this was
>> done after command line processing and as a result hstates could have
>> already been created for some sizes.  To make sure no warning were
>> printed, there would often be code like:
>> 	if (!size_to_hstate(size)
>> 		hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT)
>>
>> The only time we want to print the warning is as the result of command
>> line processing.
> 
> Does this patch break hugepages=x command line? I haven't tested this
> yet. But one of the details w.r.t. skipping that hugetlb_add_hstate is
> to make sure we can configure the max_huge_pages. 
> 

Are you asking about hugepages=x being the only option on the command line?
If so, then the behavior is not changed.  This will result in x pages of
default huge page size being allocated.  Where default huge page size is of
course architecture dependent.  On an x86 VM,

[    0.040474] Kernel command line: BOOT_IMAGE=/vmlinuz-5.6.0-mm1+ root=/dev/mapper/fedora_new--host-root ro rd.lvm.lv=fedora_new-host/root rd.lvm.lv=fedora_new-host/swap console=tty0 console=ttyS0,115200 audit=0 transparent_hugepage=always hugepages=128
[    0.332618] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.333245] HugeTLB registered 2.00 MiB page size, pre-allocated 128 pages

BTW - Here are the command line options I tested on x86 with this series.

No errors or warnings
---------------------
hugepages=128
hugepagesz=2M hugepages=128
default_hugepagesz=2M hugepages=128
hugepages=128 default_hugepagesz=2M
hugepagesz=1G hugepages=2
hugepages=2 default_hugepagesz=1G
default_hugepagesz=1G hugepages=2
hugepages=128 hugepagesz=1G hugepages=2
hugepagesz=1G hugepages=2 hugepagesz=2M hugepages=128
default_hugepagesz=2M hugepages=128 hugepagesz=1G hugepages=2
hugepages=128 default_hugepagesz=2M hugepagesz=1G hugepages=2
hugepages=2 default_hugepagesz=1G hugepagesz=2M hugepages=128
default_hugepagesz=1G hugepages=2 hugepagesz=2M hugepages=128
default_hugepagesz=2M hugepagesz=2M hugepages=128
default_hugepagesz=2M hugepagesz=1G hugepages=2 hugepagesz=2M hugepages=128

Error or warning
----------------
hugepages=128 hugepagesz=2M hugepages=256
hugepagesz=2M hugepages=128 hugepagesz=2M hugepages=256
default_hugepagesz=2M hugepages=128 hugepagesz=2M hugepages=256
hugepages=128 hugepages=256
hugepagesz=2M hugepages=128 hugepages=2 default_hugepagesz=1G

-- 
Mike Kravetz

