Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5181CC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 07:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKq/bzvwAHYY32kr8EfjOp9unRELFG7NnmAdesTVKmA=; b=dNXbO+ciol/Ihb
	msAf+EpsKtpWvt80fh+w9K5l8TKJNeLM/aLx0TFlh8sDzT+wgBCgk9fG9mh/j66qjbh81/spgXepm
	AsC+gv207TVcakHdkGjMX83MXLZ4pMOrV388L2/hdqiEsTsXI1w0mwbsaCQ69UiLxqgQbVIVorA3I
	VGBvd4W49LLbanAX0zsfcL5PshgW321LFDqui/ZMdmmg/rIhWaJsCP231SK/U4BizfOG4YWnpgpnO
	KIDP/hy8zPQqVzt0vAoyatNQ1ONIQi+cU6NsYAxeeAhakBcTdmxiJKwgOTKg7RZJHFnwk+iLnIvfS
	WNspk3rOYClWVrHZDoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIPW-003Hal-1K;
	Mon, 17 Jul 2023 07:12:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIPT-003HaI-1R
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 07:12:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC5C160F72;
	Mon, 17 Jul 2023 07:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85DA4C433C8;
	Mon, 17 Jul 2023 07:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689577962;
	bh=Tx/77+tErUVZAWuLrax7VIUu2uzMqwMf9CKDUK2pqEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N8Zd171RBHYUsQaHAzpkU5YalNpirRqrgQrWhGk7q7GZ3A+xmv7yhqJ7u3U0fKAIH
	 X1jwKtSdXooNZjeRzUaMyY6jUCNCsC0AG4Xv2srM0fsZ+kK7y+lyjAFrzm+zaRL58H
	 pxQ2N6y3EnC0ENoybc2oEQ+FFyfFKI92xKTOKH9agFtQoGmXPijD25dPCTdnEkrbl5
	 ZiX1OkzbIG/bW15ABvmV9VnnFk95dRzqQ7uFPeifWxoJjOQLq0jArU0XmE2m+8eVgV
	 pQrDjeeu6q5X18vt7t20qpVxzPtJ4Uaw+OIM5ddy524jBazcUdhnPejktX/fHFB9Hb
	 LiJo1/XEqM0QQ==
Message-ID: <07aa464d-c9d8-4fe0-2063-98562a3480d6@kernel.org>
Date: Mon, 17 Jul 2023 09:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] can: sun4i_can: Add send support for the Allwinner D1
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: John Watts <contact@jookia.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 linux-riscv@lists.infradead.org, Fabien Poussin <fabien.poussin@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-4-contact@jookia.org>
 <f3b1240a-4be0-4c02-0a63-561499ad6d0d@kernel.org> <ZLQgQAigmhk9uYYd@titan>
 <eb2d6e5a-595f-85f2-fe36-8acbb76d3987@kernel.org>
 <20230717-aluminum-driven-a008473620ca-mkl@pengutronix.de>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230717-aluminum-driven-a008473620ca-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_001243_529138_66519057 
X-CRM114-Status: GOOD (  12.07  )
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

On 17/07/2023 09:03, Marc Kleine-Budde wrote:
> On 17.07.2023 08:41:07, Krzysztof Kozlowski wrote:
>> On 16/07/2023 18:52, John Watts wrote:
>>> Hello,
>>>
>>> On Sun, Jul 16, 2023 at 06:36:03PM +0200, Krzysztof Kozlowski wrote:
>>>>> +static const struct sun4ican_quirks sun4ican_quirks_d1 = {
>>>>> +	.has_reset = true,
>>>>> +};
>>>>
>>>> Isn't this the same as previous?
>>>
>>> Yes, but I wanted to split up the new quirk in to its own patch.
>>
>> I don't understand why you need this new, duplicated entry. Aren't
>> devices compatible?
> 
> According to patch 4/4 the devices are not compatible.

Ah, ok, I didn't go so far because it is not obvious to add support for
a device in patch 3 which is already not correct and needs fix/followup
in patch 4.

Thanks.
> 

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
