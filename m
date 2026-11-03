Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEDC606A31B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EASh+6sC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Qpao8Mtf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+RfeGofduUdhPR6kbSxbAOXbF9gK5tQIu6rdPSks6kc=; b=EASh+6sCM8y8l+i4N70gez+WIR
	eV5By9AzlQtvj9M+Vrp3FwXZSUcPgJ5DUf5Jqy+7IfjlEiCoOXp8UxlSJ1nmfrh6JM8wo2Ptx0f+s
	LAAfC1HW5snLQD9u2aCaYQs+O2Q8jPt9bP84Wc+23lvsfYQhNMGdGrk94ytrbaR+aGNfMR4U/ZQMZ
	PvYgD1jyW46GJtihiVaATia/6FnPvKxOKln2+xdaT4mS3zx8coW89WFWUAQLws3byFPtP96yNAn8o
	H41Vye4h9/VeljkiB81YfRAZtB9g3QBo3SXPt7pArajTuH35a9PM6ZyL3MNt3z5y8IZWoLXA3gYat
	X11sphIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOK8D-00000003Wf8-1hsa;
	Tue, 03 Nov 2026 19:25:17 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOK89-00000003Wei-0oaf
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 19:25:16 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261103192510euoutp028f10b42dac642e6622160fd2f469bd5a~kn3zRNUEz1818218182euoutp02K
	for <linux-riscv@lists.infradead.org>; Tue,  3 Nov 2026 19:25:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261103192510euoutp028f10b42dac642e6622160fd2f469bd5a~kn3zRNUEz1818218182euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793733910;
	bh=7PUwfrJVawcXLdfu41PY6uZ3y3+L4mK5joYpI+grGjw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Qpao8Mtfd2URQjUccfzke10r/zvBO8i96Iol6Oks4QfxnNbKN2y5fkGa7tHv9hweB
	 V/F1gx8XGuJR+ZPqIfCNcYRux5iFrJ0AHh4Ty2G/Dx2felApgdDigzb4XLPadl5s07
	 qw71+24Cik5kWKGQmM16vbJDin4bKAo+kDutXFAU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261103192509eucas1p1b2f9e4fdd60dc8eae89579a1440a30f6~kn3yjR5OT3099830998eucas1p1_;
	Tue,  3 Nov 2026 19:25:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261103192508eusmtip2a833c7ccdaf7e75a797dd7005f03374d~kn3yAQfdV2937629376eusmtip29;
	Tue,  3 Nov 2026 19:25:08 +0000 (GMT)
Message-ID: <b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com>
Date: Tue, 3 Nov 2026 20:25:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-mm@kvack.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>, Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Oreoluwa
	Babatunde <oreoluwa.babatunde@oss.qualcomm.com>, Wandun
	<chenwandun1@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv <linux-riscv@lists.infradead.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMuHMdXcM9yvwLBSi-aYRinG3omhu5aoeNVYynfFQsnDDWR-Hw@mail.gmail.com>
X-CMS-MailID: 20261103192509eucas1p1b2f9e4fdd60dc8eae89579a1440a30f6
X-Msg-Generator: CA
X-RootMTR: 20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6
X-EPHeader: CA
X-CMS-RootMailID: 20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6
References: <CGME20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6@eucas1p2.samsung.com>
	<20261015082315.56876-1-m.szyprowski@samsung.com>
	<20261015082315.56876-3-m.szyprowski@samsung.com>
	<CAMuHMdXcM9yvwLBSi-aYRinG3omhu5aoeNVYynfFQsnDDWR-Hw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_112513_508193_8D47C09E 
X-CRM114-Status: GOOD (  21.23  )
X-Spam-Score: -2.8 (--)
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

Hi Geert,

