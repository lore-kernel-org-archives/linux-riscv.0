Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BEC606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RkOItLId
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PkJn5DEOMrgtG/twe98k/DAOUEDTno7yyvpmFGP3QCA=; b=RkOItLIdWkJ0FR+Es6LMYA5jUX
	bAFnL8+x6Y9/bTjnEHqJDj3gkNH0G+dhFfNyGwQxijk+++hFsiCAqwZP8S6TApV+qjLnH0cbE2jDA
	hrfqfhtCJYgEi4ws6IVpXRyOeCz1EtQGenSeAwC9bC2qskT/p76Rz3N74q4KJGpuOoT4VEk1I4JEz
	wutNrn1cAFiFLNs3FMkE9Uqn+/T9/w6X+XzPQj1kAM4S8iuFMHysp34u7+h0yYzHXQJzowHrbA4PO
	XsW2HWnpLMp0cdrzxkcJS3rMgcKNATJqGIBN+YcYWuw64b8rZeoyL8mcyftnOu5I5FYeIhOqk38/s
	nOJNB+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWDi-00000004geE-1SLe;
	Wed, 04 Nov 2026 08:19:46 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWDf-00000004gdX-1tpL
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 08:19:45 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eabf243d05so124868e0c.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 00:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780382; x=1794385182;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=42r2UWM+27wxK3ur3WfunLpFTMSv5s5Q7SbgpgMkzU0=;
        b=CQeULCOBANk5yELW3y698aqKFtkIgQ+8TtIZbXyBB2X1FpkwqRLlgwwXGInqqdJuXr
         MGCXUKAQNsgxLHSw9kCNAYAFEnIB+h7tezJP3QCV9kD+hZD+/qlLcL2Wm5KKs06YuWkW
         AolQ/OMf7b/CTKTkJLRMMDVOiuQ7mAdnkUBN7+1sUzsiz0UgOI/IjyWELD3nKWBH+FJ6
         VGtESW7v1w31uxslc/hbbieKaGLGp8Pet7rE6NllCPPrXQRu4QLDo8sUfvEPqz4Bshfi
         ll/U6UW5eQwJVTIFag80X6Ms007HG23XpgzYNrW8g3lVc+Fq8GPvJ/qpKFeb3rgZWcop
         13Gg==
X-Forwarded-Encrypted: i=1; AKwUvBwj9Lvf+LeRwiDoIOl+ge4j74H5XebOEqDSFuzQLvx+3r+YSyJvIsuPFv8GZMbF7Safoe5qgGhSebTEAg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/YuvS58/YpfJGF1ahwRVew/mUvAvoJpS0z6CCnFWCxCF2AH96M
	qq1trq5vFqvTMEVe79MrNDkrl0NKsLsiWvhgr3Dq+Nswid3tpdr41Bj0hPQwTlrZ
X-Gm-Gg: AYBFou3HJLW31hkGU9ccOQ/5dwYJ3m39ww7u9c4+j2kie2i7pVOLmb/djTNsZQXJV1o
	Acs6HnpHQCq1GFwZq/XWQ3M0R7G6sOFO9Z75/4Q3+GjnEx2GJVY+r4pajS58QD1YjVIJmvuSYgG
	iOzgCGDA7Hx5zOKO1dU2Sd/9VZN1J8dPCcFu8hsHThS+7s9K2xCZuB1mXpxqwpZ91zQixqLFEQq
	yrl3Z0iupISYEERYj30zt/HhoupG7G7Jtgjaqc3IMVowrhX5UviXHO+y9l+DvpZiDInb23JyemY
	5Ayu+k/1FNAjoJ8DiNos+UOHYlcfcUDeGsHf0lXGEUtEfhKi7fwm9oKxwQFFOJhnxanaU8GbkFI
	mogP92mSS0uFAEUa2rSPfQ6xEinQTHPhaNfKEsU9jCK5rOH6w+fLMbC2pamTeCvpvOeVAGNDfrD
	uCVFDRQ6cMeFbyJT2ONQtcQS0rZLm64jBvcPTmnLspQngKRqMnR8xzGgZSek0Bm7qrz4tLgZIHe
	kZiJbqbSmi8i5DK7I2rF5h4Rkq164EkThPxzjAHtHNnz5YLkL+6nd1xEynvqPQirYijbzWNm5Ml
	5dEcCG52Nmcq2MB9Q22amYjLkEYpcoYeqFuc1deEIDILUXDfdKizbzxkZ7JeRAvSdQ==
