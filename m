Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B69C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 13:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyqFvYhTd8iasXKt6R0bOv1kcxtQuYF2NlNFQz8avPQ=; b=Kwm4WHzIfestMY
	knuea2suOgaI+TVcg0S2pOBNL08swnna44jaWFavS5bwMBKWfPd9pEWwnw5otQg7ZI6ccDL2/1LAh
	Tl6OPcHRLCbaQ1VOU7fvWO4tE5OVLmZU4a78MDzL267fTPPshRg5Fm50j2XFZosU4c3TV+YsgVemJ
	4CCS4bLBwuSqrKv6eEb+xy0AcnnCf3iw1nUKwzHE+TBJszwv11TBbYoLHAL0C/5kMEHUAOfGe67HC
	Yfa6YO9thUfIHIrkHJJt9buJBn8V71z8YBdd4zoJJtQqBauRBST8fy+eZaLi3QJccXr9YHDTBBb1m
	v3FZ+xXa8TzJu0NfpkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVfE-00000000ldm-3PjC;
	Thu, 13 Aug 2026 13:40:08 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVfA-00000000lbm-33I6
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 13:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786628382;
	bh=g0sOZCBcZ2Jrw2TFICRpxT9bPvkWg5mDU3MLmvx9Nrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=yKR98d1sBuhMaO1QCtKqv0vlG1m64pb/+BRw59DG1p43nyFTMf67/HWIIaojw+1KX
	 kyq4wdMq4A62tYBMSSBbWXUJ5ysz9Q57QoyquiNudG0hCPWQX3B8RWHmubcTTcr+rq
	 i9TSFRY3FyDeTjduI3JXhc/r6bbvtnwdu6UxR7IU=
X-QQ-mid: esmtpgz11t1786628375t10281695
X-QQ-Originating-IP: uzsjwFlxrWyHR9ePQt3/tWbNYhbV0LoN42pEOIxKeZE=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 13 Aug 2026 21:39:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3186414962884766525
EX-QQ-RecipientCnt: 19
Message-ID: <870CB1C672C91040+8a75565f-344c-4f1e-aa69-33585a88c8e5@linux.spacemit.com>
Date: Thu, 13 Aug 2026 21:39:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] usb: chipidea: usb2: add optional reset support
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com>
 <an2UgcS8cHDGwzsO@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <an2UgcS8cHDGwzsO@hu-petche-lv.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MhTS1zoHQzhUjTHRHxfWbMuupghBYH8SH6pucJxT0SQixF+Adgp1vR2A
	dU+cBN/rUaTdqfkbb/Dpotk8DrFaH4z2LFocYpNTQbvNq0xP2kHVeSsSyF2UG4eBbgrKTZz
	T38JoNxy0BCCDj2Ctx/OdgWHx2JLKvIAeVEykQ8/RA4ZJazVVsX+jBVnzP9lNFMOLH9KBeq
	U5V+HmwDdhj3v1lZRE46nCdw6QFiinO8wsuk1Lp5J2j/Bzn915dLEJgfpmXWZQkHqmMA9xY
	q6f4WeUYVL8m1UGgD8TGEpYxlGhaKyVuhXpUL9gRjXSRbCAQzwHQ6Tk5HUXppYyC31+r5rp
	hITGIIvbAqihuOXrjvty2fvbiMGQYTaW0DMHa6yUcUaP71yjN5iB+aiAK+NLpTuicrvaUKo
	ZaO9UBUwEg2z8iCZ9/5ke7qDNdM8cOB4W/LIJ2Gg2RMHRurKKsFn49zsmnFy6FMjN57CnZw
	uPAPehPsrZWuLuAZ2LG0TnH8A5h970Pd9h/47DW+h0iOA5ow9w7rfHTbZqhIhVU8Zwzj115
	pWL8Ej19O+WQiCkxiZW8S34BUxwfVHztq0dutdDTXSKugHJT9TwmqXxfzaHwoDqYq3Lgpuh
	YzURde1TeRijXUkopTC6lsiSOr49+air7iz4KPeLVyBRAVTbf+vBY7nY+UjZ/Lsq17pFJ8x
	/ItGkTfUGKfl0RtHPCLEyLyCp0bC/S7Qo8vkld0iI6GCi1nVKPpuOMLbnA6jA930VapMNuE
	gr9hL0E30TIqPoV7jwq4G+nI3gEnNDPCz4XAePcRpB0YBFBkCQq+4RWomuVD0Cu5k+1JwZD
	+2EJQMNkfYTuiCqlSDez9oIWaGjZEK1LE0FvNA/X6DIqRA1hdwh1iISb5zqOTjnJ46eeTD9
	v6X+icyrvcY6rHDxWS78lm01axrKcYOl7nmS105/zY/xwLk3bwX+4eX2haxTeaY0Wuk2d/q
	ox75wdv5kaHI3MJ3kQA+2gQYvBDcmGUB/3sDY4uGWJ19k7JkNluzkmrtzCVD20CzjDm4Lux
	B9sTEUBfwzYDUW89vjHnstxVnU0EYGN/rMewoiBeKXS34o0y8ilL1NEZqR2JWjDmEsc63m8
	Tp8t5P0IWqYsGB5nHIjYHnqvz6o++KPow==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_064005_588088_AEC3B88D 
X-CRM114-Status: GOOD (  14.39  )
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

On 8/13/2026 5:55 PM, Peter Chen wrote:
> On 26-08-12 17:26:13, Junzhong Pan wrote:
>> The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
>> compatibility, add optional reset support.
>>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> ---
>>  drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
>> index 8ffa1e95d8e8..00d575cd2955 100644
>> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
>> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/phy/phy.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/property.h>
>> +#include <linux/reset.h>
>>  #include <linux/usb/chipidea.h>
>>  #include <linux/usb/hcd.h>
>>  #include <linux/usb/ulpi.h>
>> @@ -21,6 +22,7 @@
>>  struct ci_hdrc_usb2_priv {
>>  	struct platform_device	*ci_pdev;
>>  	struct clk		*clk;
>> +	struct reset_control	*reset;
>>  };
>>  
>>  static const struct ci_hdrc_platform_data ci_default_pdata = {
>> @@ -80,6 +82,12 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>  
>> +	priv->reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
>> +	if (IS_ERR(priv->reset)) {
>> +		ret = PTR_ERR(priv->reset);
>> +		goto clk_err;
>> +	}
>> +
> 
> You may update binding doc?
> 

Sure, I forgot it, will do in v2.

Thanks.

> Acked-by: Peter Chen <peter.chen@kernel.com>
> 
> Peter
>>  	ci_pdata->name = dev_name(dev);
>>  
>>  	priv->ci_pdev = ci_hdrc_add_device(dev, pdev->resource,
>>
>> -- 
>> 2.34.1
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
