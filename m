Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5356CCDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 03:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18LK6fGHcn6uzO+Gts6GhocD8Vz+2lv83nWVe7b3Vr4=; b=jzNlburOGPWrZq
	toSzBkssm+wv26KyFcn6THJUbQKG/k7q+g8WeKA9ETFZAhdPiyTZSIIunnM9AYJwU3+nCqltdviiD
	SIg2p1fNmOwETU1rzD5Mhp6LReLd4u078C9cLtxRkDvnGkwapIrxt8dhKyvSWwsZ3Aa69bAZxjRQi
	1nPYQIdmQQGcL5IDTtgfzAInD7Gz4EV6b/8ZEBJspSEKLNrgDo1kHhWLbOmSu0iheErWeWOAVFnlt
	gwiMl8Chp4vWSo0abCep928gRitbTu85qyA5xNJlNTBv+R1F/n3G0RrSvUxEJQOlf06xZXiicE3tQ
	R85MVtFTaqPQgl0QBonw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr9A4-002PLv-29;
	Fri, 13 Oct 2023 03:48:28 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr9A2-002PL5-1w
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 03:48:27 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-77574dec71bso110737485a.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 20:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697168904; x=1697773704; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/bLx/QnF9DZpI8qQpke6z5SOkCwKTQG6V1/tyz21m0=;
        b=e9uF33JA1fXvzCsuM0qEr+QpCPFYgmavXnJ5ihXXqJh/EBK8wcUDVR00HTAQ1TJkT0
         Pj/dowlZW5qYjHRxXjupteY2GDInwdXE2o1NT0eCx6uw2s0tz3SLz9YY0tg2Z8R+MmAF
         pcqvIF3nHT2Epcuql4h9aVmey0oDzFooeVQtLRVb4eC32nqJEmHQPEGESCaPA7EBYAIj
         ARdTFjmDMezwZF/tzZiPTQQgnJqMRdeu6YpaIrzGXKcJ60hV3v0uM/bN+kithHL6WBJj
         QtfrjVEhF0EvxtSntUiD7t09Z9KA2DtZZUpYNPiIV4Pw7zLMHQ4lMpBVAZST5R5R9Lxs
         lVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697168904; x=1697773704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/bLx/QnF9DZpI8qQpke6z5SOkCwKTQG6V1/tyz21m0=;
        b=G81VaIUO6M0NSvEAgpDXloG7ky6xPRGCjB1XlJ0gQjW4/VAMXefL5VDK2+BQlkaKck
         JIghLgwbtLOyv+VwgwICrqzxdD3F1JII1cfYHE/tESEF2W6o8DZ4KbiVrFbgoM2PCzRB
         43/M0cv8sXDT6A3SnkpSCuV9bEpHV46bNHNUs/b05a56OUiPrUiOBiVaulTUX1LS/ZUE
         xRo68Ih/JWdF2TXAUn7JWfvS22e5pRYkG4cbjbpgZvsnxCzhR6nu8WTULfYlcVDBX9V4
         c2NEqZLTIvcV4rZ4aFEkMH+F/cgq+EOteb8EYcePeN2kyE6sb0xHomfaok5uM9frj7nJ
         A0HQ==
X-Gm-Message-State: AOJu0YxhLMp493n6AWd3emmhL7RBGlj1X87vyaPnLhC3DrhenZEoC9aA
	O9eDHIPemtsh8yKyf9d/d0bc0w==
X-Google-Smtp-Source: AGHT+IGBCO2BhPBI7Egofzh2a/Bvg2YjU5mMORKm8p1D5BNV1E192Duha6OFKXXfdCrw6zDAMlopjw==
X-Received: by 2002:ae9:f444:0:b0:774:2ab6:9cba with SMTP id z4-20020ae9f444000000b007742ab69cbamr1711977qkl.78.1697168904141;
        Thu, 12 Oct 2023 20:48:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:4485:47bb:b3aa:6a7e? ([2600:1700:2000:b002:4485:47bb:b3aa:6a7e])
        by smtp.gmail.com with ESMTPSA id t27-20020a05620a035b00b0076ef3e6e6a4sm312913qkm.42.2023.10.12.20.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 20:48:23 -0700 (PDT)
Message-ID: <6b3d63f1-89de-4bff-88ce-2da775d4a416@sifive.com>
Date: Thu, 12 Oct 2023 22:48:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] riscv: sbi: Introduce system suspend support
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
 conor.dooley@microchip.com, apatel@ventanamicro.com
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231012072148.7010-4-ajones@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231012072148.7010-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_204826_650940_10DFD413 
X-CRM114-Status: GOOD (  10.89  )
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

On 2023-10-12 2:21 AM, Andrew Jones wrote:
> When the SUSP SBI extension is present it implies that the standard
> "suspend to RAM" type is available. Wire it up to the generic
> platform suspend support, also applying the already present support
> for non-retentive CPU suspend. When the kernel is built with
> CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> Resumption will occur when a platform-specific wake-up event arrives.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig           |  5 ++++-
>  arch/riscv/include/asm/sbi.h |  9 ++++++++
>  arch/riscv/kernel/suspend.c  | 43 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 1 deletion(-)

Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
