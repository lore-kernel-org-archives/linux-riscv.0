Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CDDC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 23:48:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F33820771
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 23:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="riz2XPml";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="hsWZwjsr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F33820771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=PK6QHblB9grkYNBkawrveZM7LZOUaHom7QJ/SZj8QOs=; b=riz2XPml0n/bUYB/Dp6pGsxT1
	06dApgAReW+4WAZOzRbtbanFfCOzG587vmyd0e0N+VtIwkXl2pmVqNK7C9AQ2XXp6dSSq+VzhyyPi
	3fkUmwt634MvO3IuI4mUntrqNmwUQDN1OxL+tS6Nzrqd1fjc0n+S0ykP6/hyKjejOPpYyvfEYK4ZR
	X2BhHSKNUnshy7kI9v6cNiDfUmlE8kF/hwl+OFII4KfdtloTrCUuN0zbQdb3X0AIfR8TJtBY/Xg72
	Xbbu9XWFUdklg66lfuSKoXvRyFTqMMsF6As7r1mfgiOaC5pZRnOtYJJ+IC6v4OX9vj1qksUsy2p6k
	PSgR+8dCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy1zd-0001F9-56; Tue, 21 Jul 2020 23:48:17 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy1zb-0001Ed-1v
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 23:48:15 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 8so206297pjj.1
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 16:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mDc030Vht0H+5kxn8kLZcM0RglBvmobnh33JIp70Q9A=;
 b=hsWZwjsrrb6MHnGlDjXciuMZQ0nzpaGX0XqqotTf6FxppNdslwj80bOHq4XiVr8B4N
 SCpSNd4Uu+fKdrj6GAgEnicqXWWEP9PCWq23ucc9/tt2akFpRFgjuE9SeU+cCHODPhj8
 maVEeY1DOS1y5XfHe5sHYmNqjl4RoWUBn7w7lB8TeTWwtt4QeijAeuGNPjcLeBnjV19B
 SmugmuJ8ByDeMpqvSyeew7HlPpyj9My215QEtBoF9dt3tORKxn+X2oVXdd2uNIyHmd9b
 VDJVMDJNscIIFoT2kCXV0OaSjuh8jGAbeGFch/4XoFGO9VWRYU5PdpQ3sp+SqpvXySKf
 YI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mDc030Vht0H+5kxn8kLZcM0RglBvmobnh33JIp70Q9A=;
 b=O9Xbe87PANq0REBXbKj8ek+p/5ghzMJpMNTNzzEjGDhEyFRU1lNdxF3dwzr9zd13Rx
 2rwfPaB6Ane7crDzCdcvKRSNF8aXn0KAoIyzk0xovBxrl+t8KFDrRkBgpTbV7dj40keI
 1WdW177yI6fyhzo0w+/2JCX1StTG+ZAiZ/WdWN9KRuhUbpPAEMIIu+C2VtHKXmPTbuCw
 jvD55oRxDPblZPCP3u4LdfoSWUCb7HZ3bYsBRnBN9VlDAINSGe3hrRch94iBl/cRRZ9l
 12LGh8eX+t7HqXuAP+Df2NVfPaFonIXHzKjokl1XMgJWBAGWw3oJFyNRELa1oZYWKQbw
 /vew==
X-Gm-Message-State: AOAM530UZLny0d1Ky9q4HAEMK6IqsEHmt4/6XO2vk28EJLufD6zqcEEM
 eVtBnYHTxjyR+DZVBZNYu+99XA==
X-Google-Smtp-Source: ABdhPJz7GQOPhPQo7WdQAVqmRGBn/kBHYhew0a/7KykfyZ8e5DBJEpqbOEQfucs+jTILpvC6kcl9RQ==
X-Received: by 2002:a17:90a:cc03:: with SMTP id
 b3mr6637665pju.80.1595375292546; 
 Tue, 21 Jul 2020 16:48:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i66sm20870634pfc.12.2020.07.21.16.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 16:48:11 -0700 (PDT)
