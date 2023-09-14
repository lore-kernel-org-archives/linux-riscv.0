Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B70EDE996
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnNLwffKcxrTMz6FG1RUeEOOIw19qWt/HoJc1h/nNew=; b=YPgAU3YeKitO5S
	WMmFjCLnT/ShjS1M9CiD+jlL83fKOLz25XWRqWQtDD7BTIhNAZ6ySlQ0d6aUJ6EbEO9nAJGC4Rq2t
	KvKsIM87cyPcnwTweJZj7fvk/ErKu7JiuE4zV4RPFpOYPZh11VTgMwlpBDb9OmOdayMR6qIJwjhuO
	YJMulN992BH/Sx3rcb5uYHf7Rw6pkHm9Vwfehf28l/fILDkhp0y4iCwx9QU1cFy5ZHYYHXHRQCovg
	5l5hM1uzyRDmohMP3ApKi7957yD2549ed7coDY1f7CToDzGkR8y4xz73kVyl0g+5KSto8LLfnR+wy
	zCEbiVe8xonbeN3vGLYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghzf-007jxT-0V;
	Thu, 14 Sep 2023 08:46:35 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghzd-007jwO-0W
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 08:46:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-317c3ac7339so589441f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 01:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694681191; x=1695285991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQEPjdH4Gli9KAKRohOP4WFvJ7BvjQDzxENQGkakYUo=;
        b=KfygEY62H6AY7X38ceG6nGF4f1EbZygIPE+motOkDiQU/fsTYduMdnw6dfq11jR8zQ
         BLMnwkyivCErXc6Svn3hWEr8KCZA+jp6NbQSiRfVHcVSrBkG66PbegHRdwb63pc9LHIt
         v6zEwqpsjwhpqCXjetYM9pPkyduyHPEC0ZRVfmsEsgR74Idv5jHisCdwnOZhpAVJyk+H
         Y8ObYJ+CdCAyF0uFb2IVaxoQCZ1XxtZKZE5Q5ujSrsd6tEHhux0RPdpTqh3tB4774fmf
         Xep2fKm8n61F12AcV++UXhpe+X9ANcmc/+zGjya7HhMWcDIHff2kwQwF8Nt0FXnfkGZU
         7QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694681191; x=1695285991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQEPjdH4Gli9KAKRohOP4WFvJ7BvjQDzxENQGkakYUo=;
        b=w8CUt7rH2Cdej9hiegmAIWfDTrjuxTtTtvlva8P6y9fJK0kOVAc33//QLJOVj/3jPj
         iKBv+HxsZAgALRHaa7XNsDJYRR7I3TvV//MYRpZmTQopUVdrZOdFrt/fjUAdtfFKvkrV
         nXYAM1DidNLO2HJw8LgmzvjreOw3i3+7G59hNxTn5KB8qdoz1rd3+kcb6nOJlKJM2uOH
         gVGoDJdQR9P/SqVtTIYaUKRyWRB53gz/RuzMBEgBGhbqDa0xn65+AKilRMuFcTZoLEDq
         vKplRwVE0ncymacpf5zlJ9Jh3wBX1KjKtxJ0jzmT+vqNkw1DM99jzyKDs5xLTZtYzxSC
         R+YA==
X-Gm-Message-State: AOJu0YySHU8PHsfv+KWTJOM3U41ExZ7oeSqR8cG/vzRbtzn8/Q4RHVwn
	tcbsxNMEcTA9YtGnQZofD1sr9Q==
X-Google-Smtp-Source: AGHT+IEirTjVMIzTLjC7sB1QXwQuxnOxm1+1fH/gEKNI6n9l8wkInADFzO37/+IpdsjO1bWWulPatg==
X-Received: by 2002:a5d:6105:0:b0:319:8427:d221 with SMTP id v5-20020a5d6105000000b003198427d221mr4297904wrt.62.1694681191504;
        Thu, 14 Sep 2023 01:46:31 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b003176eab8868sm1157269wrs.82.2023.09.14.01.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 01:46:31 -0700 (PDT)
Date: Thu, 14 Sep 2023 10:46:30 +0200
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
Message-ID: <20230914-393dcb077c664af16c4830e4@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <cda6cc71c9bdde87fe87f6c2dec4f03ca249dd62.1694421911.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cda6cc71c9bdde87fe87f6c2dec4f03ca249dd62.1694421911.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_014633_247480_E41E26DE 
X-CRM114-Status: GOOD (  13.62  )
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

Nice.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
