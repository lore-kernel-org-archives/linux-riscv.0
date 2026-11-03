Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0C606A31B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j/WWD0C6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N2bucN/EtR4VRltqow+bzZ53Bw6AYaWk/BjQ6KnpwFI=; b=j/WWD0C6+LhK0R1FVkQ3smUwjs
	vbBTdzEAyFYN19VbWRmKTdeVwDzAAI1H4UahsbAGcWSjyeHYSQjXVNGDnAThLN8BFc0kgMwaUfX14
	wYu12yovwstW5ljnlaI3foilD4pL5ebWSU42IDvmrF/uevQjmThgIEGtqGKQ0qnQvk1qcOXSSGYG2
	CHtSjCE/uxCGCBSvVsAJRrJXpc3h4MpnSEYhO9sCk5++aHwqE6hxu9xZCHTPGvRxMm/4hmQOBUpz2
	MZI3rG5dhA4fzFUM5ymmhjJPIFTSyYxqTQY3/U+/dhR1/VeDJrpktJ7DSZjJsl+5FsKkeUsesPgA3
	8Uo4+wOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIsJ-00000003MB9-0p08;
	Tue, 03 Nov 2026 18:04:47 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIsG-00000003MAi-2DXV
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 18:04:46 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c03a445cb8so3071623137.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 10:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729082; x=1794333882;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6s58Pb4hAe6Hy7/bwQYEC0q1H7BmJZKjEQo1aMto/nU=;
        b=JKB6pMbL3s1glNrysOGV8C8ziE4pZLuXRP7i3QbwU9KQxEWDTYStvxAYn0D3wjRKMN
         EOpEm3F/HH2gQT69bumGndfVmQOC0WzkH6vG1UTAdOikxqYF4BN3PE7QUfY4glhck6ei
         fhgT9QgkGnn9ynj44RMmbgTQFKE+FicRzLy7nxkhMzShkWzz2AZB2nv3AIJZd46eL6zg
         LdJkpl3280LgwbVP2SiHBrqRCGtwxip67iDjr04U9Kmd7MbhmWN8RxS9n1SfD+HxX78j
         JICsdqoimQUu/m03Ql71Eah7YuQHz1fV9pPaGUD1PgNxPeSbSc7hfXpr8BQ/vmOcwCtt
         gI0g==
X-Forwarded-Encrypted: i=1; AKwUvByghxhB7x/z45WCNOJqMyc9Plm+6zH2bEVdXeWEO1uDNzs2hcwJM1ngqAVYbx2mZjR2skoGdNjMqVVdTA==@lists.infradead.org
X-Gm-Message-State: APuU4Z99QXPeI7Dqqfi5BJ57JoIlaYcHxaXDzY8irbcthMQyechiERJM
	0igxOcwSLeaEB4dIAf0sjLBHiK4C9aSrBE8HxuYQrdhYZ7zKaftG1hApqhQzfasD
X-Gm-Gg: AYBFou3Zavz8vSRXVynjWQ2YenQSL/M9s6WT79mJeV+rX3qFzmDqlwjkpaJ/rvUxcpZ
	IKJE7LL5LTQttiO7Eh4UMPBHcEVOrMaOL1hrlCa9RF1ZyzN886d5Z5mCDk9C+QApP+B9EIS9s+G
	KM52PKSJsoB6CZHhznfQBtbkMatKMyQmR4feFS+AonJ712YB7gg1Oe0h6sHsUmZHQ3JsooGlhKw
	dEjpiLh1qFoTW/KubxyV6AgcAJCfMQGS9LucNvyrnGJB7AR85Zztgb9C9mwKHnCvap4RAhCvGl4
	uRNToYLEC91BlavdTg50fzvC+cK4YncUJnLkKRUXh0dfhvoUkBynIPE8ndFgR7SHsh963aRkdZH
	yLRqLTLZS4Q1ZHm/gk8LwZ9LZz5q9uozEgSBhxvT59c5zBoNmzr1d/AOAJA22Cc//Q1Xjofx9Xa
	fYCuVfSF3RDkRz7jtROhykILgf6nX/K/vglW/OJF6Uwb8oZLQWhpK0bfa8hdmbS3IWZyU3fOJMB
	1FpS7AjHRFSh/dD9oqeAkVCLkNQHC7r4ME1A/YN+0AVlLR2dOEYTunuoG6BOVv879cEKad8d2fP
	1fWFZ6l2SIS5lVZU4U1Q2dqrEzAeBgS+isJNn/E5wAVgY48GQBPaq/+d4G2nJYcsvg==
X-Received: by 2002:a05:6102:3e8e:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d072bb37c6mr5744373137.9.1793729082498;
        Tue, 03 Nov 2026 10:04:42 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d1cf09b4e6sm656567137.4.2026.11.03.10.04.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:04:40 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc53938a8fso2590057137.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 10:04:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzZHLXjDmpYa8bB4HmTx4/F4aBFlcumr0AY/HdSaj82hPCAcrD5uliDmK8usYjuU64pWSbpLn/92qVwFQ==@lists.infradead.org
X-Received: by 2002:a05:6102:14a3:b0:7a1:f951:664f with SMTP id
 ada2fe7eead31-7d072ca34famr5656944137.22.1793729079166; Tue, 03 Nov 2026
 10:04:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6@eucas1p2.samsung.com>
 <20261015082315.56876-1-m.szyprowski@samsung.com> <20261015082315.56876-3-m.szyprowski@samsung.com>
