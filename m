Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACCBC5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 04:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BliuYwLDe1QWCmp6KOo/nYshriCLAZm/clFymtrPJgI=; b=M8AKU1NMdHlbNU
	HbPSa2IBNpyw8I6IEjmK/UNUcbZt1Ybs53hrbXlJ+poi/onlnrbkcP4VHLtBEyzD9QZk7csyMz1Nz
	b9ipVcYoAC0ail4rHXHklu28mqjaAI5J+oeWh6sVb745DDpvi+BvWsWa/qv6J1yXSxHXDFSYxMM2m
	pMa9dvOJybn9A6NyrpoPx5TCorqg0RKfc8Iru3XYhBDnzC6v1l31bl5/A5n4cFWrUaNUPxB95S9v8
	ym2zenqaXywGtH1v3Rshc1+1C92OgV9HGC/o13cFwUCA8SWeJYua9H7BmOnWK2z70+W3mSmWbAmO2
	C7aU/WU2/wPl4brenK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siRB5-00000005l3q-076f;
	Mon, 26 Aug 2024 04:18:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siRAJ-00000005kyP-0uil;
	Mon, 26 Aug 2024 04:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D719A40FAB;
	Mon, 26 Aug 2024 04:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D09C4AF0E;
	Mon, 26 Aug 2024 04:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724645503;
	bh=q4zLTK6jJh9Ouhg0CWmDF6JpWwLOZqwak5tvcYzeCw0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZBKqip38qTcw0FXgIElQ5rApVOMc3yVR19hGtfSxg/a+gSr9Pknu8ADTzd4Xv6Px4
	 dFfaWZS6KMBQODibCxiAQHvv5qS8fNhCnI4bVhrPzBYo9IvV6NzlFMeftnlc2bUndh
	 CdpyDUnG3HFnO4NKRRxqdK/XslOC/p3dM4BuacQfqlJ2aWbj7JsJb/CVHPHFkk4oIA
	 LaPd0iHLwzd7qC68ceSxDEyJDr0dXFr/mwOZi5jkiKkzTrCy2cnI8p3pE3hU2VI4AW
	 bkPHtiWnA4qZKwLJGw238JB0EcCdH5DY7yH8h1e5XjswVasd3NIpLkr8V7+CvhyL0a
	 9eiisAaSxZlsg==
Message-ID: <afad6db5-e33c-4402-adec-d1948300191a@kernel.org>
Date: Mon, 26 Aug 2024 13:11:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] reset: k210: fix OF node leak in probe() error path
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Antoine Tenart <atenart@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
 <20240825-reset-cleanup-scoped-v1-2-03f6d834f8c0@linaro.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240825-reset-cleanup-scoped-v1-2-03f6d834f8c0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_211715_329927_B169E23F 
X-CRM114-Status: UNSURE (   5.99  )
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
> Fixes: 5a2308da9f60 ("riscv: Add Canaan Kendryte K210 reset controller")
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
