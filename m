Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2B8C021A4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fIrM4kv+/OMXDVkSIToCC3JriRwyH7/he0j3XPzsg8=; b=t70ePLgR6/Yo5h
	Uuf2FvHJwrY985ylBZ9oc6OCZCVssuvy2uEtdNrLLT/eDe67RzseXqisRXdT7PjxqQ07RxQU7aMwB
	3zcsrBA43ON/huYCL5ojhRkT8ZlhmK9JD7Uu496hjRSzYRwNFMIfHnwS7IBMFyFGLaIYSnDIrP+nK
	c9SiPSUfoIfGd+ii6Qne2VfXmbp5Be7oXXQ3WrO6uSmAWUMjicttcFoJL8ZaV0DrqDs2FTVjSxyIE
	yPi8sQwDOmnAKFYlYu4YQrqMnQ6s17gNuZr2W6Tt3XEzgcxr5ouaLHHnD6aoqqyMXgFU/ysttwimo
	uFs2qZvA36ga2VfhWrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidRY-0000000C6AW-2xIN;
	Thu, 13 Feb 2025 17:56:08 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticg7-0000000Bwgl-1ssa
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 17:07:08 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6e41e17645dso10240196d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 09:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1739466426; x=1740071226; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlLNOt9fP+kEnliAil52DiLv0in7lZUPZKbD7Kg1MnE=;
        b=a9jbyQrxiw/z4puD+A2bazT6RB+lIt3C5gOQJmsbIUcKgHu/Iumw9g7L0rkzUFsXab
         ZJDt7tWhYNBoTyflKMuVLBltMofTCmg8HP1XGVkF+ExObdZpD0dxkZQUhmFoI7ESbhk9
         B3cVUQan5tFTMSJZMTepOyMtUSw7QSduuwBPK7BYJipIu/nrLIo9e9KjYz5puz4Rrt6Q
         SmF8cssMpv+JBKgRTxgapbuBc9H6DYmWwA2dU/GVlINnGvY0gkRsRe27xN5bRHJzuizr
         6GZNbDA2BH6P1nHiHBbRRTwwXGhGIIllIuLaW0DmxOk45tCHpnhvzwyHMuwMEjpDMF8N
         Ya+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466426; x=1740071226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlLNOt9fP+kEnliAil52DiLv0in7lZUPZKbD7Kg1MnE=;
        b=Nh5rEDbHT9TOGBuC6ldFqyWbBstFYoFT/CyGEzKDiG9eApWbXmHaaGxnb/0iyKMe9d
         lw/N8doSCSTxSf7/42/mteRkSvCgrylcx7i1Gpt2+dY7t/mnaJyx7ZWqw7QIvj766iXu
         9YMtNC80T/N4Oq7yTkXYlhXHkJ2iNlCwSTITgf8MKkyMjox8JiAk3rpaCVssxLh3Anz7
         UXpUcpB3jL98+BYKGnaoVVLXLL+mPHa0JRXug6IfJeUG3ZTMsvhEj4BeiYUtOXMmgc/P
         i4kp1e/Dc16wGMctoasVpC6Q924yGGdtb1dqIbAbZU2iByoR02o+8WH5+8Ob7NgbQpea
         NcmA==
X-Forwarded-Encrypted: i=1; AJvYcCWB4Zw0cUGvfK4tJtFZEjiGUXrXQcQ4nGr/igaap/91vXVZZEpUGcedVgH+Ji7BR+AGv7ndt0H91hhy4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR/XXw6+F4PXsjkyUGsV14q3xy0ztyiLxRi9XPOoqwhkS1veC9
	hJgJhve5tEpiGgHDstbPKoubDqe2q8WsJ6OkdXLQ6iED3Mr6pcRhtQm8PyD4Kg==
X-Gm-Gg: ASbGncu0lQBtvuSwWu9ebChcDzMQXjxB3yIOjjHswnf4wMGaej1tAzSs2bmLkn1OlEN
	V+/BdOICPMZlZ6/3bRGvyXd237UW1XUQ2u+smTFESxGHzQNUkCT/o7fabjzpZs+b2Uw3zP0MgqD
	9ojmRb6fQNen31d+Lb48RmJo5WaM54TSgTKpZltijsfzJGSLh9rxOi/7YRZ47TYFtLpbu25A8IK
	Ys7gAuXSvSg+R5fS3sagDnIOXAVFjBwl2Pu2POkS6IALnSnfTG/3O/Qju8Kv2+uSviTmcGRQp27
	vJc5NAnUyW3KQKSw70WPFD4jCz2CwUMMsw==
X-Google-Smtp-Source: AGHT+IGsMfgrhffZotxEBPAkCoKFxM2e4MJHynAIf4UclWxtnIYSVF6Pzff8nHgCVhV2dzf3/QqyvA==
X-Received: by 2002:a05:6214:2a8a:b0:6df:97a3:5e76 with SMTP id 6a1803df08f44-6e46ed8a47cmr126158686d6.27.1739466425747;
        Thu, 13 Feb 2025 09:07:05 -0800 (PST)
Received: from [10.200.24.228] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471c2a12436sm9719841cf.23.2025.02.13.09.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:07:05 -0800 (PST)
Message-ID: <e4a4c688-b78c-468b-8196-68d2df980167@tenstorrent.com>
Date: Thu, 13 Feb 2025 11:07:03 -0600
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
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <b45aab1e-6d37-4027-9a15-4fa917d806b9@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_090707_500172_BC260FAA 
X-CRM114-Status: GOOD (  13.81  )
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



On 6/2/2025 1:08 am, Ben Dooks wrote:
> On 17/01/2025 23:21, Charlie Jenkins wrote:
>> On Mon, Nov 18, 2024 at 11:01:09PM +0000, Cyril Bur wrote:
>>> From: Jisheng Zhang <jszhang@kernel.org>
>>>
>>> Currently, when a function like strncpy_from_user() is called,
>>> the userspace access protection is disabled and enabled
>>> for every word read.
>>>
>>> By implementing user_access_begin and families, the protection
>>> is disabled at the beginning of the copy and enabled at the end.
>>>
>>> The __inttype macro is borrowed from x86 implementation.
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> 
> If we're doing this, then saving the STATUS.SUM flag is going to
> be more important than before. We had this discussion when the
> initial user-access with syzbot stress testing turned up.
> 
> We partially fixed this by rewriting the ordering in the __put_user
> function to stop the 'x' argument being evaluated inside the area
> where SUM is enabled, but this is going to make the window of
> opportunity of a thread switch much bigger and the bug will just
> come back and bite harder.
> 
> If you want I can look at re-doing my original patch and resubmitting.

Oh! Could you please link the patch? I haven't seen it and can't seem to 
find it now.

Thanks.

> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
