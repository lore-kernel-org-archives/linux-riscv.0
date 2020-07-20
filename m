Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A30C433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 18:09:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59EB222482
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 18:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EMvHKBHt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59EB222482
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PZdhdv+rI1dhoPU/tmMKJfMjgq4y8njE3huW+fXywsA=; b=EMvHKBHtlBm79U2omjCcOdO/K
	YxBVuLkN9ZxPDN6o+pKNfbU3bdemXwWVzvC1JWGCF8ZUs9vnXaAYxCh2vxzWcxYzBdrR1mNcc6V+/
	TPbE3y7/Ldl3eH7r1To9Mdm623ovl9bgs1LK5PRr2eUb6cr0ta1XVGR6BKdfJ1X+NncTCuxane/up
	GLzVZIwhzMzmafni6aT/3/O3oyFIB07EbYHaKnju832TchsiuonQBj2onq6Bopd1h5W6EYSbdEzxc
	PDtcpnt34zq3MHNsam9GMj0d4Xmh7sNRtXq+t+h8M++d8eEGeFxg0lvNY98+tyabX1xzCYVZpjSKL
	HcvbVkdwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxaDv-00071j-Tc; Mon, 20 Jul 2020 18:09:11 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxaDo-0006ro-G5; Mon, 20 Jul 2020 18:09:05 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MUog3-1kNfg72UKX-00QlBe; Mon, 20 Jul 2020 20:09:02 +0200
Received: by mail-qk1-f181.google.com with SMTP id 11so6895105qkn.2;
 Mon, 20 Jul 2020 11:09:01 -0700 (PDT)
X-Gm-Message-State: AOAM5327L+drXLxYK1d78MUmVW5+hJPITsBxo5jJ1/mpQecqyjjgZDZZ
 1DvfZCqnx0Z6mbXJuRtLzQUnwaNS0xZ3Oh6WZis=
X-Google-Smtp-Source: ABdhPJxk8AXvQoaaSyG6TPpWGlRFg6r3NFnqCF1QtWJiuwzUOgkiVS3DL9DQU7SzABQpPR/Um1zIkILDDVb8zZFAISI=
X-Received: by 2002:a37:b484:: with SMTP id
 d126mr22851253qkf.394.1595268540113; 
 Mon, 20 Jul 2020 11:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200720092435.17469-1-rppt@kernel.org>
 <20200720092435.17469-4-rppt@kernel.org>
 <CAK8P3a0NyvRMqH7X0YNO5E6DGtvZXD5ZcD6Y6n7AkocufkMnHA@mail.gmail.com>
 <1595260305.4554.9.camel@linux.ibm.com>
In-Reply-To: <1595260305.4554.9.camel@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Jul 2020 20:08:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a34kx4aAFY=-SBHX3suCLwxeZY7+YSRzct93YM_OFbSWA@mail.gmail.com>
Message-ID: <CAK8P3a34kx4aAFY=-SBHX3suCLwxeZY7+YSRzct93YM_OFbSWA@mail.gmail.com>
Subject: Re: [PATCH 3/6] mm: introduce secretmemfd system call to create
 "secret" memory areas
