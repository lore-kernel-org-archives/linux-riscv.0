Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8C7C5320E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wja5Kz9yM8wrFxAfkUKod8mlTbNn6X0jAdw2QykjCA8=; b=yyNvrMiSTP309z
	dL+iM5JGKQuVmSgv/1txYt8ICZP7pi1wZO0/gCInbQT7z3ToF37h2aWjw5uafzbwBRcvU8nLB7eYC
	pXGI3DKo/omGpaMz6b/f7cZwxn2hz6X21C2Lgu7GFul4nWMgaFyUEJnAPR6Nog1yDl78i9wjkMwYO
	onICO3ssxVnb0Ha+MaJDEFO8AMul5YKBeVF0WVNcE3W3yMjzuc+M4rVaAKSdYjCVazYwOLVv4Cjla
	SBF1XwE5oDqBuBUoBWYdDaeQTKT17tHeW0NgbyKyB41X6dctqMq38yWxgKhFHlOwg4Mn69XVo8iAw
	ou3punmR6pwYnxx7uuMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siJfb-00000004ymp-0E7g;
	Sun, 25 Aug 2024 20:17:03 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siJej-00000004ydt-2dqm;
	Sun, 25 Aug 2024 20:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1724616963; bh=5lyLtuK442hALGuwG8Tt3Yh0ybt3qVKtb7SW/dSDUEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XqaApIbPi8gbYOJgm3Cx0J5MKtuEoFyJS6qK+OJfVdHhe4WUPDbIQfEHl5ed8vvVr
	 hXhAp0RRNjCJ7CsnB0oB+GPMKHvQ6dAGQjfcDFtidDDwaFUtkB6Cyk5sJJ9jOaKkaS
	 Swtv0rgUVNxMHzwWCpz2CTRG6500aafIsJvLu6a1nwruSzKu3ooDn2MzivE1Ekewcw
	 t4X7qjLExMqf1xNaXEndubAQICaby9hhF5nxMZCGTB/Pu+2ewMoGyplYKpl3cOMPrO
	 sGVXZDWImFrdKPmKyADZQFJwO35W3uYbKqBNCye+msFpTMINFyKe4BKqyzuyI/YeoA
	 oUGxVevfi+Jtw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id A107516C9;
	Sun, 25 Aug 2024 20:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1724616963; bh=5lyLtuK442hALGuwG8Tt3Yh0ybt3qVKtb7SW/dSDUEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XqaApIbPi8gbYOJgm3Cx0J5MKtuEoFyJS6qK+OJfVdHhe4WUPDbIQfEHl5ed8vvVr
	 hXhAp0RRNjCJ7CsnB0oB+GPMKHvQ6dAGQjfcDFtidDDwaFUtkB6Cyk5sJJ9jOaKkaS
	 Swtv0rgUVNxMHzwWCpz2CTRG6500aafIsJvLu6a1nwruSzKu3ooDn2MzivE1Ekewcw
	 t4X7qjLExMqf1xNaXEndubAQICaby9hhF5nxMZCGTB/Pu+2ewMoGyplYKpl3cOMPrO
	 sGVXZDWImFrdKPmKyADZQFJwO35W3uYbKqBNCye+msFpTMINFyKe4BKqyzuyI/YeoA
	 oUGxVevfi+Jtw==
Message-ID: <6964ae1f-bffc-4506-8395-8450c54289b3@mleia.com>
Date: Sun, 25 Aug 2024 23:16:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] reset: lpc18xx: simplify with dev_err_probe()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Antoine Tenart <atenart@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
 <20240825-reset-cleanup-scoped-v1-4-03f6d834f8c0@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20240825-reset-cleanup-scoped-v1-4-03f6d834f8c0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20240825_201603_690675_DE4F0632 
X-CRM114-Status: UNSURE (   4.48  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_201603_690675_DE4F0632 
X-CRM114-Status: UNSURE (   4.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/25/24 17:14, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
> the code also simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
