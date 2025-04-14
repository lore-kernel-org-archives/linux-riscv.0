Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E3BC369A2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 18:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgR21r4FVH7sWZ2obns8rr5W1GnjXhe181M0jX9d4+0=; b=WkYGWFUtehuXi0
	KWt3+0sYCNfh5CFTNxNL/GEyhJ3gHTB3wVLf8zmmmwNbOUySiQIpYJi+Df9HhJT5bmxDu8W2pBnyb
	ldU2G636gJd1R9WjAGGbkr/2asVg0eoAcaEf6Lw5w/vSOxFduI4bTNMdrKJGdnpgiv1KfAdfiALAL
	JiZqrXD3a1lW8ZEXR4XXigAkOWpV5xb6THkLzW488N0KDOciwqwqGkq45/VmBUC5D+NdX8vdjpWFq
	odZD186fpZtIl0KXB/L8QnIKAX1OfK51nccg4i5BsoSKT9J5oSk3mPMcORAJPASssyPD8YQ3Rl7KG
	2oWUgGNzICzz7ib6WHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ON7-000000034ao-1fw6;
	Mon, 14 Apr 2025 18:17:29 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OIN-000000033Yw-0nTa
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 18:12:36 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-85de3e8d0adso82683439f.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744654354; x=1745259154; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uo0iy7MAQ4hbf5+c4Te/phX/shJ7ZZ2Na/tgJWtoOGQ=;
        b=miaNbFst6kco+Exk/jEfiDRmB8d0z6+nSfqeeKvlCnpJCcdxKQvayQzqQQLkWliRAt
         1jZ/ve9BConYnh+cMd5OZ2CfhSZ2Yc1vNZMF4UOC+w84af4P7QR3HHHD5uIzkZ0zs1Am
         M991cALymBA6dl/+vbKJ3u4JBGDexRapLoVXuEJIKYMAkyChvnraowpdPJLal6YkIGPw
         1m6D7Ynz/2x8x7T3zYDAcZ1E6F8NweEyo/KfZz5ng5rZP1+6j9BeI1YAsBbLTweC8iv2
         kOLg1kUysA5JvwFn2cNvWPJRr1qifN36zB/Uh7jDyezvbrrSqsfkrKFUQPEaQoOQxK7u
         JYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654354; x=1745259154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uo0iy7MAQ4hbf5+c4Te/phX/shJ7ZZ2Na/tgJWtoOGQ=;
        b=QP38h4fEI1Zt+PzlOiN2eMOB83M+dyalEmqaXQGPIX6GUJQUMYJ93vv9VFjgS90x9t
         4DxAlPdCmyLs5azEHQY7+rg3zqvNsIirO8sZoxEjxUhj7PHjJFTOoiHkh21ELl4eQbpx
         fSZSmhJhktKVYEdGfgllXBSXNUxw0YQubJ2wpX66ZFYmbCc2mB96QyGKZzJAU/D2+mzR
         5WW35NpJc4swrqdNXAnHpe9hKMxKb9NhhCrgMgkg9kajVz+5sJCwep5lV3iN7NN4ruFi
         YaErfjrBvUNluzTNdQ3c4J4hmf/+LFsR8aSGUmyiDIO/VAp3n3Y+97cBdTS5VtsRM6Ya
         aDRQ==
X-Gm-Message-State: AOJu0YyHAb1SNMwIDlBi1/S/sDy5J40gpRHYjxZ9I1RTawhSP/UovW8t
	t/Z9GSdXZfV3CzGsnDX0Sqn3kEJVx8YZ5FFgAX038EPCQCIkWBDTDjuOgih4l8U=
X-Gm-Gg: ASbGnctKWxSuymnRe50AfSr5XnynkzRVYUeJW2iFZJffO5AWlc09A/8jvv6ytFx1YC4
	HvoNKx2lblph1vyKzBumpVhhdHh7AmcrEl3q9NgW1fTHTa/rUVu5iqyMnY35//ofdC4mypbF2vF
	5w7z6G6rDWZp/8T5p4Z1U2SKPidSzPdhefW9Si3EgD1eCe1xdoyGq8oAFviQ0b53EDBQScdn2Y4
	P3mtjkfnJjBmnPZeD+v4g5tKR1LJLRb3tniAdQ1Gt4vIoAcJRyx+qwrI9hIxqP1E8/NeMTqP+td
	0xWNiPHu8T26NXz4VuVD00PrBaa/Q72TeFnF/mhDPn1v+5GwyTM44HbQ+YnBqqI0jicsVp6QeZ7
	WRBqD
X-Google-Smtp-Source: AGHT+IEPulg8UQUye+ERWDwcR54kMX3JF3oXHebpwxdb/gMTX99uIyKUf+GhSeeH3MJ9K8PzDd2i+A==
X-Received: by 2002:a05:6602:3890:b0:85b:3e32:9afb with SMTP id ca18e2360f4ac-8617cc00bbamr1642828239f.14.1744654353950;
        Mon, 14 Apr 2025 11:12:33 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165428af3sm219588339f.15.2025.04.14.11.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:12:33 -0700 (PDT)
Message-ID: <eadb0ac9-f46b-4525-a198-0c6c289084f3@riscstar.com>
Date: Mon, 14 Apr 2025 13:12:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] riscv: defconfig: spacemit: enable clock
 controller driver for SpacemiT K1
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
 <20250412074423.38517-8-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250412074423.38517-8-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_111235_235280_48D6B0D6 
X-CRM114-Status: GOOD (  13.17  )
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
> Clock controller unit, or CCU, generates various clocks frequency for
> peripherals integrated in SpacemiT K1 SoC and is essential for normal
> operation. Let's enable it as built-in driver in defconfig.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

I know Inochi wanted this to be "m", but you can see that
SOPHGO sets it to "y".  Meanwhile SIFIVE uses a default
value for its CLK_SIFIVE and CLK_SIFIVE_PRCI config options.

I'm not going to solve this, so I'll just say this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
>   arch/riscv/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 3c8e16d71e17..4888529df1d8 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -250,6 +250,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
>   CONFIG_CLK_SOPHGO_SG2042_PLL=y
>   CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
>   CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
> +CONFIG_SPACEMIT_CCU=y
> +CONFIG_SPACEMIT_K1_CCU=y
>   CONFIG_SUN8I_DE2_CCU=m
>   CONFIG_SUN50I_IOMMU=y
>   CONFIG_RPMSG_CHAR=y


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