X-Received: by 2002:a05:6102:441a:b0:7d0:6db8:dc43 with SMTP id ada2fe7eead31-7d072ca4385mr5218604137.24.1793780381711;
        Wed, 04 Nov 2026 00:19:41 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3d350sm1126865137.4.2026.11.04.00.19.41
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:19:41 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99061e2171cso131251241.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 00:19:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxhLeBMxugzFvkqi+l/NDhzT+5uexfY+HV2nnqObZiPSwqQG1zDL5R2GtAbdPw8XjBwIhUOD2WU1BMJtA==@lists.infradead.org
X-Received: by 2002:a05:6102:f0b:b0:7a6:cd7e:72db with SMTP id
 ada2fe7eead31-7d072cbfbd3mr6080742137.26.1793780381117; Wed, 04 Nov 2026
 00:19:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6@eucas1p2.samsung.com>
 <20261015082315.56876-1-m.szyprowski@samsung.com> <20261015082315.56876-3-m.szyprowski@samsung.com>
 <CAMuHMdXcM9yvwLBSi-aYRinG3omhu5aoeNVYynfFQsnDDWR-Hw@mail.gmail.com> <b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com>
In-Reply-To: <b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:19:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2ET0Y_=m3LHmL12VNhqK7tBKod0kph6GdZ7Q8XXhP8A@mail.gmail.com>
X-Gm-Features: AclHuK8Bo6Tf1rmFVBv8cZ2-rN7MQ3PgSfZx0PHZRwoGrMuxFYn-96u56ubwNso
Message-ID: <CAMuHMdV2ET0Y_=m3LHmL12VNhqK7tBKod0kph6GdZ7Q8XXhP8A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>, Wandun <chenwandun1@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_001943_515827_BADE2EA0 
X-CRM114-Status: GOOD (  38.02  )
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

