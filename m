Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA724C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaVJTbzhY0245zgOBnj1GwQq3USfnhU8tPL/45xL/q4=; b=HS88Xjhw1nqrAP
	TMZrmUgcrlEuEY3KWjJA8rTB58djNF07GZ748ClMXkscXFqlVliBdJpRkYBr3l2pBaRtqE8twBH5b
	ha4w6otKIpbbw5balIsxM1mmBLyBsJ38DW5qzrrD/xTH2Jjfvl6JxS6Zy1CL4G/TTmiiT7fxTZZ28
	ynrUVOArhRfwNWmXWBAGFXHyvV7QfswzfL0DRba34eQB2yjSnbKhUfQWHMhwjmkrUe3+E6NO6TMZo
	H1ouRjqJRBylMfTkDYUx+HmqKo8rIu/3lItT3Bj3teVLOkDJECwsWRD2W9FWdSBb5XcnTZ3ki3R3R
	jBD9j3htIRegR72yGDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rres4-0000000BWmn-31e0;
	Tue, 02 Apr 2024 14:12:16 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rres2-0000000BWkt-0NMl
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 14:12:15 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d23114b19dso72099681fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712067131; x=1712671931; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/0cQjXn5RxGYF1hs4ZqgtS6/DW8noiaC0SrX/L7JoeE=;
        b=Y/3oHy81vv0W/0+zS/Zvq5zjWvF8QFdu/nHT4ZCpXBNmT35PU7x7oR7ECBNVoBupRE
         5EoCi4obCjTL8I1UDORg97q9K8Gbff/VE5Op1jcMhIIemBsNUQhbK5XpASDJ++BjOMP1
         vr2Wst5Z1NujMon2opO5t5g6Pm5Uiqd66qJKLqjHV9kF8HFBiQbzYb3fthlEg0bwKc/h
         m4slOyCvgc1xM6HXmMmNVVHvHf9e5ivGRl8ZwtV0eA7k26end6KEoXPUPRuTLL7ii7ix
         tC6FWo/U8wika07RXijOmrItRt4mSLKvDqGtKb228A88SMUKaK3tyer9Xq65bk56gwcA
         RYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067131; x=1712671931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0cQjXn5RxGYF1hs4ZqgtS6/DW8noiaC0SrX/L7JoeE=;
        b=LnRJkUKolqjUKwxdvyBvCu6QMsoPbBEgwT5mcICKF5UECDTELerg7t/U/CDl4ut5Fi
         Zy9f00YX9grOlphdOm0eZezXoXbhh0hs43jWv6kcvPNtHHH/lSK0njke+NG41cRQncOT
         a7MJic43v3c/TMPi/c8afCUw393APFpEnreUiM7+XIrcYhUOqK5z2Oq+xN7vyFkisDWR
         zsgGorD1WjW3p5dsvqv7GkxYXfpB7TnlrLL7o2xtZ7U69diOjhSziYTNJXw3Axz0wnsP
         Q34Sb3E3/ULP0LLZdhMb5k5aJ0TmVN9r6rMHwlGjpH9xx7F+JOsOLnXdWgXMv0rZoWbA
         3XRw==
X-Forwarded-Encrypted: i=1; AJvYcCWT5n6O4nhlWuYFaGLzjuNkFbynyWbxwKxqWRVDmt6lFWp3F+O8gyehjCyAQq3Gcc5qg0jo0zzquboml1OCG/QBTUTlkb7vBOmqjytNoQy9
X-Gm-Message-State: AOJu0YzddwSYGo+2+17y/Qs/8RlxeqPzkN2BWT3km+bQRPCUMwUl66tN
	Bdb8J7T8L/R2NbAtLdVApS8920Hs50p/MPJy3ZTF3B8p8s3i9SRa1JKuEe7gAJQ=
X-Google-Smtp-Source: AGHT+IE6N5GbqAreIPZgVb2waHGGo5ub3tGfpFdJfv9DhQRFznhz1kQgSzFrTE9IPNvatlBuKLWx+w==
X-Received: by 2002:a2e:9602:0:b0:2d4:2bc5:38dc with SMTP id v2-20020a2e9602000000b002d42bc538dcmr7404927ljh.30.1712067129349;
        Tue, 02 Apr 2024 07:12:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c1d8e00b004156ea0faa0sm3322302wms.4.2024.04.02.07.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 07:12:08 -0700 (PDT)
Date: Tue, 2 Apr 2024 16:12:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] KVM: riscv: selftests: Add SBI base extension test
Message-ID: <20240402-7bd2b9ed00094befa6927b60@orel>
References: <20240401082019.2318193-1-haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240401082019.2318193-1-haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_071214_164932_933F782C 
X-CRM114-Status: GOOD (  27.52  )
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

On Mon, Apr 01, 2024 at 04:20:18PM +0800, Haibo Xu wrote:
> This is the first patch to enable the base extension selftest
> for the SBI implementation in KVM. Test for other extensions
> will be added later.

I'm not sure we want SBI tests in KVM selftests since we already
plan to add them to kvm-unit-tests, where they can be used to
test both KVM's SBI implementation and M-mode firmware implementations.
If we also have them here, then we'll end up duplicating that effort.

I do like the approach of only checking for an error, rather than
also for a value, for these ID getters. In kvm-unit-tests we're
currently requiring that the expected value be passed in, otherwise
the whole test is skipped. We could fallback to only checking for
an error instead, as is done here.

