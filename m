Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623C7C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Enm1AHE4Oz5r7Cu04JMdCrPaUA3akq5+lC6sc/mAVtI=; b=Ru8mWKN29p32AI
	L8XmiGphaR8YxQbN1fKXkOze7WcyfftASiGhzuWBpJnVAH5ySEGvdjqew/xys7EBvVYKmTJ/JWKaB
	++TKWZfttZTnGmjflWu8kV38APE2x+1/MqAfpc1QTP4qTwyX4htqi6iIsNr8JZruujJjIhnzHg4ap
	AOYwfJhOqI2gUMQSCkXm3FszGvPYJUdkIphPCxZnA4kO4UgWGL9mqHMBqVoau8BpUqb1rj7TbsYmd
	y40+MaQar3TitDh5a7x/6XUWvYu7VEXRYA4n+pqcEXxoVEFhaG0jyKY9Xf8Hw0uif7O53ShMlljov
	iKre0EVhfA7dfkyu6fFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtaA-00000003ELr-0HB3;
	Thu, 09 Jul 2026 18:34:46 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whta5-00000003EJd-4BpX
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 18:34:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-383adaa461fso161311a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622081; x=1784226881; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yghYN6q10g6FdWlsVt4/TtDo8QYt/j/TS6a9b2++LOM=;
        b=pNEVjQZ6RAMv6XHtR22T+oX3hwvxlHEpKcDTeF6Oj0VrYICFKteR3OCeo9yqVMvQ01
         wsjOni2cRpwfdZWGngVQ3ymiX+QIFmbGtR5C7lofDBeY9khs40+t/de+E8k2/GSnosWq
         jyLZ4pphXSW9nzEgSY8uR8WSQzGoFnYSHKy6GZ3pcmu+JwihystTZLR3oX0HhfiBMiKQ
         kzGwWMUDuysx8YF27mqs3gDEqkoNJ54norBulQ53EVem3dvQYAciuO81E8ldjJ4QHC0G
         YuU7NqcaPANxRZGgHMv79CMKT7Zf7RzfdJNe/B1J3oNClmxB01wx43+lTHhj9Furnkfd
         avMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622081; x=1784226881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yghYN6q10g6FdWlsVt4/TtDo8QYt/j/TS6a9b2++LOM=;
        b=apChbCaknRqH3NpqqMc9KFf5Cs5X1ixZy9Yh8UzRNcbZOU8btKACHFHXIgTGAH+FJg
         p68gqoeZosptmLlUmJPFgsnHNR0ZxSI0Zs3hVhGYLOZUpJzZcjC8h0JTDeDk9xRPRhI3
         Zqj8tyQ6K4GRZHMsUOn90AFZJemlMkaSvRqSThdXsqeL0Gf3lhIRTuQZh8ZE72wdBiyj
         ffl8zA0x9Hd5t2wD74/QDdi8kw0nJOEx93ob5AXBxx3s6KHpUo5/F/NnpgM0m+4vtiex
         wyo8lL/AHZj3mQYEKqXth3IKHHXgRI7PyaCEEhJ6B7eRbd9ACaw0oNTODFTLI6xBuVZ2
         Olzw==
X-Forwarded-Encrypted: i=1; AHgh+RoQfHRHgw++yNZZMth8Taha4HKoYi2oDnCSg/cSduohlySIp1si+y0NyGwO59TomeE863YFou8PA0/i6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRbJYi7QqZRvyaV09tvf5rqtapK4jBaTRW36LdfelBpQZZm6JV
	WtCbbkGjr5J/q0yTg14z6Mpp2PmbWdew86upk+kyu7+UVPOsp74vo5Jj
X-Gm-Gg: AfdE7cmNVfEM1/tHPpqX3Uo8uLTBm5UFfNpw94fo3kCYsjvSTxBh8KjhJO/LYryCsRY
	oBqG5TRA9TE6gtcK1s/w0h3YScqn4GcwiCo6Ydn8llwrjhKm/eLiMIRQR9h7n3kcflqpODl1Rue
	vBDwsVyKwyKhhW3ZEVa/caMnw5ShfiXRKLnZc9BioVnMTd+3yguEa6/Nm7o9+0PRj67Zl6ltJfD
	0P9X1mO6X9M2M4QTyJ17p7k/vtFWZpXoulsSM6FtilGocbDMCh7ZTbLycfMK0D6cTQl4ij2bhkb
	qpukf7x6MZ+zFKQvd469JALJ2BB6dyjS6stcN3yznIroRZPtq3UTLWLOAC9xzQ9ZKMazo8n1jaI
	p4XS75ImDEOZv90+ZYfOj0gD9OLoOEcd25G3AmoJNMB4Vo8TfCH+6dBUSEf2Cb3fLFRrYKvvnTD
	TahItiopzLxtApbTPgzLLKqxfJ977fQkDuBljFuyy++MvtW7whgcyqlCSy5TqH
X-Received: by 2002:a17:90b:2752:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-389417e4858mr8140301a91.22.1783622081049;
        Thu, 09 Jul 2026 11:34:41 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm11123455eec.22.2026.07.09.11.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:34:40 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:04:21 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 02/18] randomize_kstack: Provide
 add_random_kstack_offset_irqsoff()
Message-ID: <ak_piRRvfiMc9m7N@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.768842729@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190253.768842729@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_113442_098307_246E8F2E 
X-CRM114-Status: GOOD (  19.46  )
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

On Tue, Jul 07, 2026 at 09:06:02PM +0200, Thomas Gleixner wrote:
> add_random_kstack_offset() uses get/put_cpu_var() which is pointless
> overhead when it is invoked from low level entry code with interrupts
> disabled.
> 
> Provide a irqsoff() variant, which avoids that.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> ---
>  include/linux/randomize_kstack.h |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -77,8 +77,27 @@ static __always_inline u32 get_kstack_of
>  	}								\
>  } while (0)
>  
> +/**
> + * add_random_kstack_offset_irqsoff - Increase stack utilization by a random offset.
> + *
> + * This should be used in the syscall entry path after user registers have been
> + * stored to the stack. Interrupts must be still disabled.
> + */
> +#define add_random_kstack_offset_irqsoff()					\
> +do {										\
> +	lockdep_assert_irqs_disabled();						\
> +	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,		\
> +				&randomize_kstack_offset)) {			\
> +		u32 offset = prandom_u32_state(raw_cpu_ptr(&kstack_rnd_state));	\
> +		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));		\
> +		/* Keep allocation even after "ptr" loses scope. */		\
> +		asm volatile("" :: "r"(ptr) : "memory");			\
> +	}									\
> +} while (0)
> +
>  #else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  #define add_random_kstack_offset()		do { } while (0)
> +#define add_random_kstack_offset_irqsoff()	do { } while (0)
>  #endif /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  
>  #endif
> 
LGTM.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
