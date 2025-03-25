Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7148AC35FFC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwlyJ7FSGXz/+76NOPHQQ8GVHtX/jej2Hy3/5ia3WbE=; b=k3UAgWjrbT+MFKuZGb37qXouqw
	6lYaCIZNPqS2jx+HNk/KiZBd2zh9QJYRinKEHfBmX9yeIF9KQO6BIIpJxg0XcS/S0zQ6YoNWpjOjp
	ftI49JX5yqI9FNoM4KlX+amm6J32XnjTBIbrbUgBb8//H60VF9WeZH/kDXUXWkjoi6slc+eOEn3/j
	UfHkk9vIoZeFNIPILcYMZgIdPqVagGB5juhojW9ag+bGEFGAM0cD4wTqYlOQ5VEITSBTwqH0k7GVS
	7KCv5l/BeTMLrorR/EfJl/DQheqjJwevLoM2UvfhrPfb+Ek4ob+3OJikj1L+Q/HE6GAG8EfN+fw5L
	o7BCsCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0p1-00000005L6c-1Ylp;
	Tue, 25 Mar 2025 09:43:47 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0nf-00000005Kg0-46Zo
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 09:42:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18FF943423;
	Tue, 25 Mar 2025 09:42:15 +0000 (UTC)
Message-ID: <2453d5e6-cd47-4a4e-8636-3a1524be0589@ghiti.fr>
Date: Tue, 25 Mar 2025 10:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: traps: handle uprobe event in software-check
 exception
Content-Language: en-US
To: Zong Li <zong.li@sifive.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, debug@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250314092614.27372-1-zong.li@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250314092614.27372-1-zong.li@sifive.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepueefgeehheegtddvgeelgeejjeefudekgeetffeijefgveejudehfffftdelhffhnecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurddvhegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepjedprhgtphhtthhopeiiohhnghdrlhhisehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepuggvsghughesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrr
 gguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_024224_158416_5544CE68 
X-CRM114-Status: GOOD (  16.60  )
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

Hi,

On 14/03/2025 10:26, Zong Li wrote:
> Handle the uprobe event first before handling the CFI violation in
> software-check exception handler. Because when the landing pad is
> activated, if the uprobe point is set at the lpad instruction at
> the beginning of a function, the system triggers a software-check
> exception instead of an ebreak exception due to the exception
> priority, then uprobe can't work successfully.
>
> Co-developed-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>
> This patch is based on top of the following series
> [PATCH v11 00/27] riscv control-flow integrity for usermode
>
>   arch/riscv/kernel/traps.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 3f7709f4595a..ef5a92111ee1 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -386,9 +386,12 @@ asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *
>   	if (user_mode(regs)) {
>   		irqentry_enter_from_user_mode(regs);
>   
> -		/* not a cfi violation, then merge into flow of unknown trap handler */
> -		if (!handle_user_cfi_violation(regs))
> -			do_trap_unknown(regs);
> +		/* handle uprobe event frist */
> +		if (!probe_breakpoint_handler(regs)) {
> +			/* not a cfi violation, then merge into flow of unknown trap handler */
> +			if (!handle_user_cfi_violation(regs))
> +				do_trap_unknown(regs);
> +		}
>   
>   		irqentry_exit_to_user_mode(regs);
>   	} else {


Deepak, can you take this patch in your next spin of your CFI series? 
Otherwise, I'm pretty sure we will forget about it :)

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
