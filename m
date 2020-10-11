Return-Path: <SRS0=iHCa=DS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4FAC433DF
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2020 09:43:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B108E2083B
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2020 09:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NHqYLE79";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyVAztyf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B108E2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K9NElGNYy7ycwckz7Kb26shqmifSFDSgxUfKRDRNGMg=; b=NHqYLE79ePjTrYoFOoTurYl3A
	PXOrSARm5ThnKN5BObVx7B8DXIS2d5J+R4y61F9v8+yU/xZoK2v9363ZznPcZptS5oTzB3/r3Au35
	YJwZ3l8zBqeoRbmwQmf4Q7sCKh+zrYmMkNZFgQJIe0zXZrYBbtVa9S6qBu0dlCwVBkSfZVh9rSIsS
	KW0fPo2AInMAnUt9Yowh63XVoPONwPJWKER3618ICehvER/gEpXhlZM79MawSLxLWNiH4h+qWRHCY
	WsJPQloAFXmDdZywouX84ONVxt0GqatSDCRSjg3Are+WC0TmoYlB8e9ELdL/Epb/nrNHmPiHpnQJI
	wwihClA1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRXst-00052j-Ro; Sun, 11 Oct 2020 09:43:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRXso-00051A-5V; Sun, 11 Oct 2020 09:43:15 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CC9D207FB;
 Sun, 11 Oct 2020 09:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602409392;
 bh=JEb/p0JIeDwreayr/694lmHvSiZFhmLJTNKc6RgoUB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GyVAztyffWGroLTBwFkigZ5sS434B8V3s8XU67kyKeRb2YvnrpxN1017L7nppODmP
 HOneZWpbWwQWUpDOo1rOsiJ1syiGbCKA8zOTjnkbk43GyDZ5DFJ6mzTbvMJFiwGbka
 Re+K4LSoEoUz5cn+1C6SOXqPmDeAvZpRR5Sz0gkM=
Date: Sun, 11 Oct 2020 12:42:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v6 3/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <20201011094255.GB4251@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <20200924132904.1391-4-rppt@kernel.org>
 <d466e1f13ff615332fe1f513f6c1d763db28bd9a.camel@intel.com>
 <20200929130602.GF2142832@kernel.org>
 <839fbb26254dc9932dcff3c48a3a4ab038c016ea.camel@intel.com>
 <20200930103507.GK2142832@kernel.org>
 <b5d8e90c5366a42e7ad0a337fba5f2b1bcfe52c2.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5d8e90c5366a42e7ad0a337fba5f2b1bcfe52c2.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_054314_411930_E410BB46 
X-CRM114-Status: GOOD (  17.95  )
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
 "shuah@kernel.org" <shuah@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Reshetova,
 Elena" <elena.reshetova@intel.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "tycho@tycho.ws" <tycho@tycho.ws>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "idan.yaniv@ibm.com" <idan.yaniv@ibm.com>, "x86@kernel.org" <x86@kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "mtk.manpages@gmail.com" <mtk.manpages@gmail.com>,
 "will@kernel.org" <will@kernel.org>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
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

On Wed, Sep 30, 2020 at 08:11:28PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2020-09-30 at 13:35 +0300, Mike Rapoport wrote:
> > 
> > Our thinking was that copy_*user() would work in the context of the
> > process that "owns" the secretmem and gup() would not allow access in
> > general, unless requested with certail (yet another) FOLL_ flag.
> 
> Hmm, yes. I think one easier thing about this design over the series
> Kirill sent out is that the actual page will never transition to and
> from unmapped while it's mapped in userspace. If it could transition,
> you'd have to worry about a race window between
> get_user_pages(FOLL_foo) and the kmap() where the page might get
> unmapped.
> 
> Without the ability to transition pages though, using this for KVM
> guests memory remains a not completely worked through problem since it
> has the get_user_pages()/kmap() pattern quite a bit. Did you have an
> idea for that? (I thought I saw that use case mentioned somewhere).
 
I've mentioned the KVM usecase because it was dicussed at the hallway
track at KVM Forum last year and also after looking at Kirill's patches
I though that "KVM protected" memory could be implemented on top of
secretmem. Can't say I have enough expertise in KVM to have a completely
worked through solution for that.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
