Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0CAC47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 19:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZR/hbq9uhCIF6TicK2/sVeDqmcXtoDzALIgw8h3GR0=; b=yqUDM4SutxRocw
	VjDh/i+TEgbQd0NSvFhE1Bq953v2a2wsX2DlKPCUKWPLu5fPjlJh81IWJrA0olvHDsmjAtZTAZEVO
	kdr9nmnQeEPWBIy5DjGBirWU2S33jJAly2+kgd5+TdEHWEUCZ7gxL9AcStG57N4IkWOi0z02yRBWN
	LdBE2e2HNW84vPSuJH0cABv0kXWmCNJ/IF5VxUBy9sb/H+lSM9trQTrAeUXLYpRtbMMx36yChAtbk
	BSdotwHIMPJ8yBZla7UVGAydcFYX/W8+E6C6L0SEa/xMwgnJgzOGEYvSWJ1BfIQHEVnnBn3AGWCgw
	s47sk/GwzaoT5FhHhykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0PT-00Dp4R-32;
	Mon, 22 Jan 2024 19:56:43 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0PQ-00Dp3I-17
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 19:56:42 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2817407a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 11:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705953395; x=1706558195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UH3ZxhToA5oQfyXBCJ4srePY/ACWm4Ai6nHOFGyU640=;
        b=pqRVm4rlNBwaOTMyr8z1xsL3FO1OZgjnOf4gd+b897UFjE7gzlxP27cMOPXSIDFCDv
         3Cs8y2+CU9pDa8Kjdz+c4xx+0PeBFDV+AZC/ykAXYWpURqYom9qeGaHx+LeAdXOCXHah
         Nrd7tJDpcPj9MvCofU/unJ9LNOv3YgjVTQpj/87vA7h5pUhU2Hpy64AzOflfo8TzHTDE
         sBVXmwRTKrscKqxHIgC3WFpc//hVUa4/gUW6RTvSRzc1L9HqXiNhIcAh/ztgpOeB/jhd
         v+okl8UWYYo7mB+1a+gb23caLjYqd2ZYyMuA5mkkRAye7LXAspgWFy6HirIzKC0U9qoN
         yi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705953395; x=1706558195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UH3ZxhToA5oQfyXBCJ4srePY/ACWm4Ai6nHOFGyU640=;
        b=BXUugB0LOjPCAGS8XPcpePqLdVGREa0MB74bhp0SB7zW9srydzN4bEO5GzZT7zpPO6
         NvQX9C9e+jWt7b73UsdtPs66W95pgSjv2caRu4HsP0Tos0K9Jv2cH4Jnfk0lFKaIYqQJ
         bTTIGfkMPniy4GcoUr3B66//tvDMh7FBOUZlgEfzVo0LK3o7QDIZaawoI8u4r47vyilw
         A59M4cTMnBGRNqBZp3J2AEMcsKukmgDG/hz7pyhowWSYmd/onLD92IwZ1cQotGkEUHmA
         VbZy4wDWU60D/9eQ2kGwvCdMong/UzdEh49U7OFWJOIb/NX4Cp54/mZS7VEYQNYjCRkX
         fxZg==
X-Gm-Message-State: AOJu0YwJm96z0D53d7EmMuQzE5YjDN4rbKaUyekRh/BFk4kbSeGZzKHa
	SUE3Zv0j1uom5UbsxhD1xw49FyT42hURvjRXPGlsXFmDwH2j56NSMBmAjFbO9J0=
X-Google-Smtp-Source: AGHT+IELosIoqFP0xlW9ykmXuQHjrS4lU/5p79wfCOzfjuOQzfpaOXw8gaBbyXJ6ZQFkAIC9bM85zQ==
X-Received: by 2002:a17:90a:fe0a:b0:290:6e71:7cec with SMTP id ck10-20020a17090afe0a00b002906e717cecmr1580074pjb.75.1705953395560;
        Mon, 22 Jan 2024 11:56:35 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id qa1-20020a17090b4fc100b00290c9b195e9sm214833pjb.28.2024.01.22.11.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 11:56:35 -0800 (PST)
