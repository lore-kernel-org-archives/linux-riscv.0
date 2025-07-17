Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31DDC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ixtZ3wUAn9dzhyCKX/eXee9kFssnRIMJ+g7ogeR77U=; b=XqJS4qP0mcaD9j
	U6wrML7WPZ6ENeS7NAbGS+B9YbuWx/0pfhDvUjUj3N7D3RQ7tVUriNjUR3g6+0Al9RbZyuV85KQEg
	An5fnOLOLrMX7zfbzfXUnyFQ/BSaC7jErsmNrg1La303lclf/nZZSy/5Cfm9xHxMGg9ZXWmgP082O
	SHvfbuks2CcBl3qtemyv5KnRxyG0lPMVhTRbYz2kUnjAzvcrJd+rdxxG82jDdIE8ugLyg1uyendNZ
	z31s7bzLM4lpJNaXcCOMchaT6x10WZshcgUGrz7GVdN/sLDnF/b9ehTtugekEC5ijGigb8/WP50K4
	8G0OOJRgTNt3Xe+II2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLHh-00000009mfD-0ufk;
	Thu, 17 Jul 2025 09:52:13 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL5C-00000009knz-1FI1
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 09:39:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2122433F0;
	Thu, 17 Jul 2025 09:39:12 +0000 (UTC)
Message-ID: <1abf91b9-a295-4b0c-b4c8-176f7c59b950@ghiti.fr>
Date: Thu, 17 Jul 2025 11:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
To: aleksa.paunovic@htecgroup.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedukeehrddvudefrdduheegrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudekhedrvddufedrudehgedrudehuddphhgvlhhopegluddtrddugedrtddrudefngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegrlhgvkhhsrgdrphgruhhnohhvihgtsehhthgvtghgrhhouhhprdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvl
 hhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvth
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_023918_470241_D9628FF6 
X-CRM114-Status: GOOD (  17.97  )
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

On 6/25/25 16:21, Aleksa Paunovic via B4 Relay wrote:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>
> Use the hwprobe syscall to decide which PAUSE instruction to execute in
> userspace code.
>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>   tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> --- a/tools/arch/riscv/include/asm/vdso/processor.h
> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> @@ -4,26 +4,33 @@
>   
>   #ifndef __ASSEMBLY__
>   
> +#include <asm/hwprobe.h>
> +#include <sys/hwprobe.h>
> +#include <asm/vendor/mips.h>
>   #include <asm-generic/barrier.h>
>   
>   static inline void cpu_relax(void)
>   {
> +	struct riscv_hwprobe pair;
> +	bool has_mipspause;
>   #ifdef __riscv_muldiv
>   	int dummy;
>   	/* In lieu of a halt instruction, induce a long-latency stall. */
>   	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>   #endif
>   
> -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> -	/*
> -	 * Reduce instruction retirement.
> -	 * This assumes the PC changes.
> -	 */
> -	__asm__ __volatile__ ("pause");
> -#else
> -	/* Encoding of the pause instruction */
> -	__asm__ __volatile__ (".4byte 0x100000F");
> -#endif
> +	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> +	__riscv_hwprobe(&pair, 1, 0, NULL, 0);


So this should not trigger a syscall, so even if it's weird, I guess 
that's ok.

Another solution that was already suggested for CFI would be to 
implement VDSO alternatives, we could easily parse the VDSO elf and 
patch it at boot time, I'm pretty sure that will be useful at some point.


> +	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> +
> +	if (has_mipspause) {
> +		/* Encoding of the mips pause instruction */
> +		__asm__ __volatile__(".4byte 0x00501013");


Here you could have used the MIPS_PAUSE introduced earlier.


> +	} else {
> +		/* Encoding of the pause instruction */
> +		__asm__ __volatile__(".4byte 0x100000F");
> +	}
> +
>   	barrier();
>   }
>   
>

Anyway, let's merge this for now:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
