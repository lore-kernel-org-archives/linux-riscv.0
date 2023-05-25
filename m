Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8830C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60jIWe48Ihf7l7okh/hg0J6doAC4qEI8Wv4vuuaZ1IY=; b=xpmFwXMVuGqZ72
	3vYcHcfP+Kmt7V6cjKbQWcd0PQTzWOh74pCpChEhiiAS4UoklpESipNkj/wOCdzXXsHBZNni1SE9/
	yTbnw3SJyjpj+XaR4dWZtlbmqqY47iBAw02Na1iGjBq7f5tS9hjnV61UMKVpAklpAS5LZlAzprBFy
	cwpi3Bg1RPGGB+y1eF7MHTAPANoP3a6fWzjmotubt4CdReOMcpdCEG4vasJZH4kFHN6xI58spjUZh
	4+GD6IV7U2JrWGQtGJ0KkOdcZBqNw96yk/ssZjq68S1aqdcT87/W1/R0zIaE46oO23T/FG788KcqW
	Wc0DHgWfIC0I6ARhsDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2EdY-00HDdi-14;
	Thu, 25 May 2023 17:20:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2EdV-00HDcY-2T
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 17:20:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so2681835e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 May 2023 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685035224; x=1687627224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0BsSMy+JyYACPWrjjdZYwT/+fcHGskJiY38T07+T9dQ=;
        b=pffAAv8U4UDe2UO5AaMNBCKJwsA+fY/uXlxRYWYfOSF/U831Cbn+aYPxlrMSwbhgZb
         TJ3rx1gTr+K1LN6r+qy3C+Gerl601yJAy8AKOIVHRjsHhwRhM0mR8bH/dqseh0HTJwDl
         aTiHPcC0yw4VA3HzAumqaPgq0KwYo24ZqEHl9kQtn+U7cDTGuIhcpJuNZs5uHfdAhEEM
         sYxNXpBUEAAXjC6xxQMqA15kRL462Pj9tKNyS/cgeUu5jjoy+gglRJ4yP7PXtcefEg26
         u3Y3AIXcDMKw5KULmLOOQImp2uNFtr5k8MA3uRGHPFRaKVMeGy/HWPTjQYaXkLpCGlq1
         MCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685035224; x=1687627224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BsSMy+JyYACPWrjjdZYwT/+fcHGskJiY38T07+T9dQ=;
        b=UOS3+yy21D4eEBIC5C+XjRgqLNs5sksGp0dERAuAsp0Qn+5VaOSwooX0tz3TiIaVy8
         lz7wzUw1Lpy01VPPbvXv4XUuUSs16LF0gRxwahuYIxGqVEWHVlKspUhmJp86tFCJVMcn
         u9eFu4Tvb4tNL+n38NMNKfYmPwmWuFTcTQD9G6qWNNiqkR5qBh+nkojQmtl1+w3ryjHa
         qoWTK4wDxOIy5v/JLACJu7H3x6pC/uDs2v/rpuNa0JAksPAdZPOavXxKtVYU2dF1XcBU
         H/5mSYUo5eGMmgmPBngaRBBzi+PV8TvclJcD9DGoZKDcmqSaJjIy4VgqTSSkuwuthbgd
         XBCA==
X-Gm-Message-State: AC+VfDwgDiTqnpbqejHTfKXhCt/zHgm1skGqMwguC7z0ermUJoZuegk5
	yTz9Zw9/Q+y9YfOBImp473YKPQ==
X-Google-Smtp-Source: ACHHUZ7XVIxEPsxV1O2HxjW5C+Kciziw8ncF6RMfoJyVKR3UnpdSFexzOl8yKxJCJvMncweFjvx0TA==
X-Received: by 2002:a05:600c:249:b0:3f5:fb97:eafe with SMTP id 9-20020a05600c024900b003f5fb97eafemr2817182wmj.30.1685035224349;
        Thu, 25 May 2023 10:20:24 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c219500b003f604ca479esm6313634wme.3.2023.05.25.10.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 10:20:23 -0700 (PDT)
Date: Thu, 25 May 2023 19:20:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 00/11] RISCV: Add KVM_GET_REG_LIST API
Message-ID: <20230525-6e0855eb07086a96eaa82362@orel>
References: <cover.1684999824.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1684999824.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_102025_804396_CDB25993 
X-CRM114-Status: GOOD (  14.11  )
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

On Thu, May 25, 2023 at 03:38:24PM +0800, Haibo Xu wrote:
> KVM_GET_REG_LIST will dump all register IDs that are available to
> KVM_GET/SET_ONE_REG and It's very useful to identify some platform
> regression issue during VM migration.
> 
> Patch 1-7 re-structured the get-reg-list test in aarch64 to make some
> of the code as common test framework that can be shared by riscv.
> 
> Patch 8 enabled the KVM_GET_REG_LIST API in riscv and patch 9-11 added
> the corresponding kselftest for checking possible register regressions.
> 
> The get-reg-list kvm selftest was ported from aarch64 and tested with
> Linux 6.4-rc1 on a Qemu riscv virt machine.
> 
> ---
> Changed since v1:
>   * rebase to Andrew's changes
>   * fix coding style
> 
> Andrew Jones (7):
>   KVM: arm64: selftests: Replace str_with_index with strdup_printf
>   KVM: arm64: selftests: Drop SVE cap check in print_reg
>   KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
>   KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
>   KVM: arm64: selftests: Delete core_reg_fixup
>   KVM: arm64: selftests: Split get-reg-list test code
>   KVM: arm64: selftests: Finish generalizing get-reg-list

All the patches above should also have your s-o-b since your posting them.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
