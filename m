Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2589EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3Ha7LHbOrpIoNDO6YuQtwqRzS7+JD4FFCFsD8vbQjc=; b=1J5pbfX5mKs2bq
	EpVPN85LuW/rKsubQiZ5rHe+7RB1hjoNDRrzIreqoB4/Bdxu7+EyJNZMNjt/FYJQYTjCSKGt4jztS
	OPA5XVMzyKApil8j9Kn7fekBRwXUpC94J/rYB6iBfD/6Nu0AOGP5SvkrGRc+UUyis9v6N3zkibxb1
	TaB1uzmiSPdqgo0Y4ycanzBfQspKrREP4MngXqBy/lfPii8AjsW1sGYXqCD0UNN1szDKhd/zSTq2b
	p0gJwV7yEPOyY5bIB0SoVSvOpJmG1A7pdoCrmTNAPcNB14QCxt8SoTheXH4pqRktKJ8N1y20WEX6E
	RY/iWxWEeq4M6Udt8xFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qI8fj-007NzS-2e;
	Sat, 08 Jul 2023 14:12:27 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qI8fg-007NyN-06
	for linux-riscv@lists.infradead.org;
	Sat, 08 Jul 2023 14:12:26 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qI8fN-00023x-00; Sat, 08 Jul 2023 16:12:05 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 11AC8C01C1; Sat,  8 Jul 2023 16:11:52 +0200 (CEST)
Date: Sat, 8 Jul 2023 16:11:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	dri-devel@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-alpha@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
Message-ID: <ZKluqG2ZqKtAmnEG@alpha.franken.de>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707095415.1449376-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230708_071224_239940_E8815FF7 
X-CRM114-Status: GOOD (  11.99  )
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

On Fri, Jul 07, 2023 at 11:52:24AM +0200, Arnd Bergmann wrote:
> diff --git a/arch/mips/jazz/setup.c b/arch/mips/jazz/setup.c
> index ee044261eb223..3c14548353e47 100644
> --- a/arch/mips/jazz/setup.c
> +++ b/arch/mips/jazz/setup.c
> @@ -76,7 +76,7 @@ void __init plat_mem_setup(void)
>  
>  	_machine_restart = jazz_machine_restart;
>  
> -#ifdef CONFIG_VT
> +#ifdef CONFIG_VGA_CONSOLE
>  	screen_info = (struct screen_info) {
>  		.orig_video_cols	= 160,
>  		.orig_video_lines	= 64,

that wssn't intended for VGA but for fbdev/g364fb, which doesn't use
it. So removing it is probably the best thing.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