Date: Tue, 21 Jul 2020 16:48:11 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 16:48:10 PDT (-0700)
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
In-Reply-To: <6fbea8347bdb8434d91cf3ec2b95b134bd66cfe3.camel@kernel.crashing.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: benh@kernel.crashing.org
Message-ID: <mhng-cd9a74ea-2edf-47e4-aade-b090f1a069f1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_194815_196196_C8E1F9B8 
X-CRM114-Status: GOOD (  26.62  )
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, linux-mm@kvack.org,
 mpe@ellerman.id.au, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 paulus@samba.org, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 21 Jul 2020 16:12:58 PDT (-0700), benh@kernel.crashing.org wrote:
> On Tue, 2020-07-21 at 12:05 -0700, Palmer Dabbelt wrote:
>>
>> * We waste vmalloc space on 32-bit systems, where there isn't a lot of it.
>> * On 64-bit systems the VA space around the kernel is precious because it's the
>>   only place we can place text (modules, BPF, whatever).
>
> Why ? Branch distance limits ? You can't use trampolines ?

Nothing fundamental, it's just that we don't have a large code model in the C
compiler.  As a result all the global symbols are resolved as 32-bit
PC-relative accesses.  We could fix this with a fast large code model, but then
the kernel would need to relax global symbol references in modules and we don't
even do that for the simple code models we have now.  FWIW, some of the
proposed large code models are essentially just split-PLT/GOT and therefor
don't require relaxation, but at that point we're essentially PIC until we
have more that 2GiB of kernel text -- and even then, we keep all the
performance issues.

>>  If we start putting
>>   the kernel in the vmalloc space then we either have to pre-allocate a bunch
>>   of space around it (essentially making it a fixed mapping anyway) or it
>>   becomes likely that we won't be able to find space for modules as they're
>>   loaded into running systems.
>
> I dislike the kernel being in the vmalloc space (see my other email)
> but I don't understand the specific issue with modules.

Essentially what's above, the modules smell the same as the rest of the
kernel's code and therefor have a similar set of restrictions.  If we build PIC
modules and have the PLT entries do GOT loads (as do our shared libraries) then
we could break this restriction, but that comes with some performance
implications.  Like I said in the other email, I'm less worried about the
instruction side of things so maybe that's the right way to go.

>> * Relying on a relocatable kernel for sv48 support introduces a fairly large
>>   performance hit.
>
> Out of curiosity why would relocatable kernels introduce a significant
> hit ? Where about do you see the overhead coming from ?

Our PIC codegen, probably better addressed by my other email and above.

>
>> Roughly, my proposal would be to:
>>
>> * Leave the 32-bit memory map alone.  On 32-bit systems we can load modules
>>   anywhere and we only have one VA width, so we're not really solving any
>>   problems with these changes.
>> * Staticly allocate a 2GiB portion of the VA space for all our text, as its own
>>   region.  We'd link/relocate the kernel here instead of around PAGE_OFFSET,
>>   which would decouple the kernel from the physical memory layout of the system.
>>   This would have the side effect of sorting out a bunch of bootloader headaches
>>   that we currently have.
>> * Sort out how to maintain a linear map as the canonical hole moves around
>>   between the VA widths without adding a bunch of overhead to the virt2phys and
>>   friends.  This is probably going to be the trickiest part, but I think if we
>>   just change the page table code to essentially lie about VAs when an sv39
>>   system runs an sv48+sv39 kernel we could make it work -- there'd be some
>>   logical complexity involved, but it would remain fast.
>>
>> This doesn't solve the problem of virtually relocatable kernels, but it does
>> let us decouple that from the sv48 stuff.  It also lets us stop relying on a
>> fixed physical address the kernel is loaded into, which is another thing I
>> don't like.
>>
>> I know this may be a more complicated approach, but there aren't any sv48
>> systems around right now so I just don't see the rush to support them,
>> particularly when there's a cost to what already exists (for those who haven't
>> been watching, so far all the sv48 patch sets have imposed a significant
>> performance penalty on all systems).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
