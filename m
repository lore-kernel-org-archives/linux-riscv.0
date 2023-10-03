Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092C0E75444
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q58676vNzzpXFVrBkWZSDzbQhtP1L/EgmsTrrYZ80WI=; b=1JdBWoeW2Kpw3F
	IjCv+FZE/Hg8TB0GBzWySzj+2tz5sb10nU9S0ZwaGqfZXEar6vvTeeTSpont/hvyfMMQ6CXW0C/b7
	3MeJ/qF5a3frC/nRZSs/y6yHq/bo3mv7UJ45w3dXflLbHuFNabcq0k/zobuAi1SvJTdXGnD6QLXlK
	IvyKLIqeJG5WJyl/MsNPlt2NHJHEFhy3c6h89Vvcil+OBR8Aee6iP8zXkajhQgS6XiAcSbLouxTdy
	wG/iSGhUSFR9yHnN9FoJSCBUDkXAImSNBsJH3AyvNSgDcMIfrTfFqAg3R9pFS8Peg3j2LW/OWVkQo
	m0c8vrOTxx6D5LmV7W7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnce2-00EIzK-2w;
	Tue, 03 Oct 2023 10:28:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qncdz-00EIxp-2f
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 10:28:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9b281a2aa94so124975666b.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696328924; x=1696933724; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XsdqrdEkDSj8N1JGo8GS+Y+t1N9Ffxo49rjL66LLWiU=;
        b=UjLqal+UZTjSutVhZ01JNbArNlvD/aZXhkFujo849CLXwsEGBgIn1isBIxT2q13iEt
         Aafc+ARZmJitEW4qps1i/3dRsMFt1Y6AdGkJrGAdMDR53u2l+T/VafpKuHrnmliuA86F
         SlUkCbrSTz1ug8spKyHbhvQxKbg+bDvOMWETjj2MATJZA6qkT8HWL5A/wgkVDuWLeGIJ
         LaN7Nf7enR0/4AOLLHfmZ//VXsw8rbcPbC8V2WKVIRwKiFVgM+SD2TbeRWxcyhnDVWfx
         /qFxTZZaD04bFzhL4ubd+j5KqAF+AsL+dLTdFO5HNn6ZZL6VEVruqpmbmfbJfQpWq1u7
         rwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696328924; x=1696933724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsdqrdEkDSj8N1JGo8GS+Y+t1N9Ffxo49rjL66LLWiU=;
        b=vTTOv2Pjq5cetLmemwFpYL/w7CsbiU8T6rXUGkU/qvHW/suQNPZ5BVJAP+if7Xwl1s
         euQTgyxE7bWxl8K+aBDilD/x8qEX2Z7eHCamMAFoef0tqJ/6kvNKJVS3IZkQxxTuuY40
         PfMtIZlAi7FWNZwESiONMgWNZSBIL1TqsEg9LGWkSuGIa1bVWo8w98+vivl7xE+bfdUK
         FNh/YOYE1zFAijBupeivNHa9kKj3eI0t5c9mtClXIYJ4eD/MW/hMNEaTs9KJTdKkuPl0
         N9BuOBJLbfMD+mVfXcxGbpfjHyiCEXyfYqcqyGt7XREUcVIEryNkFsKSBQS7b/wTGjDh
         lPjw==
X-Gm-Message-State: AOJu0Yy7IXCuESV7sRl0agae4MFhOL31rEJP6u9yL9Rtjm6J9oLSfL8l
	DDtHQ6anXqLFo+NeVhgItnQ7RQ==
X-Google-Smtp-Source: AGHT+IG9ar/of5h3vBdRHdNrUbHgfPXCJHKRmFUO92+SzwFtgCwBykQiZdbI9ipIbOFvP0+0VOSg1w==
X-Received: by 2002:a17:906:109e:b0:9ae:6d0:84f7 with SMTP id u30-20020a170906109e00b009ae06d084f7mr11197111eju.32.1696328924382;
        Tue, 03 Oct 2023 03:28:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id op19-20020a170906bcf300b009adc743340fsm822007ejb.197.2023.10.03.03.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:28:43 -0700 (PDT)
Date: Tue, 3 Oct 2023 12:28:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/9] KVM: selftests: Unify the makefile rule for split
 targets
Message-ID: <20231003-d44206f71d0b22e539833697@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <cda6cc71c9bdde87fe87f6c2dec4f03ca249dd62.1694421911.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cda6cc71c9bdde87fe87f6c2dec4f03ca249dd62.1694421911.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_032847_864991_C258757F 
X-CRM114-Status: GOOD (  16.20  )
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

On Thu, Sep 14, 2023 at 09:36:56AM +0800, Haibo Xu wrote:
> A separate makefile rule was used for split targets which was added
> in patch(KVM: arm64: selftests: Split get-reg-list test code). This
> could be avoided by minor changes to the recipes of current rule.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index a3bb36fb3cfc..7972269e8c5f 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -249,13 +249,10 @@ TEST_DEP_FILES += $(patsubst %.o, %.d, $(SPLIT_TESTS_OBJS))
>  -include $(TEST_DEP_FILES)
>  
>  $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): %: %.o
> -	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $< $(LIBKVM_OBJS) $(LDLIBS) -o $@
> +	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
>  $(TEST_GEN_OBJ): $(OUTPUT)/%.o: %.c
>  	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
>  
> -$(SPLIT_TESTS_TARGETS): %: %.o $(SPLIT_TESTS_OBJS)
> -	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
> -
>  EXTRA_CLEAN += $(LIBKVM_OBJS) $(TEST_DEP_FILES) $(TEST_GEN_OBJ) $(SPLIT_TESTS_OBJS) cscope.*
>  
>  x := $(shell mkdir -p $(sort $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
> @@ -274,6 +271,7 @@ $(LIBKVM_STRING_OBJ): $(OUTPUT)/%.o: %.c
>  x := $(shell mkdir -p $(sort $(dir $(TEST_GEN_PROGS))))
>  $(TEST_GEN_PROGS): $(LIBKVM_OBJS)
>  $(TEST_GEN_PROGS_EXTENDED): $(LIBKVM_OBJS)
> +$(SPLIT_TESTS_TARGETS): $(OUTPUT)/%: $(ARCH_DIR)/%.o
>  
>  cscope: include_paths = $(LINUX_TOOL_INCLUDE) $(LINUX_HDR_PATH) include lib ..
>  cscope:
> -- 
> 2.34.1
>

I just noticed that with and without this patch we're building the
arch-specific part in tools/testing/selftests/kvm/riscv even when we have
an $(OUTPUT) directory (e.g. O=build). Those build artifacts should be in
build/kselftest/kvm/riscv instead.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
