Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E54C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 14:34:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3449A22482
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 14:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jM5ZuMDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3449A22482
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=47mO4oW40qgNYcmMrxUB32gsSiOL6Em3rTgXbIEmm2c=; b=jM5ZuMDGsmda6B/gxNw5pXLSG
	TgMhYEXHGgtpVeleN/gH5ou4PbAw+N4wwCPb6cnP3An2PY1JXFjYox6qC2mEW9FTgA4uOn/YqedzP
	9QSTlTeWPi3eZ+GRsbzB67Y3hEfBE0zjp76HU2awVEcahk2kre09iInR/V4+PKDwLqABiHh3pMg4l
	FjKoIMqdS1yjvkOvgWb/edam+HzPdkmTKiNOH7RTzvp35Xfs7KNAXn4CWoq0Lgp1sRTjnG597Jc+2
	mCGTWwcqQwecNfJa1LZCU5mfkDRR1WqDaGSex6X+sy/chO4JP48qWePQHyNr5/oPqB48qeEaGPUcu
	yNQG1IAKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxWsJ-0004bC-L6; Mon, 20 Jul 2020 14:34:39 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxWsE-0004ZU-Vk; Mon, 20 Jul 2020 14:34:35 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MJEpp-1kHexQ0biF-00KdBU; Mon, 20 Jul 2020 16:34:31 +0200
Received: by mail-qk1-f171.google.com with SMTP id l23so7625775qkk.0;
 Mon, 20 Jul 2020 07:34:29 -0700 (PDT)
X-Gm-Message-State: AOAM530k4kwqtPlI698VbwkQQINwnDoT9HUqtXhL0D3ANTsZ5/ypjRkC
 UyXYnGj3n7D/oXhplqCfv61A5jk3iJfLSIOgyrw=
X-Google-Smtp-Source: ABdhPJwIxgAdvjUjPU+4jzybDNb2QFZAVcL3HMLlxw2RLgRPrBNFIwh83Ml0UJm/YApy5c7tnsKEhhbWEGttCx/g1AI=
X-Received: by 2002:a37:b484:: with SMTP id
 d126mr21885286qkf.394.1595255668502; 
 Mon, 20 Jul 2020 07:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200720092435.17469-1-rppt@kernel.org>
 <20200720092435.17469-4-rppt@kernel.org>
 <CAK8P3a0NyvRMqH7X0YNO5E6DGtvZXD5ZcD6Y6n7AkocufkMnHA@mail.gmail.com>
 <20200720142053.GC8593@kernel.org>
In-Reply-To: <20200720142053.GC8593@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Jul 2020 16:34:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a07jAec4hKyNMcha032TT6OXjYHaZZ4Za9ncDsvapeg8Q@mail.gmail.com>
Message-ID: <CAK8P3a07jAec4hKyNMcha032TT6OXjYHaZZ4Za9ncDsvapeg8Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] mm: introduce secretmemfd system call to create
 "secret" memory areas
