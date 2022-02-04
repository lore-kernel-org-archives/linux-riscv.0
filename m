Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13D9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 18:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXWAvZjg2I8uRMDabeSNep3f3Pzq+QmcW+aVUdFr1O4=; b=sEuhHy4tPorgkV
	+zicD8MHZtc7+QfnymSsMc3lhCw068aRdx3GcjLaBdxarw7+IGV9m+X1fJ9N8CqZfOkrCvLsQkm5x
	/w8MzQFfKAGtr7kUuUxKRHZcG+JvkJy1zXIynxuLr1SKbRGLSEYS1T9pyv8p6hLRYM97bPucvndOd
	xabXwt2hsPwtxoShcGA4PmFy+GSoDPGPjFDW72anef/3EQBii9wR4ooiFtLlBKzPxb1URJJaw1J7f
	PDsvYGlH41PsltWQxke8eKPVZw6TRePFalY0n72f1Gs5xBueDHkJ8urFiyfmqVEHzOqRDZojR70SK
	+AGUfzitJkSOqKCuE7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG3ck-005D2g-Q1; Fri, 04 Feb 2022 18:47:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG3ch-005D0J-SJ
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 18:47:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id s18so12971038wrv.7
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 10:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/FXf1cpHah2vNgyPqX7qSvfT47H3XqIl9lhW99Uh6Zg=;
 b=gdWY6AsY87ioUhnUZ7mUhldlGrZUqt7skinL0OJM9wbR11tcWkEb7TNlWlPlRBM/el
 O8hrFtLwwaLpgvTWzAw+OYf5ntp8Oxs6rqDsqBwvlbIHfu/cLKLM0ncE67oN1n6uMzBh
 oKFxIEUF2vX9MnZFkPLqqi7hHBa0ZEW6heyY+DTDeEJe1FPUZj+QMoo8y0ANmNW+sW3M
 vbTkZvhtDZO40U2AcA2rlYQzRihrYsAb+GozKsdq8BfFeXKjYRQO5e9U7VSrswlm3VDo
 AGdMO2dTrlgMajsUDNDiT4wogUYJEKi9tbdnE2Ut77OUW4APjG2/l/9Fg4EwinemWaoy
 TeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/FXf1cpHah2vNgyPqX7qSvfT47H3XqIl9lhW99Uh6Zg=;
 b=d9flullKsQMUzxtMEkLMYAVtYTFdhA2oqliTplnyTKD7Gl4DDKbdKg07ERQMZYtRpq
 3j7sYBUFLKtHrraC0jm764P1v0S3SqOY21/QMuEVq54PJFM87E/t7Gk0UcfQmm0mBer2
 vIHsNl4vtlnOpHioD8reaMVlIjyRqnYHp+huaHoxoCBe50vBJYnw4a0BZ/qOxlSD8e5f
 lA+9MYKHpMHUYDLIa5gOFljfUB7c5hsjp82DibvbagAs0iB/SYuTgaEHBJoVH9jHiNcb
 HZHS/x3jHF0zCDMgO2ptRlmxT6MTY5LKmY44YU8PoLweRLORWvx0PCeAokFIfQiN+azE
 3rmQ==
X-Gm-Message-State: AOAM530nVmFbbvkhKRqulfLtqG7nHQeo12N3UXl6AIfjeyBeS0EpR6sl
 bFopxVexFrdicICu8cU3nHkl9Q==
X-Google-Smtp-Source: ABdhPJxnmuuY3lnz4VvgizExRa+6gf19qnjUUQPH5Eht2f/FLLQxG40kaSWgQoDrbzb3/jNcfFxtEA==
X-Received: by 2002:a05:6000:178b:: with SMTP id
 e11mr206334wrg.634.1644000472142; 
 Fri, 04 Feb 2022 10:47:52 -0800 (PST)
Received: from [192.168.2.116] ([109.78.72.167])
 by smtp.gmail.com with ESMTPSA id y7sm2461881wrr.74.2022.02.04.10.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 10:47:51 -0800 (PST)
Message-ID: <3edb8e95-8be4-5e9f-d66a-5a8a92eafcf0@conchuod.ie>
Date: Fri, 4 Feb 2022 18:47:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 00/12] Update the Icicle Kit device tree
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, geert@linux-m68k.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 krzysztof.kozlowski@canonical.com, bin.meng@windriver.com, heiko@sntech.de,
 lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, Atish Patra <atishp@rivosinc.com>
References: <mhng-2b6f8784-4c0c-432f-a6e7-97052ab900e7@palmer-ri-x1c9>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <mhng-2b6f8784-4c0c-432f-a6e7-97052ab900e7@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_104755_924627_B91636B2 
X-CRM114-Status: GOOD (  16.02  )
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



On 04/02/2022 18:09, Palmer Dabbelt wrote:
> On Mon, 31 Jan 2022 03:47:15 PST (-0800), conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> This series updates the Microchip Icicle Kit device tree by adding a
>> host of peripherals, and some updates to the memory map. In addition,
>> the device tree has been split into a third part, which contains "soft"
>> peripherals that are in the fpga fabric.
>>
>> Several of the entries are for peripherals that have not get had their
>> drivers upstreamed, so in those cases the dt bindings are included where
>> appropriate in order to avoid the many "DT compatible string <x> appears
>> un-documented" errors.
>>
>> Depends on mpfs clock driver binding (on clk/next) to provide
>> dt-bindings/clock/microchip,mpfs-clock.h
>> and on the other changes to the icicle/mpfs device tree from geert
>> that are already in linux/riscv/for-next.
>>
>> Additionally, the interrupt-extended warnings on the plic/clint are
>> cleared by [1] & [2].
>>
>> [1] 
>> https://lore.kernel.org/linux-riscv/cover.1639744468.git.geert@linux-m68k.org/ 
>>
>> [2] 
>> https://lore.kernel.org/linux-riscv/cover.1639744106.git.geert@linux-m68k.org/ 
>>
>>
<snip>
> 
> Looks like Rob still has some feedback that still needs to be addressed. 

Still not passing Rob's bot as it depends on a binding in clk-next & I 
also need to reword the descriptions in the PWM binding.

> I'm happy to take these via the RISC-V tree when the bindings are set 

Great

> (assuming the DTs match whatever gets agreed upons), but also fine if 
> someone else wants to take it > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Either way, I'm going to drop this (and the v4, which was at the top of 
> my inbox) as it looks like there'll be at least a v6.
Yup, hopefully v6 on Monday

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
