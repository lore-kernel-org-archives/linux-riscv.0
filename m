Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAC9C87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mtr14sf3a1wEOwQJcgvyA6Y89BkOa2bYR3webpISykw=; b=hjf9LjxLzb1qru
	KHkdm33pTvTWLDySY2VscEGF9kOwuSoQS8ZuqPG/l10xstemdMgJwDbDXrFlDFkvJWub7/zTLs2d2
	v35HF6bFNFCbSLNmNOBJjPT/xSTKx6EIw9i4wGah2qB3vrWSDqqjG8CpF9Ejui6IkbhN/hf0PGHBZ
	AEkT3pnEfFwyxb0kPjQGMYBsRnW7Wcq/alSfdf9yahKPj6sYhBOmFCkZqoQVyDUXVmhvIgsBz9xvU
	iKabu25Uw7RYB2aY+65h1JNR7QeR3sHN6txx0cvbyKwINpaQeGN7wGfBbBPOjIQXqWiO39lVBaNc0
	779M0cS7t/EfBl0QP+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLBZ-0000000DO8X-47Ip;
	Tue, 05 Aug 2025 17:10:49 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKBd-0000000DESO-0CIT;
	Tue, 05 Aug 2025 16:06:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 417DE44427;
	Tue,  5 Aug 2025 16:06:42 +0000 (UTC)
Message-ID: <20c1e656-512e-4424-9d4e-176af18bb7d6@ghiti.fr>
Date: Tue, 5 Aug 2025 18:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] kasan/riscv: call kasan_init_generic in kasan_init
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
 hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-10-snovitoll@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250805142622.560992-10-snovitoll@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudehiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephffhuddtveegleeggeefledtudfhudelvdetudfhgeffffeigffgkeethfejudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepshhnohhvihhtohhllhesghhmrghilhdrtghomhdprhgtphhtthhopehrhigrsghinhhinhdrrgdrrgesghhmrghilhdrtghomhdprhgtphhtthhopehhtggrsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegrnhgurhgvhihknhhvlhesghhmrghilhdrtghomhdprhgtphhtthhopegrghhorhguvggvvheslhhin
 hhugidrihgsmhdrtghomhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepiihhrghnghhqihhngheslhhoohhnghhsohhnrdgtnh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_090649_221039_1BEA9194 
X-CRM114-Status: GOOD (  14.33  )
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

Hi Sabyrzhan,

On 8/5/25 16:26, Sabyrzhan Tasbolatov wrote:
> Call kasan_init_generic() which handles Generic KASAN initialization
> and prints the banner. Since riscv doesn't select ARCH_DEFER_KASAN,
> kasan_enable() will be a no-op, and kasan_enabled() will return
> IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.
>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
>   arch/riscv/mm/kasan_init.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 41c635d6aca..ba2709b1eec 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -530,6 +530,7 @@ void __init kasan_init(void)
>   
>   	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
>   	init_task.kasan_depth = 0;
> +	kasan_init_generic();


This is right before actually setting the new mapping to the mmu (which 
is done below by setting a register called SATP). It does not seem to be 
a problem though, just wanted to let you know.

It boots fine with defconfig + kasan inline so:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


>   
>   	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
>   	local_flush_tlb_all();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
