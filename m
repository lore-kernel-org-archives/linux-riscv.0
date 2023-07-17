Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE19C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 06:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6UGe9ibnVoHds8PNL2+xN76XlSrVZt7XFSpLu7agYCs=; b=QaH2/bUh6YffcR
	xA4DwUzZTuqfmA5LhxORyRe9L1rR6fWzpBu5jNwqp9l7HoV4+FLYIsu2rD0zRN6j+Kci5NEPBqGH1
	u8o/2gHW5m2cx6+rTyB/MLxRdbZgY7dKOyaBugfM/onVoA4ATKizfLSBe9qCTjRJAEF+zEtkdz47S
	L+8eYpBuAsdKamTvGbNdfj0Z77mvFGmZ9cdKBrcnFDFoG52ls56gCuyFZyJfvGdMP8XjRV+fwoqrz
	QkKi29xFMOTOyWG1kE4J2wiP4AIOvS+fRFY9KpCf/hkqjoNf8+jf+e0xwpZ/LYtqF4RRMN7NQKGpk
	CbxxQOOhro+NI1eUdiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHv3-003EBm-2w;
	Mon, 17 Jul 2023 06:41:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHv1-003EAs-1h
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 06:41:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDD1660F31;
	Mon, 17 Jul 2023 06:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4C1C433C8;
	Mon, 17 Jul 2023 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689576074;
	bh=ToV/RNHkRpt5CR37YhL46DLIkicgD+NHudoNcjFMJwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bw8jRnspDqFn0RQ7AUREoDjcg7eqLyV/S6Y6BxnOzOv5KT3xBWbZR3kdNhol6L5o6
	 UgDIRcl20gTRSVszHMK9DkzEqWEIMyMQ7FBRI87CuySywWucjnOmQCu3VkoRNt5VI4
	 57sMPEQ7HH7BcNWvUtcCOb0o79zgeTLFjFImK5axv0vQBTQWd+4KJWbKNyQXyWpf3P
	 mwQ9fu8DRLkpBFQXvvjCDFhk4L2m2syxPfw6tdplMfLh6AO7+GYABm9cwEbWHcig3a
	 bvGaijc2FoHZmjYAYQnapSDKpYcRPAkyxsPDbX50WsT2m6w1FYT4WUUuGhgVJXeCRz
	 cp2Zhhi8A3X3g==
Message-ID: <eb2d6e5a-595f-85f2-fe36-8acbb76d3987@kernel.org>
Date: Mon, 17 Jul 2023 08:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] can: sun4i_can: Add send support for the Allwinner D1
Content-Language: en-US
To: John Watts <contact@jookia.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
 Fabien Poussin <fabien.poussin@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-4-contact@jookia.org>
 <f3b1240a-4be0-4c02-0a63-561499ad6d0d@kernel.org> <ZLQgQAigmhk9uYYd@titan>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ZLQgQAigmhk9uYYd@titan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_234115_704167_36D15FE5 
X-CRM114-Status: GOOD (  12.72  )
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

On 16/07/2023 18:52, John Watts wrote:
> Hello,
> 
> On Sun, Jul 16, 2023 at 06:36:03PM +0200, Krzysztof Kozlowski wrote:
>>> +static const struct sun4ican_quirks sun4ican_quirks_d1 = {
>>> +	.has_reset = true,
>>> +};
>>
>> Isn't this the same as previous?
> 
> Yes, but I wanted to split up the new quirk in to its own patch.

I don't understand why you need this new, duplicated entry. Aren't
devices compatible?


I also do not understand what 'own patch' has anything to do with it.

> Is
> there a better way of doing that?

Devices are compatible, right? So express it in the bindings and DTS.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
