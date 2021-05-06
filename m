Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75B6C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 15:29:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A7C361C22
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 15:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A7C361C22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EI27yhPSKDoRrWjXCVkmujIM7gunXbbk0jTwwjSGM9A=; b=AwBYNEYDcw0k+DsKBi8kdsBY52
	RvcqRpMyNBWxibf3djW7euBPFXCqlz1v+HYRwUOyW6rxtJApCHEQTKYcH8VvTj7nqWSMRN1Ktb7bN
	GvPx4y0lmxW5NrGRtHqN2s83kVOGUwdQwKYM0BU+haVlvvxa/ygEJDvnAgQ8cQRWwK7ShS9psJt04
	XTg9TcMf8NY8PtUdGZe7R5jvd7KXDP2nxjtZ9dMLcnFAW22Rq1o+ksr72kp5Kw305UcYRSKLP3GAT
	LKtFxS5e6yr6Wm+QLu8l2YRypGhxZFBuub8i19pxdQJgWBL3GVXyPqcocTYBgaonAeek9Z+UieJGR
	KdpvWIhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lefwA-004Yu4-F5; Thu, 06 May 2021 15:29:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lefuV-004Y7C-PF; Thu, 06 May 2021 15:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:Reply-To:From:
 Subject:Message-ID:Sender:Content-ID:Content-Description;
 bh=sjoZoiMhBl/YeAs7nylvrqucKRtz6t+UYFLBf4hwx58=; b=ynaXuX+RJ7W6bRiOA2to6LtLEO
 /0OMHZHgLwzNz556el7fkFp/pA+4Laq6GSRMT2e9RrHq9wsia9fu5euXFadCv+ehH8GP3RsnXiLCR
 8eosiogWcQK+LbUsqsa4V0LfEuFGMkXRuieRmoVRyT6kKPptG1KhQy+UdEAyZd32171gmELWFLn5C
 a85MnaKAqYV70BNSIHgo4PY5K0axj747v1PcoYRSsqlTO9KQKHyi9qNFlFzcWa/tM1S09IF3mNnNd
 e5AdH0VAMruUPW+1tAPZ7/byQnDr986AM4xRe0v92kfV7IHcrIrUoKJY5noCYeoBqmrE3KCidTPz6
 rU7oGPuQ==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lefuS-0069CX-V9; Thu, 06 May 2021 15:27:30 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 146F6QQk151323; Thu, 6 May 2021 11:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=sjoZoiMhBl/YeAs7nylvrqucKRtz6t+UYFLBf4hwx58=;
 b=HNnR1WbtcErDOmskKqlTooqNTP1IivLAtx4QS4CKp6cKX+kgP4zQvoFZWL5AVg264ZTj
 /8JlRuQgWTJqNrDCfS3qB6iutm3wRUwNb5gT6wRvkj7xEihLZiVwqPsEQ8ad6kAutzc1
 vWXExVZgy6ss+xtA+6SYXg/ZOVdbIsgx2CKiIb7wGnIwmvj1GGrO7ifiBh9RhnmDdNoJ
 LMoRMK0OqojDRTYJuBf4qF8l+Q7nlnlOocgvLdq3bMaE1Oq4M0+Eg7+ihwCtwfSxcest
 1EoxjQ/XX+Q78+58ZXnBQCbBu5x4dPi1zM0YuMj7+PuRZF52CyumY9KDrfdHysz7ZluW Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38cjhps4q7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 11:26:58 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 146F7KKD161033;
 Thu, 6 May 2021 11:26:58 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38cjhps4pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 11:26:57 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 146FLr4I023803;
 Thu, 6 May 2021 15:26:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 38bedtysuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 15:26:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 146FQtK516646530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 15:26:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71AB07805E;
 Thu,  6 May 2021 15:26:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50AA17805C;
 Thu,  6 May 2021 15:26:43 +0000 (GMT)
Received: from jarvis (unknown [9.80.192.238])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 May 2021 15:26:42 +0000 (GMT)
Message-ID: <de27bfae0f4fdcbb0bb4ad17ec5aeffcd774c44b.camel@linux.ibm.com>
Subject: Re: [PATCH v18 0/9] mm: introduce memfd_secret system call to
 create "secret" memory areas
