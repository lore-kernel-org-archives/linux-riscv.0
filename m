Return-Path: <SRS0=jwAp=BD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D2CC433EA
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 07:21:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C6E2065E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 07:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zf3SPkKf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C6E2065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BDQ5Mdbwwed1ht28f0hx8V8glFrrl8QTvZQV9pCa7nE=; b=zf3SPkKfMOj4boLrsBe2vhpil
	KGLDWJEJsGX9lG/GnF2+60UmvXdFnNg2+KFATY+5XYAWpdL4gXH29WSE0tPET/5dnTz6q07YSUzKH
	JCc/4fmp5z00O8xmAAfaEtX9Jt3OYy6AALuMdPAHPotC/w4Ir6v9ysPM8Zlu6Cs2G+Oec/p7J+0jM
	336Yk2ZPjNbBjDwsgAVnTv/ngE7pqOxgv9lYOK4MjyHfkvLESBi4hXDikwC2OTEfqn6AaFzQmEFdR
	sObd4svrdALZ5C5xWTU6COZIdQm1sB6TCpy6EyY5YvV8QPu8bVPlWeQxM9+uVkDGzqvUBkEB9CKng
	8rS4T/V9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jys0e-0004h4-5m; Fri, 24 Jul 2020 07:20:48 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jys0b-0004gA-UV
 for linux-riscv@lists.infradead.org; Fri, 24 Jul 2020 07:20:47 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N7yuz-1ktlpR363v-0151ej for <linux-riscv@lists.infradead.org>; Fri, 24
 Jul 2020 09:20:42 +0200
Received: by mail-qt1-f176.google.com with SMTP id o22so6015827qtt.13
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 00:20:42 -0700 (PDT)
X-Gm-Message-State: AOAM532lBXSb+e1HxUjCVKWCnB2Racp0tsJ+1km1lOLYgRok+CJmLWMc
 arj/Gk7IPpp8lgldd2B4U/ET4oc0ssAJMbTz9Ug=
X-Google-Smtp-Source: ABdhPJxmIVXnbEioXbPXSA7ZMWes4VKvilueIEtCY7yjI+BhfVsAWHUQWo3DE1p/ihdJ0qb68PSFrNOEs1zZFP+V6+8=
X-Received: by 2002:ac8:688e:: with SMTP id m14mr1188191qtq.7.1595575241528;
 Fri, 24 Jul 2020 00:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
 <mhng-820ebe55-b4a3-4ab3-b848-6d3551b43091@palmerdabbelt-glaptop1>
 <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
 <CAOnJCULmX+vUcpEmBd5w7xjtZSFk=Ju2V=wBJCOXHQ8m9yG9-Q@mail.gmail.com>
