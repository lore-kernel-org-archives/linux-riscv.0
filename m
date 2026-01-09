Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64B2D232C5
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 05:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/ylVdLhzYA6hjI2248HNx0JOORdDZWVip2H43o8mPg=; b=1ELCuf6ey3Bx/u
	fnV9grDz5oYFPeNrA1oDrCrwQxu4qBtBb+Sor6lza012pIO5RJhkAoRXBlJPhhYDqGHhGGgWNwoFA
	Q8B/O+5ndoU7TFTbZ60ZN6dbKp5ySVUuFwXRtTWB7c/CDElp5OzB9VMHeitS+PjDb7RqwNR6blVs1
	V9f8ymExDxYJFtD8Xxktpo2P/y9Z+BmrqV+jWs99kb3+tf1OdChS0j6O6sEgGzM/nu8TsWCig8Plo
	yqu3FenzrKluweSx2xhTMxe4JnLdEPSd45vIaCf/h6MczZiS8S7a8rX6t59Rrl5BmZWeGT+PXJfeL
	4cYezDkMmw1BFC+dE69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4wc-00000001PqX-3hHt;
	Fri, 09 Jan 2026 05:21:54 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve4wa-00000001Ppv-2OtK
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 05:21:53 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7c75178c05fso1557498a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 21:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767936110; x=1768540910; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2a7yb61gjMTGmEOfZ9bR3veEdxmzKhIWW1FkPKIznT4=;
        b=U7wz/reXXYFP4jmuu7I6wss9oTJp06ZRGQ7JhL3jiukyNsjaAmu2Ub8zgshnluOhle
         57Xx6Z+HCFGl22/FKeBOxdf9JCPgIvQGPQNNwV6i6qPpVR163ToAXAW6HhkGQpaZWhVm
         ei5vFgD3MWofuN/ogDWstKQWrbBluv82W/+8hsRR8qwGFE2jHpOHDao3EQEIdYVB8FFU
         utusUt8+XzDAvmEb0nGUF/Mu82kjLnEqrKThlLqYv0c+mdeXtjyyjj/ZvwSYDDmuyleb
         tBKrMjaWmwHwWXj9jNMq14hrMK5IyO4WOREkxjEAzlNA9fxxNu/vCOap4GfN2Em8Hmis
         Tj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767936110; x=1768540910;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2a7yb61gjMTGmEOfZ9bR3veEdxmzKhIWW1FkPKIznT4=;
        b=Jil+Zt9vu5J60DM4kawUg7R25F6XicKtKdsWiVfL9o5PBYfxybrFI3nDb9epKCdIvt
         8/3QudmIMCzEeRxgcf3XQsIirBFJ71HqwPN6cU1dpya0HbqNh3uC5x+FORlbxQb7hlIl
         DQgYmF1DlSRwQmjOIjP6RBN4+xIWp2PDnUcg0vOZqaVtMmLfMpGghEqqsawHtZ+kA5Ae
         x4wIzjB0vAWqijookrkNDgbQMfyT5GUM68uWo8PLguPYOrNta96fFCTiroc0Qh2qZ7XB
         bGoaNH5eicNVLaGEobUsFdsXQqKD8TNS+H+ldvi7IFrUwW4NtZaQKogdGA4PBi9S+9sE
         P9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMuyjbvSozuNjiZkbKrmn09+ntViABtwC8gZHSr+oKulNYhtaIyZA/fCyICDwZG7TLgZVr1DUlNyswRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4b2XCDlupA+7k3cQf1GCzCl3zySmJdCn7xFBN4MQYN/ljnEST
	Gvld6R0/UvlojTgVamS59Vmls/3PCwwrYiBkoCrHErbJCVDxBPY9JN+CFk+wOjUPHTNE7TYDTt1
	eWunO
X-Gm-Gg: AY/fxX4IeiIKp1fPoclOzCt0m3hbeHjU/A/zPlfze+te9Jt4rG2rh7Ic0rNzGK60dTY
	KoDEAlomA1qT7WrdNwi/xKSeyP3o3gV/7QN80x2bTYDRkWvS5rHX6CHGZ02JLNDqEhEqjgF2SS5
	+1/6ttw9FBc8kldmCvnQhlsaHKFEh7zli1Kks/rwSiLax1i9jy7iWORrh+N6gIgOb9PsE42OodS
	phfrRWFOLZMpzHR+zACPUFwMHAzu3f86j/nB6Or635JC9iRFm1VXZZNATgPYVlYnVsvubqkqn7F
	0KB+rauTULYAoIyH472k9GbTWaxK3m7Fe81YJpHKIwn04dTvL1RiR4gTX/SPOw1VlmWj/K0EhBT
	IE/zadmXd5nWqYroQrbA+oJ1dA5hUs5KhnQsUSUpPg/0wfQ8yVsVkuwA9Qvs1QxE3y1fNU5aq2J
	RM82Fp6s/tz39hYW4hw1OaCPPdc2g=
X-Google-Smtp-Source: AGHT+IGR9G9QsQo8PdDgYo3rev7ih0hABMziC59pD3OHlqcWicc9e+z0NWSuSaiPEPFAI2FDHSqogA==
X-Received: by 2002:a05:6830:230c:b0:7c7:1c77:f107 with SMTP id 46e09a7af769-7ce50c0b0d5mr5519693a34.34.1767936110408;
        Thu, 08 Jan 2026 21:21:50 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.86])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm7079938a34.23.2026.01.08.21.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 21:21:49 -0800 (PST)
