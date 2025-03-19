Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E06C35FFB
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G75v173E+jgioGCN3H2+7mMHOLUS4F3kIYUWiTSFl6c=; b=I+TKr5K0FTZW1h
	1XZwjq8WZyl4JSsZMc9rBi9PhKwYZUy2uvGtp+pxCxqMQzBED6FK5GI5UCQ1ZmYc2HUtrh+gz7j3D
	i0TrbckBXI9pNIV99uNc9U6ykqFj2xwVFEYZFU2yagjyhpHk2ZX4ez0Ubet5eMLJNeQdG23QEzXY7
	wc8iTuuwmWOjgtcLD1kH5qzcM1mDr5GQtllIFrhqr0picnJ3PSW0sn9UpxVJ7DfCWTrWI8sItLPC+
	Lk6a7RUoIZFUC3iQadp6fqwZCVJ/ZgremfwylowM1hWazgYQB7YIg5FXsHLPXUbbhLGKSWq6f67SG
	k8bSz1q1tIHdPqt1WwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tusl5-000000090S9-09TT;
	Wed, 19 Mar 2025 12:42:55 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tusl2-000000090RM-0TZv
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 12:42:53 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-85dd470597fso139117139f.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742388171; x=1742992971; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyeWtEw8zSEmdt2B2rWBlorZy53Vw89+CNeJItSMOLA=;
        b=RYt70f6h+cDDKqCPXzvngifTSUl3A3DiRYbgGHciNpxYS8R2Q90nW78WR73K5gT9th
         b2JyNkw5+1l+SlFZ5SVuXNMg7mpEZ6eGKbXV1xTqIPtBcvm3GauVBh79cxBYh3Cd5tTT
         /4LPy8BMpZNQWN8n9m7j9OBX3Gj8xxYzfvuLdzsRxFR7LJTlKtQGlBSSjnfrm1uGMdNP
         QTXMyzhUxDP+aZ4ms0d5r0ygECqVcTqNvCZWsNptH5mB6t4N8RXMBciCTOJmVGtHjKq+
         v1q/38uY9N/dmvZEIrCmI8CIyuQ500pUWtVM25Wl1WzlIwMgobH0UVAP8Uw2rTWfzLDl
         Mxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388171; x=1742992971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyeWtEw8zSEmdt2B2rWBlorZy53Vw89+CNeJItSMOLA=;
        b=aLLA98FMuoNNnW/dwKdt0zpO3wB/b8GzQ4v9WbNNTGpJ/rpOjAdGg3WxY4S6vDjBMz
         L+xY2YHyOycBqOUVvQZKb8ypsoziOr9dIs46sRBZjToHE/FN8plWla3vXlnF87Zh/b/X
         nMTxwORYAFxq/PATUmCeZe8kaDzBcvOeQ0ZyZncdKTId4CLZZLxUkQLSfsDKGxiXQ5Mz
         Y2SJ/7mwPl0xekGsS46zZO6Ncsd9zcm2R90I7MyxxZhVOa1Yk3vfNFU7NCPXizmbaOa0
         zd3EacR4PE0Y1IVgvZQfnwgQrGqIf4wrBunloqy/BqwkLgUVvp4BgcdFHnz8vhYmoDm5
         PQ2g==
X-Gm-Message-State: AOJu0Yz3HPgoNDD6mKhe/AyboMUiqB6UcEagIWXY6ohrLHI+FJNOwbw3
	s34JfZ3buy9s1NvMEg9t14GcBVwkoyXjHUKplHBmauyu3sG0GXsmfcwN6JZET0g=
X-Gm-Gg: ASbGnctTJzKTjuftwtOhhm7nEzkWRyRE6vf3w8toor+TQ7uBdDqyCiBkEoHbsITKyck
	WThEsToSfYlmxMZQV9Iir1auwmhUYyf3bhUKJpZIlOuter1cvLCS3iJABg4Fxd6IdFjzL+m29B6
	lwboUTi5lO8vxAd4I4nHYzxRA6DTwAjX+EBsUdY50Z5T7URVD+2kq6tOvUFSuJomlhlAif1oG8T
	L8Dq1gSwg3HS/LLRAkp0eB9zNGFX4dxHmgVi1R+bLKbpQOvYZ3lmXeg8KQY4vkrB8H4XjXXKQI6
	eO9edxhwONzGgT6BPHr4fn87OFWxZmzXioX5XqwU1SghVGPRdCrCFYB+W6hyUmBP+IxzaJm81Dh
	tLeK7F8v1VI+OkKjtUg==
X-Google-Smtp-Source: AGHT+IH7sjljQM+QmrKBokA3matC2RiNwzx/l2tsu1F5XWLbsNSdMzt3SBx/tCoCiYaMZ1SyjlQ1fg==
X-Received: by 2002:a05:6602:388a:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-85e13870076mr284771939f.12.1742388170792;
        Wed, 19 Mar 2025 05:42:50 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2637fb184sm3185854173.92.2025.03.19.05.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 05:42:50 -0700 (PDT)
Message-ID: <967f135b-9592-4f85-86f9-5c3e31123c3f@riscstar.com>
Date: Wed, 19 Mar 2025 07:42:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
 <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250319-k1-i2c-master-v8-2-013e2df2b78d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_054252_400819_1642B40A 
X-CRM114-Status: UNSURE (   9.46  )
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

On 3/19/25 4:29 AM, Troy Mitchell wrote:
> This patch introduces basic I2C support for the SpacemiT K1 SoC,
> utilizing interrupts for transfers.
> 
> The driver has been tested using i2c-tools on a Bananapi-F3 board,
> and basic I2C read/write operations have been confirmed to work.

So you removed support for the clock-frequency property, which
addresses both of the things I commented on in the last version.
This is great; I hope Andi is satisfied what anything else you
did and will merge this.

Nice work Troy.

					-Alex

> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> ---

. . .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
