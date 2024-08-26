Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6EAC5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 04:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S2m6o+H7ZTEec+dvOlSyD/l9HEArMkhPe/D+D9hC0J4=; b=yM2G16lNYoCafZ
	UT9grKxdvhXy6EP5L5NC9hsC2a5wfVyzoqQnSuEQCVpSL2BdGiZfWK8cLjdDNzSn/TjSuWCI9cuZK
	NB0W3o+3qtEvnf4rfJPW16Ob3WQ6zy0t0vHCIOiIx2bq8XhKc1FW7j4xjJmBCXeGUlA38etCluCwQ
	cWChIVH5Z8jHpAbDgw3ekjFh482ZW2MTGF5rb4V9AIn3Z91Yx7d16UPpQKyecpNI/wnQMQf7zKDL3
	MscmF2DF8LIVhWGJcSrNYQLVmm8Oe4mJyyVhWMRD/h+ALUTIPc1yg7O4cD7NV4wd/Q/8RlsOH6m0F
	jn03HozWcSOD7goegzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siR9O-00000005kmK-0nPB;
	Mon, 26 Aug 2024 04:16:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siR8Z-00000005kb8-2WFu;
	Mon, 26 Aug 2024 04:15:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 88F57CE0B5B;
	Mon, 26 Aug 2024 04:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1234DC4AF13;
	Mon, 26 Aug 2024 04:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724645724;
	bh=qPyOuK3WKJKf/LHhCGY6w3y9hfA/xo4Ff/I3pICqgik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u/LlJsKf3EjoRE1UIG3qpHbW4LgYIiYyH3shH8J3Ylh+GTF+6TrFEoz/1BRi493lK
	 Ioxs6AsSwyYN66D8kybrHhPUTcNz0XLRCYPDfg7dD/Y2tsRAGvWwQKDvpidn6ep4m2
	 v57k4JNGu1tQQ//5LFo30twO2Uee/JA5jkgdAg7RjgVnvckGZ11Cixa1LI8ggWDi9s
	 aXz2X6elWLKKsNbrPtvCE6IERUxfURAZo/ignx75y6Lymm2TZG0xqUcO6aFLwiFOVo
	 p4sa2EYIj/kQq4fAX5Y6txjAUb8m98wufEOFS7t82JV9fVXn78qkVq3XK0OlYznitX
	 LIvSuLhzqCpug==
Message-ID: <6a87416d-e6ba-4f4b-8c1e-bed622eb60bd@kernel.org>
Date: Mon, 26 Aug 2024 13:15:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] reset: lpc18xx: simplify with devm_clk_get_enabled()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Antoine Tenart <atenart@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
 <20240825-reset-cleanup-scoped-v1-5-03f6d834f8c0@linaro.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240825-reset-cleanup-scoped-v1-5-03f6d834f8c0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_211527_857033_33E6B21D 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
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
> Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
> make code simpler.  Change to dev_err_probe() in handling

s/code/the code

> reset_controller_register() error to make it even simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Other than this nit, looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
