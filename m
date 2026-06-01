Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DE8CD6E56
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 11:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b37N7vAAUfSGNcY/zweqBBDG9PdCD2ed/DDUBt9ASKA=; b=olDxyd47gQ1g7Q
	I4R0c9YIAUEQBYfAbWjFQYDCu1lGftqyDPju0yk/P6rWLBif3RtC4iGF50VyJwaWooG+v3MHFIpfD
	4reJ0QVglJB1ArjdAIL42GRl3bUeqLFsjV+WpAZHfne7DdITdO51f3IJ869OiaBSY88OZ6vx9m1Oa
	F30h8kDfcBXRk4oAwc+JX46vUXKMVeFlhAZTzSm6vIycS/OgN6xCERsRNDfCpQgMt/GKi17Iwl3Dy
	ZllyYCWInMZL0v/+k++P6A0id5r/kNmJtdCf+wJnMb+vMDNkwb7sgLcCn/4SKOYEy8L5mlYcexLtI
	A0g/f9+hYhNoCtHbTEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0d2-0000000AiPn-0rFk;
	Mon, 01 Jun 2026 11:16:20 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0cz-0000000AiP0-3th3
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 11:16:19 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so432035a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 04:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312577; x=1780917377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A0RvTxX98K/pUu8wDZcU84mvng4xT6uAwNgRwaMuMuo=;
        b=V4u81qKDVEx1mOMTRZLsHcW9uyTmcSrYP73qHXF0eOCEqokqVj625NCFIaXHd2/zs8
         zdZdMxmNfNSZ2F5d8DhN7zbICYin+3MYGAPZeIizhhcXFk5ffmtq/yuEyVuBHFYoczap
         P5EQAbsya+OwONdTsP/MzhevrgPMsOON7KBUJX6anH+M1xZGtUSNG5Sn/mOHjxRNl1B9
         VP0mjcV8M0yXaq1hMOEttp+mBbNfKH5rYr4x5l9eKe3szhz0ZhOa8/4YMLRum08apHSs
         3MMgrXM7ZmqXKru8lcMvboa0jzPGfJjKM+sZ+ddIk0mc1k08mK3b4/lDOzrvKX9ICdwr
         5bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312577; x=1780917377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0RvTxX98K/pUu8wDZcU84mvng4xT6uAwNgRwaMuMuo=;
        b=ATlY/PQnZ9hw1rLx6eiOPNcc1pMfkVL6Qjw6KFcXuDF6tHyWU9RlAgudf6GyB0zW20
         5sNiyrQ7XCLYjjT2e/KXqS9ijPVqhynEVTjkCghpAgCVmcO/TmXtVVJChjFlmVG14Rzl
         QTqBkZ4SxRfmHJBbzCCluwuj+5W/t/siH4vaOU7l5u4C2xUxLqH2JHmtB3QX0mBgpqnP
         6M1qiB6ibWKhNNlfGrLeAsOE4XFVg/EK1/yFuDy4EM18bmqhSL+e1h2MC7GYOZdpIl79
         iE5BcKK/QAfYDkN899gUHXGayfmSv9GT1djwGtOHIl6T2p6OYErj+gBrFj5ziod7yUMu
         2zHQ==
X-Gm-Message-State: AOJu0Yyux7FoHaw16t76oR/WUhNfh8BREHXRgNz9r61zNcda9V1mKuqa
	ZrXWG0AXb9JuYFFmxJ58pcxtQKttrq2aVziCG0pOcbrdfOGfqpgpJbLV
X-Gm-Gg: Acq92OEX5lLHIVmsVAge7bI9FaHLwjVV+QfKyxMAKiEUNEODjEynGlAMf9BQPfeAoEL
	SYKkUjThHTfWUN9BaZTs7tKjZduGw0qZg/+JQwNJTZ4QSHZW6TiqZ2/OElJI+LIp2AFdmz60+zc
	8gaXxK/6YSgMK9iSJzhmfgdLs+X26z9YTu9QM9Sjjjpg18mCSwmW+/wWA5fDVbuTYqaB50skCW3
	KDQ3iSHJgvdMYGy5F6yWi5ZzUj+K6P+Au1nQGNqASuuhhtkqESUv+mWfUtPBujdLuNyDhwPpPJ6
	qlCIp1Vmrq1mXqwRuUYmYF2xUEBRVQl4COWl0ytT7kWrAuyKnB4ZUGzHQIr1rT5Y8MAXdb/NUfj
	RhZjTW3xjxrrj+AQI/zHLxNOB8fUxDKx1B6xo5TTQnQY9CniISpjWMxoICtgwvl58VPPAKGUPQf
	tJJsGD4vnoWp3St+hH/YUbJ+ZGwZNxZa5PCA==
X-Received: by 2002:a17:90a:d403:b0:36d:649a:39f7 with SMTP id 98e67ed59e1d1-36d649a3a91mr8902054a91.22.1780312576930;
        Mon, 01 Jun 2026 04:16:16 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc660da67sm10402142a91.6.2026.06.01.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:16:16 -0700 (PDT)
Date: Mon, 1 Jun 2026 19:16:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for
 Guest/VM
Message-ID: <ah1pgb4S-UoSWhC_@inochi.infowork>
References: <20260601084336.2601675-1-inochiama@gmail.com>
 <20260601084336.2601675-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260601084336.2601675-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_041617_969966_2A4C8ECF 
X-CRM114-Status: GOOD (  17.36  )
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

On Mon, Jun 01, 2026 at 04:43:32PM +0800, Inochi Amaoto wrote:
> Extend the KVM ISA extension array to allow KVM userspace to
> detect and enable Zicfiss/Zicfilp extensions for Guest/VM.
> 
> Assisted-by: YuanSheng:claude-4.7-opus
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/isa.c              | 2 ++
>  2 files changed, 4 insertions(+)
> 

I have forgot to add CSR_SSP to the context, will add in the next
version. But I have a small question for it: could I reuse the 
generic subtype or use a new CSR subtype?

Regards,
Inochi

> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 501e4fc60dd2..9f9c5ababd1e 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZCLSD,
>  	KVM_RISCV_ISA_EXT_ZILSD,
>  	KVM_RISCV_ISA_EXT_ZALASR,
> +	KVM_RISCV_ISA_EXT_ZICFILP,
> +	KVM_RISCV_ISA_EXT_ZICFISS,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
> index 1132d909cc25..9852a91fdecc 100644
> --- a/arch/riscv/kvm/isa.c
> +++ b/arch/riscv/kvm/isa.c
> @@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZICBOP),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
>  	KVM_ISA_EXT_ARR(ZICCRSE),
> +	KVM_ISA_EXT_ARR(ZICFILP),
> +	KVM_ISA_EXT_ARR(ZICFISS),
>  	KVM_ISA_EXT_ARR(ZICNTR),
>  	KVM_ISA_EXT_ARR(ZICOND),
>  	KVM_ISA_EXT_ARR(ZICSR),
> -- 
> 2.54.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
