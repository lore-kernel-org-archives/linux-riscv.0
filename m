Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F2CC83F3F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4HxdCEjfdOzh1qVOHa66qWoshW6Dh7dgxzHDuvUzoU=; b=lSBcoCu1Ghz2qV
	2J6dUY/SDa6nx9Nom4lRZGmeuO5zBRWtbfVtWGFgOgQz9biwuv5u0hPQR6F8Hck77FWBNCUq80ijA
	ZmoO4fw7wl+vQ27/ba+u/m5i1KZuX0PbEfYHOi5lMWbVNFirHPT5MbWIEtw7FLnY8qDwrw6elp2gP
	3957DfMSDwMy19MuxHk1OtMJg1Fu2rgmsbMjqdaT7CMoYFi5pUUsWuLxJktYlpfWuLBu6NkIOD3sO
	3em6nrwgZfIna2KfUjqHwSxGe/nMqjCn1GK1viAEzKzjz5rURx73eoIBAHSyUw9CMbwBrT1knrhOg
	aJPaNA8mjhtPVzKJyGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd9bP-004BbX-1Q;
	Mon, 04 Sep 2023 13:26:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd9bM-004BaL-0q
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 13:26:49 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4cbso1929535a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693834003; x=1694438803; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/uL2B+XqPFUs3X1qoEJuP1SxRFKqVUX3leZ/vaoEUcA=;
        b=VKrz1dTIVT0+L1gljM6l2WXmJomnVUIzlV4mHW2ZUECk8iNHcLvdiRgUCvjVEsT51Q
         hwAfJUz0/pA0vNrAYpy96yJXaWz0JjdMJI00+lkoVVMA5iBAZ1zCdjcRuKYhd6UyC9Kf
         f5/aA7VNydl96bCc8SRw9sEsiteTxe/eEdaEOBoR/OH3ErFCZB6I9soZ0Y6xJwhXH6g7
         i6rwJIV03m25fryOopjQ2OUmb1b14QNvLjuQwKvKakMx98e8wZFPbU2BhGJ4h4zYPm+X
         /z6K8uALvQ88+pzLsek633X3y8PuetO5rCowDqrftvNfgBQGdD7cCffBynoK+u/3UGtx
         XkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693834003; x=1694438803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uL2B+XqPFUs3X1qoEJuP1SxRFKqVUX3leZ/vaoEUcA=;
        b=N6tKxxEax5bnerv4XlyC9zIBb+CwP0VBSVMsWNlh6VYXRg/qw0MqbKfWftSPcCjOEe
         IFk/bqoYgDY8bn235Sni/C89PbWYAOlYTvB/Jgr3zMVEmN3Xg+9oKRRdJ+XQWlURyynU
         GayycK+0CJYMZfzhN0cZSfcyXqm1RrhDt8lBffxNbU86AkARl1SUkcTqh7ZObcwi5cVO
         6LSo6v8QHA7F9X+c28ql0ItMn/7GXO6gS6oS7YptaMuIUQPvlPlXxinuAospVp+jhVXP
         OHAXPNUybcke1oc5HZFX6ALgM2+F+LejYQ2qDVSC61nUzK2OTWIPEqrY4EIEb/X8BtWc
         sBLA==
X-Gm-Message-State: AOJu0YziAyhZ3VMv+V60AGaMHLQwSid4L64mjg7WMyc84Rh2jxNN17zi
	cFFfwqW+GW8Qd0ew7vCThVxj9A==
X-Google-Smtp-Source: AGHT+IGOFIwY6Wm7dsAMFZC9Eb7yEm5sipTomJmGwCL0leiifhPgy+OojWu1/AqpYEmyOm13m0TRlA==
X-Received: by 2002:a05:6402:17d7:b0:52c:84c4:a0bf with SMTP id s23-20020a05640217d700b0052c84c4a0bfmr4777586edy.30.1693834002867;
        Mon, 04 Sep 2023 06:26:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n18-20020a056402515200b0052a3aa50d72sm5855572edd.40.2023.09.04.06.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:26:42 -0700 (PDT)
Date: Mon, 4 Sep 2023 15:26:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	wchen <waylingii@gmail.com>, Sean Christopherson <seanjc@google.com>, 
	Ricardo Koller <ricarkol@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Lei Wang <lei4.wang@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Like Xu <likexu@tencent.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, 
	zhang songyi <zhang.songyi@zte.com.cn>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/8] tools: riscv: Add header file csr.h
Message-ID: <20230904-79306f36fc9cbe222eb0ef8f@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <8173daae52720dbdabbd88a5d412f653e6706de1.1693659382.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8173daae52720dbdabbd88a5d412f653e6706de1.1693659382.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_062648_298997_A05FABC3 
X-CRM114-Status: GOOD (  10.47  )
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

On Sat, Sep 02, 2023 at 08:59:25PM +0800, Haibo Xu wrote:
> Borrow the csr definitions and operations from kernel's
> arch/riscv/include/asm/csr.h to tools/ for riscv.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/arch/riscv/include/asm/csr.h | 521 +++++++++++++++++++++++++++++
>  1 file changed, 521 insertions(+)
>  create mode 100644 tools/arch/riscv/include/asm/csr.h
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
