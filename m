Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129D1C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvLu9DeYO7fYF3EVJVfoD1ltv7t74JTrvoHgyqF9K7g=; b=VLY/jDqBSLuAjZ
	lst4Lo9SSZkFun9GF/8YoJ/vcH0j5wxBrb8wXTMm3tBxFxb6XCxdunlTY9el0RNNxaEiUXYcej/Ol
	ridopAR+cdynhPeYnKcQZQ5/0K0ddykNi+vfq97dzvyH63A14jPSV4kC7TmItOQetGjxD7xvasFsK
	5ay7P5CWi+GGXDrjWCvY9uGfn4ztnbL27p/0g2eMGUYdNeVo+XNXr0+d8OKuGmMkp19BLHF8ryB07
	TU8ln7o2yxEBXKuB0A8Mjp7Dt9jryE3d2n4cADY+BhcVyPjQbrf2sB8eQZ9M9ToFF0Bxym5EqBmd4
	EEAxexuEnTTyImWiUmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJgJ-008UTE-24;
	Mon, 15 Jan 2024 09:54:59 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJgH-008USW-1R
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 09:54:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91F922000F;
	Mon, 15 Jan 2024 09:54:51 +0000 (UTC)
Message-ID: <cd9a4c97-b054-4cc0-afa2-ac2d420e65c7@ghiti.fr>
Date: Mon, 15 Jan 2024 10:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: select ARCH_HAS_FAST_MULTIPLIER
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel.holland@sifive.com>
References: <20231202135202.4071-1-jszhang@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231202135202.4071-1-jszhang@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_015457_622411_BD13B1D4 
X-CRM114-Status: GOOD (  17.75  )
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

Hi Jisheng,

On 02/12/2023 14:52, Jisheng Zhang wrote:
> Currently, riscv linux requires at least IMA, so all platforms have a
> multiplier. And I assume the 'mul' efficiency is comparable or better
> than a sequence of five or so register-dependent arithmetic
> instructions. Select ARCH_HAS_FAST_MULTIPLIER to get slightly nicer
> codegen. Refer to commit f9b4192923fa ("[PATCH] bitops: hweight()
> speedup") for more details.
>
> In a simple benchmark test calling hweight64() in a loop, it got:
> about 14% performance improvement on JH7110, tested on Milkv Mars.
>
> about 23% performance improvement on TH1520 and SG2042, tested on
> Sipeed LPI4A and SG2042 platform.
>
> a slight performance drop on CV1800B, tested on milkv duo. Among all
> riscv platforms in my hands, this is the only one which sees a slight
> performance drop. It means the 'mul' isn't quick enough. However, the
> situation exists on x86 too, for example, P4 doesn't have fast
> integer multiplies as said in the above commit, x86 also selects
> ARCH_HAS_FAST_MULTIPLIER. So let's select ARCH_HAS_FAST_MULTIPLIER
> which can benefit almost riscv platforms.
>
> Samuel also provided some performance numbers:
> On Unmatched: 20% speedup for __sw_hweight32 and 30% speedup for
> __sw_hweight64.
> On D1: 8% speedup for __sw_hweight32 and 8% slowdown for
> __sw_hweight64.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> since v1:
>   - fix typo in commit msg
>   - add some performance numbers provided by Samuel
>   - collect Reviewed-by and Tested-by tag
>
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 95a2a06acc6a..e4834fa76417 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -23,6 +23,7 @@ config RISCV
>   	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>   	select ARCH_HAS_DEBUG_VM_PGTABLE
>   	select ARCH_HAS_DEBUG_WX
> +	select ARCH_HAS_FAST_MULTIPLIER
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_GCOV_PROFILE_ALL
>   	select ARCH_HAS_GIGANTIC_PAGE

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
