Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F716C35FFC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 04:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fx35PnLPq5WxxwYGoMiIpP6pqKWVpNoK1JBYMopxKd8=; b=18Hq76KFOVKJxU
	40msKX75mnPz59pRg3X0rEbkfacsJK2H3CeBx7hrb7gehnchEH4BsBlfOpWxJiFRWxw9Hzj88WEw1
	oDpnH9RYlMI60VVI7ZIm5lZK61E+gUkuYL43YshbIMsVJLWM3RxKOBBPX/ahvdOXJKkiH4f+QB8eH
	ZMvLF7+BF320i4m6a3l6zDgbIY9Qr7IMXwaRw/t6dmjRJfhp6SxD+AjeUkywIejX+EzQT5kfIKyRC
	9QUbRIlJo6GeIAXuou9PQCNj+nipE0KxG5DGsEWD+8D+0d3kxxVvH4gdYeM7GgT6xj/JwKX0ZVLir
	HV+rgdPSNyi/67W8UOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tul1I-00000007yVe-0z38;
	Wed, 19 Mar 2025 04:27:08 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tukyq-00000007yIP-0EYx
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 04:24:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-225e3002dffso71985395ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 21:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742358275; x=1742963075; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4F+5XpwBlo6A7J8PT3rf6KdPFObjOeaat29Z+tUAl4=;
        b=VbgHv7XtYTmLrtSoH+GYlYLJA8IInYFWDuDNu8KMi0jYYqwUs1h36tub6ZJ2pCLkLX
         S30Uge6YM6V31iT070ERNKxAhkLir52667K+GWxAmAqwyXlgbs2Y5+J/yollmXdsHuLc
         IAFCmopmzSVj+yTguZzNYub+XgvLHJKNMYXdvs8K3oGOdjmPjNv1QMQhE/22Og0OriyY
         ubk40dzgRc9aXpIEdyMzQXQbdVyEa1+YGCz9RrRgrhZrRHpKOAtNNzZ1CEbGbSBo4GGH
         RcElKvtva4TVzdGqQaY/OS44Y0+JMVqnzDNbB6pjZwGweCi4f+jV1bukNPAYWuJGhGR7
         oWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742358275; x=1742963075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4F+5XpwBlo6A7J8PT3rf6KdPFObjOeaat29Z+tUAl4=;
        b=aWPCJSjPtnGDiXqIz7+jinMGbsVNhg4V3hCFCSVal1l7i7xELNchMnbZluaAoVoMKf
         rwx/IvmoZZSaduj8ZbrjzHP/GdxG83ztHbLKaqzDRX4JZi10dVwDq51cWhIEjfoNahhA
         PHPhfO7d4P8c8itqJItAP+TNoIzXBSPSEu9X8Q5tNMxbWWblGNf3HeG5JlbPE7/ZhSG+
         Tyy9UHqP21GaBdjcf6ENkwz8+pU8BiG+YAVKXY71af/7k1FOFK8q5Zzj+s5tEoOWLKCA
         M2qOu5p534Og8Y8IVw7uTLUKoMzFnnbdznow16D8Y4AiQ4ZiTw3OXZlJgebgoFH1YHwE
         +sBw==
X-Gm-Message-State: AOJu0YyIRFl47FFyPH/E42v+5TkbQZTvcPE0hrfZObp7Fm5u6Aku11i0
	4iAAFkyZIO5YJY9VFyOUzbtuX1grc7xiwFfoU39EGc1h8NW98P2fiSkUBKfmiQ==
X-Gm-Gg: ASbGncsEmv7tyM32C27BiefyHpRwVWTCBVwu8X5LLrZAEZtVHDzAvR1J2+g7gHVzb++
	pTmc5whkpUzpOa/SIxlg6e5lXRDNITxXi8Ozx0NJ4bDpnXr83k1NfptikmdkVqMrJzcvldc3VjT
	RrfXs7QNFJnbWl+pfiqzhsQcQGHTObLM+DtTvfKO171ZNEkQTbhHJp7vljmMA6/3w5N4f7bnUuu
	CTRSUCXF5OSk0EAgMNzJjEgXhi8AiX9bat28IaqiFuiagGBOnV/vYtgtOBzNcz3VcViK6wF3Pzv
	dvFgOP3hMeULhpTQRCxfDvTAPlbCg2JzpQBxDUH798Uvjc0iBCk4bjO9ji4rWiIMbg==
X-Google-Smtp-Source: AGHT+IF5Kokf/3D6IznTV3Y93r7zaXDK9pmKSWn6ylEux22EwdaACa3yC7dDh7Wvn/nDjNhefacJww==
X-Received: by 2002:a05:6a00:3d54:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-7376d62cb88mr1927818b3a.14.1742358275073;
        Tue, 18 Mar 2025 21:24:35 -0700 (PDT)
Received: from [192.168.50.200] ([202.172.96.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9e1beesm9963281a12.27.2025.03.18.21.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 21:24:34 -0700 (PDT)
Message-ID: <518bfbeb-6ae9-4b56-b55e-ffa4b9438188@tenstorrent.com>
Date: Wed, 19 Mar 2025 15:24:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] riscv: implement user_access_begin() and families
To: Alexandre Ghiti <alex@ghiti.fr>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
 <20250221000924.734006-2-cyrilbur@tenstorrent.com>
 <9a94c74f-4826-479f-aaa0-e87b3bfd30ff@ghiti.fr>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <9a94c74f-4826-479f-aaa0-e87b3bfd30ff@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_212436_097504_08FD0AE3 
X-CRM114-Status: GOOD (  13.97  )
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



On 15/3/2025 12:28 am, Alexandre Ghiti wrote:
> Hi Cyril,
> 
> 
> There is a bunch of checkpatch errors to fix, see https:// 
> gist.github.com/linux-riscv-bot/98f23fd1b04d6da7c23c6cb18245a158
> 
> Why isn't there an implementation for unsafe_copy_from_user()? Let's 
> take the following example:
> 
> user_access_begin()
> unsafe_copy_from_user()
> unsafe_get_user() <==== This one will fail since unsafe_copy_from_user() 
> -> raw_copy_from_user() -> __asm_vector_usercopy() which enables and 
> disables the SUM bit.
> user_access_end()
> 
> Another thing is that with this patch, we lose the vectorized user 
> access functions, can you fix that too?

I've just been looking at doing that. I think teasing out an 'unsafe' 
style vectorised version and shoehorning it into this patch will be too 
much.

Would it be possible for me to do this as a separate series? I'm 
motivated to have this happen - we have a vector unit, we'll definitely 
want to use it.

I will add that a 'standard' copy_to_user() would still find its way to 
calling raw_copy_to_user() and so could be vectorised if all other 
criteria are met.

Thanks,

Cyril

> 
> Thanks,
> 
> Alex
> 
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
