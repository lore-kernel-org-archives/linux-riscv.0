Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B525EE0AE4
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 13:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	Message-Id:Date:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MS4yBYxgFEFBQCP1Dy0zYhJWq+uARapaER8mPX/sMVo=; b=x1ehOn4YeqPkao
	GicfQpXTYJvvKb2kLs5iMSgaJnrNri4WfGeCiSMqO0EpwncUNJVclXR3fvBU1C1fz/L0/qBb5JZRe
	mfhajBDsD2fAgfnVoBwtd2BXEfLYy7eXbs5GriGvy15G4l3GAVa1wr8I2wgSrpKrgNLTACafjaIHy
	QyOqYASmVfeenHXFNe04V4+rxGoRZnJJGdxkvP5K2mbNzZYPEei/5/1IuU8lhGCYQDwgMM7qRDwSf
	mzePee4+kPQEWPhEMZLFlqM1RkFUpt1FnvOJ+jOPpd+XaxRkQmFVCdcKy87uS35LO/xJVcrX8O9dL
	5lpiqteyvxMm2RZu0W3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voih8-0000000CVT9-0nJy;
	Sat, 07 Feb 2026 13:49:54 +0000
Received: from mail-dy1-x1341.google.com ([2607:f8b0:4864:20::1341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voih5-0000000CVSL-2QAG
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 13:49:53 +0000
Received: by mail-dy1-x1341.google.com with SMTP id 5a478bee46e88-2b7da62b487so5797427eec.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 05:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770472190; x=1771076990; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:subject:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IzXDpLFwSkLNbwyD+8cYCZma/FvcMBgne+jWBUI0S0=;
        b=LKIAskISnawhF/eR1smvBMA80yLq2mRo4uICYAYj6sC3sl8loOU8vvyltFfMR97KwN
         /mGAwnTrfG/rZ7Jia52dCo9fUxWSisieC/b3/KRWy5w0pHsHPk2jQnEo1d2hSel/lZ0v
         R+r3I5VfWjTax17xuVGb/9jx9ZU7nD7fqSZzLGU9lpqbhG/L0NjcBjCELT9rX/W4fdU2
         pn/gNm55+NMsbQgaSGcyA4ohIWHCNf6PX1uwAvweLWw4TgZOE5IYvZhSN1/+dhZtWANy
         dR7Fwtf5skdLfJL0IiwuQkgECcTOgfIsvOBT2P9X/N8FDOv9zJYE8yYE/TVfCnjIJ1hF
         fArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770472190; x=1771076990;
        h=in-reply-to:references:cc:to:subject:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IzXDpLFwSkLNbwyD+8cYCZma/FvcMBgne+jWBUI0S0=;
        b=J9vz3uZFww3v/681gXztKg5NDelbJFMdu+TO9P0M7MCYyr6jgsXKeIjQZ9dL/G1Kfd
         gTJ7Ij8MmQzEk0xl6rg1H+ofIx6c152QCWHQe9LeSkyjaxKupAPauvRYY/bgBcmR+MXG
         QyB/3vu39tt2ie6ux+ju+kFALse8PpeB8gbQ+z2OJ/W0AyDwWJo8/OUzKiyVQqENRAYb
         yyqLcYKyj6GC4X0VX8Z7+YZq87+Gebo2bQYs+pJ26PzMvD99903dGuuc4F+NyPyPIdyE
         qvNSlmGFxM11YYoZOWWdL3K4LB3myG1UASRQ0ISzmDg8GkfMNSfDrMCinPmiOyv10D8B
         uD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+X94813ZKKGgLHGXoJQdzVgSmHDqBwcL49DB6zrLJMdd+45Xb3qvLnFuuycH9QZ5KFKMxTy+zAfaYNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJYI/oTcNk5ECBNVp+NPoPjS+TbtdvNr5TjHcUSgZ/1B4jYqIJ
	h0MQHAdQJ+4Pv1WPvWAxM2UseWQ56VCh9Zl/d9VDC1nCzi4Z7j5/vPkC
X-Gm-Gg: AZuq6aJsgP3jmI6xPA1FH12DH0VkE4Tn2AX8BqeL5xP5A39D2W/jPSsPu5t7i5Ka6kV
	nxefeBwPoY151oghYYR3J3rohaQ03aAv4blkbTd5R8KNtRgIeFz1VUHJuGwyE5a0jfzUV/Q8Rot
	LsyrtW/s8VubwPWYwRry4bjpPMXT7svGB+BSbe3+6anrQ+ehH9vAECHD1xzUsWs6/CnFrxndVku
	DF7xvltEffnTkmRqrdIR7lbXNMsN1FBDPP76YC3/IZ9k83wv0BO3g7pMcMNpgnByyb01csG6ufA
	Ks+9wOIT+XzpLBwy0h0MELGCbyo5QlHB9HNoqdTyGKiz93xSplScsJk46OHs0Z5jOUFekT8Map6
	KnGvsW9KghI4Yn5Yl+FwiF+yjNQbbzwysdR1rakHEpGSSHUXzqGPz7w8JIm7zzW9JeUP7GX8U4A
	V98UQKctbOhEMPZQ==
X-Received: by 2002:a05:7301:3d19:b0:2b7:f809:9c38 with SMTP id 5a478bee46e88-2b85642b483mr3550098eec.18.1770472190215;
        Sat, 07 Feb 2026 05:49:50 -0800 (PST)
Received: from localhost ([72.11.140.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3db30sm3684099eec.21.2026.02.07.05.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 05:49:49 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Mime-Version: 1.0
Date: Sat, 07 Feb 2026 21:49:47 +0800
Message-Id: <DG8S0EEA55Z6.3RVC23NWTEW1S@linux.spacemit.com>
Subject: Re: [PATCH v6 2/2] i2c: spacemit: introduce pio for k1
To: "Andi Shyti" <andi.shyti@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@gentoo.org>, "Alex Elder" <elder@riscstar.com>,
 "Aurelien Jarno" <aurelien@aurel32.net>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Troy Mitchell"
 <troymitchell988@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
 <20260108-k1-i2c-atomic-v6-2-41b132b70f68@linux.spacemit.com>
 <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
In-Reply-To: <aWeyT8gb8Z31S_V9@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_054951_617929_C53B59DE 
X-CRM114-Status: GOOD (  19.40  )
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

On Wed Jan 14, 2026 at 11:47 PM CST, Andi Shyti wrote:
> Hi Troy,
>
> ...
>
>> @@ -171,6 +176,16 @@ static int spacemit_i2c_handle_err(struct spacemit_i2c_dev *i2c)
>>  	return i2c->status & SPACEMIT_SR_ACKNAK ? -ENXIO : -EIO;
>>  }
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
Thanks. I'll use fsleep here and remove max_us.
>
...
>> +}
>
> ...
>
>> +
>> +	if (i2c->state != SPACEMIT_STATE_IDLE) {
>> +		val |= SPACEMIT_CR_TB;
>> +		if (i2c->use_pio)
>> +			val |= SPACEMIT_CR_ALDIE;
>
> Why are we enabling ALDIE here?
Should be:
if (!i2c->use_pio)
>
>> +
>> +
>
> please drop one blank line here
>
>> +		if (spacemit_i2c_is_last_msg(i2c)) {
>> +			/* trigger next byte with stop */
>> +			val |= SPACEMIT_CR_STOP;
>> +
>> +			if (i2c->read)
>> +				val |= SPACEMIT_CR_ACKNAK;
>> +		}
>> +		writel(val, i2c->base + SPACEMIT_ICR);
>> +	}
>
> ...
>
>> @@ -431,41 +605,8 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>>  
>>  	spacemit_i2c_clear_int_status(i2c, status);
>>  
>> -	if (i2c->status & SPACEMIT_SR_ERR)
>> -		goto err_out;
>> -
>> -	val = readl(i2c->base + SPACEMIT_ICR);
>> -	val &= ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | SPACEMIT_CR_START);
>> -
>> -	switch (i2c->state) {
>> -	case SPACEMIT_STATE_START:
>> -		spacemit_i2c_handle_start(i2c);
>> -		break;
>> -	case SPACEMIT_STATE_READ:
>> -		spacemit_i2c_handle_read(i2c);
>> -		break;
>> -	case SPACEMIT_STATE_WRITE:
>> -		spacemit_i2c_handle_write(i2c);
>> -		break;
>> -	default:
>> -		break;
>> -	}
>> -
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
Thanks. I'll do that.

                              - Troy
>
>>  
>> -err_out:
>> -	spacemit_i2c_err_check(i2c);
>>  	return IRQ_HANDLED;
>>  }
>
> Thanks,
> Andi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
