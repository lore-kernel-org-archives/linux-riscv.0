Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E00E6748F
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 00:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4yi6LZuZ+cg33FFKS+ILJjRY64yyly/UcEOFiMcNTEw=; b=eiJvqemzxxUkwZ
	m0XHPJfY8s5jt30wkNjv//r9e/+N7tj035pzpMe/pSPdDgAPjN4Hv95bvmw+49ZC1Bm0vCi62R/bQ
	IHH36S4xUBdiHcgJPXclqrl+AQrePLMwB3494CNJLQN6sN4EyF7Cs+RzFA5yz8r032PkuFfueMApg
	ECf7XU+jyuHmAdE/O5E7ynIo3EZAWLmLvNVnZ5NzaKBqgAVeL2ibwqEpt5Z3iOJs8P+r9vAymGYr2
	yWUwA7qDVbqLhQfQOeM9pcPNW18R5rjBpzjj256K/dH4WPUlHLfNWT7yGn1biearTGGHoy70nyrCI
	C2zOpMIfExjVV75iaLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fFA-00000005Fzb-26hI;
	Fri, 01 Nov 2024 00:10:24 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fF6-00000005Fxt-2GGE;
	Fri, 01 Nov 2024 00:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730419820; x=1761955820;
  h=message-id:date:mime-version:to:cc:references:subject:
   from:in-reply-to:content-transfer-encoding;
  bh=jNxyG945mWZFitSBBl3P/Pi37LkMXgLexJ4MyYO00SI=;
  b=Cz5AL+tMSUdkhLJsjnm2DSkO7OodAzXLu+fb710BZ+G3bB8I0R53bIVl
   OQC51RbHtZv/URfImCiVfIEYAlDwGdT1+OF3R3qZMccjMjrlsiKD4kG0A
   UU4YpmSUr70iFpBIMooZOUx+KQd/rgLe3nnMG50+GbBPp57jvGNWkyjAf
   Y=;
X-IronPort-AV: E=Sophos;i="6.11,248,1725321600"; 
   d="scan'208";a="381598034"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 00:10:17 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.7.35:3117]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.158:2525] with esmtp (Farcaster)
 id 9403627f-3ea8-485f-95a8-ff158371f477; Fri, 1 Nov 2024 00:10:16 +0000 (UTC)
X-Farcaster-Flow-ID: 9403627f-3ea8-485f-95a8-ff158371f477
Received: from EX19D003UWC002.ant.amazon.com (10.13.138.169) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 1 Nov 2024 00:10:15 +0000
Received: from [192.168.20.174] (10.106.101.30) by
 EX19D003UWC002.ant.amazon.com (10.13.138.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Fri, 1 Nov 2024 00:10:12 +0000
Message-ID: <2233397c-f423-40e3-8546-728b50ce0489@amazon.com>
Date: Thu, 31 Oct 2024 17:10:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <roypat@amazon.co.uk>
References: <27646c08-f724-49f7-9f45-d03bad500219@amazon.co.uk>
Subject: Re: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Content-Language: en-US
From: "Manwaring, Derek" <derekmn@amazon.com>
In-Reply-To: <27646c08-f724-49f7-9f45-d03bad500219@amazon.co.uk>
X-Originating-IP: [10.106.101.30]
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D003UWC002.ant.amazon.com (10.13.138.169)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_171020_664964_F9449627 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: jthoughton@google.com, luto@kernel.org, kvm@vger.kernel.org, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, kalyazin@amazon.com, svens@linux.ibm.com, linux-mm@kvack.org, pbonzini@redhat.com, linux-kselftest@vger.kernel.org, hpa@zytor.com, kernel@xen0n.name, shuah@kernel.org, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, corbet@lwn.net, will@kernel.org, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, mingo@redhat.com, tabba@google.com, mathieu.desnoyers@efficios.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, linux-trace-kernel@vger.kernel.org, jgowans@amazon.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org, ackerleytng@google.com, xmarcalx@amazon.com, bp@alien8.de, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, x86@kernel.org, seanjc@google.com, derekmn@amazon.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, graf@amazon.com, vannapurve@google.com, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024-10-31 at 10:42+0000 Patrick Roy wrote:
> On Thu, 2024-10-31 at 09:50 +0000, David Hildenbrand wrote:
> > On 30.10.24 14:49, Patrick Roy wrote:
> >> Most significantly, I've reduced the patch series to focus only on
> >> direct map removal for guest_memfd for now, leaving the whole "how to do
> >> non-CoCo VMs in guest_memfd" for later. If this separation is
> >> acceptable, then I think I can drop the RFC tag in the next revision
> >> (I've mainly kept it here because I'm not entirely sure what to do with
> >> patches 3 and 4).
> >
> > Hi,
> >
> > keeping upcoming "shared and private memory in guest_memfd" in mind, I
> > assume the focus would be to only remove the direct map for private memory?
> >
> > So in the current upstream state, you would only be removing the direct
> > map for private memory, currently translating to "encrypted"/"protected"
> > memory that is inaccessible either way already.
> >
> > Correct?
>
> Yea, with the upcomming "shared and private" stuff, I would expect the
> the shared<->private conversions would call the routines from patch 3 to
> restore direct map entries on private->shared, and zap them on
> shared->private.
>
> But as you said, the current upstream state has no notion of "shared"
> memory in guest_memfd, so everything is private and thus everything is
> direct map removed (although it is indeed already inaccessible anyway
> for TDX and friends. That's what makes this patch series a bit awkward
> :( )

TDX and SEV encryption happens between the core and main memory, so
cached guest data we're most concerned about for transient execution
attacks isn't necessarily inaccessible.

I'd be interested what Intel, AMD, and other folks think on this, but I
think direct map removal is worthwhile for CoCo cases as well.

Derek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
