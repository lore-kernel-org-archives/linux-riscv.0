Return-Path: <SRS0=ovIN=HY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA5AC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 19:24:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1932B64DA1
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 19:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1932B64DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNrlTrH4KckGPIh4KW1MQohfM3zonxaiUuYzD+4JSAc=; b=TVEDaJSfRdhxI04QMHI2tx6JIg
	B7wLYs0UMztYbKVPCdlBEjvgo5IPJG9HZ4mCCk4ESENETR1VDSCER/35jbzsu4Gbe7qIGuLHvV5Xp
	dIegvW4j/7n2BWHcoJEojnFv6FIUC4llatinttT3dVQiKxVKG/YKiQtJakgKJdn9mDv11pPZsELIc
	DS9Q6UWGYP51BLs2+sCl2qHXeUG1sDvhwohJY1tSuUiJE7mM1ERvT64yD8vCuW7wt6CNHQTIs6Hly
	eXTDQxCqzAhb+PKlzRMdqJ8SKShkY133xRIjU4pdn3uTnnfTqZF8c94S8uJzYllDAGzQpI1zZ/3NM
	0d0X98lQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEGoD-0000uq-DO; Mon, 22 Feb 2021 19:23:53 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEGoA-0000u0-CW; Mon, 22 Feb 2021 19:23:51 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MJEpp1109474; Mon, 22 Feb 2021 14:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=KAyj3eKLFKOMnwU1Es38+VsKyGm7gMDhy7ENyWKcDm4=;
 b=bn8IhK//XUxSeVLKRWaudUpoZzL3HN5vnUn4dYDpyPFm9aPCaPnD+QiwGxLCGeTzELxl
 PppAlRy+arUk88Dhx2rNqZySKY6ng2azqgGEVWR2grK/HbTghTHlijIE6pTMcJB3Vg/1
 GSPfdff6vMuq186WZnDTsg+gUMVvggORWXLF/f2a3vzpjKTMKAwgSXW3kjfo0kJ5ca75
 10nkRQpUwTmxScPMGE5eZkL9fMfmn6thoNYthm6uAKXwqpRPs90KjqwDpJUUI4LRrd6O
 Q+BXIG4P3y9Geq5ul5vQRFgctbObacFSkjKUgekkyuvlqcgR4IITzI9pxcRVpdvK/lGJ 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vjkkgbyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 14:22:05 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11MJFWXD164416;
 Mon, 22 Feb 2021 14:22:04 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vjkkgbwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 14:22:03 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MJLub8006699;
 Mon, 22 Feb 2021 19:22:00 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 36tt29gytt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 19:22:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11MJLxGN50266622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 19:21:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 795D87806D;
 Mon, 22 Feb 2021 19:21:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B698978060;
 Mon, 22 Feb 2021 19:21:51 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.80.227.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Feb 2021 19:21:51 +0000 (GMT)
Message-ID: <22003fc92c16852debfdd35293475e7093d2bc67.camel@linux.ibm.com>
Subject: Re: [PATCH v17 08/10] PM: hibernate: disable when there are active
 secretmem users
From: James Bottomley <jejb@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>, Mike Rapoport <rppt@kernel.org>
Date: Mon, 22 Feb 2021 11:21:50 -0800
In-Reply-To: <CAPcyv4hCXZFmeMkKxN54Yw3ZbvoYQ3Z9y9Ayv42i6u+24Bkmqg@mail.gmail.com>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-9-rppt@kernel.org>
 <20210222073452.GA30403@codon.org.uk> <20210222102359.GE1447004@kernel.org>
 <CAPcyv4hCXZFmeMkKxN54Yw3ZbvoYQ3Z9y9Ayv42i6u+24Bkmqg@mail.gmail.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_06:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_142350_583932_9A112FD7 
X-CRM114-Status: GOOD (  29.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux MM <linux-mm@kvack.org>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 linux-riscv@lists.infradead.org, Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Will Deacon <will@kernel.org>,
 X86 ML <x86@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Shakeel Butt <shakeelb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 2021-02-22 at 11:17 -0800, Dan Williams wrote:
> On Mon, Feb 22, 2021 at 2:24 AM Mike Rapoport <rppt@kernel.org>
> wrote:
> > On Mon, Feb 22, 2021 at 07:34:52AM +0000, Matthew Garrett wrote:
> > > On Mon, Feb 08, 2021 at 10:49:18AM +0200, Mike Rapoport wrote:
> > > 
> > > > It is unsafe to allow saving of secretmem areas to the
> > > > hibernation snapshot as they would be visible after the resume
> > > > and this essentially will defeat the purpose of secret memory
> > > > mappings.
> > > 
> > > Sorry for being a bit late to this - from the point of view of
> > > running processes (and even the kernel once resume is complete),
> > > hibernation is effectively equivalent to suspend to RAM. Why do
> > > they need to be handled differently here?
> > 
> > Hibernation leaves a copy of the data on the disk which we want to
> > prevent.
> 
> Why not document that users should use data at rest protection
> mechanisms for their hibernation device? Just because secretmem can't
> assert its disclosure guarantee does not mean the hibernation device
> is untrustworthy.

It's not just data at rest.  Part of the running security guarantees
are that the kernel never gets access to the data.  To support
hibernate and swap we have to break that, so it reduces the runtime
security posture as well as the data at rest one.

This argues we could do it with a per region flags (something like less
secure or more secure mappings), but when you give users that choice
most of them rarely choose less secure.

James



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
