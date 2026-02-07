Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E8EE0ADC
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 12:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8NDhBhiRKI+fnfIDBmJHItBHRl/GoFdOsCkFYYskvs=; b=05A3EMSqP33sEP
	7GfZTAOjkZIlKl0ZYfSBx7AWCWhDM+HIgsCzCO8tduae3ewjHx/IJmNQgDKs7FoEc6A/ZBFMVtLLS
	Lqdb8el6aftMVucatCf5YD+h8jP6q+uAaxz6u4XzzeMVayDKZAHKmmp8c1ytmCmj6nGs//zyVLT+V
	isR/7UHsIOFkXXIP/9u1onzenebmL/Rws1CHKOAJgkpT9+FrQYAd4PoIm+p2nZMWchiYowswTbDl2
	xiUijS0qUEnCU+69TrJo/G9v4W3pS9Mm57AsZW/M4uuv+m+GWVTkbzUeA0ajy+ohISSasr2a1rM6M
	KN+ZDxoxGUSuHHdXpOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vohVv-0000000CR7U-1XOn;
	Sat, 07 Feb 2026 12:34:15 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vohVs-0000000CR1o-0EfL
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 12:34:13 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770467493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pB+X+PWw8QCoTpJZbKm2C6xwzgDKvSJVp3esmH7Th0k=;
	b=mtoRgVw7cigQNvXJg2nqObj8oCs3TD6FhNT63amvnjOLvgx+4q12SyyVDlccKHlbDG7bUQ
	lILhOMW8TyLwbC12aAaffkExQHErU8N/CIdwn1L3TWGOabxoZcT3TNL32nTSz3tL83zYtZ
	+NiyWiWSKOwMNId0UbDM7/XaAbmSwqU=
Date: Sat, 07 Feb 2026 20:30:46 +0800
Message-Id: <DG8QBWSJ79MP.2MVIHFRBX3WXX@linux.dev>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Chukun Pan"
 <amadeus@jmu.edu.cn>
Cc: "Yixun Lan" <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Ze
 Huang" <huang.ze@linux.dev>, "Rob Herring" <robh@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, <linux-riscv@lists.infradead.org>,
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support
 to K1 USB2 PHY
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
References: <20260206100009.873182-1-amadeus@jmu.edu.cn>
 <20260207-dancing-finch-of-chemistry-f98cf2@quoll>
In-Reply-To: <20260207-dancing-finch-of-chemistry-f98cf2@quoll>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_043412_385119_F10484E0 
X-CRM114-Status: GOOD (  18.55  )
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

On Sat Feb 7, 2026 at 6:48 PM CST, Krzysztof Kozlowski wrote:
> On Fri, Feb 06, 2026 at 06:00:08PM +0800, Chukun Pan wrote:
>> Add an optional phy-supply property to describe the regulator
>> supplying for USB VBUS.
>
> Why wasn't it there before? USB did not have VBUS?

Previously, the VBUS regulator was defined as regulator-always-on in
the device tree as a workaround.

>
> Explanation is so incomplete I suspect you are patching broken things,
> so as well this could be completely different hardware (e.g. there is no
> regulator for this block but e.g. connector).
>

usb ports under usb hub node can describe the topology well, but
still regulator always-on is necessary as no driver toggles it.

    usb3 {
     dr_mode = "host";
     #address-cells = <1>;
     #size-cells = <0>;
     status = "okay";

     hub_2_0: hub@1 {
      compatible = "usb2109,2817";
      reg = <0x1>;
      #address-cells = <1>;
      #size-cells = <0>;
      vdd-supply = <&usb3_vhub>;
      peer-hub = <&hub_3_0>;
      reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;

      port@1 {
       reg = <1>;
       vbus-supply = <&usb3_vbus>;
      };

      port@2 {
       reg = <2>;
       vbus-supply = <&usb3_vbus>;
      };

      ...

      hub_3_0: hub@2 {
        ...
      };
    };

Here is the diagram for the USB2, USB3 controller on K1 Jupiter board [1] (page 21)

    +-----------------------+
    |        K1 SoC         |
    |                       |
    |  +-----------------+  |   (USB 3.0)
    |  | USB3 Controller |--|---------------------------------->+--------------------------+
    |  +-----------------+  |                                   |        VL817 Hub         |
    |                       |                                   |                          |---> [USB3 Ports]
    |      HUB_PWREN        |                                   | +----------------------+ |     ^
    |       (GPIO)  --------|---------------------------------->| | Enable Chip Power    | |     |
    |                       |                                   | +----------------------+ |     |
    |                       |                                   +--------------------------+     |
    |      USB3_PWREN       |                                                                    |
    |       (GPIO)   -------|----------------------------------------------------------> [VBUS of USB3 Ports]
    |                       |
    |                       |
    |~~~~~~~~~~~~~~~~~~~~~~~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    |                       |
    |  +-----------------+  |   (USB 2.0)
    |  | USB2 Controller |--|---------------------------------->+--------------------------+
    |  +-----------------+  |                                   |      FE1_1S Hub          |---> [USB2 Ports]
    |                       |                                   +--------------------------+     ^
    |   USB_HOST_PWREN_H    |                                                                    |
    |       (GPIO)      ----|-----------------------------------------------------------> [VBUS of USB2 Ports]
    |                       |
    |                       |
    +-----------------------+

[1] https://github.com/milkv-jupiter/jupiter-files/blob/main/hardware/v1_0/jupiter-sch-v1_0.pdf

>
>> 
>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>> ---
>>  Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
>> index 43eaca90d88c..74a1cd5bcdbe 100644
>> --- a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
>> @@ -19,6 +19,10 @@ properties:
>>    clocks:
>>      maxItems: 1
>>  
>> +  phy-supply:
>> +    description:
>> +      Phandle to a regulator that provides power to VBUS.
>

"vbus-supply" should be more accurate.

> Drop redundant part. This cannot be anything else than phandle and
> regulator.
>
> "VBUS power supply" for example.
>

> But anyway, I don't have certainty that
> this is correct hardware representation. It's your task to provide that.
>
> Best regards,
> Krzysztof

I initially considered handling VBUS via the onboard_usb_dev driver, as
we discussed previously for the BananaPi-F3 board (which uses a VL817
Hub) [2]. I was waiting for Marco Felsch's patch series "onboard-dev USB
hub host managed vbus" to land [3].

[2] https://lore.kernel.org/linux-riscv/aWJAT3n_KcND8bOz@monica.localdomain/
[3] https://lore.kernel.org/all/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de/

I am not certain if managing VBUS in the PHY driver (e.g.,
phy-stm32-usbphyc.c and phy-rockchip-usb.c) is the standard method.
I would not insist on the "onboard_usb_dev managed vbus" if this patch
(PHY managed) is considered proper way.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
