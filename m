Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D47CC5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 04:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CTscbFa4I6IWCcqbZ0NGh3NXyuSDLtqsmxywCL5ZAc=; b=eioztYugCVa/wE
	B2aBHsL6wjYLV05pVUhyw39SQNm1Qcpwry3QjzwQjVKkuw8TVcYO9bToubhCulPQFqb4PlHMUcJym
	Fg9QhStSLsnDu7Hc+b5YzFI2I8zyJsK/BzESSkm3+5fErngbeudZoYiN8SOUJFF01obITWdNj9X9w
	ip3fnlOfo4EnwIOB98sc+dzocpuhV3DZ/NJIYZBnJDGHIVdoeiXULH6vHrofe6zz3qbP3OIJfq5Wq
	nc+B0F46nx8J8Ti21NldTwAohgYKw2nG2QrYC8Kb1QBV2OQp/kqBwyPUNRVGm3OrFaMq3VmzjL4NX
	55IN1hmLpq9WZlyDMtHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siR6Z-00000005k5j-10ON;
	Mon, 26 Aug 2024 04:13:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siR5n-00000005jys-0eY5;
	Mon, 26 Aug 2024 04:12:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9882A40FAD;
	Mon, 26 Aug 2024 04:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E16C32786;
	Mon, 26 Aug 2024 04:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724645553;
	bh=/lrwtogEFLiUD0yQcwy0DgYm1CyK4KyNMKlNshXlAiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BVoD8QbZnqdjJFV0fXriEuKnNS9Zlhd0JaOmInPzqfB+XNOYZPRLbxbIEh7wAghOS
	 T6R+IuYg1DRf8VC6ahwWj4vF1liHQkHK4oB+9QfTwGPCGyLF+wb1/f6tQpEM94zfed
	 26C3avVddnxIdB9aMT1bmDs8/DB/cicvduVL8U0s+w6OGaBQLScckp11bYOJulgSuO
	 JFWS6KhaUnax6ztB69lkB5DG4yTQ2+bB0wycqndgWAizoXrqg+eE5B4/v9JnzglH2c
	 BNS7WoEOlnefw19SDbbP9ZVuv24Jdbvhbqb/fhLfcgEBhtfP2/g4unnKC7kzIXSjCv
	 d3wz/0JpNewsw==
Message-ID: <d05f7fea-f13e-41e8-8416-3b410431127d@kernel.org>
Date: Mon, 26 Aug 2024 13:12:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] reset: cleanup and simplify with devm and scoped
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Antoine Tenart <atenart@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_211235_292034_E48CC128 
X-CRM114-Status: GOOD (  11.34  )
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

On 8/25/24 11:14 PM, Krzysztof Kozlowski wrote:
> Hi,
> 
> Two simple fixes, which do not cover real scenario (memory allocation
> failure during probe), thus not marking CC-stable. Rest of patchset is
> simplifying of code.

Patches that have a Fixes tag will likely be picked up for stable by Sasha's
bot anyway... Not a problem for these patches I think.

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       reset: berlin: fix OF node leak in probe() error path
>       reset: k210: fix OF node leak in probe() error path
>       reset: simplify locking with guard()
>       reset: lpc18xx: simplify with dev_err_probe()
>       reset: lpc18xx: simplify with devm_clk_get_enabled()
> 
>  drivers/reset/core.c          | 15 ++++-----------
>  drivers/reset/reset-berlin.c  |  3 ++-
>  drivers/reset/reset-k210.c    |  3 ++-
>  drivers/reset/reset-lpc18xx.c | 43 ++++++++++---------------------------------
>  4 files changed, 18 insertions(+), 46 deletions(-)
> ---
> base-commit: e706b1fe2384d38e6e9edfb6d9e11e26873c24c7
> change-id: 20240825-reset-cleanup-scoped-64bb3cb6157f
> 
> Best regards,

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