On Tue, 3 Nov 2026 at 20:25, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> On 03.11.2026 19:04, Geert Uytterhoeven wrote:
> > On Thu, 15 Oct 2026 at 10:29, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> Get rid of the static, limited-size reserved_mem array and replace it
> >> with array allocated by memblock_alloc_raw() and accessed directly or
> >> through a temporary early_memremap() mapping (depending on the
> >> architecture support). Such mapping is needed for some architectures
> >> (like ARM64), where linear map is not yet available during early boot
> >> scan. The array is allocated from the bottom of RAM to avoid placing it
> >> in highmem area, because some architectures (e.g. Xtensa, C-SKY, MIPS32)
> >> set the memblock limit to the end of lowmem only after the early scan.
> >> The early mapping is not used on PPC64, where the scan is done before
> >> early_ioremap_setup(), but the memory allocated by memblock is already
> >> accessible at that point.
> >>
> >> Having a single, writeable array with all reserved regions removes the
> >> need to perform two step initialization introduced by commit
> >> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
> >> regions are processed"), so all regions can be processed during the
> >> early scan again.
> >>
> >> The reserved_mem array is allocated only after all static (defined by
> >> the 'reg' property) regions are marked as reserved or no-map, so it
> >> cannot be placed in any of them. Errors of the early reservations are
> >> not recorded per region, only the fact that some of them failed is
> >> stored and a message asking to fix the device-tree is printed. The
> >> region specific init functions for the static regions are then called
> >> in a separate pass, once the array is available. Then all dynamically
> >> allocated reserved regions are processed.
> >>
> >> Suggested-by: Mike Rapoport <rppt@kernel.org>
> >> Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Thanks for your patch, which is now commit aa05faf815836c47 ("of:
> > reserved_mem: allocate and map the reserved_mem array early")
> > in dt-rh/for-next.
> >
> > This causes an early crash on BeagleV Starlight Beta:
> >
> >  [...]
> >  earlycon: uart0 MMIO32:0x0000000012440000 (options '115200n8')
> >  printk: legacy bootconsole [uart0] enabled
> >  printk: debug: skip boot console de-registration.
> >  efi: UEFI not found.
> > -OF: reserved mem: 0x00000000fb000000..0x00000000fcffffff (32768 KiB)
> > map non-reusable framebuffer@fb000000
> > -OF: reserved mem: 0x00000000f9000000..0x00000000f9ffffff (16384 KiB)
> > map non-reusable framebuffer@f9000000
> > -OF: reserved mem: 0x00000000d0000000..0x00000000f7ffffff (655360 KiB)
> > map non-reusable framebuffer@d0000000
> > -OF: reserved mem: 0x00000000c9000000..0x00000000ccffffff (65536 KiB)
> > map non-reusable framebuffer@c9000000
> > -OF: reserved mem: 0x00000000fa000000..0x00000000faffffff (16384 KiB)
> > nomap non-reusable dma-reserved@fa000000
> > -Reserved memory: created DMA memory pool at 0x000000107a000000, size 16384 KiB
> > -OF: reserved mem: initialized node linux,dma@107a000000, compatible
> > id shared-dma-pool
> > -OF: reserved mem: 0x000000107a000000..0x000000107affffff (16384 KiB)
> > nomap non-reusable linux,dma@107a000000
> > -SBI HSM extension detected
> > -[...]
> > +Oops - store (or AMO) access fault [#1]
> > +Modules linked in:
> > +CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
> > 7.4.0-rc1-starlight-00002-gaa05faf81583 #411 PREEMPT
> > +Hardware name: BeagleV Starlight Beta (DT)
> > +epc : __memset+0x68/0xfe
> > + ra : fdt_scan_reserved_mem+0x3a4/0x80a
> > +epc : ffffffff8087fd88 ra : ffffffff80a313c8 sp : ffffffff81403c20
> > + gp : ffffffff814dc6c0 tp : ffffffff8140cf80 t0 : ffffffc4fea38ff0
> > + t1 : 0000000080200000 t2 : ffffffc4fec03008 s0 : ffffffff81403d10
> > + s1 : ffffffffffffffff a0 : ffffffc4fea39000 a1 : 0000000000000000
> > + a2 : 00000000000000f0 a3 : ffffffc4fea390f0 a4 : 0000000000000008
> > + a5 : ffffffff8087fd88 a6 : 00000000000000f0 a7 : 0000000000001000
> > + s2 : ffffffc4fec00000 s3 : 00000000000000f0 s4 : 0000000000000000
> > + s5 : 0000000000002de0 s6 : 0000000000000006 s7 : fffffffffefefefe
> > + s8 : ffffffc4fec02fd4 s9 : ffffffff8148e318 s10: fffffffffefefeff
> > + s11: ffffffc4fea39000 t3 : ffffffff8150df00 t4 : ffffffff8150df00
> > + t5 : ffffffff8150df00 t6 : ffffffff8150df78 ssp : 0000000000000000
> > +status: 0000000200000100 badaddr: ffffffc4fea39000 cause: 0000000000000007
> > +[<ffffffff8087fd88>] __memset+0x68/0xfe
> > +[<ffffffff80a2f63a>] early_init_fdt_scan_reserved_mem+0xa4/0x110
> > +[<ffffffff80a06c8e>] paging_init+0x17c/0x46a
> > +[<ffffffff80a046dc>] setup_arch+0xdc/0x584
> > +[<ffffffff80a009b8>] start_kernel+0x98/0x940
> > +Code: 0000 8793 00e7 8305 97ba 8782 b023 00b2 b423 00b2 (b823) 00b2
> > +---[ end trace 0000000000000000 ]---
> > +Kernel panic - not syncing: Fatal exception in interrupt
> > +---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
> >
> > Reverting the commit fixes the issue.
>
> Does moving early_init_fdt_scan_reserved_mem() to the end of setup_bootmem()
> in arch/riscv/mm/init.c change anything?

Unfortunately that doesn't make a difference.

> Could You provide a full boot log from the working kernel and /proc/iomem dump?

Sent by personal email.
The relevant part of /proc/iomem is:

    80000000-cfffffff : System RAM
      80200000-80201fff : Reserved
      80202000-81730bf7 : Kernel image
        80202000-80aa7e73 : Kernel code
        81000000-813fffff : Kernel rodata
        81600000-816dd9ff : Kernel data
        816de000-81730bf7 : Kernel bss
      81730bf8-817fffff : Reserved
      88000000-88007fff : Reserved
      9c000000-c7ffffff : Reserved
      c9000000-ccffffff : Reserved
    d0000000-f7ffffff : Reserved
    f8000000-f8ffffff : System RAM
    f9000000-fcffffff : Reserved
    fd000000-27fffffff : System RAM
      2772e1000-2773a0fff : Reserved
      2773a1000-277fa1fff : Reserved
      277fa2000-277fcbfff : Reserved
      277fce000-277fcefff : Reserved
      277fcf000-27ffcffff : Reserved
      27ffd0000-27fff6fff : Reserved
      27fff7000-27fffffff : Reserved

Thanks!

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
