Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EADC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 04:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bf0uzzcUKUMVpiHh8IHzdXsn9KHgi97ZpXcwx/PHG6Y=; b=14jbpfeYyUFRM9
	yN17ey3Dl+6aM5S/Mcz+Bu9MB7DHZlR1gK20ZLJvF+qp/PAwzxDHM4og38cpUYwujIPwXYSgqsS/q
	1wbUF2kX45RdtazLt47DaHY0FnHqZ9D5RRJi8WmlU9rXUwf1fz142KOTuWA522YBpG2pmxGKJt4Am
	jZSfqZy44NYh6Pf7oXjSKvxnZjhCYvy6oVPn3wAM4LcomHdjVNcd9vvvLUB3xcuhSmMcyKhR767eY
	yTF3ZW8yFwRgQ4jcEdBTynrNX9xv+vCNFmUL7YZBF2j8dTzDpD6i2KzXbsRP+WrQ6FizvLdLXbTXN
	lGGgZWswcjcK+gAoa18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj88s-000000084zp-23hg;
	Mon, 13 Jul 2026 04:19:42 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj88p-000000084zT-2zkB
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 04:19:40 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so108525a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 21:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783916379; x=1784521179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgv4FYkRaN7PLX5rljI9fT7G1HxI9jDppUCYHF4loYE=;
        b=mNBNHF9itRgvBzc7rpOalv0UGJN4R8StQVHU0vRmnJ/4mNK0CGQCnOUP1rgjiIcclL
         dxsTS/+oYM7p9tgbugKbqlYOghjqfCUeWNsT5NKGdJHLjm9FlOGcaGVaBgLLz4h586zO
         ZV92rGQXV28t4RAG8toLPfl5Hhig14pH0YVnWisknTuD0Ik9JzP79Kyz28lJ3hcR9AWl
         ItrHx986FkZx10Iwvcnx0xymTNMCBDj0ApT2QIwDx6bbXFVhAeo0uoppEQWge5hInBAJ
         Ke2QSW3nPGQS7NpgbwWiDnS0G2tnLQ7IGMYVHYcFioIsGBY/wlTgsPMQRJOcBGrQ4kup
         hD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783916379; x=1784521179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgv4FYkRaN7PLX5rljI9fT7G1HxI9jDppUCYHF4loYE=;
        b=XWF/xERtpSMFHdeod4eFnhuMiaqkX2xY+QcUD/yKBv7gqGWtirxqwMjG2e6yDAqmqs
         RGwg1KyaEqWrHc6J2QHJKddyKHccOw3qVQaSbuhYYWMxOiRAEP7/qerWN4v3RLefv5MT
         YL07kcxx/9l/UytoHj64qxHwEPaCT+O9QBawfBjFM3yaFtt2woTPHILUa4T1/zRprbjw
         rag4AEiFRrgKyUvzKUIb9NBKyjQEx8XKgk6iLq44cQcz8qhAqvBhVuXOgmod9dt7qZkk
         6NBiUPqDVdGd86/KZ+p6vGz5sb4zGaB8vWdo4NXKkrwgWyE88RgFcGeRrXs0LLrDTVYC
         ILCw==
X-Forwarded-Encrypted: i=1; AHgh+Rpjg3zIHu7G8WUX0yM005aMTTvDVk0jF7vD3XV8tqdXNu1YmZnpQH3LaP/m6mJWavB+gY7CwpYMHvlCvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5/N4GHnV1PxZuqlbOGyJ/e9PiHcyLEmNurE+ZSRCA6zL9gc9G
	XnZja8GGJtqazoUYFgYHIQxnlWg/ynh8OS7/1eX2PimZ0ywZSDh31n/O
