Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EBCCA1015
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 02:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tkAOtzPmPN4KSeOFkXDtygP3v/7WIvr3V6u525B7JU=; b=dRcgFC7ePMRyNC
	F+pLOk9xI82uwfFPWpBzSz8VFnZp5P0CwSCPYiccM/wmaehoBAVkIy6rPPKi/vxqry28m3ouu6Lns
	qol0b/hFz/vuRvq3/e8tp/rtDsllXru+HkLVNZZvvWLlcYE0uiN4nr8FID70O9F5Tmp+JaIBGs7E4
	63ySuLmAYu8JqXW6/AZFynF8aHPFSgR1ovG7l5XFGCW0xD3U/AeAXDH4dSnEUTowyCgE0WSCScBt+
	17duwTRXmKgIoAx47pnLIm7Vf4vLWcPYieHiEwXrnBuAsef9QOcSkCaRUintKb2Mhq6HENpZlYPfl
	bV7gCwyC6HqDELAzUyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzSB-00000008Heu-3Nfu;
	Thu, 04 Sep 2025 02:11:59 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uty40-000000080Vr-2K8I
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 00:42:57 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-77256e75eacso495474b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 17:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1756946576; x=1757551376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRKp6Q/nB96pBMeqsdUtO6CB8seNwZ89Vp0VznvbBKw=;
        b=XfX+LSWS43YoPAyLAEGEAC+De+iwxwfrOxV9216sElTDCxYefomvVy3UhbLVw760d1
         nJqUM6TWbRPwcp4dKj/YUeaFWV4MqejlV5KvXLQhTR3yLrGa9Tb7Cs4wXonFxyxloNxa
         NQUEn73LepqYTV5xDBCHzI8I4FKsiLf7XwuFv2OvyPqnyBL6tCHJtvPb3O35xGv/CZ+l
         7kLQsPnyFgSzu6VnxW1hVjQr7kts6XPFEQyoKHSKZdlAQtsy6s5KfcpIEMbAheS1i5Pm
         ogiVa42J76LiTyjmPQmF8h+jnG2Q+iOQ2tviOdL0K9esCVwD9gE36OipTDbM79ulB1by
         Wimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756946576; x=1757551376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRKp6Q/nB96pBMeqsdUtO6CB8seNwZ89Vp0VznvbBKw=;
        b=NW6yPJ8H+W7Dr2/OXoxKj23s3JhhQ0ufSAYbEw+eCFEAskxhxuN5cFABkriTsoS1d3
         j5icNbjjmZc3wYANLkVgjhPqnE2WA5XQj7elAnkPFeW98P4s12t/oSI6AgC3fBfPbAtk
         bv8+j6Cu4WolZ84TSBhZ9NYgYy1IBw5S/uJTr8107kg4KnDdp7K4AeMYTKzfZezpF8pI
         gjy8N/UKgrgNU9Yr6LQIuqAKFvnzDG7+BE4o0hi2MnDr7eA8OUYKmUwDV3qLCyNkbyQu
         /YTDhuU7J25PufL+Il6M2PEfIJHuT8+6mfefla9jIShwYMP455sM3Q+5YLHeBlN6c0R0
         KmVg==
X-Gm-Message-State: AOJu0Yy7i9SNTPkkxDN7WIgNcfmdzUg8wK7xa5Alo0uoJlZ7tTOhHA9e
	+QDueQndXrmRbmvYWYDvrv/0qckfk3ZSvisD2PH+bfhUw2J5RuotqZcj4ezlViFkRQ==
X-Gm-Gg: ASbGncuK1pc1xD8MQU6b1VjV+SMq7AwFewdw7FUuT4cyRUzA5tyxAPXbhmLZPZb5xaZ
	P7lzD4bXGYhJkvCkq5f1iLx+2wMzR5AS4Ig8Axjn/hUy+AvTbGAlOGGp7qTus7oVxzmez0Qe3do
	Qhlp0EqTH5J60vJopDx0CC+/xLkX5uOSt6l6ODXu4hX8pI08Eivi77APoRsqqjMkTjsT8hq8r9R
	SHY4qWNG8i8YMXK7HurRG+i1YL4z00AbckX8hgYm2IM1vSuVSuBo6O5wpm3rcHpDN94B7A/R7Sz
	0cU1hnh9lly6+GbjTwyVrUVu/sUOPMwqudj8SLJvQ0/1Csn6IOrJW9Wb8h6nSv1GLTuUW/Z/GqG
	m9vhjtryvrJ3QydVHzL/9wzDKUeLodZrRexi+wDbPlFCaSNwsRR61Ig==
X-Google-Smtp-Source: AGHT+IEchyLbqCG1IttpCNZB5tDBBfo2NCjV8oSKclrFTZ9oZqLEP1Wpq2MwEz6HMGThU9nnXWM2cA==
X-Received: by 2002:a17:903:3847:b0:248:e3fb:4dc8 with SMTP id d9443c01a7336-24944aa2905mr245867995ad.39.1756946575545;
        Wed, 03 Sep 2025 17:42:55 -0700 (PDT)
Received: from [192.168.50.200] ([202.172.96.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ca41746casm24333915ad.48.2025.09.03.17.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 17:42:55 -0700 (PDT)
Message-ID: <2fb511b8-4841-40e1-a364-e52dad51e300@tenstorrent.com>
Date: Thu, 4 Sep 2025 10:42:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: Fix sparse warning about different address
 spaces
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250903-dev-alex-sparse_warnings_v1-v1-0-7e6350beb700@rivosinc.com>
 <20250903-dev-alex-sparse_warnings_v1-v1-2-7e6350beb700@rivosinc.com>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <20250903-dev-alex-sparse_warnings_v1-v1-2-7e6350beb700@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_174256_598955_AB6300BD 
X-CRM114-Status: GOOD (  14.44  )
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



On 4/9/2025 4:53 am, Alexandre Ghiti wrote:
> We did not propagate the __user attribute of the pointers in
> __get_kernel_nofault() and __put_kernel_nofault(), which results in
> sparse complaining:
> 
>>> mm/maccess.c:41:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long [usertype] * @@
>     mm/maccess.c:41:17: sparse:     expected void const [noderef] __user *from
>     mm/maccess.c:41:17: sparse:     got unsigned long long [usertype] *
> 
> So fix this by correctly casting those pointers.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508161713.RWu30Lv1-lkp@intel.com/
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> Fixes: f6bff7827a48 ("riscv: uaccess: use 'asm_goto_output' for get_user()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Cyril Bur <cyrilbur@tenstorrent.com>

> ---
>   arch/riscv/include/asm/uaccess.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index 551e7490737effb2c238e6a4db50293ece7c9df9..f5f4f7f85543f2a635b18e4bd1c6202b20e3b239 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -438,10 +438,10 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>   }
>   
>   #define __get_kernel_nofault(dst, src, type, err_label)			\
> -	__get_user_nocheck(*((type *)(dst)), (type *)(src), err_label)
> +	__get_user_nocheck(*((type *)(dst)), (__force __user type *)(src), err_label)
>   
>   #define __put_kernel_nofault(dst, src, type, err_label)			\
> -	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label)
> +	__put_user_nocheck(*((type *)(src)), (__force __user type *)(dst), err_label)
>   
>   static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
>   {
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
