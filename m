Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8DEC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbrs0cntdvVe2xCy79aZXTl7iCQDAEYwx40PSp0lHIA=; b=U8gCR1j4HeHaMF
	D+AUX1SBsPjc4dfhOE4RB7cHrpITodSw7JeSdinN4DJq6Kvtkhe/RscKiWz9V1gX2+T+hJToLbi/B
	GSOXp5ESnV0t6eTCRODBGVqN9NV0DXvMXlaCrKKrtMakZ6p1BDttqztH8v8eWaQnY67/mromWYlBe
	/RhDFHvB60MDJ2bi4B1Hr6qxoVXg5lWfQG+oSBE8c0yISwDC2fctD51heLaN5yO6SkMRXnG2BzxRd
	pLTxX4F+TdglfOvhwpQo053N9g72/L1rvDhJ0mh4OpLqoX8sAnycLkyH5pRvnoZK3vsV9CfOHGvJh
	VSflqf3QhDEuD/GiQAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sACrN-00000006ymL-1Mpp;
	Thu, 23 May 2024 18:08:13 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sACrJ-00000006yli-2BVU
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 18:08:11 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-36db45ed3dbso820955ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716487688; x=1717092488; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QppMVaRvwpv224Y9IO8Cxn0UTTJUNxxLps+IPODX5QA=;
        b=Hl8uhdg+dOcdOTHUzhygtHbs0FeaoRSCynuznNzP5yERRm+KyMU8a3i/yknQOpd/XJ
         Vx1wuEdDzZlU5yicNxqTn8H7TV3fb5Okj7qSLLnHkk8xvyiPrwf81rA5PfJpo01Km7we
         BAoA0s2pwFIXvqPH6SbqfLXKU2HXAO24rC0iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716487688; x=1717092488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QppMVaRvwpv224Y9IO8Cxn0UTTJUNxxLps+IPODX5QA=;
        b=cKpR/ETIXnyrrtvL8AZMO6B8WQPCqhfLFIrC93Eny/YNnUfU6MmqYeuUPvw/eNu4P5
         QL9yfS/gVPbnqAkxqTdG84a3GOivJLl9796hDevdQr8pV8/StH3D25lUm3xwhS/f71oi
         aaPW+pWt59NrLkQ+OK5ucqkPghV9SH36cka4EPy/CZYxc2Ke12ftlcGFcuqgSvOzFt4e
         4bB5QrvXxhKXUg0Nf+Ijq4bErtTk294CmDjlvKtU03fAVj0owumnOv2RIrOZz3MhPS0m
         nUwTdxbxtGqXqwbjtBSCecd1Qegw/st5gZxTC9CxQNpL1DuGz2CFd3vkd6O6CeW/kf7e
         c3Hg==
X-Gm-Message-State: AOJu0YyHhQJOnnsCw87WSApsDXqvN8+M1BxajeYZ0Yx/PIkoQwVHh+Ql
	J4ND4JQgff+RheBuYB9P5xtzFU/SgJeCG2JzbxYUwESsbdMFJTWRbF8O5j7yELdQ+0VlL1uf2wK
	S
X-Google-Smtp-Source: AGHT+IEBBvDmUK0IP1Etmxs8NE88XVgW6UxT7U9fncixZVdPc3a6kqkZwE1ED1Py3qsDc9U9/8UYnQ==
X-Received: by 2002:a05:6e02:218b:b0:36b:2a68:d7ee with SMTP id e9e14a558f8ab-3737b248c34mr967395ab.1.1716487687922;
        Thu, 23 May 2024 11:08:07 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-36cb9d3f601sm78622145ab.13.2024.05.23.11.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 11:08:07 -0700 (PDT)
Message-ID: <fb045118-5cce-43f9-9757-542ad3b84aa0@linuxfoundation.org>
Date: Thu, 23 May 2024 12:08:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/68] Define _GNU_SOURCE for sources using
To: patchwork-bot+linux-riscv@kernel.org, Edward Liaw <edliaw@google.com>,
 Tejun Heo <tj@kernel.org>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org, mic@digikod.net,
 gnoack@google.com, brauner@kernel.org, richardcochran@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net, kuba@kernel.org,
 hawk@kernel.org, john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@android.com,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org
References: <20240522005913.3540131-1-edliaw@google.com>
 <171642074340.9409.18366005588959820799.git-patchwork-notify@kernel.org>
 <29c1f444-6c58-48b2-90b7-a17ca22ad309@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <29c1f444-6c58-48b2-90b7-a17ca22ad309@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_110809_608091_17C4FB5A 
X-CRM114-Status: GOOD (  14.52  )
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

On 5/22/24 17:36, Shuah Khan wrote:
> On 5/22/24 17:32, patchwork-bot+linux-riscv@kernel.org wrote:
>> Hello:
>>
>> This series was applied to riscv/linux.git (fixes)
>> by Tejun Heo <tj@kernel.org>:
>>

Hi Tejun,

I noticed you weren't on the email I sent in response.

Please drop this series. There is simpler fix to the problem
this patch series attempts to solve with this series is already
in Linus's tree:

https://lore.kernel.org/all/20240519213733.2AE81C32781@smtp.kernel.org/

>> On Wed, 22 May 2024 00:56:46 +0000 you wrote:
>>> Centralizes the definition of _GNU_SOURCE into KHDR_INCLUDES and removes
>>> redefinitions of _GNU_SOURCE from source code.
>>>
>>> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
>>> asprintf into kselftest_harness.h, which is a GNU extension and needs
>>> _GNU_SOURCE to either be defined prior to including headers or with the
>>> -D_GNU_SOURCE flag passed to the compiler.
> 
> Hi Tejun,
> 
> Please don't. We determined this series is no longer necessary.
> 
> With the patch that Andrew applied:
> https://lore.kernel.org/all/20240519213733.2AE81C32781@smtp.kernel.org/
> make its way to Linus? As you say that's a much simpler fix.
> 

This patch series isn't necessary and makes it problematic because all
these patches are labeled as fixes - I don't plan upon taking this series.

thanks,
-- Shuah


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
