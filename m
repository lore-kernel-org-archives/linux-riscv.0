Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDE7C43219
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCaPtaq1cnkOCiQXutisRV5JWgrk7yy2sSaVtu5eo4Y=; b=ByKTwaGRrk/TZ4
	gm8IdqkZmxOgTrQ7vECt7k/1n6/OHUREVfFq9HVTLBKU/OGZvKzJwPAm0s0/lYxORr/LRIaxV9vhq
	Z1ix0ZpghytAmVU9aoNOJhekWkFYY+IQuJOnQHgD1Elb+u98wzzzmuCd3IJi8+tGof22GCCwL8Ltz
	7pv7gb90WldYaEpLpB5T7Al0wuwalq4iNft9Ux6GbXd6PfTovtq6HeOJDEJxuVOGXWf6l7dZXHEck
	ywWQy9H+wGOa04jdjkHv99aL3/eeU4Zy0s8QPOhI7eoYTiWSi/X0jpGF9zcK3SsSkO5yPslMEHmPU
	5VmnU05oGohTscklMP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt8aC-004bFA-5B; Mon, 23 May 2022 13:58:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt8Zl-004b2M-0j; Mon, 23 May 2022 13:58:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89F446114C;
 Mon, 23 May 2022 13:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A97C385AA;
 Mon, 23 May 2022 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653314303;
 bh=bMQ76dp2HmQ3uXRMykYlpLogfkiug4VqJggIc37zUrM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rhu8OE2IygT78Kmgi0veHK3UCRU45Wa1lKf0qRn0eRRSfxWy/znDUceR1oMSY55by
 b/Qjp4WqXMjPxggvmrJcC0RWd7ISbVc4buSL335hPdmnd2FbWEy07P0apQgYY7H11+
 NFlr8OEtHhW7GJ19ciDaIYgTWsKV1vSBJJWX4qSZ5rMgEPypBdhRc5bD8iHWcFmgwf
 if4LTn3sIyl73Q+1hgTvOuYTzaXOBuU1ZdpC5irzwKSc81r7BU7d44Qfg04P23t3Wj
 xjPCV1EQ8qgX5fLkrsY98A1lDRWt1NrDy4qNgFPCtMrf6R9Y+4BKiSHtAS13/wW86d
 X2gY2kmU5w6bQ==
Message-ID: <8e440c28-d4b9-2fc6-0294-f77544264d5c@kernel.org>
Date: Mon, 23 May 2022 08:58:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 06/11] nios2: use fallback for random_get_entropy()
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
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-xtensa@linux-xtensa.org
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-7-Jason@zx2c4.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220413115411.21489-7-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_065825_212241_DEDE3523 
X-CRM114-Status: GOOD (  19.31  )
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



On 4/13/22 06:54, Jason A. Donenfeld wrote:
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
