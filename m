Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5189ACD37AC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGwo/YOfZQxtF30BDoHRjY4GiSf2U8yqJnH4FfMSxcI=; b=UY+CUFfzmaf1SC8H+toKaW9n3M
	zMznGJsHgRDLke5FAo3++t09lUYqnIN4QUyNG4mogbKsnC23OfxEV+zIWBd50SLiVcSKiNpQ7DgCt
	Tzw2rpQ0JXtbxLDpbVz0zIPwis891nPyHhNWRUg9b7spiaPdUqHxNyT7yFrw+IdOjkVzy5YXnKY1W
	tEHqmkx2Fn3AKNQob1DNtvAYZBMcHFQNwupTDTvUr2pbfkI2JyxrSOnKaLhO0GTe8jsj4me1oafV7
	3RCu6jr0F9jrl8cLxlgVzhGkdJClgJYTfaaaPCdJ7Ljj7dd5ed1ttUp+DU6Sge1xVJtmGSfx1Lxlb
	B0SRE3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNabc-00000006IFD-0uTn;
	Thu, 14 May 2026 18:16:20 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNabY-00000006IED-3I3G
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 18:16:19 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gGdn50HHwz1r9v0;
	Thu, 14 May 2026 20:16:09 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=yuIlx8fKUMSP8DjiSMG+3fouirFk9hyst3xiVZ6i69s=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1778782569; v=1;
        b=Q1TJVFuIbLB5vbal61hzmnR6Lm78mGCXNPaVYan9SmqfJ4gdkBt4OdtA2AsHG8X8
         oQW+dsiH2kctPQ8mZehjrb/esTcB+Dos4w8RSOoAZIAJXJqxvgXBgPM8US9YMdmn
         d1wGFG8xdTs3mitl7rksEVpq2iOdQDx/NgT54gYdcW0PuUYFCDl8/AaATX1FH85a
         LdsA5aeBJWcB7wDu0ceUCzj2DdzDJTbguLpek4E4oYUytMm/kIbHpsqA7D0HrahH
         Zjxi/Phz7+iPGd9hdS9cka1drhRZHOC873TrWqS1Mizu3k39E+69DwpgwffwPDb4
         smXM7xNLZipHYWrz4vKz8A==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gGdn24ZsQz1r9v8;
	Thu, 14 May 2026 20:16:06 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gGdn22zmkz1qqlR;
	Thu, 14 May 2026 20:16:06 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id Li8SPNrNQsAc; Thu, 14 May 2026 20:16:05 +0200 (CEST)
X-Auth-Info: vn20Z3webF0HJbVboEQ5bf66aciJ5niILSARlrBhKipUC4RAgTEwNae/f17KHYnC
Received: from wiesel.intern (aftr-62-216-206-65.dynamic.mnet-online.de [62.216.206.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 14 May 2026 20:16:05 +0200 (CEST)
Received: from [IPV6:fdea:9b79:8984:1:c250:c287:2f42:db51] (unknown [IPv6:fdea:9b79:8984:1:c250:c287:2f42:db51])
	by wiesel.intern (Postfix) with ESMTP id 9D63879A03CF;
	Thu, 14 May 2026 20:16:04 +0200 (CEST)
Message-ID: <5750784a-b00a-4dcc-a3b8-4540ef79b6e4@muenchen-mail.de>
Date: Thu, 14 May 2026 20:16:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Enable wifi on the BeagleV-Ahead
To: Krzysztof Kozlowski <krzk@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
 <20260514144836.50101-1-thomas.gerner@muenchen-mail.de>
 <f564b6ae-31b6-4f51-9351-dfb27ef0298e@kernel.org>
Content-Language: de-DE
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
In-Reply-To: <f564b6ae-31b6-4f51-9351-dfb27ef0298e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_111617_993046_FAB32DE1 
X-CRM114-Status: GOOD (  22.21  )
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

Am 14.05.26 um 16:55 schrieb Krzysztof Kozlowski:
> On 14/05/2026 16:47, Thomas Gerner wrote:
>> The BeagleV-Ahead board uses an AP6203BM WiFi chip from AMPAK Technology
>> Inc. connected to SDIO1. The chip is compatible to the broadcom wireless
>> driver.
>>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

I read some more docs and will hopefully make things right with my next 
patch version. And I start a new thread with every new version and the 
recommended subject.

>> The AP6203BM is a dual-band 2.4GHz/5GHz Wi-Fi 4 (802.11a/b/g/n) and
>> Bluetooth 5.4 module. Bluetooth is not enabled by this patch.
>>
>> Change in v3:
> This goes to changelog part, so after ---
Okay.
>> - consider further issues found by sashiko AI review
>>
>> Change in v2:
>> - consider issues found by sashiko AI review
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830
Okay, I start new threads with new versions.
>> Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
>> ---
>>   .../boot/dts/thead/th1520-beaglev-ahead.dts   | 49 +++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
>> index 91f3f9b987bc..f13a2d1deefa 100644
>> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
>> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
>> @@ -86,6 +86,11 @@ hdmi_con_in: endpoint {
>>   			};
>>   		};
>>   	};
>> +
>> +	brcmf_pwrseq: brcmf-pwrseq {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
>
> pwrseq?

Other device trees with wifi connected to mmc controller use wifi-pwrseq 
as node name. Wifi is one of the generic names. I use this node name in 
the next patch version.

>> +		compatible = "mmc-pwrseq-simple";
>> +		reset-gpios = <&gpio2 31 GPIO_ACTIVE_LOW>;	/* WL-REG-ON */
>> +	};
>>   };
>>   
>>   &osc {
>> @@ -239,6 +244,28 @@ rx-pins {
>>   			slew-rate = <0>;
>>   		};
>>   	};
>> +
>> +	wifi_pins: wifi-0 {
>> +		host-wake-pins {
>> +			pins = "GPIO2_25";
>> +			function = "gpio";
>> +			bias-disable;
>> +			drive-strength = <1>;
>> +			input-enable;
>> +			input-schmitt-disable;
>> +			slew-rate = <0>;
>> +		};
>> +
>> +		reg-on-pins {
>> +			pins = "GPIO2_31";
>> +			function = "gpio";
>> +			bias-disable;
>> +			drive-strength = <3>;
>> +			input-disable;
>> +			input-schmitt-disable;
>> +			slew-rate = <0>;
>> +		};
>> +	};
>>   };
>>   
>>   &sdio0 {
>> @@ -247,6 +274,28 @@ &sdio0 {
>>   	status = "okay";
>>   };
>>   
>> +&sdio1 {
>> +	bus-width = <4>;
>> +	max-frequency = <198000000>;
>> +	status = "okay";
> Please follow DTS coding style in way of organizing properties.
My next patch will contain the properies order according to DTS coding 
style.
>
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	non-removable;
>> +	keep-power-in-suspend;


Best regards
Thomas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
