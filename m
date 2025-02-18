Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42D2C021AD
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 20:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXk8YsyNct6+6EPFqc8C/wsCNoZ3yy7piBPnSsZwpQs=; b=exZLn27q+vCRGY
	G69yQDrHVQwMN5H/2twfkfmRNKp4jpUOSYGJ6s7WIlon6oeQ9UasEJcWwehQ6g+s2jXqu48OetIVZ
	CGFkBtmXIvr5gQPgsE9w3SHNqwr0YqhDVcLkU4HbXTw3RG3oApZ3UV7bZOey9oC/d9/kQk7USXVNv
	2n+IBxFRCfvGPeTMVqFmWlRoBYYJq/22lwFL34rZXGHxm6SPgnmgSd4BR9lDIgeh4TiAL5yvVd1C7
	WOwLrrvK2Hi1HyIuXTf65tKLgG3yItsUx70iJNG0d+AG28YszHU40kT1vL94TcgYtrbJTa0yXZp62
	tClgXu48q8LEkb5Io4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTrd-00000009h1F-1j8Q;
	Tue, 18 Feb 2025 20:06:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkT9X-00000009Y7E-2pN5
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 19:21:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-220d398bea9so82412785ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 11:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1739906466; x=1740511266; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=StJPYwiHJgYBwwR4mAHQTkJhRCTzPfRYD9Ve0/q5EKM=;
        b=gutqO9Li5JstjK1T7yeG4SoLj8VKu9Bqg5Ye85CY4Us8meOuLjXj9U2Nd7oDoF0D1f
         jwxFaErcdm/+aY2sFq0CDhrDPdv5dGqrY27HuOiLztTaARdNE7NlnBMCOvFpXW6rXjb4
         z5AoH8chAWUcXn+fPJ1hriu0hXc2cqxRWgUc1oSfjQsw4zuhhHG+zN/xbCneZMwDciZ5
         JUKMKQNRH0A3qgwm7V/4w001pRkv8J5OvOlqkfkZ6spFBG9ki6LzW6mMLyqOV4pzvL1u
         vovwoc/Sohjpe3DKgN4duh3X3cIxlyfsGOYX72CXVqBXe1lBRDNYBioJgxp8jUZiT6Kj
         Ol3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739906466; x=1740511266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StJPYwiHJgYBwwR4mAHQTkJhRCTzPfRYD9Ve0/q5EKM=;
        b=DB97yRi6osHaMTQMOYdLLGWe82WWYpcNhXVwziPR4adQ1cXJquic6PbX4WbuzSqpDk
         XsKTT2cdn5iPb3rcUNknUrjPV4sH5gB84LUFeDZoCquv5JhGIWaTDn9JsuKEY7wdeEXI
         2DVrj9/yTYCbqPqndGydX9rxuZsLv/XWz+dn6MEJQvBSXvIoQviOLfIa76um6gzy4Raq
         P9Sxm8XqqYYJFtpH9B+zr2bGtoOurc6ySFb61nm/M+NmRtHFYN1XN3pqpdESXpXuyh1U
         TrV48G9UCc50o3NTaT6nuD72hFawE3jNmc5dRrknpnmp3WGIq3f9FEUQVTgO5hrRTntO
         Rmaw==
X-Forwarded-Encrypted: i=1; AJvYcCVI08i7BIahstTKukcZo9nbSS+1JVDUYjILGWJyRrEj06CipQ5fQkmy2x/16CLuvly3QVqGn/TLvwn1gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRhXDRQsswaphUmnF013km07/KMGVLFRvwKFdZJeZga5MC64WR
	yaqWM2coBXqMgwLaJFvMGA8Hfv+Ynywx1gqJjlqCjiAbXg5Cb+TiLAPwHkh/1A==
