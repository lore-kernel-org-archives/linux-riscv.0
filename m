Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4857BD46602
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 17:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bC8BSFcDaRn6+wg2h68Vz8T/A2MGhINV/CKz/QxvPPA=; b=N2HtmzZrFEAkBr
	W2KO6a+RrMS2Fuc6MzFn8fUoBDCHdnrciP1B960e0/BOvsePIZ5qrMKAMLhXuD+nImNjLHqoNrFp0
	PNPzjf/XTadvxatb85ViTxbiJdZ+Tb3sxb9LAmytChcl7uRVefR2dcndAZVUqh4V9m9tJRdJ1Gmh5
	1gTEGkbaXvlXmvq2SUdWCMgPQpCgjpRQgXRgshCnenbbUD6QYdAOxtlCgfbzQej0228v48TEEG3Kf
	LDgkRaMkBRCJ2mjvh3b5nhQCH34RK32F2ocEAS6F1ADgWjHJ8CCCQBioZLoWCVJKaVgrUvc5g916x
	hBKPe2nkEpsokDv+5+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQjt-0000000Copg-1E6T;
	Thu, 15 Jan 2026 17:02:29 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQjp-0000000Coox-1IFx
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 17:02:27 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8c5320536bfso132736185a.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 09:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768496541; x=1769101341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lmL4wVgyCel4RaZm/YDnYaY71CyzahaKuw46/jDcwA=;
        b=dNNUx/Sk9dFuijzDpDMHLX4mPnO7AjNoMPfZ+viyHRoq06NRfS1yf4IpXRGGaeRT0y
         AtImexYxAY+19e5uMXd/qCOTUaJdGnEWfnmo6poWfIiYCrJ9yRm650d0PPw2qrgIbTwy
         rcBWN+mJplBrQrG+JE2qKQfa/OIkhbkcnMDB32+VbtF/PpehNMoQofcP5UN37NAZmUXS
         0m17roHCqdZE8xPWKH9cpvawfSuBqxl1/x9MOM5xjMSUI9bT5dePUd4BrEI32zShHwgD
         D+lw/6KkXXdUnla8yahzr3AdSUOLvfLCweBXJAnGwfmZ04qVhl7eHJJ4A1OOkbr2LbMw
         tppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768496541; x=1769101341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lmL4wVgyCel4RaZm/YDnYaY71CyzahaKuw46/jDcwA=;
        b=KCd1gOP3FGKddnvUB5rxQg/o1X9JhVz6/zfYt5pFQ5fDdhZlooon3Le2I91I9kLOID
         grU8QDaW6ahm+dXbaWV/RywEzrg7Zp8czoki0KCBClEwkx1KHt8KjomzYkQ9LeSkkI4R
         ig98M8X14M6QAn3S+06rA9qR+Xn3L1Kv3VuAaZRgi0SJrERgCwtCYSvyidfNSc84orBk
         h/ys32iSMJd3orKywxs7LG+Qds4Oha4tCAkBd2vNuWv1y8wPrYzfwgXdFtlJRhecXH0X
         wTnzKmASlt71HoyNthhtdrf0QCDyEDXEUrO3t439mnI79Xv4n2a/oXEjET6Z1l4f8KKn
         ZJ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWG2NoPGx51DpqzJwdgz12DVHloV76WyDcQOn5CfX4j6XIfWewOmQEwqs2Xlj77E6lVphMg2X73mrXFug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw38AMecl2uWHFffssF1uEZshQRWIhR22tfB/2iJ6AgqLI8ARvH
	6AMPevvvcs5XGjYzn1sQ1VROsHm6X5UYHdizkDxhceAPO9+2jMdixqvIIxzxGPrdCjc=
