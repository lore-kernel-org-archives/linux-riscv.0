Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213FFC71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 13:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3AGTbfsypfAx/rOwA8CNEyNo1REkHV77/pYjcME3sU=; b=whOvU8t3qPOLTn
	s10Hv8YKtaskKkhZRZIRBIwRtUz/uVAzWzgroQswgLnsaAaEOLw6pYMZzgrhgo3r72ld8kHXxnJKI
	p8EMO/AKWlBd1EA1O7nxQAlRs5lOw7IJRN0GD0rDpbvYAUPdZOf8Fi+8MRcoeAbtgHMw/nN0RaSaj
	x5P0tr8R5s3XPFwyru/mP0nNjaGCYSZ7A0H0o5RxdidMXgQGhReGJDwY0rsRREqMPghhlBVmtvZcY
	RE55KZjZDKOU/3DMatjMdwLSZlsAZCMfoCG7ISBSlhpLf1Ch+cSANCtYHW3vwQCJ/oE2QEBfU8kX6
	4teplDOJTrGz2jsv+6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd9wH-004DLL-20;
	Mon, 04 Sep 2023 13:48:25 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd9wF-004DKW-1x
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 13:48:24 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a5be3166a2so204140666b.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693835302; x=1694440102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3fvlfFXn3XSbLUjhzD0K7O7WyFDtRiY642hHRw1Uek=;
        b=T7H+BZOcWVBJZll49IApw5L0fhAsWRhIHzJAhdDKFaH/WxY0cZrvwKGHiHxYSMa3TG
         lEZP1BdgNPH/9L5Rhg2YccJSjod68lYlPrAVftJ0BmSr4C8qEp/6nmj+0LepwhQjxjCF
         pHKx2vAM19bYf5YHT5s5QhfebXmeH6RfkdAxmitnftd0Nl0tEErgiWWYzDmgVjEPpjeZ
         6uqkGDl8pfis8Sl77q+QWl7mOjZiNZpw7+KP/2jyBVMtfo1+E24tjQXJOuiccHEggXE9
         MUGU5QHC98SytaX6zasalqrJ/I9ZVTjOIal8PJ3SMkQzV3inlU2+kdQty4KTT8aP2KZg
         JMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693835302; x=1694440102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3fvlfFXn3XSbLUjhzD0K7O7WyFDtRiY642hHRw1Uek=;
        b=ImyhVENrUWII92i104TAez5/6bG4NsmVp3cwvJMoLxSF5CoIlXOvGqZfioDjMLTCXV
         Dkq9UifqDneMczLwDM3qxR2rkr2Qvs+/E2xNJIYk0xtchgS56HBtlll8Yze4VTd3XWvA
         JaSV+qKDKZUUhSu6aQRDV+IIo4QflxsdnSWhhs6UzCVI4+FOIylDLFpmL+coUkEmlylS
         YanW3i0qhEc2D86m3cUhd/AklZA14D+32CVzPVS1fh9ofZWswqtAxCH18SXa7L1wjXgs
         WpUGdJOpksj+QH7B/SO9hq2UXt2F1L1VFmcMg0HCSbhHx6Zj/UehjuE9plfesXekvkCa
         AiXA==
X-Gm-Message-State: AOJu0YyaIcg7LxfmsDeCG5maYM0z8CyJeGwtzOxhrDywWmSJs7DTa1d7
	NdgpbU/Es6ahWTkd2krl9Dl2sQ==
X-Google-Smtp-Source: AGHT+IEdmuQ6wKTsIKPR4BXTBtwQWbUG0Viumxey9/oZVxntWMhJSLmNtJQgpZUnWcUIixf4ahyhVQ==
X-Received: by 2002:a17:907:2e19:b0:9a1:ce57:8e47 with SMTP id ig25-20020a1709072e1900b009a1ce578e47mr7114400ejc.68.1693835302263;
        Mon, 04 Sep 2023 06:48:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h26-20020a1709062dda00b009a1fef32ce6sm6233554eji.177.2023.09.04.06.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:48:21 -0700 (PDT)
Date: Mon, 4 Sep 2023 15:48:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Lei Wang <lei4.wang@intel.com>, Vipin Sharma <vipinsh@google.com>, Like Xu <likexu@tencent.com>, 
	Peter Gonda <pgonda@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 6/8] KVM: riscv: selftests: Add guest helper to get
 vcpu id
Message-ID: <20230904-db7e8ba933a271ef6aafa4b3@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <23d13f60b5a2fd31b87ae78458507f46442fac3a.1693659382.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23d13f60b5a2fd31b87ae78458507f46442fac3a.1693659382.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_064823_643174_46BF18CD 
X-CRM114-Status: GOOD (  10.85  )
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

On Sat, Sep 02, 2023 at 08:59:28PM +0800, Haibo Xu wrote:
> Add guest_get_vcpuid() helper to simplify accessing to per-cpu
> private data. The sscratch CSR was used to store the vcpu id.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/include/aarch64/processor.h | 4 ----
>  tools/testing/selftests/kvm/include/kvm_util_base.h     | 2 ++
>  tools/testing/selftests/kvm/lib/riscv/processor.c       | 8 ++++++++
>  3 files changed, 10 insertions(+), 4 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
