Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2904CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AB7SPTaVnVEiVlpwPTG4xEaPTjpkJr7HKsfLsY3pfxo=; b=eiWD2Ycro46V1e
	DX9J+eBVV08Shw5ur/RY0BrqGY2eiJq2V7bhUh8nNnVZR3fbXNh/hZLLCs+LvJY8KfgiwSI5ehr4e
	OxyoCGGIccnFChprCVnbcaMXoBCgAcDk2Ijc+veEjgl/JwqxxbFYLebkgHD7Svu+DxWZjGvOVCit/
	aotF7IHi4cqjwaxL677n5ry1+bNa4vUhc6q9TUC6ShvYpQgw1hSOcLnM1ZyfvfTzhAgbZFBzrmiec
	aCgn1MnPTnpBHeZYTcFlDkGn8Mj2QGFICBokpDGxKzwwAEXEpF6OT8eZo2VZA1f/W6FNDEpqyftuT
	68wWSXbc4D4e/vVFzBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouztl-00DXLW-GY; Tue, 15 Nov 2022 17:39:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouzti-00DXK9-Uh
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 17:39:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so14506091pjl.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FSiCY31V/QWXzTLZ2fNFJ5cidEqBZ+gXLW64Grk/N8=;
        b=DPE1B8LqqefUlBMXUOYA+VF9kIfGrHy7/L3SQnJRrX2ybhBDfbcTGqkPhGo+gYCAs/
         Nn1Sg8kApxzjxsQH+axtSrCcxEQU7Vkkr1b1X0xdthhgCMPQk/VwWIq2aE2sPtdyyjHt
         6Myk+7VCSn/8lE3sCnmg8BmJihCruZFjZGE4FQqBWbb16fP7UpG0Cfp8nx83AoFqQg8F
         FQwS765cfWB6Xclp24Vt9JB9bFax8lINlh5y07Hq2y8iFTvFJwrRFWwDniYUnxKxt96P
         vPRGVboImVmexj4XPvnMzf+/WguNXTWloUmT4L2cCj3jVAVZbM0P612WChqMv10s7iU0
         KZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FSiCY31V/QWXzTLZ2fNFJ5cidEqBZ+gXLW64Grk/N8=;
        b=ogOcQkIygssnHv7Fb4lHOdBBojDH8L8VJWmcNyyQvwOPBw5H+FTI9+H+DXmZe75gj/
         Ni+41lP1tNWfsfeoN/4C4BDaqSV0rjsI7mpQ46V0GFJE19jrGv2bzwXIM4hcugN4IS9i
         BXNcGv1JXltLhAx9fw5QRPf35HDg0Tspd+q4ob2vdbTsGSMcY1SBubyInLI2XteQk2tl
         tZrG+CW2yd6MelAuHyuUBILkVfS7MLKzMKBBjkxq+I625cP6H7Xe3Q7hAnp33MY+lLhG
         z4aEUyk+PuRsy/dDFXtedaAQxQ7aAzHxu1Po+Z8IRPn6Ec+qE2CRjJUb5dA3fHoUKHKd
         YB3w==
X-Gm-Message-State: ANoB5plnate57sLPvyoO1QvOwQn04x5kzXcl3BOOP9JHqcStzozJFz5J
	3195SW40tq4VbfVhUJ/Ucu8Stw==
X-Google-Smtp-Source: AA0mqf5hh2iafIsUZMWj4n4YK+7qwjikOKqTkk/QL5u4A6DJNJx4WchfkyMbIECRudOzaIoiT9C/AQ==
X-Received: by 2002:a17:90b:2389:b0:213:971d:902e with SMTP id mr9-20020a17090b238900b00213971d902emr3335198pjb.123.1668533935247;
        Tue, 15 Nov 2022 09:38:55 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id d7-20020a170903230700b00172fad607b3sm10272327plh.207.2022.11.15.09.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 09:38:54 -0800 (PST)
Message-ID: <9cda597c-1d31-4b8b-99ba-deab58975976@rivosinc.com>
Date: Tue, 15 Nov 2022 09:38:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 04/17] riscv: Add vector feature to compile
Content-Language: en-US
To: Conor.Dooley@microchip.com, bjorn@kernel.org, stillson@rivosinc.com
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com,
 vincent.chen@sifive.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, guoren@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-4-stillson@rivosinc.com>
 <87zgd2d6j1.fsf@all.your.base.are.belong.to.us>
 <98343aa8-b04d-fe58-8af8-4eeca03106d1@microchip.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <98343aa8-b04d-fe58-8af8-4eeca03106d1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_093859_016220_339494FA 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

On 11/13/22 08:16, Conor.Dooley@microchip.com wrote:
>>> +config VECTOR
>>> +     bool "VECTOR support"
>>> +     depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000
>>> +     default n
>>> +     help
>>> +       Say N here if you want to disable all vector related procedure
>>> +       in the kernel.
>>> +
>>> +       If you don't know what to do here, say Y.
>>> +
>>> +endmenu
>> "VECTOR" is not really consistent to how the other configs are named;
>> RISCV_ISA_V, RISCV_ISA_VECTOR, RISCV_VECTOR?
> It'd be RISCV_ISA_V to match the others single letter extentions, right?

Yep.

> The toolchain dependency check here also seems rather naive.

Indeed. I can build the code just fine with gcc-11 (and gcc-12), 
although my reworked patcheset doesn't include all the orig patches 
including the in-kernel xor stuff.

-Vineet




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
