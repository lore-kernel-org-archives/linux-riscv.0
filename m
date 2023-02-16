Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD7CC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hG3geHmhcLWtlZokU6TmscbP050qg1j982gVPO/4N/c=; b=r15wSjjFa/fFoD
	wa1yPYHxHrHZS562AAJZqyPhF6Dwc2BEWXz0z4yC/hEqbEZEkAv9k/iOQO/Cv84fXLq3Io44/pWUb
	bgYWF4zLHOlQG5dfR0tXC8TEqX40rEnf1bVCTehhnBDhQo0ZWXSAmVveBfcRmJvlnv4z5kWLeysFl
	dq9rXpPT/QEvKpHRWLcZG0CD6C8DGT7cE+ugZnWJozn7bpP/xlP/ra7AMavFcbH/FhUD99tLljOhE
	iqR3r6RSE26qrbfJ6j7oK1ofuX+PqrsMVH4t3CFqbwe2/qEgPs+tfRYwOQyLKN1gUXxBeI/ukwvK8
	2PI/Pk9GsIEB+Ebq7gOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbOE-009WZh-SB; Thu, 16 Feb 2023 10:21:22 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbOC-009WZ1-8J
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 10:21:21 +0000
Received: by mail-ed1-x531.google.com with SMTP id d40so2067951eda.8
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 02:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kiZhCQwvLAN/WcdEDHOGFwJWYHK65TJ2+yIdtEDWU5U=;
        b=UJsU5/G0RWBnr0pdK7o1X8uJ7FXJYRFQfxjIOwjqRjGDbcANR74e9A2se117d+M5Ax
         4VpfN1H6MBH80MdE9VEsP8xIcSVbDoLPirh3zT7pBh4l/0fOG/V7NDW0BS9GcXTSzGOn
         XFEA6bYTLkJnVpqHloea08RSoWzjB9cO06RV2YCEnjthV9cWvCXIZ8wob3WDmKUTcdcd
         x1OEx+Y6LzkT4QZdKvAA+0oV5moP+NefMKg6D11WlcNxDtqKi18o2fAZa95zOUeU6JUn
         BrDacHVMqoG4eFASYngDItIKuJkXEUdr/XDWEplDQqEP9bVedlRj0Bty/GFUr5niu7V7
         TQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kiZhCQwvLAN/WcdEDHOGFwJWYHK65TJ2+yIdtEDWU5U=;
        b=vGAhU/RG9l9taW9Zn2ZMiOMXwNBz/AMDles/S/sWMXSxT1TFOIt+Tz5t0B9JRxqs/n
         gvH8ig4lpsbnUpQdF2wgyPZh0YZZh5njz6oRXbE30xvjxm+KZ2MIUobvo06FuyqAfEeP
         y2rJvzMrqy8bUaG4ekqLx9Cm8uAs9laRGIzf9FB3+rKCGk4fWURc3vk+AFHMPogAAUyG
         qKUD8LOdW7N2VH3UmT+WYcDzhyWo/Jpy9Z0A4RoXJeGLb+xRpEqdXfaqqsOdyzFmhSLW
         Rql6RmUday0YuGk1FlmBdz8M7rE2z/aOmWEJhO8lejAKatU6v0gpiO59IV+ZmdsOOwLL
         xeMw==
X-Gm-Message-State: AO0yUKVy4dQSxs35nRbOzqjwm248QVbHFx8vgnN7SL6MoIUidWg+LVc2
	k5O/qSN1PcSKtcktnaEiss6A7A==
X-Google-Smtp-Source: AK7set+Uqifl7Bor9xXuyZGiSNfoqpIyZ9ewf6xdIWS1dIDE9K/kVMAE/yboRk0mVw0cTTp63eBZzg==
X-Received: by 2002:a05:6402:12cd:b0:4ac:c3ea:47e0 with SMTP id k13-20020a05640212cd00b004acc3ea47e0mr5786141edx.14.1676542878586;
        Thu, 16 Feb 2023 02:21:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m19-20020a509313000000b00495f4535a33sm617932eda.74.2023.02.16.02.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:21:18 -0800 (PST)
Message-ID: <4bb1e640-475c-8516-2f73-ddfa0a3c23e0@linaro.org>
Date: Thu, 16 Feb 2023 11:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/4] dt-bindings: mmc: Add StarFive MMC module
Content-Language: en-US
To: Shengyu Qu <wiagn233@outlook.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-2-william.qiu@starfivetech.com>
 <TY3P286MB26111053410F3F96C9C71D2798A39@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TY3P286MB26111053410F3F96C9C71D2798A39@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_022120_330950_3A038347 
X-CRM114-Status: UNSURE (   8.29  )
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

On 15/02/2023 12:59, Shengyu Qu wrote:
> Hello William,
> 
> Are you sure changing driver is better than changing yaml bindings? All

What do you mean - changing driver? This is new driver, new code, isn't it?



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