X-Gm-Gg: AfdE7cnheCvqWXEDiKaxPlx2zgHD/k7RgIkyy7wh0uNdLj+8nLd9reNkiqKtIcOvXAg
	fGP1UA7ot4S5CJ90w00sqHnh4Bt2vTfxOE/xiTELi7J+7x2qAf3lCv0n/2zXtVehD3Skto8ii0n
	hqtO4yap01JeO60PsDKznrGe3spV48RqnA31t78ieNYVerHn+Sw29QNe7qksAPH68Q0vYPuge2n
	lQqzfCNAWS0ipzQLtmMOZoMVjGCjUbBgCuyqWHA6Yax03dIngj0sYcMDQV+guIXLrk76zgx2lpm
	IBOqMs+FIZZY2E58xT+QVFYwqhuTmmCs/ky8OkfvrdbLsDcerESRg3Et8x5wtEMfqX/ec9scWYz
	leAAiTOJ+lwE9xdzNZcaMR5RoZq0FKZgkIFtZVPQ7nTUH8MjUOBXItgu3tFrjsV5A
X-Received: by 2002:a17:90b:560f:b0:389:8f6c:4d59 with SMTP id 98e67ed59e1d1-38dc7779d1bmr7680081a91.24.1783916378749;
        Sun, 12 Jul 2026 21:19:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11280409sm2565175a91.0.2026.07.12.21.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 21:19:38 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:18:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Message-ID: <alRmA-X4xbQ9zPFn@inochi.infowork>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-3-inochiama@gmail.com>
 <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_211939_899701_E6B8CEB4 
X-CRM114-Status: GOOD (  24.08  )
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

