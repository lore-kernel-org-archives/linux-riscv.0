Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD17C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 23:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNtHpbynSWIEyg/vnE9NSqwCl33WlSmbDCvPZnhYGuk=; b=qp98H43bHxT21B9qBglvfsgGTU
	O80Q2+eJu8aIXhWXLvfTEdOpG/b2bCliULIAxG4GCl3DB7K46xrW8OQeNM9RkyU4uSf1m3YYUCNDd
	qAGKjoFW0Wb44IeVH67e31q88vQQa25Bkfln0J4iGQjke+085/s0+SB1By2m0cgdcQgK/rDe+dNH3
	/aNLZWqjc179tvFFRTJf6Z72m4Mp3E5Hh5pBZRqG0kngygPt1eLuX09ZM53jXEoV5Dn9Hf9dQH8SO
	NUNIeHnOUG/74stolzGtYfallCImyLYI3tCNRtAF0l/lTy3W33gWI4g3hkvQbN2yWxVUHCBA94cq5
	b85sIrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHwl0-0024eX-22; Wed, 09 Feb 2022 23:52:18 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHwkx-0024dw-B4
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 23:52:16 +0000
Received: by mail-qv1-xf30.google.com with SMTP id a28so3319505qvb.10
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 15:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fznXHsB7fq3yx1Wr3eNck2JRmWHFRDu7wO8b3fegyhQ=;
 b=K7vtY4fcgIqJ4HJSiqq2au6PruCtlk060uUEezTZDkvdc6kiNQkeRI6Vj+ufMYS0pL
 Hi0m0j8SgtDXsJ4nqR2pQammy4kqnppm5RL5TJAT6gUTjDI1MeTm9k6fbqBwK6aCT9mo
 A/tDrvas/wS8UWIqYZZiE8bBrBToZxZGcmVeM+rVxcEMOF738UiM1V0xRwWQC4z1271n
 yNQOX2SlB2E7nHTegFa7BY7pA9zx/c1F1W21haZ9tnXwhGLbbQRHuXr3v7gNR+CyaRat
 IRx/cVyUnQvH0opQh1z3jXuRmIXVNAWNpUo/zkWexFlwabFOVzo6lo4DZPQkxYd2ljUW
 xgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fznXHsB7fq3yx1Wr3eNck2JRmWHFRDu7wO8b3fegyhQ=;
 b=LqtRZ9SfGIyUsRwEX9+Cz/i+6Lxmx/NEUpXY3qsQPqpcSUtHSTVggIxIQvQtjmWT4I
 0s3PXzhaNQ/lINSWchMwuLsSbR9cRHZHtK9ujRWs5vCafqnHox4KtyFo3ZH1nSnoabQd
 yDxE/N8zankXpB3f95O1hT/84MnfOnK8+ZYb4sa0AIPiz1IhIYEV6yywX0GFtQ6jSdCJ
 nx3UfvK6hwEAz91knRS1fR33nFCNf7vOV2QXQcu4UiUl22UIV82zfCVcD2NfNNh6kwp2
 odiLXewVk3P5cRQkilIBTNDAYedI7R7BrR3EEXOckVadaxw4fIicz2AvKRxxJiWro56M
 rGhA==
X-Gm-Message-State: AOAM5312qjEhbswUqLDN7JKelL7xfIE+0Duq90hDTNksvQnPDUJoGDux
 Nly/G86dhPoKvQat//wERyU=
X-Google-Smtp-Source: ABdhPJyJQcYxSpteE/xAVBfy/rxhoRCgxRtEmG3VtwpT48g1U4W5N6+0o3Iwz6Zbne1VLnM95s1W2g==
X-Received: by 2002:a05:6214:27ce:: with SMTP id
 ge14mr3327269qvb.24.1644450731816; 
 Wed, 09 Feb 2022 15:52:11 -0800 (PST)
Received: from [192.168.1.201] (pool-108-18-137-133.washdc.fios.verizon.net.
 [108.18.137.133])
 by smtp.googlemail.com with ESMTPSA id f5sm9142922qkp.97.2022.02.09.15.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 15:52:11 -0800 (PST)
Subject: Re: [PATCH] pinctrl: k210: Fix bias-pull-up
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220209182822.640905-1-seanga2@gmail.com>
 <fb3e9786-87e9-6346-cf84-2617adfa5b8d@opensource.wdc.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <4911f3a7-fe4b-8eb0-f504-667ee5ea1294@gmail.com>
Date: Wed, 9 Feb 2022 18:52:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fb3e9786-87e9-6346-cf84-2617adfa5b8d@opensource.wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_155215_444221_594C69B5 
X-CRM114-Status: GOOD (  13.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/9/22 6:34 PM, Damien Le Moal wrote:
> On 2/10/22 03:28, Sean Anderson wrote:
>> Using bias-pull-up would actually cause the pin to have its pull-down
>> enabled. Fix this.
>>
>> Signed-off-by: Sean Anderson <seanga2@gmail.com>
>> ---
>>
>>   drivers/pinctrl/pinctrl-k210.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
>> index 49e32684dbb2..1ad61b32ec88 100644
>> --- a/drivers/pinctrl/pinctrl-k210.c
>> +++ b/drivers/pinctrl/pinctrl-k210.c
>> @@ -527,7 +527,7 @@ static int k210_pinconf_set_param(struct pinctrl_dev *pctldev,
>>   	case PIN_CONFIG_BIAS_PULL_UP:
>>   		if (!arg)
>>   			return -EINVAL;
>> -		val |= K210_PC_PD;
>> +		val |= K210_PC_PU;
>>   		break;
>>   	case PIN_CONFIG_DRIVE_STRENGTH:
>>   		arg *= 1000;
> 
> Ooops... My bad :)

(This is in U-Boot as well, so it looks like it's my bad)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