Date: Mon, 22 Jan 2024 11:56:32 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: alexghiti@rivosinc.com, anup@brainfault.org, aou@eecs.berkeley.edu,
	conor@kernel.org, jrtc27@jrtc27.com, konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, mick@ics.forth.gr,
	palmer@rivosinc.com, paul.walmsley@sifive.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v10 0/4] RISC-V: mm: Make SV48 the default address space
Message-ID: <Za7IcJg6hv3OBBch@ghost>
References: <20230809232218.849726-1-charlie@rivosinc.com>
 <tencent_F9568C6D8872E30EDFAF20ADF686A31D6E06@qq.com>
 <ZasjJ3HPUVuxr2oG@ghost>
 <tencent_FE461EBE274178ED6047005CCF98D710B807@qq.com>
 <Zats/W/oiaphdWTv@ghost>
 <tencent_A80D5721462124BDB19CAF4E10473BD55105@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_A80D5721462124BDB19CAF4E10473BD55105@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_115640_383709_A5FB806D 
X-CRM114-Status: GOOD (  62.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 20, 2024 at 03:09:51PM +0800, Yangyu Chen wrote:
> 
> 
> On 1/20/24 14:49, Charlie Jenkins wrote:
> > On Sat, Jan 20, 2024 at 02:13:14PM +0800, Yangyu Chen wrote:
> > > Thanks for your reply.
> > > 
> > > On 1/20/24 09:34, Charlie Jenkins wrote:
> > > > On Sun, Jan 14, 2024 at 01:26:57AM +0800, Yangyu Chen wrote:
> > > > > Hi, Charlie
> > > > > 
> > > > > Although this patchset has been merged I still have some questions about
> > > > > this patchset. Because it breaks regular mmap if address >= 38 bits on
> > > > > sv48 / sv57 capable systems like qemu. For example, If a userspace program
> > > > > wants to mmap an anonymous page to addr=(1<<45) on an sv48 capable system,
> > > > > it will fail and kernel will mmaped to another sv39 address since it does
> > > > 
> > > > Thank you for raising this concern. To make sure I am understanding
> > > > correctly, you are passing a hint address of (1<<45) and expecting mmap
> > > > to return 1<<45 and if it returns a different address you are describing
> > > > mmap as failing? If you want an address that is in the sv48 space you
> > > > can pass in an address that is greater than 1<<47.
> > > > 
> > > > > not meet the requirement to use sv48 as you wrote:
> > > > > 
> > > > > > 	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> > > > > > 		mmap_end = VA_USER_SV48;			\
> > > > > > 	else							\
> > > > > > 		mmap_end = VA_USER_SV39;			\
> > > > > 
> > > > > Then, How can a userspace program create a mmap with a hint if the address
> > > > > > = (1<<38) after your patch without MAP_FIXED? The only way to do this is
> > > > > to pass a hint >= (1<<47) on mmap syscall then kernel will return a random
> > > > > address in sv48 address space but the hint address gets lost. I think this
> > > > 
> > > > In order to force mmap to return the address provided you must use
> > > > MAP_FIXED. Otherwise, the address is a "hint" and has no guarantees. The
> > > > hint address on riscv is used to mean "don't give me an address that
> > > > uses more bits than this". This behavior is not unique to riscv, arm64
> > > > and powerpc use a similar scheme. In arch/arm64/include/asm/processor.h
> > > > there is the following code:
> > > > 
> > > > #define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
> > > > 					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
> > > > 					base)
> > > > 
> > > > arm64/powerpc are only concerned with a single boundary so the code is simpler.
> > > > 
> > > 
> > > As you say, this code in arm64/powerpc will not meet the issue I address.
> > > For example, If the addr here is (1<<50) on arm64, the arch_get_mmap_base
> > > will return base+TASK_SIZE-DEFAULT_MAP_WINDOW which is (1<<vabits_actual).
> > > And this behavior on arm64/powerpc/x86 does not break anything since we will
> > > use a larger address space if the hint address is specified on the address >
> > > DEFAULT_MAP_WINDOW. The corresponding behavior on RISC-V should be if the
> > > hint address > BIT(47) then use Sv57 address space and use Sv48 when the
> > > hint address > BIT(38) if we want Sv39 by default.
> > > 
> > > However, your patch needs the address >= BIT(47) rather than BIT(38) to use
> > > Sv48 and address >= BIT(56) to use Sv57, thus breaking existing userspace
> > > software to create mapping on the hint address without MAP_FIXED set.
> > 
> > Code that needs mmap to provide a specific address must use MAP_FIXED.
> > On riscv, it was decided that the address returned from mmap cannot be
> > greater than the hint address. This is currently implemented by using
> > the largest address space that can fit into the hint address. It may be
> > possible that this range can be extended to use all of the addresses
> > that are less than or equal to the hint address.
> > 
> 
> So this decision might be wrong. It requires some userspace software to
> modify their mmap flags to fit with this. For example, a binary translate
> JIT compiler already probes this platform is capable with Sv48, then want to
> create mapping on some address specified on the mmap hint to align with
> foreign binary native address but also provide a fallback path with
> performance overhead. Your patch here will always let userspace software use

