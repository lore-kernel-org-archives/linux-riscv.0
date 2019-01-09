Return-Path: <SRS0=AFlu=PR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08ED4C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 19:23:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAFB220663
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 19:23:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pgCel02g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="5eEJm2RY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAFB220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RugsaqlpMXqrKeS4hRPzW67qbG3Os8J1DgQ6aoNcEfw=; b=pgCel02gnv8Xn5
	dezElPWN11++ImRIqh1UYjcEFwlhW9qB/3zSokxcxSW3V+fs37g7kbnhkwV3OmjjKtIgb+Fi1njcD
	+9wL8ctFlgHBVDa0bTFCo2TY4Elgcgjyzl3tMbPxE4o55HMBE3NG+RD38VabTlcCkiUY933b6LbD+
	Hrbd7mJtxDAxgTWXpf/ku6YqfPbq9iANpnhyDnpHFCAZP2ewGKpYzneEi/Mtjn8wcnL0rpTGJaZSt
	kT2f19+tzwh3+1H/WZGuF8e51ySr5gV0i4pqnSyxu2OlK/76UIU7o+DMD6PfhUeEWwANcE2fKZfNS
	xYBjzVVByjXPPJlEBA4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghJS0-0007Nb-Qz; Wed, 09 Jan 2019 19:23:40 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghJRx-0007Mh-CB
 for linux-riscv@lists.infradead.org; Wed, 09 Jan 2019 19:23:39 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id x09J9cvv168293;
 Wed, 9 Jan 2019 19:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=2aJ5UG9FaGWEYJ/05JwxVQZdJNr+BwnHYLNJQhJAcrY=;
 b=5eEJm2RYMSWpYJnAfmseB55tTYZhyHAZajIHnpo1uey7MF3xFCHlk2ZF19W19YG+89Et
 BRFtSxZtKvt5ITidF0tUio4ngvTeI1ZZ2ZWgecfH5p3I/pyK8vmfuW5Ztu3Hwpq7IK/M
 HKsAx83dn+hAb5Ws5AgLjtlh+iVz4ucddRjOttsVGjJsSN6jSY6qlNcxP02NzLSXwV9F
 2Lqi0dIT8axiudheow3AhXrHX/fIq1H9KWKOZ89/Vgq3g9lFJAJo807c+oUeqy2bkypb
 l0W1WP4JfPYJZ0TF97hyQjYcXRpWJ6e4IF67mKFRGQlfhk+eIZ1lGs2Ha7FiCExrChCk qw== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
 by userp2120.oracle.com with ESMTP id 2ptn7r348n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Jan 2019 19:23:26 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id x09JNOIW004240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Jan 2019 19:23:24 GMT
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x09JNNoQ022470;
 Wed, 9 Jan 2019 19:23:23 GMT
Received: from [192.168.1.164] (/50.38.38.67)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Jan 2019 11:23:23 -0800
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
To: Alexandre Ghiti <aghiti@upmem.com>, palmer@sifive.com
References: <20181210062146.24951-1-aghiti@upmem.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
Date: Wed, 9 Jan 2019 11:23:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181210062146.24951-1-aghiti@upmem.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9131
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1901090157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_112337_551890_5F4B1245 
X-CRM114-Status: GOOD (  27.03  )
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
 linux-riscv@lists.infradead.org, atish.patra@wdc.com,
 akpm@linux-foundation.org, mingo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/9/18 10:21 PM, Alexandre Ghiti wrote:
> This series introduces hugetlbfs support for both riscv 32/64. Riscv32
> is architecturally limited to huge pages of size 4MB whereas riscv64 has
> 2MB/1G huge pages support. Transparent huge page support is not
> implemented here, I will submit another series later.

Thanks for doing this.

Since patches only touch riscv specific code, I did not look too closely
and do not feel qualified to offer an opinion as to whether they are correct
for the architecture.

With that said, the patches do look reasonable with a few comments below.

> CMA or (MEMORY_ISOLATION && COMPACTION) must be enabled so that boot
> reserved gigantic pages can be freed: indeed, one can reduce the number
> of huge pages by calling free_gigantic_pages which in turn calls
> free_contig_range, defined only with those configs defined.
> However I don't see any strong dependency between free_contig_range
> and those configs, maybe we could allow hugetlbfs users to free boot
> reserved hugepages without those configs activated, I will propose
> something if Mike Kravetz agrees.

Yes, that should be modified.  I think it would be a simple matter of moving
free_contig_range out of that ifdef block.  If you would like, I can submit
a patch for that.

Somewhat related, I do not think your patches enable dynamic allocation of
gigantic pages.  Not sure if that was an oversight or conscious decision.
I am not sure this is a highly used feature, but if you can do it on riscv
then why not?

Another 'missing feature' in your patches is PMD sharing.  This feature if
only of value for BIG shared hugetlbfs mappings.  DB folks like it.  As
mentioned above, I do not know much about riscv so I do not know if this
might be of use to potential users.

> - libhugetlbfs testsuite on riscv64/1G:
>   - brk_near_huge triggers an assert in malloc.c, does not on x86.
>   - mmap-gettest, mmap-cow: testsuite passes the number of default free
>     pages as parameters and then fails for 1G which is not the default.
>     Otherwise succeeds when given the right number of pages.
>   - map_high_truncate_2 fails on x86 too: 0x60000000 is not 1G aligned
>     and fails at line 694 of fs/hugetlbfs/inode.c.
>   - heapshrink on 1G fails on x86 too, not investigated.
>   - counters.sh on 1G fails on x86 too: alloc_surplus_huge_page returns
>     NULL in case of gigantic pages.
>   - icache-hygiene succeeds after patch #3 of this series which lowers
>     the base address of mmap.
>   - fallocate_stress.sh on 1G never ends, on x86 too, not investigated.

In general, libhugetlbfs tests seem to have issues with anything besides
default huge page size.  You encountered that and noted that tests break
for 1G pages on x86 as well.  Cleaning all that up has been on my todo list
for years, but there always seems to be something of higher priority. :(

-- 
Mike Kravetz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
