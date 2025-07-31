Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1EBC87FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+I9jlKAuQv24ONCMxgb6XL7t3IBuFWWd9PVBhhhY+Cg=; b=C1MLATv9Z2w0JJ
	RMokEASGPhl7U1QvDX6+tM/T4RiK6e2Qx4hehqVVwoM7GEsEMezjUKB4l1miDumpz64KemsRMTqqO
	OsC207pQkQFofteDaGmbRkIRjd62FAnQU+LQDWdG3Pj2BpinaOyxocGcI2yyHP/AAtmA4ipvcmsqE
	oc+WAENoBpMLapRyRum7bvgGAI6r4uIJcUsjJOfZQSNZxXS3MPfiJ3sfJyG7IjibO0mepTDY27slX
	L/X1+ajjxyKq58uIpBBPeRcj1PaSDfrryHfKAlM5x701K2yCN9PAwDIVlhO+vivTQTDRbR6nL2yKe
	5DuoUr14kPOUOipiGkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUyE-00000003vql-3a8R;
	Thu, 31 Jul 2025 15:13:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhURH-00000003s9L-2B5z
	for linux-riscv@bombadil.infradead.org;
	Thu, 31 Jul 2025 14:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QwbZwluq+bc4CMrjQ6T2Yt+kthw/FEwTPVVWZ2qZDiY=; b=j/uN+e7RMVuxAyg0KrOmMhaWFD
	lnf9ymtmCwp+Gz9RxH2ZPu7LIvpNOatu77f1YOtrIfP4U4nEeIntp/aOnFJvO7/1dQCT4LCy9QgrE
	BbJ7hyBzll8aLIaIcDivjBOqw3wAJV98L6ratXTckACo3NIb2T0szHrg6l38wWCRHVe/AyYJjFtCK
	xhflxTG/Nb5bRJd6HjaibWsLRK4gGknsP4uPMvO6gRevfFVwhKH0N6vqJ5v87cMLm3w/WAvIfHRwg
	uMQ4JhPmz7vBGReTaP0I8zp74aUZp9Y11Of4bRUZSmYp0uLOkEkWWdP1e8F7ObZn77bSfe8+vuDhV
	ZfqvU3Cw==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhURE-0000000D4Bt-062H
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 14:39:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45A87442A1;
	Thu, 31 Jul 2025 14:39:09 +0000 (UTC)
Message-ID: <4a887fce-a04a-4c85-8051-50afe88fd098@ghiti.fr>
Date: Thu, 31 Jul 2025 16:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: introduce ioremap_wc()
To: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 catalin.marinas@arm.com, anshuman.khandual@arm.com, kas@kernel.org,
 ryan.roberts@arm.com, samuel.holland@sifive.com, namcao@linutronix.de,
 willy@infradead.org, abrestic@rivosinc.com, yongxuan.wang@sifive.com,
 apopple@nvidia.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Qingfang Deng <qingfang.deng@siflower.com.cn>
References: <20250722091504.45974-1-cuiyunhui@bytedance.com>
 <20250722091504.45974-2-cuiyunhui@bytedance.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250722091504.45974-2-cuiyunhui@bytedance.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvdgrtdegmegtvggttdemuddtjeefmegslegsgeemugejhegvmegtsgefjeemfeekudeimehfkeejvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmedutdejfeemsgelsgegmegujeehvgemtggsfeejmeefkeduieemfhekjegvpdhhvghloheplgfkrfggieemvdgrtdegmegtvggttdemuddtjeefmegslegsgeemugejhegvmegtsgefjeemfeekudeimehfkeejvggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheptghuihihuhhnhhhuihessgihthgvuggrnhgtvgdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsv
 ghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoheprghnshhhuhhmrghnrdhkhhgrnhguuhgrlhesrghrmhdrtghomhdprhgtphhtthhopehkrghssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_153920_324710_3D66EAEE 
X-CRM114-Status: GOOD (  10.94  )
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

Hi Yunhui,

On 7/22/25 11:15, Yunhui Cui wrote:
> Compared with IO attributes, NC attributes can improve performance,
> specifically in these aspects: Relaxed Order, Gathering, Supports Read
> Speculation, Supports Unaligned Access.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> ---
>   arch/riscv/include/asm/io.h      | 4 ++++
>   arch/riscv/include/asm/pgtable.h | 1 +
>   2 files changed, 5 insertions(+)
>
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index a0e51840b9db4..09bb5f57a9d34 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -28,6 +28,10 @@
>   #ifdef CONFIG_MMU
>   #define IO_SPACE_LIMIT		(PCI_IO_SIZE - 1)
>   #define PCI_IOBASE		((void __iomem *)PCI_IO_START)
> +
> +#define ioremap_wc(addr, size)	\
> +	ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL_NC))
> +
>   #endif /* CONFIG_MMU */
>   
>   /*
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 91697fbf1f901..3d17399a06c77 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -203,6 +203,7 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
>   
>   #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
>   
> +#define _PAGE_KERNEL_NC ((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_NOCACHE)
>   #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
>   #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
>   


I have just confirmed with Ved that mapping WC to NC is the correct 
thing to do, so:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

And I'll take that for 6.17.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
