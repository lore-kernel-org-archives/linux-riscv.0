Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAA8C433E4
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 11:30:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D050622B4D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 11:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PZ6Xp0pX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D050622B4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z7siwlOSRNVvqkab7hgTbvpia2Wphww9zM6rv3TgoKM=; b=PZ6Xp0pXwu1RgMGFD/THZQf/N
	cR6sSbNVsRShSPvKH1jaFWWISKRYXOOdY3X2bZM02yM0QIGKOev7ofWHL65zVSD5SwNblS6nEsG5U
	Cqo+/AqVc1GZYW4KHlwo/BcpWp52/i+3Fo4JNOfAaYFV7R0UvvtmsOC61pqHiv3TV+6zVe4W204og
	PC+KCTp8TlGw51l6gRJ870Y9VoINz/tacLaOsY47eKFOCIdwKXbjU1OdxmdfH4apzDAUnXAAfJfpm
	THLXjseLlOg+TDgVKwJCqcODZcjIudDVRAGI6kye2begCjvVFM/SPc1GMz9KVbp11RhOGUSs49BNe
	eEloGJzAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxU0F-0002b8-1a; Mon, 20 Jul 2020 11:30:39 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxU0B-0002ZP-LM; Mon, 20 Jul 2020 11:30:36 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N0nSN-1kiSVn1pjh-00wocS; Mon, 20 Jul 2020 13:30:30 +0200
Received: by mail-qk1-f180.google.com with SMTP id l23so6990021qkk.0;
 Mon, 20 Jul 2020 04:30:30 -0700 (PDT)
X-Gm-Message-State: AOAM530dwZoa2jvZIGmKWBhwo3in+omQFongTouHmxrF65ZUc34PdRwZ
 1OK9A60xb1UmsDUoQGS8RN7eUh0h5/QlvnflX/s=
X-Google-Smtp-Source: ABdhPJybaWn8qrmG7q01lgvZCZBti2IcqiiH7/UJUKpkh5l1pzukFrbCvJJFdRaOz1n0M6O3nf2Yvp55077wbmpCEEY=
X-Received: by 2002:a05:620a:1654:: with SMTP id
 c20mr20996310qko.138.1595244629225; 
 Mon, 20 Jul 2020 04:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200720092435.17469-1-rppt@kernel.org>
 <20200720092435.17469-4-rppt@kernel.org>
In-Reply-To: <20200720092435.17469-4-rppt@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Jul 2020 13:30:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0NyvRMqH7X0YNO5E6DGtvZXD5ZcD6Y6n7AkocufkMnHA@mail.gmail.com>
Message-ID: <CAK8P3a0NyvRMqH7X0YNO5E6DGtvZXD5ZcD6Y6n7AkocufkMnHA@mail.gmail.com>
Subject: Re: [PATCH 3/6] mm: introduce secretmemfd system call to create
 "secret" memory areas
To: Mike Rapoport <rppt@kernel.org>
X-Provags-ID: V03:K1:gbT/h+u5hW8L3CrtzFSnaOyHkMeNxVO95Sp4aLgJf9SH+Nn0D3F
 cfcd02UCHVppS7c9vmktwUbYKWp59eOkOrxJP3sgM8gMmtQ47vdKJKF/6x8c97r8oFrnvWR
 Cip5wNXAkCiDc1Tk6IrSgbG3EdYphkpt/Ux513QBqEWU8es2p8FWiyw3Lmcvy0qwWHTxogG
 f98ZqeawZL7ZMO/EGs7UA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h5vvbeA5zgE=:IBZYPFJ+VsOEK3jUP4AVnC
 3piJwUadRAZAjpVlLV0IUCfZr540gXf9FhYyysZ/7lv16MmYfzX5sgxJSn5RzBO6HINqh+VY5
 OOAFQ33u4aP73ZRqgxFX+voqHhhUpMCTwk3KaPtO8MCxOcxi7QZ2KYAi1wJrjPn5gthc7ODWB
 rq9ATCDCgXzQjgzlNIr6ek87eyvgoNaC9isWhgUshgAoIooAzJ8TEUxlLyXm2PJdyl1hUbYjv
 q1EibvH4+vXVh2sceB0lDKWI3YZBaHtTcmWI8/U0ay/eKLqVdW1oAK/elJ+ZxpUI29d4WTpqm
 CUHx2KnMcdOwd74PT7IMHMlAV7Obj+JfIzH+hFjvXXF5o15Fo/j33M/4do+5t3aQ6TtSyf+uX
 Tn8Bg0BlKxOwhO3fiv+VcWApcaydT0iOVg5oxwAhCvHOnwKgsV2FjZ7pLra/Oivb66aw2yG+M
 ax2TOcalYVlNwXYjY8/NQwAawA0pxTHBDvrXdDmIzfiHdOJjUr0hXDjwixC9uM+y4c8lPlaCq
 kmprxgAsg/qAVKF4CRA8o9kK+sPIW1V4xo18gZq4b1Sc/vcqB9uFzRB/swGM2iU7bYggkC21J
 GASGHlA68x9RMothXhJA4PN0MCPZHChOEe59sdTzQM/0msROadkI4gkFuq/uMN8+yKgsrxk9B
 l/s9OJHSdY8+EzgC3tMRCnOCr7N11N+M47kFJFgrt1JjLWUS6RizBsXLhQD0WcANVo/K+7i0P
 gQYbqvt3PhVPmkqaD75zcBl50ldu3S2+Tlf7+Wt7nIM3i/qUcVImMzkSbnigUhxhUfb3RK21m
 jy4z3HdoCiSLxMDNXPI/q+MT8HsFl2+UIzruDvhp8ra4HkqAyd+Wltb8wD9Zp72UKpExEGpr2
 h3/8hrfeDYzPs7Kg7h6wDDVSJ8ywCl6PyPspS6Ib7X2CEOaWAlCc3MG9wDdWfI/AQ9fxOrq+J
 PI10+8OwFU67AW4bCRoiPRB8VcADy0WULSTQs51i/Z4auLnnzWCql
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_073035_942837_76C319EF 
X-CRM114-Status: GOOD (  19.85  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 linux-nvdimm@lists.01.org, Will Deacon <will@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 linaro-mm-sig@lists.linaro.org, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux API <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2020 at 11:25 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Introduce "secretmemfd" system call with the ability to create memory areas
> visible only in the context of the owning process and not mapped not only
> to other processes but in the kernel page tables as well.
>
> The user will create a file descriptor using the secretmemfd system call
> where flags supplied as a parameter to this system call will define the
> desired protection mode for the memory associated with that file
> descriptor. Currently there are two protection modes:
>
> * exclusive - the memory area is unmapped from the kernel direct map and it
>               is present only in the page tables of the owning mm.
> * uncached  - the memory area is present only in the page tables of the
>               owning mm and it is mapped there as uncached.
>
> For instance, the following example will create an uncached mapping (error
> handling is omitted):
>
>         fd = secretmemfd(SECRETMEM_UNCACHED);
>         ftruncate(fd, MAP_SIZE);
>         ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
>                    fd, 0);
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

I wonder if this should be more closely related to dmabuf file
descriptors, which
are already used for a similar purpose: sharing access to secret memory areas
that are not visible to the OS but can be shared with hardware through device
drivers that can import a dmabuf file descriptor.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
