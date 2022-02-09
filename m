Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A0FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjQ8FpZbvINeIJA8njCqxrABWqL9Ol7RjfCNrh6bHFM=; b=ItOz1cSJqdTIai
	ndHXleJCPeNPwFvdUFETygYPCT9m4F6XjgJSetHsYnmEXi1sadE/nXhkyrSqfoH79K3ewlpwivMor
	koRF22OyV6Ayzn7Dt4SrvwZcrgcGt/M3+F9+/6GLK4EM0KXancokyxybzERIsC+YvueeJiHZAW7aK
	P9uLHjvPTcncp6i1xspao/ngiTB0qNqsGHrwT0reIxqJlvIrg9EiwQplOI+tj3GNOJUyHa+YgWUE/
	M3JTwdj7vyQ1YgXBN3Ju3/dvILGVyllr/EqXO2kd/MH4oJGRljJk7ldFQLLRhOic8es6kc8P/w0i2
	W8tjDe7RKMM6z3b3ShoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHwrx-00263Q-Lj; Wed, 09 Feb 2022 23:59:29 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHwru-002635-3N
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 23:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644451165; x=1675987165;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nLVhITLvnNdZ/095iT3c/FfIaBXC4iqvMall8v8FwWk=;
 b=I0iBrS1bcV5UPg/4D431zVqbabX5J4R3G9bRRj7w3kQbxji9QnA8IkEZ
 gsxWuU/Si29NXe5X7OTvILkJlWSwxzwJttD38bjryq7jz4KNOEVDHo1aB
 PlcQz90FTbx56axaKANtFZDHTFuRFL7l/58akTO/I+sGtoOQ9HdP7xWsk
 kWrQ4n5FGoX79hQMIyCm+8yPxaoeQppoWATPbfzypGYM3hlW7cRmHCCYb
 UEJwnZa/tVRJLBdqwqt2fF++cyVLvRuriBe+vij3dtRQSC/SuSK1LZRfA
 9wzXighoBhXkB05SUsj/o6rtkzQTz8MlAHkJDuy7+TP7E5H+BkswwUSda w==;
X-IronPort-AV: E=Sophos;i="5.88,357,1635177600"; d="scan'208";a="191486658"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2022 07:59:24 +0800
IronPort-SDR: UwZB/LHrKDh0InzQc/Ui4V7XJPqxGxBqXWk8rtcanP8Pd9WmvHrTfFQQHyDtovqSOgwChwFGuj
 FR9l9wp5u2mIXNqRRifJE9J4d6uRtLiRZ7mYEstS3EQ1Wjq7ATS1CNmsc3M/6rG8W1IJ9voyXF
 SUJyrKnixfgXOIqvLGosaBH+DmBIRoyU2PMkXBELbBunc5KA6WhGnVCWmkhccsSRgBW2DXqFVq
 n8KG48XpxcWKCK17URBUY8zYQ8cs5dG14VvfAbS1mJy/rxm5gwtHVgdxNplWfLL7o5Vx5t55jk
 o01MF88BE3QdaGk8LDrOMwhU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 15:32:22 -0800
IronPort-SDR: p6Dv++015v2UadmSD6I/cr+/qL9UkXc8Oq8kNgOT699i7qRpxSjjMBW5jPsXLPw9XnALet3qCO
 +qNHZ3uqjM2MP5dSdehZccZox3ut5U9QMkB2n+sHZTVdNFEtAF6b+jzyW9M+wkvDyhDGnnUAD7
 /CjigKfltPswJQ0Nw3ifPcmwiCtxlVFLEkpRkrVdOXldOCcmfTbmFS31q7e1qNBQcmoyi8L63b
 IZgB19wpscO0bNqLW5iOKpbExyRMDP7cP+qr/Of+O0jYnmv/lSM6WJTTmvjPMJNxt3ovfiVYmI
 xb0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 15:59:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JvH0r34PCz1SVp2
 for <linux-riscv@lists.infradead.org>; Wed,  9 Feb 2022 15:59:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1644451163; x=1647043164; bh=nLVhITLvnNdZ/095iT3c/FfIaBXC4iqvMal
 l8v8FwWk=; b=snKbSf8xORdo5qYWy/Ofvcu1Vpz6ujDj5qVdLt39Vchamnh8Pzi
 4bwqLqefSFwWSWg+F9uFfh9DUxpS9FqbfhWPW5aS4HIKqqFLhPCLglJlnNPYIPRQ
 IFcKA7F6m162PnyPihT2DsdGzCF9MbUDIdydFMJrAxbzLTUpA3h2OEpp4zPKFnQw
 c9O5QmNtjPDxoVVfEeZhMtWA+y0k7Mpb1bn2AdZnsCKmou+D/f4x8OUGPZgqkx+E
 WaUZ97nn71xH6ZpbPWfc9Dxldqrbt2A8977CiDgcuQuhNWrJZn8cdeu6xuqNcbSN
 aj2P2A8mOjGbzLTOxtVCL/9AYl+guZ8PWQQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id OqM_r7CcKYFQ for <linux-riscv@lists.infradead.org>;
 Wed,  9 Feb 2022 15:59:23 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JvH0q03STz1Rwrw;
 Wed,  9 Feb 2022 15:59:22 -0800 (PST)
Message-ID: <5449119d-29e7-0179-d865-d0cb47db367b@opensource.wdc.com>
Date: Thu, 10 Feb 2022 08:59:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH] pinctrl: k210: Fix bias-pull-up
Content-Language: en-US
To: Sean Anderson <seanga2@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220209182822.640905-1-seanga2@gmail.com>
 <fb3e9786-87e9-6346-cf84-2617adfa5b8d@opensource.wdc.com>
 <4911f3a7-fe4b-8eb0-f504-667ee5ea1294@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <4911f3a7-fe4b-8eb0-f504-667ee5ea1294@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_155926_330463_C35BD54B 
X-CRM114-Status: GOOD (  13.05  )
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

On 2022/02/10 8:52, Sean Anderson wrote:
> On 2/9/22 6:34 PM, Damien Le Moal wrote:
>> On 2/10/22 03:28, Sean Anderson wrote:
>>> Using bias-pull-up would actually cause the pin to have its pull-down
>>> enabled. Fix this.
>>>
>>> Signed-off-by: Sean Anderson <seanga2@gmail.com>
>>> ---
>>>
>>>   drivers/pinctrl/pinctrl-k210.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
>>> index 49e32684dbb2..1ad61b32ec88 100644
>>> --- a/drivers/pinctrl/pinctrl-k210.c
>>> +++ b/drivers/pinctrl/pinctrl-k210.c
>>> @@ -527,7 +527,7 @@ static int k210_pinconf_set_param(struct pinctrl_dev *pctldev,
>>>   	case PIN_CONFIG_BIAS_PULL_UP:
>>>   		if (!arg)
>>>   			return -EINVAL;
>>> -		val |= K210_PC_PD;
>>> +		val |= K210_PC_PU;
>>>   		break;
>>>   	case PIN_CONFIG_DRIVE_STRENGTH:
>>>   		arg *= 1000;
>>
>> Ooops... My bad :)
> 
> (This is in U-Boot as well, so it looks like it's my bad)

I copy-pasted a bug, still my bad :)

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