X-Gm-Gg: AY/fxX5YK3eF20eMz83ExDelbgu+2X6GStBjzRcIvDrj5iNorLVy6Fl+pOkXrSWTS7w
	IX7oYyZDd706JBVqxrOmTvz9mvhIhl+TmC8Ac6XJ1/YfIZhw9c7aIljdlgTMHGwM34KmIsXrBB7
	HCYl74cS7p8xieKV5J4ydJ7w7WGHB4eCkruiFWV6tf/YcLIeiRpeU1xosCInmat3qg/mpPqsIqP
	fdAGXZt1geF1oZPuEwVB+Yzp4F90Zsj5SbTwdiPNf+zgOe+q+G4hLQ2E3DeJ0FNwr4ZWRlXLM/k
	oNpY7cdLM4lIANBlZ2jz+DDt1o5fXs38WAtUyoUBjnVoUkU9oX0VR6/6rpBaCrUu9yc23XyatK+
	pYdITNBteYbbvHrGC0ZPRaNBLSFox/UKBD1xwGjvZU8OlSwh7ZQkYEtfpGweT3gfJI5TBuHiWdO
	Rg8fJ6UL7jyASN3/HYqCWaoKGSg6xh/XIAJEJpIzZAwxYgvDMBy3d/
X-Received: by 2002:a05:620a:700b:b0:8c5:3376:3326 with SMTP id af79cd13be357-8c6a67c857amr5981285a.80.1768496540568;
        Thu, 15 Jan 2026 09:02:20 -0800 (PST)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530b74bc4sm455422485a.32.2026.01.15.09.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 09:02:20 -0800 (PST)
Message-ID: <00f42b6c-857b-4eef-a0da-83053998135a@riscstar.com>
Date: Thu, 15 Jan 2026 11:02:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: spacemit: introduce pio for k1
To: Andi Shyti <andi.shyti@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
 <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
 <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_090225_498970_3EAD0C9C 
X-CRM114-Status: GOOD (  20.36  )
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

On 1/14/26 9:47 AM, Andi Shyti wrote:
> Hi Troy,
> 
> ...
> 
>> @@ -171,6 +176,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>>   	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>>   }
>>   
>> +static inline void spacemit_i2c_delay(struct spacemit_i2c_dev *i2c,
>> +				      unsigned int min_us,
>> +				      unsigned int max_us)
>> +{
>> +	if (i2c->use_pio)
>> +		udelay(max_us);
> 
> We need some control on how much we want to sleep in atomic. This
> can have effects on the whole system.
> 
>> +	else
>> +		usleep_range(min_us, max_us);
> 
> If we assume that max_us = min_us * 2 we don't need to pass it as
> a parameter. Even better you can use fsleep here which does it
> for you.

I agree with both of these comments/suggestions.

And if fsleep() were used, spacemit_i2c_delay() might be able
to just go away.  (The range used in fsleep() isn't quite the
same as what you're using, but this is heuristic anyway.)

However the delay used in spacemit_i2c_check_bus_release() is
90-150 microseconds, which would lead to sleeping in fsleep().
Is there any chance 10 microseconds (or less) could be used
for all delays?  Even if not, fsleep() might help here.

>> +}
> 
> ...

. . .

>> -	if (i2c->state != SPACEMIT_STATE_IDLE) {
>> -		val |= SPACEMIT_CR_TB | SPACEMIT_CR_ALDIE;
>> -
>> -		if (spacemit_i2c_is_last_msg(i2c)) {
>> -			/* trigger next byte with stop */
>> -			val |= SPACEMIT_CR_STOP;
>> -
>> -			if (i2c->read)
>> -				val |= SPACEMIT_CR_ACKNAK;
>> -		}
>> -		writel(val, i2c->base + SPACEMIT_ICR);
>> -	}
>> +	spacemit_i2c_handle_state(i2c);
> 
> Next time this can be on a separate patch as a preparatory patch
> to make the review of this one a bit easier.

Yes!  It's a next-level skill:  beyond just changing the
code, breaking the change into good, independent pieces
that build on each other, to facilitate review.

Thanks!
					-Alex

> 
>>   
>> -err_out:
>> -	spacemit_i2c_err_check(i2c);
>>   	return IRQ_HANDLED;
>>   }
> 
> Thanks,
> Andi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
