Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD5BC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHLzXwIho0LXMiTiXr7eG/4JMTfrrIz1nMhJxkrqhE8=; b=kJx4d+Tw0kPsLB
	ZG+0UkwsOHF7ANw3WDGPZcA4TXwHzUVNJAQ8p/p15SoAlQO49RQ6zHRyjC0kwllyO6wrop4XF/aN9
	bzXW5aSf7Ik1yjQQqGgJ9PcB50LrMlmothmlJpV646CMGH84p3nxKXWcPLW6N0ZhQs4REbhzsjWD5
	SeFw26RjRXEQkfK1sf5sUVwDTOo3nt0ZmnQkCe9WTw1XoNLEjtBcGknDh4xf50M/x7WonWrBHbY7E
	Ap1r/EK5DQz64pFtk4YTo6levyP02EfBmF4Fn4FduN7HGExiyF4RpjzO2fUFJqCG8gL6K/24XVp4s
	mle8ozaDrcjtQOepQMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgjk-006C2E-Km; Thu, 18 Aug 2022 14:43:08 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgZE-00658f-CO
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 14:32:18 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D56213F135
	for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660833131;
	bh=gwDW+4RYwfhRBZ46kCKVyEuzg5T1j6VfN7ntWn/5Mlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=j3i0UClG2U+5txuuXXDRVLTbdMXJnHLDbxfWVqTeP1ip8eCM+r0/BFmqmiTo+col1
	 RDIkvvS3tK+O6ehUtgPARa+eli8xMiwPd4zIGWIUgtrlzZmpv0rq2Uda+/yu0Cuhz1
	 eodv4nL5FMZL/PyZtEW/Xmwg89W8/9sqOhFGLDMK14ltChwXfKUQr6U1WmW93NYFb1
	 XQLMfHpXT9fmMTjgWtcQnbz9Rmswux6HYvioH3CexuDkDM18iszZmnXpjKoWohkgzV
	 OBpgbYTqU4OayZc5QpcriOrO+aozdEEEg63I7RCp1w3yzjbl9e7DdYuEVdq52Rj5/z
	 hZXayOJ2bZ4sQ==
Received: by mail-ej1-f69.google.com with SMTP id js11-20020a17090797cb00b00730d73eac83so737993ejc.19
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 07:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gwDW+4RYwfhRBZ46kCKVyEuzg5T1j6VfN7ntWn/5Mlk=;
        b=6oNZ+sRJ8/XsSNnUq4Twfv2zELaAjDE+EW8azzjxMQAKi5mlsWMICx6qVFPWo+DlO3
         CaOOtx5JEU1ldDKz0Q3aBLiVl9L1HWnonYe95vboOmF+FHH3IQ4apdOeRuzSPgGTrpTr
         gpD2IA4MS/CNchLfNA7d0F5TRQM3JKURK4xgJOFq32Y7lVDzX/xUHE8nOrVy6OFm+LwO
         VpZ0s3v2TZFKZ0zQsgIkEoQoXaHiaM426rZf8uTkQOn2wZEBkZPEqFyd7AaA6KzfqAcG
         clFD+26RJm1nXKR2nt/Hi3yroJ/4v/bRkdm5AopAEb9fa+DCZRSG6w4jwGn+drnBlN6L
         3NIA==
X-Gm-Message-State: ACgBeo1DFrTIbeR/CXRcS57kwySzMp51D9Ws/DfK/oNfhHq4/swTKvqx
	gVYVyimM7nNcixZ5/QD9aTZGdohohvDOcwbCwONFEqbtelG7INKcTHNdtw3/fKtLksy5RSfANl9
	JrSWcLvHeJI+FAuMtmwGNhI8TB/+dWHK8sPrDezl2bRt+2A==
X-Received: by 2002:a17:907:a218:b0:731:2b2b:f34 with SMTP id qp24-20020a170907a21800b007312b2b0f34mr2114187ejc.404.1660833131421;
        Thu, 18 Aug 2022 07:32:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6az5C/9bebVpA7bnVqgTvo8/hKRZ9Y2bBROGDZEy2t/wTpSeFvWpqPd6IqgrBuQ0Xc0rHB3w==
