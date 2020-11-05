Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8570FC55178
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 17:34:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE3B206CA
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 17:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mwVj1Fk8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="lzbVQmsn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE3B206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=W6LxQjni5oJJ+XrjsRXF3LYnZxNBD1OLAHwBvx2zZJg=; b=mwVj1Fk8xo8ne8dw0EvjabId5
	cUKDKfosfCLWcqtcULOz6sB94z1QjoPYePvej/EZZUYylXhIfRInsUDLa5zIYSnZ84QNQkLFkaDWw
	bEbnHQ0+2E10NJM66fOzQA/uKJAQets2kCURwuGRTFWyK8cyNqZAwQ9NDwWH4uqzIs5qbxsrKB5eH
	rcHRkc5Q8SDSRYyErUmwcCy4ZA7JDISc1Wm8BAib1VATh4JJdvZuLkyPgvaPNp7aYWj+FJ1+fUoNs
	Rb/ScnLSvrLJ5LVtEJ3aQtHkfNVmmqocfJdIF1+G4Ennzi+GES6mICpHKBT5umK5Drvj/4KnE6hXT
	qhu3DJKxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaj9H-0005eo-4R; Thu, 05 Nov 2020 17:34:11 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaj99-0005ZT-BV
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 17:34:04 +0000
Received: by mail-pl1-x641.google.com with SMTP id u2so1104535pls.10
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BNUKSCGWkc6CIawczqK2wZtYLRe3Vlhmmh+CKSA+3+c=;
 b=lzbVQmsnHGQrz4/Uh0fYZi54IjSFhyftDYTHwIkpshJXq9uFE86Pa9KWtVjBqWJ7yd
 onq3vAXQjTajSdGzQNX20E/F+aTUTqCib4eZOiqNtlC/7QkS53dFygSpG/W3sUaNJt5c
 qziTHhbP7erX23zyVe1C/vgsPyjRg7S59nO505Ef8FRnRDFDEHb7eJus9H8y7UOL0GcD
 kz5bw5d7wVOPW8Ro0wVtFiDoGvk6pa/TQguCGQJNwdYqoy8N7CCh6wwBSGCc2nivqMeC
 LVMIsZUmFNl9BJeJW24JmrCWWop64Jw79jkqnvLrQ4fzrQemdE2L/D6hiptAVeXhATd9
 9EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BNUKSCGWkc6CIawczqK2wZtYLRe3Vlhmmh+CKSA+3+c=;
 b=pz3dbKsYBgCcMvSP0bFaoUzgUrUOHjRuMqgoU4fwupZ3RNut9BgJpqGjNx0l/Qn3QJ
 jD5ID/sJuiLrTcGcZPeMS0PVIbWJV/LjnJwqjrGKONXRuplQrrlHJJ18eucaOivjorjS
 NlR4aYnccvUYOCg72CM2C1A4bi40+qwoSmv9pohRF2b7JM6NcoBfXxkx14Jgy+sYsxxu
 vuHYVXCQB86Lfzof69MHrE5N587kX+U6uazT/KzAqf7KCeULxdJtgEHBLtDxTol9Shyk
 GqhEfsvuJq4KRrbHZHxk57L4xHMbv4p0VGRJos/8XalNPKbAX5PkjHkKRysuWjSfGoX+
 3rog==
X-Gm-Message-State: AOAM533tiZt6xtYbm0y0ckbNYaOCjvhx7i4XfkuPh0i/svjYiu9ah8G/
 4ULAbxPK5ss/YU9NJJUC11rjpQ==
X-Google-Smtp-Source: ABdhPJylFsENw71w4yVASLj+rnk7or2cMT1g74UPVnCfF46/UVvMxhFTOGNn7sZscCvrZhuorInUWg==
X-Received: by 2002:a17:902:23:b029:d6:2387:55e1 with SMTP id
 32-20020a1709020023b02900d6238755e1mr3120958pla.8.1604597641453; 
 Thu, 05 Nov 2020 09:34:01 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c11sm2964888pgl.20.2020.11.05.09.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:34:00 -0800 (PST)
Date: Thu, 05 Nov 2020 09:34:00 -0800 (PST)
X-Google-Original-Date: Wed, 04 Nov 2020 14:01:41 PST (-0800)
Subject: Re: [PATCH v4 3/5] riscv: Separate memory init from paging init
In-Reply-To: <20201006001752.248564-4-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-f811a008-fd0c-4e85-b48d-4f2c476c1c65@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_123403_556864_AB0F8BAA 
X-CRM114-Status: GOOD (  21.95  )
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
Cc: wangkefeng.wang@huawei.com, david@redhat.com, catalin.marinas@arm.com,
 Jonathan.Cameron@huawei.com, Atish Patra <Atish.Patra@wdc.com>,
 zong.li@sifive.com, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arch@vger.kernel.org, justin.he@arm.com, anup@brainfault.org,
 rafael@kernel.org, steven.price@arm.com, greentime.hu@sifive.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 anshuman.khandual@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, rppt@kernel.org, akpm@linux-foundation.org,
 nsaenzjulienne@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 05 Oct 2020 17:17:50 PDT (-0700), Atish Patra wrote:
> Currently, we perform some memory init functions in paging init. But,
> that will be an issue for NUMA support where DT needs to be flattened
> before numa initialization and memblock_present can only be called
> after numa initialization.
>
> Move memory initialization related functions to a separate function.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 1 +
>  arch/riscv/kernel/setup.c        | 1 +
>  arch/riscv/mm/init.c             | 6 +++++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index eaea1f717010..515b42f98d34 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -466,6 +466,7 @@ static inline void __kernel_map_pages(struct page *page, int numpages, int enabl
>  extern void *dtb_early_va;
>  void setup_bootmem(void);
>  void paging_init(void);
> +void misc_mem_init(void);
>
>  #define FIRST_USER_ADDRESS  0
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 2c6dd329312b..07fa6d13367e 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -78,6 +78,7 @@ void __init setup_arch(char **cmdline_p)
>  #else
>  	unflatten_device_tree();
>  #endif
> +	misc_mem_init();
>
>  #ifdef CONFIG_SWIOTLB
>  	swiotlb_init(1);
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ed6e83871112..114c3966aadb 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -565,8 +565,12 @@ static void __init resource_init(void)
>  void __init paging_init(void)
>  {
>  	setup_vm_final();
> -	sparse_init();
>  	setup_zero_page();
> +}
> +
> +void __init misc_mem_init(void)
> +{
> +	sparse_init();
>  	zone_sizes_init();
>  	resource_init();
>  }

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
