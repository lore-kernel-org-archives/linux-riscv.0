Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8A0C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 19:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9fcmOfEQe0EhIGqEp+dc8Z8VS3iQjIi7dsQDkJZ/wg=; b=IZZAo/W0zNjSCl
	gO8Ku1Eacm6fYheXSL8XtwOrJKhDgJXRHEieAHvbsx54AfuSgG0MBZ/QFgKFkvIYvjZrcC61bJtjK
	hQAt0UaAGYdeI8M/LUTIccMi7sR2kr1z2V5dj9M1q7MifbCEXv5KYqahcgUpv2rLX/E4o7wqSe4vm
	7wWeERqSSD8BNGQwoY/079Z2OS/gltURq+HIwdNB+B1B3h/EzAnHe4I5z7fLjlau3SZBHw/uJjRxB
	jGQslD3ivzGRO9Q0FCpDa4fItzoDYmxT6YWyq45DPaDiezgLPYuiLiTLJ5ZKmNrttnSFfrsi9Qyw5
	7g20r1/VqlISw4TYMXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCPJE-00000005NY7-3wB0;
	Wed, 29 May 2024 19:50:05 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCPJ9-00000005NWV-3I2b
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 19:50:02 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4VqKjB6NXJz1qsPY;
	Wed, 29 May 2024 21:49:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4VqKjB5Cjhz1qqlS;
	Wed, 29 May 2024 21:49:50 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id Uh27It5nQX2G; Wed, 29 May 2024 21:49:49 +0200 (CEST)
X-Auth-Info: 0SwjUwDtw+nxunYaVMuVVnCmM5xNvnuk9yBSTzOmX3K5ggql+6ueXVIRbmsnRiUW
Received: from igel.home (aftr-82-135-83-252.dynamic.mnet-online.de [82.135.83.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 29 May 2024 21:49:49 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 917B12C121E; Wed, 29 May 2024 21:49:49 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
  devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Emil Renner Berthing <kernel@esmil.dk>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100
 boards
In-Reply-To: <f18a74a5-330e-402a-93ca-5552faf00e7e@sifive.com> (Samuel
	Holland's message of "Wed, 29 May 2024 14:30:31 -0500")
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
	<87wmo2nmee.fsf@linux-m68k.org>
	<CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
	<87zfsy102h.fsf@igel.home>
	<CAJM55Z8Ce1i==pSUj0z4T2y71g713-675mAYQP5qSN5Euz=rLQ@mail.gmail.com>
	<878qzsbona.fsf@igel.home>
	<f18a74a5-330e-402a-93ca-5552faf00e7e@sifive.com>
X-Yow: On SECOND thought, maybe I'll heat up some BAKED BEANS and
 watch REGIS PHILBIN..  It's GREAT to be ALIVE!!
Date: Wed, 29 May 2024 21:49:49 +0200
Message-ID: <87zfs89z4y.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_125000_025811_A73B051A 
X-CRM114-Status: GOOD (  10.12  )
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

On Mai 29 2024, Samuel Holland wrote:

> If the Bluetooth part has some dependency (pinconf, reset pin, clock, regulator,
> etc.), then such dependency must be declared specifically for the Bluetooth in
> the DT. Those seem to be correct, so maybe the issue is the maximum UART
> frequency, if the signal integrity is marginal. Have you tried reducing that?

How to do that?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
