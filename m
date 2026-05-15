Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9953ECD4F25
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJbkDvbvbSMSYiI0GeWfvIwoq1xEnUEou67DCH69OEw=; b=rxbh+buYqeKJN8
	tGd8PyHkWmZ9+nH71N6tWn+E590BsSeo+5ynvaLR2Yi0oxaKw9KU29XCxvU3FZcpnaKtrOdJ/7DPf
	YO54QcxzTQjxLgSS6orizQS0vVdKHW8vOko6iYtg1Paw+c30Mrx7sbo+9qg2h275TvlSj1rl3RmLe
	89JfOXx5k2ke+/Fmm6INy1bjETfzZH/ThxqPyGp+QnrJSYbAAuEOmFX3MM2T66ebVgXYWKk/oMoS2
	FqEbMh0DgxSDLs2PmhQ3LFkl+Zh2GfmZUP+5NPi0siPeYZ2nJCA0etbIhNc0VlRX3THJH6wZ8cGRR
	N+VKd81ARMTTdS5WiuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNswg-00000008UXT-1dPQ;
	Fri, 15 May 2026 13:51:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNswd-00000008UWf-1dg3
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 13:51:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ba17c8cfacso93311525ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 06:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778853074; x=1779457874; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=O2F8t6ntdYK/5aPvjkHgghGF13JKRdZuJCFrw2MfPU0=;
        b=tLe2hge2EnKA1GGh+zIaoVW/3suoFStipTdwIuL1FAVi6OUmKSeaZrwzBQqsun0hz8
         m88EQjPWMvQT7nZQuTWKuvWCzJpVeqxEFByeIDkl2FpLb+dhp+VJQYEBZXj9J0LksxEn
         NY0dMP0SI7s3PRGIo7fDjBp9juSvdvi96x3nnXAQNApAOybicK19g154RAk3VxWwVOfk
         eDMccYxHFA+PFo5Ia/EPsWjKdVQW4LTfO4kgkBul98CT0Nlb3x4hm1pUpfhJtxhGqXPH
         kq4ECTr73atpYF9CIfPqFrrNSDvJ95rCyUono9dIu2dJPf6+7JREczRAI8FYbxmOtgRG
         JMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853074; x=1779457874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2F8t6ntdYK/5aPvjkHgghGF13JKRdZuJCFrw2MfPU0=;
        b=VWdaoYd5CWrlbIXJYR3p6UGpEit3HDytzxvxcziDIvGRP5UpVa4dvNUYRIilIteEF0
         D7OlvC1JXpj0/CA0lg98+PbTk9TNMFMWNrw9o/6e+2W5qfwwk+i4C0ugLuRMG+7SgzyL
         vwmUnuQPzQjA0Q/G1lm1v8TlRLDqHWTcw7nFHrd/0/9UZCReNBp5zyBP8zVZGwuzyUDz
         05MbTsWgKgq7XitZuc8WUlg8Vx/GzDcx+ZeH+2nJOjybVf8t4RAIfSJdD9dNelgNLU6K
         B/wA6HYgkyy745xOhWXt6GB6J7KGkjHj+QZh0iVvYTQBiFlZh3g7fhhcdvbZFHMhwdfk
         UOrw==
X-Forwarded-Encrypted: i=1; AFNElJ+hXgJNaMBzrKwqJOc+Vs4XsZjOX3MTmpM63cEo+pu21PcF9MjDQ4dAKD9ezGyGEUWJ0VYCYQZEM7dZrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzA9HZmcZ+GYSsIFaWa6K07mp7fBdATfFpNrklj8mDrJo96K2T7
	72kYhs6wQ6CeBnH6Y10rPO+e3J00xG4L1mfKyUOKxHDGTIQSyt3PHRNc
X-Gm-Gg: Acq92OFnykYz6gMA/mTM1eNT28YDOBCak1J5JmHbFXN6zxJDp1vFBjMxo+R6WGtr4tz
	3ADK/uOLtoKxhqw/Ix0K88TGkuLL0bm0hs3X2QyIxHgT/8TxnmbzdVUx5GbgnbncQpw9vCEHq17
	Ud2j1AAVd1JkGykAa6c3jPlV4LPpso2+VIGksCQXpc+VZ8e3ySrMD9WaxF+8SvKAomxvvmSRWVG
	Fq9mnSnUDdTwGAhPu2n3DVVyxTVPE2KtGinTRSK8quFUAbhEvUTpucVtIw4aBQ9SDKyllH/rC7Q
	FL4hCxG1fcUN8UqlTT8Wu1oOFe2pk7UcXGF2u5wRzOA2FG7HnxXGfpRwOePVM9pVBKHjNA/PFjD
	T4WjswxqbVqP0jtfrfX1PRYQcodY5qY+V8hnUoDBBc0qkQq9C4i4uG9TeHfMfpPiHTf1Ba51RsF
	uJ2g/9uptFxP9x7WlzwtTy+E7Yz13ycYpuCGMuhlZhhzrfHCX/1LzjFLOKhz8gpUDBMf3rJufy
X-Received: by 2002:a17:903:44cd:b0:2bd:6732:6817 with SMTP id d9443c01a7336-2bd7e8d3578mr31205215ad.23.1778853074142;
        Fri, 15 May 2026 06:51:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f94c6sm62848175ad.56.2026.05.15.06.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 06:51:13 -0700 (PDT)
Message-ID: <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
Date: Fri, 15 May 2026 06:51:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning
 backtraces
To: Albert Esteve <aesteve@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>,
 Kees Cook <kees@kernel.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_065115_439731_B1275266 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

Hi Albert,

On 5/15/26 05:29, Albert Esteve wrote:
...

> Guenter Roeck (3):
>        kunit: Add backtrace suppression self-tests
>        drm: Suppress intentional warning backtraces in scaling unit tests
>        kunit: Add documentation for warning backtrace suppression API
> 


How much of that is from me at this point ? Wouldn't it make sense to drop me
as "author" of those patches ?

I would not mind. I had the idea, but others like you are doing the hard work
of pushing it through.

Thanks,
Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
