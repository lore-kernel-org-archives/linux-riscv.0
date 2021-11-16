Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C7DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 09:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD57B61A38
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 09:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD57B61A38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22NtxqkDHDY214M597G+QdroCYM0JOaKUe7a9wPYMBE=; b=EZPoRXrAM8yW46
	/qXnlw3mhWOLfFI6uoTO22hRxLRS2PERToKNv41lLleuD2/nCelMufyznLMWRVbi4sHP29Ed6ETTO
	k9DkPh8d2zfw1v7SeJtL2D6txX7hUEiG0fSDQ/fpYAKbbyXHQkXN1akyRnXTRqKDPLf1wl6OZPjOC
	NLw7I+4WNTBBMrTOEmS+Ik5pdhvMiPhV/AGQeN7jpER4Ds/2T0Zgh/qSGu6chBOnj6T5CmXfoDrCN
	gaOKOZ5/QcLhIFXCVcG138rbPQWOl9vHhXhQ2SZ2t+VUlGg6me2hiIfH47DCt5N0jW/NkcnEdcjRW
	uKwt6b5jPGTvfFFgcNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmuvs-000z9N-7A; Tue, 16 Nov 2021 09:39:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmuvo-000z6e-Va
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 09:39:14 +0000
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mmuvh-00039f-KB; Tue, 16 Nov 2021 10:39:05 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Cc: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Name gpio lines.
Date: Tue, 16 Nov 2021 10:39:04 +0100
Message-ID: <11612716.TMCrJ2abzX@diego>
In-Reply-To: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_013913_066367_941E1D12 
X-CRM114-Status: GOOD (  17.96  )
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

Hi Vincent,

Am Dienstag, 16. November 2021, 01:52:56 CET schrieb Vincent Pelletier:
> Follow the pin descriptions given in the version 3 of the board schematics.
> 
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

when sending a patch series with "git format-patch -6" and friends will
automcatically generate x/y additions like "[PATCH 1/6]" and so on.

Please try to keep them around when sending, as automated tools for patch
handling like "b4", stumble when they encounter a patch series without them.

In this case a

	b4 am f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com

[first patch in the series]
will actually only retrieve the last patch

	"[PATCH] riscv: dts: sifive unmatched: Link the tmp451 with its power supply."

as it thinks it's a new version of the first one.


Thanks
Heiko

> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 4f66919215f6..305a086e5207 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -245,4 +245,8 @@ &pwm1 {
>  
>  &gpio {
>  	status = "okay";
> +	gpio-line-names = "J29.1", "PMICNTB", "PMICSHDN", "J8.1", "J8.3",
> +		"PCIe_PWREN", "THERM", "UBRDG_RSTN", "PCIe_PERSTN",
> +		"ULPI_RSTN", "J8.2", "UHUB_RSTN", "GEMGXL_RST", "J8.4",
> +		"EN_VDD_SD", "SD_CD";
>  };
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
