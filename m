Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FCEC4727C
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 13:06:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA7020848
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 13:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aBB9re1m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkoEdNeB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEA7020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sxS12hD/oCv9OFaZnH1BjQlUJMxU5a68vts5Bn3wHss=; b=aBB9re1miwUnt2l2Dx6CY/nDe
	7lQjmaN34K1mguKDk2MKqmu9twtnGHrSX48CEp8ofmywUoeC7l/xAqvfIv0pnbCm4Z/Liou0xTxMw
	xNrQkxIGt3p/EYEdiJYU12HRGWZ/2bazLcSJ2mKTmFalwijhJuKQPf68XeYJb3SCPmK6xRuDqZdGQ
	rP4/Z5RLPCcbOvKlUHKwdGFgKjUrYA7jBaJHjbn3ULzbKXYD8nx4UY+LvnzN8PF6Oj7wJiUP+mQi5
	+0jB0SGJseVBqzCM7mPQ4ww3+VbJz2VfG7zWMI7mm1BQebB8Sz8bIh4VPjnUcIxsrW8Nu8vxSiJAD
	oK2rdrteQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFL6-0003Nv-D5; Tue, 29 Sep 2020 13:06:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFKq-0003HG-IC; Tue, 29 Sep 2020 13:06:28 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DAC8207F7;
 Tue, 29 Sep 2020 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601384783;
 bh=dKs40EB0zUNqF3k8hOXDHChpW1qE+Tc5ZCaCj+fNcAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kkoEdNeBwGUh5IVOWlI3TdmyaJCGl1uUtrsv4V7euPJfzeGsgVr9508rpCKlka84A
 TsDcDOdrDS9A4AaYCoyZ7lmCOsiredZMHpJsZ/ljNuc5atPQsZJCW42/ujWY54vc/A
 xHI6TcUVFoTK32LTlL0E1IvYKnm9SRUNQXn1aIps=
Date: Tue, 29 Sep 2020 16:06:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v6 3/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20200929130602.GF2142832@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-4-rppt@kernel.org>
 <d466e1f13ff615332fe1f513f6c1d763db28bd9a.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d466e1f13ff615332fe1f513f6c1d763db28bd9a.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_090624_806229_55751195 
X-CRM114-Status: GOOD (  21.89  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "david@redhat.com" <david@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "cl@linux.com" <cl@linux.com>,
 "idan.yaniv@ibm.com" <idan.yaniv@ibm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "Reshetova,
 Elena" <elena.reshetova@intel.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "tycho@tycho.ws" <tycho@tycho.ws>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "shuah@kernel.org" <shuah@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "mtk.manpages@gmail.com" <mtk.manpages@gmail.com>,
 "will@kernel.org" <will@kernel.org>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>, "Williams,
 Dan J" <dan.j.williams@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2020 at 04:58:44AM +0000, Edgecombe, Rick P wrote:
> On Thu, 2020-09-24 at 16:29 +0300, Mike Rapoport wrote:
> > Introduce "memfd_secret" system call with the ability to create
> > memory
> > areas visible only in the context of the owning process and not
> > mapped not
> > only to other processes but in the kernel page tables as well.
> > 
> > The user will create a file descriptor using the memfd_secret()
> > system call
> > where flags supplied as a parameter to this system call will define
> > the
> > desired protection mode for the memory associated with that file
> > descriptor.
> > 
> >  Currently there are two protection modes:
> > 
> > * exclusive - the memory area is unmapped from the kernel direct map
> > and it
> >               is present only in the page tables of the owning mm.
> 
> Seems like there were some concerns raised around direct map
> efficiency, but in case you are going to rework this...how does this
> memory work for the existing kernel functionality that does things like
> this?
> 
> get_user_pages(, &page);
> ptr = kmap(page);
> foo = *ptr;
> 
> Not sure if I'm missing something, but I think apps could cause the
> kernel to access a not-present page and oops.

The idea is that this memory should not be accessible by the kernel, so
the sequence you describe should indeed fail.

Probably oops would be to noisy and in this case the report needs to be
less verbose.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
