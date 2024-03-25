Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F7FC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 22:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbpqKxKkoblGWKjjJBlBJffT7hpvfLflAGMXUVyiTdg=; b=Yzhhjwoj5klXKHMBD+Kw86wQ2S
	ubf9ypC9kBSCpTY7z93V9fwI7t2DoiHoWDs92r1wqlGx58VbP6ATzc8lFEvkSPf/svyPyB5R14+13
	wVhOw4Q4X4+Kmshwb8nt9FoZe8IK2CLTIUO0Ke4ic3GF9enweOCIoFnq9V0HUTtdK3k7uhURMSUkq
	m8Mr8tWCRqgN2nxOwhKGq4MsGD58OGVF6eNNsUYUYPSeVnwjJGaOgAUKH0YA11xbBxwxueBe/eoTG
	ifpb8JIKA5RSyyx7SaBV9ro6aucVsw0y8Cn1Bkm5qJqhKkvEfAJdf63MBxE0f+inSbyILtSgoncYc
	q3Z2R0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rot55-00000002FtA-2LNs;
	Mon, 25 Mar 2024 22:46:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rot52-00000002FsB-3W2b
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 22:46:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ea7f2d093aso3140106b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 15:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711406770; x=1712011570; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wHcOa7VYU3+suJaQm6vgBj/tOS8swPDZAFkLwg/UUY=;
        b=D9wlRuB2r62YPxhtGHdCUXp3ZMj7apv1DEk91MGQ3cZ35mDbhNyywFWTNk7G9Pq2DJ
         rQGYH27s75pgIAWQSIMBq9tel8XJQH0EfTPyplQ0uljpND0Mh+HIEcYR1/ZORWsu+nEH
         +JDMxpyWwkFtt11XdWQ87cemfKqKAzCGDtTSO8AdVWCFbwiLb+tlqrXkujfF7Cvc0ji1
         iPYvlhM/odiD030v3ZCPF8tuxX45xI7BOYAfShy4RAoMecyVSpu/MOY4f/tx7189Rapk
         ddCcGv8V6tJ79yU3zy+oj6cKRkoG2LnPdq1HD3WnMJLxJNhrrDdo1SEOZLXv7wx9VjqO
         SF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711406770; x=1712011570;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wHcOa7VYU3+suJaQm6vgBj/tOS8swPDZAFkLwg/UUY=;
        b=aWNrZEp9AMMuxeUlW3KOboMR54gfr6qwrfrmnEbgU8g7W6z1EhUFIWiiELVmUd4V0F
         DRnXeZswO6IF3KBJv8ID7nWY/4oTk4JH9N2znj21f0/++6QLqaF9WlSampVc8CJ9ThIy
         4u8gECKiYHtbUhZONtoKQ7jzxeRa9XuLoGWpsUAZ5/07NF+kGLZHRW8d5zqLvoXKg5hr
         hkZS4+J+8huc+l1i4M6IH1lYH3vq3coOpS+xFlWLdbjnLVYHVyMioqs3pfK+VQNwOLcY
         RLxnKE3SSIKKlJmJ7yNITW0duyfgFM+y1mr2IhckxUdROko6WWwLMgr+VtruHQAhsGs0
         miuw==
X-Gm-Message-State: AOJu0Yx9abgGFl4vk9w+cHt4KcUAlSG5zJ+OuNztbDoMDPQC/biHjyvU
	xeAvXsC2mnGslOsWCsDqCnfiNJ1aWOr6emJ8cbeFVrdVC3ghWIku
X-Google-Smtp-Source: AGHT+IGsskBw05ruPmf0/EP+uCFDCRvZkLRAuCl9THgmZS3UDX8PlyDXcfvB5JSjLJnN1c5wVEmY+A==
X-Received: by 2002:a05:6a00:3d4e:b0:6ea:b228:912 with SMTP id lp14-20020a056a003d4e00b006eab2280912mr2556893pfb.0.1711406770502;
        Mon, 25 Mar 2024 15:46:10 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id n2-20020aa79842000000b006e6c3753786sm4707302pfq.41.2024.03.25.15.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 15:46:10 -0700 (PDT)
Subject: Re: [PATCH 1/5] riscv: nommu: remove PAGE_OFFSET hardcoding
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel.holland@sifive.com>
References: <20240325164021.3229-1-jszhang@kernel.org>
 <20240325164021.3229-2-jszhang@kernel.org>
From: Bo Gan <ganboing@gmail.com>
Message-ID: <37d456c1-f0bd-1a78-2d0c-350ca25c6b8d@gmail.com>
Date: Mon, 25 Mar 2024 15:46:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20240325164021.3229-2-jszhang@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_154612_912209_218217D5 
X-CRM114-Status: GOOD (  22.71  )
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

On 3/25/24 9:40 AM, Jisheng Zhang wrote:
> Currently, PAGE_OFFSET is hardcoded as 0x8000_0000, it works fine since
> there's only one nommu platform in the mainline. However, there are
> many cases where the (S)DRAM base address isn't 0x8000_0000, so remove
> the hardcoding value, and introduce DRAM_BASE which will be set by
> users during configuring. DRAM_BASE is 0x8000_0000 by default.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/Kconfig | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7895c77545f1..afd51dbdc253 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -247,10 +247,16 @@ config MMU
>   	  Select if you want MMU-based virtualised addressing space
>   	  support by paged memory management. If unsure, say 'Y'.
>   
> +if !MMU
> +config DRAM_BASE
> +	hex '(S)DRAM Base Address'
> +	default 0x80000000
> +endif
> +
>   config PAGE_OFFSET
>   	hex
>   	default 0xC0000000 if 32BIT && MMU
> -	default 0x80000000 if !MMU
> +	default DRAM_BASE if !MMU
>   	default 0xff60000000000000 if 64BIT
>   
>   config KASAN_SHADOW_OFFSET
> 

Thanks for this patch. I did something similar in my local nommu
linux-6.8 tree in order to run it on the S7 hart of JH7110. I have
another suggestion for you. Perhaps we should also make TASK_SIZE
configurable, and let it default to `0xffffffff if 32BIT && !MMU`
and `DRAM_BASE + DRAM_SIZE if 64BIT && !MMU`. Currently TASK_SIZE
is effectively `0xffffffff if !MMU`, which doesn't work if I run
rv64 linux-nommu with DDR that spans across 4G boundary.

I see there's another patchset that tries to define TASK_SIZE_MAX
for __access_ok(). Looks like that only affects the MMU case, and
NOMMU is not touched. My aforementioned change won't conflict with
it should it get merged.

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
