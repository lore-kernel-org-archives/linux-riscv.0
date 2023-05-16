Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F59DC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Fen96KGKe8Li4CYvvlNvioo7kEDazG0hBpBjZLKdIg=; b=GN2AcFL7zbB3gP
	X8emTDyEcCr72wxlWBne50HY6qwEAM3P1zIrccOlS5tawsfLi8gO11Lbzx2yn8eQI95x/LiZo8fWr
	7jLZ98lZVTdwgPkHz4i4qYjVE03oAY1v9H5zZBLCofNQwBoTlQNwY+nqHvAdx316ewexHgnYLCfFX
	YjlawiaYDKMnY4mmbb5+W0P5+NJyULMo0lNWSx4I3D2D8SvcARvRC/7BXBTtzXIltJZb+UqNJQ1nL
	R50SapTuCcOLOUuIErOJpa+74ymhFvzTC0Zmr7f7RTnYFOi6WDhGszIBUN5h6yquegNlij7j54s0P
	GdXE6rpWXOapnca9VeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyo1a-004Ukq-11;
	Tue, 16 May 2023 06:19:06 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyo1X-004Uik-1N
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 06:19:04 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 0FBEDE0005;
	Tue, 16 May 2023 06:18:47 +0000 (UTC)
Message-ID: <5d894e71-25ad-8ba0-f632-2eec6e017f46@ghiti.fr>
Date: Tue, 16 May 2023 08:18:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Conor Dooley <conor@kernel.org>
References: <20230515141235.0777c631@canb.auug.org.au>
 <54244db6-ff69-4cf8-894c-c3dd2f12df9c@infradead.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <54244db6-ff69-4cf8-894c-c3dd2f12df9c@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_231903_593332_8E77B776 
X-CRM114-Status: GOOD (  11.72  )
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

On 5/16/23 04:45, Randy Dunlap wrote:
>
> On 5/14/23 21:12, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20230512:
>>
> ../arch/riscv/mm/init.c: In function 'create_fdt_early_page_table':
> ../arch/riscv/mm/init.c:925:19: warning: unused variable 'pa' [-Wunused-variable]
>    925 |         uintptr_t pa = dtb_pa & ~(PMD_SIZE - 1);
>        |                   ^~


This one slipped through, I'm adding !BUILTIN_DTB to our internal CI, 
I'll send a fix today.


>
> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .data LMA [000000000041a000,00000000075bffd7] overlaps section .text LMA [00000000000f09d4,00000000033562ab]
> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .init.pi.text LMA [00000000033562ac,0000000003359137] overlaps section .data LMA [000000000041a000,00000000075bffd7]


I'll check this one too which seems to be related to kernel/pi introduction.


>
> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `.L227':
> io-pgtable-arm.c:(.init.text+0x444): undefined reference to `alloc_io_pgtable_ops'
> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `.L0 ':
> io-pgtable-arm.c:(.init.text+0xc4c): undefined reference to `free_io_pgtable_ops'
> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `.L690':
> ipmmu-vmsa.c:(.text+0x2260): undefined reference to `free_io_pgtable_ops'
> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `.L1309':
> ipmmu-vmsa.c:(.text+0x3f24): undefined reference to `alloc_io_pgtable_ops'


Ok, those ones too....


Thanks for the report,


Alex


>
>
> Full randconfig file is attached.
>
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
