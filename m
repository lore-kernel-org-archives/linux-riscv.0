Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931C9C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q34ceZbI66RyW95OVOoytoS9lgNSHEOeUeH98gWBGnU=; b=XMXZHWmuO7Bfxk
	72NZ3hkQ319V9rmItomSLCscXRvPDEEK+jIi2TOfbUSi2mC8uxb9/UPVPysdpQ4eOvfp+sDjfLjW9
	VUsVixZHIg+FSudR/nY8oBRKakpJa3sAxPnxYQETKFBpN+xkh9esTE9lmDvoK52U2moPKUXimwMDX
	sF+d1+u3ryOR7X5oaF0XKVP3rNfgdtrMJba/iJu0MtnKaUnmlI2f/tDbxQJ+Zsivl1++kB8negZWf
	cgoPC1S4h7xi8IXbJfIfl0H7NDS6IKCgGioqd5MEJWPE+S1suIx2NW1cVu3cvXKuvnZtesrXWCI0o
	l9blamPM8UszMgFqoQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fs8-006MWm-Vg; Thu, 01 Dec 2022 09:28:48 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fs6-006MUH-A5
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 09:28:47 +0000
Received: by mail-lf1-x129.google.com with SMTP id j4so1639127lfk.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 01:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jahb+tEShKBR+Ktu0BgJXy8O1SopxAlMcngu6tulhfo=;
        b=wzeuJx6xKm1tNX0R828wgisRm6UYpQssq1gEpjild2BMpZ3jiJEGbZBEyphN32yvVV
         TzR7uzCkl9HBZ5aazB219DCIvHAA3tDilXZHK5QSEnTM1J5GjbxWBHjsU7b8RG3qWgVh
         UuQuyHmJOfwhZTnSm4HJDKTS1uqYIB3z3xDZUcPR3qyTs3/oKBCapWI3kjvAlEpuM/Nb
         TsORs1tXAqJGAaAAuTnb7I8BESvchycQt+GQl8F+jRPvqdX+sBUfX1f/MHStul1Td2kB
         Ne8u+FRMrGYkvUZOMxYIIQ8hyn1GEyeRzpmRLIGs82XQAjSqkMXfrxd7nMtVBVDP0bps
         Uj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jahb+tEShKBR+Ktu0BgJXy8O1SopxAlMcngu6tulhfo=;
        b=aEkPTrU+DBX+eEKlD5HSGeSlFmo+HgcJxO/l0bxvXRb5SpTBBjwArD7PtZ/34k5UA+
         TWI5qh/NQXxVat8TYApbsmfrjVWQvC6UPKpSE46+Fo3rQpnfOW59MhLv0Nr5qldO7V11
         pZraE8SYB1PzyyYS8CM1SO/J2Tk1gPzR/YijR6OaV2k19SOEFqj80PlE4reFxZHBeGIw
         Z7Rm9TByYCtbCBm9SEnwOcUFntu3awrbCBDmn8X7pY/FAuaepy/0J15e2hRxdat+RDSy
         NPbJ2HOKsLdLkC4DbQSobSh5dXurCi0b8nDFsvlP0c1KXkziQnCGZzBv5vUS0WkwtZp6
         JGrw==
X-Gm-Message-State: ANoB5pnW//ywzg0V6XiAN1Jb8ZRB9uzcYFgKb4osBKliUMi7EbLXCcKf
	bFhKiIADlnUrLc7UyhIfpRN/Sw==
X-Google-Smtp-Source: AA0mqf4GR2jAPIP63PrEu23oXP2Y1onMJ5uqoMQq16hLdEJ8d7BaYPyYOXgoM7GjnlGgp9qM6QC+XQ==
X-Received: by 2002:ac2:4e0e:0:b0:4b1:7c15:e920 with SMTP id e14-20020ac24e0e000000b004b17c15e920mr25286530lfr.453.1669886924183;
        Thu, 01 Dec 2022 01:28:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o6-20020ac25e26000000b00492e3a8366esm589861lfg.9.2022.12.01.01.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 01:28:41 -0800 (PST)
Message-ID: <6028b265-bc8a-3a06-b17c-56aa772a4782@linaro.org>
Date: Thu, 1 Dec 2022 10:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] crypto: starfive - Add StarFive crypto engine support
Content-Language: en-US
To: JiaJie Ho <jiajie.ho@starfivetech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-2-jiajie.ho@starfivetech.com>
 <aafb1c32-bc00-2db2-edbd-aa4771f33ac7@linaro.org>
 <60ad0da0116044d3a1fe575e9904e22c@EXMBX068.cuchost.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <60ad0da0116044d3a1fe575e9904e22c@EXMBX068.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_012846_378406_67F1D2DB 
X-CRM114-Status: GOOD (  11.39  )
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

On 01/12/2022 07:52, JiaJie Ho wrote:

>>> +
>>> +static inline u32 starfive_sec_read(struct starfive_sec_dev *sdev,
>>> +u32 offset) {
>>> +	return __raw_readl(sdev->io_base + offset);
>>
>> I don't think these read/write wrappers help anyhow...
>>
> 
> These wrappers are used by the crypto primitives in this patch series.
> I'll move these to subsequent patches when they are first used.
> 
> Thank you for spending time reviewing and providing helpful comments
> for this driver.
> 

Just drop the wrappers. I said they do not help and your answer "are
used" does not explain anything. If you insist on keeping them, please
explain what are the benefits except more code and more
indirections/layers making it more difficult to read?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
