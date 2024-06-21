Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8295C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWDY7Me5zOXPXji4csPmjRRb1cUA+epP0cRRDfzTZH4=; b=3wRFPQ60UnVFgS
	aUUQIDeOfvmKEtbIcei7YKJeK9PQp2/6+xQWNVwmXY2rub0cdQopdMQzL82Nu7IL0GAAyv3E3yq17
	MlrrBt3+lNMgK84SRnNgxpzUbgL/hIOgmnzWvZC5dciy/9Fd/r/aTNMXruSG2v36EKyHLWQ3ftP0k
	dCl/wBCZpZpJ/gThAx4kOudDmpJmrFJ8k/xsipYMITQxFP94pHgUzhAejlrZG8jqJPHCcC/dSOySB
	iNuanoChzb2QcCAiLFDg9rrp8v7Qtw6JTkZBvkMsS6Nfaecx3B3iuqxoktB4TyjkZH9elmqgI6juJ
	/MME/0MIvKbqvDlYQ6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKg2m-00000009i3V-2SzG;
	Fri, 21 Jun 2024 15:19:16 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKg2j-00000009i2s-2MDl
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 15:19:15 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-652fd0bb5e6so1635868a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718983152; x=1719587952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cjxvv/dXpoLtAAeIGzsy9ReaW7NrPJCCE9CeS4zb3TA=;
        b=JBGLgfI+9CNB25rqjzuuO0Mwzcn3oB8Jz27ZhlwA7TzXusofo363GvUu0SKVfCvRZB
         TBTiW36rroD1JIzPhl7+cgeJXowQnFa9XeOlYGmF0n0T2UhosVf1Npmhk0YMcKywsW1r
         aRI5csik2GcLN9/f34kL8TapmtNLXdgTWYcG8iOVAjDe+9EYbUSqWTZxJNVOjhnE0Em0
         vO3xBe2wbxLC2L4twQkEkXNarK8ag3US9XXU63D41dA8x0u0rIeGgrmBX8jzrxQYVUBG
         pk/OAG5u1dC0mXI7J9Kf+eOd5DWz0EnMv4D6H+ouRbraKNuEpqXzgNTfM1ZhgBw1A3vk
         ysUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718983152; x=1719587952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cjxvv/dXpoLtAAeIGzsy9ReaW7NrPJCCE9CeS4zb3TA=;
        b=niiPM0DIQqbTHKLCLF+fxFWKPOGDhDEcN5yupBKivNZ/2+anHxXrd+zlgwBgOn9JK4
         7isj2fLfDkhWJswOa890B+gM+SY9wK7TiTgfFwhy/L0jCYDnvnH+OIO5U4lrFug3cAb/
         hgKEqSdhxV9SirgQ72ixELRBZpDLvHrWtjB8SNpKQqpGbrXajXji03FwgqGXCHF/4xk3
         659qGAb4AJJV+YmqcYbJtA/ibixPfTslBhAHOiP9HXrPsC3A4ghSogYU7xRZjf7j83At
         c+VaZu35BzyP593VVFaOcWNo3amHXQeoUlOgqhf/pX5fGjCuPjt5XB+fycPCTDgLGk5F
         z41A==
X-Forwarded-Encrypted: i=1; AJvYcCW9W3t5HtIpJ+XinRs8K1PlKKGUdYTxbfEw69RO8gvYoI1CyHzd58B3vUpNWJFiX/BNHuA0BC69xn7cS0wn8koqUFF1xHKrsfMYYyvte9ZC
X-Gm-Message-State: AOJu0YxoOWz9U9jkSaLavHRJ9m5k260/1wIGizLxMYfIL6Cs4iFohEhf
	/iiE4HnrXig145B+VWjlfMSdehnTANoiRE72F/Xfagp4cNhGLiTpP7qA/A==
X-Google-Smtp-Source: AGHT+IEPNc1yAbSPX6EhL18Hn9h8G+pMaRon9VBVmVWl+LZtObdhSRq3RpDsRRBngcXbxQQSri7+Lw==
X-Received: by 2002:a17:90a:ea92:b0:2c3:e99:614f with SMTP id 98e67ed59e1d1-2c7b5d52dbfmr8330945a91.37.1718983152142;
        Fri, 21 Jun 2024 08:19:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c7e55db329sm3732434a91.26.2024.06.21.08.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 08:19:11 -0700 (PDT)
Date: Fri, 21 Jun 2024 08:19:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 2/2] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
Message-ID: <df0f11cb-3b44-4869-bfd6-6e5d01e6debd@roeck-us.net>
References: <PH7PR20MB4962C6D8FD6989BC79F9483FBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
 <PH7PR20MB49622B0A6E9169B04211C7AFBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH7PR20MB49622B0A6E9169B04211C7AFBB1D2@PH7PR20MB4962.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_081913_623881_7F75CC06 
X-CRM114-Status: GOOD (  12.38  )
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

On Sun, May 05, 2024 at 09:18:53AM +0800, Inochi Amaoto wrote:
> SG2042 use an external MCU to provide basic hardware information
> and thermal sensors.
> 
> Add driver support for the onboard MCU of SG2042.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  drivers/hwmon/Kconfig            |  11 +
>  drivers/hwmon/Makefile           |   1 +
>  drivers/hwmon/sg2042-hwmon-mcu.c | 531 +++++++++++++++++++++++++++++++

Documentation missing.

> +config SENSORS_SG2042_HWMON_MCU

"SENSORS" and "HWMON" is redundant. Yes, I know, others do it
as well, but that doesn't make it less redundant.

> +static DEVICE_ATTR_RO(board_type);
> +static DEVICE_ATTR_RO(firmware_version);
> +static DEVICE_ATTR_RO(pcb_version);
> +static DEVICE_ATTR_RO(reset_count);
> +static DEVICE_ATTR_RO(uptime);
> +static DEVICE_ATTR_RO(reset_reason);
> +static DEVICE_ATTR_RO(mcu_type);
> +static DEVICE_ATTR_RW(critical_action);

None of the above are hardware monitoring attributes. They are not
acceptable as sysfs attributes. Some of them might be acceptable
as debugfs attributes.

> +static DEVICE_ATTR_RW(repower_temp);
> +

For this one, I don't know what it is. If it is a temperature
limit, it should be implemented as one (for example as _emergency
limit).

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
