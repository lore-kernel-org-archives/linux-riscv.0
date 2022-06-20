Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC85FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 00:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+hXSDU8+4A6RBk9irEJazILVO1vtygNXWCoT6TrJwg=; b=zw1bmBEx+Zg60Q
	NZw7ZymbA4k/5GFUWoYf2HlcTBNj8zg5EdKKh61LM3OoibmdQAX5g+FwiTt97kwUqgFyUve3vE7Wd
	lSL4h+tSQmSLA7W+yqVFLf74gHn9U9x5xAl0KhMXQLtBaaxes7m3xwU51KP0vc2kY/ZPMzhUXPOsU
	XBtgVScm0XDehOHNPjrPcdzLx6u2epIIE/kdD6Pgph2d/KmubvHxX1y8f1cuc+UIiNAW1okv5hAgP
	KCPHVyJIgmoXpYKaRSBq0vQDeg8sR3RfPkFriXlkIJ/ooLByG01uiIcJTGpWVP7wK22e3pmYIndO+
	Z4v8nsDO3tLgNoL5J96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o35El-00FZ8E-KQ; Mon, 20 Jun 2022 00:25:51 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o35Ej-00FZ7v-7J
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 00:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655684748; x=1687220748;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H0ulQrMBtA6pu622Zq7Ff/HeEgzOhbo0ZUSX4iWBZhA=;
  b=bfIYx02+58JUqR+Lv5qP1Y3SDZ+1DbCdErqHT98/09I2vVdvSpoSiK4b
   2sfUk/yqYm7E0o0ku+DKnXa3mVK7e8oqE6/DqjsLFClMw8HqAG02U4j9O
   6SPgXeSeKAKwEW4dzzaNU1sk7n/twWt0nDUDG5qLaRp2mkOvUq2e65WC9
   ge1IhU7b2z9Lri5B3eNfKcLe40jOgwCuR33FthGDRvdbhapAXh7uOC6bg
   G3mqTlXfvXWIuqxIJsYUkn2bbkFyKgvifBhgafttZnremlKAWXN6MUCC3
   3bGY05qG7LMveBnXF7xferzSTMOuC7G+ug98MXYvv8Nl7sC39EyRge+9L
   A==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; 
   d="scan'208";a="202279308"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 08:25:47 +0800
IronPort-SDR: yIYiCHM8NXiUVoYgE3nvTcxY56C9gD1m3M09KfdWKsLPvnIcmOBvKaIOro+GRPzpI+wU8M0R2I
 D37CPE3IJJrB5mGZxavwxwEhaIV0cls4oK18IWwrMVdqW2HijSMBGywJzmY7MZ9mvJdZ2SsMk2
 n0pzeZySsYge4odU1Dm0hXMDU6Euo4QXaJp184Yl0bMsE0bP2mFGJ/yI+7+lxOqvrng8ZJTtQh
 wC3/eDy6C8PeRZnzo6LTkYXcrBkup/OJTy+S2kG+51DJKb6nxAX+cTgbMJ6maVsOkNTJKUui3W
 /GEKQIEqD/u0qeaqRruOnG46
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2022 16:48:19 -0700
IronPort-SDR: Q8HLFwkWQGehk0K4x0grZAloP6Ncis+W8bx8DQAEk2/IlWjivk45di5bmG7K2sK1oLaLXnNA4p
 TYHJmgt4j0AMrR0hAHLFUKNlkd+9H/9ZF9KLFd9+OENutqO9LP6+RnHtYc7IIGG2H6T0ZyvlLT
 O7ckneSHE2WlYdS8vO48vmbSs1AeSFii87noGNIzipq2bgxzZjpf7jGmZ41mA+ex1h0Q8luzFt
 Or44qt/FOwJtADX/qLt2F4G/XL2bne+tOo+PL4aTmlvqsx1NXWZQjUzPqgaXzRp/8FmbgIEoBG
 NgU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2022 17:25:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LR9RH2Kx5z1SVp3
	for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 17:25:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1655684746; x=1658276747; bh=H0ulQrMBtA6pu622Zq7Ff/HeEgzOhbo0ZUS
	X4iWBZhA=; b=C9w0xWLFB/KaDMQ+IzY1oZGaVKgyVSWgQTN/9sJJGaofpjPKWWt
	ZKKgIMwWS1Dy3N+AKNLls5E2/TsxAp6rP+S9l0Ik2SK7XIV5qtlSHKwhGAwp4LxJ
	6gePz+4huJUkrzHySdcijhxdigID+rEmfTDa4Wt/eP1LPIzIGKKw5KxzF3Dtmtap
	p5Va13Ox1XAtZ0OpzHoWucY1cenLs5OjDloywiS4JT1zdmVBZAj8Mo2U+pX+WsHX
	Xq2w2dDe0rAcZyAfGZlDDozsM67SwB5DYyhQRX3WWnevylp14JZ8tNudXLaciW4o
	qUyYE7ltn31FuS+79D85xj771kaXmkpnCiQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Fg3GX1Whu1ni for <linux-riscv@lists.infradead.org>;
	Sun, 19 Jun 2022 17:25:46 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LR9R75cZsz1Rvlc;
	Sun, 19 Jun 2022 17:25:39 -0700 (PDT)
Message-ID: <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
Date: Mon, 20 Jun 2022 09:25:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Content-Language: en-US
To: Conor.Dooley@microchip.com, mail@conchuod.ie, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 thierry.reding@gmail.com, sam@ravnborg.org, Eugeniy.Paltsev@synopsys.com,
 vkoul@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 fancer.lancer@gmail.com, daniel.lezcano@linaro.org, palmer@dabbelt.com,
 palmer@rivosinc.com
Cc: tglx@linutronix.de, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 masahiroy@kernel.org, geert@linux-m68k.org, niklas.cassel@wdc.com,
 dillon.minfei@gmail.com, jee.heng.sia@intel.com, joabreu@synopsys.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_172549_446384_AA36AC8A 
X-CRM114-Status: GOOD (  18.09  )
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

On 6/20/22 08:54, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 00:38, Damien Le Moal wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 6/18/22 21:30, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> The k210 memory node has a compatible string that does not match with
>>> any driver or dt-binding & has several non standard properties.
>>> Replace the reg names with a comment and delete the rest.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> ---
>>>  arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>>>  1 file changed, 6 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> index 44d338514761..287ea6eebe47 100644
>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>>>
>>>       sram: memory@80000000 {
>>>               device_type = "memory";
>>> -             compatible = "canaan,k210-sram";
>>>               reg = <0x80000000 0x400000>,
>>>                     <0x80400000 0x200000>,
>>>                     <0x80600000 0x200000>;
>>> -             reg-names = "sram0", "sram1", "aisram";
>>> -             clocks = <&sysclk K210_CLK_SRAM0>,
>>> -                      <&sysclk K210_CLK_SRAM1>,
>>> -                      <&sysclk K210_CLK_AI>;
>>> -             clock-names = "sram0", "sram1", "aisram";
>>>       };
>>
>> These are used by u-boot to setup the memory clocks and initialize the
>> aisram. Sure the kernel actually does not use this, but to be in sync with
>> u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
>> kernel work fine with both u-boot internal DT and the kernel DT.
> 
> Right, but unfortunately that desire alone doesn't do anything about
> the dtbs_check complaints.
> 
> I guess the alternative approach of actually documenting the compatible
> would be more palatable?

Yes, I think so. That would allow keeping the fields without the DTB build
warnings.

> 
> Thanks,
> Conor.
> 
> 
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
