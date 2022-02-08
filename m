Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B788EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 12:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4+BbmvaV/1sFFpHQyrmm8w7wWv2mSdUd5xIsPU8hbU=; b=T23QlZ4+1H7DlM
	XbSuUKH67O6ZykBL55pP8ncs5XD/TuQ7qGMv5bJhoXoQPnelEML/KYUgfm7BGZKCci/75X2MbB3FP
	MHDKmkTw9KjTClWK/jdvjOqnD0kji2TgmuMTWa5ZIg80+Z44G1r++T7CgecBWa1DBhygXFmaSYw8M
	rPKxWsCt0LkqrLqSuGil4U8XihWZnlThEiFk0uky/xM5dUoMlvnmHJIJBT+Fe4u3QYBUInAE15nif
	BcbTeqUqeW4bRLnwI3XJXUTF3E7o8K+z8qq1UT1X+dZLxb0i3LaGb/y/Y4PfD96uugGEXEX6K8X/A
	dKXklAZ5ErhIX3cQZCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPfg-00Dkmj-0X; Tue, 08 Feb 2022 12:32:36 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPfc-00DkmF-Sm
 for linux-riscv@lists.infradead.org; Tue, 08 Feb 2022 12:32:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id v12so1744167wrv.2
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to:content-transfer-encoding;
 bh=SBicExt4GJTldUNDteIIq7T7+TNr7gj099np1oZzyZ0=;
 b=5H3MsgPIhqt39HG1qoEatzD0Vc2QJlQKfqrcrh67yioOodrsd6sq49SPYaA/6sd5Zt
 TOy+pHA35I7ps67O93O29P57x0fxd2LOGb3w32L1+tKcxd39UzblOtVEy/igA0IFquTp
 B9L6yj862CsH3lBhGxDWuzOSXwIkMdBXICIC6RRwev2VRYGuTbAjd9Hipev7lizyO92A
 5G2pXnT9Tca5zRzi3NoFLZma5Vt0wOIExMGFk4ObG3UnLr4zedy+xPDsmOkOg+PupyAj
 gPIOlUvzqYiDccI3Z66cS8rnCdQCTECCDNPGctqOAQXe6KLs4N5xzEta+q+pQjHN329W
 34PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=SBicExt4GJTldUNDteIIq7T7+TNr7gj099np1oZzyZ0=;
 b=WBxLh4Zpxch1ExAAoIF9/osojwfTeeyQreXcbn7BbeGqoWV6BiSnegbhXxbkbthSXW
 RQvXAZ1EnOGHw0Nr/1amRPjP/ywfPeBFfKvB+2/LiWu9hjTYOy0daZwf1isAdSeO7cjE
 F5+ykhWdITlgBcasMx+500mnKIyB7Q7gPbB8Z1lEBsBH5wPTGjLSY64b89mjviDrOOU2
 wstlXgS/D+ROtoaW0BErTnQxfQ3ql+vge4pHu3/oNa4hg5cxZu6snnzjOpY7ECKSJB8q
 p1lpBN7HOQoi93A+y8u7LPa8Krv6N4hWOWCC7tj6sJvkarzouL742MJZlWaz48Yiuia0
 PZ3w==
X-Gm-Message-State: AOAM531G+JXjyg8PLTHWhSxIavZUIYYhMtU9i0czSUXjuexjyJfQtejc
 CxHzu44mmCy1L2WlgHpZE6Ywew==
X-Google-Smtp-Source: ABdhPJy3fWhX+fR9E4HyMnwmqx7EtColZdvMB80eL5FvssCvOs3KJLS4r509AHx9ak5lZBQdqv+rhQ==
X-Received: by 2002:a05:6000:2c5:: with SMTP id
 o5mr3345728wry.130.1644323551043; 
 Tue, 08 Feb 2022 04:32:31 -0800 (PST)
Received: from [192.168.2.116] ([109.78.72.167])
 by smtp.gmail.com with ESMTPSA id v9sm1831062wrw.84.2022.02.08.04.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 04:32:29 -0800 (PST)
Message-ID: <afb346dc-5119-fcf0-d95e-d7e4bd91f92f@conchuod.ie>
Date: Tue, 8 Feb 2022 12:32:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v6 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, conor.dooley@microchip.com
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-4-conor.dooley@microchip.com>
 <YgJfl5CmepRMb5He@ninjato>
Cc: paul.walmsley@sifive.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, robh+dt@kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 lee.jones@linaro.org, heiko@sntech.de, Palmer Dabbelt <palmer@rivosinc.com>,
 Rob Herring <robh@kernel.org>, atishp@rivosinc.com,
 ivan.griffin@microchip.com, daire.mcnamara@microchip.com,
 linux-pwm@vger.kernel.org, bin.meng@windriver.com, jassisinghbrar@gmail.com,
 u.kleine-koenig@pengutronix.de, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, geert@linux-m68k.org,
 thierry.reding@gmail.com, linux-rtc@vger.kernel.org,
 lewis.hanly@microchip.com
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <YgJfl5CmepRMb5He@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_043233_027810_2B0D05BB 
X-CRM114-Status: UNSURE (   6.89  )
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

On 08/02/2022 12:18, Wolfram Sang wrote:
> On Mon, Feb 07, 2022 at 04:26:29PM +0000, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add device tree bindings for the i2c controller on
>> the Microchip PolarFire SoC.
>>
>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Shall this go via DT (Rob) or I2C (me) or some riscv tree?
If you could take it, that'd be great. Rob had said via subsystems was 
his preference for the bindings in this series.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
