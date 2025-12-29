Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83C9E9273E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/fTb5VpA9Fx8D5vrEBW80XfoP+hoAfZQgUMUX7vQp0=; b=GQcJNkgwddK+gL
	81xQhlRW7mgaJWzjsKzJrJjLYkkZxzHHVp2g3zj8OqQmTsNu47F7hIYPCF4YDwlCDPdxVklwMpwWe
	SPJ42z9PTMI83kA640ACVVVJLmI6cgc+0po0MoyGqQ3Fuhyk5NAo0EAzIv4xql3Hq3B8YcCaeW4nP
	r/eA3/1GKXDxqg8gX43Iqrg6ltl+yWmx441AP0e3ozN8w8MY/dfBEqmHCJ012G8qUCLPii2WgO4o6
	Hja/xYLijacqA2yTc8KFqzE/IgY5RaLwHMV7t3O7eUzn5ZujMG1gVaWdyEODbcM8bJ6HrpmoqcEW3
	HHGQV3muegToQG/9EJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHOj-00000003vW4-1m6R;
	Mon, 29 Dec 2025 17:51:13 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaHOd-00000003vVM-3RJl
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 17:51:12 +0000
Received: by mail-qt1-x841.google.com with SMTP id d75a77b69052e-4ee1879e6d9so106942951cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767030666; x=1767635466; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBVKZpfddpe+Ns0g7Sdt2AUT7i0mQvsGFZpu3wnG5ic=;
        b=NTnRojrnqkf8hCa5CeOKUZoO1VGk2KhpIe8whABCOkhJRuRnmDMU6hEiuZWYCCKyeq
         A935L2Dfcp5fTQMP6flf/kLbKtMxmrWj12PLukhB/P6KotUoy0mX/6rvY65DuXsAKUMv
         PY9xG32uyRtRVAGMWY5ERORFb9a4q56OjQgvmXLIalCKQYYpMIpgfjfBmZ8nQH9AaEZW
         z1dCS5keoMsT3AD5jC6HRd8gZrHfk0I0crwbjrqPvf5zG6Mvg50GPO5hO1ys+43C2+q7
         TkEOtB4QV5H8uuczHkvOGXnVahGGNvHA4HANFjeF85Lz2pl9L0oVyF9K91JCSAH8cyPZ
         pDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767030666; x=1767635466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBVKZpfddpe+Ns0g7Sdt2AUT7i0mQvsGFZpu3wnG5ic=;
        b=v6njD2dzBHSN+HVlcJ2nKbj2hG13uYyDKE2CyBcdsXMqorNYIe2ZIqTpZLMkRGZyJT
         JZaC4kUKZZt/skoyEVwnR5I6U3i4GCg6hvDXJboSfGFfAqBJcgMX4fINcYtDPoMAmLLQ
         HNniN9OTeTf8TIRYCvdwAkvPPKiQ6/T0a3ZhHPxUueiKWOX/4Pa7vtTPuN9XdZ/9brSf
         Fgrpnzlqz6ulAIhEWxU3PlGz4aIWW1T7VNRI8902Mm3pLr14LZgErixL2OLV/5z5iHFW
         hvWfcjDv93lohbLIf7Bd/E5oETHyrC4oYFipY6yUoGqrkdjkkx2zcQLry3dSLGJD+Wnr
         PLsw==
X-Forwarded-Encrypted: i=1; AJvYcCVgWQI7OpZkMCOvjmBOV5Q1k00YnJ5X9RP8jQyb2cAQ69VYLisEklcM9whWelBtrY+bbDUeZWtQGGNjEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz61G5YWSDmLoFuYFpMHVZTu/za/pQdJaLGw3ovCmwCjzuBdWTT
	+MpvuLRY49xMxVRznlOXgfqub67j7OSdRnztq/TH71rknuMg5XVP3nmK4pYQVtiDNEY=
X-Gm-Gg: AY/fxX5PVc1flFjGRjnR+QmVXrsB3LmpDZWVJKYhfPqKpKzTebfQJGCydswiHWsiaCt
	nir1neNySX/n9jNZF+Q7TcFCjyj9mlr960r5Asv1vKrPsSA6GhzbICf+AzgPKb6vvMH2QQ+FXxM
	QFTMQzLeRxCOWquICNUkLX8Mnwldeabcp9b83ONz2srYygXtE3RiUci7hu4RW2GjGq+E1ehJ+FR
	60jF3SFhjWmIKiu9uwR0rR8941cxunluXC/+PGGA7YOBsuCRmjgMBi1PbN3vT182uFAvVTo11jh
	nNsbiMV1UT2ZFlK+fduPT8zFcU2whN++7yLrpuLBcYEU8zQInA4MGH7WjcqXmtiY2EZIU03Zcw1
	olczv0a8XUq6gXYxS7yjSWk21TA5fDpknjR/3GuW21qIH81JEsABu6o6r1fDAap05zdUfOzubLA
	MynHcmwokXxPUagz+o+su5n/5deg==
X-Google-Smtp-Source: AGHT+IEsUPVraniMkuTWC397mM/y7CFhjYXQZl0a4mAweu2WnF2gu2AEx/7J4AZSNaZAIT/grNKtTA==
X-Received: by 2002:a05:622a:550f:b0:4ed:6e15:d2cc with SMTP id d75a77b69052e-4f4abd72019mr459440771cf.54.1767030666405;
        Mon, 29 Dec 2025 09:51:06 -0800 (PST)
Received: from [10.211.55.5] ([209.81.125.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4da7c31a1sm145471851cf.5.2025.12.29.09.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 09:51:06 -0800 (PST)
Message-ID: <85d045be-7b18-4bf5-b6a1-09e723cad2a0@riscstar.com>
Date: Mon, 29 Dec 2025 11:51:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
To: Vinod Koul <vkoul@kernel.org>
Cc: neil.armstrong@linaro.org, dlan@gentoo.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 guodong@riscstar.com, linux-phy@lists.infradead.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251226173228.2020411-1-elder@riscstar.com>
 <aVKy87c7afpWIx33@vaman>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aVKy87c7afpWIx33@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_095110_245185_215F3FA4 
X-CRM114-Status: GOOD (  14.15  )
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

On 12/29/25 10:57 AM, Vinod Koul wrote:
> On 26-12-25, 11:32, Alex Elder wrote:
>> The SpacemiT PCIe PHY driver depends on the common clock framework.
>> Not specifying that led to a failure when doing a COMPILE_TEST build
>> for the SPARC architecture.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> Note:  This is based on phy/next, which I find doesn't currently build
>>         cleanly using "arch/riscv/configs/defconfig".
> 
> I dont build rsicv, I should add that. What is the failure you see,
> looking at changes I dont see anything that might break this


The clock calls are not defined in the SPARC environment.

   phy-spacemit-k1-pcie.o: in function `k1_pcie_phy_pll_setup':
   phy-spacemit-k1-pcie.c:299: undefined reference to `devm_clk_hw_register'
   phy-spacemit-k1-pcie.c:306: undefined reference to `devm_clk_hw_get_clk'

https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/

(I now realize you can just click on the "Closes" link.)

					-Alex

>>
>>   drivers/phy/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index aa2d30e0e3261..3bc7378ea8658 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -104,6 +104,7 @@ config PHY_NXP_PTN3222
>>   config PHY_SPACEMIT_K1_PCIE
>>   	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on COMMON_CLK
>>   	depends on HAS_IOMEM
>>   	depends on OF
>>   	select GENERIC_PHY
>>
>> base-commit: 27287e3b52b5954b73203d32ee76ffd5f53f5074
>> -- 
>> 2.48.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
