Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D6EC369B4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3ikg8w1zwKyGhWNBg1CqBhsAfpTEncWgVlRUFqgvSA=; b=hb71Hm9JCUvL0c
	jYOkOpji+jclOu9ikGOUCJkfN5Y5Jusn5RuS1Y/mcwuqdPWLiEjFVfBTG7yq2e/VT7Xb6ZWxZ3iPE
	Ru8T5dHYq4ea3MIXoI18cKqXAT4wrZGTgsJkN16yYM27Co1xucwQDpjcGxiGWSaABARh3oDeryXS8
	H6PjxdUoFxocBShwfGKLGvt/s/waMXQHjgcddtE3JcHxoyRaz0dHQJIkPACgRd488R+usyrjrYDrn
	aZZtX9ioZUNTmwt0YLh8cCyRvuUfKbhk2Q+mNJJKF0/au+SHgpqJlCUkqACERe6n6QNmnxIZrikgN
	mfV5luYtv6STWijBzGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OLH-000000034BI-1v23;
	Mon, 14 Apr 2025 18:15:35 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OIL-000000033YA-135V
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 18:12:34 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-85e751cffbeso361125339f.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744654352; x=1745259152; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W++7Ey3dQSUtlzRbYLNczC2fDf4DSp323YSWaoMgCKM=;
        b=T15ib5CQiZV3twI12YBjLk+CLp+CF9jUjVG7t1RMFbjaag1HK8eofuaOaMu5oNgOo+
         bB6UVQrUMi3JHKM0w5Qy6xw/052MXA9lK144oyBb1tyo8gDwvdny67jRI+qXLFH2bh+7
         sCZ+XHxG3CoXuno7MeHZ+Jyif3Y33R8EqFiUs3cEFNvL3f7dnKbWSZ3E9B1YimrdOxLu
         M2tEEVb42VdvHmB6FxxYos/g1Qs9j6jodVxXgMyx/TFHqmsdJyVZfN3qQWZme32xxJgD
         gcN97YDwuO6IJXokq3/5r6K5SUsNBo82xUOdVxb5FeyiMdzZrhadFOI7UTuqWd80O7vH
         wEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654352; x=1745259152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W++7Ey3dQSUtlzRbYLNczC2fDf4DSp323YSWaoMgCKM=;
        b=ZUt0+0XAcavFhkF5Vw0GKqDsnPJGyzGKwPwvN2ntiuQ76qguw+QnqdfIOu1vhmXfOC
         JBpUlAVsnOGOaH9vj6DnFlILg3/96OzagDPQZsVzYYEpdonniR43ITeOxoSAmhLHvWTV
         deCDz9fTQKjsj52bJlTLkD7sYSfSLD0+t6aO445+7QXUntRkpVbaf+9JhFIeAv8Us8ep
         CLF7DfFWh7Jg6mSfuAajcffZKGjMWSVSa6t4FBHlsEtE2h3a4CSxq3SRImPd94HSILZ8
         whozNqSPa1BVl/6Cy46UlW2LuaghUMDLIhIh91c4TSogiN8Sax/nWXVbOmtJboSUJuqv
         5vJg==
X-Gm-Message-State: AOJu0YzJk4sDwWDcwDbXSuAJNWrHYxTpK/TY9JnG+WEhcZir3qCzIRDy
	iskzVTT8+zMw7iPSZUyTWzgo4JBxPuLwq+6M0yMtDFu5DT2TKXxFmDcyHg0AmQE=
X-Gm-Gg: ASbGnctG/3iYwvP2rVT2p80gxzi7odgPzwrTgg376JnIQYI1Nm+T+/L9MC+t4PGfwZR
	17HR28hjXufCkQRUDklxNOrrxoFDzQS9dCVifAhVc2YzMaJmh0uv6Hr7HgUDQiJnwUj+QMCKiVQ
	qTZ4eTqvz/CRPJr4EJhrMJZxEum4YmGpZprmSy9jjUgKd3LLmW2lJxpfVQ3PNkImKkGSlJL7trq
	kbclGovFAKe8SwVfC2CCtIb+0qB+TNql0xvxZ0YkMc96gKlTKmzFbGhun9winZTGHJZ6uX/1bz2
	VxJsTix95K0htAwGquEi7flDhsxexZQOhGlta32+o+jFkfOVlqX68S53uPA4ZMjnTZFjyuXVXtT
	543XP
X-Google-Smtp-Source: AGHT+IE/wgwkbNsHlK2gyNx1GJkEELkMB3G+2KIj9Z8NP9udlt6BR88zVmXF8+R9i96TFdJe49eIEA==
X-Received: by 2002:a05:6602:728f:b0:85d:a1c4:ee03 with SMTP id ca18e2360f4ac-8617cbbbb51mr1548100739f.7.1744654351717;
        Mon, 14 Apr 2025 11:12:31 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165428af3sm219588339f.15.2025.04.14.11.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:12:31 -0700 (PDT)
Message-ID: <b557a075-a184-4234-9793-ca1d13eac9df@riscstar.com>
Date: Mon, 14 Apr 2025 13:12:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-5-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250412074423.38517-5-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_111233_434188_26FE0F9F 
X-CRM114-Status: GOOD (  11.27  )
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

On 4/12/25 2:44 AM, Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy

s/atomiciy/atomicity/

I think Yixun can tweak that for you.

> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

This looks good to me!

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/Kconfig               |    1 +
>   drivers/clk/Makefile              |    1 +
>   drivers/clk/spacemit/Kconfig      |   18 +
>   drivers/clk/spacemit/Makefile     |    5 +
>   drivers/clk/spacemit/ccu-k1.c     | 1154 +++++++++++++++++++++++++++++
>   drivers/clk/spacemit/ccu_common.h |   48 ++
>   drivers/clk/spacemit/ccu_ddn.c    |   83 +++
>   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
>   drivers/clk/spacemit/ccu_mix.c    |  268 +++++++
>   drivers/clk/spacemit/ccu_mix.h    |  218 ++++++
>   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
>   drivers/clk/spacemit/ccu_pll.h    |   86 +++
>   12 files changed, 2086 insertions(+)
>   create mode 100644 drivers/clk/spacemit/Kconfig
>   create mode 100644 drivers/clk/spacemit/Makefile
>   create mode 100644 drivers/clk/spacemit/ccu-k1.c
>   create mode 100644 drivers/clk/spacemit/ccu_common.h
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>   create mode 100644 drivers/clk/spacemit/ccu_mix.c
>   create mode 100644 drivers/clk/spacemit/ccu_mix.h
>   create mode 100644 drivers/clk/spacemit/ccu_pll.c
>   create mode 100644 drivers/clk/spacemit/ccu_pll.h
. . .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
