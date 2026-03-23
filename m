Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E24D58CBE
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 04:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/12KKAPew6RDAceBrwPhAjWTcNGqOSeKNGR1okhdZvE=; b=Hso/VDVRYhKzQ+
	TFor/79LepL16SUE9mTB+nv2A6rfj+tyfCf0NclqIUaVixN/CrMR4tpykm3jnXdcKMn+n56YUw/Nh
	gtDTxkv44FzSOkULLgZmJNHYSWvVBzsub49vrElpMUOKPACadkPrApuZpXjuAPV8ThpxYQcDkgmrF
	43s3UUsNzebZ49SEVyImTFaURaVVsGYxYm5tkogcB7NQlt0VBV+OJN4iZVRH094Ry6IX45zQJED+8
	gvt4YShiqG9LPuya+P6XSklyxB5hQHJ1whZltZP8T5Gw3xBNTgF2Dje3QR0VhWVcxzKDik9xfRTjy
	pIGPSDB800xppHLkg65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WYi-0000000FyiE-0HvP;
	Mon, 23 Mar 2026 04:06:32 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4WYf-0000000Fyht-15eW
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 04:06:30 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-79a2ee65171so21325847b3.2
        for <linux-riscv@lists.infradead.org>; Sun, 22 Mar 2026 21:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774238788; x=1774843588; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CE+AGCF2MuXLVsZ+yjsvQBn30B0qx2f1EamJgwm3EgI=;
        b=QXmfnbGf8I9fMLrqjsThRkvY/pQn0jvQlweAK0x6xNG1+P0wtCx9ybpIdP6A3AV0CR
         J6paHNPpxURBAFwMV0L6kLayDH2kI7meBFJK0tm2bPnWC1umhvIKGl5i0fHUXEYnRkag
         zKU4A9lrazuFctqnu90i+nsZ6+ztoo+jg02sWZ7h6V+sZRjVxAVk15zA3kgLYtTFYiDR
         8rOiaBORxRMHQn75h6QSIuwwjsN0s9p08CfH/9TfIh5URzEfHpP8p+SepJdYU2cYXs/s
         Z8YtwBHeEjSCX4UeY74sECRx36phKLNAh1JYON/GvIBgtikthzQdXy/Bi30+WNgVZcO0
         IHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774238788; x=1774843588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE+AGCF2MuXLVsZ+yjsvQBn30B0qx2f1EamJgwm3EgI=;
        b=ZUILdbMR7uWrORIqI9ihoW7SoFRZ1bZ808EmeJ11Rq5mbvWitazgipVGu5Pr4J4xjG
         yjD8sgls4DBbrqwJCNNEV5E71S+lgjNNqnYLYvpFHITe4nnAV3/tR+qJtngLlgQrJxe3
         cetDpS7TlEmTXim1tlxOfhN+X+86A1TxcClxiVVyzGUMeOdY+WnDmbRuOiZXDljxywsN
         KgkiF+pe+JJ/z2FVWiAcxdA9ln6+44ZpV8F7Gqf4byJbaTHx7GvjOPkf5B04DYQQnMA1
         wTBC+3ZIGe0aUEqBVwCuo9oA3ClkO8clDYMa/RBk74KZuj+z+519cJAtEtg3FzMpWOBB
         R+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXv47mCyoqOKxuMJG5nd4kzHcTreKj9s2mcxL4pFPuT5F75XXfGUmEqQmQUPGVL9kgJDPDGOYI/8vmslw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx8qhyn7004DiDHy45iM/WG0NXjsjrbNVqRP1evnHsYLO1jAJl
	5FGnHet4cQDdDyAN4YXbJKl/4ey6LNzfrcxsFfsyF5TGUtZ3f/AqK0PKst3QKQXAHGc=
X-Gm-Gg: ATEYQzzknLz0/XktEZXeGsiWnSA9lT7L73o2ofnEl8FY8lPB2XHPXkZvpKF4Gp0isEi
	/QIYem+K9RlLn0oMWbeqfQMbUH/THa+nT/OEWptX3g0Ee+OVbsGZb2b76TmqdJ1OWmkQHsjDFHQ
	lbjtiHFxA7crANTwVfugfiDxwhoW6sRdWaIM+jHCCBa3vsiIewTOKd0pU2rz/dhuCAnvkL49ZRC
	2bgJQ9QPQbYHxudPBXg/0cSqg7Sp3gJsKhVoSF27riNnk/eiaD1N+M357VePZf4ISUbXp+Mg3lw
	r+LmXZqrsOlQ5BQAZEAQVny5PutrActyzMgDK1Nc/3SWheadsggyb5COAPlnIE6ST0MpFg+ctya
	yUJKFkS5D6hwtGW+RDNjVZTiEesF+W8yUq5LKFnv1wQMMYMzgIWE7aIRwMFw9AJXhhKlMVrRlJg
	mrk/ZdDIgz528ATT+Yu2Gcp3h8fg==
X-Received: by 2002:a05:690c:8:b0:79a:ba98:9b7f with SMTP id 00721157ae682-79aba98a71fmr6480097b3.58.1774238787747;
        Sun, 22 Mar 2026 21:06:27 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.102.252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a33acsm52232707b3.3.2026.03.22.21.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:06:27 -0700 (PDT)
Message-ID: <e0357439-08f7-4bbd-bdac-f525c6805570@sifive.com>
Date: Sun, 22 Mar 2026 23:06:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set
To: Zishun Yi <vulab@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>,
 Zong Li <zong.li@sifive.com>, Thomas Gleixner <tglx@kernel.org>,
 Charlie Jenkins <charlie@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Nam Cao <namcao@linutronix.de>,
 Simon Schuster <schuster.simon@siemens-energy.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260322160022.21908-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20260322160022.21908-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_210629_324478_BEB50CF5 
X-CRM114-Status: GOOD (  16.48  )
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

On 2026-03-22 11:00 AM, Zishun Yi wrote:
> In set_tagged_addr_ctrl(), when PR_TAGGED_ADDR_ENABLE is not set, pmlen
> is correctly set to 0, but it forgets to reset pmm. This results in the
> CPU pmm state not corresponding to the software pmlen state.
> 
> Fix this by resetting pmm along with pmlen.
> 
> Fixes: 2e1743085887 ("riscv: Add support for the tagged address ABI")
> Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>

Thanks for the fix!

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> ---
>  arch/riscv/kernel/process.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index aacb23978f93..5957effab57c 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -347,8 +347,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
>  	if (arg & PR_TAGGED_ADDR_ENABLE && (tagged_addr_disabled || !pmlen))
>  		return -EINVAL;
>  
> -	if (!(arg & PR_TAGGED_ADDR_ENABLE))
> +	if (!(arg & PR_TAGGED_ADDR_ENABLE)) {
>  		pmlen = PMLEN_0;
> +		pmm = ENVCFG_PMM_PMLEN_0;
> +	}
>  
>  	if (mmap_write_lock_killable(mm))
>  		return -EINTR;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
