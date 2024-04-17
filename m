Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711F4C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:Cc:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBHFjpnpl8BkIdRbHvIBy8jAyLl7+I6t+vB4GVzTG90=; b=Hk4YT34NBxE3hg1jOgDP5WuMZ8
	ljXIpBQ/tSDWu+NrYggGnRtUJcwvobp/L5nFfjHygxB7gjO4VrmuCS2cWnNFZnE5C6KvOCCWy3nEa
	3BVyZw4MKxuHmQmJcqfLIyRcmFTTVmb/9KrCh+t2Dxt9UjdrzRiGHAFf3kV7+9u8SBv93R71Nkgiq
	2R+SC0R9c+9dIbeeF7hyjECPICFt7oJgdoa8N5pBOQwb/hpRd7l7HiLlNWPFiq4CphiIgskYaAPFu
	Vm6YZkk7/g7NpAzktxuCvX0p046680T3+BYXBpMwxEBgFzLt96ejywyJWYOhcc0U24ddpddmWiB4S
	N4T5Qt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxDUQ-00000000AmZ-2oZy;
	Wed, 17 Apr 2024 22:10:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxDUM-00000000AlP-1ea1
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 22:10:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso261935b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 15:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20230601.gappssmtp.com; s=20230601; t=1713391841; x=1713996641; darn=lists.infradead.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wYhm/fOOjEK7jdgzj7y/SioxE02f8LD3ZE3uraqJyMQ=;
        b=p0DWH6OgHpZ7DBxjT4aQOnvb3PdAgJ9JP45418OH7/yzKDRV1Hh8H/OiLkPISPUvJA
         ekC9/v91SxvBvD83uLxPwj14ZISmofVNgQM1CxC+1fshlX4JPDnrsGZHiiYbmnn1k/HD
         cj/fRyzwFtxYRIDmSiMpgfLWwmwNqwNef+buguQEN019xFZrSN3U38416jWkLvaWt8Ag
         KdOAHgXWLF1DSLVVXwLRa1RRQZBA9nCDW1iF/9hrUPvMTEFOxEqXtblyReB3FHVhf7uC
         PeXdJ4ky8iWHjaNcvxT8tDE16NU1rGAyyMqNPva7cF+VWGzVQd+xIvHT0O1TnGVN/l2v
         wRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713391841; x=1713996641;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYhm/fOOjEK7jdgzj7y/SioxE02f8LD3ZE3uraqJyMQ=;
        b=vgTTLFDcB+wugCMFZiWHUdo9QQ+Bub7znzsqzrMoNI4ah9Tu9iHjuxrO8nmhDOJokD
         z2XeUX/BthMBn775kUUGAkxNU8pUXbes1M1LxiT0Wrk+SPG3j9nXJvSqh521E6o38FNs
         Iu8Lm72JLft3/2a9whLe0JriDZ8g+ORmUDXFjgIX6Lszz/KZZPxBw49sfBRGP5+rLtbP
         tN3v+w76dJA9y9fvUl1A0SXzfp0VTi4o1luNp0GcqZvjJ//H/chDUAF5nPyf0UrVmnrt
         2ywQAjY2m+yPzqWKXRc0ZTGomQOnLZvLDF1/Lp1G/Sh4lJ2NrtECHtNuP3VjDDej94aI
         POFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGPqX5cL6ocxL1oOXB1GIoo/9xknm1lLF4P9U4ddTXqRQAHEVSrOwc82cikriYMcYv0S/CYUmlNLcTvvYlC4UsUYtawnpIRcoC2NTYesXc
X-Gm-Message-State: AOJu0Yy5bL9AfUuDaSBo97jUSfGhnHtQkPDdwi35asA4J3oVbPgdh8p9
	zzLfvadiX9+nDDfr+sJzKRdVOHwYBBcUDJxtJLv7HHws/2fV9hWVY3rMvUBGVUo=
X-Google-Smtp-Source: AGHT+IH3MYkMR8IPHkvuF/qL6uC7V9sKI5rYU7z0ZR3m/5HrAQlViqnnmV0nty+c2HEAzwnUFgRgbA==
X-Received: by 2002:a05:6a21:3483:b0:1aa:9561:1342 with SMTP id yo3-20020a056a21348300b001aa95611342mr457129pzb.35.1713391841276;
        Wed, 17 Apr 2024 15:10:41 -0700 (PDT)
Received: from cabot.adilger.int (S01068c763f81ca4b.cg.shawcable.net. [70.77.200.158])
        by smtp.gmail.com with ESMTPSA id h17-20020a62b411000000b006edd05e3751sm159808pfn.176.2024.04.17.15.10.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2024 15:10:40 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <1F07FFF3-663B-43D4-A9DA-C89856F2962A@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Date: Wed, 17 Apr 2024 16:09:23 -0600
In-Reply-To: <20240417003639.13bfd801@namcao>
Cc: Mike Rapoport <rppt@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jan Kara <jack@suse.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org,
 Theodore Ts'o <tytso@mit.edu>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Alexandre Ghiti <alex@ghiti.fr>
To: Nam Cao <namcao@linutronix.de>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
 <8734rlo9j7.fsf@all.your.base.are.belong.to.us> <Zh6KNglOu8mpTPHE@kernel.org>
 <20240416171713.7d76fe7d@namcao> <20240416173030.257f0807@namcao>
 <87v84h2tee.fsf@all.your.base.are.belong.to.us>
 <20240416181944.23af44ee@namcao> <Zh6n-nvnQbL-0xss@kernel.org>
 <Zh6urRin2-wVxNeq@casper.infradead.org> <Zh7Ey507KXIak8NW@kernel.org>
 <20240417003639.13bfd801@namcao>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_151046_575780_99E45E4A 
