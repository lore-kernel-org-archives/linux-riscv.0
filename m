Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11DFC433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 20:06:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF722080D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 20:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GimcI8lx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF722080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X0LCMq9qOMzxM8iJ57LzbKsJOr8GWZ7ZqQyXKKffTWE=; b=GimcI8lxT5rhUc2tBhJgZ1Mft
	yp91ZVbTLiSMUEPqgfa4YW7zQybA+y45MCJHqMIxWLXj8r1wfXgMgueItvqLI5gqmMIR+uTPqbvPO
	vbN3gjZbsNy5Lcxm8sV5XNQzpZPYAK1ErNy45amCZIboMP0apWxRKmyE48IORdKCXdobokdJz7lsZ
	mw/IoH4BgSl1jRwP/ivMXDezKdg6hdisPNfmf4H4qt7GPIcU9LPRcpkoW3azi8Y52TR3iwY5vA7YS
	Q4KbecoYspO2UntBkNgPaeZrOh6nj8dJfluwH5+3tNivioNM3x7Ov0NEEEFBNSgAi1Z91+qID16Fl
	d4OvUqKsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxc35-0003WZ-IA; Mon, 20 Jul 2020 20:06:07 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxc32-0003Vg-OB; Mon, 20 Jul 2020 20:06:05 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M27ep-1jzWn90xfl-002Y5J; Mon, 20 Jul 2020 22:05:58 +0200
Received: by mail-qt1-f172.google.com with SMTP id w9so1698497qts.6;
 Mon, 20 Jul 2020 13:05:56 -0700 (PDT)
X-Gm-Message-State: AOAM531/+q82BHFvPtxwiHREaYss/jYz13o71tva77RRLgL3jTs2SoSw
 FZ30XAUNoKPtU5UqgXTuwaflnRgy8gP0DLP3Ry4=
X-Google-Smtp-Source: ABdhPJzP8ED75eP/64ZTWgc8CqM8513IRGly4LjDrHp/zECs6vcVhK6MaJY0JaFbbN4kfnMI9cRAMEvStsrfDJyQR1k=
X-Received: by 2002:ac8:7587:: with SMTP id s7mr25919753qtq.304.1595275555970; 
 Mon, 20 Jul 2020 13:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200720092435.17469-1-rppt@kernel.org>
 <20200720092435.17469-4-rppt@kernel.org>
 <CAK8P3a0NyvRMqH7X0YNO5E6DGtvZXD5ZcD6Y6n7AkocufkMnHA@mail.gmail.com>
 <1595260305.4554.9.camel@linux.ibm.com>
 <CAK8P3a34kx4aAFY=-SBHX3suCLwxeZY7+YSRzct93YM_OFbSWA@mail.gmail.com>
 <1595272585.4554.28.camel@linux.ibm.com>
In-Reply-To: <1595272585.4554.28.camel@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Jul 2020 22:05:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ExFSSw-SCL=dSXzyv4jnp=yQs=ZooKDrL_tQogazrjg@mail.gmail.com>
Message-ID: <CAK8P3a0ExFSSw-SCL=dSXzyv4jnp=yQs=ZooKDrL_tQogazrjg@mail.gmail.com>
Subject: Re: [PATCH 3/6] mm: introduce secretmemfd system call to create
 "secret" memory areas
