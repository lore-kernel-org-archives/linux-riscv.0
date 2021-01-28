Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401EEC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 21:06:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D964464DDB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 21:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D964464DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hd6Gea1InvC+9psJom0qntHplKeu+pxaZQC9T117Q5Y=; b=DjQg4rwKCGDz4ATSEDUtdgq+m4
	D1H02Z7epAbUAU8WBSEQAzDez/yFRBzX/WRKp/dkrDBYVGCNDVaJ8EHqKNNGW3V3e6lodGr99BZ1b
	y0FcHdB8q6KCY8w7jrXxTglWi3YwvzdGfsD6NyC05IOLvBVtDxKQwRdPoPQCtwnZpKYUzt+9oOF2n
	HEN+aG5VfRdCoumYe2+U5/iPJR/t59JJHhLGaPn2SNmmJ2tq1q/BG1NQoMUbUVApW38O7vD94NDjn
	soU5gQthUFky4KY1vfCEHTZfisRT4XdVkLlxbueFIqlb5KHZC1zEhntWjTvrVfH8ENPw0/arlCBgm
	dbV5xR+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5EUG-0006km-LH; Thu, 28 Jan 2021 21:05:56 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5EUC-0006jz-Fq; Thu, 28 Jan 2021 21:05:53 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SL1dJf127066; Thu, 28 Jan 2021 16:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=bpUTcXPeXWH0uCpR0CReuSqLBN7qKOd8RBfv7PAKG14=;
 b=cgL4eeLInzOWENu3PUE8gW1uebW9ootUk9Cacy40GwqzTQAH7KOmGHlmRcO+gPDUjj8U
 Ng8GA3Fi25GHsaCyIq8H+HQGpXWxvdbZgbr0KJOaaYsL0PUK876/2Puau7XeJTQCl4ZF
 HqSzSURQMQLdj5pTQMeGVFnsNPLlCu4ZTsK/E4Df1N2bRndbeu6D7oid4Wmpf4UhhFKC
 5ohg2Jqb3Vz3a6ntiK5SjP38X1Gjkba8HCL8MVWE7N8kOEdjSKlWLU1BxfjjO05lS+Mv
 Mdr+jdbupdB+frROL90k0GdYDEwzmPr0b6BmHf0aO51cF/o6+s5+hm+XhdWCvQkxwU7T ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c3d3aa6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 16:05:15 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SL2rJ7131704;
 Thu, 28 Jan 2021 16:05:14 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c3d3aa5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 16:05:14 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SKqhG1019569;
 Thu, 28 Jan 2021 21:05:12 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 368be9t6w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 21:05:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SL5B3Y11862404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 21:05:11 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2882F7805C;
 Thu, 28 Jan 2021 21:05:11 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EFAE78068;
 Thu, 28 Jan 2021 21:05:04 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.133.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 21:05:03 +0000 (GMT)
Message-ID: <73738cda43236b5ac2714e228af362b67a712f5d.camel@linux.ibm.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
From: James Bottomley <jejb@linux.ibm.com>
To: Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>
Date: Thu, 28 Jan 2021 13:05:02 -0800
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
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=911
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_160552_663328_CC8601B3 
X-CRM114-Status: GOOD (  27.90  )
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
> > I like the idea to have a pool as an optimization rather than a
> > hard requirement but I don't see why would it need a careful access
> > control. As the direct map fragmentation is not necessarily
> > degrades the performance (and even sometimes it actually improves
> > it) and even then the degradation is small, trying a PMD_ORDER
> > allocation for a pool and then falling back to 4K page may be just
> > fine.
> 
> Well, as soon as this is a scarce resource then an access control
> seems like a first thing to think of. Maybe it is not really
> necessary but then this should be really justified.

The control for the resource is effectively the rlimit today.  I don't
think dividing the world into people who can and can't use secret
memory would be useful since the design is to be usable for anyone who
might have a secret to keep; it would become like the kvm group
permissions: something which is theoretically an access control but
which in practise is given to everyone on the system.

> I am also still not sure why this whole thing is not just a
> ramdisk/ramfs which happens to unmap its pages from the direct
> map. Wouldn't that be a much more easier model to work with? You
> would get an access control for free as well.

The original API was a memfd which does have this access control as
well.  However, the decision was made after much discussion to go with
a new system call instead.  Obviously the API choice could be revisited
but do you have anything to add over the previous discussion, or is
this just to get your access control?

James



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
