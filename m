Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB99C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 May 2022 21:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgDV8YdwoqN4VUOCKuaLI8XEOhI40qynwV7jwV9HxTA=; b=RF/w2dvPfHLIHH
	SgRMJsDTp+Ji+A4k/eU0p4Ab9po1ChjSbBedf4d6UeCGPY1EERXHzIDlqwDzkOfm3F6oSe0jJOGg2
	ywynvHd4yWA5LuSgBvg3UTO1XoHIkkM134ZafvnobcNH76pByDhnFBWp+cNnEk0fzcSBcwLFc43Lr
	ZDg/6UgKeyU39WqkKPJ7qd6ytbO72jY+s54+gR6m5KByLBgtHJGGXwp/LZ/qL6IUfaWbAvVZFT1dA
	yVQWzuPW1nyFDeYP1hQBVtN0+332sc7FpvT/GPOvwM0a74D0MaqIit2B7It0nhzHd2gXOz1y3o1c5
	iSYz3Ww+B3i0694/cZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nldAa-002j0p-AU; Mon, 02 May 2022 21:01:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nldAP-002iy4-PS; Mon, 02 May 2022 21:01:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41A6160EB1;
 Mon,  2 May 2022 21:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870B7C385AC;
 Mon,  2 May 2022 21:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651525271;
 bh=Lyb/THiP6nQ3Mo8jxRN/sSN4cFqT+f2qfN1gi8EaInQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UgDF9QfxgCwmucPUKdWp6T3JzrWJrh7DEK/6p23+8Lk9YKDw7W5gWJOHDCu/7PiJz
 eMEchDEaqya/pd5f/LF2LhVxtyt5SClI551Z4z6Cw/O9ZdC6wNgqENCQkiZwJc7sB6
 88vbNGfTEAeeQTlsJN5IjcdqwYjGdUobCRI/IZqLmVUPjH5JBHprkvVS/hDkXenk+K
 U7KvfrL95cqTOsgCmSDYmW1LWzW+qqvUQm4gFRIPC3hKIycONxi9Jo2zI01FcGsGCH
 dOJ8i6y8MNrsBSJjFbaPbVvwEljbBzysOCcF6QVWefh6kCQQOM2byLdZ0eEGA2xiYy
 ag4YeJvL+W2gQ==
Message-ID: <3dee9e8f-45c5-49a0-a19e-d67917fd6bb3@kernel.org>
Date: Mon, 2 May 2022 16:01:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 06/11] nios2: use fallback for random_get_entropy()
 instead of zero
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, tglx@linutronix.de, arnd@arndb.de
Cc: Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-7-Jason@zx2c4.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220419111650.1582274-7-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_140113_954776_5D1E4765 
X-CRM114-Status: GOOD (  19.20  )
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



On 4/19/22 06:16, Jason A. Donenfeld wrote:
> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling random_get_entropy_fallback() would be
> preferable, because that always needs to return _something_, even
> falling back to jiffies eventually. It's not as though
> random_get_entropy_fallback() is super high precision or guaranteed to
> be entropic, but basically anything that's not zero all the time is
> better than returning zero all the time.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   arch/nios2/include/asm/timex.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/nios2/include/asm/timex.h b/arch/nios2/include/asm/timex.h
> index a769f871b28d..d9a3f426cdda 100644
> --- a/arch/nios2/include/asm/timex.h
> +++ b/arch/nios2/include/asm/timex.h
> @@ -9,4 +9,6 @@ typedef unsigned long cycles_t;
>   
>   extern cycles_t get_cycles(void);
>   
> +#define random_get_entropy() (((unsigned long)get_cycles()) ?: random_get_entropy_fallback())
> +
>   #endif

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
