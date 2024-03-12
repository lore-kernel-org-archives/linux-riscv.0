Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA8AC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 18:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CL2jEioEV1gMBa7mP/mMsLAjo9mH7BeZP/ABDkRuoP8=; b=Rvg6jyZygu91C5
	4kU9w23XQS8lD4pT6XInZBsAv2ETfhFYUL/76ZPOX+c4E0zi/bTVBPUiJkV/yRbDgPfKReQ6Cjone
	ze2LZ1PM4oWUgH7EdUxExwe7ltpjOtlg6zbperbqKUXODM5YX54r5cyoVcjPPIJRol/xx0gPM9zci
	5qT9vrd9xFVj3LdapokOHhFRdAVr6wcp1/A18pmZao6c/6d5eIMUspgJDGYfRXkH21uIhRfgAYepa
	Mnjg2juFxsuWlI7kmQ4CkKVvbucAhDrKQaufKmDCTXwmwrOZzT7vl9qGJ0PqCv2CQaqbxZlKaIqH/
	FR12Kom813yEdTzmUNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk6SV-00000006xQd-1ULl;
	Tue, 12 Mar 2024 18:02:39 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk6SS-00000006xPJ-3Zjo
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 18:02:38 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-78831914027so182839085a.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710266555; x=1710871355; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fp2CwN+FAZAIX1xWy/mV9+4b7wUyvhy5cC3rL2qsNo=;
        b=XJozRYOFbqD2lUlXR+5U5kNtls8jjGF3HzAXib2OzvpJUnEV2ifoXCvF6BXdrMqZbC
         NEW/ZEuE68cCkN3DnN/GfdJ2jcLqxwPQf9olb99ue8GsfeCMlbOjQ0tL1eFuHkHAOSA1
         BpD9Y46AxZfLMKfaiK0LNubl7JyDu4ZcvkciEdaWg29PPcIqF6ymp9aPpyZtrUt7l0Dq
         paQcych9NDU8rveoRCM1MzElCLjx84qI6N96AuYoIDbF60sTFh3G6d1WlcBSAtTl9KMB
         HrLGPBKQU9A5aBgBf70B21lzuTUCNnjWWkZ2PWM0zLfwpIxkFzhUR5FNrKNzrAV4FWYo
         dzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710266555; x=1710871355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fp2CwN+FAZAIX1xWy/mV9+4b7wUyvhy5cC3rL2qsNo=;
        b=sPZIAsLJaBkbdFggbvHOIE5xocemyzQK0L375woViYj2mJaYa+3o2ZuhDrH7M+Dg5Y
         stF8moWYhj5tFQi8SGktSCngD720lyjiJK5GtEtz2QYuOYNrhZc67qvw3l0MBu1jk8hH
         uq/L/lqJNLkzIPVGzTt2tXgAU86B/YeqQYNeIe8Rtz5F57Ve+lCr01XujlOkPYaImXDX
         0adRdFAdL2GkfF52M1+iUxuwSMIqxrDXwkGFPbD+VGIRXuCB/uYVKl3ybXB1msgEAwGi
         3SSWN7EOvEAEYQ4YiMc3sFx9E4/J/cW346uenhuQBav8BB3KHH5FPqug9asTgjE+rE5C
         6y4g==
X-Gm-Message-State: AOJu0YyBTYYIu8mX5OxpXNnTUMseT/iOHZjJFsAfqsIeigVo1QIEjRKu
	YPKQewK7xcyQ5UMpFlhG2Q3ao3iEGoywrXZDSasZFuRtO3c2H4NBJwhHDO/zXT8=
X-Google-Smtp-Source: AGHT+IEgMzCegrv+xwWM1qrjks9Z0YDckuC3RtKQ20VBbAOuincV/IEMpSW+G5Yg0GQW5jwdFy4Phw==
X-Received: by 2002:a37:c44b:0:b0:788:2631:187b with SMTP id h11-20020a37c44b000000b007882631187bmr11541737qkm.32.1710266555259;
        Tue, 12 Mar 2024 11:02:35 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id u19-20020a05620a455300b00788618c8c3fsm3477741qkp.34.2024.03.12.11.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 11:02:34 -0700 (PDT)
Message-ID: <575a9e4e-d66a-4691-809a-6990adfe1238@sifive.com>
Date: Tue, 12 Mar 2024 13:02:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/4] riscv: Remove unnecessary irqflags processor.h
 include
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
 <20240212-fencei-v11-1-e1327f25fe10@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240212-fencei-v11-1-e1327f25fe10@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_110237_281649_4B6ECD72 
X-CRM114-Status: GOOD (  14.23  )
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

On 2024-02-12 5:36 PM, Charlie Jenkins wrote:
> This include is not used. Remove it to avoid a circular dependency in
> the next patch in the series.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/irqflags.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
> index 08d4d6a5b7e9..6fd8cbfcfcc7 100644
> --- a/arch/riscv/include/asm/irqflags.h
> +++ b/arch/riscv/include/asm/irqflags.h
> @@ -7,7 +7,6 @@
>  #ifndef _ASM_RISCV_IRQFLAGS_H
>  #define _ASM_RISCV_IRQFLAGS_H
>  
> -#include <asm/processor.h>
>  #include <asm/csr.h>
>  
>  /* read interrupt enabled status */
> 

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
