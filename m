Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A77DCCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exEXj89bfKeeRoHaUCvTXD8TLMRoIhYDU3Q2lkZsrHM=; b=tk6gfeChVJUBhx
	ToanhfoYyhxW4QORgFu9lolF4e8hnnuqSh12dK1dra1FOkzBoN0Au8pGEdJyefRGxTKsjoi7zFkvZ
	mQBE34zA9fg1nYT/o/mAC3rEldBC+xOyxxh8RynY4puYM1oTPN0OpF5AphIvpjv++fspZR5tHyiW9
	2eOlM7sUeabvfQXiPs22Jvi41LkF99qfhJ3GDRdm0j247TA2mnLUCaoflAlWcdBOCDFqnT48x6YyX
	C6gIa2zQm4ZP+OlyhiMRAe4p3eko98Tm2fM+4BFtE+s4ffeFW+AXnPKgxFE/90z4OANtqvdsn8VDZ
	uxvPIQfuFwxafAonzgGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n92-00000008PKb-05jE;
	Fri, 17 Oct 2025 16:17:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n90-00000008PKM-094K
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SE59U9D9FBD2TsP2y/MjrBzEhIdNihINvSqWeLt6f7A=; b=jtvATaMCrCc1jcwpXbMLincmkX
	+4eXgUoPrz73Vl2lkA7Vq7zxF543ZpcGYvws7jMIqyM+jSg7gFent8EE9A5aIfGZXkm8ZHYLC9mOD
	uDcl0dd0Z0cT9Jwi43DSjYQ9W+E5UzXS2bkmaDk1Bkh1stSvQEi7zRc/CmwSIrbl1dXB42w8ya/XJ
	H0o+jLESOEQ642I7Izzw9ZeTRasQtSrxgk2KnVG+zx6a5XliSPp+kubeFPDTtXbM/X4HV/aojdMPp
	TXdYff/yilxHtD13FI0gGDEF07lZFxqN0djPzQeJnd4ZJNAtOGmgielwX1xil21LaMMDNUTOdlOYH
	kSPwmLhg==;
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9n8s-00000007jp5-3Kje
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:17:25 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-430cadec5deso5715345ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760717839; x=1761322639; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SE59U9D9FBD2TsP2y/MjrBzEhIdNihINvSqWeLt6f7A=;
        b=cIqH/VaoKlwa/2A9WEJ8EZ9VcI5cPvrtyNPGHWti0T0iUccwu15hSuIZEIW9QKpQsQ
         ayM2zo+yYSXncKwM+wGKjtnKEZWvAWl/2sEirasSttHmEdkJKDS5WvbMDVcCP3RYXR1M
         7uJF5ACWy5eANsTb4LrJT2rxD5HsMKHwFbp3ocvzGTMIZADqczLN8r8C2KPyaPHxEFU/
         BG6F6nfc8EmPwnVEKJarC3FY7nu+YUgKPca42OCmM8S5M5RpM4F3GthaHDGEu0bQq2e/
         AN4kluzz5iIPT/gzJVI4lrvQQzNCxp4MHddeIdC9PBQ93QJm7PATsPO2uVlIpN4v+1W8
         B+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717839; x=1761322639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SE59U9D9FBD2TsP2y/MjrBzEhIdNihINvSqWeLt6f7A=;
        b=hBoK2Q3vzHhNYf2hqkjQI/PxvVexskWw1SWBfJ0abssHIvX25zzEA/hh6gTi/Gpg5L
         UowKqMDYgUjhSaD9y76E57y0mFhNamz1Si7HQziut25Q3N2Q8zDCaL5MNk4zZw4vIhs6
         YbrnmGDeo1J8izZ8KTM3GeciytUo+Ir0HXfKZgbcBi4jmaSnjNpuDEzcrwQ/xHQcCe2Q
         wqsK0ile0DIpQvXU6HZ2V1m9+qPoDyOhKzafzv2l79hYje2KWj+VWb9mnyjfCedDE0mG
         gAVN2IrbMWLqPpx4B+dVTvYxPSlnUSwKQkfi4Wyq5THgTmqLut3wK0SoQrG1ey4sN5oB
         QiYg==
X-Forwarded-Encrypted: i=1; AJvYcCXN50lmTgGWpLoceDtWFUttxkH7ueR8X/5V8UcwKuZ5MLw9cSzi+rwHnRfAvrmnYTF2MEIAwEq/37dPkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdGMYkkf96bOtc6xLbsAWHDjNYJTMlnb7XuWNmUNHiLJCpElah
	tBaCoI4SCuU+rpx3QvAphLNpylPSgI//hzp9NAY/XbyMO2dpnx7oIA12n9szC1jth5A=
X-Gm-Gg: ASbGnctfInDvWL9haX5tqD1LCSOO3z4bRvN2YcUBYEdzqQ3Rn5X5+Ifwtt3A2cYr3Ju
	Z27DRuPMkseiFZWd2WX88lQvCSkB1ktzA16W7Z55ddAZXIvol0Zx19TNAvwaiyolzxdBAfIZBet
	BimdUpzVzm+irLoHmt1dogSZdLHvGXWJR0zLQa3u9yxXVSZHUkEbivFHuJLlyRfcOWeO8RqH7kS
	hH3N3pcZbeW1W5xfqldk48wgrbz483zeftRw7Gy6NvpVniBLdgC/iGHDD5nkE1a5QGkPA2TqCQh
	RzLUIKeWmblkGwxkrfoP1ochkAhPqtQo8ylWVpHnkt/Mtfnm4Ger4jxOfkC65Pn8tIOLvPdeITs
	v16YqbB6TFJ0EZSOr0E80uUL9I64j4O2Iw0T9lOAVQcfSxC60P6OaCigT1YmAqkaRNnjWOAy1eR
	i83w==
X-Google-Smtp-Source: AGHT+IE/MHK6bGWFUML6lB8EABvgh/StOgVAz5yCP4m6sZL2slTHOrBxRy/hwICm8V+ly8yQelL67Q==
X-Received: by 2002:a05:6e02:b44:b0:430:ae1a:3375 with SMTP id e9e14a558f8ab-430c529df57mr60456845ab.26.1760717838760;
        Fri, 17 Oct 2025 09:17:18 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a979ab14sm8576173.65.2025.10.17.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:17:18 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:17:17 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] RISC-V: KVM: Add separate source for forwarded SBI
 extensions
Message-ID: <20251017-68a09a4da911ec4eec058592@orel>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
 <20251017155925.361560-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017155925.361560-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_171724_148348_F7B2B53F 
X-CRM114-Status: GOOD (  10.20  )
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

On Fri, Oct 17, 2025 at 09:29:23PM +0530, Anup Patel wrote:
> Add a separate source vcpu_sbi_forward.c for SBI extensions
> which are entirely forwarded to KVM user-space.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/Makefile           |  1 +
>  arch/riscv/kvm/vcpu_sbi_base.c    | 12 ------------
>  arch/riscv/kvm/vcpu_sbi_forward.c | 27 +++++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu_sbi_replace.c |  7 -------
>  4 files changed, 28 insertions(+), 19 deletions(-)
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_forward.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