Thanks,
drew

> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |  1 +
>  .../selftests/kvm/include/riscv/processor.h   |  8 +-
>  tools/testing/selftests/kvm/riscv/sbi_test.c  | 95 +++++++++++++++++++
>  3 files changed, 103 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/kvm/riscv/sbi_test.c
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 741c7dc16afc..a6acbbcad757 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -189,6 +189,7 @@ TEST_GEN_PROGS_s390x += rseq_test
>  TEST_GEN_PROGS_s390x += set_memory_region_test
>  TEST_GEN_PROGS_s390x += kvm_binary_stats_test
>  
> +TEST_GEN_PROGS_riscv += riscv/sbi_test
>  TEST_GEN_PROGS_riscv += arch_timer
>  TEST_GEN_PROGS_riscv += demand_paging_test
>  TEST_GEN_PROGS_riscv += dirty_log_test
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index ce473fe251dd..df530ac751c4 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -178,7 +178,13 @@ enum sbi_ext_id {
>  };
>  
>  enum sbi_ext_base_fid {
> -	SBI_EXT_BASE_PROBE_EXT = 3,
> +	SBI_EXT_BASE_GET_SPEC_VERSION = 0,
> +	SBI_EXT_BASE_GET_IMP_ID,
> +	SBI_EXT_BASE_GET_IMP_VERSION,
> +	SBI_EXT_BASE_PROBE_EXT,
> +	SBI_EXT_BASE_GET_MVENDORID,
> +	SBI_EXT_BASE_GET_MARCHID,
> +	SBI_EXT_BASE_GET_MIMPID,
>  };
>  
>  struct sbiret {
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_test.c b/tools/testing/selftests/kvm/riscv/sbi_test.c
> new file mode 100644
> index 000000000000..b9378546e3b6
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/riscv/sbi_test.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * sbi_test - SBI API test for KVM's SBI implementation.
> + *
> + * Copyright (c) 2024 Intel Corporation
> + *
> + * Test cover the following SBI extentions:
> + *  - Base: All functions in this extension should be supported
> + */
> +
> +#include "kvm_util.h"
> +#include "processor.h"
> +#include "test_util.h"
> +
> +/*
> + * Test that all functions in the base extension must be supported
> + */
> +static void base_ext_guest_code(void)
> +{
> +	struct sbiret ret;
> +
> +	/*
> +	 * Since the base extension was introduced in SBI Spec v0.2,
> +	 * assert if the implemented SBI version is below 0.2.
> +	 */
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0,
> +			0, 0, 0, 0, 0);
> +	__GUEST_ASSERT(!ret.error && ret.value >= 2, "Get Spec Version Error: ret.error=%ld, "
> +			"ret.value=%ld\n", ret.error, ret.value);
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID, 0,
> +			0, 0, 0, 0, 0);
> +	__GUEST_ASSERT(!ret.error && ret.value == 3, "Get Imp ID Error: ret.error=%ld, "
> +			"ret.value=%ld\n",
> +			ret.error, ret.value);
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_VERSION, 0,
> +			0, 0, 0, 0, 0);
> +	__GUEST_ASSERT(!ret.error, "Get Imp Version Error: ret.error=%ld\n", ret.error);
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE,
> +			0, 0, 0, 0, 0);
> +	__GUEST_ASSERT(!ret.error && ret.value == 1, "Probe ext Error: ret.error=%ld, "
> +			"ret.value=%ld\n",
> +			ret.error, ret.value);
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0,
> +			0, 0, 0, 0, 0);
> +	__GUEST_ASSERT(!ret.error, "Get Machine Vendor ID Error: ret.error=%ld\n", ret.error);
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MARCHID, 0,
> +			0, 0, 0, 0, 0);
> +	__GUEST_ASSERT(!ret.error, "Get Machine Arch ID Error: ret.error=%ld\n", ret.error);
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MIMPID, 0,
> +			0, 0, 0, 0, 0);
> +	__GUEST_ASSERT(!ret.error, "Get Machine Imp ID Error: ret.error=%ld\n", ret.error);
> +
> +	GUEST_DONE();
> +}
> +
> +static void sbi_base_ext_test(void)
> +{
> +	struct kvm_vm *vm;
> +	struct kvm_vcpu *vcpu;
> +	struct ucall uc;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, base_ext_guest_code);
> +	while (1) {
> +		vcpu_run(vcpu);
> +		TEST_ASSERT(vcpu->run->exit_reason == UCALL_EXIT_REASON,
> +			    "Unexpected exit reason: %u (%s),",
> +			    vcpu->run->exit_reason, exit_reason_str(vcpu->run->exit_reason));
> +
> +		switch (get_ucall(vcpu, &uc)) {
> +		case UCALL_DONE:
> +			goto done;
> +		case UCALL_ABORT:
> +			fprintf(stderr, "Guest assert failed!\n");
> +			REPORT_GUEST_ASSERT(uc);
> +		default:
> +			TEST_FAIL("Unexpected ucall %lu", uc.cmd);
> +		}
> +	}
> +
> +done:
> +	kvm_vm_free(vm);
> +}
> +
> +int main(void)
> +{
> +	sbi_base_ext_test();
> +
> +	return 0;
> +}
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
