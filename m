Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AEDC001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yin0XETlQY7D1uBJsnJmCu8NkHafGWrhooyXclhNxh8=; b=JSSvXuKwLJ8olX
	PpYLzN/7qx5+jhFQBW/KZvcz//WA1EqkLzAYzVZupU/a+8WiqPJKXdRrqBJ7OmOX+huGp11YV8WQD
	18SS8QBp+y5ZiRGVcVx8J2kRte+KXGT8NmxSD9yKgOG+CxVDyfgmSiZFr8AhLD6LyCXYceLGCXO7y
	Mip6iHpT4rnCBH/XXGFFRi8CYTK4e+znzuLknVPdBTf4tdE8++JGuGzAK1GuCblvww32Bjz/vWPQa
	IYQFhV6zAXFnE87QKA+7ykSoJn2SrM5zojs7sK0BTsJX5rnScwXP7GFTbV9CF4twhj3oRv/lAUZyt
	7q0KGyFjPSqQzHEbFeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbVQ-00AN8r-2s;
	Thu, 03 Aug 2023 16:48:56 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbVO-00AN83-0X
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:48:55 +0000
Received: by mail-il1-x143.google.com with SMTP id e9e14a558f8ab-348d1c94fdaso1359655ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691081331; x=1691686131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQ6EWC8B7oQ3T6NTg6WOQ+ngTyl3erkhNwPSztKemT8=;
        b=I8UEEEpMgMmmgjFBfIabgFSwv0M1EvDjPygZRV8ViVDrF5vl/M7JBUeclYDCubHzRu
         jMz5w73fjDNnSuAwricXbSss1mRYA63soRHyxGrN51QEhvC09UFfDwCVLXfZCT++uDTI
         VXHTIBZwIUAvhnJe6iRFjr7/tp0ez/D8LVChw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691081331; x=1691686131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQ6EWC8B7oQ3T6NTg6WOQ+ngTyl3erkhNwPSztKemT8=;
        b=fJ5wfPPAzTN0Pme0FuAJAOQj84P8XyLUSFJtxCm/icBcNqfXzuKezff2VBwCUggxjb
         luWVxvl8X6neHbBtU787sIPdelrB032xMsdSfohISr5QXOvKDACGswdtYD3y6Zyov/Zo
         r5lozcdoIfQm72ETNpsCP25rvfOMiVI3e2coJtn5RRoC7tz0cYH/XMHbtiL58fuvBDqs
         JYZg+VRCmCmF/GNqn4++WeDrvRJIOX8ra5ax+K08abDvJxuXwW2RZuHA1GNcKy1/NQRv
         CkHAacdKX4471sbgSEcw5y1VPSl8CD8x+VI+ce/VPOl08efiCmyhR0XYIdypb/u7B4s7
         mMxQ==
X-Gm-Message-State: ABy/qLZ71ix8PfShHjT3lXSwwlV/QafzO6eFJK0eOT2sFs31glgX7K/r
	YHcqaOxZl5MnnH6WmXyuhD0lFA==
X-Google-Smtp-Source: APBJJlHwrY9T8MbVPlU2tPcxOi0IPISnlrSiyD+jRXAEif1vVKGWnXXUbeacCmBU0nTNw2Ct4/SvdQ==
X-Received: by 2002:a05:6602:3d5:b0:780:d65c:d78f with SMTP id g21-20020a05660203d500b00780d65cd78fmr24072157iov.2.1691081331660;
        Thu, 03 Aug 2023 09:48:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id x10-20020a5eda0a000000b00783634b9eafsm66851ioj.50.2023.08.03.09.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 09:48:51 -0700 (PDT)
Message-ID: <1c16fbc3-9bcb-3ad5-e875-26d8bdc75422@linuxfoundation.org>
Date: Thu, 3 Aug 2023 10:48:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] selftests/riscv: fix potential build failure during the
 "emit_tests" step
To: Palmer Dabbelt <palmer@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, John Hubbard <jhubbard@nvidia.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andy.chiu@sifive.com>,
 Evan Green <evan@rivosinc.com>, Hugh Dickins <hughd@google.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <20230712193514.740033-1-jhubbard@nvidia.com>
 <169107392499.27633.6579477595845776477.b4-ty@rivosinc.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <169107392499.27633.6579477595845776477.b4-ty@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_094854_239269_99242BC0 
X-CRM114-Status: GOOD (  12.28  )
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

On 8/3/23 08:45, Palmer Dabbelt wrote:
> 
> On Wed, 12 Jul 2023 12:35:14 -0700, John Hubbard wrote:
>> The riscv selftests (which were modeled after the arm64 selftests) are
>> improperly declaring the "emit_tests" target to depend upon the "all"
>> target. This approach, when combined with commit 9fc96c7c19df
>> ("selftests: error out if kernel header files are not yet built"), has
>> caused build failures [1] on arm64, and is likely to cause similar
>> failures for riscv.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] selftests/riscv: fix potential build failure during the "emit_tests" step
>        https://git.kernel.org/palmer/c/8c82d2bf5944
> 
> Best regards,

This is already in Linus's tree. I sent this in for Linux 6.5-rc3

c77896b143d3c9c3e84c4ed0662b807ccbd8730b
selftests/riscv: fix potential build failure during the "emit_tests" step

thanks,
-- Shuah


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
