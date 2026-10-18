Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A26DCCF2C4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 02:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHKOQpt/LJmSS5IAvJlnrAk6fC2TJg5TiPzWpIhxSWo=; b=hJ4QgaWI/YOw4k
	0a4X+JAgZSlk8LVDihW/aEErYY4HSeZLU2dmyLWUyOPX9Rm97nY8wQYrcfSVsWlGuJyL4Xg7DKhed
	7BkW1LkeqB4mNwNbQQNa6qTxdmO9dH+ZKIgdfYmFYOvcstWFY9Rs6WF8pyvXin0g4eL1XROdI/P3H
	Wpiu685kZBySijXyYv1iGnj2vUI01jEIHI5NS592t4uBlM4fVUaSIsm2TZu55XaYAJTotjYie64AI
	h9dF8MHeZbzdPuTVdnT/NDooA7XyvA2ESnPLvJZhjR8iN5ud9C6GB5cSmNwk5hF4fCnB7UvZEEUph
	mahBp6ywYk2SqjOVpnrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGw8-00000005SzD-1dmA;
	Sun, 18 Oct 2026 02:47:48 +0000
Received: from out-243.mta1.migadu.com ([95.215.58.243] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGw4-00000005Syl-2ik8
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 02:47:46 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WxS+3TCBeYHG9YmEk6LXKBqRk8R44++B6wq4kI6AY2Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792291658; v=1; x=1792896458;
 b=Pdqa4RLFOnbuxY+Xb+MSWhrOPMcH7DHresjNYuviQOXB2S1RnSNPd5mKO2+GEq1g89KBAXF7
 laMS8BEg3HQYIbQ0boLUECaLfYcgGJFw+PJvEnQIOORWoWT8m+Kx2+l/MP3cHK9k/2YjX9B9U/g
 1UlvmiCZahYuGI4k0LbnHikw=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 84e66a0eb75a294c;
	Sun, 18 Oct 2026 02:47:38 +0000
X-Mizu-Trace-ID: 84e66a0eb75a294c
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v1] riscv: mm: Define PAGE_KERNEL_RO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261018023649.798595-1-nickolai@csail.mit.edu>
Date: Sun, 18 Oct 2026 10:47:24 +0800
Cc: Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <A6833B23-4C60-4201-942C-5B68733866DD@linux.dev>
References: <20261018023649.798595-1-nickolai@csail.mit.edu>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_194745_308505_33E310E2 
X-CRM114-Status: GOOD (  20.39  )
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



> On Oct 18, 2026, at 10:36, Nickolai Zeldovich <nickolai@csail.mit.edu> wrote:
> 
> Kernel mappings that generic code creates read-only are writable on
> riscv. With HugeTLB vmemmap optimization (selected by riscv and on by
> default with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON), the tail
> vmemmap pages of every optimized huge page are remapped to one shared
> page with PAGE_KERNEL_RO so that a stray write to a tail struct page
> faults. On riscv that remap keeps _PAGE_WRITE, so such a write silently
> changes the struct pages of every optimized huge page instead.

Yeah, I knew, I also have a similar fix locally to resolve this issue.

> early_memremap_ro() (EFI system and configuration tables), the
> firmware loader's vmap() of the loaded image, and acpi_os_ioremap() for
> EFI runtime code and NOMAP regions, which asks for a read-only mapping
> precisely to avoid a writable mapping of executable code, are affected
> the same way.

So it also does affect other components other than HVO, right?

> 
> riscv defines PAGE_KERNEL_READ but not PAGE_KERNEL_RO, so
> include/linux/pgtable.h falls back to "#define PAGE_KERNEL_RO
> PAGE_KERNEL". Define PAGE_KERNEL_RO as PAGE_KERNEL_READ. FIXMAP_PAGE_RO
> then follows from asm-generic/fixmap.h: early_memremap_ro() now passes
> 0xe3 instead of 0xe7 to __early_ioremap().
> 
> Tested on QEMU virt (riscv64, defconfig with
> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON and CONFIG_PTDUMP_DEBUGFS,
> booted with hugepages=8): before, every vmemmap entry in
> /sys/kernel/debug/kernel_page_tables has W set; after, the 28K of tail
> vmemmap of each huge page is mapped R without W.
> 
> Fixes: a3c7d6b642e4 ("riscv: mm: hugetlb: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP")

If yes, so there may be earlier, more suitable Fixes commits?

> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
> 
> Notes:
>    Reproducer (riscv64 defconfig + CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y
>    CONFIG_PTDUMP_DEBUGFS=y, QEMU virt): a static /init that prints the vmemmap
>    part of the kernel page table dump.
> 
>      #include <stdio.h>
>      #include <string.h>
>      #include <sys/mount.h>
>      #include <sys/reboot.h>
> 
>      int main(void)
>      {
>       	char line[256];
>       	int in = 0;
>       	FILE *f;
> 
>       	mount("sysfs", "/sys", "sysfs", 0, NULL);
>       	mount("debugfs", "/sys/kernel/debug", "debugfs", 0, NULL);
>       	f = fopen("/sys/kernel/debug/kernel_page_tables", "r");
>       	while (f && fgets(line, sizeof(line), f)) {
>       		if (strstr(line, "---[ "))
>       			in = strstr(line, "vmemmap start") != NULL;
>       		if (in)
>       			fputs(line, stdout);
>       	}
>       	fflush(stdout);
>       	reboot(RB_POWER_OFF);
>       	return 0;
>      }
> 
>      riscv64-linux-gnu-gcc -static -O2 -o init init.c
>      qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic -kernel Image \
>        -initrd initramfs.cpio -append "console=ttyS0 hugepages=8"
> 
>    Before (all vmemmap entries writable):
>      0xff1c000002000000-0xff1c000002200000  0xbec00000  2M PTE  D A G . . W R V
>      0xff1c000002200000-0xff1c000002800000  0xbea00000  6M PMD  D A G . . W R V
> 
>    After (each huge page: 4K head W, 28K tail read-only, shared page 0x81fd0000):
>      0xff1c0000020a1000-0xff1c0000020a8000  0x81fd0000  28K PTE D A G . . . R V
>      0xff1c0000020a8000-0xff1c0000020a9000  0x81fd6000   4K PTE D A G . . W R V
>      0xff1c0000020a9000-0xff1c0000020b0000  0x81fd0000  28K PTE D A G . . . R V
> 
> arch/riscv/include/asm/pgtable.h | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 40b1ed4f3ea8..13447181ceb7 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -189,6 +189,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
> 
> #define PAGE_KERNEL __pgprot(_PAGE_KERNEL)
> #define PAGE_KERNEL_READ __pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
> +#define PAGE_KERNEL_RO PAGE_KERNEL_READ
> #define PAGE_KERNEL_EXEC __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
> #define PAGE_KERNEL_READ_EXEC __pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
> 					| _PAGE_EXEC)

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

> 
> base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
> -- 
> 2.53.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
