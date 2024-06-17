Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D58C27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EokCdmLfjmGF+qOjc8A3GJQPyO3j1ylHu6OBRfC/u5I=; b=cuZuKMWSGa+9/d
	EZ9FamTiS5xT68eMzWEuC5dPdr0B4CeX3E9CdS1DdrVRVrW01gZqZTeH0XVhTmtbsVAVlaeZpgCqi
	etFurauTfSd5YUb7rdCFXHlY/AIS9VQ1CfHTRVyb7eCFFCutlvs7jLITo0bIRjxMhpCAdzUWDf/BC
	Tvp45AUTocc7KbOjlvke+ByTpV9tDoj2w/0bhA4WDDR96JCorkhu8zqCnZ4YzrlPP2CybdcoaICvZ
	W83CuIBGPStEjrHVivMxmondGFx8hYNooxArVmZDDh+gXgL7RzHVX2bz2pqnW39bmBG0phR1ZwgBg
	GvKOS329sVxceXlgNBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEk8-0000000Bc14-1ZBS;
	Mon, 17 Jun 2024 15:58:04 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEk4-0000000Bbyq-1wGD
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 15:58:02 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7eb85e80661so191064339f.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718639877; x=1719244677; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y38wEtgp0CoFHpwb8izsys6Wx6Cga/obIFlEHj8WuWQ=;
        b=JZu1/yl3iiws/z9ChfmW7Ytvf3Lvt1XbP2XYdJayzAi+Fe52JXeoAMveb1Tb6R4BVP
         mz6UGCSbqRwZx+KUwsaJf4bjbNrXANTNI4NXBp01FuKkuToL+916GmfzPouuzCoC7K3m
         rlOgqjvNoqY8VJUgEzRAiyhZnNHY1RKKSz3B12EKRdRTxIY8/qR6IL/799f/03XVTM7O
         hj4dCc/Dem8tce+Wta7YP9xWiu8La9g423w3QAVxSungkQ/QkX/mXQTWwxGSImlVgs+d
         63/qrBBK+r2Ft12keWa5uDecD4ydsDb7l22gtHohsIZcGyWA2sfns/hDVoUoM++1IFlu
         kvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718639877; x=1719244677;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y38wEtgp0CoFHpwb8izsys6Wx6Cga/obIFlEHj8WuWQ=;
        b=JFhcMqKhSpLBhj6/qspq6799SrOv4yvuYZvs/zB3UY5Af+ydWblM6fTxiDRq8FiXmn
         3bLpPnhV0FQfKpXBfXbMP6fSc7s6Um0Wh6m2Ct3UVw99WXAr1sie/qRJhJ9ocmZs5CJd
         nauv1Nu1hPzs2MZoU4uIKvjZ05t62z/hjWEFZ78lxIT+nWKvZ8hcELLhOQOH5KMqyZFA
         vuvcyBO9UXCZ2xbq58L/mEB+tOG2djlUQOCJSqK9XLv+Ml1SzdBIr9KFr8fA67/N+4Im
         mivLrRixuP+Ko9rzIeVrYpai80PUtIZpO/KqcvYkuKxYxneAZHRWFjrrQcgB2q9u8gSj
         fC3g==
X-Forwarded-Encrypted: i=1; AJvYcCW16g7pd6JhbAi7xBIAq+VhGBKBno32JOVBQLgqyY1bECLr96ic79zqBwrpWz+lOuMFr+8fHevqvTlMjm39ZuF13cnc3HSXb45TGgjd5IsM
X-Gm-Message-State: AOJu0Yy0vYB168eNU7DGvwBCX0vT+Dh1C5zzjHdIDrogTg7jtZ0JffTA
	XoKkF4dGTRBnXiFQ3kcRNsmhcSSPt8nGxjSOpcsnnmslGPwocLHs0jQ+t7SKVM4=
