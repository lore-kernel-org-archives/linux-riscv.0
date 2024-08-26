Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC07C5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 04:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vg612cRG5d+gZ9VDsJilzI6Pom/cuFAqAK+SE1GDsBM=; b=41169xmlgrM0xH
	NlBIcetKFon3w99SIIn4N9SaD/YzdpzZ0Z3yGV2w0NE3fRuTpRjf8ze1BBz2/XMW2Bjj1YqInTet8
	g/QY72mRA1lyT3MSqkV2SKgrQnmtkQOR50kDhnrn5cZeepPPIehg7T+/MW00vZgNEWSHT/Luhtznz
	i/BCqMzXOOHyu13ZMtjvYFg1zMeX1OpnQ/2vFD0ufiEdpC6CH8u64uumhpxOmb8yfLtphtl2shzTw
	/2qBW1IVIeAW0/kitbo72bu+2UZKWCyGPTrZdMVtFiRWnzht3OpDMmChqQE0J4S85dCYGkU6CBLxo
	VCVJR9TUhw65Cd2RTSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siR7I-00000005kF2-34fB;
	Mon, 26 Aug 2024 04:14:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siR6N-00000005k2j-18tI;
	Mon, 26 Aug 2024 04:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 88B7CA40FAD;
	Mon, 26 Aug 2024 04:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA755C32786;
	Mon, 26 Aug 2024 04:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724645590;
	bh=UW2nMlUeZn7NKIHJHCFR+luWnGF8nXJk9IcGAsYxwKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qmAb9OPWYPlsjXt9AzutjVNlWEtO/AKOcThneJ6dSKewohKucMFIe4kWaqyXtE/60
	 pgynvz6ZEcgPdxHc5jAoH110z1BYTa7iSwjISpZI9MZ28shD6r1hNgMa6naazcmpvk
	 3fqohd2Hynx/SO/UH8tJzqexxMKd/3BNkOnif7ibqD2QRkqJ2EXSAnGHy87MnBCAjr
	 YlwSNKfEvVzjofNRedSPjuVGpbbzRqRvgPTStu2LPlxgadnA9v0vbrRH7DJRDsmg4L
	 lL1nIkAjojgvjR8lSH9TqZeD9IEYaqN9mJrDuZX/IQ310SBbsww/HjVVayX6v20B1U
	 OmebFfxLUPnOA==
Message-ID: <54a74f38-6b11-4b84-a9b1-709564f735a7@kernel.org>
Date: Mon, 26 Aug 2024 13:13:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] reset: berlin: fix OF node leak in probe() error path
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Antoine Tenart <atenart@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
 <20240825-reset-cleanup-scoped-v1-1-03f6d834f8c0@linaro.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240825-reset-cleanup-scoped-v1-1-03f6d834f8c0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_211311_409461_401D7A82 
X-CRM114-Status: UNSURE (   6.46  )
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
> Driver is leaking OF node reference on memory allocation failure.
> Acquire the OF node reference after memory allocation to fix this and
> keep it simple.
> 
> Fixes: aed6f3cadc86 ("reset: berlin: convert to a platform driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
