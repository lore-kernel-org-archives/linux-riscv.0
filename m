Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9946C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWI2Gg/81xWTLHWFGgWp1fFcn49IpzP8UlHxdlpuYdw=; b=QSUrYXY6GWgNNd
	LGPEJRBx43pjuDzjsZT3ISBMziX//OsmCiN0D72J1S/BI9qw5ZW06TaAQqKJng9FQVDH/ne0jWNOW
	XFWDSXCuvEo4XBz4KzMRuqOELzrCtZLWdl/Twh/UHvf/0jpztRSYD09/D6SdntFqdp9DitOyQtq+c
	uDdjoWOLfdWiQ4OudEHthUQMjWfNGel01/OcyPZZ4gObh3Od0bJOvnssJbwHPQ7vLO0KO602JMopX
	FhvNUux+wmBXfDZJNTf7WEcoQEYcGb3GjVQHkONZOz3qhtEej6SM1Q8ybxcvlr87djyEuQpLajYfC
	1jMIKCfW8+s6f+61Qe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqhNs-001gL9-W9; Thu, 03 Nov 2022 21:04:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqhNf-001gGh-MQ; Thu, 03 Nov 2022 21:04:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d24so3097989pls.4;
        Thu, 03 Nov 2022 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKpWMQos6VVD1S/I4lACLsmO/tYS5LRA7d2ENkEKbRo=;
        b=W1jfdVvCiC74H1TrCZBHpy39zmLx6ZdDw7CTvEA3hQRy2SYEYEHpqHKEqbYIPLurIe
         Y2whGNqDI5mui4w+1QXrkHh+GC9ATmNd8ps8PeHw3qaJpwgt1d7jvMCXqs25Zy8Lpx4o
         BRkdqU5nSWSpkaBgaA/lV+5CSWVpabSirQHa1cejuentrhT/uERBbBImlSMJgf6A967J
         fjOlpx3kn0dIaEHhhAKeVdXj4/EkPaL2dmbdM+AJdzuPv1TA2eEp2KkYLi7TVhEuAixL
         VUk9wO+wTZMMnlMLn0pWY/lQ/5O1/2ysb54mA9Nupm245dVRVUlabq2dQWglwCNzBaAj
         yq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKpWMQos6VVD1S/I4lACLsmO/tYS5LRA7d2ENkEKbRo=;
        b=RR+WoZILvL4eu9h4iBENgY9AsB7iWWVlpExESiP+uGPvOXWqfIx9KjygOFQgU0A+US
         rtBo3lQsuMXjxKoxVNlSBE72ra4UDfktQtoQP6HlMCcpj4AFO8hWrA3I+xd97gTfwHG0
         RB0/Y1WqqNZ9Siw4cmP5b2xveP+Jkmj4eFBo5tHFFw2lEh0ncgVW6jPG53RRw1pWQ7yl
         2RygerVSdoCkiOPziCiOh2u7KV/co+AT0OyCJBL+RNeix51P5vxBg47rLw29S/1qNrJe
         QILV/Zgru6hjZVCZ447aMa5Fl4LNJHe20Ktbp8t1xd8bjFVXlFHvxWvhMZq4cxa3zTeF
         q7WQ==
X-Gm-Message-State: ACrzQf2azQ77/RjNY77GMOtrf3In5iV1BZVrew2J46M8rFdbT8u1ml0E
	skKEYY6qZ9E2ksAdu2Fv9kM=
X-Google-Smtp-Source: AMsMyM4B7LXLMUo1WLny520SMeR1sIUEIak6LqJqMDk6N+6eScsWNFNrZpvHK/6RhT2SJsSNsCUIWw==
X-Received: by 2002:a17:902:e5c5:b0:186:5f09:8468 with SMTP id u5-20020a170902e5c500b001865f098468mr32699741plf.122.1667509444114;
        Thu, 03 Nov 2022 14:04:04 -0700 (PDT)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id 27-20020a63125b000000b0046a1c832e9fsm1137383pgs.34.2022.11.03.14.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 14:04:03 -0700 (PDT)
Date: Thu, 3 Nov 2022 14:04:02 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Yuan Yao <yuan.yao@intel.com>, isaku.yamahata@gmail.com
Subject: Re: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
Message-ID: <20221103210402.GB1063309@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221102231911.3107438-37-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_140407_776884_68F974AD 
X-CRM114-Status: GOOD (  22.74  )
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

On Wed, Nov 02, 2022 at 11:19:03PM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> From: Chao Gao <chao.gao@intel.com>
> 
> Do compatibility checks when enabling hardware to effectively add
> compatibility checks when onlining a CPU.  Abort enabling, i.e. the
> online process, if the (hotplugged) CPU is incompatible with the known
> good setup.
> 
> At init time, KVM does compatibility checks to ensure that all online
> CPUs support hardware virtualization and a common set of features. But
> KVM uses hotplugged CPUs without such compatibility checks. On Intel
> CPUs, this leads to #GP if the hotplugged CPU doesn't support VMX, or
> VM-Entry failure if the hotplugged CPU doesn't support all features
> enabled by KVM.
> 
> Note, this is little more than a NOP on SVM, as SVM already checks for
> full SVM support during hardware enabling.
> 
> Opportunistically add a pr_err() if setup_vmcs_config() fails, and
> tweak all error messages to output which CPU failed.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  2 +-
>  arch/x86/kvm/svm/svm.c          | 20 +++++++++++---------
>  arch/x86/kvm/vmx/vmx.c          | 33 +++++++++++++++++++--------------
>  arch/x86/kvm/x86.c              |  5 +++--
>  4 files changed, 34 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index f223c845ed6e..c99222b71fcc 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
>  };
>  
>  struct kvm_x86_init_ops {
> -	int (*check_processor_compatibility)(void);
> +	int (*check_processor_compatibility)(int cpu);

Is this cpu argument used only for error message to include cpu number
with avoiding repeating raw_smp_processor_id() in pr_err()?
The actual check is done on the current executing cpu.

If cpu != raw_smp_processor_id(), cpu is wrong. Although the function is called
in non-preemptive context, it's a bit confusing. So voting to remove it and
to use.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
