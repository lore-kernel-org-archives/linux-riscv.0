Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD89C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:56:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35FB64FA3
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D35FB64FA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PERRtZf+mXn+QWgtoD3PHdsTP3fMnqT4JGWeETdyIVM=; b=C3YDmwFgzSAOv1veLykVRapoK7
	FN22bC7U/MYBCB1o1O3qsjmMStt8Wg/8VA3FtVeyx4j8PJKgQca4/k/2VFUDUXvUK3QzyBx4slpra
	ffa2rg1r4aR0WEqE720jI/f88M2zlWqwC39U0sEl5Sy9BxFdSmaRuGAHXFnGfru2Wp5jKAL32r55g
	46fw9vzzeGGnFOn+RRFNc5YovqjR987V1jbA2f4hRggqkqGRuzYeDGGfF0gsTh9SUMCGDg7JzqS4K
	fxyRtD8MB8Z8kW77c/VNjvNvRjTNBAN4wqKU8NB1hjSN2s/ylXc9aEdW494Z/+0YyOCtvDkLWpQlZ
	v7uemTwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70qp-0008Hu-3b; Tue, 02 Feb 2021 18:56:35 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70ql-0008Gf-7z; Tue, 02 Feb 2021 18:56:32 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112Iqm6i191657; Tue, 2 Feb 2021 13:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=f9zxCUw4M03BQ4ynBUOKWIG13PioNXDzHmOyFa7Yr50=;
 b=tGajUAV7nYMnOgvJ5XNDB+HPM04G6aJ4uyjJERBKE6JseyoiPK4ybLmz+xUMeF8A3ZvV
 9CfgO1s4p/sWRTklZ/KBtXbyyaPSzcfHlGVLfsiesYbCjVINSb+2+ZSghFuAtlP+5PYP
 1tDcLnZhDFH4d67b0vpQDKhAQj5nPXzfzvVe2pWz6p1vmBP5dlo0H/g8bmWucwiktluQ
 4dF2nFgI9gYwGl5wdHr2aEN9XgChXUJmOhGJKG7TPXfSW1tejjZNletMaQBAMopJusM2
 WhMHFRJU7YZhPmNPJYYNTpO+11nR6aUDaj7QMRSQAP9T67mCdO2bXla32F4Zi+GZHxSP dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36fcd60231-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 13:55:51 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 112Ir8MT196513;
 Tue, 2 Feb 2021 13:55:51 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36fcd6022n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 13:55:50 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112IkXHS016248;
 Tue, 2 Feb 2021 18:55:50 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 36eyucmt0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 18:55:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 112ItlXY24641948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 18:55:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E42A67805C;
 Tue,  2 Feb 2021 18:55:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E0857805E;
 Tue,  2 Feb 2021 18:55:41 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.153.205])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 18:55:41 +0000 (GMT)
Message-ID: <f26a17366194880d58e67d10cb5d7d7fdf2f3c19.camel@linux.ibm.com>
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
From: James Bottomley <jejb@linux.ibm.com>
To: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>
Date: Tue, 02 Feb 2021 10:55:40 -0800
In-Reply-To: <20210202181546.GO242749@kernel.org>
References: <6de6b9f9c2d28eecc494e7db6ffbedc262317e11.camel@linux.ibm.com>
 <YBkcyQsky2scjEcP@dhcp22.suse.cz> <20210202124857.GN242749@kernel.org>
 <6653288a-dd02-f9de-ef6a-e8d567d71d53@redhat.com>
 <YBlUXdwV93xMIff6@dhcp22.suse.cz>
 <211f0214-1868-a5be-9428-7acfc3b73993@redhat.com>
 <YBlgCl8MQuuII22w@dhcp22.suse.cz>
 <d4fe580a-ef0e-e13f-9ee4-16fb8b6d65dd@redhat.com>
 <YBlicIupOyPF9f3D@dhcp22.suse.cz>
 <95625b83-f7e2-b27a-2b99-d231338047fb@redhat.com>
 <20210202181546.GO242749@kernel.org>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_09:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=530
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_135631_363921_2C24106F 
X-CRM114-Status: GOOD (  35.94  )
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

On Tue, 2021-02-02 at 20:15 +0200, Mike Rapoport wrote:
> On Tue, Feb 02, 2021 at 03:34:29PM +0100, David Hildenbrand wrote:
> > On 02.02.21 15:32, Michal Hocko wrote:
> > > On Tue 02-02-21 15:26:20, David Hildenbrand wrote:
> > > > On 02.02.21 15:22, Michal Hocko wrote:
> > > > > On Tue 02-02-21 15:12:21, David Hildenbrand wrote:
> > > > > [...]
> > > > > > I think secretmem behaves much more like longterm GUP right
> > > > > > now
> > > > > > ("unmigratable", "lifetime controlled by user space",
> > > > > > "cannot go on
> > > > > > CMA/ZONE_MOVABLE"). I'd either want to reasonably well
> > > > > > control/limit it or
> > > > > > make it behave more like mlocked pages.
> > > > > 
> > > > > I thought I have already asked but I must have forgotten. Is
> > > > > there any
> > > > > actual reason why the memory is not movable? Timing attacks?
> > > > 
> > > > I think the reason is simple: no direct map, no copying of
> > > > memory.
> > > 
> > > This is an implementation detail though and not something
> > > terribly hard
> > > to add on top later on. I was more worried there would be really
> > > fundamental reason why this is not possible. E.g. security
> > > implications.
> > 
> > I don't remember all the details. Let's see what Mike thinks
> > regarding
> > migration (e.g., security concerns).
> 
> Thanks for considering me a security expert :-)
> 
> Yet, I cannot estimate how dangerous is the temporal exposure of
> this data to the kernel via the direct map in the simple
> map/copy/unmap
> sequence.

Well the safest security statement is that we never expose the data to
the kernel because it's a very clean security statement and easy to
enforce.  It's also the easiest threat model to analyse.   Once we do
start exposing the secret to the kernel it alters the threat profile
and the analysis and obviously potentially provides the ROP gadget to
an attacker to do the same.  Instinct tells me that the loss of
security doesn't really make up for the ability to swap or migrate but
if there were a case for doing the latter, it would have to be a
security policy of the user (i.e. a user should be able to decide their
data is too sensitive to expose to the kernel).

> More secure way would be to map source and destination in a different
> page table rather than in the direct map, similarly to the way
> text_poke() on x86 does.

I think doing this would have much less of an impact on the security
posture because it's already theoretically possible to have kmap
restore access to the kernel.

James


> I've left the migration callback empty for now because it can be
> added on top and its implementation would depend on the way we do (or
> do not do) pooling.
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
