Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F09BC79FA1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9siaMHIwFzRJNXee78Es5zMH/ZXJPgcCAzgCxi7/dvY=; b=TYFpa4ab80BjL0
	zQMXF/9kbrltClpHT+P50GqvRKZZtv2EATM4Z3XkjuQyKQXSYUpU1qjNLtENzU/gi5aFOjUN0HPrm
	9I+cVCbksRbJW+UZYHmXBUNF4+hUYdHDIhFgG+oAr32vpVgBbVVPxQeSaBqRMLPcAuYAFy2pf4cym
	BQJ8yfPD2tM/pq8z76DQAE4pwZnX/vwygwNqdAHsjQRRMiLN/bAdfmYfqNapc9yfKI5Q2jqQNKDgK
	2kxFtBreffBOP+HbBD6o7Smn2xAW2R6igjptiNoSoWcK7rtISFp1zpSRRhaboaD1gh9JnKztLSjfz
	Mrlf6uVWGL1JXRRq1zCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sLc-00000008e4S-2ttZ;
	Tue, 08 Sep 2026 09:42:36 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sLX-00000008e1e-02s5
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 09:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860537;
	bh=dQ9JeuCSspYYtKeRj+GxuoJ2iXuqJiRYHrZesR2Lpg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=MPjioVmh9K1KuGgLhVa2Wfqbla/OlZ3LYDDZ4m7XGueLGjIeE1QjHYd/x+uMGlRYl
	 er08eh/eAJlfBqIFm+M+2xLeZrlORCngFPbxQlHFt6qU0Z/EYHX7JAbOSamT3oDipg
	 e/TAIeP9T9ZrOEfUoe+R7ALhkK/UuAKwsh8yx3Q0=
X-QQ-mid: esmtpgz16t1788860527t9691fe05
X-QQ-Originating-IP: wcN0CpJaClP3OChfAvcmA9d1WQrL92aZUNxejowlgIE=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:42:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4255008266137521547
EX-QQ-RecipientCnt: 19
Message-ID: <DCA7F946E4E8C895+df1ac910-5bd0-4507-8074-e92118d73402@linux.spacemit.com>
Date: Tue, 8 Sep 2026 17:42:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] usb: chipidea: usb2: add optional reset support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com>
 <an2UgcS8cHDGwzsO@hu-petche-lv.qualcomm.com>
 <870CB1C672C91040+8a75565f-344c-4f1e-aa69-33585a88c8e5@linux.spacemit.com>
 <DL8XYAR1UCMY.8XJN1LP6YQPE@linux.spacemit.com>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <DL8XYAR1UCMY.8XJN1LP6YQPE@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Ndq4GKasujqSIU8xNQOfARjRoT5/ev4/O/5+5k99YHyvNy+/hUxCU9UQ
	It3yAk2DY6aj67+BPye9czkvzLnJmj9V32Z65ydGx+oFWqLzIkRz0PDRWZ15tZa3NCJk37r
	kRtBPbw3axzl9xO1DEgSMQ+Ys0Uvu/G5vQP+ELaiP3euVKXT1O1hXeAEvI3Kp9PtgDGQNLv
	JAbu1lhDJT/hVQCvJaou0CZZXVE1s8f80iwwK2tul3uVr900uCV0bvTtQj1uNqORyDFgbbc
	jR7AehBBYz4EZ0iN/bSpTdlYFnob4kGn/UnpFinF35Q3xH5XThkHmF4hxZD8nHvmqd/wrkX
	kDP671uzOPKveGjC/1azu1RqPzwYjT7Mv536KWE1/+pGKY83/BREjTly82ngtWDJ+3oL3TC
	Pdqtlq3P4ZwxFrLJ9B+UM8pt8y+8LkGxwDslSViZ9LzIEN9HTS9/CwUhb7Sdr7QGxIizJ0v
	0ECj+6R/Jwdk4kcZ3BM+DnSL8B2GWUrv03cHSfzGIarAd+zv+LU1ncmTUXkxGC7KJypAsE9
	hPr6MUY7TqgH9P/dfI/qvs3p1zSxQCahcKz/DIYB9SkhGuntBPd7MKTktFm1+7ZJE3AHMmV
	SPgfQpqgGw5b1PXR6jfwfdjbXC9QKcuQDUaHlBFWWEj85XJ/wk/FK4z2471oAwzHAJgc9Nt
	3uwjBgCu9XK3UwxvHRap3Mgw1ntgrEKWQ1/jA0dDIRRrmpc6d9GQKUFrSU8GkjxFO5CkMm4
	jikRsuCKDwQskDQC28Tx0qTy3Cr3qy5Dl3TVNMCVSKbLtk3rBDmWZZJ6IY0Ls9FxeOMwaJN
	FEd/XpJGEazoHh1/G2BS54DG2xY6CMCMIYdHXeRZP/kNr1nYdjE6BWS0iw7bp3Ed9Ms0tNs
	AzRbetZ8lkRnJM0DmdJxrCzCsJNCQ+lzSOUuoRYoZOTHW1Kaja+k1C8mUxa0Lr/W3dkBNAu
	FAYECd5Vcx3FoHfFOp1eGkXKknJZJvQFjMknVjQSs2CUTbb0lPY405s7y3x1sHr29vGVMDx
	U2WJoRjKxOYJAYheiD/QUK//FneuMsnQl97RMLNwwls0tE3zPPeSkYlw7U3QAYxd/09633Y
	Mw4D8pXKQlGAiW0ERvsLhk=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_024231_514911_919E171A 
X-CRM114-Status: GOOD (  13.93  )
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



On 9/7/2026 4:29 PM, Troy Mitchell wrote:
> On Thu Aug 13, 2026 at 9:39 PM +08, Junzhong Pan wrote:
>> On 8/13/2026 5:55 PM, Peter Chen wrote:
>>> On 26-08-12 17:26:13, Junzhong Pan wrote:
>>>> The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
>>>> compatibility, add optional reset support.
>>>>
>>>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>>>> ---
>>>>  drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
>>>> index 8ffa1e95d8e8..00d575cd2955 100644
>>>> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
>>>> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
>>>> @@ -12,6 +12,7 @@
>>>>  #include <linux/phy/phy.h>
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/property.h>
>>>> +#include <linux/reset.h>
>>>>  #include <linux/usb/chipidea.h>
>>>>  #include <linux/usb/hcd.h>
>>>>  #include <linux/usb/ulpi.h>
>>>> @@ -21,6 +22,7 @@
>>>>  struct ci_hdrc_usb2_priv {
>>>>  	struct platform_device	*ci_pdev;
>>>>  	struct clk		*clk;
>>>> +	struct reset_control	*reset;
>>>>  };
>>>>  
>>>>  static const struct ci_hdrc_platform_data ci_default_pdata =
>>>> @@ -80,6 +82,12 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
>>>>  		return ret;
>>>>  	}
>>>>  
>>>> +	priv->reset =evm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
>>>> +	if (IS_ERR(priv->reset)) {
>>>> +		ret =TR_ERR(priv->reset);
>>>> +		goto clk_err;
>>>> +	}
>>>> +
>>>
>>> You may update binding doc?
>>>
>>
>> Sure, I forgot it, will do in v2.
>>
>> Thanks.
> 
> Is the reset required for K1? If not, no binding change is needed. I checked the
> binding, and it already defines resets as an optional property.
> 
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
Yes, it is required. Ok, I see reset already defined in chipidea,usb2-common.yaml,
then I will add constraints for k1 only.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
