Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CFBC433E3
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 05:46:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE1320792
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 05:46:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k4NJcUoo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="fCuEEXu+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE1320792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=w8pvyIvhF9Ti3fkSrlMxQVg97fE7tVYiZDwpsmV3k7E=; b=k4NJcUoo/rjKagTyGEi7BHBnf
	m1GQ1PYwihLsh7ApxeYPjNxRGHPACxqHLjx5IoqO9WFkKQkY91aS+t9KtRXvbOmBAA2NEBw7jqmtV
	SzfiJN558Ta8QkYUWVb+/8r6J2aebxY6cVd0QGnZ6INKPVZzLBRzeIo1SmtmwoU+acJ+oEW4TNCO+
	DnfTOiV/11wer0O7NYF4Dd3k28+qV1XDRLovnmlzmokVkSJOc+Xz6W5RcPbhch9meqPDGBC/fl1e6
	KDTqOIuGC7K11kcZmIeN6idAgnax7dT4o8XNMHB3vU6X97QZ8yIF1mSLV4mm62PxWd2jltiD2hyGV
	TSetDu+jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy7aY-00060u-7b; Wed, 22 Jul 2020 05:46:46 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy7aV-0005zu-3L
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 05:46:44 +0000
Received: by mail-pf1-x443.google.com with SMTP id 1so587339pfn.9
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 22:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=c3WKCCywdgvLGCz57S7am54sr0h7w7V/JrEMUHUMU/o=;
 b=fCuEEXu++BATZZEgu63jyhgE+Y1XNFfh/hfRTuYGDp7tRoc6LbkGOtZmRlJEX0Q4mc
 58Wx5DrHLgqWGA15ODfmp4BD+A6kqkaXmwBVAcQy7tZT4nC6LrgGJ3lzv06Ej9jur88k
 XGQBpKOytzyljGp9JTo/2ytrZBP2jJniHbB1MwjDRZhque2NwdZ0aWGsgryRqU+3DE9U
 m+vgwzNJSvheMii7MxNhJxPUYaZbP4XIj428wVkVonkWkFnWlNi3Hd/UlX/sByadTgHP
 sXR0VV6uQ74NOk6fTFxzR7f22jvf+xzhKswTeZHjL411qPbZeON+M2WgzsdrCjh868sb
 i6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=c3WKCCywdgvLGCz57S7am54sr0h7w7V/JrEMUHUMU/o=;
 b=fp9oMa/FCP1DDV8w9/jaeusKox2tQ9nja6eCEJP7QFrbEqraUP+NKXW3H69X4rjKsv
 GK0QyXHgd/jTICoKO7CAfRJeRfd5Mcrxo6SLR2s4Xzxc+TFTWOR7qO5Nld1hr34FAOaV
 iQpXYj98ay/2FOyg2YYihx9bD6550gmg2bQ8RAgH7rMPGZ/Quw/9/uxgiN1gycswJCPm
 gPAev68V1MdXuzy+UGBW1W1JjlKiQkMC6xxDX19rVvpOqmVyI75/BF2DtRzZSYFeiyrU
 YzsiMqm/zWgEdElfUMtIc4GpDo/sqYvdG5/UH2cDFIB6KUXKn9hW4TfcNjvpa2/Yoffk
 2LXw==
X-Gm-Message-State: AOAM530vRIIMrGCurs3XSvR0mdQFHVlEH/02q6nPQrdm4nykXXH7A/AO
 jLY2/bZWS0Eno68Li7eX+gHXgg==
X-Google-Smtp-Source: ABdhPJwR06FNegYVsAU8o74hwv373Yq9KlDunC4jItd8mIVMPn3zgJSHBlM3MLtzBDjvCEtSQnV5Fg==
X-Received: by 2002:a62:7505:: with SMTP id q5mr25490271pfc.262.1595396799507; 
 Tue, 21 Jul 2020 22:46:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r16sm22153983pfh.64.2020.07.21.22.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 22:46:38 -0700 (PDT)
Date: Tue, 21 Jul 2020 22:46:38 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 22:46:37 PDT (-0700)
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
In-Reply-To: <87sgdkqhjx.fsf@mpe.ellerman.id.au>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mpe@ellerman.id.au
Message-ID: <mhng-378c6e4e-9eba-4bfd-89d6-b4d2549ff3a1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_014643_236985_E3A17835 
X-CRM114-Status: GOOD (  18.03  )
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
 benh@kernel.crashing.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 paulus@samba.org, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 21 Jul 2020 21:50:42 PDT (-0700), mpe@ellerman.id.au wrote:
> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>> On Tue, 2020-07-21 at 16:48 -0700, Palmer Dabbelt wrote:
>>> > Why ? Branch distance limits ? You can't use trampolines ?
>>>
>>> Nothing fundamental, it's just that we don't have a large code model in the C
>>> compiler.  As a result all the global symbols are resolved as 32-bit
>>> PC-relative accesses.  We could fix this with a fast large code model, but then
>>> the kernel would need to relax global symbol references in modules and we don't
>>> even do that for the simple code models we have now.  FWIW, some of the
>>> proposed large code models are essentially just split-PLT/GOT and therefor
>>> don't require relaxation, but at that point we're essentially PIC until we
>>> have more that 2GiB of kernel text -- and even then, we keep all the
>>> performance issues.
>>
>> My memory might be out of date but I *think* we do it on powerpc
>> without going to a large code model, but just having the in-kernel
>> linker insert trampolines.
>
> We build modules with the large code model, and always have AFAIK:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/Makefile?commit=4fa640dc52302b5e62b01b05c755b055549633ae#n129
>
>   # -mcmodel=medium breaks modules because it uses 32bit offsets from
>   # the TOC pointer to create pointers where possible. Pointers into the
>   # percpu data area are created by this method.
>   #
>   # The kernel module loader relocates the percpu data section from the
>   # original location (starting with 0xd...) to somewhere in the base
>   # kernel percpu data space (starting with 0xc...). We need a full
>   # 64bit relocation for this to work, hence -mcmodel=large.
>   KBUILD_CFLAGS_MODULE += -mcmodel=large

Well, a fast large code model would solve a lot of problems :).  Unfortunately
we just don't have enough people working on this stuff to do that.  It's a
somewhat tricky thing to do on RISC-V as there aren't any quick sequences for
long addresses, but I don't think we're that much worse off than everyone else.
At some point I had a bunch of designs written up, but they probably went along
with my SiFive computer.  I think we ended up decided that the best bet would
be to distribute constant tables throughout the text such that they're
accessible via the 32-bit PC-relative loads at any point -- essentially the
multi-GOT stuff that MIPS used for big objects.  Doing that well is a lot of
work and doing it poorly is just as slow as PIC, so we never got around to it.

> We also insert trampolines for branches, but IIUC that's a separate
> issue.

"PowerPC branch trampolines" points me here
https://sourceware.org/binutils/docs-2.20/ld/PowerPC-ELF32.html .  That sounds
like what we're doing already in the medium code models: we have short and
medium control transfer sequences, linker relaxation optimizes them when
possible.  Since we rely on linker relaxation pretty heavily we just don't
bother with the smaller code model: it'd be a 12-bit address space for data and
a 21-bit address space for text (with 13-bit maximum function size).  Instead
of building out such a small code model we just spent time improving the linker.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