X-Gm-Gg: ASbGncsC1LaXxGfDK/t5/UI8Yc7jlgK/AP/IfimGTP5K7fEN1+0eWKDbD5wG/bQieJx
	+wtxehjqr/9VcIjQgMUmBB9+V8G3AyJU/yIl7hS2o6h1g/2fDzdhcJUVY1nLQQruDgeoLuyBqB8
	Rudxt/QCjVr91GcoKhZaIwf1q+zdwrORD0U+/v7DU6OdnvlpfyFkikbnaA3vHriVF/dOBIK4xNw
	hajMwaKkYfTxWSmYOQGHnzCG4PHD0vVPtVvr3ZS+oKAQ84cjVTrbTImrFFCVEuE/GDdtO4FIdbR
	WzsfA6ZHdisKp5rDf6L6s2hNKmtZZOBbTXU=
X-Google-Smtp-Source: AGHT+IFxUEDUhzAApZkHHX/oSC4gIXTNX1cKTIHtfqrqyFyEKSK0fwJXuNzMhtQUMc6tGwezwQKFLQ==
X-Received: by 2002:a05:6a00:124e:b0:732:23ed:9470 with SMTP id d2e1a72fcca58-73261901144mr21327160b3a.23.1739906466396;
        Tue, 18 Feb 2025 11:21:06 -0800 (PST)
Received: from [10.140.24.106] ([38.104.138.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732427801a8sm10451078b3a.167.2025.02.18.11.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 11:21:05 -0800 (PST)
Message-ID: <c85e1ddc-71b6-4537-a80f-cd37f61ab6dd@tenstorrent.com>
Date: Tue, 18 Feb 2025 11:21:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: implement user_access_begin and families
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Charlie Jenkins <charlie@rivosinc.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-2-cyrilbur@tenstorrent.com> <Z4rl8BgoV8tygCn9@ghost>
 <b45aab1e-6d37-4027-9a15-4fa917d806b9@codethink.co.uk>
 <e4a4c688-b78c-468b-8196-68d2df980167@tenstorrent.com>
 <a994e94c-3211-4bb4-ab41-71a2c1abebd4@codethink.co.uk>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <a994e94c-3211-4bb4-ab41-71a2c1abebd4@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_112107_724622_E8EADBC1 
X-CRM114-Status: GOOD (  15.53  )
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



On 14/2/2025 3:16 am, Ben Dooks wrote:
> On 13/02/2025 17:07, Cyril Bur wrote:
>>
>>
>> On 6/2/2025 1:08 am, Ben Dooks wrote:
>>> On 17/01/2025 23:21, Charlie Jenkins wrote:
>>>> On Mon, Nov 18, 2024 at 11:01:09PM +0000, Cyril Bur wrote:
>>>>> From: Jisheng Zhang <jszhang@kernel.org>
>>>>>
>>>>> Currently, when a function like strncpy_from_user() is called,
>>>>> the userspace access protection is disabled and enabled
>>>>> for every word read.
>>>>>
>>>>> By implementing user_access_begin and families, the protection
>>>>> is disabled at the beginning of the copy and enabled at the end.
>>>>>
>>>>> The __inttype macro is borrowed from x86 implementation.
>>>>>
>>>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>>>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>>
>>> If we're doing this, then saving the STATUS.SUM flag is going to
>>> be more important than before. We had this discussion when the
>>> initial user-access with syzbot stress testing turned up.
>>>
>>> We partially fixed this by rewriting the ordering in the __put_user
>>> function to stop the 'x' argument being evaluated inside the area
>>> where SUM is enabled, but this is going to make the window of
>>> opportunity of a thread switch much bigger and the bug will just
>>> come back and bite harder.
>>>
>>> If you want I can look at re-doing my original patch and resubmitting.
>>
>> Oh! Could you please link the patch? I haven't seen it and can't seem 
>> to find it now.
> 
> https://lore.kernel.org/linux-riscv/20210318151010.100966-1- 
> ben.dooks@codethink.co.uk/

I agree we want this patch. Or at least we want clarity around calling 
schedule inside SUM enabled sections.

Other arches are stricter about not calling schedule at all. I'm not 
really going to advocate for one way or the other right now but I 
believe your patch would solve the problem.

Cyril

> 
>> Thanks.
>>
>>>
>>>
>>
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