X-Google-Smtp-Source: AGHT+IEJELr9ZwWrlnrxxlTJV+RE9Cqefzg01BVij/9FdIlNARMSU5nXKlFNcI47+7j/ic27zHRtMA==
X-Received: by 2002:a05:6602:2cca:b0:7eb:8cd0:a11f with SMTP id ca18e2360f4ac-7ebeaef231amr1154395739f.0.1718639877398;
        Mon, 17 Jun 2024 08:57:57 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7ebdbad4745sm234238239f.44.2024.06.17.08.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 08:57:57 -0700 (PDT)
Message-ID: <6a993b58-3d9e-4f92-bf47-7692c9639314@sifive.com>
Date: Mon, 17 Jun 2024 10:57:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] riscv: dts: sophgo: Put sdhci compatible in dt of
 specific SoC
To: Jisheng Zhang <jszhang@kernel.org>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@outlook.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Chen Wang <unicorn_wang@outlook.com>,
 Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-1-19a585af6846@bootlin.com>
 <IA1PR20MB49534C9E29E86B478205E4B3BBC02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240616235829.GA4000183@ofsar>
 <c75601a1-1389-400e-90b9-99c1e775a866@bootlin.com> <ZnA3O14HOiV1SBPV@xhacker>
 <20240617-exuberant-protegee-f7d414f0976d@spud>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240617-exuberant-protegee-f7d414f0976d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_085800_610097_C1ACA87A 
X-CRM114-Status: GOOD (  24.59  )
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

Hi Jisheng, Thomas,

On 2024-06-17 10:40 AM, Conor Dooley wrote:
> On Mon, Jun 17, 2024 at 09:16:43PM +0800, Jisheng Zhang wrote:
>> On Mon, Jun 17, 2024 at 11:16:32AM +0200, Thomas Bonnefille wrote:
>>> On 6/17/24 1:58 AM, Yixun Lan wrote:
>>>> On 18:47 Wed 12 Jun     , Inochi Amaoto wrote:
> 
>>>>> Is this change necessary? IIRC, the sdhci is the same across
>>>>> the whole series.
> 
>> sorry for being late, I was busy in the past 2.5 month. Per my
>> understanding, the sdhci in cv1800b is the same as the one in
>> sg200x. Maybe I'm wrong, but this was my impression when I cooked
>> the sdhci driver patch for these SoCs.
>>
>>>> I tend to agree with Inochi here, if it's same across all SoC, then no bother to
>>>> split, it will cause more trouble to maintain..
>>>>
>>>
>>> To be honest, I agree with this to, but as a specific compatible for the
>>> SG2002 was created in commit 849e81817b9b, I thought that the best practice
>>> was to use it.
>>
>> I'd like to take this chance to query DT maintainers: FWICT, in the past
>> even if the PLIC is the same between SoCs, adding a new compatible for
>> them seems a must. So when time goes on, the compatbile list would be
>> longer and longer, is it really necessary? Can we just use the existing
>> compatible string?
>> DT maintainers may answered the query in the past, if so, sorry for
>> querying again.
> 
> For new integrations of an IP, yes, new specific compatibles please. New
> integrations may have different bugs etc, even if the IP itself is the
> same. If there's different SoCs that are the same die, but with elements
> fused off, then sure, use the same compatible.
> 
> I expect the list of compatibles in the binding to grow rather large, but
> that is fine. No one SoC is going to do anything other than something like
> compatible = "renesas,$soc-plic", "andestech,corecomplex-plic", "riscv,plic";
> which I think is perfectly fine.

And you can do the same thing here for the SDHCI controller: if you think sg200x
has the same controller (and integration! e.g. number of clocks/resets) as
cv1800b, then you should keep sophgo,cv1800b-dwcmshc as a fallback compatible
string. Then the driver doesn't need any changes until/unless you eventually
find some reason they are not compatible.

It's better to have a SoC-specific compatible string in the DT and not need it,
than find out later you need one and not have it. :)

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
