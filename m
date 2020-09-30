Return-Path: <SRS0=Qujn=DH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1645C4727F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 14:41:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84830206FC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 14:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e9tHqjyg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="V6DwgTAK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84830206FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/5KHpbT2ehIQiMJn+aBCNfuFausD9UOWOx2lFJbiho=; b=e9tHqjygnfyFvVlILcdwbBXcvD
	1XYiepAuRMVpZW//r9bdi6ERxKumOoaRDLA0uhI/5yU8RX/NXz/qWqXtXuydkjbJZ4XxufitiY9R+
	Avdehm0bV+yM2khXS0/hH3yNzbOZVmqijtoporfXFDbt6dY2JqTRCT/dQjA6GIZYePcbc9Ko7H7Rc
	s31BGB3dIvMnaifF6VPndeGhef06hoce1NMbBmgFrQK9hUuwtn6SoCl5gBauvSqDBtHdlNz8PYRYi
	kIvUHDWVf/w0n287RHVLArLCMqBTt8bGxfZDvhOUEXzKmphW2q/VZ0UDm8VNs269sgmFDnTskNeBx
	s4IgS8/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNdHo-0008Df-3U; Wed, 30 Sep 2020 14:40:52 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNdHh-0008CO-Pu; Wed, 30 Sep 2020 14:40:47 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UEXn0h002260; Wed, 30 Sep 2020 10:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=TOhFRkH6eBrNvZOnRv3vltvV9RWcAvaYO4zGgzF6rYA=;
 b=V6DwgTAKxpxWbmkbUs+va5rzIxR+lCshyKHzDJTztxt1Hk13G4unr60eZMYIJnN4V2nq
 /jEkjdRudg7CAzTYrBENRqt8sHleTLsYAiL8SdB1aCk1NfjtQWhrSGCd4WgBzHKX3W+/
 htaiTmMRRzk9Izsiz8TbNboGeepzjBW1wDZ4Rm4UDs6BeYGHkgijKGyl5/2Vc9dKgt5M
 joTxP4/HYR3U/jMJFF9VaYNuGVLX0x0CLFiJX90UgMw/ZTYxe7OSJhgvoG0dEbOCj/Uo
 JMtTSmu1uVj0Nyo/Cew9CAVzfjzQgDiHlHMhc76YsmWCR9xbt08JW2T2lE9OscEE5eMz hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33vtprt807-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 10:40:14 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08UEY9wX003413;
 Wed, 30 Sep 2020 10:40:09 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33vtprt7wm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 10:40:08 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08UEcK6A011409;
 Wed, 30 Sep 2020 14:40:03 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 33sw99e3uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 14:40:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08UEdweH34472466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 14:39:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45B5D78072;
 Wed, 30 Sep 2020 14:40:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FEF578060;
 Wed, 30 Sep 2020 14:39:56 +0000 (GMT)
Received: from jarvis (unknown [9.85.129.253])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 30 Sep 2020 14:39:55 +0000 (GMT)
Message-ID: <371c27d97067654171e5c1019340b56cffadae7a.camel@linux.ibm.com>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
From: James Bottomley <jejb@linux.ibm.com>
To: Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>
Date: Wed, 30 Sep 2020 07:39:54 -0700
In-Reply-To: <20200930102745.GC3226834@linux.ibm.com>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <20200929130529.GE2142832@kernel.org>
 <20200929141216.GO2628@hirez.programming.kicks-ass.net>
 <20200929145813.GA3226834@linux.ibm.com>
 <20200929151552.GS2628@hirez.programming.kicks-ass.net>
 <20200930102745.GC3226834@linux.ibm.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_07:2020-09-30,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=690 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009300112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_104046_371018_18010614 
X-CRM114-Status: GOOD (  26.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org,
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

On Wed, 2020-09-30 at 13:27 +0300, Mike Rapoport wrote:
> On Tue, Sep 29, 2020 at 05:15:52PM +0200, Peter Zijlstra wrote:
> > On Tue, Sep 29, 2020 at 05:58:13PM +0300, Mike Rapoport wrote:
> > > On Tue, Sep 29, 2020 at 04:12:16PM +0200, Peter Zijlstra wrote:
> > > > It will drop them down to 4k pages. Given enough inodes, and
> > > > allocating only a single sekrit page per pmd, we'll shatter the
> > > > directmap into 4k.
> > > 
> > > Why? Secretmem allocates PMD-size page per inode and uses it as a
> > > pool of 4K pages for that inode. This way it ensures that
> > > __kernel_map_pages() is always called on PMD boundaries.
> > 
> > Oh, you unmap the 2m page upfront? I read it like you did the unmap
> > at the sekrit page alloc, not the pool alloc side of things.
> > 
> > Then yes, but then you're wasting gobs of memory. Basically you can
> > pin 2M per inode while only accounting a single page.
> 
> Right, quite like THP :)
> 
> I considered using a global pool of 2M pages for secretmem and
> handing 4K pages to each inode from that global pool. But I've
> decided to waste memory in favor of simplicity.

I can also add that the user space consumer of this we wrote does its
user pool allocation at a 2M granularity, so nothing is actually
wasted.

https://git.kernel.org/pub/scm/linux/kernel/git/jejb/secret-memory-preloader.git/

James



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
