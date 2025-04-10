Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3595EC369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 01:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6u7vsfKh8eT+E1M2Sowy0M4BZhdsy9EU/m6UA3h0yA=; b=JKjm6PpupRDmOP
	r5bWywDYXr443bbOldO1i7bsr391kmG0I8/vEL6tAR1PPNBp1YlVUG3VWrSuZR574ZOVcBVMfUlWr
	fCTqr335OV9L1mkMG7JWjVf9tPxGybf8zWSt3PB8VToR2/mjmlYOeTziJzYLh1S/1wQPbuBBfXF+/
	5AfvDW8GzGjlPyC/vWdDQv31kNKR35Mzaj2iBAP7WWKUWGpYz7zHQHBkRcDA0stPwjCE/GN3VC5BH
	H0rICZu8dDTFWrfjMInnaTVDyjp/48F/yDJzxbrEmwigkM6FT4r4OtDpSPyt5jxydXGtRiBCQvhAm
	91kAcuiaMYwQ9v0/B+Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gXW-00000008unC-2evn;
	Thu, 10 Apr 2025 01:17:10 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gRV-00000008ttC-1vfZ
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 01:10:59 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-72c03d237a7so120559a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744247456; x=1744852256; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ufe1zC4mIZ9KkFKqcvzjMiU58CZ1PL6NJI/ZAbE/kqA=;
        b=y0dkPbSQGpiVOkjPYTuYYPRJ05bcu2XicItveZB4tLvbqGVEnlZn9PqOto/YOrDFfF
         m4PfEduArNKgSdxvqJKf9un8cBmLQkMIJgG4h1PY3N6PvUoP0OmUA9uvKpAvH+aL99GA
         eHN5a0LcNT8DWSaSSPg+wqtLWPDs/ta3Oh/KzFfB/6WC56Qp01L362aHffGX/Zc7P0NJ
         001iOOLJXRelNi3sJ8ypxsxxZcE2b9e8GH8SJ+xhBZQpamHFAkIVKcB1skwuJe+VwFBf
         MXOEanlf6GeOaeELLu3kESB/mNEuPYGRXQ2Z1Bjgl1dxLi3O7BgHOiDc84opQ80aMH8t
         0XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744247456; x=1744852256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ufe1zC4mIZ9KkFKqcvzjMiU58CZ1PL6NJI/ZAbE/kqA=;
        b=Rdo+baHk7kjrArZwkOQnKytyh9/BMFpP13xFN7B7DR2YoNohJ3sXCLYGdmndISaZDp
         M74cYoMdZbIDcasKoaFAAhlDdTjSn4GfFWH9NNz7iv69MMl3Beqjdb1SjRiuZMdoN/1e
         r3DVmAOlbaGk4E1uy7wyIHKbXo/BemzjkAxBIWgIwW9KquPyoUtIKEvX1szVZYtJ+hKg
         r13k+NZVE+9xu4nrzCXwUgEleBfr4X3AMWz0GFNcpW/cGoQeweg/SRMOq6Mg+di93u7l
         MLjlNsILLtPQq+7SJLXbftT05dCBwmbuU0cfqQHLi5Pc3gplp/Eda6QxXpiJANTY4Dyz
         CcXw==
X-Forwarded-Encrypted: i=1; AJvYcCWhk9bp6wbqceidFT+07Ro5pPYueiCJ28RTi/wKJG9NnniCC/0OwEBVHlN1lSW0wyIQF3ChDxTmE9jKsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLgr+9bQ4TvEFSwVyHiTigqDwKw+wD/3bmMl61a/P+cIfpm+Ie
	UGcdf/NtH8kphRAJnoclxLxoXgu3AZIRgGDpRvDjKFpqIeeS5l1LBuUqPUjeEq4=
X-Gm-Gg: ASbGncvfVv7Nz6+r0UBk5Q+wjp73fHM+cZ1+HImfOLsCrmfNZoCJUahkowyqoguvRbA
	26mfrRtTWLUa15HAHtq+PuqGSrf52ZLx0i/tRvNqsWqA3JC2yOrajhc9AgQbD+bGXuu54nlD99M
	bagrGNBbQyLjWBFrsD+zmvURwtCScYqnH8Ylf3rrdJVGcMdzPqZcC/DZiJVGwrKgSjmveP6L1Bq
	ZBB2KAvBX1/EA5QIFk/rnuIxtDwHIvGV7bNP3+Z4l0bCP/w6+ZnLN0irlqWZNhNCj2XAky4Xdrj
	Pf/vYNNg1y9Zo4A/BNbxpq2om0MlPwe8cGqamHEXXxDs1d/hf7f6Bq6vXNkXJB2o5BPyNRI4DFM
	uMGE8
X-Google-Smtp-Source: AGHT+IFevsC4sF9gcAaFeEjZSUjvU9SNPUbcIg3nnlkWLdpmBSAknJMYmP8QUt9yMWwVqLYOtLE6Ow==
X-Received: by 2002:a05:6830:2aa3:b0:72b:940a:a7c9 with SMTP id 46e09a7af769-72e7ce2a553mr338735a34.27.1744247456270;
        Wed, 09 Apr 2025 18:10:56 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e4d81dsm396029a34.54.2025.04.09.18.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 18:10:55 -0700 (PDT)
Message-ID: <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
Date: Wed, 9 Apr 2025 20:10:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_181057_986949_C4E81708 
X-CRM114-Status: GOOD (  14.32  )
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

On 4/9/25 7:57 PM, Inochi Amaoto wrote:
>>>>> diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
>>>>> new file mode 100644
>>>>> index 000000000000..4c4df845b3cb
>>>>> --- /dev/null
>>>>> +++ b/drivers/clk/spacemit/Kconfig
>>>>> @@ -0,0 +1,18 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>> +
>>>>> +config SPACEMIT_CCU
>>>>> +	tristate "Clock support for SpacemiT SoCs"
>>>> I don't know the answer to this, but...  Should this be a Boolean
>>>> rather than tristate?  Can a SpacemiT K1 SoC function without the
>>>> clock driver built in to the kernel?
>>>>
>>> I agree to make it a Boolean, we've already made pinctrl driver Boolean
>>> and pinctrl depend on clk, besides, the SoC is unlikely functional
>>> without clock built in as it's such critical..
>>>
>> I disagree. The kernel is only for spacemit only, and the pinctrl
> Sorry for a mistake, this first "only" should be "not".

This is a general problem.  You can't make a bootable
SpacemiT kernel unless you define this as built-in (at
least, that's what Yixun is saying).  But we'd really
rather *only* build it in to the kernel for SpacemiT
builds.  You clearly want to minimize what must be
built in, but what if this is indeed required?  What
goes in defconfig?

					-Alex

>> should also be a module. It is the builder's right to decide whether
>> the driver is builtin or a module. In this view, you should always
>> allow the driver to be built as a module if possible.
>>
>> Regards,
>> Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
