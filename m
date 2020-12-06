Return-Path: <SRS0=JF02=FK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C27C4361B
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Dec 2020 11:30:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE77922E03
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Dec 2020 11:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE77922E03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aPOnaiANp+scTl4CELk0fbmrO3n5g0Jj0YQ/A9aPDdI=; b=onAxF9ZBAZ1QMpxSq8EACR+u1
	VSGkqJxK8RVY/JRqPJPlFv7MqXBj41S4matvVRTvUcVvnGn2Cya3w7Kc076PewKqVMiGVJ8QzyTGX
	Ou6mtrXOaIhlxOSKar8xFiXsxVDt0BOsjdkxC/Vs+IHF6JiKvAWt7lOniub8vuizmH/M/nuzI/MCI
	0ah/EWDYZMcGsfyWn6qCcc8xLYHLvUlIifndPaQmRvR4WZNcIJKa2NAfTYTVMfPDFD0yVtdINzRyz
	A5iDmy9cRFuh8fqgphnhx/vaayTLLWmpOPWyPnU9jP2Wvn+BRikyXNFe0AxGFddoy3cM3s0ZJf0sr
	PYGApZOvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klsFJ-0005c5-RY; Sun, 06 Dec 2020 11:30:29 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klsFD-0005bS-4e; Sun, 06 Dec 2020 11:30:23 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B6B2ZE7100701; Sun, 6 Dec 2020 06:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=sTdeJYkg7s4jW58KjlXSO7YK0Uj/BAuS89bh+WjYExs=;
 b=Rp75CbhEeYCx5VHn/zmMQm/6S+m39d3Usre2min80jBkGcuIUAFLlD1U/x+1W8OWJjzt
 fIMqDyMisdQYl1mM9UyniGF2F3wozFBhPxC8o45xaq4jdyxerJ/476m3OKpNWyqX75Ot
 ZzHIhjFleohS0jG/BTw5yXvXzCYd99hKPpieya0mzuihgbkU/MAWYg+oHQUWV/VR679y
 Kd89sxaBExZT7E3BQljYIuSDAN6L4oWyttmbEubp0O3I6HjC9jWAiHlf70CcFuUqDoNe
 FV1XlQNsQrd7V/hGnlvfLCY1r7+QZ+WUan1OAetcBZbmpiv0Bnk27tfchh/UmmiiMr/D dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 358rby5k22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Dec 2020 06:29:52 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B6BP7Pa153868;
 Sun, 6 Dec 2020 06:29:52 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 358rby5k1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Dec 2020 06:29:51 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B6BRVQk019021;
 Sun, 6 Dec 2020 11:29:50 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8hkbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Dec 2020 11:29:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0B6BSWTZ56295740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 6 Dec 2020 11:28:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A4D9A404D;
 Sun,  6 Dec 2020 11:28:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1635A4040;
 Sun,  6 Dec 2020 11:28:28 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.50.18])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun,  6 Dec 2020 11:28:28 +0000 (GMT)
Date: Sun, 6 Dec 2020 13:28:26 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v14 04/10] set_memory: allow querying whether
 set_direct_map_*() is actually enabled
Message-ID: <20201206112826.GB123287@linux.ibm.com>
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-5-rppt@kernel.org>
 <20201203153610.724f40f26ca1620247bc6b09@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203153610.724f40f26ca1620247bc6b09@linux-foundation.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-06_06:2020-12-04,
 2020-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1
 impostorscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012060066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_063023_285875_9ED0A771 
X-CRM114-Status: GOOD (  30.03  )
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
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 03, 2020 at 03:36:10PM -0800, Andrew Morton wrote:
> On Thu,  3 Dec 2020 08:29:43 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > On arm64, set_direct_map_*() functions may return 0 without actually
> > changing the linear map. This behaviour can be controlled using kernel
> > parameters, so we need a way to determine at runtime whether calls to
> > set_direct_map_invalid_noflush() and set_direct_map_default_noflush() have
> > any effect.
> > 
> > Extend set_memory API with can_set_direct_map() function that allows
> > checking if calling set_direct_map_*() will actually change the page table,
> > replace several occurrences of open coded checks in arm64 with the new
> > function and provide a generic stub for architectures that always modify
> > page tables upon calls to set_direct_map APIs.
> > 
> > ...
> >
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/io.h>
> >  #include <linux/mm.h>
> >  #include <linux/vmalloc.h>
> > +#include <linux/set_memory.h>
> >  
> >  #include <asm/barrier.h>
> >  #include <asm/cputype.h>
> > @@ -477,7 +478,7 @@ static void __init map_mem(pgd_t *pgdp)
> >  	int flags = 0;
> >  	u64 i;
> >  
> > -	if (rodata_full || debug_pagealloc_enabled())
> > +	if (can_set_direct_map())
> >  		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
> 
> Changes in -next turned this into
> 
> 	if (can_set_direct_map() || crash_mem_map)

Thanks for updating!

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
