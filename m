Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CD6C5DF81
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 03:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KsfWMHFaCXk4rmgNVsU53EB/N3x+iIz+Bf5gSWuD1E=; b=MlbBtbKelYZDR6
	o1J4F5SDRdiQE08Tf1ZSDMPa7TmQhiIMlXoLIaAYKoJQU9js/milH51+uWh7gVgSU/4+/OszsJc9b
	i3P6r3EZPiZzJNVKO2N3eyRGXYyR73FHcr8j4557DZDIHxCfpi16TDKOCG6bEwvYxoUK56JTv4wM8
	8gsKYD4EzUpi0zNmCu5VkYs9CzPdxZe66UFEqlUtwVJfti+4C2EOKEe8Dh17re+BbRWCTlQ3eR2F6
	y6YAHZv6nb9NEO4HB7n+X0dcy1gN885rzo9aNjmgLfvDqw4eZwmEA2ENVYBL6JtDp8nagjQO4mZEN
	eYpxh1j1eaJ5NT0JItKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFw8-0000000CUot-2ISq;
	Fri, 21 Aug 2026 03:28:56 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFw5-0000000CUmg-3oQR;
	Fri, 21 Aug 2026 03:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787282910;
	bh=MqvDMYNRoQ9Kvbf05t/LQl0jO/ECi4yY7MVQ0wbLx6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=gyrV8u71pw7wClzmaAsML0U2GUs10wncYh0xJ4ybmFkXx4MiPw17lfoM2TBMTBaWQ
	 NNUD1C+IVBtD/whRrlrqXhJloEGuob6PnEMsTgn1/L4eQ4/yfSOOXCFLGQOH4hsjvr
	 IxVyiiRWEHMlEGrSeGk7kxe/ThbA7MTmEcjM5wCw=
X-QQ-mid: esmtpgz12t1787282903tf28c3db0
X-QQ-Originating-IP: NlXF3mMygcC+J74M1XWNyNNgFr5bOU6a3BbADdOj6j4=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 21 Aug 2026 11:28:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16746857706120519191
EX-QQ-RecipientCnt: 21
Message-ID: <A048E078785BB086+381938ba-e0ab-4764-a5c4-9d2434d0abe3@linux.spacemit.com>
Date: Fri, 21 Aug 2026 11:28:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Add SpacemiT K1 USB2.0 controllers support
To: Ze Huang <huang.ze@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <DKU91NS0JNRS.SLSXQO6JHRLM@linux.dev>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <DKU91NS0JNRS.SLSXQO6JHRLM@linux.dev>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MDErF8Q7k85n440dv14bzAy9yyaNt8kV2QcY4DevVACjFCN7EU1lX9Sg
	RSFMiePZ5iOZRq2rxJrXi7w85bwXsCpOeqn7Fekgjpf/3iHhU14Ve2CWnk5F79/uZ2xMFpt
	qKS7lNcl/2ouYZhOyp9/jFpvTIyyDtxEm3BzhxIxr6XmIbIzodPEA05h/MZJddmd4YCTLpT
	blFb8XtxNQ/iYjCq/x4ehM6izc4beFihbi2jd/wt8yaeJnml4wUhF0mHpaWNyVFYwDzBlMN
	3GJBp3zWZ2esQa01PKYAAs2J3drVRJGWh6ZENui6AAebIefBoUdB4+OtW0HTacSn2Jr00vt
	ld1HR2zE7SktUxnq4MI02jLY8xvTxDlaukmS7roRQEsZHLg8gqjudkAapeIKReziiq8gytu
	Co9ONMIeoi+DOtkobeE6brUyiI54vnavKsu64Q9lc48kyxmqhgYH+9jIDwz5snKdEesJw4M
	sB0TUjSiPPIY4efafzWANbRCUM3W0DAOGBDVHLMURYfd33jEAPKuWdTXzWXz/7T+NaslX2a
	p6zFk6dseDmpQRcbVoUCLZN9c68JMqYWC+kkM9/5kGjcGD9tMIvSii4GHgQ6R9MJHjeO7ik
	3FqLbNcimS2QCGVPFRjRlf+sURMoNzrhlqmIZj5xKiMXnsAvErltP08xo90qONPEZGRudyX
	n2hLQooON9nHWz0Bz0JM5nfRHWtXafjU5N8xJR1Pp48/hQt19EmPb7Sd4LBb6rtNXN/M3bq
	v5tJTtv4hi5ZsqjlN0mXcP0ZoErIx4Cklt+HAG1Nllis/BgXetKxcuLKY0LWkqU7j+VDduA
	65uw0MwRDM09ZP8xk39DREJaHKwOgxKSLqJKlBYT8iMdbR9xGT/e581QZRCW01UBQq5u2pI
	nXOWloN2uIZxIkt5iHqRtHxwIzlOnywafNTwXqJ9nn/8+i1CWYolg8+bWK6uq/V3br6M5hh
	h5PGyi2srUql2XxM2j/nCrdTaSk9eRvNzEletzEQDFcdyJx7ovGamWLU3nT67d6EgBPTWQa
	ViL9Iy0amwCTvG2z2FdI1NlWHEZGPrO222DZTH7xzbLXZdWoi5l7hxLiYPtbp3Hv3npn1c1
	mgWgRJJdIpc954nPSg07Wo=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_202854_629401_887161C3 
X-CRM114-Status: GOOD (  15.48  )
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

On 8/21/2026 10:00 AM, Ze Huang wrote:
> On Wed Aug 12, 2026 at 5:26 PM CST, Junzhong Pan wrote:
>> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
>> support, but the hardware has no internal OTG registers, the other is
>> Host only. These controllers are compatible with Chipidea USB2 driver
>> with some flags set and reset control support.
>>
>> This series is based on 7.2-rc1 and has been tested on Banana Pi F3
>> development board.
>>
>> A self-powered USB device/hub is needed to test the host function of the
>> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
>> cellular module e.g.) is needed to test the host only controller.
>>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> 
> Tested on OrangePi RV2.
> 
> To use USB2.0 Type-A port as host on this board, usb2_0 needs:
>   - dr_mode = "host"
>   - a vbus-supply regulator driving gpio126
> 
> Tested-by: Ze Huang <huang.ze@linux.dev>
> 

Thanks, then I'll add rv2 dts node in the next version. Can you
test again later ?

Thanks

>> ---
>> Junzhong Pan (6):
>>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>>       usb: chipidea: usb2: add optional reset support
>>       usb: chipidea: usb2: add SpacemiT K1 support
>>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>>       riscv: defconfig: enable ChipIdea USB controller support
>>
>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      |  1 +
>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
>>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
>>  arch/riscv/configs/defconfig                       |  4 +++
>>  drivers/usb/chipidea/ci_hdrc_usb2.c                | 16 +++++++++
>>  5 files changed, 77 insertions(+)
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58
>>
>> Best regards,
> 
> 
> 
Best regards

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
