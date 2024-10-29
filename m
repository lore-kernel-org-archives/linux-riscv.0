Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303ABD5B164
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1YVfMQjPxFiIIFt7VHxzgnSEmiLdaGNQ0f0QI39G4U=; b=buOhip6z7zWSYe
	WK2R7VLnpEfcSWkofqLDf5mwrvYSyUvyxrHkHl/Z1IRthPZHe311D6nj9llCAhLXd+hq7ad8pIPMI
	2fQpCCy8nMyGK2AeJmHkA4TuP737+mjo9HVjiVm6YoYiPjjhiveiFa2ZXh3/xggsm6S1OWS718xbl
	+bnIPAT9TWJ6TyiAeO95qsCD+kzBudkHv+GiDBPHdbcRd+h6UnaeGjqdQu1AyeBWCCbapaY7Uz0pj
	n+P4vZGmLbHWYpzKCmJPz2+00vHYI0IwWc8/tTK4BjJPE/tRLeI0jJROgRfb8C5W0ifrJOq5pkwZQ
	EgOtoN9yoSIfavC6Kd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5htR-0000000DkvF-3gux;
	Tue, 29 Oct 2024 08:48:02 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hhx-0000000Dhgq-1faY
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 08:36:11 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso3660938a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730190968; x=1730795768; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8NSLt5gROai5eNjRnyzeHIXUrIA3Ff+xSmUEHde5ls=;
        b=gKz6pGuNn3olvc96g9+HqVzA9tcQ454EyoPH0Je4AAuXvPKmB/O1VtxeTIwTsvKsgi
         khbHxpTvBfNuoakPs2ptONqj/nTuThNw+QV9Dspn9k0WrWxWzypmBrvNMfjRzTqbVSmX
         Ia1oBn3UwzRXD1aD5k5/cUoOrgrU4OShMJXuUnUSq4PntKp3SZWQs9/w4BKSk2LgJcVe
         QdRd6XhAtT+1OUafcl3542H/i5ZW9XFyAqQ6ZO3UCpkqjzcafB1fGiMg3pAC8X+R1jY9
         yGJpNG/0YVwXxrxRunAE2Ijv7fvsyWl0YaXJ3ZkHk1lG/+sWCDX1Bp9CuPYoBLoBszAc
         V1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190968; x=1730795768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8NSLt5gROai5eNjRnyzeHIXUrIA3Ff+xSmUEHde5ls=;
        b=iREcY/KbRx9uaEXQpnugmPpngIfiaalkycKm8DkbFeQFVQ1RqxU2zCyzGGtaa9/nuz
         R6XPdafNxbdHGI0+aq0xyEAbv8gGF2AlSzuV8rtzxTo0FByRYkyQL+4ls8Y/JjIAFGio
         mkv5bZFLJg/+PDLW2SnrD8FoADTg5dpCXvX1dwHjqgPJPHjmSNig8NTwTBtdQ9feMdqM
         /RAaAeP+lKmlPO4De6GVKee1nMQvsbs+m8TgexXsSy+cR3wRCUqvLYpcari/h+a8JrAd
         nCofKQDUXdNXFGWTNLKkROXuZU15PTNgqHgckHO+wr9JHkBCNm4YSqH9SYITuqJYkW5/
         67BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbsRj7J2eYaotshI3W7qV3EzzSyKWIo7lOpCmg7inpEtd6FTI2doWgqOGjviVle7yUi3b/Lugo3ZAu5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuS0Fb7t1JAGDnH31ujoR4zzILE12NviyNUVQJSwXVPqkHmixx
	VbnCtMYOeIqATfQEH0Ct40Z26um2tp6ub8b+r4XUd2QcPRvsYEf9Hj9ypFJvnLmRhVjfKRw=
X-Google-Smtp-Source: AGHT+IHBlSsRarPjE08Y8GtoBvAeCWe8nYN7P9fMO3ywfLAmEctgr9vvRZpfDmJHAhNB1E9ogzoalQ==
X-Received: by 2002:a05:6a21:390:b0:1d9:83cc:fd48 with SMTP id adf61e73a8af0-1d9a83ca001mr14773602637.17.1730190967861;
        Tue, 29 Oct 2024 01:36:07 -0700 (PDT)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6d605sm62414185ad.93.2024.10.29.01.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 01:36:07 -0700 (PDT)
Message-ID: <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com>
Date: Tue, 29 Oct 2024 16:36:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_013609_479415_C6898AE1 
X-CRM114-Status: GOOD (  13.04  )
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

On 2024/10/28 15:38, Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 01:32:19PM +0800, Troy Mitchell wrote:
>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>> and supports FIFO transmission.
>>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> ---
> 
> Where is the changelog? Nothing here, nothing in cover letter.
> 
> I asked for several changes, so now I don't know if you implemented
> them.

I deleted the FIFO property because I believe your suggestion is correct.
this should be decided by the driver, even though the FIFO is provided
by the hardware.

Apologies for missing the changelog. To correct this, should I send a v3 
version with the changelog or resend v2?
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