X-Received: by 2002:a17:907:a218:b0:731:2b2b:f34 with SMTP id qp24-20020a170907a21800b007312b2b0f34mr2114163ejc.404.1660833131141;
        Thu, 18 Aug 2022 07:32:11 -0700 (PDT)
Received: from [192.168.123.67] (ip-084-118-157-002.um23.pools.vodafone-ip.de. [84.118.157.2])
        by smtp.gmail.com with ESMTPSA id w8-20020a50fa88000000b0043a7134b381sm1229506edr.11.2022.08.18.07.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 07:32:10 -0700 (PDT)
Message-ID: <2c6f8f3c-273f-d66b-e517-b129c7718e45@canonical.com>
Date: Thu, 18 Aug 2022 16:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: RISC-V reserved memory problems
Content-Language: en-US
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 frowand.list@gmail.com, robh+dt@kernel.org, mick@ics.forth.gr,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 Valentina.FernandezAlanis@microchip.com, Daire.McNamara@microchip.com,
 linux-riscv@lists.infradead.org
References: <8e10bf15-9fa9-fe90-1656-35bf3e87e7f8@microchip.com>
 <f8e67f82-103d-156c-deb0-d6d6e2756f5e@microchip.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <f8e67f82-103d-156c-deb0-d6d6e2756f5e@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_073216_774184_0BF0B536 
X-CRM114-Status: GOOD (  43.17  )
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

