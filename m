Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42093C4708D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1W2YdNaqu4xsZPsg2PKmp3PmQsUDbEFXcmojNG63Vw=; b=R5iANxum08WKoR
	Yg9zi0512PwQXYfAWI+mDCXjchI3MHaWJjgInZawtT8mq63wzwnLFtzwkBnQ6Vv7Wfi33ued5pa10
	qJ4LZLoxRadjP2TMilxWcEMYBjsBa1LWp+R3Udebehdw+sNP99qm5ed0IkJC1IuRKreBjqrLVF6WY
	FTlnXyXA82G/t5DSgjUqY4lFOyJQvMVxL4gDjTgRcd01Snm10T/kLevGunFc+KePXfzC/LnkaWu7U
	v6RjHpV+lGMCnaRVWeYhh+dHqjDvcMtuVjx0ngHQw0iU5GkwMcK6sQ8kfEqiMnVChvcimNektzJQE
	JdV78U6xZjoXxu0KA6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDnOA-008gq1-K1; Fri, 06 Jan 2023 14:08:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDnO8-008gmE-2c
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 14:08:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so3952529wml.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 06:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/B8JG1BigC8p4YFF5MJGebkSPugb2nMU0x88FUmUoe4=;
        b=DgsgPsIQjhh4mV8YXc/ADv8b1UTm/jZ1uPvXe+ZM1DyFVlCJ9enlBequydb9qgWuo/
         RX8CZF0uUxLj0t8mma2gpI6k8KiK3i0J7/k3l62bUauhMNZoYNHGgPze/o67AUr+cgs4
         /KnjUl27LZ929mqESKqLtYXqcGDITyYDVqqfIwFF8X4tFkNX4zJrA+3GBoE8947+XyeS
         bZb940nAGQPXaYQc4kaEsN4HMJXEjPjQU0ZNRKfiLQuELkwYkj7GXjwaSJXKMTZkOJpP
         j3BXPDUx49695KuArk9kqGNEFF0/okvp5xWmFjIIxYqyyiRCbG0kVZhw0gx9RBQnJvfQ
         RmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/B8JG1BigC8p4YFF5MJGebkSPugb2nMU0x88FUmUoe4=;
        b=yoNDTR3toBaqTXKoEAcR5Hv+IJIx90/gSCtSj3WkurGpwcUmt07CNHiyEzZ+JNh6V1
         NHcmScqW6yS38BvieSW6Y2eVPnEoZDIqntp9nre2rNc9JyAyFhYfIYCuo+C2Zc51y32r
         et7x5aeMIYzVhrGsYppZ5SjETgI4521u3d3z7aD+RUtOsv4xuHnmkgf22gd5Hw0yH/2B
         rgkT0QSQt61p54mwkOiqKar49rudB1yp1q0xn192R8g8ykEuZPHhaqh+LzkRhpntonjB
         pi1xShBxUgb7a2x+7mF0nmC1YO2Vq9WdnCg3BPuww9V7SqrWtaXqi0BWA6MeajECbg7K
         wfgQ==
X-Gm-Message-State: AFqh2kpxF5g+Au6mdwWTAol50AAVy9cz4Y51ELwomuKDF10ZoXRsVJpd
	e6VrevB1SrC1sich7uHTyEc2zA==
X-Google-Smtp-Source: AMrXdXvnK/BBUFBK5K+JKNO6+yp0kxHGWKWB1PQQpqva4ePUTCsOgDKPqAWRiWTDUxzHzZAiR1MWyw==
X-Received: by 2002:a05:600c:4d25:b0:3d2:27ba:dde0 with SMTP id u37-20020a05600c4d2500b003d227badde0mr40227048wmp.33.1673014079551;
        Fri, 06 Jan 2023 06:07:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c339300b003cff309807esm5766287wmp.23.2023.01.06.06.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 06:07:58 -0800 (PST)
Message-ID: <422275a4-b082-2951-71f2-04f33e036438@linaro.org>
Date: Fri, 6 Jan 2023 15:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] riscv: dts: fu740: fix size of pcie 32bit memory
To: Ben Dooks <ben.dooks@codethink.co.uk>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: robh+dt@kernel.org, palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org, zong.li@sifive.com,
 linux-kernel@lists.codethink.co.uk, sudip.mukherjee@codethink.co.uk,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>
References: <20230106134456.265891-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106134456.265891-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_060804_183083_DBC0A0A6 
X-CRM114-Status: GOOD (  12.71  )
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

On 06/01/2023 14:44, Ben Dooks wrote:
> The 32-bit memory resource is needed for non-prefetchable memory
> allocations on the PCIe bus, however with some cards (such as the
> SM768) the system fails to allocate memory from this.
> 
> Checking the allocation against the datasheet, it looks like there
> has been a mis-calcualation of the resource for the first memory
> region (0x0060090000..0x0070ffffff) which in the data-sheet for
> the fu740 (v1p2) is from 0x0060000000..0x007fffffff. Changing
> this to allocate from 0x0060090000..0x007fffffff fixes the probing
> issues.
> 
> Fixes: ae80d514808557018e44190 ("riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC
> ")

Don't wrap lines.

> 

Drop empty line between tags.

> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
