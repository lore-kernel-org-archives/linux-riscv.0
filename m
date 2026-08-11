Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33EDC5B56A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=da56AHuXtnSYJ9BRCmtSLb7XC8fUHnCOxi1CJAuBYzw=; b=cVvC09ctQpa2jO3F/QKyhWyAxM
	KkZ22VtZQirYQgS9QXv87msY9bVaPioHVJZqYMFoc27R8z/8oqkKXuYTTrrot4SJBcGhcBM0DreMo
	h1/k/+pVb8cvkSrnHZEmMHJPX+Uj7C/vVpDZ7hD9btTYviwr1ykkr9FmRRCJIysz2epwblpQbU2AC
	CLTcYBJ2EImPLeRVP4sYS2/KnW/pPcuEk+pjnBlihg0D8XPM2VoNDFdgQhzfJC1NEoKTOISz2Sh9M
	F4tRwNSoUYjkLoCd61XWOkNNqj5wvL8Ohj0g7IGL1X0EFqGNPSTAx560i1y/D+PpBcbDLNRZzyp31
	v7/MH/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtq7i-0000000EceC-2gsq;
	Tue, 11 Aug 2026 17:18:46 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtq7h-0000000EcdE-0I66
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 17:18:46 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-84e01a62d99so138462b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786468722; x=1787073522; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AtIGM2NHe8OV4DKgN1nHk9aAoS7uuH7cfv4s5R8wW14=;
        b=GyKiNV/6Z9VLj2VWRry3RV3h44JAZKvh3OKuDznWF0x5iPEIc0hUiATuFxF45vB/xb
         ZYXmEjgcFtZCAiptUP9AVZZhch3Ktfmew6e6BJjVdj9n2me2oCcJsqqJwS7klr5t19nc
         11HivgIxtzBzLucIAnbdFqfXB+PNIpSMQNY/dXYffjfp2Mu3eqVKTisxKYTLjcrg0bdB
         xmdsS6TSQLPJ5wFLqm0ChNfECkSc1kDuxKxyvqw1le3h3myTRyzRayHD1vde6l6d0NLP
         5Q072IKGVuPiLHftLy8lA93x0elecXy4DJd1IGj7uhv86HfP3nH82xyV63qVHuA5kD6x
         /2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786468722; x=1787073522;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtIGM2NHe8OV4DKgN1nHk9aAoS7uuH7cfv4s5R8wW14=;
        b=Szqdtwp2zliwvk/YE4mHLbhIiXBJ6i8Mk2ehY3U0szy8fksvWFxfPGIOjpMwCwAJJV
         p5le8P6d41hMJaH1foLKnO5ndVDyjNg4QezUlczK0L3TUGx6mLDaGKpy7e60b+AKWpiw
         v7zbWnJh4Xh1gplgNdTcLDr52VYi46rH0EnvzieYvqkVqdES488yEHL1fXedl50Qz3b9
         4yYA1/8KxSiWFD2DiV4kLfTJGYgUR2KvszuiYEtmayGTloYauEPoNsO3ohow/fM3fXLX
         pvS/fbGA45JUTUAJiDw5qScyh5GvTbdPWEVQbSP5FEZcOvgTn8p82Qoy/ibYd8T5aIrd
         YvRg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5hWtKqFgHulmjg64cdbLT2cv1sp4QOLOtQxO5eP+g2GYeMHGE9ZGAYawq313rsSShxoO6C/Ithf93Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/mPcrHJOK2UNtFubERARfpx5c5K5DfRj7lYzR5hpc8ag3mw1L
	V3McITn7rqfZY9e0k61bvMisL8+QvqR3bH0ftLVv3iT8TqRrhRK1c6JZKG1auPGykcinLoPPNem
	bRo+Jyg==
X-Received: from pfbds7.prod.google.com ([2002:a05:6a00:4ac7:b0:848:2a35:eb83])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:139e:b0:848:5ed6:9d27
 with SMTP id d2e1a72fcca58-84fafa6094dmr1722392b3a.36.1786468722299; Tue, 11
 Aug 2026 10:18:42 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:18:41 -0700
In-Reply-To: <20260811060134.106973-4-jinyu.tang@linux.dev>
Mime-Version: 1.0
References: <20260811060134.106973-1-jinyu.tang@linux.dev> <20260811060134.106973-4-jinyu.tang@linux.dev>
Message-ID: <antZcYiOR0WKi5Kv@google.com>
Subject: Re: [PATCH 3/3] KVM: selftests: Enable pre_fault_memory_test for RISC-V
From: Sean Christopherson <seanjc@google.com>
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <anup@brainfault.org>, Anup Patel <apatel@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_101845_120525_1DEDB5E3 
X-CRM114-Status: GOOD (  14.07  )
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

On Tue, Aug 11, 2026, Jinyu Tang wrote:
> RISC-V now supports KVM_PRE_FAULT_MEMORY, so include the generic
> pre_fault_memory_test in the RISC-V KVM selftest build.
> 
> The test uses PAGE_SIZE from the architecture processor header. Define
> the normal 4K RISC-V selftest page size so the generic test can build
> for RISC-V.
> 
> RISC-V selects VM_MODE_DEFAULT at runtime. Initialize the supported
> guest modes before creating the VM so the generic test can run on
> RISC-V hosts where the default mode is discovered from KVM
> capabilities.
> 
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
> ---

...

> diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
> index a0fcae3cb7a8..6eebf0524673 100644
> --- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
> +++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
> @@ -8,6 +8,7 @@
>  #include <linux/sizes.h>
>  
>  #include <test_util.h>
> +#include <guest_modes.h>
>  #include <kvm_util.h>
>  #include <processor.h>
>  #include <pthread.h>
> @@ -219,6 +220,8 @@ static void test_pre_fault_memory(unsigned long vm_type, bool private)
>  
>  int main(int argc, char *argv[])
>  {
> +	guest_modes_append_default();

Can we do this for all selftests in kvm_selftest_init()?  Or perhaps even better,
handle it in kvm_selftest_arch_init() to avoid the gnarly #ifdefs?

Unless there's a meaningful downside to configuring the supported and default
modes, I don't see any reason to force tests to manually do this work.

> +
>  	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
>  
>  	test_pre_fault_memory(0, false);
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
