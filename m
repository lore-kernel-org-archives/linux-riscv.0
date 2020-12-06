Return-Path: <SRS0=JF02=FK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8B4C4361B
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Dec 2020 11:34:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A1ED22E03
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Dec 2020 11:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A1ED22E03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aXi4z3wrnwT3ZpelrFcpi+q4WrWrIfqLWXh5YwFMEzM=; b=hrCeDLbmgcbh4mfVUmCxE4wpS
	x83fEeZgmm2Mb2YOAUMatKUroMl65kKnB7CjaEVK5koz+As+YWTqClICMWjK63wJ+UqqNa4eMqqA0
	siu0I4cTG7/p1LN4/P21s2EI5WTYO1DyeU2+C5jDS/FMHs81eRZ7p+6w4+R7JOB1SigwaAmSICspZ
	KcKCRD6imgS8Itj25HQJeiQHIFGcdJDoyMXrBePeGd9XtcsjJzqt2gBUMYb2L24Cgr0hwdR8AXrvB
	kYb5mbxkmB3lI7Ei0E/F9DupoCB7ptegNZYVHv86A+U9KvCKRimT8W+y73oYPaqypttlhxNzPqEPv
	fqzt9/DJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klsIb-00063A-Ha; Sun, 06 Dec 2020 11:33:53 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klsIW-00062R-Qx; Sun, 06 Dec 2020 11:33:49 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B6BWEGF085086; Sun, 6 Dec 2020 06:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=uLfseV5BFzDmXMVMV/hSVrONSrIDY8EYPsZgh4LDO3w=;
 b=PyoHBTbfhHjuCF1oLDWBdxBcOWbCcrx0qLYyzv7yOnKgB8jexML7XfGkA98WvLEgdz9M
 5NVJEhCmmrIp3Cx/4wUBNFH/D12JYvRM6KGOh+zrPqK66oGPKD1sItX+hCPEy/g/dqx8
 1mmR3tykJNjL2hzRzO/O781IVtqWFJTVQvwgussGhs8iMkWv0vL1sYxGjdogh8qOVzX/
 SKGw534Doh9a4lhe7kZPaYQRhzkF3jPh5UqBUmeHv/oWgcvtpiXVn10MduwIQjXxq60m
 JJ3NaX0IoUFgCLFSlAYhKmodHgvNyY3naabX9laFI+MV677+t5cfrBEj9LnLb9HpaiTM Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 358rmxnm9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Dec 2020 06:33:30 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B6BXGjl087843;
 Sun, 6 Dec 2020 06:33:29 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 358rmxnm8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Dec 2020 06:33:29 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B6BVO6l024300;
 Sun, 6 Dec 2020 11:33:27 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8hkes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 06 Dec 2020 11:33:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B6BUtaN30933468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 6 Dec 2020 11:30:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F1ED4C046;
 Sun,  6 Dec 2020 11:30:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A6284C040;
 Sun,  6 Dec 2020 11:30:51 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.50.18])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun,  6 Dec 2020 11:30:51 +0000 (GMT)
Date: Sun, 6 Dec 2020 13:30:48 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v14 09/10] arch, mm: wire up memfd_secret system call
 were relevant
Message-ID: <20201206113048.GC123287@linux.ibm.com>
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-10-rppt@kernel.org>
 <20201203153916.91f0f80dcb8a0fa81fc341fa@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203153916.91f0f80dcb8a0fa81fc341fa@linux-foundation.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-06_06:2020-12-04,
 2020-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 mlxlogscore=802 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012060070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_063348_953846_ED6CDBDC 
X-CRM114-Status: GOOD (  23.41  )
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
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
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

On Thu, Dec 03, 2020 at 03:39:16PM -0800, Andrew Morton wrote:
> On Thu,  3 Dec 2020 08:29:48 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Wire up memfd_secret system call on architectures that define
> > ARCH_HAS_SET_DIRECT_MAP, namely arm64, risc-v and x86.
> > 
> > ...
> >
> > --- a/include/uapi/asm-generic/unistd.h
> > +++ b/include/uapi/asm-generic/unistd.h
> > @@ -861,9 +861,13 @@ __SYSCALL(__NR_faccessat2, sys_faccessat2)
> >  __SYSCALL(__NR_process_madvise, sys_process_madvise)
> >  #define __NR_watch_mount 441
> >  __SYSCALL(__NR_watch_mount, sys_watch_mount)
> > +#ifdef __ARCH_WANT_MEMFD_SECRET
> > +#define __NR_memfd_secret 442
> > +__SYSCALL(__NR_memfd_secret, sys_memfd_secret)
> > +#endif
> 
> Why do we add the ifdef?  Can't we simply define the syscall on all
> architectures and let sys_ni do its thing?
 
I quite blindly copied it from clone3. I agree there is no real need for
it and sys_ni handles this just fine.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
