Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA676C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:03:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C72E2073E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ykxuOQJv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="wAnSJ549"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C72E2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=9zpzXuQ1YFI65v+fWU+VlX00UMzLlX0I8YtWhFP4CdE=; b=ykxuOQJvmYQb44fmi2k0Y8Z3O
	YkD0RrFoyb7pk5UGMADKEhjhmbtkbL/9FIQooqlQomSfsovQvVtKPCVMR3CqGJzvqfJP7iR8ck7PS
	Vmm8Fq4gykB8ldCDdq7OPIpeTxVeoqOEEarxAmumTrmt8Mose1UvGrnigZIci6x+RrZ4R8PljMmhk
	cVgaNHbDb4m6iXDxr7ZtoI7i++yMkyl5YVTmzxVh/wnq8wFnzY0AlKnT+cZRdALtiXo6zvV5sV7ra
	3m3Bz5LZDFhIKclRS3PbedkGCC0Kzv52bY2fmPSdhQpA/Wjre2qQSPCUtngg2SOXmSorOxS6BfKVb
	yXqQZLwTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k38ls-0000jP-Bp; Wed, 05 Aug 2020 02:03:12 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k38lp-0000iq-Ic
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 02:03:10 +0000
Received: by mail-pl1-x642.google.com with SMTP id w17so24388339ply.11
 for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2020 19:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Qyes9aGHAxVaJwtNU8SQug5LmGFe5FwkrmnytKAZUyE=;
 b=wAnSJ549eHrDYnIB99YVIamtvLCQlqW/lKN2yWQjIsz3q8+o11d9p+F06S7NiQUYHe
 RziUTWxW8ZXS4OG+YN4QsdUgZMefvdMVa/vaZd3WO8UKdaY8EV+JxIBNeRIzGeB5d9FH
 nYRGyUfCm/FQHxwPkYiUr5uJOLBfwcXlJ7hEav94oNnp1CYW3mQgJDTh8EDB8yVssrv7
 /oGfF4lvo+3NKr/S8LTQu4T3kEfONp5H+Ahh5YZord44cL95izeVZER+xOLIpaKni6Fp
 vO1FtiVHPJRMZuu6w7FngRLukPrm+/CpM2lLbd4OJo1o/9U+T0yWVTO39bQSvZIYICSt
 mJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Qyes9aGHAxVaJwtNU8SQug5LmGFe5FwkrmnytKAZUyE=;
 b=IzkSaoDKsC6VOh+/hKaUxa7yyuXbrU4a7DTCLIhGwbVhIzbDNTVYuv/xENU9fUmL3X
 peY1JhPqzY7sHVpV2Db3UVNAsd7ew8HvHVYHSwoApqpQnN6PbI+rH3pchs49w4kVFmYj
 rh8qMa3roJZ+r5cfoF0Rg+N6aX/2INwEJroxt6eAEJy1rVIOgCrMritaO/dvCUo7L4AI
 ByddxpjDO+GwhEYu4n7ereZQGEo8lsZj9uSMeXYQtGVP5OWxPYpoE/LxdoHtCpyWPTV4
 i6AfHYXgdx0nPzCk5FUG8Sg039yiB//giZkxRCZAeVioOQfPkZ8SpR5ZmF6guu5PihZD
 CS5A==
X-Gm-Message-State: AOAM531Ci1ZKJne5XbOBSAZo5wEeLRZHGIVovKkjg+wTrEHo6GxiH47H
 dw/DOJkTPFxOGikX61N4qF+jkQ==
X-Google-Smtp-Source: ABdhPJy88+dyttrj2FSVGQ5NdiNibaUE/8BLo2tiAki3SiUKIg9qWa2lVwhEC1uP/cKuYf2VDGXQDg==
X-Received: by 2002:a17:90a:d081:: with SMTP id
 k1mr945003pju.177.1596592987410; 
 Tue, 04 Aug 2020 19:03:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w16sm652942pfq.13.2020.08.04.19.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 19:03:06 -0700 (PDT)
Date: Tue, 04 Aug 2020 19:03:06 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Aug 2020 19:03:04 PDT (-0700)
Subject: Re: [PATCH] riscv: Add sfence.vma after page table changed
In-Reply-To: <CAAhSdy1QbMjZxxu+wSBYr3+3oaM2Qg=_Uwj8dfQidi=ck6PV_Q@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: catalin.marinas@arm.com, Will Deacon <willdeacon@google.com>,
 Marc Zyngier <maz@kernel.org>, mark.rutland@arm.com, anup@brainfault.org
Message-ID: <mhng-1f7adcd7-551c-4b8a-80f5-e1230b335c6a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_220309_641288_C45CE34F 
X-CRM114-Status: GOOD (  26.33  )
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
Cc: aou@eecs.berkeley.edu, syven.wang@sifive.com, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 03 Aug 2020 20:29:32 PDT (-0700), anup@brainfault.org wrote:
> On Tue, Aug 4, 2020 at 8:32 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>>
>> This patch addes local_flush_tlb_page(addr) to use sfence.vma after the
>
> s/addes/adds
>
>> page table changed. That address will be used immediately in
>> memset(nextp, 0, PAGE_SIZE) to cause this issue so we should add the
>> sfence.vma before we use it.
>
> Alternate version of this commit description can be:
>
> Invalidate local TLB after both set_pet() and clear_pte() because the
> address can be used immediately after page table change.
>
>> Fixes: f2c17aabc917 ("RISC-V: Implement compile-time fixed mappings")
>>
>> Reported-by: Syven Wang <syven.wang@sifive.com>
>> Signed-off-by: Syven Wang <syven.wang@sifive.com>
>> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
>> ---
>>  arch/riscv/mm/init.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index f4adb3684f3d..29b0f7108054 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -202,12 +202,11 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
>>
>>         ptep = &fixmap_pte[pte_index(addr)];
>>
>> -       if (pgprot_val(prot)) {
>> +       if (pgprot_val(prot))
>>                 set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
>> -       } else {
>> +       else
>>                 pte_clear(&init_mm, addr, ptep);
>> -               local_flush_tlb_page(addr);
>> -       }
>> +       local_flush_tlb_page(addr);
>>  }

arm64 appears to be upgrading all set_pte()s on valid kernel mappings to
include the fence.  It looks like the message from 7f0b1bf04511 ("arm64: Fix
barriers used for page table modifications") is out of date, as I can't find
create_mapping() any more.  If that was some generic kernel thing then we
should probably upgrade ours as well, but if it was arch/arm64/ code then this
approach seems fine as __set_fixmap() isn't on the hot path -- I guess this is
fine either way, but there may be other issues that the arm64 approach fixes.

Do you guys happen to remember what was going on here?

>>
>>  static pte_t *__init get_pte_virt(phys_addr_t pa)
>> --
>> 2.28.0
>>
>
> Otherwise looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