In-Reply-To: <20261015082315.56876-3-m.szyprowski@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Nov 2026 19:04:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXcM9yvwLBSi-aYRinG3omhu5aoeNVYynfFQsnDDWR-Hw@mail.gmail.com>
X-Gm-Features: AclHuK_SLyopQmsKezfvIJp8vgdHBUR6jbYkiTzIVRA3K3sJMZtG6ZwxF0OVemw
Message-ID: <CAMuHMdXcM9yvwLBSi-aYRinG3omhu5aoeNVYynfFQsnDDWR-Hw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>, Wandun <chenwandun1@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_100444_608512_B2662766 
X-CRM114-Status: GOOD (  28.74  )
X-Spam-Score: -1.6 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marek,

On Thu, 15 Oct 2026 at 10:29, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Get rid of the static, limited-size reserved_mem array and replace it
> with array allocated by memblock_alloc_raw() and accessed directly or
> through a temporary early_memremap() mapping (depending on the
> architecture support). Such mapping is needed for some architectures
> (like ARM64), where linear map is not yet available during early boot
> scan. The array is allocated from the bottom of RAM to avoid placing it
> in highmem area, because some architectures (e.g. Xtensa, C-SKY, MIPS32)
> set the memblock limit to the end of lowmem only after the early scan.
> The early mapping is not used on PPC64, where the scan is done before
> early_ioremap_setup(), but the memory allocated by memblock is already
> accessible at that point.
>
> Having a single, writeable array with all reserved regions removes the
> need to perform two step initialization introduced by commit
> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
> regions are processed"), so all regions can be processed during the
> early scan again.
>
> The reserved_mem array is allocated only after all static (defined by
> the 'reg' property) regions are marked as reserved or no-map, so it
> cannot be placed in any of them. Errors of the early reservations are
> not recorded per region, only the fact that some of them failed is
> stored and a message asking to fix the device-tree is printed. The
> region specific init functions for the static regions are then called
> in a separate pass, once the array is available. Then all dynamically
> allocated reserved regions are processed.
>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for your patch, which is now commit aa05faf815836c47 ("of:
reserved_mem: allocate and map the reserved_mem array early")
in dt-rh/for-next.

This causes an early crash on BeagleV Starlight Beta:

 [...]
 earlycon: uart0 MMIO32:0x0000000012440000 (options '115200n8')
 printk: legacy bootconsole [uart0] enabled
 printk: debug: skip boot console de-registration.
 efi: UEFI not found.
-OF: reserved mem: 0x00000000fb000000..0x00000000fcffffff (32768 KiB)
map non-reusable framebuffer@fb000000
-OF: reserved mem: 0x00000000f9000000..0x00000000f9ffffff (16384 KiB)
map non-reusable framebuffer@f9000000
-OF: reserved mem: 0x00000000d0000000..0x00000000f7ffffff (655360 KiB)
map non-reusable framebuffer@d0000000
-OF: reserved mem: 0x00000000c9000000..0x00000000ccffffff (65536 KiB)
map non-reusable framebuffer@c9000000
-OF: reserved mem: 0x00000000fa000000..0x00000000faffffff (16384 KiB)
nomap non-reusable dma-reserved@fa000000
-Reserved memory: created DMA memory pool at 0x000000107a000000, size 16384 KiB
-OF: reserved mem: initialized node linux,dma@107a000000, compatible
id shared-dma-pool
-OF: reserved mem: 0x000000107a000000..0x000000107affffff (16384 KiB)
nomap non-reusable linux,dma@107a000000
-SBI HSM extension detected
-[...]
+Oops - store (or AMO) access fault [#1]
+Modules linked in:
+CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
7.4.0-rc1-starlight-00002-gaa05faf81583 #411 PREEMPT
+Hardware name: BeagleV Starlight Beta (DT)
+epc : __memset+0x68/0xfe
+ ra : fdt_scan_reserved_mem+0x3a4/0x80a
+epc : ffffffff8087fd88 ra : ffffffff80a313c8 sp : ffffffff81403c20
+ gp : ffffffff814dc6c0 tp : ffffffff8140cf80 t0 : ffffffc4fea38ff0
+ t1 : 0000000080200000 t2 : ffffffc4fec03008 s0 : ffffffff81403d10
+ s1 : ffffffffffffffff a0 : ffffffc4fea39000 a1 : 0000000000000000
+ a2 : 00000000000000f0 a3 : ffffffc4fea390f0 a4 : 0000000000000008
+ a5 : ffffffff8087fd88 a6 : 00000000000000f0 a7 : 0000000000001000
+ s2 : ffffffc4fec00000 s3 : 00000000000000f0 s4 : 0000000000000000
+ s5 : 0000000000002de0 s6 : 0000000000000006 s7 : fffffffffefefefe
+ s8 : ffffffc4fec02fd4 s9 : ffffffff8148e318 s10: fffffffffefefeff
+ s11: ffffffc4fea39000 t3 : ffffffff8150df00 t4 : ffffffff8150df00
+ t5 : ffffffff8150df00 t6 : ffffffff8150df78 ssp : 0000000000000000
+status: 0000000200000100 badaddr: ffffffc4fea39000 cause: 0000000000000007
+[<ffffffff8087fd88>] __memset+0x68/0xfe
+[<ffffffff80a2f63a>] early_init_fdt_scan_reserved_mem+0xa4/0x110
+[<ffffffff80a06c8e>] paging_init+0x17c/0x46a
+[<ffffffff80a046dc>] setup_arch+0xdc/0x584
+[<ffffffff80a009b8>] start_kernel+0x98/0x940
+Code: 0000 8793 00e7 8305 97ba 8782 b023 00b2 b423 00b2 (b823) 00b2
+---[ end trace 0000000000000000 ]---
+Kernel panic - not syncing: Fatal exception in interrupt
+---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Reverting the commit fixes the issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
