Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FFCC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 09:06:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BA722242
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 09:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bovSRcLE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6pQeRtZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86BA722242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+p2sHlSkoFARfn3sO+acitlzvIEscv3zhQfQ2J16uUY=; b=bovSRcLEXVjUZ4EXrHBDcp0qw
	/KyrFS2Yi5XS/1voJVzO/SJZCONetCBfM/aQ0bVyk8PL12Y6gc29RMLNzbKEbFzoEOsQd/s4cuvIj
	YcY3QgJ4k+BJza0yOFGaxGE4Vdglu3AnvWAx9Ih2YF3yesj1ZWS2soaTW22vdA9+8IXTXKKyPvpmt
	50tzjD3vlM7L/3uRrrvQYalo1emZz6nkrg5i9ESkg1kmQZyPTaKpAkCHK76czH2zju+EfQNrm2JPX
	g1YdN2OCqUbJiwdDIWnBWsC26fYysY4QEXjVgoON+PxRKKxaY7M1eMqCjQ8IN1uuFtFRPrhcCUD5B
	GDFfCrHhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWyRq-0006dp-4g; Mon, 26 Oct 2020 09:05:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWyRk-0006bs-W6; Mon, 26 Oct 2020 09:05:46 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F28122242;
 Mon, 26 Oct 2020 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603703144;
 bh=qV1j3o8b5aO+jtdBDoJyX5701vJJcUPPuK5bWgUroMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n6pQeRtZ1dQZQwNLzcRvocBVxWOThQ2A3ohdsbB1ku0q9Z1z2DOVNvIaiR/xbrSRK
 5zQtm2aEbLsKv3mU1aC9GYppS4t99gNCuK2wQoR74ofGRKXtqAOsYTKvXA+WFU2Lid
 njOARSpftIz0V7Pd9Gh+IjN51p6qFKYl2MBmmm2s=
Date: Mon, 26 Oct 2020 11:05:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Message-ID: <20201026090526.GA1154158@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_050545_449402_ACFA75C1 
X-CRM114-Status: GOOD (  16.10  )
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
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "david@redhat.com" <david@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "cl@linux.com" <cl@linux.com>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "x86@kernel.org" <x86@kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rientjes@google.com" <rientjes@google.com>, "Brown,
 Len" <len.brown@intel.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 01:13:52AM +0000, Edgecombe, Rick P wrote:
> On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > Indeed, for architectures that define CONFIG_ARCH_HAS_SET_DIRECT_MAP
> > it is
> > possible that __kernel_map_pages() would fail, but since this
> > function is
> > void, the failure will go unnoticed.
> 
> Could you elaborate on how this could happen? Do you mean during
> runtime today or if something new was introduced?

A failure in__kernel_map_pages() may happen today. For instance, on x86
if the kernel is built with DEBUG_PAGEALLOC.

	__kernel_map_pages(page, 1, 0);

will need to split, say, 2M page and during the split an allocation of
page table could fail.

Currently, the only user of __kernel_map_pages() outside DEBUG_PAGEALLOC
is hibernation, but I think it would be safer to entirely prevent usage
of __kernel_map_pages() when DEBUG_PAGEALLOC=n.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
