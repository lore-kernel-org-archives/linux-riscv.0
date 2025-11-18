Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA27DCEE344
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 17:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9VsF+gmqTirHrenYKCi40hrO7Ll2D8xJ+CV+1l8YK8=; b=3Zd+ra0BH6TWL4
	ujnwYQ6DYEVvCG9lz/ZwSiWoMxuOqc5OrmK+ZSgDkO68rRpu1poEa+JvmqtpZC4JBkb/GzE+tN4YJ
	Jnj43irDGOXdBz7Jr9qb9Stb3EH85EqFC4t6fu4w6yIVyimwU1bu/bIAl0JeCfpN8kFSTrReqiWAd
	0SdiYNBdCZq3Pk4/PwHRr8dawsalML3hVGh7GuoKxpCP/bKqgYYRE5mHhHeN2ekxUkuC8oeb0H7yO
	0tKTC/5rkzEtIf/mPvF++KV48J8g0zIZXW9dbcRYVflS695kqb6wb3jL0X5GnG7jt3i4qE4E01LaG
	roi50uCanCjHopdzPt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPZY-00000000roX-2gau;
	Tue, 18 Nov 2025 17:32:56 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPZW-00000000rnV-0VWZ
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 17:32:55 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-9491571438cso87797739f.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 09:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487173; x=1764091973; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1oOiqDzzj9jTgkI2h8Dnql40uqXQIp1HBHBf0WuCieM=;
        b=om6XcO0dyVVSaLPZ/b45A33alv16Mr2u4jtTzvWUFyzygID+C9+pYHZlRdrQm34ZKn
         dVtCp6oL1xmTiEhHBFqA4hLJaQxDsuIo/bzNdODuJxOUNQozFEqUW2xCJ3jFYfXiFOuY
         W3VVwoRlYbjXexFyRAwVayWbTObnL7QYkHne7SztwJyRcOOSJlawEz8lc+qBEvaeBHkW
         3B+URwIeHXPYGG2tTmIGVcYbPih8vdyJVgv4zNjvASHh5q+woIk59B/78cH1a0GTW+rf
         vMmPzPOrZtZhsDuYVWy6HtzJmQ924eUE7Ub6O+DUMjdIfyl+HajvExBnmp02SpahHTcc
         UKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487173; x=1764091973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oOiqDzzj9jTgkI2h8Dnql40uqXQIp1HBHBf0WuCieM=;
        b=DQ+288n0ZMffC6dPfttQF3ZLlEr4gn8N+XGei4Zn1yxialeEOlwoM+vTiOeD8j4fx4
         /AYIKTo+Rv2L1l/o/1tMLd0abKSXyAXAiCroR5O7jPE5ZhXLM4DfBK0rzxWxAUPCzVt/
         CeS5GD6tTMP4BCqDEtmQHRM+oFKCW9RcNLo31EqT2+qvA8qaZfheXQey7swqOB5IH9Ws
         Jar8voe/UFP5C2XS4wNq+vbwDWao+cmc9zN1FVixFCPp0Vj9v+DaINnYpomVEIR/sdNI
         CbBfdgDSDDGZJEGIsAvbkqheiPYEj8bhE2tKLdV+hJshf5YfzFlELh67YKXzVFRNv5EE
         KEng==
X-Forwarded-Encrypted: i=1; AJvYcCUr8/9txq1P5/M7WB1hi6KFSAYwZFNa5uPDuYuA8/V14tr+S0+vLqAA+UEOg0QnREUyXbZgHU8KyXkVxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYgH4xNzm7Y1GASwSo/0Uomb9dMkb8UAEGmPelLf8lOLV1HeNG
	YKGCpsvXRZksx4iRNlsw7eORTpjSqX3l3Y8DbITWYnpV6whLYY4NbfdmV0gwap9nJ9w=
X-Gm-Gg: ASbGncvTZn8JjUnml0IckHQsmcudF7qGhjLGVm3Lt17laPx9rH9At24/YwHY28Trfgq
	C5oh+YSBDoiDkqNw1cNLGK1mEOu9ChrXd1DMdAY5LqAorIKEcbBxYfo9v2LtaBrSWseZ4xQsuDG
	GM38OWcG/lbUhU5dCFwEcZoRaKi1xtnkLZVf+A8NKxd40uHDJMm/nfhKsAIFkmSPK61htMoXYQf
	R0eCqvyEqbFDHX5SJ+WGkBgzW31/fDTeiDRmhs19bPshlBIY6rPRUjCfgHfd/Mi7H8uf1q/V11u
	HdHkFDh4mDCtIv9shMxZjEPg/+Drzwj9xxLDpdYPP5ztMHK+6Bm4C0+UMGsVG/CFZcos3vUUouW
	O4mUFjW+tZa+W0Q+4AFYMTlnFUEwRdlN9P5cuA3+MlUUYfYHXqlz8y7AknAgDQcOebLd9b1dWm2
	2PNZwWgRS+Cb0vkiJrHW+cSwkP3dIBDD14aYBNWjTeHdtfx0ZtXRuOphuOD4ji
X-Google-Smtp-Source: AGHT+IGahI9DGjaU2urpjYEZBPmSTbQQTgXyf3rdyDOFBmX83/b65vQYd/eGVMJz3IuDl90Wqglj7A==
X-Received: by 2002:a92:c262:0:b0:433:7a5f:9439 with SMTP id e9e14a558f8ab-4348c91de6fmr183399575ab.24.1763487173123;
        Tue, 18 Nov 2025 09:32:53 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:52 -0800 (PST)
Message-ID: <d33f6f1d-ce1d-4670-b7a2-1d086a16945c@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_093254_176409_C6F4168F 
X-CRM114-Status: GOOD (  16.49  )
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

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.
> 
> Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
> in REGULATOR_SPACEMIT_P1 is now redundant.
> 
> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
> ---
>   drivers/regulator/Kconfig | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d84f3d054c59d86d91d859808aa73a3b609d16d0..e2cbbb90500189a1c4282511b8d7141301cae1f0 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1455,9 +1455,8 @@ config REGULATOR_SLG51000
>   config REGULATOR_SPACEMIT_P1
>   	tristate "SpacemiT P1 regulators"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on I2C
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default MFD_SPACEMIT_P1

If possible:

	default m if MFD_SPACEMIT_P1

Acked-by: Alex Elder <elder@riscstar.com>

>   	help
>   	  Enable support for regulators implemented by the SpacemiT P1
>   	  power controller.  The P1 implements 6 high-efficiency buck
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
