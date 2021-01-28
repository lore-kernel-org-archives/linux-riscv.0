Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCC5C433E6
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 15:30:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA21B60235
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 15:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA21B60235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDRKfY71Sily+V2qupoo8WA1izlfonQLnxn8KgHGRLk=; b=ZJdkY0wN/4//nRdYiuafnkLCpK
	JkQQImX+axfjaEFAKcoJHzsD+JswVB5LW1r6mYHkmP2gIzHgtIIVs/Wlu5tPyiMOOv625U0M+ICak
	NRlDAg6DjAmRdwiMjYbdD4Ez3y6lPkYEBMV13soVldqpG84TZhC+niSm2ioo3gdmozhqlC8emjaUM
	nvpdmqlntcnIMV1DuBFPA5TDz1523xyGSZpMVoBlSS3rdlpw6Al896+jr2IbsinbV/ZPBxBsCsgwm
	fO3p9IBm5w4sWrxl6i4X5ExJ9sZHbcKxNBmsXjcjHiNZamYMGAISOBGcbL042D1Yu9QrCeF43ih9a
	Hvj+NtLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l59FH-0008Id-9H; Thu, 28 Jan 2021 15:30:07 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l59F8-0008FE-K0; Thu, 28 Jan 2021 15:30:01 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SFLNHs039731; Thu, 28 Jan 2021 10:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=BVjEY1aLHVWHgW1JrF/80HMLKbeNHJOxCddk5Vowny0=;
 b=Yevp9Xe/XpYW7upEtY53faLYNKGYJRhwMIPFh60FKc4taK+WYZNlt9DuMlv50W+vD8ly
 2Rgn1wAtfZ67UHGAQox0ckGTHb2oqn8IRLrq6uji204LoWnlpRR/NJvaQoNMZAYuZoRB
 xq5g9FnHp3LeVO8cdzrK3YGMvO7FDRvmLBEO3Bozb/XQOHQ2DzX+6rnoqWjwTMEhZddr
 OSY1Bqpso6OHC3FRHlTJDvMjoEa7jrOfz6jrQpvjF8wk8FaCtw52sLccAjFbJMIFQoQE
 6XeEX2cRqytx0yaPYDFC9xg51JYkA/RXWVyaAqGSpVtCTzcEu1fQc+RJ2y/rtgp7FeAK Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36by8ysn02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 10:29:12 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SFLgJY041664;
 Thu, 28 Jan 2021 10:29:11 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36by8ysmyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 10:29:11 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SFNCCV013626;
 Thu, 28 Jan 2021 15:29:09 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 36agvf5abj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 15:29:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SFT8Om25821540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 15:29:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C0D67805C;
 Thu, 28 Jan 2021 15:29:08 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 707E67805F;
 Thu, 28 Jan 2021 15:28:59 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.133.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 15:28:59 +0000 (GMT)
Message-ID: <2b6a5f22f0b062432186b89eeef58e2ba45e09c1.camel@linux.ibm.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
From: James Bottomley <jejb@linux.ibm.com>
To: Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>
Date: Thu, 28 Jan 2021 07:28:57 -0800
In-Reply-To: <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz> <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_08:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_102958_747956_D80A8AA9 
X-CRM114-Status: GOOD (  31.24  )
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
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 2021-01-28 at 14:01 +0100, Michal Hocko wrote:
> On Thu 28-01-21 11:22:59, Mike Rapoport wrote:
[...]
> > One of the major pushbacks on the first RFC [1] of the concept was
> > about the direct map fragmentation. I tried really hard to find
> > data that shows what is the performance difference with different
> > page sizes in the direct map and I didn't find anything.
> > 
> > So presuming that large pages do provide advantage the first
> > implementation of secretmem used PMD_ORDER allocations to amortise
> > the effect of the direct map fragmentation and then handed out 4k
> > pages at each fault. In addition there was an option to reserve a
> > finite pool at boot time and limit secretmem allocations only to
> > that pool.
> > 
> > At some point David suggested to use CMA to improve overall
> > flexibility [3], so I switched secretmem to use CMA.
> > 
> > Now, with the data we have at hand (my benchmarks and Intel's
> > report David mentioned) I'm even not sure this whole pooling even
> > required.
> 
> I would still like to understand whether that data is actually
> representative. With some underlying reasoning rather than I have run
> these XYZ benchmarks and numbers do not look terrible.

My theory, and the reason I made Mike run the benchmarks, is that our
fear of TLB miss has been alleviated by CPU speculation advances over
the years.  You can appreciate this if you think that both Intel and
AMD have increased the number of levels in the page table to
accommodate larger virtual memory size 5 instead of 3.  That increases
the length of the page walk nearly 2x in a physical system and even
more in a virtual system.  Unless this were massively optimized,
systems would have slowed down significantly.  Using 2M pages only
eliminates one level and 2G pages eliminates 2, so I theorized that
actually fragmentation wouldn't be the significant problem we once
thought it was and asked Mike to benchmark it.

The benchmarks show that indeed, it isn't a huge change in the data TLB
miss time, I suspect because data is nicely continuous nowadays and the
prediction that goes into the CPU optimizations quite easy.  ITLB
fragmentation actually seems to be quite a bit worse, likely because we
still don't have branch prediction down to an exact science.

James



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
