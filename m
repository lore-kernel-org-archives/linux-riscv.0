Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC12C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 05:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMjAztdRSVeUpGuoCmc0BSVwjtk5I9OcTGLPeorC7BE=; b=hbCpWx1/e2DiZg
	Z2X3uxdXgS3yWUVu8e4vfdr8wezUtr9VGPr5mDvsJHvwVDffYDBUTBQYh4y8T3M5+H1dNAeQSlcmj
	NsvePQPVAMB8qQ5M5dZIILvAQ2DmjbMiwNWogNLjyc4sGNPUREmQG4JCt/4hXqahD2lY3kbOB1RBt
	YDtBRaeumLmIqfQVgyNM5JwE3tPXwtpTXG4Ck6BesUWoHySNt/dXfpEMboHOX9Huxz3hovCQhlclk
	YDsI+Vszh8SSWYo+mB83ObpQ+04Wjuv1mm5FsD8yAgDPbe/LhrJxMSM2l4ZGvzYOXtn7xaJMmkNRX
	0t83go1AXDyCiL0EQFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oztFN-006ShP-MM; Tue, 29 Nov 2022 05:33:33 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oztFK-006SdV-FW
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 05:33:32 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 8B4EB240003;
	Tue, 29 Nov 2022 05:33:20 +0000 (UTC)
Message-ID: <66e549e8-897b-bfb8-e51d-29a510163dc8@ghiti.fr>
Date: Tue, 29 Nov 2022 06:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: head: use 0 as the default text_offset
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>,
 Atish Kumar Patra <atishp@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221128152442.3403-1-jszhang@kernel.org>
 <CAHBxVyHg0fU9msnV4vgp4oK6aZZv+nc9mFTbTRjHNsgJAG0eyg@mail.gmail.com>
 <e39851df-251d-662d-3319-af9d948a9430@sholland.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <e39851df-251d-662d-3319-af9d948a9430@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_213330_815757_04628E5A 
X-CRM114-Status: GOOD (  20.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/29/22 06:04, Samuel Holland wrote:
> On 11/28/22 14:11, Atish Kumar Patra wrote:
>> On Mon, Nov 28, 2022 at 7:34 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>>> Commit 0f327f2aaad6 ("RISC-V: Add an Image header that boot loader can
>>> parse.") adds an image header which "is based on ARM64 boot image
>>> header and provides an opportunity to combine both ARM64 & RISC-V
>>> image headers in future.". At that time, arm64's default text_offset
>>> is 0x80000, this is to give "512 KB of guaranteed BSS space to put
>>> the swapper page tables" as commit cfa7ede20f13 ("arm64: set TEXT_OFFSET
>>> to 0x0 in preparation for removing it entirely") pointed out, but
>>> riscv doesn't need the space, so use 0 as the default text_offset.
>>>
>>> Before this patch, booting linux kernel on Sipeed bl808 M1s Dock
>>> with u-boot booti cmd:
>>> [    0.000000] OF: fdt: Ignoring memory range 0x50000000 - 0x50200000
>>> ...
>>> [    0.000000]   DMA32    [mem 0x0000000050200000-0x0000000053ffffff]
>>> As can be seen, 2MB DDR(0x50000000 - 0x501fffff) can't be used by
>>> linux.
>>>
>>> After this patch, the 64MB DDR is fully usable by linux
>>> [    0.000000]   DMA32    [mem 0x0000000050000000-0x0000000053ffffff]
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>   arch/riscv/kernel/head.S | 12 +-----------
>>>   1 file changed, 1 insertion(+), 11 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>> index b865046e4dbb..ef95943f7a70 100644
>>> --- a/arch/riscv/kernel/head.S
>>> +++ b/arch/riscv/kernel/head.S
>>> @@ -38,18 +38,8 @@ ENTRY(_start)
>>>          .word 0
>>>   #endif
>>>          .balign 8
>>> -#ifdef CONFIG_RISCV_M_MODE
>>> -       /* Image load offset (0MB) from start of RAM for M-mode */
>>> +       /* Image load offset (0MB) from start of RAM */
>>>          .dword 0
>>> -#else
>>> -#if __riscv_xlen == 64
>>> -       /* Image load offset(2MB) from start of RAM */
>>> -       .dword 0x200000
>>> -#else
>>> -       /* Image load offset(4MB) from start of RAM */
>>> -       .dword 0x400000
>>> -#endif
>>> -#endif
>> NACK.
>> RV64 needs to boot at a 2MB aligned address and RV32 needs to boot at
>> a 4MB aligned address.
>> The firmware is assumed to live at the start of DRAM for Linux running
>> in S-mode.
> What needs to happen so we can stop making this assumption? If the SBI
> implementation wants to reserve memory, it should use the devicetree to
> do so. OpenSBI already does this.
>
> Throwing away 2 MiB of RAM is quite wasteful considering we have
> multiple SoCs (D1s, BL808) that are limited to 64 MiB of in-package RAM.


Actually OpenSBI needs less than 2MB of memory (512KB IIRC), and its 
size is marked in the DT. But in practice, it is the memblock subsystem 
that removes any memory below the 2MB offset because __pa translation is 
"invalid" before setup_vm_final. So we can retrieve 1.5MB by simply 
redefining MIN_MEMBLOCK_ADDR, have a look at 
https://patchwork.kernel.org/project/linux-riscv/patch/20221122084141.1849421-1-alexghiti@rivosinc.com/


>
> Regards,
> Samuel
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
