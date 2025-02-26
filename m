Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B552C021BF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nV+XgshxRmhGDeErvw5NwA7Bs1bWKb3QS7lm0XT16dY=; b=Yz/22w8tdbk7ZZ
	W3jN20oRjGuvGDmNsnBLTE03mhpHjCnxELZ9cbVbU20x2IHabtgtKj0eOoxd1Mb7FGcZDh9EqlKz5
	8MuvjTZw8x7NQgieuUkNDf1kAsqq0l0PdiXgUTlsvwKnCm9U1Ef5uvz5+TocOUZ//VEsyAelncVta
	L+fmqxupOGuGRrIJ+nhJjVtSKYc360+eauoWifU7jf8whVd0fsS9sEQRtYP2ay97ydp//zt24GeFu
	F784qQ1ItMBrwT6kPIrKX53+ldnwHArttbPSERVVP8Oa3LxX/vwCBopP+8VOV8XasOuaFJPTlLLQR
	/LiVk30CGJPyrXtDeNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHxI-00000003zmp-1VOy;
	Wed, 26 Feb 2025 14:00:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHvh-00000003zS0-1BAB
	for linux-riscv@bombadil.infradead.org;
	Wed, 26 Feb 2025 13:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D5mdHs/eSBkcPMXaxnTiOllJKKa7mKOKb2QNG1Fsaf4=; b=VFBJHcYZSy++BPmNsmAdd/9kPe
	7m3d7VN9gjK2uhMFV19OdXTLbtxDA+jG3uozAaX0ngOcFieGSG6OXG8t+6MeIqItBO9zbPns9xT88
	MUs2CgxzwWw/Zn5Dwz6jQ2ZYOYGTdSTuqQCWngO7a71UDnxNhTm21om5uUfi9a4ko9Z8Vr4RxUgk1
	aUOEHOrtsWD/aTv2qn5PiCmHyiENCZUg3d6NrATMvyTahUEpziNTJxxezDV1VsqZ1VeEC+OEz/VqO
	QK/zJcUvRNsIxHPaUYYWQEZsi/jVK3YwsaQnjWxDuyKkC8qKAMUid2XvpJ0DgXSeyhq4fOZn/Hg0I
	FK6TMSLw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHvd-00000003bqz-27r1
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 13:58:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54F43443E5;
	Wed, 26 Feb 2025 13:58:17 +0000 (UTC)
Message-ID: <1f19a967-d240-4587-98d6-dfae24c6830a@ghiti.fr>
Date: Wed, 26 Feb 2025 14:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: select DMA_DIRECT_REMAP by RISCV_ISA_SVPBMT and
 ERRATA_THEAD_MAE
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Christoph Hellwig
 <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
References: <20250116172950.1989748-1-geomatsi@gmail.com>
 <199526de-4351-4fd7-8f6a-9e8dbf05c184@ghiti.fr> <Z7b6YGiUiUYp9lU-@curiosity>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Z7b6YGiUiUYp9lU-@curiosity>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepuddtvddvvdfhvdevgfeiieduvedvjeegfeegkeejgefgfeetiefftdeuiedtueehnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepghgvohhmrghtshhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdri
 hhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_135825_896946_61034E44 
X-CRM114-Status: GOOD (  29.60  )
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

+cc Marek

On 20/02/2025 10:48, Sergey Matyukevich wrote:
> Hi Alexandre,
>
> On Mon, Feb 17, 2025 at 01:23:28PM +0100, Alexandre Ghiti wrote:
>> Hi Sergey,
>>
>> On 16/01/2025 18:29, Sergey Matyukevich wrote:
>>> Select DMA_DIRECT_REMAP for the RISC-V extensions that allow to set
>>> page-based memory types in PTEs according to the requested DMA
>>> attributes. This is the purpose of Svpbmt or XTheadMae extensions.
>>> Zicbom or XTheadCmo serve a different purpose, providing instructions
>>> to flush/invalidate cache blocks.
>>>
>>> Fixes: 381cae169853 ("riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT")
>>>
>>> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
>>> ---
>>>    arch/riscv/Kconfig        | 2 +-
>>>    arch/riscv/Kconfig.errata | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index d4a7ca0388c0..a5dabb744009 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -603,6 +603,7 @@ config RISCV_ISA_SVPBMT
>>>    	depends on 64BIT && MMU
>>>    	depends on RISCV_ALTERNATIVE
>>>    	default y
>>> +	select DMA_DIRECT_REMAP
>>
>>  From what I read, DMA_DIRECT_MAP relies on the ability to map pages uncached
>> (pgprot_dmacoherent() here
>> https://elixir.bootlin.com/linux/v6.13.2/source/kernel/dma/pool.c#L104). But
>> CONFIG_RISCV_ISA_SVPBMT does not guarantee that the underlying platform
>> supports svpbmt so to me it is wrong to select DMA_DIRECT_MAP, we would need
>> some runtime check instead.
> IIUC this function highlights coherent dma allocation options and their
> requirements even more clearly:
> - https://elixir.bootlin.com/linux/v6.13.2/source/kernel/dma/direct.c#L222
>
>>>    	help
>>>    	   Adds support to dynamically detect the presence of the Svpbmt
>>>    	   ISA-extension (Supervisor-mode: page-based memory types) and
>>> @@ -787,7 +788,6 @@ config RISCV_ISA_ZICBOM
>>>    	depends on RISCV_ALTERNATIVE
>>>    	default y
>>>    	select RISCV_DMA_NONCOHERENT
>>
>> And in the same way, we should not enable RISCV_DMA_NONCOHERENT since
>> CONFIG_RISCV_ISA_ZICBOM does guarantee the presence of zicbom. Because then
>> in mm/dma-noncoherent.c, the cache flush operations are nops.
>>
>> Or am I missing something?
> This is my understanding as well. In fact this patch is almost useless.
> It would only allow to enable DMA_GLOBAL_POOL for platforms that support
> Zicbom, but do not support Svpbmt.
>
> The actual problem is that the RISC-V kernel image cannot have both
> DMA_DIRECT_REMAP and DMA_GLOBAL_POOL since they are now mutually
> exclusive in kernel/dma/Kconfig. This limitation is not convenient for
> RISC-V, where kernels can be built with support for multiple extensions
> and errata. But on boot only appropriate subset of them is enabled based
> on the chip's VENDOR_ID and selected dtb.
>
> Currently a portable RISC-V kernel is suitable only for platforms with
> support for both Zicbom and Svpbmt or their vendor-specific alternatives.
> So it doesn't really matter where DMA_DIRECT_REMAP is selected. Platforms
> without Svpbmt need to build their own non-portable kernels anyway,
> enabling support for DMA_GLOBAL_POOL. For instance, Starfive and Andes
> in arch/riscv/Kconfig.errata and drivers/soc/renesas/Kconfig respectively.
>
> Maybe one possible option would be to revert commit da323d464070
> ("dma-direct: add dependencies to CONFIG_DMA_GLOBAL_POOL") and add runtime
> checks in dma_direct_alloc for dma_alloc_from_global_coherent.


And dma_common_contiguous_remap(). Others? I guess the best would be to 
have a patch to propose, unless Christoph or Marek answer with ideas.

Can you prepare something Sergey?

Thanks,

Alex


>
> In that case RISC-V kernels could be built with support for both
> DMA_GLOBAL_POOL and DMA_DIRECT_REMAP. Global pool code path could be
> enabled only for platforms that explicitly specify it in their dtbs.
>
> Regards,
> Sergey
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
