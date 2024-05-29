Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E657C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pt2BxM5VEksXjmVa+0Hayo5vnjPZQ6uRXcFV/enT0Gw=; b=IDZbBm6ijTZGxW
	aWEuon5/6KC6k7W7qy74AMVO8Ggvi1/KqGzOaPZStJ6K+EHJIloBO/EnfH4qWUdCFPv6lCzcLDS5v
	UKuuIEAQHZVty49wgE4dblkcwSoQKOkPXkWgQYgXkFR0WDUGohoE4GMIemBT1AuEFxeK67QBOxNOW
	NlEaD0saqPalAA6zjo+tTRP3wtdJXSk7KGv4LM4vJOXD/BJBNTeTXkGqicQTIZlC/b0F9oIb6QoMd
	UizZa4U/Q7Nq55YcYs1lq5GJ5LwTSo8/ee9ke+y8RAKDF59Sp/pzeR3Vmz8AsNh2ZSS47w+OCvHBQ
	rf5AnWR53jlTvB6YKQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLcX-00000004mF6-1xie;
	Wed, 29 May 2024 15:53:45 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLcU-00000004mE7-2Edt
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 15:53:44 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4VqDSW0FVcz1qsPH;
	Wed, 29 May 2024 17:53:30 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4VqDSV6Gwqz1qqlc;
	Wed, 29 May 2024 17:53:30 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id KX2dlM8WheZz; Wed, 29 May 2024 17:53:30 +0200 (CEST)
X-Auth-Info: SJeIiO1rcsLcTt+IL1oruYTZ/1F0tXYKZQaoRKYEVhcZHeLOHoHmD6I7lXsiUoCl
Received: from igel.home (aftr-82-135-83-252.dynamic.mnet-online.de [82.135.83.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 29 May 2024 17:53:30 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id B9ED42C02CE; Wed, 29 May 2024 17:53:29 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Emil Renner Berthing <kernel@esmil.dk>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100
 boards
In-Reply-To: <CAJM55Z8Ce1i==pSUj0z4T2y71g713-675mAYQP5qSN5Euz=rLQ@mail.gmail.com>
	(Emil Renner Berthing's message of "Wed, 29 May 2024 04:49:03 -0400")
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
	<87wmo2nmee.fsf@linux-m68k.org>
	<CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
	<87zfsy102h.fsf@igel.home>
	<CAJM55Z8Ce1i==pSUj0z4T2y71g713-675mAYQP5qSN5Euz=rLQ@mail.gmail.com>
X-Yow: ..  I think I'd better go back to my DESK and toy with
 a few common MISAPPREHENSIONS...
Date: Wed, 29 May 2024 17:53:29 +0200
Message-ID: <878qzsbona.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_085342_857241_C3707855 
X-CRM114-Status: GOOD (  13.53  )
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

On Mai 29 2024, Emil Renner Berthing wrote:

> Oddly it doesn't work on my Starlight board either. I was thinking the firmware
> might set up pinconf differently, but comparing
>
>   /sys/kernel/debug/pinctrl/11910000.pinctrl-pinctrl-starfive/pinconf-pins
>
> on the two boards shows no differences. I've also not been able to spot any
> differences in how the AP6236 module is connected in the schematics for the two
> boards, so not really sure how to proceed.

I see no difference between Starlight and Visionfive boards, both fail
the same way.

I also see that sometimes the firmware greeting from brcmfmac occurs
_after_ the timeout error from hci0:

# journalctl -b -2 | grep -e brcmf_c_preinit_dcmds -e hci0:
May 16 12:01:54 beaglev kernel: Bluetooth: hci0: command 0x1001 tx timeout
May 16 12:01:54 beaglev kernel: Bluetooth: hci0: BCM: Reading local version info failed (-110)
May 16 12:01:54 beaglev kernel: brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43430/1 wl0: Mar 30 2021 01:12:21 version 7.45.98.118 (7d96287 CY) FWID 01-32059766

Is this perhaps a race with the firmware loading?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
