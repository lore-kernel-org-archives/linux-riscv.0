Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77712C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3B5x1Rqe//0ubholCb6V7F8TA1X8YqMw1qCZXTvwnlM=; b=SLxcRtEy+dxsiSih3st/TcBG33
	x5xGXfe2FKP+325Uizr2Yu0X2x+9MmCe8nOBBSPlqUPZwnx3I0xPtd/QFmSB5KUYoF6lAG9+dDYHb
	O0kQAsf3ez/ja733dwLaXNP6LWFyEStCt+7NO3Mh5Sg68Hli9GsMtoB075ACORinb7kLXFho3Addv
	o0egY0P2aYqD1r/EiVBw096jMsVW9uWKnsEhMklfJgI5Io4UnWi3vt/WjkYGOsbzpDcRLdeKq4CU8
	V4S5sxWB6mR52fORnmZokuRk8FDO5+yXQ5Uwai9BgH9qfr/C76clUCl8h5/uYQSeOZjDciPekSTqV
	hwOuZqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4un-0000000CtYU-49L6;
	Fri, 28 Mar 2025 08:18:09 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4uk-0000000CtXl-3pjt
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 08:18:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC744443E0;
	Fri, 28 Mar 2025 08:18:01 +0000 (UTC)
Message-ID: <14b85486-c94d-41a1-aee5-c9ca101bdeaf@ghiti.fr>
Date: Fri, 28 Mar 2025 09:18:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: errata: Use medany for relocatable builds
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, samuel.holland@sifive.com,
 linux-riscv@lists.infradead.org
References: <20250326224506.27165-2-palmer@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250326224506.27165-2-palmer@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepueefhfffheehjeffueehfeffleekfeeguddvgffgvdfhkeevgeejlefhleefhfefnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepfedurdefvddrkedurddukeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepfedurdefvddrkedurddukeejpdhhvghloheplgduledvrdduieekrddvuddrfedungdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepphgrlhhmvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehsrghmuhgvlhdrhhholhhlrghnugesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_011807_089744_5768F3CA 
X-CRM114-Status: GOOD (  16.33  )
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

On 26/03/2025 23:45, Palmer Dabbelt wrote:
> We're trying to mix non-PIC/PIE objects into the otherwise-PIE
> relocatable kernels, to avoid GOT/PLT references during early boot
> alternative resolution (which happens before the GOT/PLT are set up).
>
> riscv64-unknown-linux-gnu-ld: arch/riscv/errata/sifive/errata.o: relocation R_RISCV_HI20 against `tlb_flush_all_threshold' can not be used when making a shared object; recompile with -fPIC
> riscv64-unknown-linux-gnu-ld: arch/riscv/errata/thead/errata.o: relocation R_RISCV_HI20 against `riscv_cbom_block_size' can not be used when making a shared object; recompile with -fPIC


thead erratas are already compiled with medany if 
CONFIG_RISCV_ALTERNATIVE_EARLY is set 
(https://elixir.bootlin.com/linux/v6.14-rc6/source/arch/riscv/errata/thead/Makefile#L2) 
so why isn't it enough?


>
> Fixes: 8dc2a7e8027f ("riscv: Fix relocatable kernels with early alternatives using -fno-pie")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> I'm not 100% sure it's possible to expose this without Samuel's NOMMU
> relocatable builds, see
> <https://lore.kernel.org/all/mhng-517c0318-c8fb-4c4a-aa0e-0d08f8d34d78@palmer-ri-x1c9/>
> ---
>   arch/riscv/errata/Makefile | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
> index f0da9d7b39c3..bc6c77ba837d 100644
> --- a/arch/riscv/errata/Makefile
> +++ b/arch/riscv/errata/Makefile
> @@ -1,5 +1,9 @@
>   ifdef CONFIG_RELOCATABLE
> -KBUILD_CFLAGS += -fno-pie
> +# We can't use PIC/PIE when handling early-boot errata parsing, as the kernel
> +# doesn't have a GOT setup at that point.  So instead just use medany: it's
> +# usually position-independent, so it should be good enough for the errata
> +# handling.
> +KBUILD_CFLAGS += -fno-pie -mcmodel=medany
>   endif
>   
>   ifdef CONFIG_RISCV_ALTERNATIVE_EARLY

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
