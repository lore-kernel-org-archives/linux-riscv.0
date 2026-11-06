Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B78606A336
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TaGMhZQe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=NqIjTpZ5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1E+lpf2CSEaCES3IGLlhaDZkApyVuRNFDVbhrcjzp0k=; b=TaGMhZQeUHKdUN+ovuW1rk6uYL
	ULMprFu8yz+hqELYrtdm0/IuOKNJ0cMK1KH4/3HrBMk13RuME8Tipfq55ZEqalnTua5L+CBsCpc0R
	949oxK++iVvti5zZDcA4SPXm7rciR0M3RK0YaVY0UppnP+EwcAeHUdWvyKVgV6kr+XGOiXvJ7H2pV
	Hz1t4u0e7pzV8hfHoBEAdn/ZLfXSyvDhHX6Fx78Tlv9MqnbAUJCUyWXPIPDhN3LNkSc4rjy8kBVvG
	0cYqE1WcRcYMmduLy5TUW9QtgnK0MVqrBjSoM+6+nq9aRPulY8NoQrZWpk0Qf9jUVGnrdig9RYwS4
	5ZxH3Ywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPH1-0000000DUWM-3ewO;
	Fri, 06 Nov 2026 19:06:51 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPGx-0000000DUUk-1aDo
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 19:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793991986;
	bh=iZ2LBKf2o/a6NuQvYXs34F5ZooH4kEfB31uOLqQEQ6g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NqIjTpZ5NoDlROcd2MKaHLgNafgOSjtxF39ejQn0wKqesVlCTyNO6uynAxybIGIN9
	 XJXomOfpV6Twr6nug0BatN9zUvqARt4A+vZvQutcIZf5YiYZwdTyCig8Meyr0qI+5z
	 NlDXSdlPpwyM8PVSW8m8eRSzYv4HX4pJPcGr6Hz3lQuSY6iMu831NNxTgjhwFxJUgu
	 76P4DcgQPqnnsuosGqBxHdd3w6GnXcHBW/MYzylzLVGM/778mpefQuzoN0v4P13toM
	 j7gmSZZfnloXdh1ofiQmTkbfxPrVsszk+Nw3y6PsCiSTTBOtaRjU9OjJmEgXT5DJFP
	 mCVI5FgQgf1sA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 53C0EB22073F;
	Fri,  6 Nov 2026 20:06:24 +0100 (CET)
Message-ID: <181fdcd8-80ff-4486-ab16-9cbce16b0a29@freeshell.de>
Date: Fri, 6 Nov 2026 11:06:22 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Owen O'Hehir <oo.hehir@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <179399127414.1902073.729566010968054971.b4-ty@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_110648_910031_4259BA11 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Conor,

On 11/6/26 10:54, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Fri, 06 Nov 2026 18:40:55 +0000, Owen O'Hehir wrote:
>> The firmware turns the status power LED on, but the node has no
>> default-state, so the LED switches off when leds-gpio probes and the
>> board looks powered down.
>>
>> Default the LED to on.
>>
>> Tested on a VisionFive 2 v1.3B.
>>
>> [...]
> 
> Applied to riscv-dt-fixes, thanks!
> 
> [1/1] riscv: dts: starfive: jh7110-common: keep the status power LED on
>       https://git.kernel.org/conor/c/68dbe2550bd4
> 
> Thanks,
> Conor.

I replied this a moment earlier:
https://lore.kernel.org/lkml/179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de/

This disagrees with VisionFive 2 Lite schematic; if when this node is
consumed by a bootloader it will be evident we are not describing the
hardware correctly, no?

If you want the light on and it wasn't on at reset or due to boot ROM,
then that is userland stuff and not hardware description... but that is
your decision to make as maintainer.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
