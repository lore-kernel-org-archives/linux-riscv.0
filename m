Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D284DC25B78
	for <linux-riscv@archiver.kernel.org>; Sat, 25 May 2024 12:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7DCvC5KNqFg7TO8rzUlWI/tjMGv1UnvkD8EYIZbGwc=; b=DTJHM5gqj7DOmY
	0hva6KSVLW+oTmzJhN5wLc4S8aiy3nUrucr3D2Lg63UNgSflmha4yvDYlTsWsbgUVmKAZkhd1E3DA
	E2lyrxgSwW1i75nc7HFrDedXJ80zqL0FS7/+KK4Kc5acCoT0A7cMFD9CI6cW2vVkucl3ABDcA/+jH
	pzlQ3DQeUSqdyGpvEFhK9/Nf2pHSp+/FOulWlD8HgKI4i2+6B1GZEh6q4XC8dCERtZI1zxO8UYEuo
	62M6BFfaVMFX234AuUJiNCQoODI3D821tJUghI9X0frxXNCNvJA96gO5vax2nieAF0eluTcDdlT+i
	WfB4GiyjjG2douW/z7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAqi0-0000000B1FP-0OqY;
	Sat, 25 May 2024 12:41:12 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAqhv-0000000B1EG-34Zl
	for linux-riscv@lists.infradead.org;
	Sat, 25 May 2024 12:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716640862; x=1717245662; i=markus.elfring@web.de;
	bh=7ZviCUB/6lSFNWCT4XaECeaxvcTOrRra9ubMc9FPOP4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wgneB7Q/+jVmeHNdKGzQxIHu4OkyOgIjaer+RuHSun7lABKV9b92tPk8BL7OoAGD
	 gs3lhU89WmbTxA5x09HbJ9CfojMgMxAng0FxGwBd3dUzaWLO9mcjEfwYNZx/G0QKL
	 ytKsxOBiz1UcGyQ0QGcpRh26xiVew946O9xXEbS3vuB26kPyavFwCS3ysn2lr5wHm
	 RQ2GBm8zgyUPoO5l1y3WOulWZSs1emvTJXnTM5KUZ59AdM8vGM7wy0M+PIYr+btm9
	 1X7HixKKVzu/URFT++M1DFUjC4z0Pl8xmDcJUhMNNBpdz0YaS+BPhQHAJfHyKR3cz
	 AzvqNkxIcViNNNeANg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWzD3-1rzW1U49Yv-00QEPd; Sat, 25
 May 2024 14:41:02 +0200
Message-ID: <3aeb3813-9a82-4b1f-9dd6-5baad2d45f2e@web.de>
Date: Sat, 25 May 2024 14:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISC-V: add Star64 board devicetree
To: Conor Dooley <conor@kernel.org>, Henry Bell <dmoo_dv@protonmail.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com>
 <1b55aad1-1442-41a5-acc6-16baab90c021@web.de>
 <caCBlFpvjmhO9G1A1_2qHImmuoGai2NoPYonB5RCVftq4zIrSxlP8Msh9z_FX9GwQXzfSrB40dRxy1zfxZesOJENeebWQsERa03sDvArzec=@protonmail.com>
 <20240525-dumpster-bootlace-10123081a6f2@spud>
 <b52685a3-127a-4367-b11a-54ab88467dcf@web.de>
 <20240525-shirt-scratch-6708b2a4f63b@spud>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240525-shirt-scratch-6708b2a4f63b@spud>
X-Provags-ID: V03:K1:CxPNXD7l6EM9E57TBcClo6tiFuHrL+82ELChilSGwI5G+i6gBZ6
 /5SsVq1xUBJVOQCDKy1aYKX//RozpMRI4fznh6el42YVnrr3ZEzIloNMgvW2BWuRlmVchCE
 N28MO4QJZzdMdC5+XLEEhZPJhVeXQVOF8LPXzKS37ILeLbRMgeGTW4lPt6T/LZMklvMsRX+
 e2/QXchk8/MjP/lQ2dTDQ==
UI-OutboundReport: notjunk:1;M01:P0:jkgHsTc38j8=;eVO6GgRHlUgM/p7JnxdTdFAMzkE
 Rxbk08XB7XnfNSsOOWF8BNoumfxz9zwuDS2JYe7rfFV/R7zKCbEpo7galTmlwzeOTxSkVM+Gt
 Ejgp6/RVrUxAoj0/HU783BraiZ+OpA53MMcpLcPRUvpwOCyRfKlwIC07olO55pUxzbumeOswL
 Ch7fsHgvCmVxgfdcm9OYHwQ0gp5sBtTHNkS+IPEPVxrhHOJSEdCEYzLNXW9SdYMPllAnEbByN
 GytMFzm3DJCqnsOlQgEzk0lAmw6Odq1qQTyB77+R7KwM4AGswc7mY0skGIMctqmk0KiSzeyNL
 wwruCAnhMnw+vgDS9UaZlS8+uqGja8tKI11+tv4HxO32S8JDFKsdsBLcASMlr4x1TzUgWanp1
 YCwFKmbNXeDChNNNdj8UiKeX1JnEYw6NhtAVA2xqDQ9eSbHwr3zGSCx7xZ1QXQCa+DlkkI8Be
 so49rILwDUx6KyJjcKGg6nll3RMJVUg4rstg/2/2tMGf5BLbtHS4b4xZbAKye10hjESyAOp7x
 RiQmN3P8zq/HB/hvrUlO9VIJltKa9I6bggaWrvC3bqTtQsQh8xBGH/jiVcS9REOWTetADP76t
 4yVMSA2xXO6APwftKb7JwVElXjAPYZodqEfMJssRbru/PdlXsqQZRzQFBHh4xKzTWtptUGOiH
 8YgadPhbRN/KI+6zziOAXNC6nEnleAkzfAeGmEV/FOlO7QXoPNIXefKhrweyCMH0rhEhwn0nO
 tGS2cj8WWLEembz1gb7D2UVUjHKKzXYXI0zcxBzOwED+Qxpn7J48efclCcbruToh3irG5++vY
 5UE2lby9AUDj0Rp1PbmP4wm0j6ymRIkAZsJ5/pvS+WN9M=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_054108_268922_6E5A0183 
X-CRM114-Status: UNSURE (   7.63  )
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

>>> Don't worry about Markus, most maintainers (myself included) ignore his
>>> comments on patches. The commit message here is fine.
>>
>> Would such a response mean also that you are occasionally ignoring requirements
>> from a referenced Linux development guideline?
>
> I do ignore it from time to time, yes. Being a stickler to the
> guidelines wastes everybody's time (just like this discussion).
> That said, the tense used in this patch is perfectly in-line with the
> guideline you reference.

Partly, yes.


> "Add Star64 board devicetree" is in the imperative

This information fits to the summary phrase.


> and the commit message body contains additional information about
> the board's configuration.

I hope that further contributors can follow the recommendation better
also for the imperative mood in changelogs.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.9#n94

Regards,
Markus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