On 8/16/22 22:41, Conor.Dooley@microchip.com wrote:
> Hey all,
> We've run into a bit of a problem with reserved memory on PolarFire, or
> more accurately a pair of problems that seem to have opposite fixes.
> 
> The first of these problems is triggered when trying to implement a
> remoteproc driver. To get the reserved memory buffer, remoteproc
> does an of_reserved_mem_lookup(), something like:
> 
> 	np = of_parse_phandle(pdev->of_node, "memory-region", 0);
> 	if (!np)
> 		return -EINVAL;
> 
> 	rmem = of_reserved_mem_lookup(np);
> 	if (!rmem)
> 		return -EINVAL;
> 
> of_reserved_mem_lookup() then uses reserved_mem[i].name to try and find
> a match - but this was triggering kernel panics for us. We did some
> debugging and found that the name string's pointer was pointing to an
> address in the 0x4000_0000 range. The minimum reproduction for this
> crash is attached - it hacks in some print_reserved_mem()s into
> setup_vm_final() around a tlb flush so you can see the before/after.
> (You'll need a reserved memory node in your dts to replicate)
> 
> The output is like so, with the same crash as in the remoteproc driver:
> 
> [    0.000000] Linux version 6.0.0-rc1-00001-g0d9d6953d834 (conor@wendy) (riscv64-unknown-linux-gnu-gcc (g5964b5cd727) 11.1.0, GNU ld (GNU Binutils) 2.37) #1 SMP Tue Aug 16 13:42:09 IST 2022
> [    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
> [    0.000000] Machine model: Microchip PolarFire-SoC Icicle Kit
> [    0.000000] earlycon: ns16550a0 at MMIO32 0x0000000020100000 (options '115200n8')
> [    0.000000] printk: bootconsole [ns16550a0] enabled
> [    0.000000] printk: debug: skip boot console de-registration.
> [    0.000000] efi: UEFI not found.
> [    0.000000] before flush
> [    0.000000] OF: reserved mem: debug name is fabricbuf@ae000000
> [    0.000000] after flush
> [    0.000000] Unable to handle kernel paging request at virtual address 00000000401c31ac
> [    0.000000] Oops [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc1-00001-g0d9d6953d834 #1
> [    0.000000] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> [    0.000000] epc : string+0x4a/0xea
> [    0.000000]  ra : vsnprintf+0x1e4/0x336
> [    0.000000] epc : ffffffff80335ea0 ra : ffffffff80338936 sp : ffffffff81203be0
> [    0.000000]  gp : ffffffff812e0a98 tp : ffffffff8120de40 t0 : 0000000000000000
> [    0.000000]  t1 : ffffffff81203e28 t2 : 7265736572203a46 s0 : ffffffff81203c20
> [    0.000000]  s1 : ffffffff81203e28 a0 : ffffffff81203d22 a1 : 0000000000000000
> [    0.000000]  a2 : ffffffff81203d08 a3 : 0000000081203d21 a4 : ffffffffffffffff
> [    0.000000]  a5 : 00000000401c31ac a6 : ffff0a00ffffff04 a7 : ffffffffffffffff
> [    0.000000]  s2 : ffffffff81203d08 s3 : ffffffff81203d00 s4 : 0000000000000008
> [    0.000000]  s5 : ffffffff000000ff s6 : 0000000000ffffff s7 : 00000000ffffff00
> [    0.000000]  s8 : ffffffff80d9821a s9 : ffffffff81203d22 s10: 0000000000000002
> [    0.000000]  s11: ffffffff80d9821c t3 : ffffffff812f3617 t4 : ffffffff812f3617
> [    0.000000]  t5 : ffffffff812f3618 t6 : ffffffff81203d08
> [    0.000000] status: 0000000200000100 badaddr: 00000000401c31ac cause: 000000000000000d
> [    0.000000] [<ffffffff80338936>] vsnprintf+0x1e4/0x336
> [    0.000000] [<ffffffff80055ae2>] vprintk_store+0xf6/0x344
> [    0.000000] [<ffffffff80055d86>] vprintk_emit+0x56/0x192
> [    0.000000] [<ffffffff80055ed8>] vprintk_default+0x16/0x1e
> [    0.000000] [<ffffffff800563d2>] vprintk+0x72/0x80
> [    0.000000] [<ffffffff806813b2>] _printk+0x36/0x50
> [    0.000000] [<ffffffff8068af48>] print_reserved_mem+0x1c/0x24
> [    0.000000] [<ffffffff808057ec>] paging_init+0x528/0x5bc
> [    0.000000] [<ffffffff808031ae>] setup_arch+0xd0/0x592
> [    0.000000] [<ffffffff8080070e>] start_kernel+0x82/0x73c
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> 
> We traced this back to early_init_fdt_scan_reserved_mem() in
> setup_bootmem() - moving it later back up the boot sequence to
> after the dt has been remapped etc has fixed the problem for us.
> 
> The least movement to get it working is attached, and also pushed
> here: git.kernel.org/conor/c/1735589baefc
> 
> The second problem is a bit more complicated to explain - but we
> found the solution conflicted with the remoteproc fix as we had
> to move early_init_fdt_scan_reserved_mem() _earlier_ in the boot
> process to solve this one.
> 
> We want to have a node in our devicetree that contains some memory
> that is non-cached & marked as reserved-memory. Maybe we have just
> missed something, but from what we've seen:
> - the really early setup looks at the dtb, picks the highest bit
>     of memory and puts the dtb etc there so it can start using it
> - early_init_fdt_scan_reserved_mem() is then called, which figures
>     out if memory is reserved or not.
> 
> Unfortunately, the highest bit of memory is the non-cached bit so
> everything falls over, but we can avoid this by moving the call to
> early_init_fdt_scan_reserved_mem() above the dtb memblock alloc that
> takes place right before it in setup_bootmem().
> 
> Obviously, both of these changes are moving the function call in
> opposite directions and we can only really do one of them. We are not
> sure if what we are doing with the non-cached reserved-memory section
> is just not permitted & cannot work - or if this is something that
> was overlooked for RISC-V specifically and works for other archs.
> 
> It does seem like the first issue is a real bug, and I am happy to
> submit the patch for that whenever - but having two problems with
> opposite fixes seemed as if there was something else lurking that we
> just don't have enough understanding to detect.
> 
> Any help would be great!
> 
> Thanks,
> Conor.
> 
> 
> 

Hello Conor,

could you, please, provide the relevant device-tree sniplets.

Please, have a look at the no-map property in
Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt. 
It controls if the kernel in any way will access the memory outside of 
your new driver.

Best regards

Heinrich


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