To: Mike Rapoport <rppt@kernel.org>
X-Provags-ID: V03:K1:JX4zZXOXdKUQSBbvmA/WwksMKi4bQmcXq8zGEaJYw2RUL0isHrD
 9Ri5iyXInDkv5YbxWt8dl0tykaDsWwWhYwVL23cfL+axERCbtX8YPgjemKYHyuIsvVyoJQ7
 oiiG+NuRJQmJlV0aOpZcxvO5dsnZhWOFhF1kh/drlkGKBus7oNXQDCGfNk6613pzBgAh4dT
 uCexkJfDEabaB0io6BggA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zDJqfWjdXOc=:W0JyeKudSVbhoNy9NCvVIL
 L5yTUZV2GR+GCWmKAA8b/aH0QJds63FSOHC65Cyfomy65y6hb8UZAgQ3Pd7pmYvC5asE0J3OU
 zNhQHEwl6/dR9krpIcsm60E07alnr9f6HHnOxE6YAt0wsQmTGxTh7at3wOLg4Z1qNIg+4Yonk
 Y/aixAtrBdElpS/GEZuFBF3Cc9jVHrvRQGtGpYfHfplFrawflXzvOxmc2OIVnD8+QK4qsuAFw
 aiFyja/jHQfUSrbB5QWagD3uINT84g5L2lf14koj7vWYigInpzbT1abBbk0VNvzpvGsNf/zCX
 StB1Cqgvn3Y5apqhovc2QuV8xc1pVTIx+yD6CbCFoVtM4FlmpHL/b1O6subCrj8zNFvSFSXg5
 6+V1nK1Av/Nagpw+BY6syArzwFUGsUa/wzNqMlV4MdvIKlVmrZeRhcoG3g/Uh1D0txNjGsKT4
 LlI/5ANfSqVyOUpx0lXRBAiWj9M0YDpsm7woXOe8lYVtIhb3y2HpxOqQfgYEQhtndRW/x4web
 0U438PYEG7L+yFA26au722PPpkZ8yXv9yDFSWZmIzp4+AVD1U+Tm61sbWRXGstfBKTIQZxKTC
 yPF5eWTGH0eQNplngw+Hkbf9Icw5d7tdYW9MpY6NEloOO1L8VlzNctlwKDTda1DASITdYGLgj
 YcvvvhIGJGCzOu2WPwpwUFVzmb/rUa0ucwYEVLlR9wr6mFck7CTe91oFZnpuVNPYloaYLevWF
 JfPV3uebDodwSbhDO/cX3qELuGpfs7zDfcnIvl8JG0moZ///2VQekIfyKmR2Ba9qPSWD4whFi
 WHV84Pmkh2PpETZehJLM4v0Q+JORcm9kJLDKMnlarrThmTU/j5eTKRXDQT9R2lTocIvtRITFl
 WSnPuQ7S2q5VMGO5qkl3Y9otgq+GziwXnqMEeLLGFaJ4krWqtlbHlv475DLDJnnynvhDZWu6d
 0GmnApyuX/+LfA22dlwzTAhFLdZEH6c76yMT7x3FdOZ+pqO94gZhn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_103435_255183_EF881145 
X-CRM114-Status: GOOD (  29.96  )
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

On Mon, Jul 20, 2020 at 4:21 PM Mike Rapoport <rppt@kernel.org> wrote:
> On Mon, Jul 20, 2020 at 01:30:13PM +0200, Arnd Bergmann wrote:
> > On Mon, Jul 20, 2020 at 11:25 AM Mike Rapoport <rppt@kernel.org> wrote:
> > >
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > >
> > > Introduce "secretmemfd" system call with the ability to create memory areas
> > > visible only in the context of the owning process and not mapped not only
> > > to other processes but in the kernel page tables as well.
> > >
> > > The user will create a file descriptor using the secretmemfd system call
> > > where flags supplied as a parameter to this system call will define the
> > > desired protection mode for the memory associated with that file
> > > descriptor. Currently there are two protection modes:
> > >
> > > * exclusive - the memory area is unmapped from the kernel direct map and it
> > >               is present only in the page tables of the owning mm.
> > > * uncached  - the memory area is present only in the page tables of the
> > >               owning mm and it is mapped there as uncached.
> > >
> > > For instance, the following example will create an uncached mapping (error
> > > handling is omitted):
> > >
> > >         fd = secretmemfd(SECRETMEM_UNCACHED);
> > >         ftruncate(fd, MAP_SIZE);
> > >         ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
> > >                    fd, 0);
> > >
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> >
> > I wonder if this should be more closely related to dmabuf file
> > descriptors, which
> > are already used for a similar purpose: sharing access to secret memory areas
> > that are not visible to the OS but can be shared with hardware through device
> > drivers that can import a dmabuf file descriptor.
>
> TBH, I didn't think about dmabuf, but my undestanding is that is this
> case memory areas are not visible to the OS because they are on device
> memory rather than normal RAM and when dmabuf is backed by the normal
> RAM, the memory is visible to the OS.

No, dmabuf is normally about normal RAM that is shared between multiple
devices, the idea is that you can have one driver allocate a buffer in RAM
and export it to user space through a file descriptor. The application can then
go and mmap() it or pass it into one or more other drivers.

This can be used e.g. for sharing a buffer between a video codec and the
gpu, or between a crypto engine and another device that accesses
unencrypted data while software can only observe the encrypted version.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
