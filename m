Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F39C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 06:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7wnSQfAGBIWrAVAr9qSZU7DOnACnnnlN+4B4S5tRtc=; b=LrNHbw1CbEpzX0
	vL9gmPVNRiyVyOBIGeII5rht4pQkhcIrVa6PKwyyiTQ4vPonuVfoipQqpC/QHhEQeq4cgfDlithXy
	iyxNKYCL8PcCTOzAu5BPmKD0fRVR4gGkEQKtfIlm9VTnAbLiX8Kl1962i542b6YmQ4zVjmRXkFpvk
	V2TW9QIHFBpgblJf8fguGpzM7FiOoizGcGSS/y2LbWlY4hJyDKyR8HpZWZEL1XO1oPOap/VVdxcoF
	7ya3Wf15Trtae7cgk7fsbL68XMXOvX7P2lyDtUfBggsKxrHjlMjT0ycaA+LIc2wDooPpBVNXpRaES
	6WFoimwVhUd3BeEjODNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Gu6-00DvbV-BB; Wed, 30 Nov 2022 06:49:10 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Gu3-00Dvaw-Hb
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 06:49:09 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 6962432008C3;
	Wed, 30 Nov 2022 01:49:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 30 Nov 2022 01:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1669790940; x=
	1669877340; bh=Oo4m/M2CLmFBs936diTgoNkM47vJxV+hsa4z7Pi/W/c=; b=i
	UybVenTBMuICmg1qOTvvLhVZhFOCVQ2TUs07wvfeMI6oGBlIby4tTDTP2WehHFUq
	JuXJW3HKOX+xthigiaMlemR8XB4s+kw+U/8M354F7214xlZ/EwOYO7T/wp3rF5cV
	ostq0XKldLMxoF1pFJQRkR9rX/rGajiU5DtVdOqKgjRn4wLpUfeRS3jwnPzHJHql
	zok6S8GtW2rDEJAqn1q1Rji2/HVSbN/wzZ+IYgMiu6W/Sc1OPGnHV3Mfin+Rq9jA
	1cY6AwylGgipbF0XhfAxjum82IqFDAqqJBAazpPcR6s7pAlHZDkSPVO1/mxzBEAf
	PzH6M/GkQP7BRt9aBdlqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669790940; x=
	1669877340; bh=Oo4m/M2CLmFBs936diTgoNkM47vJxV+hsa4z7Pi/W/c=; b=W
	140O6eix5o9QGCjvzrQHyoM5YtS44aVc+YsF5ecHuZqgadvwyHJiiZd00p/NEMuw
	dMCEqKjGV5z9ra54AsBqsHTjfQ8jW1mkTJKj06WXMQsHQLlRhsUqQd0g+y/zd2fx
	7k5+jYaBmoYndpEVzWq6CrlDoAmKfxuewht9l/FelucM3wHt+6Fmedg+7rF71CIw
	mU0+W4m/x8+9yuMRG7chKUdk8/4D5tW3kf2RJYNnYDnCrfCg3qvbdGov5mBw3ar1
	xrzNVCPZ6TJujTYcUuCsLYYPSXJCTQ7oHWLLgcB+N0qA3GHAH1CliOzQKxVzTfL8
	QyDpIFS8bDSKlhCM8WbKw==
X-ME-Sender: <xms:2_yGYz0Y49q2bNvS5nkXckNWHbFLgDzTGWWRKbd-gvlkNS8gBa0hcA>
    <xme:2_yGYyE8qsDxm79tnHHpiJgqVlpAKjCU-fLs9ui8qF9fofJCXsA-lt0zeZUy_tGIg
    rAvDMjXkQuLA153jw>
X-ME-Received: <xmr:2_yGYz6YTf4tziAk4X2ZgRzInmxjOwq94ysEjs3vWVqAhS4hw6lDk3gLUyGNqCb859MAgTfrMEfvoZchab9PSFB8Lcd0R0sT7QwqMJ6gsSVDG8yXK0mOjtII3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtddvgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudfhffefhfffuddutedvffekteevieeugeefleelffeitddutdff
    udehgfdtfefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:2_yGY43y3F_JIzreruW5KaMjdYX6lCBtFKEAw0-f067mmFQXJj5nhw>
    <xmx:2_yGY2G4PW9MSLevbKpqlAOlAlCP15_qWMzLUU23c7FN2OPIqUE3Pg>
    <xmx:2_yGY59DQWmk2HPhM8j52r53VsjSu3g7Q7EGlXzBbfFZNbB-qMZTww>
    <xmx:3PyGYyH_b_OEbiRJP5xFF7ri_CaEbLmi19Chl0sOjTQDPTgy5yaciQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Nov 2022 01:48:58 -0500 (EST)
Message-ID: <d0344e62-b9ff-8465-9556-5562e195f4a3@sholland.org>
Date: Wed, 30 Nov 2022 00:48:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 3/9] riscv: add the Bouffalolab SoC family Kconfig
 option
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-4-jszhang@kernel.org>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20221127132448.4034-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_224908_099690_A57F5278 
X-CRM114-Status: GOOD (  14.20  )
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

On 11/27/22 07:24, Jisheng Zhang wrote:
> The Bouffalolab bl808 SoC contains three riscv CPUs, namely M0, D0 and
> LP. The D0 is 64bit RISC-V GC compatible, so can run linux.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig.socs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..90256f44ed4a 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -1,5 +1,11 @@
>  menu "SoC selection"
>  
> +config SOC_BOUFFALOLAB

The options in this file are getting renamed soon, so this should be
named ARCH_BOUFFALOLAB. See

https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/

Regards,
Samuel

> +	bool "Bouffalolab SoCs"
> +	select SIFIVE_PLIC
> +	help
> +	  This enables support for Bouffalolab SoC platforms.
> +
>  config SOC_MICROCHIP_POLARFIRE
>  	bool "Microchip PolarFire SoCs"
>  	select MCHP_CLK_MPFS


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
