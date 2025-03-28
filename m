Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808F8C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=argC78G9m8gI0+JV3FOdRg3dvVnI+eqPBvrKujRTaBs=; b=4TlgPgITbksWtb
	0gl9uL6JZKuaqor4mdfe1Tu0fwnoZE7wznAwAnnEaTiS5NisB5uD6+9lj4/aiBSCxrET8POPsMvww
	qw6gD05C+XMpgmBvLpLuuzODxz5cWxTqQyJul8TqzMwdjXtr9Op/vZpRYtilR6OFACNnR8MSYgz2/
	W3a/BTzMA5f3yZ7QjcWPJeFt+gw5NGXuzOQfifvpxt3jGe8hHy77Xm7TdNTxNLUcQk0aMEZ0Lkl/l
	Ta9uSuepqctrX+VQ4L4+rl8P2fQ5N9/CKXVw5pqfnJ8DjmjGM+iFSwMCvbLHlq2E1talg++IA2vbM
	EQ4bzawh/y59Rman3egw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyB63-0000000Df3F-3PDV;
	Fri, 28 Mar 2025 14:54:11 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAN4-0000000DXsy-44vC
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 14:07:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6450F44380;
	Fri, 28 Mar 2025 14:07:37 +0000 (UTC)
Message-ID: <61173b04-faea-4dfe-8e82-95a55ee33f3f@ghiti.fr>
Date: Fri, 28 Mar 2025 15:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] riscv: Optimize gcd() performance by selecting
 CPU_NO_EFFICIENT_FFS
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250217013708.1932496-1-visitorckw@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250217013708.1932496-1-visitorckw@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedugeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurdefudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehvihhsihhtohhrtghkfiesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepjhhsvghrvhestggtnhhsrdhntghkuhdrvgguuhdrthifpdhrtghpthhtohepvghlvggrnhhorhduheigsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqr
 hhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_070743_147754_454A1245 
X-CRM114-Status: GOOD (  16.44  )
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

Hi Kuan-Wei,

First sorry for the late review.

On 17/02/2025 02:37, Kuan-Wei Chiu wrote:
> When the Zbb extension is not supported, ffs() falls back to a software
> implementation instead of leveraging the hardware ctz instruction for
> fast computation. In such cases, selecting CPU_NO_EFFICIENT_FFS
> optimizes the efficiency of gcd().
>
> The implementation of gcd() depends on the CPU_NO_EFFICIENT_FFS option.
> With hardware support for ffs, the binary GCD algorithm is used.
> Without it, the odd-even GCD algorithm is employed for better
> performance.
>
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Although selecting NO_EFFICIENT_FFS seems reasonable without ctz
> instructions, this patch hasn't been tested on real hardware. We'd
> greatly appreciate it if someone could help test and provide
> performance numbers!
>
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7612c52e9b1e..2dd3699ad09b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -91,6 +91,7 @@ config RISCV
>   	select CLINT_TIMER if RISCV_M_MODE
>   	select CLONE_BACKWARDS
>   	select COMMON_CLK
> +	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
>   	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>   	select EDAC_SUPPORT
>   	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)


So your patch is correct. But a kernel built with RISCV_ISA_ZBB does not 
mean the platform supports zbb and in that case, we'd still use the slow 
version of gcd().

Then I would use static keys instead, can you try to come up with a 
patch that does that?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