Message-ID: <5c54077c-f9fd-40c9-84eb-54139db8aaa6@sifive.com>
Date: Thu, 8 Jan 2026 23:21:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
To: Ze Huang <huang.ze@linux.dev>, Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
 <20260107-k1-usb3dts-v2-v2-3-e659b0f8fe1a@linux.dev>
 <20260108012157-GYA2355@gentoo.org> <20260108113605-GYA4052@gentoo.org>
 <aWB-6UkudFit3ZBX@monica.localdomain>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <aWB-6UkudFit3ZBX@monica.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_212152_720940_A2A01B78 
X-CRM114-Status: GOOD (  26.06  )
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

Hi Ze,

On 2026-01-08 10:07 PM, Ze Huang wrote:
> On Thu, Jan 08, 2026 at 07:36:05PM +0800, Yixun Lan wrote:
>> Hi Ze,
>>
>> I've done a quick check of the "regulator-always-on" issue, 
>> it's ok to drop the one from hub, but not the vbus one..
>>
> 
> Thanks for your double check
> 
>> On 09:21 Thu 08 Jan     , Yixun Lan wrote:
>>> Hi Ze,
>>>
>>>   thanks for your patch, I have few comments, see below..
>>>
>>> On 20:05 Wed 07 Jan     , Ze Huang wrote:
>>>> Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
>>>> Banana Pi F3 board.
>>>>
>>>> The board utilizes a VLI VL817 hub, which requires two separate power
>>>> supplies: one VBUS and one for hub itself. Add two GPIO-controlled
>>>> fixed-regulators to manage this.
>>>>
>>>> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
>>>> Signed-off-by: Ze Huang <huang.ze@linux.dev>
>>>> ---
>>>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
>>>>  1 file changed, 48 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>>>> index 3f10efd925dc..013df91c6a4c 100644
>>>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>>>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>>>> @@ -59,6 +59,26 @@ reg_vcc_4v: vcc-4v {
>>>>  		regulator-always-on;
>>>>  		vin-supply = <&reg_dc_in>;
>>>>  	};
>>>> +
>>>> +	usb3_vbus: regulator-vbus-5v {
>>> I've checked the schematics, the name is 5V_VBUS there, so for the consistency
>>> with previous naming convention, let's change to:
>>> 	usb3_vbus_5v: usb3-vbus-5v 
>>>
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "USB30_VBUS";
>>>> +		regulator-min-microvolt = <5000000>;
>>>> +		regulator-max-microvolt = <5000000>;
>>> ..
>>>> +		regulator-always-on;
>>> do you think the "always-on" property really necessary? it indicate the
>>> power regulator is critical, and should never been disabled even during
>>> suspend/resume state, for the case of USB, I think it should be totally
>>> fine to poweroff once the device is not used(suspended) or even disabled
>>>
>>> besides, the regulator is designed with a gpio enabling/disabling control
>>> which means it can be powered to on/off state?
>>>
> 
> 
>> not ok to drop, see comment below at &usb_dwc3 
> 
>>
>>>> +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
>>>> +		enable-active-high;
>>>> +	};
>>>> +
>>>> +	usb3_vhub: regulator-vhub-5v {
>>> why use vhub, but not hub? where does this name come from?
>>>
>>> and for same reason, the name in schematics is VCC5V0_HUB, so how about
>>> change it to:
>>> 	usb3_hub_5v: usb3-hub-5v 
>>>
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "USB30_VHUB";
>>>                                     ~~~need to fix too, if above is valid
>>>> +		regulator-min-microvolt = <5000000>;
>>>> +		regulator-max-microvolt = <5000000>;
>>> ..
>>>> +		regulator-always-on;
>>> ditto
> 
>> ok to drop, as it's already handled at drivers/usb/misc/onboard_usb_dev.c
>> which will explicitly request the regulator and enable it
> 
>>
>>>> +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
>>>> +		enable-active-high;
>>>> +	};
>>>>  };
>>>>  
>>>>  &combo_phy {
>>>> @@ -67,6 +87,34 @@ &combo_phy {
>>>>  	status = "okay";
>>>>  };
>>>>  
>>> ..
>>>> +&usbphy2 {
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&usb_dwc3 {
>>>> +	dr_mode = "host";
>>>> +	vbus-supply = <&usb3_vbus>;
>> due to drivers/usb/dwc3/dwc3-generic-plat.c has no handler to request regulator
>> there will be problem if "regulator-always-on" property is removed..
> 
> On the BananaPi-F3 and to Jupiter, the VL817 hub setup uses two distinct controls:
> 
> GPIO97  controls the physical VBUS supply.
> GPIO123 controls the VCC5V0_HUB supply for the hub logic.
> 
> (Note: This differs from the Orange Pi RV2, where only GPIO123 is used to
> control the VBUS supply).
> 
> dwc3-generic-plat can not currently handle the regulator request explicitly,
> keeping "regulator-always-on" forces the VBUS to remain active even when
> suspended, which consumes unnecessary power.
> 
> I prefer to drop regulator-always-on in the DTS to accurately describe the
> hardware capability, and let the driver manage the VBUS state. This ensures
> better power management.
> 
> If anyone have other ideas, please let me know.

If a USB device requires board-level resources to function, then the USB device
itself (not the controller) needs a DT node that references these resources.
This is the purpose of the usb-device.yaml binding. For the VL817 hub, there is
a specific binding that links the highspeed and superspeed hubs together. See
Documentation/devicetree/bindings/usb/vialab,vl817.yaml. These nodes are matched
with the Linux usb-onboard-hub driver.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