On Sun, Jul 12, 2026 at 11:13:07PM -0500, Anirudh Srinivasan wrote:
> Hi Inochi,
> 
> On Thu, Jul 09, 2026 at 12:04:14PM +0800, Inochi Amaoto wrote:
> > Add all PCIe device node for Spacemit K3.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
> >  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
> >  3 files changed, 266 insertions(+)
> > 
> 
> I see some warnings printed during probe
> 
> [   10.842955] r8169 0002:01:00.0: of_irq_parse_pci: failed with rc=-22
> 
> [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
> 

This is an expected error because the driver does not support INTx
but the hardware claims it supports. Since the vendor does not want
to support it, so there is no way for the upstreamer to add this.

> I see that all the 3 rc nodes are missing an interrupts node and an
> interrupt parent (saplic). The vendor DT seems to have this. Not sure if
> this is related.
> 
> The 10G ethernet probes fine, but the wifi card fails to probe. Seems
> like the card is trying to request 32 bit DMA addresses and we're
> failing cause we have 64 bit memory only.
> The vendor kernel seems to have a patch to enable 36 bit DMA in
> the rtw89 driver. That'll probably fix this.
> 

This warning is also found on my test, it is not related to
the PCIe driver, but a lack of the RTL phy driver. :(

You may also noticed a bad performance on this 10G ethernet,
it is caused by the single queue used by the RTL driver.
IIRC, even 9800 X3D can not achieve the max speed.

Regards,
Inochi

> [   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
> [   10.987983] rtw89_8852be 0004:01:00.0: loaded firmware rtw89/rtw8852b_fw-2.bin
> [   10.988151] rtw89_8852be 0004:01:00.0: enabling device (0000 -> 0003)
> [   10.988215] (udev-worker): page allocation failure: order:2, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> [   10.988243] CPU: 5 UID: 0 PID: 503 Comm: (udev-worker) Not tainted 7.2.0-rc1-00034-gc57907b4459d #1 PREEMPT(lazy)
> [   10.988249] Hardware name: SpacemiT K3 Pico-ITX (DT)
> [   10.988252] Call Trace:
> [   10.988255] [<ffffffff8001f2b8>] dump_backtrace+0x28/0x48
> [   10.988265] [<ffffffff80002612>] show_stack+0x3a/0x58
> [   10.988269] [<ffffffff80016432>] dump_stack_lvl+0x5a/0x88
> [   10.988274] [<ffffffff80016478>] dump_stack+0x18/0x22
> [   10.988277] [<ffffffff803984da>] warn_alloc+0x102/0x120
> [   10.988283] [<ffffffff80398b7a>] __alloc_frozen_pages_noprof+0x682/0x1470 
> [   10.988288] [<ffffffff80399980>] __alloc_pages_noprof+0x18/0x38
> [   10.988292] [<ffffffff80113494>] __dma_direct_alloc_pages.isra.0+0x26c/0x428
> [   10.988298] [<ffffffff801137a8>] dma_direct_alloc+0x78/0x3d0
> [   10.988301] [<ffffffff8011282c>] dma_alloc_attrs+0x74/0x240
> [   10.988309] [<ffffffff031a6bb6>] rtw89_pci_probe+0x20e/0xc90 [rtw89_pci]
> [   10.988375] [<ffffffff8087cd1c>] local_pci_probe+0x3c/0x90
> [   10.988381] [<ffffffff8087def6>] pci_device_probe+0xde/0x298
> [   10.988385] [<ffffffff80a80f3e>] really_probe+0x9e/0x3e0
> [   10.988390] [<ffffffff80a81308>] __driver_probe_device+0x88/0x190
> [   10.988393] [<ffffffff80a814f8>] driver_probe_device+0x38/0xc0
> [   10.988396] [<ffffffff80a81796>] __driver_attach+0xbe/0x208
> [   10.988399] [<ffffffff80a7e22c>] bus_for_each_dev+0x6c/0xd0
> [   10.988404] [<ffffffff80a806ce>] driver_attach+0x26/0x40
> [   10.988407] [<ffffffff80a7fcac>] bus_add_driver+0x15c/0x298
> [   10.988410] [<ffffffff80a82a82>] driver_register+0x52/0x118
> [   10.988413] [<ffffffff8087c44c>] __pci_register_driver+0x4c/0x70
> [   10.988417] [<ffffffff02fbc038>] rtw89_8852be_driver_init+0x30/0xff8 [rtw89_8852be]
> [   10.988422] [<ffffffff80017b2a>] do_one_initcall+0x5a/0x2d0
> [   10.988427] [<ffffffff8011d7b6>] do_init_module+0x96/0x2c0
> [   10.988430] [<ffffffff8011f6c6>] load_module+0x19a6/0x2078
> [   10.988434] [<ffffffff80120046>] init_module_from_file+0xce/0x138
> [   10.988437] [<ffffffff801202d0>] __riscv_sys_finit_module+0x220/0x398
> [   10.988441] [<ffffffff81010c40>] do_trap_ecall_u+0x108/0x588
> [   10.988446] [<ffffffff81022a14>] handle_exception+0x16c/0x178
> [   10.988455] Mem-Info:
> [   10.988483] active_anon:5773 inactive_anon:0 isolated_anon:0
>                 active_file:0 inactive_file:30149 isolated_file:0
>                 unevictable:0 dirty:222 writeback:0
>                 slab_reclaimable:3461 slab_unreclaimable:8595
>                 mapped:5588 shmem:115 pagetables:949
>                 sec_pagetables:0 bounce:0
>                 kernel_misc_reclaimable:0
>                 free:4028911 free_pcp:0 free_cma:0
> [   10.988493] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
> [   10.988497] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=64kB
> [   10.988501] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB 
> [   10.988505] 30300 total pagecache pages
> [   10.988508] 0 pages in swap cache
> [   10.988511] Free swap  = 0kB
> [   10.988514] Total swap = 0kB
> [   10.988516] 4186368 pages RAM
> [   10.988519] 0 pages HighMem/MovableOnly
> [   10.988522] 86381 pages reserved
> [   10.988525] 0 pages cma reserved
> [   10.988528] Memory cgroup min protection 0kB -- low protection 0kB
> [   10.988532] rtw89_8852be 0004:01:00.0: failed to alloc dma tx rings
> [   10.994421] rtw89_8852be 0004:01:00.0: failed to alloc pci trx rings
> [   11.000734] rtw89_8852be 0004:01:00.0: failed to setup pci resource
> [   11.007088] rtw89_8852be 0004:01:00.0: probe with driver rtw89_8852be failed with error -12
> 
> Regards
> Anirudh Srinivasan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
