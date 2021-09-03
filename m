Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_A1,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78B9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 00:46:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E7E60F21
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 00:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84E7E60F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=comcast.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KEw5UNObCv2YCO/lMxm9UGXxK9cZmNjUPz+JcFHTLl4=; b=QehE1LMMgCqEYh
	1YMK9UDk1HR+JBlnXscFyylvjM7ovLL9SCsUnAFrpUQtq7/oSXt9j79M0wxN7FLlg9bBMG5o3AjS6
	4qEXbBEOrtioW+gOWJHeudgdJ7V1KlC7XWpfaZK5aiUvRNh/JJqwAQdti6o/+NV7o/t+f3R6SxdOz
	DqxKWpmLzGaAY62Qs1a6vQC1cRiuMnBcMk0qDy/M9L/JbjUbofH5SZ0+/ANw2AJu6KO/4OV1DfB1t
	CSkAQ6iOfhsk1CFqwMjuwBpmDxpXHq96I8b76yXfVsOdBStGJMbXBQ04cPQ69+8F7NEzSCvJl3YOF
	+nujUqjxAjohqSNKEQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNlih-0056Hn-SF; Wed, 08 Sep 2021 00:45:43 +0000
Received: from resdmta-po-02v.sys.comcast.net
 ([2001:558:fe16:19:96:114:154:210])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMHMQ-00D4dg-RJ
 for linux-riscv@lists.infradead.org; Fri, 03 Sep 2021 22:08:36 +0000
Received: from resqmta-po-12v.sys.comcast.net ([96.114.154.171])
 by resdmta-po-02v.sys.comcast.net with ESMTP
 id MGl3mZPCfgpetMHMHmjduC; Fri, 03 Sep 2021 22:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1630706905;
 bh=02oROhqxbDdacnuxiRPgPS3NsFLE1CS2jhSVLbFOx30=;
 h=Received:Received:Received:To:From:Subject:Message-ID:Date:
 MIME-Version:Content-Type;
 b=okBKiiVgBPpx7NGkGvipNdBjN9V0pSHC6uPGMyaKYj5TupHcBBL011IfPVeGdNfhU
 fYhem7dlUZfH/Fq2gQhPI66psDlaRQxEHVawQnI9GiH0wr0wWYTkIFgxJ8DlFBe5DV
 vhLB5qEy+hyeBXegqlSOMft4DG7Wu/Ulasg5i7a0+hUVmK2AZvC3QADKgvOE0BWX9w
 WbqnPRmQZbgIbl3BW5L3I9ohiOZMRHJbSjD18f5OXdLBRJT5Rr7s1gscopZRs9v/pS
 JSNHy+44gzhYa2Npjfef1MbrkXvLBogm77cM5vTKQYuDAbEwKLwx4DoqVvunNfZIYm
 aUdMKwl1wSsnQ==
Received: from resomta-po-05v.sys.comcast.net ([96.114.154.229])
 by resqmta-po-12v.sys.comcast.net with ESMTP
 id MGbmmitoCfSZqMHDimZuAf; Fri, 03 Sep 2021 21:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1630706374;
 bh=02oROhqxbDdacnuxiRPgPS3NsFLE1CS2jhSVLbFOx30=;
 h=Received:Received:To:From:Subject:Message-ID:Date:MIME-Version:
 Content-Type;
 b=uat9xgSh5ao0RO2ACYUnPqUVk2n2dCfwvSjypT1oB9ePhGwE8wi9gRRBWwmzlDU2D
 gZkq73a2eN8SRw5hbBLNNk0RvjYDVbd5T9KlkVnGIYYQPJWSaOsDCRWSNGWlhWD2Cb
 +0CLQp0Kjck78xKQJOgZXGWqH7hT1xGGx2D7b82jJfOnf/lIeOCn0Dv34DV3j8M2Iv
 qM2gIgzg8I4TK1iSIAQ5jpR6bX5DdKZ5eBNdrem5kOB7yYEcga7ICjdsFhYpu6Wzox
 E3YqhsNRqlt1EdKfZRGDWMVXjr3+6VuSepmaHkJHfMt5wjkEmb+vlmHlGhxZUiRdm1
 N+EZ1tPhhl2Mw==
Received: from [IPv6:2601:647:4700:284:d637:bb38:609a:14c]
 ([IPv6:2601:647:4700:284:d637:bb38:609a:14c])
 by resomta-po-05v.sys.comcast.net with ESMTPSA
 id MHDhmUmSyUQLZMHDim4Roa; Fri, 03 Sep 2021 21:59:34 +0000
X-Xfinity-VMeta: sc=0.00;st=legit
To: linux-riscv@lists.infradead.org
From: Ron Economos <w6rz@comcast.net>
Subject: Re: [PATCH 2/2] riscv: dts: unmatched: Add gpio card detect to
 mmc-spi-slot
Message-ID: <33be320b-2f73-64bc-0ca5-029aaffc59aa@comcast.net>
Date: Fri, 3 Sep 2021 14:59:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_150834_949492_DEC5D287 
X-CRM114-Status: GOOD (  15.98  )
X-Mailman-Approved-At: Tue, 07 Sep 2021 17:45:42 -0700
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

> From: Bin Meng <bin.meng at windriver.com  <http://lists.infradead.org/mailman/listinfo/linux-riscv>>
>
> Per HiFive Unmatched schematics, the card detect signal of the
> micro SD card is connected to gpio pin #15, which should be
> reflected in the DT via the <gpios> property, as described in
> Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt.
>
> [1]https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf  <https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf>
>
> Signed-off-by: Bin Meng <bin.meng at windriver.com  <http://lists.infradead.org/mailman/listinfo/linux-riscv>>
> ---
>
>   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index b1c3c596578f..214794363c6a 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -2,6 +2,7 @@
>   /* Copyright (c) 2020 SiFive, Inc */
>   
>   #include "fu740-c000.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   
>   /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
> @@ -228,6 +229,7 @@mmc at 0  <http://lists.infradead.org/mailman/listinfo/linux-riscv>  {
>   		spi-max-frequency = <20000000>;
>   		voltage-ranges = <3300 3300>;
>   		disable-wp;
> +		gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
>   	};
>   };
>   
> -- 
> 2.25.1

This is a very useful patch. When running the HiFive Unmatched board 
without an SD card inserted, /var/log/syslog and dmesg gets spammed 
every four seconds with:

|[Thu Aug 26 06:03:54 2021] mmc_spi spi1.0: no support for card's volts 
[Thu Aug 26 06:03:54 2021] mmc0: error -22 whilst initialising SDIO card 
This patch prevents that. Tested on HiFive Unmatched with Ubuntu 21.04 
and v5.14.1 kernel. |


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
