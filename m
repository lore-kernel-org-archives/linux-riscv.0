Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0383AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiqCgc7TkKNxXS9t5A1oWljeouNJ5fwWNnSBZc1X1Y4=; b=uhIOX2pPrxpphL
	2LDV3InZ9zcUSYt+uFrdRLJMbZPAJGyG2oJ7FDgigVOUml5ZqV6yl6cP8SphcGkJKuHgkiKdMXsVV
	0jaou434Z9N4wQlv7W7hSNi1dPXrFi7cAkIeEbXFFq2SI/xY4mEkr/8aPwryFV1HobyDuGokDX9Lg
	kTRvS0shPPXhesX7jBROmwJNTdTao0CF8rBdDlzzzGujiXcGQ8n61zG1YmdV76LNibkbj0VGlzRj4
	/9PWSCwd1S+FD++djQ4cHr9U/zWw53QJenkiqHqxQlKeFyd6DT25c0W7hE+Pcxjl8kgtg/gzEyvpx
	Jlfcv9e3oBFvOLkkV+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntslP-00BYNM-4x; Wed, 25 May 2022 15:17:31 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntslL-00BYK4-P7
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:17:29 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1E6C23F1FE
	for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 15:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653491840;
	bh=fsgCZw/xRNXiy6OJN4APf5lDTp10s7xR3Y+a1NWVZTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=kRnCD55jy5NJzFKeRVfL+FfRSeSSXdxYm4YPa6AYW4/WX2/br6cSKn91qFQvzwz8g
	 +28ccWjj5YPhiEkqlSOD1SzXzO4w9gIihwUc30RDUxiCI4lE3cfgfT/5kZabKZe9mn
	 vN8H3UGnFQVbpk/QW9QeVlzbyduRCqlnw4tYmUukR+s30RxGqX7rjXKUQ6KEzPDi1a
	 dJvPjab9OivHvIfTveWyWfpM5gL3d0MC2gecoRQgbhMiB5KUesYgPShNu74Y9OLh+Z
	 +dmXxN+IcFK94pvv/ZKmMV17ZRrYpBHmF6rJ4ey6xqkHpom2PzOiHEeD8Z4cxI/YUJ
	 j1qDN90a2h9JQ==
Received: by mail-ed1-f72.google.com with SMTP id j7-20020a056402238700b0042b9c2e9c64so2723519eda.19
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 08:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fsgCZw/xRNXiy6OJN4APf5lDTp10s7xR3Y+a1NWVZTo=;
        b=ImR5faMUPoFZ1z8QRi7OFOccOTWF0pvu2T+l2BEVtAkF0iFf3XjyUtaPFUd3JjbG1a
         udNNNHA1ecLecXOceiFK+1tHZuXAr1xnti/JsHmiYScLqtTs2IK6XLGN3uc8LsL0hliy
         lLnO3YwUHpX0Ra48xETuHVVnbb7BNM/2QRA13tRDjSPmgllVQpikGgsA0WmjI53VBxD5
         mZfeSWoxQsME/c8foG0+Ogkq0BN7AeNVVdOFoQiZWMTAymFQ1ooq4bSf5BnnIFC/z4i/
         StwFVgwEsU6gyYpq6rVmdlpxbM+uXYI2QZ4dC5NfCrmVIHYnr07fx+akkOOp8TQPxLG9
         dtHQ==
X-Gm-Message-State: AOAM5333g2JJirrXmFdRTwHbqkJrqoAPIm5otOcAVYI6b87TLjbWSj7/
	lMDNPA418PplhcxqtiR9pPKbL8jwnOIKgm0O7+khyaVcDU3tJ3nh9iW7/fv14SJVWllvcrOgD2v
	IETqzWCa2poXNp8aE/dUVXPY/mQNkyPVAk1mPsLzZttFLmA==
X-Received: by 2002:a17:906:5d10:b0:6f4:e263:b574 with SMTP id g16-20020a1709065d1000b006f4e263b574mr30508005ejt.435.1653491839763;
        Wed, 25 May 2022 08:17:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGEBbYA4ZthguX/6ezk6GsjZqOLHUOp5YalEv0cGTth685wa7GG2o5INcUqyTuzNjzdCdFVA==
X-Received: by 2002:a17:906:5d10:b0:6f4:e263:b574 with SMTP id g16-20020a1709065d1000b006f4e263b574mr30507981ejt.435.1653491839485;
        Wed, 25 May 2022 08:17:19 -0700 (PDT)
Received: from [192.168.123.67] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id y16-20020a056402271000b0042b6a84b230sm4559765edd.90.2022.05.25.08.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 08:17:18 -0700 (PDT)
Message-ID: <09b050e3-b8e2-fc58-c4cf-e1c81c5eac84@canonical.com>
Date: Wed, 25 May 2022 17:17:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/5] riscv: cpu_ops_sbi: Support for 64bit hartid
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, Sunil V L <sunil.vl@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-2-sunilvl@ventanamicro.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220525151106.2176147-2-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_081728_135746_CEDD8A38 
X-CRM114-Status: GOOD (  17.85  )
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

On 5/25/22 17:11, Sunil V L wrote:
> The hartid can be a 64bit value on RV64 platforms. This patch modifies
> the hartid variable type to unsigned long so that it can hold 64bit
> value on RV64 platforms.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/kernel/cpu_ops_sbi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
> index 4f5a6f84e2a4..efa0f0816634 100644
> --- a/arch/riscv/kernel/cpu_ops_sbi.c
> +++ b/arch/riscv/kernel/cpu_ops_sbi.c
> @@ -65,7 +65,7 @@ static int sbi_hsm_hart_get_status(unsigned long hartid)
>   static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
>   {
>   	unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
> -	int hartid = cpuid_to_hartid_map(cpuid);
> +	unsigned long hartid = cpuid_to_hartid_map(cpuid);
>   	unsigned long hsm_data;
>   	struct sbi_hart_boot_data *bdata = &per_cpu(boot_data, cpuid);
>   
> @@ -107,7 +107,7 @@ static void sbi_cpu_stop(void)
>   static int sbi_cpu_is_stopped(unsigned int cpuid)
>   {
>   	int rc;
> -	int hartid = cpuid_to_hartid_map(cpuid);
> +	unsigned long hartid = cpuid_to_hartid_map(cpuid);
>   
>   	rc = sbi_hsm_hart_get_status(hartid);
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
