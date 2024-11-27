Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A632D609D2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wfi1SvZZ6tuiHYLiMqbBR8KcT1ZtAyEAf4OGoofUv0=; b=iIJhVJVW38Kzru
	iExsX3u7YcwZvRKWg15WLVbdDsW7ekGqoWcyPQ0dUTa3jv899OdDdhUnxMrCLR9G0cAX5EjE2oWPH
	UbeMTeBWtdsh9fmdaRL3hCfqICIddOdiCvr6mUjsmkwexU8EunZU/iHmnBPO15Z2lou+KHY+nkbe4
	xatz9f4hGJfkzq7gccpVDFXzOYCN1qaF1O+6b4mLw03mxX8qn9g6+Psq8FQZe+EKKCO3Xo4sKSzoV
	dTKEj0OD3mWkOEZQ4Zj8Yq/PGxJM2rfgyL4b1FjvYGHgiyaASlW3PPpiozVpnQEfBV8LxyqVMAcIk
	XxEICS1jdmyOmvOujYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFiE-0000000Cuxv-49Bi;
	Wed, 27 Nov 2024 10:56:02 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFiC-0000000CuwU-07cg
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 10:56:01 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 48A0E122FE1E;
	Wed, 27 Nov 2024 02:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732704958; bh=1yU/qlGi1UeV8a2MiKkmtcspdlkNnyaFzSDiPOaFkJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LS69UuNHegvzH1QSVS9u26+DzTmRUuAlEOWIyQCWg6gHwC/xTRVDnLJVMA5CMLvw9
	 jgvd9Rei8dwzBzUJqtObWxY7lqY4eSGhv+d7YruAoVyCkKn7fnyIIIZiIFFDwfCf62
	 hFopsYayeFM0SFASoPuRhE1CHIbBp7CqPmRg2ONgiXw18fEmCd8j62gmhSV4LRwW8o
	 ra3bkHSwHwqTQhVZxw6w9vQGsP1nvn3pMY/62z7k1U1F2tMxIOhk5FrQjvcYDCTwf0
	 XlsLFTnm9O0CuaQbjsTiAwlgoeIv1DWE1XLvPwOfRXWZ+pvid18ZQR8KIgcfuM5DWO
	 5yMxMAkOe6QYw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNS0vbNhMu1C; Wed, 27 Nov 2024 02:55:54 -0800 (PST)
Received: from ketchup (unknown [119.39.112.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 9EAAB122FE1A;
	Wed, 27 Nov 2024 02:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732704954; bh=1yU/qlGi1UeV8a2MiKkmtcspdlkNnyaFzSDiPOaFkJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwsJfH+3HRYpZD5erNRE95tLavoK9z63ZaX9LVjxZJHBKdEgmgXeS6ic7WBmDKMvU
	 /eSyJl+JNlQy0ZHrPdw1iDW6BpZaPrdDwT4BfMmqBBwESOBfkRDgLdnaPdjMsgIFeP
	 s7pYW+XoA7hHNQ9Mp17hcE5uWgsxQ7jUXegvYUt7z49HQbFHYK7QUvqiRGL7+0qC2+
	 lbwhlTD4TJKqBmcFSh1/vw31YmsqnFJKO27CmJS4WssIQABF4Ml3jlz4dwLb+AngsB
	 uXXPfZwVEVQqdABuBSP8hsIP8+4hQL7pTgJ+bEEu2HFFUf2IEvC9tBKedT2g61J92f
	 RobmCn9pjXc+w==
Date: Wed, 27 Nov 2024 10:55:42 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 0/3] Add clock controller support for Spacemit K1
Message-ID: <Z0b6rqurcj-gfzjI@ketchup>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <015ca99c-e3bd-4e45-8d92-0e0f4de6aacc@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <015ca99c-e3bd-4e45-8d92-0e0f4de6aacc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_025600_233123_5389BA92 
X-CRM114-Status: GOOD (  17.95  )
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

On Tue, Nov 26, 2024 at 03:44:20PM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2024 15:31, Haylen Chu wrote:
> > The clock tree of Spacemit K1 is managed by several independent
> > controllers in different SoC parts. In this series, all clock hardwares
> > in APBS, MPMU, APBC and APMU, are implemented. With some changes to UART
> > driver, CPU cores and UARTs could be brought up (see below). More clocks
> > will be implemented later soon.
> > 
> > No device tree changes are included since Spacemit K1 UART needs two
> > clocks to operate, but for now the driver gets only one. I would like to
> > defer the changes until this is resolved.
> > 
> > This driver has been tested on BananaPi-F3 board and successfully
> > brought up I2C, RTC, mmc and ethernet controllers. A clock tree dump
> > could be obtained here[1].
> > 
> > [1]: https://gist.github.com/heylenayy/ebc6316692dd3aff56575dbf0eb4f1a9
> > 
> > Link: https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb
> > 
> > Changed from v2
> > - dt-binding fixes
> What fixes? Be specific, what did you change?

Sorry for the vague changelog about dt-binding changes... I'm willing
to post a more precise one here,

- drop clocks marked as deprecated by the vendor (CLK_JPF_4KAFBC and
  CLK_JPF_2KAFBC)
- add binding of missing bus clocks
- change input clocks to use frequency-aware and more precise names
- mark input clocks and their names as required
- move the example to the (parent) syscon node and complete it
- misc style fixes

> 
> Best regards,
> Krzysztof

Thanks,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
