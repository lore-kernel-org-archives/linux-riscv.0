Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A246C5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 04:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ErmSobNS5oNI3kzHdc3TUkoXNR1Xf/b06ecjrd2Lug=; b=2/2cNgHnVNpaNz
	Ar5FeZFtOFBvjDCe2db5/TmD51ZnPtuCf/wol0PTqXz+g71WV6c3duaHLIHAYudYKPYgvTyi3xSXl
	IARoLB3lXulgjv5mOPjAnW4J6ji/7yRD0oTE3jldO9F4ySPRBTZ6pwsGOvXv7pxmzBcXpoFti2uK2
	Ij4D+0A0OPiYYj0JlgzCORIRADlJe6esodbOuoqlOH8yKvhm/qCrGxNBPxTsN8sSByjrp/QVuVWJu
	++3bXv6rF1seEQN4lIyrQVUKnyGWYdfGDoRKd3z6Jx4GGCFM+EU3ZZ6b3EynOgCePc9gmuZcOfESC
	jvGxh2kxEHe0rytypRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siR83-00000005kSo-2KJb;
	Mon, 26 Aug 2024 04:14:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siR7B-00000005kCg-0tXc;
	Mon, 26 Aug 2024 04:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73F24CE0B55;
	Mon, 26 Aug 2024 04:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA6DC32786;
	Mon, 26 Aug 2024 04:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724645638;
	bh=KLcj7LaenBiRjHud3B33rKf203jvAY+27P+VFPykXvU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AMNVTCtfT5vO0PobqPxgiSaImI/PL8/znaroVIEa3brFD5jg35h6Zwhh5TXuLydJV
	 ubwTtyRrVB51e7RNAO72he0aCVccrQbhD4HjdiziIFZJrAsch4qvOqb4vR5oQnyeky
	 ZVeEXXpIUu754em8CB6XB0C7D+zSu6RkKIAxpsj6ZUDRCAUSbPbq/n1GDWghYxPeQX
	 g8dNvhyhlN2DZqw8bLkalY+QPODLQOfYlZodsTlwua59VumQujRfBp+p5yH6Mp4aGB
	 TU5rgWbbOh6kDMAR/TpgKhVTV3CGlcUu7iAFUFOe9RfF3Hn3nHF+AwASM0glKg3/An
	 oV+2xUSslZR5w==
Message-ID: <f1b64eab-5ed8-4c29-9a45-576da80bf86a@kernel.org>
Date: Mon, 26 Aug 2024 13:13:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] reset: lpc18xx: simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Antoine Tenart <atenart@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
 <20240825-reset-cleanup-scoped-v1-4-03f6d834f8c0@linaro.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240825-reset-cleanup-scoped-v1-4-03f6d834f8c0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_211401_460166_4627CFBC 
X-CRM114-Status: UNSURE (   5.07  )
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
> Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
> the code also simpler.
> 
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
