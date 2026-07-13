Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8924C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 04:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+Agwc5i8BV6j/uqRnibCo/oYxF35Xf+S5crQ09M3a4=; b=er7tv1p3TnCNo8
	R+sn2hgMn8FY4oHJPVt69abMZ4GuHl5I0Jx1f0+v6TIvYeTJ2zP/k3w/kAYRYQZpkfx0YYlknzb1N
	TXbO35o8t5Va5CQvX8HFyaU5XkJTYFfnxZFTzBgy2PHflZESbMHCuLreXhfFc0mZSXFVMpHIN54vC
	McTmYALwX1TBF8LsyAKMbpR3rXX+d8pAHgSKFJOgRPYg+0LY7vqRSkqRDYjd5zyy4FkyI6HzGN0cv
	rg+Cy4Ue0gmiVRG73Bn18ax7xUrpEehi3YhGqpYdgYkXvhYmbs9UCGQAP24+GrBet4HBgwF3oFJPu
	kCK+siA9YfNYy1GjHqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj82n-000000084UK-3xZe;
	Mon, 13 Jul 2026 04:13:25 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj82k-000000084TY-2hRy
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 04:13:23 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-80bb41f7f3cso23156907b3.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783916001; x=1784520801; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=439ZOYrlaCUAeJZ+aD63soMn8aH9d6icmDr23SwquhM=;
        b=eyOs1wAFBwBvxOxM4xnyI57jpTmfkG9Cg74dMX6m517AGBUi3fwbrw+80acrGzribH
         DcjeU9B8uSoEzrAnnfWVYFs0t5uPRRrgXWJuILpDPoXeGmSlGnoOV7lhTnLRNWYf7zr9
         VxDzkhL/RGlSvSf+Ds1MBjiGOoyy0ydVR9SE55SgojgqYX0969rUj9BFlJMuTq/g5WW7
         XE647b44UG1uq2anBEpQt54udqqqL4ynM1lLNr7+bz89tv7gztTA0hojr7ePTzScok/t
         J2Sag9E6Y5VBlUrKWe2PzsIPwQR3Wu2wzVFr/rAEV+NSeFZjAKfV1qScNs1SzH21l0BM
         iW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783916001; x=1784520801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=439ZOYrlaCUAeJZ+aD63soMn8aH9d6icmDr23SwquhM=;
        b=TSlukdP7Ltq1oCLJTbpDpSsSwgGEuoHIVw3gaQ7b2WiOgtH3s+iVlOjReoDgtHKGfw
         JSw5wPg03dpK9W3pmSy6UvKPBRpH8xOPy8+LuDYBekRzBTCQGvqENg6bUrkLGCAFsPda
         rfB7lE6e20kf2IyqlTC2ClrefydPaYldMNq48f0pNs0DYlzHW9cvkDeLoCP6ikEKSYye
         TjfhD4q+JG5XZg6jC91FGoxe+AgPjz1yGxw6Q/lV8lgYSACyLzYrZbUmitIDbeDUAii7
         /2j2TlR2Qx7NNpJQcrzdUpJHvMJvwk+bbE44XJHfKy8xbrcHagb21g2E/7HViEjJkC8L
         FBZA==
X-Forwarded-Encrypted: i=1; AHgh+RopIp21WPCQiN+v2lVpzrQCEQCJJxOeqVorOUqXBy9YcXQURTb1dcswjZbtbr+eOcLG9OXfesy8PK9wlw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi+ZsFIJZpB0NsgZspYGJqOKfF+qt4n5wa7qeJ2MlGuquOPo0J
	Vtc5Ctg5BGin0thQ7kgFh1kx3btczauH03cDGFVhdw07dbYTSpgKk2mcpUVUCkTxrU8=
X-Gm-Gg: AfdE7cmqqc1OrHEUHiwqNoqQVlueJVJivEfDswBtc9KKQaB7V0TS3PUDXHEeNrl705I
	8wqxpk51dp7EZ2AqwANQncR3ZLodhsc/Ko2qaEoKKZ4QfJWl5UC4CQXn+wb7QbNVzmlbma20qBf
	YL03hYOaPsjn7nHwjK/hBiuMhTVsU5bsvD5nov6AvGuFyrElJxTb/ZGchpPtDGmbv0jDrn100NO
	RfSURP+2zbRtzYmBny6oXQHFHsRyPMHF6S6yrrgSNwYRbtnlVG0lWZw4dndrgFeYQWgHKfuFEBu
	Sliuy2AGbICs5m4Eq4SRxYPo9vCNnqI2L1ida4TbwWIA0UengDHnZGggwczM/A03xmtNmQjRd8t
	uCs4/DBzz+SG9pkDSRU+S3sB/nTcUf8qsKuwFS7ukbri+bt2avu2VSDJvnq8IIprsWURd1ThtfO
	JW/2vzaHDRv8wIetQRYtHqaaYr0nHs8mysI8fSd8E8nyLjQRDRO4CZtQSZdA==
X-Received: by 2002:a05:690c:b03:b0:80c:f6bb:5666 with SMTP id 00721157ae682-81e901491a3mr57346417b3.47.1783916001448;
        Sun, 12 Jul 2026 21:13:21 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:55c1:a162:6cca:b98a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be99124sm106251787b3.4.2026.07.12.21.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 21:13:21 -0700 (PDT)
Date: Sun, 12 Jul 2026 23:13:07 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Message-ID: <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709040415.977784-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_211322_693834_7457F684 
X-CRM114-Status: GOOD (  13.87  )
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

Hi Inochi,

On Thu, Jul 09, 2026 at 12:04:14PM +0800, Inochi Amaoto wrote:
> Add all PCIe device node for Spacemit K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  38 ++++
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 ++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 195 +++++++++++++++++++
>  3 files changed, 266 insertions(+)
> 

