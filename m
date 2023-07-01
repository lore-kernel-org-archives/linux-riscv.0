Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBFEC0015E
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FQrJPw532vMIFBfbn715SXpK4+E7NWE17vhkb0HZ+E=; b=w7uEMb3y8a80Fg
	imzuGWrg6fI/jnBPqLiGEgDpWFnbhWnyKTX3Cdew1ZIzBwFjqC0tasPOVjskF3gWdIz37AcsfkhhE
	bbb7WfvJVX9Qkk7fOwjwhWJ5YvAxO7q1Gg7yOk8CyVtwkV4VEyaZ6/RN1V6Dnk4Hyex4IGp2jMv2s
	fMfySc+Pfth+5tB3l68B+Aq3AmvK8I5NYFnMOUZcO+MYy5Jk6VmnF6qEUYmc1uLCnqarZ6z9RQCsJ
	XtCRE+KwMZjp7f/VAMbhh1k+soxZt+reHV4DWhUn2S42+ia8+dGKrW9nbS8EE5W4eOXjQbpIFV/oq
	pH2UafFyqAeleEpQo5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFbyz-006BmG-34;
	Sat, 01 Jul 2023 14:53:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFbyx-006Bkk-1N
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 14:53:52 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51d804c7d14so3053171a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jul 2023 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688223229; x=1690815229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4z5avgOZM94E55xJX5yHh1jEBdl/Nv8eTHj3o1PmFnI=;
        b=IqkaY/63sYcOG0vwtmF02wpU+mNr/gP2fHYz9of1UNY2Q45RQUGKnr0nycE74z3Vq+
         vRH+iq/bEWHzZQJFNk5D1eABcSm/7HMxFYJiaIg+wuXbW55cwpQiwwq7ZbxPO2QlnkIj
         9iVfVrEWAevgKZSOtWpo/0swSzpiq3/5R0+5tvpX1ycDHSi/sX9HFmLv96haLzn08jMc
         DY4baiQluiuE8NdVxL1tqe/WSUZ5z1uxB9P1GEc7MeQjDLyJWrhwO9i9VTqG5iE4w+Nj
         cKCOO9fcg9SfxcuWGrOsZkI7RcxYFElB3npOI1snh4RreMoNrKyv6N+PeDCQ9R1qg56C
         GLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688223229; x=1690815229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z5avgOZM94E55xJX5yHh1jEBdl/Nv8eTHj3o1PmFnI=;
        b=bQaFKde0f9ftIjNlzgjeK4pP5AO2QCyVjsN/gp7kMJTWK0plQ4LKKzxX/TYMV0hpkm
         IvHKNIvWK+EI08LlgQ8OYQd7ojEMMoT/P/YkvZfs7onPQH8O8Mv13+FsSp3ik6TZSbKp
         sPn1KI7YNLUKrb6/8Rcse0uSFCOpdFe0/gHlcs/3zqxFH1eyz50CO1nLXfx6wRK/ewRA
         KLCFvqaABFEMpdVUl8D5D0VoLO2MaNO/LzI4hE6z6RtKk03hccUCNgMrEnR00TtpaCWN
         4RGtiDjvbQa7zxjW79i+mRZ3Vw9hbFSsQYUjgFza75Em7LDQdXNPwNAanrsOSX/7BT85
         RPwQ==
X-Gm-Message-State: AC+VfDyuKXTIKYliaHnRpIxK8YPjsNCuh2r/2K5Cy6MgoJ+d8EZZBU+1
	52tAUNoXYVnk45AE1F72PqHLQA==
X-Google-Smtp-Source: APBJJlFbTncNQknWuK6Y34dd/Vq9wobBPzkzq5+JVS2JfwhQSw4EsBA/mzFykhnRWmdndPeE2HFOZQ==
X-Received: by 2002:a17:906:4093:b0:992:a85d:278b with SMTP id u19-20020a170906409300b00992a85d278bmr3179852ejj.59.1688223228877;
        Sat, 01 Jul 2023 07:53:48 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id lf1-20020a170907174100b0098d2261d189sm1025110ejc.19.2023.07.01.07.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 07:53:48 -0700 (PDT)
Date: Sat, 1 Jul 2023 16:53:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	David Matlack <dmatlack@google.com>, Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v5 00/13] RISCV: Add KVM_GET_REG_LIST API
Message-ID: <20230701-e1bff47a0ed38ec3ab6ca252@orel>
References: <cover.1688010022.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1688010022.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_075351_464168_F48049E3 
X-CRM114-Status: GOOD (  14.92  )
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

On Sat, Jul 01, 2023 at 09:42:48PM +0800, Haibo Xu wrote:
> KVM_GET_REG_LIST will dump all register IDs that are available to
> KVM_GET/SET_ONE_REG and It's very useful to identify some platform
> regression issue during VM migration.
> 
> Patch 1-7 re-structured the get-reg-list test in aarch64 to make some
> of the code as common test framework that can be shared by riscv.
> 
> Patch 8 move reject_set check logic to a function so as to check for
> different errno for different registers.
> Patch 9 move finalize_vcpu back to run_test so that riscv can implement
> its specific operation.
> Patch 10 change to do the get/set operation only on present-blessed list.
> Patch 11 add the skip_set facilities so that riscv can skip set operation
> on some registers.
> Patch 12 enabled the KVM_GET_REG_LIST API in riscv.
> patch 13 added the corresponding kselftest for checking possible
> register regressions.
> 
> The get-reg-list kvm selftest was ported from aarch64 and tested with
> Linux v6.4 on a Qemu riscv64 virt machine.

Hi Haibo,

This series needs a rebase on top of these recent patches

 commit ee053e03b08e ("KVM: selftests: get-reg-list: support ID register features")
 commit 5f0419a0083b ("KVM: selftests: get-reg-list: add Permission Indirection registers")

The conflicts will be in my patches, which do the splitting of the test.
I'll do the rebase and push it to a branch for you to pick up.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
