Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A2FC54E76
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Nov 2023 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nm60a0XbVkejgb3LNNzww9upvgZ4yY0d+j2Ho/ia38k=; b=uphLZS6DvmYF6F
	DM8/d+qOtvx6cUEeMwRWRFqiEnb4F6CYgkixcoJs8cCS/+pzXGGwhiiG8ZVcszJnY6zgetwMUTWSi
	fRbbMFhpinnXGcsdwKEo3ZPbtdUTv9DqibK+OojVWMBHJOSD/RBTaMwmooi8mcQseVU5Cv5WBZDcP
	uvMoiJyXtfyrOv7HNNrqe2/l25VTFEZyIkt/oTd3vvqBmRV/qj7s9vE71GD6VYakI1IxRuhg4+A2r
	fNCINKJOKSCjTImh89GdfT/tUQEApXTWkrtV1ZQf4dnBp3IYKJS4x7LkyAXN6htyU3q2fObCGl4lx
	yr64ep3Kct2DoLhvXUaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4jUb-00AKEH-0n;
	Sun, 19 Nov 2023 15:13:49 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4jUY-00AKDs-0R
	for linux-riscv@lists.infradead.org;
	Sun, 19 Nov 2023 15:13:47 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54553e4888bso4860605a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 07:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700406824; x=1701011624; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yWAtbIooyuc/CuBl8mY6pKFXQyITKttWOARZ5vyufOo=;
        b=RoN1OV6Wh1F6Poi5BN/+w9qZ4aBovMHKM0rY6zZ+1cjsbiecitNV2XZ4RBzq/3EXGy
         q3kcdVZt0zxyjLCLUIZv16FjbmLQZmJgSG5GWUlljl6w8lZd5KEksbuuJ5163CoEE3xM
         NU/2HEMpclYD0ElRZl7Xq/J9nHJkC1TvnY1o6gIzTR29QiDTLhbH0GW9EVwhnUFIzz1v
         UjfqQ2MEgCNVivl6Vuk5ebadgMhOi8aV1Q7kcIGdAOhfPAhXkp6cACC7egwFCMlO16IY
         73G/vueuM5RpK/XQwLp2QYzr81hFqXSZwXPGVz345euojm9jD/Fto6BEIWzmMdMLTFpS
         x0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700406824; x=1701011624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWAtbIooyuc/CuBl8mY6pKFXQyITKttWOARZ5vyufOo=;
        b=PnpjicyI6edZMkY2CEqgTnLiTzhM6A6NLe1kbqWrfoyUGHHVSRwOe++O2nIkNLqYQc
         sv/t9JTtdLpjC366KdZ8KWCtn+on7/K6Qeup+57KaSTfQnIdUAGcyBTFaJUxe9Bavccz
         cBoiRHH39s52I9hpQqgqUFcqcoE9RlSkFZqTumHC9voh+SM3CvxuTOr61xAvbLbOja3y
         7xExJGl2DE96XSoPGRngMjGUVWFG7/n9kfa1fjaueC8zRTciDrAKgCvxIF6iAALcn2e+
         W0Zm8jF+cGdE3DKk1S8KGs3a0T/QXjlpLuibHECF0oGjTn2h5pazjtWV18P40SANVwqX
         jehQ==
X-Gm-Message-State: AOJu0YyWErvcMOZFs2KHGhWRbu9QCjuo4mnf0ABnErEeko+0ObwclDPY
	J3h28di9rdgKRqpQzFEmyPQ=
X-Google-Smtp-Source: AGHT+IGYYUUvO7HcoW0SdgOyqaCUO2uzrdJQI+mIteCf2HisHiPtznU3xIiM55eyJrI8tvjoToYGJA==
X-Received: by 2002:a17:906:c509:b0:9ae:6a08:6f53 with SMTP id bf9-20020a170906c50900b009ae6a086f53mr3422870ejb.63.1700406823182;
        Sun, 19 Nov 2023 07:13:43 -0800 (PST)
Received: from ?IPV6:2a01:c23:bde4:3e00:9589:aeb1:adc4:e0f? (dynamic-2a01-0c23-bde4-3e00-9589-aeb1-adc4-0e0f.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:9589:aeb1:adc4:e0f])
        by smtp.googlemail.com with ESMTPSA id a10-20020a17090640ca00b009fc22b3f619sm1036080ejk.68.2023.11.19.07.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Nov 2023 07:13:42 -0800 (PST)
Message-ID: <9c1e9488-4fba-480c-850f-f6f9ab4a69a3@gmail.com>
Date: Sun, 19 Nov 2023 15:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] support built-in ethernet phy which needs some mmio
 accesses
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S.Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org
References: <ZVoUPW8pJmv5AT10@xhacker>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZVoUPW8pJmv5AT10@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_071346_177886_E7C7BB1F 
X-CRM114-Status: GOOD (  17.24  )
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

On 19.11.2023 14:57, Jisheng Zhang wrote:
> Hi,
> 
> I want to upstream milkv duo (powered by cv1800b) ethernet support. The SoC
> contains a built-in eth phy which also needs some initialization via.
> mmio access during init. So, I need to do something like this(sol A):
> 
> in dtsi:
> 
> ephy@abcd {
> 	compatbile = "sophgo,cv1800b-ephy";
> 	...
> };
> 
> in ephy driver:
> 
> static struct phy_driver ephy_driver {
> 	various implementaion via standard phy_read/phy_write;
> };
> 
> int ephy_probe(platform_device *pdev)
> {
> 	init via. readl() and writel();
> 	phy_drivers_register(&ephy_driver);
> }
> 
> int ephy_remove()
> {
> 	phy_drivers_unregister();
> }
> I'm not sure whether this kind of driver modeling can be accepted or
> not. The advantage of this solution is there's no hardcoding at all, the
> big problem is the ephy is initialized during probe() rather than
> config_init().
> 
Answer depends on what this MMIO-based initialization does and when
it's needed. Is this initialization needed only once, or also after
PHY power down or reset or system suspend?
Do the MMIO addresses belong to a specific device, e.g. MAC?

Depending on the answer a platform driver under drivers/soc may be
the right place.

> The vendor kernel src supports the ephy in the following way(will be
> called as sol B):
> in phy driver's .config_init() maps the ephy reg via. ioremap()
> then init via. readl/writel on the mapped space. Obviously, this
> isn't acceptable due to the hardcoding of ephy reg base and size.
> But the advantage is it delay the ephy init until config_init() is
> called.
> 
> could you please give some advice?
> 
> Thanks in advance

Heiner

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
