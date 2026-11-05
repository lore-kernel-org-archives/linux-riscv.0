Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D045606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OrBnTTM9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=FCZnOG3L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/rzx6/vnWo7AfrHNTxDG8izHRl2PCZc7TdKK3qGvvJw=; b=OrBnTTM9rXAJUWfWjGbF/qyQrP
	sIWwm3D6uL36LqCBT+IXYCgSPFtxLOi9kKyuKTrJ5/Bluvk0Z0LFsn3pAshvP6boRmVbgu/Lg1ZkK
	dRlGvvP6KXYyt6IzWHkDepGKjHi9ZxM5LdppxCHEC60y6TSzLOeeT9YTZ/c12UIL2CbsCe0VXl96V
	Dyk8wFDrYBGKBnMTuja8+mEmA3srMnOBY0Y1hRI0QykMYt7q1gasCVMmyFG3ZesOT2onRMtXIORm7
	xIIh11313xXE58emXyFZbepu5BqyUnUa6WxboUvTHPfPzAJqxstV2cIqrQluenmF6S44cort9DXNR
	4OnN0WqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzbj-00000009QoC-0wTe;
	Thu, 05 Nov 2026 15:42:31 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzbf-00000009Qm7-3Bvd
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 15:42:29 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4f488ba6e90so820572b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793893346; x=1794498146; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2sJa9gA62grSjnT/BctMS7+1k6XVxUf8Ncst9sUL/U=;
        b=FCZnOG3Lwjplvu+PkhQaQvLnyj66dYpND2yJvV2byp+eWI6na0i11QJx7B2pseUr2E
         aHAytR95S/6KmrH5yAAY6kxHFYO4DgCj4ZnZOu2c9ErcTbkBgXv3vxXeL99TcnTuof8a
         Cc9vw0ub4u2CsDyf7D9mI10eEV6UgLP4vFM9MdBzJtATjccdBesDgKorHT1ZNldXwlmU
         FhM9g6/l+wpQBY/hfvg1Ar8tfh0kuTLenanVCrpRemKMBQBbEsKdMhl0VlNLqube2FCm
         FWDZcW+eacoJxy1N1GoY6MgSKo6y9wLpjkGAWRRMjdDKRCDCILq4LgVJLLqFrCLwSWAM
         ktpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893346; x=1794498146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2sJa9gA62grSjnT/BctMS7+1k6XVxUf8Ncst9sUL/U=;
        b=ICQ/Max51A4iTBbPEvzzzr/Yrpf7mWvJdA0XeYRCg03dieUYj5nAaDK7gYe35ZEKCD
         HtKgfiTEmtN7CLRGJeAuDcdfpqRBXWIBvUzcCpUPKzygUD9jIiolicrOi0qN8O5jeklJ
         l4DyKh+FJccZr9Jjc5vUkM53iEtVnjifjUyRUzrzQkB4eBMmO7u/jYIBe8eVHyyNqRtp
         VEOnU7y3/xRsMEWE0qM2nOVBr3T6VMGQjMXoxS5iibjmZeEqMRBcpMJ97tOytW7Y7zpe
         KC0dYE/YQl4k2N3/bqwsq73a89f4yb9wXO1IEudsPZtDyfJKrljKM7qZCqriePDQJKoy
         0ENw==
X-Forwarded-Encrypted: i=1; AKwUvBx42iG/FrpsVWxUKGQHIk1jJrzIXgFcat0LKOS1k18bSl9GnhTKwmbQbg5bMgWvlASnK7KpaIX2wVkGoA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9OPseWSOJC0zsWd859v1Vmw8FiPbROUUH3EHVqRkPEeGLQzJR9
	s6XmZ32svK+JPPNYdLcPr+cqe+rfdE0E6iG7KnSMoZ1yMDxF1cOLlf1JkwFCQokh41c=
X-Gm-Gg: AYBFou0qgutRHMXyPcast8TPPJrNrMCwpzDN4KXg7lrjaIQ47A8JhWXNAGVadxFnQML
	CXUYee91UYX621MnjwQlgIonNdQH2bBwhrOr9m4NzwNc6STNzbvq8v0rvhstpcBBV5K0/Tl7ua8
	6wSOopMY3/FVGmsV3P52JIXsuKNzUZ/Eya+n0OxcFJt1BEZrThO74WoCtMhspB6s6CndoF5Gm68
	SXGpHVLuRuj/ShQuWz/bwYUaI9whhzIQer7Us5/YmwKzOsX9RcILMwnu6vyDQpGmksAqHSfNuAp
	SwN5QzgpgZhpiKtUHdjf971/zsfYPFttQntWLY/qNMtAAOsmAKEjgGo+4k254/3E4LjtaaDEtiE
	Qc8O7y8gLFuofV89n8PiNIJG/RjnicrsdU17bsTwaL6nnpG48NmWveTTJ2YgI2o3qo+cVYspVvO
	pJkSPdlIGP+O35TtQ3c9M+1K6R4MY6+5TElbDQT1mh49yumjeSysv2CeuMzIFDW+FDbssk3OrAF
	/XlLzfoV8KcXQjcDAryvrAo5JYuuqlsBn8KIWFynBIKGGBT+Wi0u1dluN7DRJKJAlEwLIiNanBn
	nRultW1jbm0b6WURffQW1rMq8ToOvXc=
X-Received: by 2002:a05:6808:1b2c:b0:4e5:2f2e:45b4 with SMTP id 5614622812f47-5640dc2a7a3mr13125199b6e.21.1793893346544;
        Thu, 05 Nov 2026 07:42:26 -0800 (PST)
Received: from [100.64.0.1] ([136.226.84.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdfa53sm4318163b6e.15.2026.11.05.07.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:42:26 -0800 (PST)
Message-ID: <4ff91002-8a51-4542-8d55-1ff68cd1f684@sifive.com>
Date: Thu, 5 Nov 2026 09:42:25 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cfi: Bounds check restore token in
 create_rstor_token() before swap
To: Tobias Klauser <tklauser@distanz.ch>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Zong Li <zong.li@sifive.com>
References: <20261103132003.24312-1-tklauser@distanz.ch>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20261103132003.24312-1-tklauser@distanz.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_074228_000775_6A102267 
X-CRM114-Status: GOOD (  16.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03 7:20 AM, Tobias Klauser wrote:
> create_rstor_token() computes addr and passes it to amo_user_shstk(),
> which executes ssamoswap.d on it under __enable_user_access() without
> ever validating that addr is a legitimate user-space address. The
> sibling function restore_user_shstk() had the same issue and was fixed
> by commit df333b72c0e1 ("riscv: cfi: Bounds check restore token before
> swap").
> 
> Fixes: c70772afd5cc ("riscv/mm: Implement map_shadow_stack() syscall")
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  arch/riscv/kernel/usercfi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> index 86141e5bab82..7971a98ca0c3 100644
> --- a/arch/riscv/kernel/usercfi.c
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -158,6 +158,9 @@ static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
>  	/* On RISC-V we're constructing token to be function of address itself */
>  	addr = ssp - SHSTK_ENTRY_SIZE;
>  
> +	if (!access_ok((unsigned long __user *)addr, SHSTK_ENTRY_SIZE))
> +		return -EFAULT;
> +

Ah, this is necessary because user_shdw_stk is not trusted; in save_user_shstk()
it is the user ssp CSR value set via TASK_TI_USER_SSP in entry.S. I had missed
this earlier.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Though since it turns out both callers of amo_user_shstk() need this check, it
could make sense to move it there to deduplicate it.

>  	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long)ssp) == -1)
>  		return -EFAULT;
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