From: James Bottomley <jejb@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christopher
 Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Matthew Wilcox <willy@infradead.org>, Matthew
 Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>, Michal
 Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>, Michael
 Kerrisk <mtk.manpages@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>, Shakeel Butt
 <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>, Will Deacon
 <will@kernel.org>, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Date: Thu, 06 May 2021 08:26:41 -0700
In-Reply-To: <20210505120806.abfd4ee657ccabf2f221a0eb@linux-foundation.org>
References: <20210303162209.8609-1-rppt@kernel.org>
 <20210505120806.abfd4ee657ccabf2f221a0eb@linux-foundation.org>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HbXsy0ifNJ0qG09HbRm_LXazjxQbp5n0
X-Proofpoint-ORIG-GUID: DJupxtqPHyyQ3Z1xYY6MEK2xJzvjhhcP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_10:2021-05-06,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_082729_021635_368CEA97 
X-CRM114-Status: GOOD (  38.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 2021-05-05 at 12:08 -0700, Andrew Morton wrote:
> On Wed,  3 Mar 2021 18:22:00 +0200 Mike Rapoport <rppt@kernel.org>
> wrote:
> 
> > This is an implementation of "secret" mappings backed by a file
> > descriptor.
> > 
> > The file descriptor backing secret memory mappings is created using
> > a dedicated memfd_secret system call The desired protection mode
> > for the memory is configured using flags parameter of the system
> > call. The mmap() of the file descriptor created with memfd_secret()
> > will create a "secret" memory mapping. The pages in that mapping
> > will be marked as not present in the direct map and will be present
> > only in the page table of the owning mm.
> > 
> > Although normally Linux userspace mappings are protected from other
> > users, such secret mappings are useful for environments where a
> > hostile tenant is trying to trick the kernel into giving them
> > access to other tenants mappings.
> 
> I continue to struggle with this and I don't recall seeing much
> enthusiasm from others.  Perhaps we're all missing the value point
> and some additional selling is needed.
> 
> Am I correct in understanding that the overall direction here is to
> protect keys (and perhaps other things) from kernel bugs?  That if
> the kernel was bug-free then there would be no need for this
> feature?  If so, that's a bit sad.  But realistic I guess.

Secret memory really serves several purposes. The "increase the level
of difficulty of secret exfiltration" you describe.  And, as you say,
if the kernel were bug free this wouldn't be necessary.

But also:

   1. Memory safety for use space code.  Once the secret memory is
      allocated, the user can't accidentally pass it into the kernel to be
      transmitted somewhere.
   2. It also serves as a basis for context protection of virtual
      machines, but other groups are working on this aspect, and it is
      broadly similar to the secret exfiltration from the kernel problem.

> 
> Is this intended to protect keys/etc after the attacker has gained
> the ability to run arbitrary kernel-mode code?  If so, that seems
> optimistic, doesn't it?

Not exactly: there are many types of kernel attack, but mostly the
attacker either manages to effect a privilege escalation to root or
gets the ability to run a ROP gadget.  The object of this code is to be
completely secure against root trying to extract the secret (some what
similar to the lockdown idea), thus defeating privilege escalation and
to provide "sufficient" protection against ROP gadgets.

The ROP gadget thing needs more explanation: the usual defeatist
approach is to say that once the attacker gains the stack, they can do
anything because they can find enough ROP gadgets to be turing
complete.  However, in the real world, given the kernel stack size
limit and address space layout randomization making finding gadgets
really hard, usually the attacker gets one or at most two gadgets to
string together.  Not having any in-kernel primitive for accessing
secret memory means the one gadget ROP attack can't work.  Since the
only way to access secret memory is to reconstruct the missing mapping
entry, the attacker has to recover the physical page and insert a PTE
pointing to it in the kernel and then retrieve the contents.  That
takes at least three gadgets which is a level of difficulty beyond most
standard attacks.

> I think that a very complete description of the threats which this
> feature addresses would be helpful.  

It's designed to protect against three different threats:

   1. Detection of user secret memory mismanagement
   2. significant protection against privilege escalation
   3. enhanced protection (in conjunction with all the other in-kernel
      attack prevention systems) against ROP attacks.

Do you want us to add this to one of the patch descriptions?

James



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