On 03.11.2026 19:04, Geert Uytterhoeven wrote:
> On Thu, 15 Oct 2026 at 10:29, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Get rid of the static, limited-size reserved_mem array and replace it
>> with array allocated by memblock_alloc_raw() and accessed directly or
>> through a temporary early_memremap() mapping (depending on the
>> architecture support). Such mapping is needed for some architectures
>> (like ARM64), where linear map is not yet available during early boot
>> scan. The array is allocated from the bottom of RAM to avoid placing it
>> in highmem area, because some architectures (e.g. Xtensa, C-SKY, MIPS32)
>> set the memblock limit to the end of lowmem only after the early scan.
>> The early mapping is not used on PPC64, where the scan is done before
>> early_ioremap_setup(), but the memory allocated by memblock is already
>> accessible at that point.
>>
>> Having a single, writeable array with all reserved regions removes the
>> need to perform two step initialization introduced by commit
>> 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory
>> regions are processed"), so all regions can be processed during the
>> early scan again.
>>
>> The reserved_mem array is allocated only after all static (defined by
>> the 'reg' property) regions are marked as reserved or no-map, so it
>> cannot be placed in any of them. Errors of the early reservations are
>> not recorded per region, only the fact that some of them failed is
>> stored and a message asking to fix the device-tree is printed. The
>> region specific init functions for the static regions are then called
>> in a separate pass, once the array is available. Then all dynamically
>> allocated reserved regions are processed.
>>
>> Suggested-by: Mike Rapoport <rppt@kernel.org>
>> Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Thanks for your patch, which is now commit aa05faf815836c47 ("of:
> reserved_mem: allocate and map the reserved_mem array early")
> in dt-rh/for-next.
>
> This causes an early crash on BeagleV Starlight Beta:
>
>  [...]
>  earlycon: uart0 MMIO32:0x0000000012440000 (options '115200n8')
>  printk: legacy bootconsole [uart0] enabled
>  printk: debug: skip boot console de-registration.
>  efi: UEFI not found.
> -OF: reserved mem: 0x00000000fb000000..0x00000000fcffffff (32768 KiB)
> map non-reusable framebuffer@fb000000
> -OF: reserved mem: 0x00000000f9000000..0x00000000f9ffffff (16384 KiB)
> map non-reusable framebuffer@f9000000
> -OF: reserved mem: 0x00000000d0000000..0x00000000f7ffffff (655360 KiB)
> map non-reusable framebuffer@d0000000
> -OF: reserved mem: 0x00000000c9000000..0x00000000ccffffff (65536 KiB)
> map non-reusable framebuffer@c9000000
> -OF: reserved mem: 0x00000000fa000000..0x00000000faffffff (16384 KiB)
> nomap non-reusable dma-reserved@fa000000
> -Reserved memory: created DMA memory pool at 0x000000107a000000, size 16384 KiB
> -OF: reserved mem: initialized node linux,dma@107a000000, compatible
> id shared-dma-pool
> -OF: reserved mem: 0x000000107a000000..0x000000107affffff (16384 KiB)
> nomap non-reusable linux,dma@107a000000
> -SBI HSM extension detected
> -[...]
> +Oops - store (or AMO) access fault [#1]
> +Modules linked in:
> +CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
> 7.4.0-rc1-starlight-00002-gaa05faf81583 #411 PREEMPT
> +Hardware name: BeagleV Starlight Beta (DT)
> +epc : __memset+0x68/0xfe
> + ra : fdt_scan_reserved_mem+0x3a4/0x80a
> +epc : ffffffff8087fd88 ra : ffffffff80a313c8 sp : ffffffff81403c20
> + gp : ffffffff814dc6c0 tp : ffffffff8140cf80 t0 : ffffffc4fea38ff0
> + t1 : 0000000080200000 t2 : ffffffc4fec03008 s0 : ffffffff81403d10
> + s1 : ffffffffffffffff a0 : ffffffc4fea39000 a1 : 0000000000000000
> + a2 : 00000000000000f0 a3 : ffffffc4fea390f0 a4 : 0000000000000008
> + a5 : ffffffff8087fd88 a6 : 00000000000000f0 a7 : 0000000000001000
> + s2 : ffffffc4fec00000 s3 : 00000000000000f0 s4 : 0000000000000000
> + s5 : 0000000000002de0 s6 : 0000000000000006 s7 : fffffffffefefefe
> + s8 : ffffffc4fec02fd4 s9 : ffffffff8148e318 s10: fffffffffefefeff
> + s11: ffffffc4fea39000 t3 : ffffffff8150df00 t4 : ffffffff8150df00
> + t5 : ffffffff8150df00 t6 : ffffffff8150df78 ssp : 0000000000000000
> +status: 0000000200000100 badaddr: ffffffc4fea39000 cause: 0000000000000007
> +[<ffffffff8087fd88>] __memset+0x68/0xfe
> +[<ffffffff80a2f63a>] early_init_fdt_scan_reserved_mem+0xa4/0x110
> +[<ffffffff80a06c8e>] paging_init+0x17c/0x46a
> +[<ffffffff80a046dc>] setup_arch+0xdc/0x584
> +[<ffffffff80a009b8>] start_kernel+0x98/0x940
> +Code: 0000 8793 00e7 8305 97ba 8782 b023 00b2 b423 00b2 (b823) 00b2
> +---[ end trace 0000000000000000 ]---
> +Kernel panic - not syncing: Fatal exception in interrupt
> +---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
>
> Reverting the commit fixes the issue.

Does moving early_init_fdt_scan_reserved_mem() to the end of setup_bootmem()
in arch/riscv/mm/init.c change anything?

Could You provide a full boot log from the working kernel and /proc/iomem dump?


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