To: "James E.J. Bottomley" <jejb@linux.ibm.com>
X-Provags-ID: V03:K1:cU0e0YGHGahogtZmAsU4pQyROlxHpFONaVV2yD247Zl90O05hve
 PYtOL/u3PhPSbY+zaxujzKPgxbpv8APi5yFwjpo53zXPjacUhNwOXuZNmm7j0OX8CUEDZRB
 cpmMLdermmJreL9CWttqvThHUDpMUXDr8HotkOJjCRe0d2624aMSNuYXtWsJq+lOzgt5kkv
 i3swwWuAtH//p/tVGjiOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vMWBvEz9Nkc=:6k+KAyrxAm7tEGD6JPwA8N
 QFDzsRR0z9zwrLTu5Mqq43H+4fZwFpQfJn0qNv2PN5FuzlnGt2DX3n2hZD39T+GHregzj18Rl
 1V4rDjOsSKVkhwpCry3eZn7JNrOV4t21Xt1GO9pXgKaUdiGYxcDqOnkVdagmWdS7xKdEPuIY3
 NiwY85C+W8akh4dkT+Dzp3LT7YuSf/okrfqov8H4atnRhcUfoIPUk3z6wKqOy9FR+xrGxfMPs
 B4kudl9OK/lQjDAtxg+XZKoECuFMQsQw9Rq1OILOcO6QGeQnZYJVIyKjZkz8dGZqZ334J6Pkv
 9c65rd4dBypyNDRBknKFisLxqaNGY8+HyzD3xvYmw6ccu0hisDhjbHc3JmVh5ncSTbGWNBNps
 Xp+OxM497r+QyKTxXQ91cABR3IoBLhA8O4avGLsAub2s2atdODWPxHWlVwlE6Q5EvybyAO7fn
 SBaPvg0US3DBiukqfMDtdOx+3KG/59Al0EamO/nQE/MrqlFiYZ3OtNQGhAwBqZeALgW5lslaF
 FCPeR17FouTOmtNNTislO0HA3koscbK7ksgdxIrvDHR5J9mUpLY86e4vgnCj3K72X9duWeZI9
 qvWusPkgJUQnqs7kdSAqzCeFo6dgNsE47YOHkF7unPYgyIYFwkvSeqW1ROUhltiauWzb7vbxk
 8FJs1pVQaS5w5qesQTch0tq03pdMcwo2+/M0/So1YEnZMwR20YewewMuoBKodDt3TOGdI28S3
 PeCFBlGXPezZOEGd1NInnBo1ZiI9gqdZQZ+nPKuJ60jY7kM0PSGxMDLnsGVoAydyWxOaKWmE1
 cdlJktF8PF4o2NmzSb9suWyRATTAk2tZ5GuyXuaMZJUWCKEKuyuwmN6DOETkWkghtIousXsHq
 v6NVi/Q7uDUe/6FBStpI3CuznQry64f6isbmnEn5KpzonL9hpfn4liB7cRQBrFACEtISSg2ZZ
 gxgMzut/Q9hWNyWDqEzm8xkWEQ4GlVSyu4yYi9ztb1UnWbarJqSYt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_140904_780002_FEFDB013 
X-CRM114-Status: GOOD (  21.58  )
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
 Ingo Molnar <mingo@redhat.com>, linaro-mm-sig@lists.linaro.org,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux API <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2020 at 5:52 PM James Bottomley <jejb@linux.ibm.com> wrote:
> On Mon, 2020-07-20 at 13:30 +0200, Arnd Bergmann wrote:
>
> I'll assume you mean the dmabuf userspace API?  Because the kernel API
> is completely device exchange specific and wholly inappropriate for
> this use case.
>
> The user space API of dmabuf uses a pseudo-filesystem.  So you mount
> the dmabuf file type (and by "you" I mean root because an ordinary user
> doesn't have sufficient privilege).  This is basically because every
> dmabuf is usable by any user who has permissions.  This really isn't
> the initial interface we want for secret memory because secret regions
> are supposed to be per process and not shared (at least we don't want
> other tenants to see who's using what).
>
> Once you have the fd, you can seek to find the size, mmap, poll and
> ioctl it.  The ioctls are all to do with memory synchronization (as
> you'd expect from a device backed region) and the mmap is handled by
> the dma_buf_ops, which is device specific.  Sizing is missing because
> that's reported by the device not settable by the user.

I was mainly talking about the in-kernel interface that is used for
sharing a buffer with hardware. Aside from the limited ioctls, anything
in the kernel can decide on how it wants to export a dma_buf by
calling dma_buf_export()/dma_buf_fd(), which is roughly what the
new syscall does as well. Using dma_buf vs the proposed
implementation for this is not a big difference in complexity.

The one thing that a dma_buf does is that it allows devices to
do DMA on it. This is either something that can turn out to be
useful later, or it is not. From the description, it sounded like
the sharing might be useful, since we already have known use
cases in which "secret" data is exchanged with a trusted execution
environment using the dma-buf interface.

If there is no way the data stored in this new secret memory area
would relate to secret data in a TEE or some other hardware
device, then I agree that dma-buf has no value.

> What we want is the ability to get an fd, set the properties and the
> size and mmap it.  This is pretty much a 100% overlap with the memfd
> API and not much overlap with the dmabuf one, which is why I don't
> think the interface is very well suited.

Does that mean you are suggesting to use additional flags on
memfd_create() instead of a new system call?

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
