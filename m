Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30297E77198
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOudbTgaJm0UXlDo5i6JvKw5uKdfu9GPT9zFolK9LJ4=; b=f5Q8TuGDO1ChAL
	j2JH7rF+NDyEzPRJw/HDYYk71czRaJFXhbtUXs11kTBNqtYTJVwDL1Xh/mlQ9FBjgIy9GSUtZlt5b
	bxkUleBs1nDV5n1KzNqtu+mwgaFhhXKiuojCtFdpbJhp5CIERR/XlN2/vUZLVtzyIVk6Jn9UX1Cd1
	VU40GAZcaBeTIWdnx/t2BgXV27UdyjOH5f3kGTfz5/bfmQUw4iREoRLXZWvXdJrX8o0bJMskr2h3J
	ozdNsdeiI/WTHI/2UR08P/cu5L6aJfONTPfM/QAYzlHpgyL/TKaaZT0rnYrzPzMk89e12hC8Q4ILf
	Ypv6CXWNmpw+3bLn3Nkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnlk-00000001W8I-3Anw;
	Mon, 06 Jan 2025 14:07:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnli-00000001W70-3Q26
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 14:07:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F154DFF803;
	Mon,  6 Jan 2025 14:07:41 +0000 (UTC)
Message-ID: <dab16ea0-e021-4038-a6c7-bd2b1f4d84b5@ghiti.fr>
Date: Mon, 6 Jan 2025 15:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: signal: fix signal_minsigstksz
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, AndybnAC@gmail.com,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Haibo Xu <haibo1.xu@intel.com>, Conor Dooley <conor.dooley@microchip.com>,
 Usama Arif <usamaarif642@gmail.com>, Hanjun Guo <guohanjun@huawei.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
References: <20241220083926.19453-1-yongxuan.wang@sifive.com>
 <20241220083926.19453-3-yongxuan.wang@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241220083926.19453-3-yongxuan.wang@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_060746_987280_D35738EC 
X-CRM114-Status: GOOD (  15.71  )
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

Hi Yong-Xuan,

On 20/12/2024 09:39, Yong-Xuan Wang wrote:
> The init_rt_signal_env() funciton is called before the alternative patch
> is applied, so using the alternative-related API to check the availability
> of an extension within this function doesn't have the intended effect.
> This patch reorders the init_rt_signal_env() and apply_boot_alternatives()
> to get the correct signal_minsigstksz.
>
> Fixes: e92f469b0771 ("riscv: signal: Report signal frame size to userspace via auxv")
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> ---
>   arch/riscv/kernel/setup.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 016b48fcd6f2..b7c91f546453 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -324,8 +324,8 @@ void __init setup_arch(char **cmdline_p)
>   
>   	riscv_init_cbo_blocksizes();
>   	riscv_fill_hwcap();
> -	init_rt_signal_env();
>   	apply_boot_alternatives();
> +	init_rt_signal_env();
>   
>   	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
>   	    riscv_isa_extension_available(NULL, ZICBOM))


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks for your fixes!

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
