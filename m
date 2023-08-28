Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B94DC83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 07:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3S1QvELXye5UYrlSBsMLgUl2+308mEbbNKsQd3cDBAE=; b=yypvQtyAOP4zCt
	O0U3wsq9CKZm9kwXiZf3H7apraOq32USshBiCX0SRZ137k2eWCAYYrs3o+Us7OOTHUNfinblDEOpQ
	rTMf01vG58Rbj4TItzDe5ksxAF6dZvde1DBjb7y9LrdRq1ZwK2ZJvLKhrLMHvXMLe0Zs9+jWBGfEo
	NCLGUuWPEtmWCHVR5mI/kyz9lhIO2k4ttG6XuU2bykxE4HoglfogMag5BBvmPSUEYFoMdNU4gbBSU
	5dD8oYhAM5HuGXO8CiNWfikqJASzMC8nUulhwFSZdWjMpci70YTD4Q60LTkQBAh0PNcIrAP3MqQlw
	rL2PFN0OIU9ntfTyrdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaWUN-0092ox-0Y;
	Mon, 28 Aug 2023 07:16:43 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaWUK-0092oI-1C
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 07:16:41 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c1c66876aso362739166b.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 00:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693206995; x=1693811795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hp/XWLpiEUgnU4ewp+U12wgdua4CvKI8JPQCjHO/yKw=;
        b=xanC6T0ZvDvg9QZZGlQpFK52hRIe7CIP9jRQN+5MmuPrzxvENUlhlX4ht9ZAZE6GG9
         yxpBHNOFFF5sX7fRM9e2s2KefgQ/hfwDdDO2+FnSVtQA2x3wZRzzoDbDLHthf9ihVrgX
         ZuthEjdVBNLLjTyeebf6SxxpAunK90LGMI+Q1HItZa7sIUHp3IbknaNk8bEE/QWPowyn
         w/u/EVj+1ZE0liiAhQ/ilzEv4oXQChNWMLhzIsoH+/4O0kK42xtL7lM46drQF5XxEiTg
         dftq4JHk7ZlEjRyoazFxpWnc94k2hpGc3cpMcXGWyKlnqEOmNVwDmSPU7oeC0UTl3JuG
         Wfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693206995; x=1693811795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hp/XWLpiEUgnU4ewp+U12wgdua4CvKI8JPQCjHO/yKw=;
        b=RdbQ8UuatPxl5OIS+T6I9+gp1EikHS4EB+vz509oFNUQkTNO1nTG8zwV9rFr+CgbjH
         bdtjfP1UWl8tUcvmDHgBSnWtYCyOpYjlfoOXvCuoi2AM/n9zQsfv1/dLL8Cn+ZF+wvps
         WVh1KRKZA8URB5Ptg4yv1o07jiwqMfwu8d1/Pxr6Y5tpAmawmZndzLGU5pPwqhYoyphX
         aylFc2wPIrVKyUCTfhOybn8+vcfViV94vju6I5R/Ak6nLQjxfy7co27Zq7bx8T/R83tm
         C6XQxnGuhyH0wEO5rLDr49rrWoPK4Z2hga85yDLBRn6t4xKNap1fgjTiIec8vWI/jyZE
         k0Sg==
X-Gm-Message-State: AOJu0YznAfuED3y7nZ+rUE6+MIMyKINA/LLghBleqTD8yOO5W86KTxSh
	3WXw+mHtGiNY2lzvPod7QXCJGg==
X-Google-Smtp-Source: AGHT+IHyMOpJrZ+Qzlb1fHwd1TbXXH7HRzRkGSV9ysIYUu/tn7Jd9mzMZNE7BODMEr/mwjXic/LV0g==
X-Received: by 2002:a17:907:7714:b0:99b:4a29:fb6a with SMTP id kw20-20020a170907771400b0099b4a29fb6amr19071209ejc.59.1693206995315;
        Mon, 28 Aug 2023 00:16:35 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id q4-20020a170906144400b00992f81122e1sm4292083ejc.21.2023.08.28.00.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 00:16:34 -0700 (PDT)
Message-ID: <683df184-6688-f006-c4d8-fa7000b7b771@linaro.org>
Date: Mon, 28 Aug 2023 09:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC v4 0/4] StarFive's Pulse Width Modulation driver support
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor@kernel.org>,
 William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20230825081328.204442-1-william.qiu@starfivetech.com>
 <20230825-exclusion-doing-93532be4fa97@spud>
 <a49737f0-0a09-b558-ea06-b3d47a6e4240@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a49737f0-0a09-b558-ea06-b3d47a6e4240@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_001640_415087_24536B78 
X-CRM114-Status: GOOD (  14.56  )
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

On 28/08/2023 09:12, Hal Feng wrote:
> On Fri, 25 Aug 2023 16:06:12 +0100, Conor Dooley wrote:
>> On Fri, Aug 25, 2023 at 04:13:24PM +0800, William Qiu wrote:
>>> Hi,
>>>
>>> This patchset adds initial rudimentary support for the StarFive
>>> Pulse Width Modulation controller driver. And this driver will
>>> be used in StarFive's VisionFive 2 board.The first patch add
>>> Documentations for the device and Patch 2 adds device probe for
>>> the module.
>>>
>>> Changes v3->v4:
>>> - Rebased to v6.5rc7.
>>> - Sorted the header files in alphabetic order.
>>> - Changed iowrite32() to writel().
>>> - Added a way to turn off.
>>> - Moified polarity inversion implementation.
>>> - Added 7100 support.
>>> - Added dts patches.
>>> - Used the various helpers in linux/math.h.
>>> - Corrected formatting problems.
>>> - Renamed dtbinding  to 'starfive,jh7100-pwm.yaml'.
>>> - Dropped the redundant code.
>>>
>>> Changes v2->v3:
>>> - Fixed some formatting issues.
>>>
>>> Changes v1->v2:
>>> - Renamed the dt-binding 'pwm-starfive.yaml' to 'starfive,jh7110-pwm.yaml'.
>>> - Dropped the compatible's Items.
>>> - Dropped the unuse defines.
>>> - Modified the code to follow the Linux coding style.
>>> - Changed return value to dev_err_probe.
>>> - Dropped the unnecessary local variable.
>>>
>>> The patch series is based on v6.5rc7.
>>
>> Out of curiosity, why is this series still an RFC?
> 
> There was no comments received in v4. So William resend it and
> request for comments.

The question was: why he requests for comments?

RFC means *it should not be merged, it is not ready*.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
