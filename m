Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B35C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVbqkRSioV9qWyK3yNsDo1o5BBXPm6fP56tX7KjtlvE=; b=ZmLT4h8VNFRqjN
	u456Cr1IgiSu/lyVP99fEIgc0WnWNxN5yjRmfBZMrV2tDgHgLshurGHn2k1uXUKhoMGMtIW6YGfIn
	TTgs05LXf7DH7sQgPyYe9cyW/iRV7XxbMYaFy3CXwNl+iPEGA6dmeJF7hLFMvHXtJ/NSrK84qA5Nz
	Bc5J9coaom/EoeMdTwubh91HvoNxz+IW0tIc8cjN1gt4iWQliBWlbXzcYnmwnpSweo/NW2KcGpLHA
	keQGweEjUcI1YXJgxQy93Yesphx8vvgDAUwLG+59isLUf+NAFjDKOFWXilJcPK0tpnaSN2uih4/7L
	pR6hoVM4whg74jReGh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1newTl-00558u-0G; Thu, 14 Apr 2022 10:13:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1newTX-00555u-G5; Thu, 14 Apr 2022 10:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=upqcvBN0c/2twwWoHUne//eX4ki0XQTMtmfsi6ArAXU=; b=HjGPsWLJY1Ur/Qd9SaLg0YiKnR
 95tjp26+YgI/HwEOdRqvSlAROO2sO63Z/uXu1t6/V5/PtASP1IW3k8kj55+7tgoHxaUyNfpLnuymj
 G+Nuireb4o2uAs9tgNLn8PCnmIvfeYm/3imhJXibehEvAyy2bcpTUxyuVWUQ0H1lRVoogDYJt+XGn
 +JXGGLKSFLPO1NgiG/h6Ou0ERgDMxxK3z39Afa9Ihp7G2oki6nDRlwzM4i7qfs+r/iBEJYNjoTAgZ
 nYexjH0hGr4I1XQ6yy/K0FsGtjU27thDPBNsh2vJZf5a5imdfgQbx4As5XreqUcbwl+Pi+VE00syg
 bbEnVKOQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58256)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1newSp-0004M9-DZ; Thu, 14 Apr 2022 11:12:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1newSh-0004Du-6v; Thu, 14 Apr 2022 11:12:27 +0100
Date: Thu, 14 Apr 2022 11:12:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 tglx@linutronix.de, arnd@arndb.de, Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S . Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v4 01/11] timekeeping: add raw clock fallback for
 random_get_entropy()
Message-ID: <Ylfzi1lNWTH1wjLA@shell.armlinux.org.uk>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-2-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220413115411.21489-2-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_031319_564078_E375B46D 
X-CRM114-Status: GOOD (  22.50  )
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

On Wed, Apr 13, 2022 at 01:54:01PM +0200, Jason A. Donenfeld wrote:
> The addition of random_get_entropy_fallback() provides access to
> whichever time source has the highest frequency, which is useful for
> gathering entropy on platforms without available cycle counters. It's
> not necessarily as good as being able to quickly access a cycle counter
> that the CPU has, but it's still something, even when it falls back to
> being jiffies-based.
> 
> In the event that a given arch does not define get_cycles(), falling
> back to the get_cycles() default implementation that returns 0 is really
> not the best we can do. Instead, at least calling
> random_get_entropy_fallback() would be preferable, because that always
> needs to return _something_, even falling back to jiffies eventually.
> It's not as though random_get_entropy_fallback() is super high precision
> or guaranteed to be entropic, but basically anything that's not zero all
> the time is better than returning zero all the time.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  include/linux/timex.h     |  8 ++++++++
>  kernel/time/timekeeping.c | 10 ++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/include/linux/timex.h b/include/linux/timex.h
> index 5745c90c8800..fbbe34226044 100644
> --- a/include/linux/timex.h
> +++ b/include/linux/timex.h
> @@ -62,6 +62,8 @@
>  #include <linux/types.h>
>  #include <linux/param.h>
>  
> +extern unsigned long random_get_entropy_fallback(void);

Hi

I'm surprised this didn't trigger checkpatch to warn. From
coding-style:

6.1) Function prototypes
Do not use the ``extern`` keyword with function declarations as this makes
lines longer and isn't strictly necessary.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
