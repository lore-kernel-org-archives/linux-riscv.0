Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB0FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvdoKROvWCVeKtY4iVvbafqzFTXzRrt/9enpNujZ5CA=; b=HHCH6HolFmIYqb
	NFJqJqcc8qZd1P/FlPXUoxSSJ2BsXf1X0ZH1ab5bKgWoZOqUSTLvURvumzpUFMop9PumE/6K2tJn7
	vNIQvS203/rB40Zpom1Uw7VJ+2nl8dPZ8m7Dx5anD4vq22krOniawP6tcmWogz6TD3rl8SB0RE25K
	OlUgtRWsyK/O5eU4d2vsYaB/iTNjzzkCf/KdK+nSjkcL5j84nSUq/vPickc55q4CXkUIpTunkLmQv
	H1GNtJ7g0TCR+vIkHlPSXdQ65VNjcmWZDu6Mr93wJZ8ersU/hLsTZu3KtnrNo8XPmgdoOdtsEAYEU
	eK5bGrTLeI+gRK3dRQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJulX-0038AZ-1a;
	Thu, 13 Jul 2023 11:45:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJulU-00389E-1i
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 11:45:45 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fb41682472so1023357e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689248743; x=1691840743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XF/kJz3Mtl7rTr+akrMPMh7NT9a+W113nDrHXX3tyKU=;
        b=R5yEz0bJN9gmil0RBmK/5K/6osL2cjmTbVypi/ixxdHDr+fckuz2XAGrqudFi1VC1Z
         4RJtgmfNZl9TSinagOTcj+6eUBz1qqIVsfrxCM9PSod8PJ6h4yJHUfg34fLWFOfTIsSd
         kYqmezpxW5QDbSpA481Gity5AC9HV/Os0Rjj3Mxoy5bHPvkjP8RzNtoBJ6QOQzYPUXw3
         uVJ3XJRKy/g/Lh4g/Hfrnh91XVaTKY8ZpvCOApinYjTO7KJFL5f3dwYRjKQAeX6qYBZ+
         Zrk2GYOCxOrDeYSdAPtG7w2+jAoM7dwu6WDoGcbcTegv1GUS7OayypoCL7keJH5+pMoc
         b1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689248743; x=1691840743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XF/kJz3Mtl7rTr+akrMPMh7NT9a+W113nDrHXX3tyKU=;
        b=Vsg2HeJ2jBDULWI08jssTT2+8M06EgVbqJFjPE5HtEIkMEoKF3Jiq2s48yy24e/cPP
         xUK6VdHcQNmq4yjtjIkNU2qVg2VZG40fu+NEawO81OBpCve+WBJ28TIjGDd5cuf0Quwm
         lZH7ts+L3Ot5jBILVAbROMJ5uLZ2Dz8c82quVFbV/ZNp3NWLllKS5l7JgLVwz159mVFs
         PWM6g5xA5mfCHU52T03bN+O15QBJaIMt4gF4gH4sL/y8YxZ9lrEKcddU5e8uljxkFNDH
         VsA8bydYa90lkbPQVOfb33mP873t4wOiVOWFbVgyigLhkddGsG5TqW0Bfcs/9UPsFUls
         Z9fQ==
X-Gm-Message-State: ABy/qLatg75+QQBUd28DF4BIbWELih/wV8ZGsl2INzvuIhhTcCmSJx6N
	wAEHFz07+1i/xIf4OlhujbBlWQ==
X-Google-Smtp-Source: APBJJlHrI74GavTFgops6Qf4pMDH7uzQ3B0ogVSZ1CL2UfyrxjxfYcZKoLD65agt1/cFOKsyv7zzMw==
X-Received: by 2002:a19:5016:0:b0:4f7:3ee8:eede with SMTP id e22-20020a195016000000b004f73ee8eedemr1215430lfb.61.1689248742691;
        Thu, 13 Jul 2023 04:45:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n7-20020aa7c447000000b0051e22660835sm4193594edr.46.2023.07.13.04.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:45:42 -0700 (PDT)
Date: Thu, 13 Jul 2023 13:45:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Ortiz <sameo@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] RISC-V: KVM: Allow Zicntr, Zicsr, Zifencei, and
 Zihpm for Guest/VM
Message-ID: <20230713-0a6b8a76803c70d3fe92f77c@orel>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712161047.1764756-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_044544_567997_5C7CF041 
X-CRM114-Status: GOOD (  10.10  )
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

On Wed, Jul 12, 2023 at 09:40:44PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zicntr, Zicsr, Zifencei, and Zihpm
> extensions for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 4 ++++
>  arch/riscv/kvm/vcpu_onereg.c      | 8 ++++++++
>  2 files changed, 12 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
