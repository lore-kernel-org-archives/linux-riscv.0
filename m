Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21BFC79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 12:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oU5p/YfBpUjOgvFyV6JvO6f/aCje+GpWTLOHW6W2/s=; b=sYIAINwxxNTfXi
	+XbEuPy7oYaYEjoP9pjWaGmGvU0nBS/gbJ5/2UEKAHRCfyppgORrzEzdpPPZfb0vTcvUzwOwPnDRA
	e9yha4uXksMZGivBXEw7E2FZZNSyRs68UPSPH5wFkF4l8glgf+zMJzKRRPiOrbZcdDJg8VTCIXjxM
	koo7RIxRAzhJjLrhlF8GECjE1o+7QIxyLPWox6tdmICOVC+i4oqM/9iLXyMVVmWuGx6WmALbSfpN9
	3e8wHXPSaYToV4I4+Mdtn+o/M/4eoWQSaW1WMjtbscHyJO7RTVqEAXD2HgZ2xOFDdZiLCVpw3RprM
	9TahHSEwEh4a34SzydXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HTS-0000000BfiO-1bIF;
	Wed, 09 Sep 2026 12:32:22 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HTQ-0000000BfhS-0IiB
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 12:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788957118;
	bh=sjk67Ioebab+5NpGEhrLJAO6LV79F9ONQNj/H2RXh7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=jMPWBiIcB4w7JYdCn8dUPaSIn618AveLhhscGmPcNqbByQPxZ+YaLdGAhpHUB/0Dw
	 niF+uyy6uHqTqrCGb1KkKExiLUmlYY8ubiiTV9CUrDr5N+9KJdowDNiw/71n2pBigu
	 5CLd8NHh8/D6XXTqLnHPhzuwqLfqVfbfZgOH5MYI=
X-QQ-mid: zesmtpgz7t1788957111ta125882b
X-QQ-Originating-IP: E9f8bbQMzUxXirUNijXwNOEm6p/ZyvW5uLcJaAfZTxo=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Sep 2026 20:31:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8949304572229022244
EX-QQ-RecipientCnt: 20
Message-ID: <0B02CB706C22EF91+afa052e7-3ecd-455d-b176-b86d3e0a5116@linux.spacemit.com>
Date: Wed, 9 Sep 2026 20:31:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable ChipIdea USB controller
 support
To: Yixun Lan <dlan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Ze Huang <huang.ze@linux.dev>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-9-f07342ffa051@linux.spacemit.com>
 <20260908220703-GKD2346@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <20260908220703-GKD2346@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Nj5kRNzaiqTLQK0CQ2cDYsk7lCWrU6SKlPyOXBQG8iER1oNdhzwFOlwo
	cfCOr5SzQMqllB2BZU/svqc2xCy8K0sEvVCnOYtGOKuDqq834b9SuLu4Lcl9NAFp57VTvgA
	5rlEfBcihzA8j5zt/POSWuBPTiHZlGXbYE/ki6JX9vWS0sJdNrYMEC9/DdhK1FMUjRrvKIn
	daFEpdSs7SBCuTSkBka+qxp9i4prvYessqjd5MUXF+5TC4pBgFDLVr2pCrZee0emo/pcMac
	TfLir2ITi6TtIlK2nqsuWk4Yg2wKGy4W4xmESmykbelebTbE5LScOyX6KAi7RBExFACEoZz
	2TQyXBOsRXnE70rnlhPdZyiUPqqP37CS8KvC0DL0mKMXdV7ncEqIh7qyhlZml8KB+qGtQ7u
	JxC6t8QwkCXervI8faCuLv+k2jktoanDCj3gCvRFDs7whxozpT5TIi8g+KrTCAH3zP9fjAL
	d6ODw58bDQgQdWmOE0cG2bnRhGO9Cy+5y3W0GD0rkD5P1DBgID+pGDSk86jKLCXMxA3lCeP
	s7BkdJevukFD+UZ90Q0Bgju3pAt8Qr9PHE66/9Yyw5VfApXdSL2wSK1Ua9XX4geraYlKZ+v
	mM9AsUDftZFfeUCQzMGNrhZk9P3byI1cTaGCLpTPObQT8tB7khEKZJ4+OIMdkHLKU465NcS
	fzibwZG1XCqeHf+XJx2WAJDO3OOfD6xHIGpnKSTIxdwUy6emyKma/4y/dFCECgOshSMaAnn
	d8MjVrWerPVzIsrJD7FAw12dQxh7Gdr3Byrb0kuGobetw0xujgbVsp+Rxko8BFbmwm7zwM6
	ag06rzWOBayHeeM7+nf8aGtvxcNbH2LnVxGLV1hL+i4QrC2xKWxsHXdXZ/Q9975t/NWi2++
	HVk1MjLzvyafMb9+7KYh04txA1MxWUVUlYL9M9Xw8osuiy0PAl90pZe43wo9oRBHDeqgKdi
	php63nUKrym130QtZIbP7tzYmn3EIZSiPc0k5F1t3PxxE7+A7/rnBg1MRk5DgGxYzDgntuf
	L+vRMYi5yHhUlDmRJtQUmALpn6zNZoEKCCizsouUkEMIp15BgiNcrkipkZoFvgNEuUyCYVk
	NSHmrWVez8N52yDs25UjUBu7cAhOqm+QWF+Ff3z8N8OQu5c4awf2n7BPgYqw7bTx1IeG6xE
	7g3ovkjcj6/DNL4uhKUuuFUl7BOHw3Wu9Cg/
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_053220_649624_DDAEF39A 
X-CRM114-Status: GOOD (  12.86  )
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

On 9/9/2026 6:07 AM, Yixun Lan wrote:
> Hi Junzhong,
> 
> On 17:48 Tue 08 Sep     , Junzhong Pan wrote:
>> Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY to support
>> USB2.0 controllers on the SpacemiT K1 SoC.
>>
>> Tested-by: Ze Huang <huang.ze@linux.dev>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> ---
>>  arch/riscv/configs/defconfig | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 04ae305d5511..5b556488de66 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -222,6 +222,9 @@ CONFIG_USB_CDNS3_HOST=y
>>  CONFIG_USB_CDNS3_STARFIVE=m
>>  CONFIG_USB_MUSB_HDRC=m
>>  CONFIG_USB_MUSB_SUNXI=m
>> +CONFIG_USB_CHIPIDEA=y
>> +CONFIG_USB_CHIPIDEA_UDC=y
>> +CONFIG_USB_CHIPIDEA_HOST=y
> I know some prefer to enable as loadable module for non major drivers
> so, can you check if it works as module? and alter the config
> 

Okay, if it works, I will alter those to =m in v3. Thanks

>>  CONFIG_NOP_USB_XCEIV=m
>>  CONFIG_USB_GADGET=y
>>  CONFIG_USB_CONFIGFS=m
>> @@ -272,6 +275,7 @@ CONFIG_PWM=y
>>  CONFIG_PWM_PXA=m
>>  CONFIG_THEAD_C900_ACLINT_SSWI=y
>>  CONFIG_PHY_SUN4I_USB=m
>> +CONFIG_PHY_SPACEMIT_K1_USB2=y
>>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
>>  CONFIG_PHY_STARFIVE_JH7110_PCIE=m
>>  CONFIG_PHY_STARFIVE_JH7110_USB=m
>>
>> -- 
>> 2.34.1
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
