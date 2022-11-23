Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EAEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 09:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABq0J+lKCYpxhcbHXu9Py+9Z9FAApoWydJgwpk6aRBE=; b=Dm6dSLJGVcaRLM
	UcglRfylLvuJlM8lmMgTntP89Jj72P69ZB8NzPOdQIwzj12Q0yf22JmnGSK5Cy66B4dItsKuX092/
	wryVkGbBwky8HBXV8w9yb1Wv4cI/2Nk4/4TBEM9S3RZTY4WNQm2bYf5do83f9Fk+YWcOdqvaYDw5B
	gOFVXlVnXN19PISPfucHlwkTioPHAP0/afhyGzW8k4zCoGG1AfVJ8CEb4bCjW/DrdDjx7PsarusW7
	oZHVARxmKZhKgPxyx3+PHaORKYg2o7fMLTSl2ED4azBGLAU5IfMd//M/YI588FT+2A4a8oTgVq5lE
	hlWoc+WWS6n1xNGivX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxm99-00Fyk0-QH; Wed, 23 Nov 2022 09:34:23 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxm97-00FyfF-K7
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 09:34:22 +0000
Received: by mail-lf1-x12d.google.com with SMTP id d6so27303761lfs.10
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 01:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u8s2q4f5w/4IPeNoebI+nh7g4r0oLg4pQUjqS5WFRYk=;
        b=FLRmBljcZFVd3iH3NW/n9fV3NPM5BxVX81sqR6LZ5RbeAjwAUUACbw7bpAZTUCkHbg
         UbLObKsVx6nYalwPse7wmcQC25HSwU38xJ//YSSuY3Vksu8EV5v5XbGXI6+cbOvQDyYx
         my4KGi161b0Pitcm7UZF0+yxoQ5eKEEisxE1HLR3Q47rHpGxWxJChp7fnH49Ey6Zrdyc
         Bh5td7XP54jj5mPNPbrbsqYpl0XmY5dugMm9p2q31pwT4wIbIGUCTMIvqfz7l4WUTJ8v
         ptI8vjj1FYlKgmvDZYPmWU+2/54FuurMfxTrl/VXOSfvxMVdeWLqu5m/SzeDXPJ+uy/R
         jQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8s2q4f5w/4IPeNoebI+nh7g4r0oLg4pQUjqS5WFRYk=;
        b=w/YU8FWVroJpKsd/zVPhJ7tjiH2NveobQM+N4FyKZJW62TiRsdI0bkh2PKra2lp9lg
         44Nxnhx9IMSHd+sQAyVsj0DYU1K1jNe9ArjzJfgeBXZKGe7pZtWY+7kA2o530McGwgtA
         QPfYPu++CfudossocyioJIn8MSVxabtQIzJdgWcbDoJAs7m7QEoQa1n0H7+4FB6GPGR2
         ytglJQpUvA5hnC1l17DmBxgXMtThT21tYsHsiBRCf6R86d1jN8oe04+a6PCJ6LXXUFuC
         fU+wnY1waffmQkzCk1xZajj0jVixp/V6xVfKdmbAlfdJplNgRYmjQO1l43tmGv+0Q+YS
         R0zw==
X-Gm-Message-State: ANoB5pl2uBo0/mqUQFOSw3w0Dbqa8uD7KdtAbvUz/OfolGvvAzgn78aq
	XGhxobSNDzbhgigafdmN39LPCQ==
X-Google-Smtp-Source: AA0mqf7D378yEUBmE+4xmSMMT7l3z+IL8SiWvdALDT0ayiY7awFjMZCumei8TeFsYJZZ0ZLkVaiH9g==
X-Received: by 2002:a05:6512:258a:b0:4a2:27f0:46a5 with SMTP id bf10-20020a056512258a00b004a227f046a5mr4360007lfb.611.1669196057899;
        Wed, 23 Nov 2022 01:34:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s5-20020a056512314500b004a1e7216131sm2806605lfi.116.2022.11.23.01.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 01:34:17 -0800 (PST)
Message-ID: <e63e5377-f726-7c04-61d5-9e39ae5c2ad9@linaro.org>
Date: Wed, 23 Nov 2022 10:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 07/14] dt-bindings: clock: Add StarFive JH7110 system
 and always-on clock definitions
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-8-hal.feng@starfivetech.com>
 <4d1fbddc-ee8b-1ab3-d1a9-8496bda3f668@linaro.org>
 <1db979d5-1fb6-f3c9-8ce0-e3e2e23e5d14@starfivetech.com>
 <f59e53b0-0915-e8e9-7e49-05ca6a9eac95@linaro.org>
 <c0050210-0b87-3b30-913a-a2b1e757ba15@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c0050210-0b87-3b30-913a-a2b1e757ba15@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_013421_686673_42C71EDF 
X-CRM114-Status: UNSURE (   9.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 22/11/2022 09:04, Hal Feng wrote:

>>>> Filename based / the same as compatible (or bindings filename).
>>>
>>> Should I split this file into two files for "SYSCRG" and "AONCRG", which
>>> maybe named as "starfive-jh7110-sys.h" and "starfive-jh7110-aon.h". Ditto
>>> for the patch 8.
>>
>> Does not have to be, but anyway naming must follow compatible naming, so
>> vendor,soc-device.
> 
> Can I name it "starfive,jh7110-crg.h"? This file is included in
> starfive,jh7110-syscrg.yaml and starfive,jh7110-aoncrg.yaml.

Sounds ok.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