In-Reply-To: <CAOnJCULmX+vUcpEmBd5w7xjtZSFk=Ju2V=wBJCOXHQ8m9yG9-Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Jul 2020 09:20:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2u9Z6wfyRduC7396929t4VnJQ0cXMiMWO7o6tgx_uNOw@mail.gmail.com>
Message-ID: <CAK8P3a2u9Z6wfyRduC7396929t4VnJQ0cXMiMWO7o6tgx_uNOw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Atish Patra <atishp@atishpatra.org>
X-Provags-ID: V03:K1:VQVxWZvrZSi/IO51ekkuJSR9BqLUhYjLNOVWCqBSBsxlaDkp48n
 jVx/j9BIODwdaRpwSKyWN3xBYYOWMXyqv6RowWMjFNTjPaxwGXMA/QLsP+7qcvkMQvNt3xU
 TxBXR9ctKFlDhhDG8UsnS+AFpb0ATD4OG0pMFt2+Llge5k5py4hlJRcreXcMceffOTFSPCd
 n3VXMYg9+PtfUjJpt6o+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V1SPju+LasQ=:H2q2fTTTcA5MV/f5dM/Pdk
 ZYhXiajv5xM753LKTCudihnG7W2TS9xP1nvIaoV73+DZGO01ovBwjE3R5akv3VOHns5i4M08Q
 lVMnwGt94avuahUIOpg/n4qlk5NoGpzulhPac4Irx5ckCA3RS51QUBjHlYqVVamon6Zi9puOl
 KKvW1U3s1dSNgQeKUSnARXHgMPzdU+rnP4ZNtYDZx8ytyJr9XSeFHFzQIqnV/8qYCNnrM0h5l
 fzG0pXNYwvwgVmrebPmG1sO5dbPz3YXm5xJdDFTXM7qwExGfSxx/1759bMICnT8QCqgy4gPgX
 TgfzCwC+xpLgl/EwAhZIWTEsQkEqOiV9UJ+ZF3FD/AImxreMXuFn/dLuOP2jMY1cshlmRFY5P
 lhaGRNkd9jm2zFWMzs7l2e5Vtxm87OdYsWA/N8QxuwUMaKXbHpqR35VwXrzJj67SoKwkDcSgS
 r2YHjf5HtiU+pakrywsF2xEPfBLfG5pAxMWIjsWvSvNIfQ8I8gOsLW/wK0hLdilKd+WcbPq4l
 97qDCOG/5IkEPOXAmgRbMKdc3j3EGP3NubBuBIwP0KEXItz7nz5VmmE5+Ub6XgbfzX+TxQwgo
 VL5/pvGEGv/3JLFFdp/d/ZdSx6WJP2Q81GQWsXI2vfZiaZxS6ZeBXhMAKwSTZF2XrzBYTeN/o
 lLnOFXKjCnn5Vf3jfESHy15KktsGwcpwuucfOnDUs4hkFJvB81Z7fn61utamZN0Dupt1zMNkJ
 fu5umw+q5VB4mgLPW5Mq2NMChjtPJOgIRTGj5gLuBgzgfV8XwoP+IscmS17TZxjXhMeD8e8VH
 vbCh5yVfJAVvebYpKF1OxY1tWFXS0R/Yn2jjIaSKNA57wy7vvAWb7Ef/97xag4+4wB1Kk2L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_032046_215878_E8D22527 
X-CRM114-Status: GOOD (  20.25  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Linux-MM <linux-mm@kvack.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 22, 2020 at 11:06 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Jul 22, 2020 at 1:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I just noticed that rv32 allows 2GB of lowmem rather than just the usual
> > 768MB or 1GB, at the expense of addressable user memory. This seems
> > like an unusual choice, but I also don't see any reason to change this
> > or make it more flexible unless actual users appear.
> >
>
> I am a bit confused here. As per my understanding, RV32 supports 1GB
> of lowmem only
> as the page offset is set to 0xC0000000. The config option
> MAXPHYSMEM_2GB is misleading
> as RV32 actually allows 1GB of physical memory only.

Ok, in that case I was apparently misled by the Kconfig option name.

I just tried building a kernel to see what the boundaries actually are,
as this is not the only confusing bit. Here is what I see:

0x9dc00000 TASK_SIZE/FIXADDR_START   /* code comment says 0x9fc00000 */
0x9e000000 FIXADDR_TOP/PCI_IO_START
0x9f000000 PCI_IO_END/VMEMMAP_START
0xa0000000 VMEMMAP_END/VMALLOC_START
0xc0000000 VMALLOC_END/PAGE_OFFSET

Having exactly 1GB of linear map does make a lot of sense. Having PCI I/O,
vmemmap and fixmap come out of the user range means you get slightly
different behavior in user space if there are any changes to that set, but
that is probably fine as well, if you want the flexibility to go to a 2GB linear
map and expect user space to deal with that as well.

There is one common trick from arm32 however that you might want to
consider: if vmalloc was moved above the linear map rather than below,
the size of the vmalloc area can dynamically depend on the amount of
RAM that is actually present rather than be set to a fixed value.

On arm32, there is around 240MB of vmalloc space if the linear map
is fully populated with RAM, but it can grow to use all of the avaialable
address space if less RAM was detected at boot time (up to 3GB
depending on CONFIG_VMSPLIT).

> Any memory blocks beyond
> DRAM + 1GB are removed in setup_bootmem. IMHO, The current config
> should clarify that.
>
> Moreover, we should add 2G split under a separate configuration if we
> want to support that.

Right. It's probably not needed immediately, but can't hurt either.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
