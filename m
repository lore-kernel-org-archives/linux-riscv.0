Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4C7C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 03:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLUzqzpjk2fX5onS4GwDYXzi1hlUnCCE84l2mvrgy1E=; b=tPpOTuRTvZu5Vt
	YfRjLbjtT2E4AhcILcSmUJ5NmHA0KQhlC/uP3zAiWH1n08rwb+MYJ/xLnRgG/UE/BwbCdgE3rIEMq
	+lpagoHjYNnRTX40quIcKpE8BazPg6AbLhIA1rn8teO2qBRi8hxM+iEh9dsJAKFW13uvX7HeYQg95
	UXMAOtvzpF6mdoaFpDcHrPYUhcMioX/QDqWnDjNuhOO6hlLDZjSiXfb/RqBvubzKN1i5J5sYDBLFf
	C3n9IlAV5asPjxKDF5VIP555DtLg3VPnVsoqsxaqVNZWSDfybM8gIpt5nyu4sgCwL+AL87DtWxNc9
	NQKmhTMfcNfkTSl5pFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1IJH-007nPp-0z;
	Fri, 10 Nov 2023 03:35:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1IJE-007nOJ-0j
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 03:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699587350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8WQrDz3BrUoKfY/uV/CbjAH9j1WTdOdEvBMB5Ml9tk=;
	b=OFdj44xqUo5zv+73SqGjbHOMu1b1K3H8FyC6puIbWDHsm4CvChgrdqO7JOijDpUoekpjU8
	EsxADa76GP+2mkITBbLeSe2JWj31fG1F7HiQWtukjcCR1ZEyDZnCOERsuUBZpnog8UzT+b
	nxLPEPs7z0lcx3qtfifJyPpi7rakuPE=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-Hr41SuFcPy2cSM424pwdxw-1; Thu, 09 Nov 2023 22:35:48 -0500
X-MC-Unique: Hr41SuFcPy2cSM424pwdxw-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6ce29f5dc6cso41724a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 19:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699587348; x=1700192148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x8WQrDz3BrUoKfY/uV/CbjAH9j1WTdOdEvBMB5Ml9tk=;
        b=RlzJsYPjXYmwOoxx9ChbZjYpa5UCzncZNoGE1pEFOpLjxgNH29AAq/F9R7KSuJSIRY
         OLNEFEEWLqY28gnWzDOvD4zVKKklBjdBuh7zI7JaHiZ2hoUiUgdKuQ3Q1Xlcll+gDaCA
         bvrAlE+hJlglxiR/1nkG8tB9B67/aAWdO3OJO9Q0PJS0wUl3h9DKIsD3ZLEoHZID1MNi
         rqh57BK8uDLs2I8lrBJ8HdSWXFbeBWjAnF9wU2N+UUHIrQ6h5ayBsd7Dmkv4HMZPTeRp
         nC3ej+K4PG6f/1BDzFbJ6hAfibv1MZ9CCyigl25oIBBLzsjtJ8bjzKxTnzqrvRR7RkRV
         O2bg==
X-Gm-Message-State: AOJu0YxFWWVnvjnDBD6jnNhZHYuK3nw2bJn9d2i0gRyWzhJds+PcpeaR
	jkzgN/wmRelGJQlnz826GdLxuQBuwCvfnVfNDGysnCc3kl0e9EFOlHnD/DbelHqZJUDq4dmkwbb
	hDIMIOlfDobTgGh/MhHtQSourNEpM
X-Received: by 2002:a05:6870:468d:b0:1d6:4c63:7ba9 with SMTP id a13-20020a056870468d00b001d64c637ba9mr8173661oap.3.1699587348163;
        Thu, 09 Nov 2023 19:35:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0g1U5gqarx8cH0olNuMl9/UtKi0J1uyvc150ksgK2KoqY7BLV3KVCaBNiaCGerDe5ChRrSA==
X-Received: by 2002:a05:6870:468d:b0:1d6:4c63:7ba9 with SMTP id a13-20020a056870468d00b001d64c637ba9mr8173626oap.3.1699587347881;
        Thu, 09 Nov 2023 19:35:47 -0800 (PST)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id gu6-20020a056a004e4600b0068fe7e07190sm11450826pfb.3.2023.11.09.19.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 19:35:47 -0800 (PST)
Message-ID: <534c2679-6a2b-455f-d60c-2f80207ef118@redhat.com>
Date: Fri, 10 Nov 2023 11:35:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 12/22] drivers: base: Print a warning instead of
 panic() when register_cpu() fails
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLg-00CTxd-31@rmk-PC.armlinux.org.uk>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <E1r0JLg-00CTxd-31@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_193552_355904_5B09B4AE 
X-CRM114-Status: GOOD (  21.23  )
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



On 11/7/23 18:30, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> loongarch, mips, parisc, riscv and sh all print a warning if
> register_cpu() returns an error. Architectures that use
> GENERIC_CPU_DEVICES call panic() instead.
> 
> Errors in this path indicate something is wrong with the firmware
> description of the platform, but the kernel is able to keep running.
> 
> Downgrade this to a warning to make it easier to debug this issue.
> 
> This will allow architectures that switching over to GENERIC_CPU_DEVICES
> to drop their warning, but keep the existing behaviour.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   drivers/base/cpu.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 221ffbeb1c9b..82b6a76125f5 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -551,14 +551,15 @@ void __weak arch_unregister_cpu(int num)
>   
>   static void __init cpu_dev_register_generic(void)
>   {
> -	int i;
> +	int i, ret;
>   
>   	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
>   		return;
>   
>   	for_each_present_cpu(i) {
> -		if (arch_register_cpu(i))
> -			panic("Failed to register CPU device");
> +		ret = arch_register_cpu(i);
> +		if (ret)
> +			pr_warn("register_cpu %d failed (%d)\n", i, ret);
>   	}
>   }
>   

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
