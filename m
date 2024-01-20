Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8AEC47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 06:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yh4PhhcjAYqOEodETDwv8IUcJHf4xLpb79gJshB0F3k=; b=4C8odeKin8Yh1c
	bEMS9tNyPigFpUDJBJ11IHdDUW0Sjz6dSvgAM9/NVKjnWF2wEadC0Hx+UND+032Gn86IumtGM92bo
	Nk7HbAMqYT3LuCFMbJjPIY2V5R5KxYzYMUyeJmox7WgYiZiZP6PBUqdfTdw5EoL1dHuMJVUFR8lLi
	eMvsD8BICSiWhpOlm5V/Ly9ZJh8ZM3ZCTReF8tFhRmVmKlhKQS3MQZHkFZGQaIeB0nPp9uRC4tXvy
	0sXLbfsYDkuyyJQQfMbcmx8GSIEAZiwKNcZWEVT+reDqxXWK8JMIup1jlpCZe4b7ecD5QWNIH4DPH
	l0a00JWzXeq9laNjlZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rR5Al-007MI8-1r;
	Sat, 20 Jan 2024 06:49:43 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rR5Ah-007MHB-1H
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 06:49:42 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2900c648b8bso1266257a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 22:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705733377; x=1706338177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tMNq17q3D6EGfQkVBOfkiQr/f5qkK8wzXeUaA36zW64=;
        b=w3cB4dMGhZNyC8F27A8+uFG++x/PYmIXmFVdFCI82JGRXWfrDEwR4nkt9ty5pRQHsK
         eRgsKda6vQ8vXFgSU+oqq7CQWsjODIuvH8qsd5BPAoBcbAGEht8rvqRKvEWSZAkkQMKc
         lCmsVnXzwBXmC2o6zCBInY5de91vF762807/xFebrTdhHodTSWvfU8Mi3FBp8rdmKosQ
         SbQl0QD8pPaOCrwcWGaadvGQU4ura6+MbC0MDtA0MXl3lyrNh4fHE0ETQfPStKCMmqN1
         DgJ8lB+JgXrAxzH1Agsqh7jGPnh1c1zOSkgwwDIRxveaa7xUsvk/OjTmjkaqy5M5DNpG
         Ktwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705733377; x=1706338177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMNq17q3D6EGfQkVBOfkiQr/f5qkK8wzXeUaA36zW64=;
        b=ZeAwrGQ6F7PeSRUtXHGgiLXJRxFqvdr1xb43eOBVNPJXiZai92CNWeZxWwTn2tzjcI
         SKJYe4FHV9uWrNoEa5g6gJtSuLrOJBpKpbmiciC2OKpO2mJ4KTRoMeJTb+bpez9epWqu
         KwBk8MOql4Vv7VEJR9a0dq1t9iKgcCkhSoSf12FFabSeZYq0nHNnI355VtdakKiTHeKO
         cvuXe3CPwV80aPJ7ggpUDCjEr9LyNBkbPxgNTeD4mLCVWgO2fjK3838WgsjHmncPEgh0
         RWCYcaXJGuUFePH3lx2CMOLU+0fefDwxaabvmzg6BqC5hJ1KvLqJrpaqWb6GYCf6rKce
         OIZg==
X-Gm-Message-State: AOJu0YysaXOCnd1/pgpSYPtwVIMPTxdAI2qhnvw82CbeC6+J7WId0p5W
	Y3Ow5Z++Ky2YJBtLlwWWElrcEzdhKJdrraOUa3hvvrggsspr+AVykTL/RoJfI2Q=
X-Google-Smtp-Source: AGHT+IHuiDuKFM2UR73CaJ02HXo9ean1HBHrvYu61hM8hW45PnG18N9ghGARYqYc2iZy9dYx7vea7Q==
X-Received: by 2002:a17:903:2304:b0:1d5:231b:6ea3 with SMTP id d4-20020a170903230400b001d5231b6ea3mr1323587plh.16.1705733377493;
        Fri, 19 Jan 2024 22:49:37 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:9c37:413:ae5:27a4])
        by smtp.gmail.com with ESMTPSA id y11-20020a170903010b00b001d706bb2711sm3790425plc.22.2024.01.19.22.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 22:49:36 -0800 (PST)
Date: Fri, 19 Jan 2024 22:49:33 -0800
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
Message-ID: <Zats/W/oiaphdWTv@ghost>
References: <20230809232218.849726-1-charlie@rivosinc.com>
 <tencent_F9568C6D8872E30EDFAF20ADF686A31D6E06@qq.com>
 <ZasjJ3HPUVuxr2oG@ghost>
 <tencent_FE461EBE274178ED6047005CCF98D710B807@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_FE461EBE274178ED6047005CCF98D710B807@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_224940_442455_3665CF38 
