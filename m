Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C440C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 07:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJ8ynbYn4Hj4bddPFgj5WzRkts76pi/25WVg7DCKV4w=; b=M003P/FFlLQ7Xe
	LEqBx0jwB/hNLAWvSQT3OJ5+EcWjjhJhDIp4HsSNPjcBEerFpNa3fXIteieUMezIC5z7UTtisZ9FT
	EEWpnH2YYvFwh+UGduXpzDhysoZUWxt5h0nmhB9wtFXUkYESP2hzzsm5rJxAnWJ4I390dM0YS7Mhn
	vYJO3H6xjPhr7hvlDqhraXBYdYKAYKCYUWUzb9SCCKEWGLXIPYNw7pQFa4G+f7Zlrv6VQzxpV2vHW
	mWclpDlS8p+zTOhTfNsxFzD3NpSPu8VwbpsLCYy6KQoDh/6DIxZ38QC46vntVM3OiTbkfoqYhCXX+
	gXghE97Xl+VZVgBp+hAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUbh-00GSJT-Kq; Thu, 03 Nov 2022 07:25:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqUbf-00GSIE-MV
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 07:25:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id y16so1282428wrt.12
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EDXCjZngZdqFd0T8UNtaJgIVNUXtxy5kh+IvZcYgc3o=;
        b=KBb4CRffvbqT8vCYmIjrzMCnn1vGDH3hTE8kztkuirWCWDx5vmnnhlY12+76G8HB+D
         zNMscqf1aWjU1jn9Q/+2qznV1nyjnfJgJejU0eBLDst+wEJ5JP32F9KCikAYwccYRz/4
         CEoS+rbiQf+EK76mQ+O07yD4/kZHVOkQQ4sHVGI67dP7iLfCkYZsRk0ZykZuinHxGqnw
         VBepbg5NHi4yk+ONf1CC+WSt8MwwyKu83Az0OvU8HlQtsrRUhgNXczuxh+p9v62b1ye5
         0/LNF3gKJJGGBQ4GVZwf3fHBWg9tW8pDxWcOYgxGkG6PYQEim2NR9gsO5CmPy3fAtv6n
         sc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EDXCjZngZdqFd0T8UNtaJgIVNUXtxy5kh+IvZcYgc3o=;
        b=s26b/tWVRYn1Ex6EOcpmfYKrIebHOO5+SZ9BumTQ3R4BJ5xFvtOm6qA4kOZ0yYd8sj
         pwkf+gnz8VbnE94X3jd0EKZcgSUPQt2YonoXItdf7iXNeCIyapX9W3/KxtejHPaKDiqJ
         xDFmA3M1wgxGhGF9zLSZcdRkBX3WsMHX0EvVoWKxAx4kFVWFjejarTQsc32u57zn46f3
         J4LjO3xYX/cTaaJlzBrvemRFAZFciKKvSHsgw2nCEmR0Tog0PaZqd2vO+Sc3oPh+mIAo
         gb4FQyRNLhV2FDopkXssoXdydMxSgdx7RjNB8X/icIRyxLgO2vMDVCERbI3UV47rrGpu
         cgHQ==
X-Gm-Message-State: ACrzQf1KUgwlAiGNVB3x8aHXGq/SbSM0bvD5kfFpoX3dFqIJl8PTqxD+
	weTpvIKCujWXL2agGgJPtxoTWw==
X-Google-Smtp-Source: AMsMyM74HX/NoI0zgj7ni+fuzXHxAnM/kiJpMAz2sP8bktGhOQR4suw74I3bBM5aFs9fFpQjlVL3zA==
X-Received: by 2002:a5d:50ca:0:b0:236:776c:3075 with SMTP id f10-20020a5d50ca000000b00236776c3075mr17956880wrt.656.1667460341889;
        Thu, 03 Nov 2022 00:25:41 -0700 (PDT)
Received: from [192.168.11.175] (216.red-88-29-181.dynamicip.rima-tde.net. [88.29.181.216])
        by smtp.gmail.com with ESMTPSA id i10-20020a1c540a000000b003a3442f1229sm4408723wmb.29.2022.11.03.00.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 00:25:40 -0700 (PDT)
Message-ID: <dd59d579-4a4e-6db2-eac4-6c5c3ab71fd3@linaro.org>
Date: Thu, 3 Nov 2022 08:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 17/44] KVM: arm64: Do arm/arch initialiation without
 bouncing through kvm_init()
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-18-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102231911.3107438-18-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_002543_780491_F5631936 
X-CRM114-Status: GOOD (  11.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Sean,

On 3/11/22 00:18, Sean Christopherson wrote:
> Move arm/arch specific initialization directly in arm's module_init(),
> now called kvm_arm_init(), instead of bouncing through kvm_init() to
> reach kvm_arch_init().  Invoking kvm_arch_init() is the very first action
> performed by kvm_init(), i.e. this is a glorified nop.
> 
> Making kvm_arch_init() a nop will allow dropping it entirely once all
> other architectures follow suit.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/arm.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)

>   /* NOP: Compiling as a module not supported */
>   void kvm_arch_exit(void)
>   {
> -	kvm_unregister_perf_callbacks();

Doesn't this belong to the previous patch?

> +
>   }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
