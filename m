Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F45C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBwnrtOob55HZFKw4x1WokvvON3Zxk+f9afEkDg2jD4=; b=CJnGC+O0AhRQjt
	y8EYmPEkfP9IQBImoGBUmcGr76g7t0K1s1Bk8EvH/qumG2WdZ6OiiaJ2C2TJDGyVoQWhrKOT+9SKj
	xPmGiWZgOk03rKTipDKeGLYXIFrSWXM7Bdmg7vzq2+W0U+/ObrR3jO61yEQgUfAcHkn394nxq2Y6H
	eF4zdpw2pY6WTqJ9g6NllwJeJtUoIRz9654eNuLuw2XkGgnPPqA9JZ97vyXXBXqjNnmpHMjuD/KUS
	gvxmrEX4Cah7BAdXEffZDHL+/Rd/ci8IDMxOPffmDwEzlXd4g4rKvabIVt6++Ny5YVVGQAU7AR5z7
	4dj/Ok3fv8RyxPDVm7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSmv-0000000BzA5-32h2;
	Fri, 09 Aug 2024 16:48:25 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scSms-0000000Bz9f-1FXg
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 16:48:24 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-39b2cead848so1059995ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723222101; x=1723826901; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIBS2fiq1eabJ4IYCoixxVdAtJaZLZJZMFj7PGFDm3c=;
        b=SOBUj7drFZgPmN8TOsewT+7/loxl3nb2FExwrcd510nRtd85KfpFubUQo1GJpw1zxl
         N9OvbMbCUlCNBq/zFnaSAn314QgM6OfpHluhSIur6qU/3n6f2hzkoE+qFqYMTU0YCQXT
         zJ9VCzR+rDSWE7be7czJwKMfexmQiIn/VoTPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723222101; x=1723826901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIBS2fiq1eabJ4IYCoixxVdAtJaZLZJZMFj7PGFDm3c=;
        b=XNvC6IaD2vrnzs9Q9K9+dD9nB3AN41Y6JQ5Ack+NsKwyyCDlfhvV2Lcf5MzIlY8n6x
         cIOiBzOwGOx3w42MJZ8hlPg8TLqucp3FpkxAqO7BzeEkLpot1nqy1NpRXo/qMnb4rjrm
         DFVxlYQlKJ5jkDYqWnjrnyjlnvkcfUpADSo2BXHnQpdDWH6PBKLNqS6+BREvepla4EFF
         6Vl2de3WL4Y4FzWAvR83TGclSjmNfw7iKDYk+H/fuSpkkz64AQpMFIbIGu/wAiJvgAhO
         sgvjjXFWB/mlPYMtCCQa/rrgZVO0Rqv/Fsd9RBrGfPqs5wnUyRYYKf9GHQMkMwy8tmYq
         CLlw==
X-Forwarded-Encrypted: i=1; AJvYcCWXBy7nUWIdGG0Qi9q6DnuGI6VXldcChLGrQEeEBD4bXYebbNpHJoJHRQaxYr7CjsqvKJG8hO8H22GYX1gZOlLJ32qL6ZeeAzVTguXEXZ3Y
X-Gm-Message-State: AOJu0YzolrdEsdlJ1t8kY+rfqfztOQqvHA7VX2VKjlzIMBGP0XL94rn1
	NkRDzzEzXYSuA47Rw2mWyQbLYggG2+akm43817Vt6Ut8KxF2RAbtHwZmrIGXDV14VRfZjHyo9Bh
	V
X-Google-Smtp-Source: AGHT+IEPtXUbZewJJPbHdH3NNNItqquYGOjjEuRG2n0DfjjJa+ymgUHQYn2ADond5MgNHtrhIJmfAA==
X-Received: by 2002:a05:6e02:2193:b0:39a:eac8:9be8 with SMTP id e9e14a558f8ab-39b7a40deb6mr15291675ab.1.1723222101188;
        Fri, 09 Aug 2024 09:48:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39b20a9ab7fsm65210735ab.6.2024.08.09.09.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 09:48:19 -0700 (PDT)
Message-ID: <cbb133f7-c447-4fc3-96e3-74952bb2bf44@linuxfoundation.org>
Date: Fri, 9 Aug 2024 10:48:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: memfd_secret: don't build memfd_secret test on
 unsupported arches
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Mike Rapoport <rppt@kernel.org>
Cc: kernel@collabora.com, stable@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240809075642.403247-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240809075642.403247-1-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_094822_419962_1BB9C98D 
X-CRM114-Status: GOOD (  15.94  )
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

On 8/9/24 01:56, Muhammad Usama Anjum wrote:
> [1] mentions that memfd_secret is only supported on arm64, riscv, x86
> and x86_64 for now. It doesn't support other architectures. I found the
> build error on arm and decided to send the fix as it was creating noise
> on KernelCI. Hence I'm adding condition that memfd_secret should only be
> compiled on supported architectures.

Good find. Please include the build error in the commit log.
  
> 
> Also check in run_vmtests script if memfd_secret binary is present
> before executing it.
> 
> [1] https://lore.kernel.org/all/20210518072034.31572-7-rppt@kernel.org/
> Cc: stable@vger.kernel.org
> Fixes: 76fe17ef588a ("secretmem: test: add basic selftest for memfd_secret(2)")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>   tools/testing/selftests/mm/Makefile       | 2 ++
>   tools/testing/selftests/mm/run_vmtests.sh | 3 +++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index 1a83b70e84535..4ea188be0588a 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -53,7 +53,9 @@ TEST_GEN_FILES += madv_populate
>   TEST_GEN_FILES += map_fixed_noreplace
>   TEST_GEN_FILES += map_hugetlb
>   TEST_GEN_FILES += map_populate
> +ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64))
>   TEST_GEN_FILES += memfd_secret
> +endif
>   TEST_GEN_FILES += migration
>   TEST_GEN_FILES += mkdirty
>   TEST_GEN_FILES += mlock-random-test
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index 03ac4f2e1cce6..36045edb10dea 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -374,8 +374,11 @@ CATEGORY="hmm" run_test bash ./test_hmm.sh smoke
>   # MADV_POPULATE_READ and MADV_POPULATE_WRITE tests
>   CATEGORY="madv_populate" run_test ./madv_populate
>   
> +if [ -x ./memfd_secret ]
> +then
>   (echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
>   CATEGORY="memfd_secret" run_test ./memfd_secret
> +fi
>   
>   # KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 100
>   CATEGORY="ksm" run_test ./ksm_tests -H -s 100
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