X-CRM114-Status: GOOD (  49.81  )
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

On Sat, Jan 20, 2024 at 02:13:14PM +0800, Yangyu Chen wrote:
> Thanks for your reply.
> 
> On 1/20/24 09:34, Charlie Jenkins wrote:
> > On Sun, Jan 14, 2024 at 01:26:57AM +0800, Yangyu Chen wrote:
> > > Hi, Charlie
> > > 
> > > Although this patchset has been merged I still have some questions about
> > > this patchset. Because it breaks regular mmap if address >= 38 bits on
> > > sv48 / sv57 capable systems like qemu. For example, If a userspace program
> > > wants to mmap an anonymous page to addr=(1<<45) on an sv48 capable system,
> > > it will fail and kernel will mmaped to another sv39 address since it does
> > 
> > Thank you for raising this concern. To make sure I am understanding
> > correctly, you are passing a hint address of (1<<45) and expecting mmap
> > to return 1<<45 and if it returns a different address you are describing
> > mmap as failing? If you want an address that is in the sv48 space you
> > can pass in an address that is greater than 1<<47.
> > 
> > > not meet the requirement to use sv48 as you wrote:
> > > 
> > > > 	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> > > > 		mmap_end = VA_USER_SV48;			\
> > > > 	else							\
> > > > 		mmap_end = VA_USER_SV39;			\
> > > 
> > > Then, How can a userspace program create a mmap with a hint if the address
> > > > = (1<<38) after your patch without MAP_FIXED? The only way to do this is
> > > to pass a hint >= (1<<47) on mmap syscall then kernel will return a random
> > > address in sv48 address space but the hint address gets lost. I think this
> > 
> > In order to force mmap to return the address provided you must use
> > MAP_FIXED. Otherwise, the address is a "hint" and has no guarantees. The
> > hint address on riscv is used to mean "don't give me an address that
> > uses more bits than this". This behavior is not unique to riscv, arm64
> > and powerpc use a similar scheme. In arch/arm64/include/asm/processor.h
> > there is the following code:
> > 
> > #define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
> > 					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
> > 					base)
> > 
> > arm64/powerpc are only concerned with a single boundary so the code is simpler.
> > 
> 
> As you say, this code in arm64/powerpc will not meet the issue I address.
> For example, If the addr here is (1<<50) on arm64, the arch_get_mmap_base
> will return base+TASK_SIZE-DEFAULT_MAP_WINDOW which is (1<<vabits_actual).
> And this behavior on arm64/powerpc/x86 does not break anything since we will
> use a larger address space if the hint address is specified on the address >
> DEFAULT_MAP_WINDOW. The corresponding behavior on RISC-V should be if the
> hint address > BIT(47) then use Sv57 address space and use Sv48 when the
> hint address > BIT(38) if we want Sv39 by default.
> 
> However, your patch needs the address >= BIT(47) rather than BIT(38) to use
> Sv48 and address >= BIT(56) to use Sv57, thus breaking existing userspace
> software to create mapping on the hint address without MAP_FIXED set.

Code that needs mmap to provide a specific address must use MAP_FIXED.
On riscv, it was decided that the address returned from mmap cannot be
greater than the hint address. This is currently implemented by using
the largest address space that can fit into the hint address. It may be
possible that this range can be extended to use all of the addresses
that are less than or equal to the hint address.

From reading the code even on arm64 if you pass an address that is
greater than DEFAULT_MAP_WINDOW it is not guaranteed that mmap will
return an address that is greater than DEFAULT_MAP_WINDOW. It may still
be provide an address that is less than DEFAULT_MAP_WINDOW if it fails
to find an address above. This seems like this would also break your use
case.

> 
> > > violate the principle of mmap syscall as kernel should take the hint and
> > > attempt to create the mapping there.
> > 
> > Although the man page for mmap does say "on Linux, the kernel will pick
> > a nearby page boundary" it is still a hint address so there is no strict
> > requirement (and the precedent has already been set by arm64/powerpc).
> > 
> 
> Yeah. There is no strict requirement. But currently x86/arm64/powerpc works
> in this situation well. The hint address on these ISAs is not used as the
> upper bound to allocating the address. However, on RISC-V, you treat this as
> the upper bound.
> 
> > > 
> > > I don't think patching in this way is right. However, if we only revert
> > > this patch, some programs relying on mmap to return address with effective
> > > bits <= 48 will still be an issue and it might expand to other ISAs if
> > > they implement larger virtual address space like RISC-V sv57. A better way
> > > to solve this might be adding a MAP_48BIT flag to mmap like MAP_32BIT has
> > > been introduced for decades.
> > > 
> > > Thanks,
> > > Yangyu Chen
> > > 
> > 
> > - Charlie
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
