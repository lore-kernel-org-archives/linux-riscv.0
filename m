Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599E7C79F81
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XlU49IOrtIsM79PqyL+OqF75bh3fSZiIHM7UZIY8vuU=; b=wAqHy/BhoENo0H
	WPPYTN2MIDLmQqCH+J2JDamRBDEKCt6vMwevtgSBR5JAgpzdp0K4ipaaq0N77TUWhSJXDxvodbgC5
	isAaVJ//gPnEhYZLm3eLbaApuMqZ7LOMNGGXxTmvOD5TH/ZLS/AQNVnuNo9U6pVVBLzGC0NKjCLGg
	d8nThsXCY9xDFTzxT2Gr/2tAJHq+RGw1j0r3r5Fk0CBg994GuBaDHHqIcD6IKejX40eTsIFH1VHCd
	/oa/HoHgUG7wIQlCBpOY8lsCNuWHWDYzI9NRHm771WlZLyJm8raoeTXGUI3vsyB5X5x07HF5QCURj
	1nvOJMF8m1FTlD0KrdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjMt-0000000BFBV-0hwz;
	Mon, 05 Jan 2026 12:07:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjMq-0000000BFB6-0Eqd
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 12:07:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55A77435C8;
	Mon,  5 Jan 2026 12:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19262C116D0;
	Mon,  5 Jan 2026 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767614843;
	bh=17Md7znlGCVCxY8lL065mnBwNPomhOzbveOzVffThaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tp94P2BbJc7iGJa8BkcmjTBirbAK1/bpyfzAExDd4kKi2qRuKMw/ya5Crl8BqkFxQ
	 oUL1LXruZ95N37yu76vv5AIfdTrXT8Grs+Jf1zLUeBco0guYAcpFEWcx+9w88yYp2I
	 Halyk/tYsNBa3PKc4+X3p/KCANhlzj+mdcdBb7rXsCX3oxvHi3OYwMcCtbNhlE7wNo
	 d6fe1BVywIV8xryhJJWmNWH/bs6y2Y4ENSnO25cxTQOxy+9IrAARqCtJ3Y4U/LP2Q0
	 XHeHpPhfhHedqBfJHTIqfeR8kO7ENwYL/Q8cSv5G5GKsYQXSyRNwg3Swh5HLpR0sl3
	 cBfPn6+T06PlA==
Message-ID: <d637ad9c-fa9d-4e8d-a02f-4b22dd351f9c@kernel.org>
Date: Mon, 5 Jan 2026 13:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: sophgo: enable hardware clock (RTC) on
 the Milk-V Pioneer
To: Michael Orlitzky <michael@orlitzky.com>, unicorn_wang@outlook.com,
 inochiama@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20260105120129.58895-1-michael@orlitzky.com>
 <20260105120129.58895-2-michael@orlitzky.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260105120129.58895-2-michael@orlitzky.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_040724_143150_68B1194E 
X-CRM114-Status: GOOD (  15.16  )
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

On 05/01/2026 13:01, Michael Orlitzky wrote:
> These boards have a working hardware clock if you put a CR-1220
> battery in them. Let's enable it:
> 
> 1. Enable the (already defined) i2c0 by overriding the default
>    status = "disabled" with "okay".

Do not describe the diff. This is obvious. Explain WHY you are doing all
this.

> 
> 2. Define the rtc on &i2c0. This is more or less the example from the
>    documentation (devicetree/bindings/rtc/rtc-ds1307.yaml), and it was
>    present in the same form in an earlier 6.1.x vendor kernel.
> 
> 3. Copy the pinctrl stuff from &i2c1 and update the PINMUX constants
>    with the IIC0 values from dt-bindings/pinctrl/pinctrl-sg2042.h.

Drop, irrelevant.

> 
> Afterwards, the new I2C and RTC can be enabled with,
> 
>   * CONFIG_I2C_DESIGNWARE_CORE=y
>   * CONFIG_I2C_DESIGNWARE_PLATFORM=y
>   * CONFIG_RTC_DRV_DS1307=y

Drop, irrelevant. You describe here hardware, not Linux kernel config.
> 

> The new I2C should appear under /sys/devices/platform/soc, and with
> any luck you'll have a clock the next time you boot:
> 
>   [  T367] rtc-ds1307 5-0068: registered as rtc0
>   [  T367] rtc-ds1307 5-0068: setting system clock to ...

Drop, obvious.

> 
> Signed-off-by: Michael Orlitzky <michael@orlitzky.com>
> ---
>  .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
