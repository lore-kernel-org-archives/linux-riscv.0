Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1BDCA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbGzXA3oXyMNbNdI2NIerYBaWeHL6nkZI3R224vYAw8=; b=v4fYywi7j11lAH
	++/MbLpGcshbd1fPRfeGNBY4QUbHwOF/cMcmYfeS4VTeSO2fLufBxI/V87yhfxMPEORA5ks5nVf4Y
	NxUP9zBrlU0RaXZaXxiC/vOTMRH3uedrqqJKXQBbNPLywB0YSlnQBK0hi5xDCUCv9RCzsQaaLPtgu
	dkFCHNoiqNLdZBzTTyLTtB0vR1mUxx1sC5okLBvhvYq1tFvDniwe7yart5aFYUiGSabDvFbbZFT8N
	et1WWd7L2tFHm/L/M1o7KgDUvcE5YkA6cmyGac7WQUoKqyksfWLEiGk6RIqC/ZERAjjmcBs1DXdqx
	umYYWYFwO4H1f2Fqu3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5BP-00000005kcb-3vhB;
	Fri, 09 Oct 2026 07:38:23 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF5BM-00000005kah-1Yqw
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 07:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531462;
	bh=8w94qaIyqvoZXJSMhlUqDunjyb69j/+6YnXQ3qEKAAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=CNxHG6Iy/ztfqEnjUP0Py6XVrNaqo41r2bLCWzNkV7Agv8cphAODL0RcHqdEtuGgH
	 8aqArXhAo9eh153JrQGfK3SI7nEqGBC4X3AvqLuU9EW9jikc96puqlucEWyQXanztN
	 yfiIXm+YUql6ZVkZv3dRWt28RqwZjF8EovW3/a4g=
X-QQ-mid: esmtpgz15t1791531454t309d85ef
X-QQ-Originating-IP: 9dFMJrss78zrC/tVy1Ltv1Qmy7e70zHXK1/kjK97Xt0=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:37:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4560660349085074679
EX-QQ-RecipientCnt: 22
Message-ID: <7686F065FEA15D6A+f2c02b39-f7e8-4456-b41e-7fe14df4ab92@linux.spacemit.com>
Date: Fri, 9 Oct 2026 15:37:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Add SpacemiT K1 USB2.0 controllers support
To: Krzysztof Kozlowski <krzk@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>, Ze Huang <huang.ze@linux.dev>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
 <20260928230310-GKB2079@kernel.org>
 <b6a552a8-7710-4472-aeaa-96d50856f896@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <b6a552a8-7710-4472-aeaa-96d50856f896@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NKzbPdp5ylDyzol8P0ZIcB4liY4MlHSGJbAyJBuZiOuGiNltgNGG9PSE
	Oa4PiLgIia+Kpdu+T/7VxAoWaTbtSmAnAPgJZTRlWMa5qKmK9fxUPge+fGqCEV5CZakvFla
	qvXLRWDS+XIeKQ1I1kVylJRQDEThGUuF91rxbPF8hWEeJwkdKnZtxBtAvDBPHjObMKz+NlQ
	RFO9qfijB6Jt98p1qBtiV7CUnBQDs+bQNNHdfvnaMzIxObgzkGC50xgCiFVynlQM/ePXh9J
	w+l7Cfdbwkkgo4klxvIN8lyGsDwbw7mMddOtZqaR0/i4IfsWFjL1S2V2n1crZoPe6HXd8pQ
	BX9Tu1yltjQiIkqrlA/YptFtlg5j2VatNrn92NwhjTJCOKbpYIDreGSL5dY4JM5VOf4ofFw
	Hpy1UJHR1Vpms81GGZOiV0oUCFZqXBa07BjkjwZmxAjkAXsOuEkH6oIGuJNYW2vhCC9VaoN
	698Hd8rOxzDSBYRJpZfRl2Zi5dNSs7xaoCEmJZmJeZSzk+DMdUNPCMdsStMvX1H30KMel41
	s6ITmcLg+a08mSdn27spsfviRdcje430li0Jf9qhsltTxIqydJCF3kUQ03PLVzgXXYrhupq
	wiY9Xqknk1pnw0eUBwqn01cj+KH8+MXRorxx5gepHKtI01OyJYuIlGrVX6ZuqZoX/dajsIh
	2tlyJ2PP2fhrquRlxzpquL7o8k3cdatRi99wGf+LnbMVOZYfiX6l/qTTtH87R/vxPYyN0ni
	95FgvmW4OaJHdz/5ONaUVGlqnZa42GMS7DFnNB/ArhOrdhnuPKHxrzYxLmGQ0MQ29SeIGD3
	TtJvO+Nu6UjNbFnDIW+QRtNxAhKeh+aZ9hXJoEmT4WaZp+z7knCU3xm+SuAoqb0l4gMwKcq
	yI/vLncBkUI+PpBfQn9Jv8l/Y+QybC+7BX1cHe1CpQvnSLPC02rSkmBAK/Q7qRvKeQAYvIO
	giov2O/qpLes0Zl+AzEW3stC8vjiADmonzZ6Jg3Z4+IoEw8pjj2xoQkfzKfvovp2gfPQc6x
	UaGotuxifMeRhNMV1kpestT5UX3ghnpdhk8O8jhji6JodshgxpTJQAytXKh1/OATH5N/H0Z
	gpPq9uHsuHNZ6Sdong9GX6QJjCiMYN97+qBm/gc4JVlpB6fJfb7q7/QsxYXrvQ2m1tpdvXp
	Ef5P9e5e+LCgo88cbz2cVAVqLazk3QYHe7DSbd6l0mzdDjF3AT0Lntnshg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_003820_945209_51A232CC 
X-CRM114-Status: GOOD (  12.81  )
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



On 10/6/2026 11:10 PM, Krzysztof Kozlowski wrote:
> On 29/09/2026 01:03, Yixun Lan wrote:
>> Hi Greg,
>>
>> On 19:40 Sun 27 Sep     , Junzhong Pan wrote:
>>> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
>>> support, but the hardware has no internal OTG registers, the other is
>>> Host only. These controllers are compatible with Chipidea USB2 driver
>>> with some flags set and reset control support.
>>>
>>> This series is based on 7.3-rc1 and has been tested on Banana Pi F3
>>> development board.
>>>
>>> A self-powered USB device/hub is needed to test the host function of the
>>> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
>>> cellular module e.g.) is needed to test the host only controller.
>>>
>>> ---
>>> Changes in v3:
>>> - collect tags
>>> - merge the two dt-binding commits
>>> - use local variables when acquiring devm managed clock/reset
>>> - drop manual clk_disable_unprepare() from the remove path
>>> - enable related drivers as modules in defconfig
>>> - Link to v2: https://lore.kernel.org/r/20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com
>>>
>>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>>>
>>
>>> ---
>>> Junzhong Pan (8):
>>>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>>>       usb: chipidea: usb2: use devm_clk_get_optional_enabled()
>>>       usb: chipidea: usb2: add optional reset support
>>>       usb: chipidea: usb2: add SpacemiT K1 support
>>>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>>>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>>>       riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
>>>       riscv: defconfig: enable ChipIdea USB controller support
>>>
>> Any chance to queue these patches (1-4) for v7.4 cycle? Hope it not too late,
>> and then I will handle the rest part, thanks
> 
> Can you drop the fake test tags while at it?
> 

I have dropped those and sent v4.
Thanks!

Link to v4: https://lore.kernel.org/linux-usb/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com/

> Best regards,
> Krzysztof
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
