Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D417FC282EC
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Mar 2025 12:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0wO7PGNYdA5o9sUY0X3KmV12YkvL99XYmwwdRnNEeo=; b=p388wi0DWh2MRV
	yweW6I8EeTAwBSIYuaDcsbtP9I6Amx/skT6m5SRN3jZkNNZoamuabXcY6xekm2723rgvC/QXPoNOP
	2PIxQwyYciq6vvR6veo6H0Rb8uNmdT+Le/g8JpeegHytB6DgRo+c6EAA958+7XWZAEdmeVTkXl7os
	szXAYpEOgqdLDnc99mKW8ptcu/oXV3mnR8KENUcNG71C1CAFgf1BrbPsxVdT7unI88KD3hPmrRFae
	SV6cSXhzSdbhEKrh8I14IVu/uBQE0a8w/Fzh0hgnoxjRzPdBEVGen77D9MyaBShRluyEsnRG/EUyh
	VsQiwYcbjyug6Xfzr68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtld-0000000GdkT-3xFn;
	Sat, 08 Mar 2025 12:59:01 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqtla-0000000Gdjr-3CUh
	for linux-riscv@lists.infradead.org;
	Sat, 08 Mar 2025 12:59:00 +0000
Message-ID: <a081958f-0ae8-4b8b-b49f-81378f3c05a7@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1741438729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1OfvKUB3yGmFTBmYKmHlndX8vBgO9snLZ4Ez7RHj2M=;
	b=sdcOiWRhA8YKwSSvH28gavOM/pAKtcK1NOjqOECLSCghy10BLInRpbL7DdBAQvhes+zDTB
	saEHyx00EVBMnaN1zM82rhYvwNepdPJAhCe8pDwXhxbo3Qi82DaOZjyxiokcmmExpvysmF
	jUKxwg0e0sxzHXKlMQIPLAYOUaGfIWoE0HzIPta4hTxnANepHy7tAMlbQD3yirdtmqA3Xu
	yMzgi8XuEOJRDu0xSiO6DJn28e5hTXTvm9eKkvFaRmVLrSG83ofr7HyDObpg998Yg2Q2ZM
	94zobioUlhlo+r5X/RZrzLfSJeMq5wYog+PDW44ecKRaMh2yWd6dptWtSb9oRQ==
Date: Sat, 8 Mar 2025 13:58:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] RISC-V CRC optimizations
To: Eric Biggers <ebiggers@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>, Ard Biesheuvel
 <ardb@kernel.org>, Xiao Wang <xiao.w.wang@intel.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, skhan@linuxfoundation.org
References: <20250216225530.306980-1-ebiggers@kernel.org>
 <20250224180614.GA11336@google.com>
 <87ikorl0r5.fsf@all.your.base.are.belong.to.us>
 <20250302220426.GC2079@quark.localdomain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <20250302220426.GC2079@quark.localdomain>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_045859_221955_D05C0295 
X-CRM114-Status: GOOD (  14.03  )
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

Hello!

On 2/3/25 23:04, Eric Biggers wrote:
> So, quite positive results.  Though, the fact the msb-first CRCs are (still) so
> much slower than lsb-first ones indicates that be64_to_cpu() is super slow on
> RISC-V.  That seems to be caused by the rev8 instruction from Zbb not being
> used.  I wonder if there are any plans to make the endianness swap macros use
> rev8, or if I'm going to have to roll my own endianness swap in the CRC code.
> (I assume it would be fine for the CRC code to depend on both Zbb and Zbc.)

I saw this message the other day and started working on a patch, but I
would like to double-check I'm on the right track:

- be64_to_cpu ends up being __swab64 (include/uapi/linux/swab.h) 

If Zbb was part of the base ISA, turning CONFIG_ARCH_USE_BUILTIN_BSWAP 
would take care of the problem, but it is not the case. 

Therefore, we have to define __arch_swab<X> like some "arches"(?) do in 
arch/<ARCH>/include/uapi/asm/swab.h

For those functions to be correct in generic kernels, we would need to 
use ALTERNATIVE() macros like in arch/riscv/include/asm/bitops.h.
Would this be ok? I'm not sure if the ALTERNATIVEs overhead can be a
problem here.

Thanks in advance :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
