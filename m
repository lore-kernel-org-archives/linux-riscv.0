Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47F0CA0EDF
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 04:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+3ZYZGvT4gU/o1ymn1BB8DwYGC8tmPFrOoTUwdU5c0=; b=YdqpLl2P6aOtP3
	dKSfYvenzJ1N4HdI2WlDDpq1XF8kpOZ+JpGNdx55VUJYbvE1jXRffO2n7RpHTr54zViUVUXXi9pt8
	P4DrYgvsXWWLRg1hW6RGWglSsyupbSWEqDyPPACGNqqc6biFkW0JgFt+4BBlFM5ugeeu8SdAoDiXA
	fwxrrYgdVHvYZfc1UvSidmNEPvAPBprxwUsVhfB9GIp/JdspVhEgLV7nqhOhlhffcKdOI/Zk+P7+Q
	srUfdLf6ik+L3/iduOSGn1yaj8zLm9mC419r7bL12ofuKrq4j2mjn3gWAXdo7Ic7f9Wv4W4IJA6HN
	aWrwfIu3WhcFhdUlc6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjted-00000004iwJ-0V4U;
	Fri, 30 Aug 2024 04:54:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjteZ-00000004ivn-0jwW
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8A2A2AE34E3;
	Fri, 30 Aug 2024 04:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7BBC4CEC4;
	Fri, 30 Aug 2024 04:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724993667;
	bh=nSo4wqOI2ey9H1S3qaG+6woJF9Ph01cDpyQNSucVvIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QfmyuBcrCbnXzOGEogLSSvAjFHFCwZ4uQ6oQX7VGY8ty4KL8tQJvWNbuxdgoNclYN
	 QVED++vzoLM7+vPigQaXPMHsUffF1ydpDF/TAVTtV3Fa1Ixz2lS6aI0jBsKkCt8STB
	 TtuHt/a5i1pjnUYmRxaTGvR/spwRdgFEMntCs7Ejz4sTO0Mp4phdAdO4Zyl6WKjzmP
	 bQbD7+A35i13EYy/wJ+7NpVGyPtakclSL37K/OKQ6NMQrvFk1PdaiCPxttjo+K6cxk
	 /5T1UBpkJXJgmhLszU19BfonTP3OG7/T5oIjEBTq4pF3HamvLXrNeZ1HkiwEvj2osM
	 9dN5PrF6Y3gQw==
Message-ID: <f4450d92-1cea-4051-8906-ace6cd4165a7@kernel.org>
Date: Fri, 30 Aug 2024 13:54:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] pinctrl: k210: Use devm_clk_get_enabled() helpers
To: Wang Jianzheng <wangjianzheng@vivo.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER"
 <linux-riscv@lists.infradead.org>,
 "open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER"
 <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: opensource.kernel@vivo.com
References: <20240829064938.20114-1-wangjianzheng@vivo.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240829064938.20114-1-wangjianzheng@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_215431_386078_3A240119 
X-CRM114-Status: UNSURE (   7.36  )
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

On 8/29/24 3:49 PM, Wang Jianzheng wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the calls to clk_disable_unprepare().
> 
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