I do not follow. This mechanism allows a program to always know how many
bits will be available in the virtual address provided by mmap,
regardless of the size of the underlying virtual address space.

The phrasing "align with foreign binary native address" seems like the
program requires a specific address, which is never guaranteed by mmap
without MAP_FIXED. If the program is relying on mmap to provide the
address without MAP_FIXED, the program is relying on behavior that
cannot be expected to remain constant across Linux releases.

> a fallback path with performance overhead until the userspace software
> changes its syscall to use MAP_FIXED. But it is not required in x86, arm64,
> powerpc.
> 
> >  From reading the code even on arm64 if you pass an address that is
> > greater than DEFAULT_MAP_WINDOW it is not guaranteed that mmap will
> > return an address that is greater than DEFAULT_MAP_WINDOW. It may still
> > be provide an address that is less than DEFAULT_MAP_WINDOW if it fails
> > to find an address above. This seems like this would also break your use
> > case.
> > 
> 
> Yeah. As I said before, this patch will always let userspace software use a
> fallback path and this only happens in RISC-V. Make default sv48 is right,
> but RISC-V implementation for this and changing the hint address behavior
> might be wrong. And x86, arm64, powerpc already use
> 48-bit address space by default but do not change the meaning of hint
> address on mmap.
> 
> > > 
> > > > > violate the principle of mmap syscall as kernel should take the hint and
> > > > > attempt to create the mapping there.
> > > > 
> > > > Although the man page for mmap does say "on Linux, the kernel will pick
> > > > a nearby page boundary" it is still a hint address so there is no strict
> > > > requirement (and the precedent has already been set by arm64/powerpc).
> > > > 
> > > 
> > > Yeah. There is no strict requirement. But currently x86/arm64/powerpc works
> > > in this situation well. The hint address on these ISAs is not used as the
> > > upper bound to allocating the address. However, on RISC-V, you treat this as
> > > the upper bound.
> > > 
> > > > > 
> > > > > I don't think patching in this way is right. However, if we only revert
> > > > > this patch, some programs relying on mmap to return address with effective
> > > > > bits <= 48 will still be an issue and it might expand to other ISAs if
> > > > > they implement larger virtual address space like RISC-V sv57. A better way
> > > > > to solve this might be adding a MAP_48BIT flag to mmap like MAP_32BIT has
> > > > > been introduced for decades.
> > > > > 
> > > > > Thanks,
> > > > > Yangyu Chen
> > > > > 
> > > > 
> > > > - Charlie
> > > > 
> > > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
