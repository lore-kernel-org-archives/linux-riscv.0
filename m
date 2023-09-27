Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8DDE82CCF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pJPYV4KEY35mbjvwC1IrliFrSKda/hRbYB71aq89AU=; b=H7wL5T8vD2qtzS
	DQ497nNjMGJvN1bdbiY3uesjhn4KCV93Lznrq7BpAK/j1SINp5zzeZDdwbsFGf8hBXdKlsNT26xS9
	ObBWb9cFYbr1dP4uL+6L7bqHJIFvEF0d/Oc93vMbZKviyBOWUflSOmBWOqB+AN+rNejvCPym7pUg7
	ECeq0oFwqP3Av3GuGZxQqQ/1F/gwxueFk+NCL9wS0ZmiGaeGe1XuRHCd5PZ/0gH17Q9V8gnqVAe5j
	MqROisUrs70iekOSoo7r7yZhU2O56+Lmz6t+yorEkspJERekLhG8M8n/sUyL4ZZ7gl3++7BNmTCiB
	bW+KqQ0G0FPgRHjg3SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlawm-001iVK-30;
	Wed, 27 Sep 2023 20:15:48 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlawj-001iUw-2k
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 20:15:47 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-77574c2cffdso96537585a.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695845744; x=1696450544; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIIkMitTrNSDHIAlH1uq6vJrTxiNPJMdVtHBFBBDPlc=;
        b=jI/N45QlzAWFfGBfSEiFVZNajVz59Ut9J7ni1LXV3Q0WWeJGWNyFhVDXeAZ9B9sZ/E
         f77NTSOQ6UzuDqYelObezOuUcXGkBD/xcEsuPTAgR6U066Ix8h/O7/KyvNT3PeOL1qs4
         ZVXxz275DTK8BuHwyVE1QnPXU59GVBTrw4C7Hdw8LgsW2FI1dXIDrmfIOZPGm6tEE7KA
         RcfHeCg019nCdzu9y1qXK+H6SyjsNTyEAM6NcnHMrgD7CPhI6Y6pTAAeNkFkVsZxC3Ub
         H0fD1JrDmh5PhdWyUJ0+XjrqMsQ4+rmK6JCESkJO2/I1elcuPJtziXLwbb2n9iASa7lb
         eLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695845744; x=1696450544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIIkMitTrNSDHIAlH1uq6vJrTxiNPJMdVtHBFBBDPlc=;
        b=weug5S4bEWVZ0Be2IzrFReR5hfy+5EVuDGnv7jJ8Xbe3pSLMEdBXjy9cUTFWOvDLbn
         u/0GfKBTiRvsVpeg5tXZcGtu9ARnmtuQO2MVagENn0whS3m3M5Ig3tU4lnsBVhjV/PP4
         hX9klDKVK/VZfViUT0EQHR2fLRHxrVWZ+zy2UsItD5KnAYihmodcv7fmhoNrI6xvXkAf
         SsgXui33+8ayKWbrIkEKF026EHk14TxbRT/yVy7DpXSs1aReRKIsU08LiC9cfLGi/acX
         CrFS/k2ENHF22SuIWh/pX2ynMJTjJlLI2xpUpAfP7YMvjFCtgaKcCw43MOL9f74FrQQL
         7MIw==
X-Gm-Message-State: AOJu0YyLhMH/XYvS9lrIDFcrHWHsTeszV0CARgk6yxlGOtfDZ+kCG0Y8
	tHxQwphWgOkAKsf18CBkZL1/5w==
X-Google-Smtp-Source: AGHT+IGX1XnfSRNAReG5q04YfQKGoh+0IG7R+vPK7j1BQpXrbkx9xTpzlBHu3vjoMSNDJGjhfw3g1g==
X-Received: by 2002:a05:620a:461e:b0:773:ca5c:4556 with SMTP id br30-20020a05620a461e00b00773ca5c4556mr3157567qkb.10.1695845744297;
        Wed, 27 Sep 2023 13:15:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:40d8:421c:60ef:36d5? ([2600:1700:2000:b002:40d8:421c:60ef:36d5])
        by smtp.gmail.com with ESMTPSA id pi32-20020a05620a37a000b0076dacd14484sm5715366qkn.83.2023.09.27.13.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 13:15:43 -0700 (PDT)
Message-ID: <23935a29-0138-49f8-9efd-ea678a41c9c5@sifive.com>
Date: Wed, 27 Sep 2023 15:15:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 -next 4/4] clocksource/timer-riscv: ACPI: Add
 timer_cannot_wakeup_cpu
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>,
 Len Brown <lenb@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-5-sunilvl@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230927170015.295232-5-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_131545_890935_2C69D4C7 
X-CRM114-Status: UNSURE (   8.33  )
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

On 2023-09-27 12:00 PM, Sunil V L wrote:
> The timer capability to wakeup the cpu irrespective of its idle state is
> provided by the flag in RHCT. Update the timer code to set this flag.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/clocksource/timer-riscv.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
