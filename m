Return-Path: <SRS0=Qujn=DH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24BDC4727E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 15:18:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142A42071E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 15:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z7BC5lrh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GTNk/CkC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142A42071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rKqmXWoF+ENGC7MzCd9AqH6IKCHEyZz81qUF6GIgPk=; b=z7BC5lrhoY/cQAIdOc16V80MMx
	sII4AYV4IQom2jwxzf9rYGb6UGBV73IdKRJ/jjWexFZwKPhSzbdTL9tADeN92QOihX+hLJPtM+ycv
	Nf+WMIRj2SG7UINi8xzxV7OjhqipiSol/fW1Ud7TzsV80ppamm95Gj5fMzeDav8drp2C2jaM2ekyf
	Q76nnbuywuJVqUGHe7PAh7snUMxsRvpPHbgfYdZAxJUs3O04plsFRVYc/NUbcOnFK87SMqzKFDoZb
	/QrbyYzqVmH5GKKDY+/SPLFtI0t0dSx2MNpVsLZlTvLSjOeO69w1FOpCM2xoxr+m3uMrZKjpnc4+M
	vJ/GZmBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNdrt-0004Nv-3l; Wed, 30 Sep 2020 15:18:09 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNdrl-0004M4-KQ; Wed, 30 Sep 2020 15:18:02 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UF3MFk094686; Wed, 30 Sep 2020 11:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=gp+WQ9ZEESIZMduD1c/QEJUgwqbbB7WxwcV1dg1RrNA=;
 b=GTNk/CkCAv8Qo5GFZrNEkX9tOKw5DaIu8rRYo+l9dGFjJ2UhDLmAbhff9Viw5MTvKmQS
 HhXE4TScz4/FbOYj0KrSBua1OE0Q4JHcYzQ4eP4qEl7wPgFMhEIzaY5h5/RKFjJVLKpZ
 P+oymzU4uwjVrMxsaCs5urUeI8oCtdeqsPAcudm72WEfn+cnCEo4RgpHYCBC9bEr7Wpt
 YqCO+/lRbY6ky/64BS7J6+KIrKyCLDyXEIYhC8VnsO6FvNz6hUZuuxoaKon+qApQVV2c
 mq/WI6NjDg7OG63/7oboppyBDscb0Myb6e/QbiPtc1ufBfPfgCZMolIVoIjVKMVBS23W Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33vv1q195j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 11:17:25 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08UF3VKV095830;
 Wed, 30 Sep 2020 11:17:25 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33vv1q194k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 11:17:24 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08UFDA0t032299;
 Wed, 30 Sep 2020 15:17:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 33sw99qx7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 15:17:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08UFHLxG41681302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 15:17:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C2B478064;
 Wed, 30 Sep 2020 15:17:21 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A8C07805F;
 Wed, 30 Sep 2020 15:17:13 +0000 (GMT)
Received: from jarvis (unknown [9.85.129.253])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 30 Sep 2020 15:17:12 +0000 (GMT)
Message-ID: <ba7fbd31b37363c002318f633d7cc47d9ef46822.camel@linux.ibm.com>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
From: James Bottomley <jejb@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>
Date: Wed, 30 Sep 2020 08:17:11 -0700
In-Reply-To: <6568383f-4e43-2fe4-ecf1-8a55e306440b@redhat.com>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <20200929130529.GE2142832@kernel.org>
 <20200929141216.GO2628@hirez.programming.kicks-ass.net>
 <20200929145813.GA3226834@linux.ibm.com>
 <20200929151552.GS2628@hirez.programming.kicks-ass.net>
 <20200930102745.GC3226834@linux.ibm.com>
 <371c27d97067654171e5c1019340b56cffadae7a.camel@linux.ibm.com>
 <6568383f-4e43-2fe4-ecf1-8a55e306440b@redhat.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_08:2020-09-30,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=838 impostorscore=0 suspectscore=2 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009300121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_111801_804508_CFE04167 
X-CRM114-Status: GOOD (  32.42  )
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
Reply-To: jejb@linux.ibm.com
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Shuah Khan <shuah@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Idan Yaniv <idan.yaniv@ibm.com>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-30 at 16:45 +0200, David Hildenbrand wrote:
> On 30.09.20 16:39, James Bottomley wrote:
> > On Wed, 2020-09-30 at 13:27 +0300, Mike Rapoport wrote:
> > > On Tue, Sep 29, 2020 at 05:15:52PM +0200, Peter Zijlstra wrote:
> > > > On Tue, Sep 29, 2020 at 05:58:13PM +0300, Mike Rapoport wrote:
> > > > > On Tue, Sep 29, 2020 at 04:12:16PM +0200, Peter Zijlstra
> > > > > wrote:
> > > > > > It will drop them down to 4k pages. Given enough inodes,
> > > > > > and allocating only a single sekrit page per pmd, we'll
> > > > > > shatter the directmap into 4k.
> > > > > 
> > > > > Why? Secretmem allocates PMD-size page per inode and uses it
> > > > > as a pool of 4K pages for that inode. This way it ensures
> > > > > that __kernel_map_pages() is always called on PMD boundaries.
> > > > 
> > > > Oh, you unmap the 2m page upfront? I read it like you did the
> > > > unmap at the sekrit page alloc, not the pool alloc side of
> > > > things.
> > > > 
> > > > Then yes, but then you're wasting gobs of memory. Basically you
> > > > can pin 2M per inode while only accounting a single page.
> > > 
> > > Right, quite like THP :)
> > > 
> > > I considered using a global pool of 2M pages for secretmem and
> > > handing 4K pages to each inode from that global pool. But I've
> > > decided to waste memory in favor of simplicity.
> > 
> > I can also add that the user space consumer of this we wrote does
> > its user pool allocation at a 2M granularity, so nothing is
> > actually wasted.
> 
> ... for that specific user space consumer. (or am I missing
> something?)

I'm not sure I understand what you mean?  It's designed to be either
the standard wrapper or an example of how to do the standard wrapper
for the syscall.  It uses the same allocator system glibc uses for
malloc/free ... which pretty much everyone uses instead of calling
sys_brk directly.  If you look at the granularity glibc uses for
sys_brk, it's not 4k either.

James



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