X-CRM114-Status: GOOD (  26.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2158256078385170518=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2158256078385170518==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_B97920C0-75B2-43B7-A029-2F2368082F1C";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_B97920C0-75B2-43B7-A029-2F2368082F1C
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

On Apr 16, 2024, at 4:36 PM, Nam Cao <namcao@linutronix.de> wrote:
> 
> On 2024-04-16 Mike Rapoport wrote:
>> On Tue, Apr 16, 2024 at 06:00:29PM +0100, Matthew Wilcox wrote:
>>> On Tue, Apr 16, 2024 at 07:31:54PM +0300, Mike Rapoport wrote:
>>>>> -	if (!IS_ENABLED(CONFIG_64BIT)) {
>>>>> -		max_mapped_addr = __pa(~(ulong)0);
>>>>> -		if (max_mapped_addr == (phys_ram_end - 1))
>>>>> -			memblock_set_current_limit(max_mapped_addr - 4096);
>>>>> -	}
>>>>> +	memblock_reserve(__pa(-PAGE_SIZE), PAGE_SIZE);
>>>> 
>>>> Ack.
>>> 
>>> Can this go to generic code instead of letting architecture maintainers
>>> fall over it?
>> 
>> Yes, it's just have to happen before setup_arch() where most architectures
>> enable memblock allocations.
> 
> This also works, the reported problem disappears.
> 
> However, I am confused about one thing: doesn't this make one page of
> physical memory inaccessible?
> 
> Is it better to solve this by setting max_low_pfn instead? Then at
> least the page is still accessible as high memory.

Is that one page of memory really worthwhile to preserve?  Better to
have a simple solution that works, maybe even mapping that page
read-only so that any code which tries to dereference an ERR_PTR
address immediately gets a fault?

Cheers, Andreas

> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fa34cf55037b..6e3130cae675 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -197,7 +197,6 @@ early_param("mem", early_mem);
> static void __init setup_bootmem(void)
> {
> 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
> -	phys_addr_t max_mapped_addr;
> 	phys_addr_t phys_ram_end, vmlinux_start;
> 
> 	if (IS_ENABLED(CONFIG_XIP_KERNEL))
> @@ -235,23 +234,9 @@ static void __init setup_bootmem(void)
> 	if (IS_ENABLED(CONFIG_64BIT))
> 		kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
> 
> -	/*
> -	 * memblock allocator is not aware of the fact that last 4K bytes of
> -	 * the addressable memory can not be mapped because of IS_ERR_VALUE
> -	 * macro. Make sure that last 4k bytes are not usable by memblock
> -	 * if end of dram is equal to maximum addressable memory.  For 64-bit
> -	 * kernel, this problem can't happen here as the end of the virtual
> -	 * address space is occupied by the kernel mapping then this check must
> -	 * be done as soon as the kernel mapping base address is determined.
> -	 */
> -	if (!IS_ENABLED(CONFIG_64BIT)) {
> -		max_mapped_addr = __pa(~(ulong)0);
> -		if (max_mapped_addr == (phys_ram_end - 1))
> -			memblock_set_current_limit(max_mapped_addr - 4096);
> -	}
> -
> 	min_low_pfn = PFN_UP(phys_ram_base);
> -	max_low_pfn = max_pfn = PFN_DOWN(phys_ram_end);
> +	max_pfn = PFN_DOWN(phys_ram_end);
> +	max_low_pfn = min(max_pfn, PFN_DOWN(__pa(-PAGE_SIZE)));
> 	high_memory = (void *)(__va(PFN_PHYS(max_low_pfn)));
> 
> 	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));


Cheers, Andreas






--Apple-Mail=_B97920C0-75B2-43B7-A029-2F2368082F1C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAmYgSN0ACgkQcqXauRfM
H+DTLw/9EwRBw0cRdgYXbwAYsBH4sVkfgtbtkgDwHRrlhS6n2fVLjymfTmEtn++p
28ksq83sFuQ/G5E6hPw5WOrOygWfww4hjLLM3kGvHf0iiMc7hR4ElbGEMbY8Iyu7
dA8A0aStRJHcJpYi0aMfUF2SCnCIAp1Q11JFgfw3g2sqNSWMUTw22R57BD6W8GJB
3zD+y/EhOWzT28zBq8sB55ynr6TVQXf/G/M7Kdr6QQ98oXEDVYLtdT0B0p4JaHXM
TxQkijrAIJHHZ4oWd2B749JUwoq4zqtCUp9jaJkwfvuL2889TOdxNV4Ae0LHv51t
k+N5NsQ8WILPQ+sIJezIHxswFkHLiczoVw6W9J/JQOq3PmiF3JeADAsLOgPOA7VH
8bicPF2GT+yi7amnzN5pdl7oB0rk/qQMlotJjzfCZpx/7hKOjeAA3m4PGLJDNnWV
XaW47LVUJxk+LKjhTRIWXReNWVfpEMi/YnVyLSVg5CNl7FQPYq6ybhnVbwlOmcUr
WZCqFJGuomrHtqOUSC/+oW2rREHDhw6s+noEC/g0X8sn5cfMMZognwxvqzgLd7AF
taLTLPGuzc9PcbBlNRfapmCFUczLvbWY1+SjVh3Im8Yq2yaS95J/1kzSkSodexqh
9qHDAikxwiGJxK9HeqITFGaXg+Y9mn+frUuzKfFm1w2koGweqaI=
=VbKS
-----END PGP SIGNATURE-----

--Apple-Mail=_B97920C0-75B2-43B7-A029-2F2368082F1C--


--===============2158256078385170518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2158256078385170518==--

