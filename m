Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5377FC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztBaXBbmlcmwSXKjCUIwpFGUAUYrGmTlLIQzpsVxmKU=; b=oWRHrGeuR8YWuZ
	dX3okgBubswtKsSWcxNrKzvlaixB5LIsx1v1sVGg2qgL8iud1DA3X7LgxVNW5k2GrGHEM6Bn3DGln
	pxjsXvTWsQgiYSdUDr7czF9LjNbxgx/sAJE353kUTB2PkQ57qXS5f2JbInYMmbxjIX5TxcoP81PAH
	sHECkZJQsgcD8W67mE10OFPxBLUXLGldR4GHRHhSeLQ/Gu/jl16ZZg1xopBNY8ptSaqeR+NuPqFKH
	O72aiaRJ9L45oPQV5E7q/bnelpgbgIWogVRN68Bgs9fvRVZoaaWj5ERaWSSCaO+wwVkZ2iLSd2TP/
	cjyMngGnGkTYbP0BHzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIrm-00FDCE-1D;
	Mon, 03 Apr 2023 12:00:54 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjIrj-00FDB6-1g
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:00:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso19690136wmb.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680523250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cXOk+fnfr4jL/j1ia/s9JVKXSdrK1PkwEI4HTOkD6GA=;
        b=Aiyl6AAyRbBt5w0rsfEa85x8cuTauU+/JxQJwXYkwafXZXGnKlUf0Gp0IXrnu7TeZ1
         9K3WCHmVt5IM6Cn3dAkIs2IZmocG0PkOYE3cXt4X25eU6VuLThHari/ghOqiEKga0rr+
         I2n3jXj5c5Poaeolks2xVGHbQAY1A/PfL4Is9a9VRSfwvEfnlfEqk4hZLac+QHxwFLjf
         3Ymg9hWUOKUpUH9AaSZLjVxbRy7qRy2d1iiPK1RxWAJOW3XkU0VyLPXN3JgHHYWsSE7N
         vtSYfpZk8N/z4oSvdgaLSvq/NahW1rAISSabz7CdpDbCuiTqL6dVweY3Q9CN87xie2Gg
         GmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680523250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXOk+fnfr4jL/j1ia/s9JVKXSdrK1PkwEI4HTOkD6GA=;
        b=1KFoHtqtxJNd3fnSi5bhBlhiookfMFZ1qwkvm4V5GIpaWwmYiXeXTEW/QTL5glOng0
         5HvOtxZ9idsFe4A2ui1FlKW9o128K1RFiOde7Op0ih+5nlGMKnyY9OumLgAGLLNDnUO/
         OtRhn0CWvmZyFa/QaPG7t6lKE24DnEKu2EM7UpNjI52EXl2jWaEd6p9IgLNbJ30+RFPM
         wGQzfoK3X9I8ze/kJ7jEv1iisuFCKXeXmCrUrrJ1Y5TgnXzFJ1B1RRlTiI3AvfWVvarW
         z3AwQvJrP4K8mOeit6cibOGvYFUlnJMKT6ByPDB82mmrQmIP1FesVc6hA7GvSREFf70T
         QF4w==
X-Gm-Message-State: AAQBX9dmbvAqup329Fk51LuBICzkMoRkXC9wah77JyYQsz5bj8So5tdT
	ji8TWqCPoW6XLw/1DCBtP2vs4Q==
X-Google-Smtp-Source: AKy350YajdxWM3Qq7qE4WZWIToU9nLi7VCOLfAcIS90bSHWdp98RoaT8dTwG4f/4sNtkqSt9sL9RZg==
X-Received: by 2002:a1c:7215:0:b0:3ef:d8c6:4bc0 with SMTP id n21-20020a1c7215000000b003efd8c64bc0mr13027828wmc.40.1680523249871;
        Mon, 03 Apr 2023 05:00:49 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b003ef71d7d64asm19405599wmo.6.2023.04.03.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 05:00:49 -0700 (PDT)
Date: Mon, 3 Apr 2023 14:00:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 4/8] RISC-V: KVM: Initial skeletal support for AIA
Message-ID: <3v5mew46z4kfa3kq4c5gdx72k7qh35qtk3tez26jthnbuygf2t@zy2lukq75ugv>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403093310.2271142-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_050051_894810_F3FB48C2 
X-CRM114-Status: GOOD (  11.44  )
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

On Mon, Apr 03, 2023 at 03:03:06PM +0530, Anup Patel wrote:
> To incrementally implement AIA support, we first add minimal skeletal
> support which only compiles and detects AIA hardware support at the
> boot-time but does not provide any functionality.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h    |   6 ++
>  arch/riscv/include/asm/kvm_aia.h  | 109 ++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/kvm_host.h |   7 ++
>  arch/riscv/kvm/Makefile           |   1 +
>  arch/riscv/kvm/aia.c              |  66 ++++++++++++++++++
>  arch/riscv/kvm/main.c             |  22 +++++-
>  arch/riscv/kvm/vcpu.c             |  40 ++++++++++-
>  arch/riscv/kvm/vcpu_insn.c        |   1 +
>  arch/riscv/kvm/vm.c               |   4 ++
>  9 files changed, 252 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_aia.h
>  create mode 100644 arch/riscv/kvm/aia.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
