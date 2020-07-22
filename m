Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB71EC433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 19:52:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9485B20771
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 19:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HiqAhePN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Yoy1F4D5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9485B20771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rncD7nBP3Cxclo6z8BVK9nL5bsfLk7wCdGJMmbV2yhA=; b=HiqAhePNCjA/i5SDJGRJtqAxV
	gvtyWWmyyMY61zkZA6Zl3fhkMBrht6s7rWY8VNjVxAm3KqEBzUC/25MGqZNsmTy9wU9gZYxgW9eF0
	pc1zWfHv4ksu4gpy7ytGvhBHJcHd5E7giPCAsm7RmQ+NVrB3BSGMGr5Rcum0lIi7evCzGBoXGU00g
	W/NrG0C3GSDuiMY4HUJxPkqHxFTszklI/YvERR6y5G44RX31kIw9fZIsUhgt6r1drbBop+7rUXbxi
	hhkcPnX6XXlkE2UtvZVdVu90imIjtt5zGYmY9bc+1YuflTPp0Ca+siR2Ous0pvy/wQjyCLjsrZDLK
	qZdOOcgBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyKnF-0002er-VP; Wed, 22 Jul 2020 19:52:46 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyKnC-0002eI-Oo
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 19:52:44 +0000
Received: by mail-pg1-x544.google.com with SMTP id e8so1840483pgc.5
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2020 12:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1cGKIJpjawJti4g8SzXEonfEdlP5yq0CvN8z5K3Dldw=;
 b=Yoy1F4D5SdX59+ds7mcQz5JHUDBl4fr7U9s03rPcO/LhScRFnIG9oYi04943Pyg2ap
 QO8rRLplFMiQLcJhq6abEof80+wc3Cq6YgtwLMpVrrfBBOLBgDW9EtB8SRwK7b5TouNo
 FG7RpEdSt3aWO6VpWh5zPY+WHf6SYyc+NMhPEgpsdu+1hdfzb5rqGk7Mk2vGBCpiLMfk
 M2WMXdpC7+mWmSRDiq6A2yI2qfWzI9/2a5PLaIDTVfkIW+UfI26AMELRrElSVaArF2AH
 f+NZ0cHy9P0lcCkdQ8Agh4YYefdHQyxAnmIhKl992R0eGV3Njth6PWUOMpPlFy1YKm3v
 Muug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1cGKIJpjawJti4g8SzXEonfEdlP5yq0CvN8z5K3Dldw=;
 b=F8xxiTeiNEGBEBWpyHzkDuh9Kh3tCn7iZtNxhBiGPEe1onOVvh4RR30/K9nerDZYGb
 SG2lwgcmnOW6P0Z37Smsob/WpiHxMsxtuy7zW4haEqKrI+Zi+bNIws9IxAkneE3voIM6
 vqJ31tn2LghTsfDK8bYfksZImT3MQ4poUWvTwWt2A/kFxTnGSpCjQ9TnOpNUMuYfs34G
 iSnzSvHStRvF5x2YsJZWCURVgcpNzBOc2rhisCuOxGZumtr/TL+CSgFeLySGpaxCBfG0
 oKyFpsb5R76Di1x/Crnz6Uxm2advtdMOEDmqX/iCl8P32sbJeSyvKpCzLphDjbY13pB8
 Z45A==
X-Gm-Message-State: AOAM531UZlx2ATybrCS+J+2X+VyZgBgUB42HimzKnqdJmzSH/0kFidxC
 cqCw+GpfNNcyORR9EC7v3zemuw==
X-Google-Smtp-Source: ABdhPJzfnsEJ9u3sgDkfEADIkHOoeK603qojzxPEwBQeACIUHuB6n2njWNz3cI4X1mmHVknKJAO4xQ==
X-Received: by 2002:a63:8c4f:: with SMTP id q15mr1206804pgn.373.1595447560352; 
 Wed, 22 Jul 2020 12:52:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q13sm443560pfk.8.2020.07.22.12.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 12:52:39 -0700 (PDT)
Date: Wed, 22 Jul 2020 12:52:39 -0700 (PDT)
X-Google-Original-Date: Wed, 22 Jul 2020 12:52:36 PDT (-0700)
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
In-Reply-To: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-820ebe55-b4a3-4ab3-b848-6d3551b43091@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_155242_972449_E5BB6C7F 
X-CRM114-Status: GOOD (  33.06  )
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, Atish Patra <Atish.Patra@wdc.com>,
 benh@kernel.crashing.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-mm@kvack.org, paulus@samba.org, zong.li@sifive.com, mpe@ellerman.id.au,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 22 Jul 2020 02:43:50 PDT (-0700), Arnd Bergmann wrote:
> On Tue, Jul 21, 2020 at 9:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Tue, 21 Jul 2020 11:36:10 PDT (-0700), alex@ghiti.fr wrote:
>> > Let's try to make progress here: I add linux-mm in CC to get feedback on
>> > this patch as it blocks sv48 support too.
>>
>> Sorry for being slow here.  I haven't replied because I hadn't really fleshed
>> out the design yet, but just so everyone's on the same page my problems with
>> this are:
>>
>> * We waste vmalloc space on 32-bit systems, where there isn't a lot of it.
>
> There is actually an ongoing work to make 32-bit Arm kernels move
> vmlinux into the vmalloc space, as part of the move to avoid highmem.
>
> Overall, a 32-bit system would waste about 0.1% of its virtual address space
> by having the kernel be located in both the linear map and the vmalloc area.
> It's not zero, but not that bad either. With the typical split of 3072 MB user,
> 768MB linear and 256MB vmalloc, it's also around 1.5% of the available
> vmalloc area (assuming a 4MB vmlinux in a typical 32-bit kernel), but the
> boundaries can be changed arbitrarily if needed.

OK, I guess maybe it's not so bad.  Our 32-bit defconfig is 10MiB, but I
wouldn't really put much weight behind that number as it's just a 64-bit
defconfig built for 32-bit.  We don't have any 32-bit hardware anyway, so if
this becomes an issue later I guess we can just deal with it then.

> The eventual goal is to have a split of 3840MB for either user or linear map
> plus and 256MB for vmalloc, including the kernel. Switching between linear
> and user has a noticeable runtime overhead, but it relaxes both the limits
> for user memory and lowmem, and it provides a somewhat stronger
> address space isolation.

Ya, I think we decided not to do that, at least for now.  I guess the right
answer there will depend on what 32-bit systems look like, and since we don't
have any I'm inclined to just stick to the fast option.

> Another potential idea would be to completely randomize the physical
> addresses underneath the kernel by using a random permutation of the
> pages in the kernel image. This adds even more overhead (virt_to_phys
> may need to call vmalloc_to_page or similar) and may cause problems
> with DMA into kernel .data across page boundaries,
>
>> * Sort out how to maintain a linear map as the canonical hole moves around
>>   between the VA widths without adding a bunch of overhead to the virt2phys and
>>   friends.  This is probably going to be the trickiest part, but I think if we
>>   just change the page table code to essentially lie about VAs when an sv39
>>   system runs an sv48+sv39 kernel we could make it work -- there'd be some
>>   logical complexity involved, but it would remain fast.
>
> I assume you can't use the trick that x86 has where all kernel addresses
> are at the top of the 64-bit address space and user addresses are at the
> bottom, regardless of the size of the page tables?

They have the load in their mapping functions, as far as I can tell that's
required to do this sort of thing.  We do as well to handle some of the
implicit boot stuff for now, but I was assuming that we'd want to get rid of
that for performance reasons.  That said, maybe it just doesn't matter?  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
