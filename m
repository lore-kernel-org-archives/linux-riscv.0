Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92368C021B8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 08:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZefalnorUOBQAC+QiEx84u7WStqqwFruyABb9o9JkE=; b=Nbh5MqDL86vUbd
	PKG61LcyLks+gPrJUJmxFPUNtsC5a1wDx9oHUqbeWQngeV4S1XkXPN+nL8iWzAdzh8qL238WQlUea
	9BtXXr3VruvehQnN4D+TtNPDnw3jiQ4DA0yunbqSKj0Qre6W0Uu2tEqRG8LGQVGzIoVpk8So3pJwZ
	keA+C721wcob+Gv2RwLffQM4AZNXYkAIkZ9Weo6I/nTzj0ze4vw6zqqXrbpfos3GMbsQ2mmNKoU/2
	jStH5/IRYmoXKCjRAJhpQ7bjxmrx3E3+4g6GxC2Z0hK9xwPVfG3VVCUTUhV6hn7kaiWq2fJt6VHfh
	1n1dDw8Ra8hpc5vVw69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqRE-0000000GPWr-1lG7;
	Tue, 25 Feb 2025 08:37:12 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqQI-0000000GPLb-2WZB
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 08:36:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1454944286;
	Tue, 25 Feb 2025 08:36:05 +0000 (UTC)
Message-ID: <b449aacb-f981-4907-af37-1ca5aea83bb4@ghiti.fr>
Date: Tue, 25 Feb 2025 09:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: tracing: Fix __write_overflow_field in
 ftrace_partial_regs()
To: Charlie Jenkins <charlie@rivosinc.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250224-fix_ftrace_partial_regs-v1-1-54b906417e86@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250224-fix_ftrace_partial_regs-v1-1-54b906417e86@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekuddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvrgdtgeemtggvtgdtmeduuddtvgemrgeggegsmegrjeelieemsgekrghfmeeisgekieemfhelrggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdegmegtvggttdemuddutdgvmegrgeegsgemrgejleeimegskegrfhemiegskeeimehflegrsgdphhgvlhhopeglkffrggeimedvrgdtgeemtggvtgdtmeduuddtvgemrgeggegsmegrjeelieemsgekrghfmeeisgekieemfhelrggsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepmhhhihhrrghmrghtsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepohhlvghgsehrvgguhhgrthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_003614_791959_58A29DCD 
X-CRM114-Status: GOOD (  15.30  )
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

Hi Charlie,

On 25/02/2025 03:42, Charlie Jenkins wrote:
> The size of &regs->a0 is unknown, causing the error:
>
> ../include/linux/fortify-string.h:571:25: warning: call to
> '__write_overflow_field' declared with attribute warning: detected write
> beyond size of field (1st parameter); maybe use struct_group()?
> [-Wattribute-warning]


I can't reproduce this warning with gcc and llvm, even when setting by 
hand -Wattribute-warning when compiling bpf_trace.c (which is the user 
of ftrace_partial_regs()).

Which toolchain did you use?

Thanks,

Alex


>
> Fix this by wrapping the required registers in pt_regs with
> struct_group() and reference the group when doing the offending
> memcpy().
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>   arch/riscv/include/asm/ftrace.h |  2 +-
>   arch/riscv/include/asm/ptrace.h | 18 ++++++++++--------
>   2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index c4721ce44ca474654b37b3d51bc0a63d46bc1eff..ec6db1162021fbf4fa48fc87e7984266040aa7d9 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -207,7 +207,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
>   {
>   	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
>   
> -	memcpy(&regs->a0, afregs->args, sizeof(afregs->args));
> +	memcpy(&regs->a_regs, afregs->args, sizeof(afregs->args));
>   	regs->epc = afregs->epc;
>   	regs->ra = afregs->ra;
>   	regs->sp = afregs->sp;
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index b5b0adcc85c18e15c156de11172a5d7f03ada037..2910231977cb71dac3cc42f2dc32590284204057 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -23,14 +23,16 @@ struct pt_regs {
>   	unsigned long t2;
>   	unsigned long s0;
>   	unsigned long s1;
> -	unsigned long a0;
> -	unsigned long a1;
> -	unsigned long a2;
> -	unsigned long a3;
> -	unsigned long a4;
> -	unsigned long a5;
> -	unsigned long a6;
> -	unsigned long a7;
> +	struct_group(a_regs,
> +		unsigned long a0;
> +		unsigned long a1;
> +		unsigned long a2;
> +		unsigned long a3;
> +		unsigned long a4;
> +		unsigned long a5;
> +		unsigned long a6;
> +		unsigned long a7;
> +	);
>   	unsigned long s2;
>   	unsigned long s3;
>   	unsigned long s4;
>
> ---
> base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
> change-id: 20250224-fix_ftrace_partial_regs-eddaf4a7e5ed

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
