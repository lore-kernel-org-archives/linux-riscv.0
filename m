Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88F7606A320
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjpp8mx9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.a=rsa-sha256 header.s=r1 header.b=LH+tj7Lb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hbC0sEjyA0KqL9vY/hGIbzo6ubXukVHlyI69VIX07cw=; b=rjpp8mx95t1ZT/pmW0dYxicWTP
	FQA6jXluMQn/ETIhDPyCnavCT9zrDlHCM84ETNABKCIq/jVAS+hPo6B5mGiaKioviRuc3N1408bwz
	S03tDeoQwWvnOkY5KlWnCUmZG4ZmKKVDHhgO1N38RwHcrVg1kW77YAYOOwI/IFQBfO3hOpLlyrnoX
	/P6v1nYDb8YnooZX7oxvp6aa5GTPHbU/4SvOivZbK3RoONtN2y+ngYjX3ML/Qc/iTPpTMsOINuBqX
	z2mAWdfSzd2ymZYT6QiAQrzjIk0H8ZPVo0uIFfRFuSBabwDP2zbIlYtCDzK7Uu2L/STnl/j1CAv+X
	IixhsXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiyU-0000000H4ar-1dDl;
	Sat, 21 Nov 2026 11:09:42 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUiyQ-0000000H4aG-2sEZ
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 11:09:41 +0000
Received: from mail-out.m-online.net (localhost [127.0.0.1])
	by mail-out.m-online.net (Postfix) with ESMTP id 4jWqGk3FJYz1sP1g;
	Sat, 21 Nov 2026 12:09:34 +0100 (CET)
DKIM-Signature: a=rsa-sha256; bh=nIWCIl4xLmtB84iRieZH0tm1YRmVF/7wcnmyIAkVNjc=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1795259374; v=1;
        b=LH+tj7LbDItWc7DNBhdW9+/bSdmoS4H6V/EtW4xY4l0PKcmd8pxZ8V/asx9PF/xW
         eT9VJW0BWZE+GwT3hceILSvmLgCDIgWa7fuAo3ER2tROmPgMt8ah9i3lUy8wl2UT
         yoEss4sik8tpMVUK9p4tMXxmKCESPcxRe8BsusCFQcqAbl1sAsoH7K1on+AcQyK6
         FbZrk8jCyjHkSDSHWLk5i1yGdCD09UytxOybmc5e3cTvSsHqn59tcrJwFg1lIfQ9
         nvjTP/gR85Fw1aUtlkP7IwEBDQa8V2XMdOO4PbiUb/v3obVxhDxcVR7h64dRgwc7
         LEd9cjPAJ4Z4dnEpRhBgcg==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4jWqGh1c3wz1sP22;
	Sat, 21 Nov 2026 12:09:32 +0100 (CET)