To: "James E.J. Bottomley" <jejb@linux.ibm.com>
X-Provags-ID: V03:K1:/QCCelSX63mvegYdBqCzuPaqk7VyzYI6VvTtxJ8/hslmoCbYC7t
 UkHfss+IDl2AVIAkPDDAJCeCZNqyLbdRhqHjaBO/vXxKLv3MBGzfv7cPeEyskFqnLapCmfR
 OM5qnC0MFdjI9cjnli48HKMuqY8K0J0qrauDyDX52rn/3bFctdCG+u9v1CXAickTvWQwaRi
 atMX3yVkMqSweYgOrhB7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:csri+pN6cbA=:dWMqNv+CYxvYS5FRYFj17H
 uWZT0a+6jsVoweEoEh2Lr+FmCPT1YMcdy+U6zGRxrYzs40XEnBL9GVHSo2yhqAE7SeiasDQnc
 CIzl5MRDT/wf4aXXGu4MGzldqjp5bsYPGsE/SZTIbqCR9LnN2FDFomdYl2y48u2t3pQqjrcDz
 xNvqa9je4WmhMmgfvZeRVaYzB0giIjE1r47UJhdo9BfVWEQE6/ldnesYetumhh5xNVssMpJ6D
 mgSt7tvenrI+e6ialK7Brdj5VP22jf14ctOq7zh8ahmsu211QcLNrnykv+0H4D0PgGKH2jzdE
 +c0M+Y29CB8aA4Tl5gB2bcwBs12rYtPZE+gmuOrduii8xU+LOq1h+js/YwPE8RvhNtAQl2tHG
 rDq8/OcYrKWG7AVvBMG0eveGfxakTLwqU7GVVdJ8Sf1roc///hFMGVVZ5vMXhjj5ePqwa2/5D
 L0UlHMUzKT3XnRYYgVaK0ZCvG2VA6BgEAk7YatmJCD0GgeI3tXb4K8UbF29Gb0KsJ854rnxEQ
 sNSRZjM1KWGmxW3JxQuzHVJWWqhlX3cAVqSn5OKCfsFjObezLFq4Ipx/CJjnnD1eHNQDhp9a/
 wUAyFVLZgwhuAZNWL2/rV7y1OVI13Whip7/FDjLFI2kC5Sabqgnmty/5/0J6pxgxIJXtQCoSO
 eyyk0xfYZJwaSNi2Shypj85bvCo6SJu4Q5ri07r5hJQP5FV4lqmw5X7aHUMiyyZjE1zeIBIoI
 xZLqgS5EH2/ZqZi4Yvn9nvkPSGvI/ohQl1oAZl3VGXRxmGTWrJjHpN/XcJNPLxMRWqktd+EYs
 5aN2eo4sSqV53AmtvIiMYVczabNzHY8HuFXJ/zqvCV6Ep8fW3KZKANcY4qyphZ7LyduLKs6p0
 tljKxCGL6IAk8K1VmraXEmyJN2rVXK/AHeqJTh4y8l2JsHA0c6vuTYVLGGNw3I1KvKzMJ91Q/
 Pjg2VKHuc/INMmjg0d/B4BkeJwhANqssXR2Alugw/uLOUhqYwopEe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_160605_014868_61DFCADC 
X-CRM114-Status: GOOD (  29.33  )
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

On Mon, Jul 20, 2020 at 9:16 PM James Bottomley <jejb@linux.ibm.com> wrote:
> On Mon, 2020-07-20 at 20:08 +0200, Arnd Bergmann wrote:
> > On Mon, Jul 20, 2020 at 5:52 PM James Bottomley <jejb@linux.ibm.com>
> >
> > If there is no way the data stored in this new secret memory area
> > would relate to secret data in a TEE or some other hardware
> > device, then I agree that dma-buf has no value.
>
> Never say never, but current TEE designs tend to require full
> confidentiality for the entire execution.  What we're probing is
> whether we can improve security by doing an API that requires less than
> full confidentiality for the process.  I think if the API proves useful
> then we will get HW support for it, but it likely won't be in the
> current TEE of today form.

As I understand it, you normally have two kinds of buffers for the TEE:
one that may be allocated by Linux but is owned by the TEE itself
and not accessible by any process, and one that is used for
communication between the TEE and a user process.

The sharing would clearly work only for the second type: data that
a process wants to share with the TEE but as little else as possible.

A hypothetical example might be a process that passes encrypted
data to the TEE (which holds the key) for decryption, receives
decrypted data and then consumes that data in its own address
space. An electronic voting system (I know, evil example) might
receive encrypted ballots and sum them up this way without itself
having the secret key or anything else being able to observe
intermediate results.

> > > What we want is the ability to get an fd, set the properties and
> > > the size and mmap it.  This is pretty much a 100% overlap with the
> > > memfd API and not much overlap with the dmabuf one, which is why I
> > > don't think the interface is very well suited.
> >
> > Does that mean you are suggesting to use additional flags on
> > memfd_create() instead of a new system call?
>
> Well, that was what the previous patch did.  I'm agnostic on the
> mechanism for obtaining the fd: new syscall as this patch does or
> extension to memfd like the old one did.  All I was saying is that once
> you have the fd, the API you use on it is the same as the memfd API.

Ok.

I suppose we could even retrofit dma-buf underneath the
secretmemfd implementation if it ends up being useful later on,

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
