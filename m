Return-Path: <SRS0=Qujn=DH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C098BC4727E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 10:28:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AF362075F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2020 10:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nsi9SJrf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DMFFWxWQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AF362075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oooWQrbZ7ERNj/tIfPx+mfUs2WAXEbYqJhG+S/ctbEs=; b=nsi9SJrf8hcEggSPubObfzMaM
	HiGzQBiwWrE4NfJqXEc/l0Ypfa87371tAAIT5Hyt6velw+9RevdGodi3lIpAiP/QJmMHMtUMLvL/o
	0sNt+QX3wrKV+rJNhVCnQ2iUq247j52AkPBp+jJcu9QQ+TC5HGjUJqSt3nqptm4c3msx/yHSc7fvL
	qnjWk5ufTODujHSejUCRCHRUq7GqsVvS9EKfL9agQ6s90h+djpoEl8RlhPIWjObfcrywAwY6zf4So
	9mmthde2iHZSNic3glfHaXWre31Hv336sGwa5Q7pVbwjJyyMQr8Nxhh0kJWdKUun6T9WPW7ip7moA
	V4U+uj8bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNZLm-0007dM-Qb; Wed, 30 Sep 2020 10:28:42 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNZLf-0007bR-FQ; Wed, 30 Sep 2020 10:28:36 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UACrbo033738; Wed, 30 Sep 2020 06:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=YLMZRYhLxXYowrAZOtKzuR/O6QgcBOt/bbAeTvAVLYk=;
 b=DMFFWxWQQQ/dOUDvmOcVNiZFPAqDQ+snKuj9I6y9e7JHxF4bBih3sAFH5XZIn/4WPNpW
 gyMRwSGnThr/oC4YT6P+4JGsCQA/nOuSjX7YuhpWz46EXu65qVfgIz2hFfaGewFvSaoS
 L0gg9kNhzz5iwXCb22/7peTMmvDQaTyxwsYgmt7chFrzDHZMvHLEMmD5TvagNiMShquq
 vw8E4ePr5a9XSW1nrzo4fHkmXkMVeMNJU2a2YlPEySk58tXJVrLzC+um0RhsN8HafEyD
 LJfK1Zy1eWk6G7U5hrspZWnWHBA5T90SHU1OjQWl9PYBFWCWxXH2Ha9j9c3iVKR3pYxn fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33vr2hgdas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 06:27:57 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08UADAG4034594;
 Wed, 30 Sep 2020 06:27:56 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33vr2hgd9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 06:27:56 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08UAMX6f004141;
 Wed, 30 Sep 2020 10:27:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 33v6mgruss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Sep 2020 10:27:54 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08UARpio24969710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 10:27:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1F85AE053;
 Wed, 30 Sep 2020 10:27:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2A9AAE045;
 Wed, 30 Sep 2020 10:27:47 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.79.47])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 30 Sep 2020 10:27:47 +0000 (GMT)
Date: Wed, 30 Sep 2020 13:27:45 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 5/6] mm: secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <20200930102745.GC3226834@linux.ibm.com>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-6-rppt@kernel.org>
 <20200925074125.GQ2628@hirez.programming.kicks-ass.net>
 <20200929130529.GE2142832@kernel.org>
 <20200929141216.GO2628@hirez.programming.kicks-ass.net>
 <20200929145813.GA3226834@linux.ibm.com>
 <20200929151552.GS2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929151552.GS2628@hirez.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_05:2020-09-29,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=950 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009300075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_062835_587372_A8BF050F 
X-CRM114-Status: GOOD (  27.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2020 at 05:15:52PM +0200, Peter Zijlstra wrote:
> On Tue, Sep 29, 2020 at 05:58:13PM +0300, Mike Rapoport wrote:
> > On Tue, Sep 29, 2020 at 04:12:16PM +0200, Peter Zijlstra wrote:
> 
> > > It will drop them down to 4k pages. Given enough inodes, and allocating
> > > only a single sekrit page per pmd, we'll shatter the directmap into 4k.
> > 
> > Why? Secretmem allocates PMD-size page per inode and uses it as a pool
> > of 4K pages for that inode. This way it ensures that
> > __kernel_map_pages() is always called on PMD boundaries.
> 
> Oh, you unmap the 2m page upfront? I read it like you did the unmap at
> the sekrit page alloc, not the pool alloc side of things.
> 
> Then yes, but then you're wasting gobs of memory. Basically you can pin
> 2M per inode while only accounting a single page.

Right, quite like THP :)

I considered using a global pool of 2M pages for secretmem and handing
4K pages to each inode from that global pool. But I've decided to waste
memory in favor of simplicity.

The prevoius version of this set included additional patch that allowed
reserving chunk of the physical memory for a global secretmem pool at
boot time. We didn't reach an agreement with David H. about whether this
pool should be allocated directly from memblock or from CMA and I've
dropped the boot time reservation patch because it can always be added on
top. 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
