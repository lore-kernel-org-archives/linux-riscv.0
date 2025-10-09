Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0580CCD183
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 16:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGVtWQOJaS/FrZiOkYEm3L0ybJhm25lGNtU/vXB1scE=; b=ug524UVzlr9lwb
	EJH//XiReRej/qb1cYrIF7zLh/20X/RbfBVS2/4mHS1tvm4pC6FQzaWZzkV+UZ1rvj1i8+Rwk2UcD
	SIZ/yFYGMy1vI0gn1wbYtnPEg3EyiTv5jXoUuXNEn+l481pQ50fE1BcsmmgvuElIsCSOGMSdeCknG
	C3W1pI6dYs9sZVrQjROVDbB3u/hc0SoHeyGUPMSzegCxt+JmYZ/B8Ye70hKeannoF1+DjNeCvXwtP
	LJxeYzeO3hshjijBu+YmR/tu3HMhAu37BP+ACoPsQOUc2ZFEkT3GkuQEg8hr+quGYxqv8GGVOMXt3
	WpYxOMn+uLas/7gfpdAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tmc-00000006imc-0dvY;
	Thu, 09 Oct 2025 16:46:26 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tma-00000006im3-1lHy
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 16:46:25 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-91179e3fe34so67459039f.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760028383; x=1760633183; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l69sAA+RqcMkjrNYYlZnvTMiAxsxuDk6BohwO3k0jM4=;
        b=NRWAAUnVSGohrMbXs06E05ssBaj34Ngr2HPDitUgJf1s0fiwLsRXPUzQMoHk8tdSb9
         qhGnTagKBUrTdjUOipdJjXKrh4fEixMYyHKPKgurbNPb8GGCkiaWqhYOwFZTE4WfN+7a
         IRJFDHnl8ZDFVnIFPHd7wZuQg1l5TTD00lNtCgQRnOssmaFqBeZw0hLB6fLwGU9MwWWQ
         jMoq6tU6/eoxXwWp+5dRh8r6+acXVdXq0uuECmJRbvxzTKDOr4PArbIRF6jzVlqIDQEQ
         tgjBxOcRb+BatZfgFQpjMAqDgKuTkWzB02GWFdMA8IOra8r9eUxm4f5dcCrhebjdn8nM
         QUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760028383; x=1760633183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l69sAA+RqcMkjrNYYlZnvTMiAxsxuDk6BohwO3k0jM4=;
        b=ITJ4fTayf3vAZ3JQq7cbdbgiBG9XXzeqrPzBpm1JODFkvWDtlYoK6425trbAm3yrMP
         81ctcPXa5UVjpTEZJF7yFYBpidR4xXdyr4Nok1/K6b+QD6SRvv5cHTAEDJ2IA2AjdJPj
         jZXkDlQScxXzMHp4YNK6Slu0s3kqHGg/6nv/fwjYT29KkLTcPlywhDAOAk7YkIJf+qbK
         XVF1jWC4RUm78QoFy8xkSHy0dGknZdTg1efi+z3a2ct8nvSODW0SQ/2JIn2YGkbgisTq
         viqXWKa/3Y7Z1Fy//Wx8SMoxROZC6sPZYUE7UcvQPb0A3551/tKqvx36G2jUQITtvyss
         00qQ==
X-Gm-Message-State: AOJu0YwqV3tUUSGDwefYzMK9mq5z7GRHvr7K9QjtV1x2/cCNV62bJRC9
	FULuLMVhmy7TgcCzCfWAro5+EHisF6FvB7Ai/xWFk5cYjoLeEqb4e8eSlW/373KF+X4=
X-Gm-Gg: ASbGncusDZIgeH41him0SV5W/yXFZPNK2ZGriBvVZn0rG7D5IIDYAeSjUyhnY8PX9G6
	u96mHK6WQP1tUm+GZeyvq+QyWP9L8AuaVs9zzdtVJVdJOLrFz20PTjHFgtcR8g3fotGtSdlAeF7
	lQ5bgXRW6+ebwV1PXOiwFIeUAreI2dv9LvvNqmDTGR17fsRoVEJfgWVWAj2vlc8L0S+iFau0NvQ
	akMyqnogsJ25m9Cldo5KQN8/E+2xPv/iXjPt/hDPxi7safAlhui/h/Lv39kqJfWSrQAXQl1jTS0
	XenLFvRwvb94zZnr8+jjv7NWKWV3I03nzd96mNdAEF/lMjPmafljkauSBfV/lTv//7oju+dPnuu
	CPhLEOuq0WaxIsOtFYoyclbG5SWXkNEdHLmrs3V468Zq+kSURKvs9Vx/BacU=
X-Google-Smtp-Source: AGHT+IHb56VLYwDyYpisbd61rv4b/ynpgAfxpu83YRCwm5JW7AaildP7fCF4cs3XdphAf5nkTFwpyQ==
X-Received: by 2002:a6b:e916:0:b0:8c3:e106:74c2 with SMTP id ca18e2360f4ac-93bc4119105mr1227233739f.5.1760028383330;
        Thu, 09 Oct 2025 09:46:23 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e2594a558sm8145139f.7.2025.10.09.09.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:46:22 -0700 (PDT)
Date: Thu, 9 Oct 2025 11:46:21 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alexghiti@rivosinc.com, shuah@kernel.org, samuel.holland@sifive.com, evan@rivosinc.com, 
	cleger@rivosinc.com, zihongyao@outlook.com, zhangyin2018@iscas.ac.cn, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, 
	Cyan Yang <cyan.yang@sifive.com>, Jesse Taube <jesse@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Nam Cao <namcao@linutronix.de>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] docs: riscv: Document hwprobe for Zicbop
Message-ID: <20251009-27aafc23cb2a92c1c9b324b2@orel>
References: <20251009134318.23040-1-zihong.plct@isrc.iscas.ac.cn>
 <20251009134318.23040-4-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009134318.23040-4-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_094624_483980_23C18088 
X-CRM114-Status: GOOD (  21.71  )
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

On Thu, Oct 09, 2025 at 09:41:53PM +0800, Yao Zihong wrote:
> Update hwprobe.rst to include documentation of the new
> :c:macro:`RISCV_HWPROBE_EXT_ZICBOP` and
> :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`, following the same
> style as the Zicbom and Zicboz entries.
> 
> The extension bit records support for the Zicbop extension, and
> the block size key reports the block size in bytes.
> 
> Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
> ---
>  Documentation/arch/riscv/hwprobe.rst | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 2f449c9b15bd..3b9c9d7e1409 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -275,6 +275,9 @@ The following keys are defined:
>         ratified in commit 49f49c842ff9 ("Update to Rafified state") of
>         riscv-zabha.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOP`: The Zicbop extension is supported, as
> +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>       mistakenly classified as a bitmask rather than a value.
> @@ -369,4 +372,7 @@ The following keys are defined:
>  
>      * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
>          vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> -	Instruction Extensions Specification.
> \ No newline at end of file
> +	Instruction Extensions Specification.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
> +  represents the size of the Zicbop block in bytes.
> \ No newline at end of file

Please ensure this file has a newline so the last line doesn't have
to change every time we add new keys.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