X-Auth-Info: IHaH2TR3WvIGRr5sxN7MbW9dpk6Rd4SEz0O6VTWDB3jm97DjI6gRwBmaT81pWHNE
X-Auth-Info: IHaH2TR3WvIGRr5sxN7MbW9dpk6Rd4SEz0O6VTWDB3jm97DjI6gRwBmaT81pWHNE
Received: from wiesel.intern (ppp-212-114-181-207.dynamic.mnet-online.de [212.114.181.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA id 4jWqGf3l8Tz1qqlT;
	Sat, 21 Nov 2026 12:09:30 +0100 (CET)
Received: from [IPV6:fdea:9b79:8984:1:7c3b:4612:a548:c3c8] (unknown [IPv6:fdea:9b79:8984:1:7c3b:4612:a548:c3c8])
	by wiesel.intern (Postfix) with ESMTP id E7C8879A0114;
	Sat, 21 Nov 2026 12:09:29 +0100 (CET)
Message-ID: <a1b47af8-72bf-4f3e-9ece-e2ceeb97a682@muenchen-mail.de>
Date: Sat, 21 Nov 2026 12:09:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: dts: thead: Enable bluetooth on
 BeagleV-Ahead
To: Drew Fustini <fustini@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
 <20261020132604.90708-3-thomas.gerner@muenchen-mail.de> <awDZBiX1VoSkO6F3@x1>
Content-Language: en-US
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
In-Reply-To: <awDZBiX1VoSkO6F3@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_030939_933861_1E3ADCC4 
X-CRM114-Status: GOOD (  20.82  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 21.11.26 um 00:34 schrieb Drew Fustini:
> On Tue, Oct 20, 2026 at 03:26:04PM +0200, Thomas Gerner wrote:
>> On the BeagleV-Ahead the bluetooth module of the Ampak AP6203BM is
>> identified by the btbcm driver as BCM4362A2. The module is connected by
>> UART4, several gpio pins and an I2S interface. The I2S is currently not
>> used as there is currently no driver.
>>
>> Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
>> ---
>> Changes in v2:
>> 	- use default pinctrl definition for bluetooth in and out pins
> Thanks for sending v2. Sorry for the delay in review.
>
>> 	
>>   .../boot/dts/thead/th1520-beaglev-ahead.dts   | 85 +++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
>> index e16484a47653..7161a9d4c61f 100644
>> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
>> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
>> @@ -76,6 +76,23 @@ led-5 {
>>   		};
>>   	};
>>   
>> +	reg_vbat_1v8: regulator-vbat-1v8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-boot-on;
>> +		regulator-max-microvolt = <1800000>;
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-name = "vbat-1v8";
>> +	};
>> +
>> +	reg_vbat_3v3: regulator-vbat-3v3 {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
> enable-active-high has no effect without a gpio.
>
>> +		regulator-boot-on;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-name = "vbat-3v3";
>> +	};
> Nothing can switch these two rails so regulator-always-on describes them
> better than regulator-boot-on.


I see. With the next version I will consider this. The regulator 
definitions are here only to
prevent the hci driver form printing a message about missing regulator. 
Once we have
the final regulators for the AON subsystem we should check this 
definitions and replace
them if appropriate.

>
>> +
>>   	hdmi-connector {
>>   		compatible = "hdmi-connector";
>>   		type = "d";
>> @@ -152,6 +169,28 @@ led-pins {
>>   };
>>   
>>   &padctrl0_apsys {
>> +	bluetooth_pins: bluetooth-0 {
>> +		in-pins {
>> +			bias-disable;
>> +			drive-strength = <1>;
>> +			function = "gpio";
>> +			input-enable;
>> +			input-schmitt-enable;
>> +			pins = "GPIO2_30";
>> +			slew-rate = <0>;
>> +		};
>> +
>> +		out-pins {
>> +			bias-disable;
>> +			drive-strength = <3>;
>> +			input-disable;
>> +			input-schmitt-disable;
>> +			pins = "SDIO1_DETN",	/* GPIO2_29 */
>> +			       "SDIO1_WPRTN";	/* GPIO2_28 */
>> +			slew-rate = <0>;
>> +		};
>> +	};
>> +
>>   	gmac0_pins: gmac0-0 {
>>   		tx-pins {
>>   			pins = "GMAC0_TX_CLK",
>> @@ -268,6 +307,30 @@ reg-on-pins {
>>   	};
>>   };
>>   
>> +&padctrl1_apsys {
>> +	uart4_pins: uart4-0 {
>> +		rx-pins {
>> +			bias-disable;
>> +			drive-strength = <1>;
>> +			function = "uart";
>> +			input-enable;
>> +			pins = "UART4_RXD", "UART4_CTSN";
>> +			input-schmitt-enable;
>> +			slew-rate = <0>;
>> +		};
>> +
>> +		tx-pins {
>> +			bias-disable;
>> +			drive-strength = <3>;
>> +			function = "uart";
>> +			input-disable;
>> +			pins = "UART4_TXD", "UART4_RTSN";
>> +			input-schmitt-disable;
>> +			slew-rate = <0>;
>> +		};
>> +	};
>> +};
>> +
>>   &sdio0 {
>>   	bus-width = <4>;
>>   	max-frequency = <198000000>;
>> @@ -314,3 +377,25 @@ &uart0 {
>>   	pinctrl-0 = <&uart0_pins>;
>>   	status = "okay";
>>   };
>> +
>> +&uart4 {
>> +	pinctrl-0 = <&uart4_pins>;
>> +	pinctrl-names = "default";
>> +	uart-has-rtscts;
>> +
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		compatible = "brcm,bcm4329-bt";
>> +		device-wakeup-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
>> +		interrupt-parent = <&gpio2>;
>> +		interrupts = <30 IRQ_TYPE_EDGE_RISING>;
>> +		interrupt-names = "host-wakeup";
>> +		max-speed = <921600>;
>> +		pinctrl-0 = <&bluetooth_pins>;
>> +		pinctrl-names = "default";
>> +		shutdown-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>; 	/* BT-REG-ON */
> This triggers checkpatch:
>
> WARNING: please, no space before tabs
> #230: FILE: arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts:397:
> +^I^Ishutdown-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>; ^I/* BT-REG-ON */$
>
>> +		vbat-supply = <&reg_vbat_3v3>;
>> +		vddio-supply = <&reg_vbat_1v8>;
>> +	};
>> +};
>> -- 
>> 2.53.0
>>
> Thanks,
> Drew


Best regards
Thomas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
