Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829AAC83F2C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlZauimPNVvCUenO/KiuBE7oiS0BiIyPv38I/FH0Vvs=; b=zRQRKAtjDY2WZi
	7wEc14//13vYset2qjQRHKUSPSWNhYLkIukw7BuQI1UeJfNsne3NXUg/mjmH9edU2sWXK9L5B92vX
	oKMGFvMgL4JQ2e78vbjRF3siM1BXwtzOGzAxhJXtlp3aYT0zzE3j7Yad9gUT1Q90b0U48lzAyZyiA
	yJsYim5FQhdSdbjttFGLuW/D7EbT8rOIUFd82D1rDFfwsaTE7rGmqDwJph5vAt9sORBo4qHISp8ik
	nD67ZeJyFTNLG2EcqeA+dxcoMMeQytHUx43CanxE3dtgXrh1nVSMSNPwOMLPZ221F0+oQvDINQNLt
	F9YHqIL3OTFvJN2MuLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd9uD-004DAR-2u;
	Mon, 04 Sep 2023 13:46:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd9uA-004D9S-2M
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 13:46:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9a1de3417acso509292866b.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693835173; x=1694439973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MvFpohTVYIZg5zZrtXqASIgY84rg/Ko8jDcHzB0T9Sk=;
        b=g0Yrt6A1LkJhwLxYCfiJsCCoCPGb8CulDGY4Lni0317o8/DAg2xpB+aLpRHSr4aULM
         WWxILk12fvA+dstwpfiyUA1gbdQnyvRtTzDmQWiDghC3+QImCByZpT4rKTVcyxEUTQdR
         uBx2Rz/NgfmJ2+BNfJLJ32QZelbBdjGFQBJW1Ykzbm7SSPMu9jh17uyWECU0E3GS0GhV
         FBFA3iybiyo7Rtf7DuEmtPfUkxw6hCE6TXF+cgULbHu+tDzz1ZQ3GBKsWAE2K1waSBzu
         wciDlGG1DB1KF3pOLl4uA6jGqLY1YXgzCc9JfmB6LFoMmrxPVTbj3Pd6jGlzLAWQfQD0
         D7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693835173; x=1694439973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvFpohTVYIZg5zZrtXqASIgY84rg/Ko8jDcHzB0T9Sk=;
        b=TjxMxHM3u1mUde2aPbK+mjDTUK4/1ERBDstF+hlnBxDNIoTp5D5rnqem4oP7BkD9KF
         VjfMusEnxy5vZftLMUeNhkww6ZUmD0ZXvuZfwr3RiQSNrO6+uLyHCdv4i/Lp8oZ7pZxG
         ts1AFziWrcnyfWZvHXLFFpiJeR/iX6fTjp7xpyUaE5MyCAS+a7LzSTTuwBHm6iA8hQwy
         kLmYWlCoWjUQ22XSuERh/+9NebPV/v5xV48BLkMqXV+k7dobFs6O9dI3xsaOXYx+6g8p
         H96T9foBj4hog0Rh1BzbAwe793dFcnxEuv2b2RoqCziNj+35NUJekSti0ihkWpTsKltP
         B2UQ==
X-Gm-Message-State: AOJu0YzOs5ua09PDKQ5M1G7QBT7rdoAmjhWq5gy1KwJ7UdqT2117XHM2
	AFWMoIsUe5WSW00fzIdwzvhxxQ==
X-Google-Smtp-Source: AGHT+IEdZjuBxG+ZQHNKrQOJiw6f0psWqsTfKbwqOJ2nIP8Um69rD+e7ovBSZFqMEfeYtMk2y26GEQ==
X-Received: by 2002:a17:906:51c5:b0:99c:5056:4e31 with SMTP id v5-20020a17090651c500b0099c50564e31mr10901921ejk.15.1693835172485;
        Mon, 04 Sep 2023 06:46:12 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709066b9200b009930308425csm6163942ejr.31.2023.09.04.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:46:12 -0700 (PDT)
Date: Mon, 4 Sep 2023 15:46:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	wchen <waylingii@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Sean Christopherson <seanjc@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Aaron Lewis <aaronlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Peter Gonda <pgonda@google.com>, Thomas Huth <thuth@redhat.com>, 
	Like Xu <likexu@tencent.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/8] KVM: riscv: selftests: Add exception handling
 support
Message-ID: <20230904-c4d2ea8fcfdea6e6722332b2@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <ff41e98a062e0fbb5c2d8dc26d9e4e02c4ce3ea8.1693659382.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff41e98a062e0fbb5c2d8dc26d9e4e02c4ce3ea8.1693659382.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_064614_765680_47FA385D 
X-CRM114-Status: GOOD (  13.07  )
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

On Sat, Sep 02, 2023 at 08:59:27PM +0800, Haibo Xu wrote:
> Add the infrastructure for guest exception handling in riscv selftests.
> Customized handlers can be enabled by vm_install_exception_handler(vector)
> or vm_install_interrupt_handler().
> 
> The code is inspired from that of x86/arm64.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../selftests/kvm/include/riscv/processor.h   |  43 ++++++++
>  .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++++++++++++++++
>  .../selftests/kvm/lib/riscv/processor.c       |  69 ++++++++++++
>  4 files changed, 214 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
