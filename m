Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FD5C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8KfpXX7x0+Sd9i9xADSlWcC4OZq9BT8QqABks7Gbkw=; b=Z1r1as/xx4Rwsg
	FhvdfYFSGJeRVZsX91GHKlcyTKElQ2OhNMZiU9KPxXc1N9WV3RLO0vCsgoYr0ep5q5ITooMcfBbNm
	jltPAoprOOmK+/fJ0epwt/+JEONfuuhsRRYJJBURDzsWjCiFXYaUiVrY5tkQtEHiDN0/52+itA9lf
	jKuPLfXxVxQqaN5Ho8Ep+zmXVAk3n99fcR3D3V9aHxEnBHsC9ugf6NqUyRwxm6AH2Z8QCeT9Cuyku
	xmaRWxggrRFbdarcXY897furluo8nDwS+Bc0psz0aN9Wjl5fwVhi/iFOKsnd+opSlK18fJ7S/zkXR
	4lFrlG4e585/aRkT7G7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dRn-00000005QBd-08J9;
	Thu, 16 May 2024 15:55:11 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dRj-00000005Q9c-129a
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 15:55:09 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7e1d952ace4so6371039f.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715874905; x=1716479705; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ab4/9SXReNXDQjfL5I+PFsnXsCfrtKWnsASearG9QQU=;
        b=PdlkxdHBihUjQt+H4Xgi9QlMkiOBlBw5djUuIh4nSIL5XYICzY2wbl2UBmb2xZEQvk
         HIwODN8vctEt+rM2InjfFb9vw3HDV0Mz6T05Chu/+6ocYzMcWC2Mnwu8Q3AcLKshT1xC
         6XazAzjV9U+2RIMZaEzve0V/dAAmZNM7TBIxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715874905; x=1716479705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ab4/9SXReNXDQjfL5I+PFsnXsCfrtKWnsASearG9QQU=;
        b=VEYrWC8RjEt8zaxfLrQOsPHM9a+TuqyhJCXq5FmpnqNKkGWNtVglTlAwJbAcK0gqFF
         j8QBykNjtpWUeKfwqvr0AiA0huP7o31E0mxrsy2M2eApc/0eGzMb29Sf2psDi/lxe1lf
         y8sFMJoV9/C65o1Pj4BWYeJiCM84YHtih9g7M5x6l8dWLv+d/nTvV544Eco8aVZtIdcl
         rtf/CrM0klqTLH+m/DmXSgCZ+JSjQ9QhzaA9WDm93/Ch4qL2/ySxg7fpkiUsW/qdBDa4
         yRq8iiOHNyKZWKdQ/K+lCkkc0kkXTlcjWMxJ/3GDEp42cHcKI8x3Rlr1Nf1phznjR1mr
         Mt1g==
X-Forwarded-Encrypted: i=1; AJvYcCXi7FxE72q7G5bZBK0gtXwzwDUUkXgH3ltgPJj4dfm/KaYr5HCnNWX3YQLrYpvKFE6oWzoZdHcbpjx7BsnwcinztZdCDya3jeIVu9ldiyVQ
X-Gm-Message-State: AOJu0Yw+mdEIbIdj1EuDSplwuYjWaZRtb5QScuW/mKkgW+Plrmtc1qRE
	8OUCXnGPHQnBSbbis0m/3Hc6kGt06j9TCIPJNbpByJAThHJBldwZ0BRF9sBSLto=
X-Google-Smtp-Source: AGHT+IFkrQ63gFwV/5y3qWi0SsRylHli+g/GXjCSjbCIbAnwmlot3x2PILn1QDwIRhTHEUwb7pHpvA==
X-Received: by 2002:a6b:d203:0:b0:7e1:8bc8:8228 with SMTP id ca18e2360f4ac-7e1b501f23dmr1984498939f.0.1715874905028;
        Thu, 16 May 2024 08:55:05 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7e20378a041sm127028439f.26.2024.05.16.08.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 08:55:04 -0700 (PDT)
Message-ID: <bf762b3d-4776-4041-864f-03094a9bea66@linuxfoundation.org>
Date: Thu, 16 May 2024 09:55:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/66] Define _GNU_SOURCE for sources using
To: Edward Liaw <edliaw@google.com>, shuah@kernel.org,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@android.com, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240510000842.410729-1-edliaw@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_085507_472827_5D475533 
X-CRM114-Status: GOOD (  14.71  )
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

On 5/9/24 18:06, Edward Liaw wrote:
> Centralizes the definition of _GNU_SOURCE into KHDR_INCLUDES and removes
> redefinitions of _GNU_SOURCE from source code.
> 
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw@google.com/
> v2: https://lore.kernel.org/linux-kselftest/20240507214254.2787305-1-edliaw@google.com/
>   - Add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
>     location.
>   - Remove #define _GNU_SOURCE from source code to resolve redefinition
>     warnings.
> v3: https://lore.kernel.org/linux-kselftest/20240509200022.253089-1-edliaw@google.com/
>   - Rebase onto linux-next 20240508.
>   - Split patches by directory.
>   - Add -D_GNU_SOURCE directly to CFLAGS in lib.mk.
>   - Delete additional _GNU_SOURCE definitions from source code in
>     linux-next.
>   - Delete additional -D_GNU_SOURCE flags from Makefiles.
> v4:
>   - Rebase onto linux-next 20240509.
>   - Remove Fixes tag from patches that drop _GNU_SOURCE definition.
>   - Restore space between comment and includes for selftests/damon.
> > Edward Liaw (66):
>    selftests: Compile with -D_GNU_SOURCE when including lib.mk

This above change is causing some build problems - I didn't
notice them when I tested on linux-next. However some problems
are seen by Mark. He sent in a fix for ALSA and a change to
descalate build warn.

Please don't apply these for 6.10 for now. I will take all
of these together.

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