I see some warnings printed during probe

[   10.842955] r8169 0002:01:00.0: of_irq_parse_pci: failed with rc=-22

[   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22

I see that all the 3 rc nodes are missing an interrupts node and an
interrupt parent (saplic). The vendor DT seems to have this. Not sure if
this is related.

The 10G ethernet probes fine, but the wifi card fails to probe. Seems
like the card is trying to request 32 bit DMA addresses and we're
failing cause we have 64 bit memory only.
The vendor kernel seems to have a patch to enable 36 bit DMA in
the rtw89 driver. That'll probably fix this.

[   10.937754] rtw89_8852be 0004:01:00.0: of_irq_parse_pci: failed with rc=-22
[   10.987983] rtw89_8852be 0004:01:00.0: loaded firmware rtw89/rtw8852b_fw-2.bin
[   10.988151] rtw89_8852be 0004:01:00.0: enabling device (0000 -> 0003)
[   10.988215] (udev-worker): page allocation failure: order:2, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
[   10.988243] CPU: 5 UID: 0 PID: 503 Comm: (udev-worker) Not tainted 7.2.0-rc1-00034-gc57907b4459d #1 PREEMPT(lazy)
[   10.988249] Hardware name: SpacemiT K3 Pico-ITX (DT)
[   10.988252] Call Trace:
[   10.988255] [<ffffffff8001f2b8>] dump_backtrace+0x28/0x48
[   10.988265] [<ffffffff80002612>] show_stack+0x3a/0x58
[   10.988269] [<ffffffff80016432>] dump_stack_lvl+0x5a/0x88
[   10.988274] [<ffffffff80016478>] dump_stack+0x18/0x22
[   10.988277] [<ffffffff803984da>] warn_alloc+0x102/0x120
[   10.988283] [<ffffffff80398b7a>] __alloc_frozen_pages_noprof+0x682/0x1470 
[   10.988288] [<ffffffff80399980>] __alloc_pages_noprof+0x18/0x38
[   10.988292] [<ffffffff80113494>] __dma_direct_alloc_pages.isra.0+0x26c/0x428
[   10.988298] [<ffffffff801137a8>] dma_direct_alloc+0x78/0x3d0
[   10.988301] [<ffffffff8011282c>] dma_alloc_attrs+0x74/0x240
[   10.988309] [<ffffffff031a6bb6>] rtw89_pci_probe+0x20e/0xc90 [rtw89_pci]
[   10.988375] [<ffffffff8087cd1c>] local_pci_probe+0x3c/0x90
[   10.988381] [<ffffffff8087def6>] pci_device_probe+0xde/0x298
[   10.988385] [<ffffffff80a80f3e>] really_probe+0x9e/0x3e0
[   10.988390] [<ffffffff80a81308>] __driver_probe_device+0x88/0x190
[   10.988393] [<ffffffff80a814f8>] driver_probe_device+0x38/0xc0
[   10.988396] [<ffffffff80a81796>] __driver_attach+0xbe/0x208
[   10.988399] [<ffffffff80a7e22c>] bus_for_each_dev+0x6c/0xd0
[   10.988404] [<ffffffff80a806ce>] driver_attach+0x26/0x40
[   10.988407] [<ffffffff80a7fcac>] bus_add_driver+0x15c/0x298
[   10.988410] [<ffffffff80a82a82>] driver_register+0x52/0x118
[   10.988413] [<ffffffff8087c44c>] __pci_register_driver+0x4c/0x70
[   10.988417] [<ffffffff02fbc038>] rtw89_8852be_driver_init+0x30/0xff8 [rtw89_8852be]
[   10.988422] [<ffffffff80017b2a>] do_one_initcall+0x5a/0x2d0
[   10.988427] [<ffffffff8011d7b6>] do_init_module+0x96/0x2c0
[   10.988430] [<ffffffff8011f6c6>] load_module+0x19a6/0x2078
[   10.988434] [<ffffffff80120046>] init_module_from_file+0xce/0x138
[   10.988437] [<ffffffff801202d0>] __riscv_sys_finit_module+0x220/0x398
[   10.988441] [<ffffffff81010c40>] do_trap_ecall_u+0x108/0x588
[   10.988446] [<ffffffff81022a14>] handle_exception+0x16c/0x178
[   10.988455] Mem-Info:
[   10.988483] active_anon:5773 inactive_anon:0 isolated_anon:0
                active_file:0 inactive_file:30149 isolated_file:0
                unevictable:0 dirty:222 writeback:0
                slab_reclaimable:3461 slab_unreclaimable:8595
                mapped:5588 shmem:115 pagetables:949
                sec_pagetables:0 bounce:0
                kernel_misc_reclaimable:0
                free:4028911 free_pcp:0 free_cma:0
[   10.988493] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[   10.988497] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=64kB
[   10.988501] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB 
[   10.988505] 30300 total pagecache pages
[   10.988508] 0 pages in swap cache
[   10.988511] Free swap  = 0kB
[   10.988514] Total swap = 0kB
[   10.988516] 4186368 pages RAM
[   10.988519] 0 pages HighMem/MovableOnly
[   10.988522] 86381 pages reserved
[   10.988525] 0 pages cma reserved
[   10.988528] Memory cgroup min protection 0kB -- low protection 0kB
[   10.988532] rtw89_8852be 0004:01:00.0: failed to alloc dma tx rings
[   10.994421] rtw89_8852be 0004:01:00.0: failed to alloc pci trx rings
[   11.000734] rtw89_8852be 0004:01:00.0: failed to setup pci resource
[   11.007088] rtw89_8852be 0004:01:00.0: probe with driver rtw89_8852be failed with error -12

Regards
Anirudh Srinivasan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
