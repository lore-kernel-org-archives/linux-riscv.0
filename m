Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819F4C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+ZSygmINE/kHuPZaUpDkKoXOqlbbxSgffg5aW0k/0Y=; b=loDIb4lF45bJOG
	ukudydcUZ7Vh8CHtB6w/1mvGaSFuXfqle/1vG132RcvnDSAKTGY1zMdKF65JDQsrkGswDoNrYHMY7
	MqWR2gfhQYD+61u8JOJqe0n8iou+Lkhj2eRYHJfDE8K+NZ1eqYNqS14NScNuYoqzrLj8aWuOfSmzQ
	k0pH5xtzllQ2xIzyKxJHSIzjBC4p5ylKTujIiG6pp+gph/H7CW1+5n454yAZFNGaMw02TJNCiDOI2
	dbfsmiBvqx7CwS4zhdKPvA6lnJqD7SAkmkLRFqsqtYlHW5E7BoEIQ8vZ5z/9AALe5GmVQGrX2FQDy
	caohlVCrltRdtI+ezK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqrfD-002r4E-UL; Fri, 04 Nov 2022 08:02:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqrex-002quB-5M
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 08:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667548958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJu1Z+r/Jj1Q22H/Z28kMZfifRbtSqoNatlqDbaYr8M=;
	b=Ht881+Jlk5g+JMhSSLNDUJyiPl1UFMFDxFF9LzjwLU9xxQgu9oKJvvXsOJj+Pzlzgrs21E
	J6OWFWTWg6jrvcXwWk8vnmUSA/DI3Gv4bwgJ5W2BUCe0SyMptQeSs7A7RaSLTJfhITqF2S
	C16Sm+gvNoncb4hATdNLsdRfOpIH/fg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-dkJ2MQwuM1aLs6Jfd1y31w-1; Fri, 04 Nov 2022 04:02:37 -0400
X-MC-Unique: dkJ2MQwuM1aLs6Jfd1y31w-1
Received: by mail-ej1-f70.google.com with SMTP id qb12-20020a1709077e8c00b007a6c5a23a30so2711752ejc.12
        for <linux-riscv@lists.infradead.org>; Fri, 04 Nov 2022 01:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJu1Z+r/Jj1Q22H/Z28kMZfifRbtSqoNatlqDbaYr8M=;
        b=tlX4i7D365mdlxGhYNhyWvrUvlsJ92uBmLawk6AB+9C5rz/fObxZ1Dkj/kBBjRZs9T
         xl72Q3C9MH0ySlg/TGQLYXCbxN8oot60iQNqgVQKvflNATqXsxHp+osBgUK856dF3Yt9
         MQbvw+vAX3pElJ3twwHnJyle+3dqKJS0bs+T/shY2aTKgN3Y/RI7nRNOi7SoAjEV2+us
         54G0i6s7h0lSGwXJfsfy5UHHGJjdEQvSoA6vNfBD7rxbFPC+9+u25DycZ+Ue5zgZkcgv
         DcSSbstyRVLzcELoA1ZdnpnFYVKW3dLHkAd4ogCElQu3DGxmdx9kd5mnLpsAaSdfVRLC
         Jdvg==
X-Gm-Message-State: ACrzQf1xuO40ChMie1aOFKdezNt29j9+6RgRsp1REfnO7te377NpyqvK
	s/SeS94PjsBbsXaVLOEKxuVWdpKygux6bgii2VIPwS+ZOk/z3RqWfeCd5fszykftSSONGk/Q1cE
	bR8rj2TCEqtx5cifZLrwUTg58u3qp
X-Received: by 2002:a17:907:1dda:b0:7a6:8ffc:7dc with SMTP id og26-20020a1709071dda00b007a68ffc07dcmr33677024ejc.163.1667548955883;
        Fri, 04 Nov 2022 01:02:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ZNqKb/aQP9ibAQb8G5uHFxFpKasjpH84kkwoGMwJiLbxjg9Lh2wolUrwViafofx0ss1frxA==
X-Received: by 2002:a17:907:1dda:b0:7a6:8ffc:7dc with SMTP id og26-20020a1709071dda00b007a68ffc07dcmr33676971ejc.163.1667548955613;
        Fri, 04 Nov 2022 01:02:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id tz14-20020a170907c78e00b0078ddb518a90sm1433630ejc.223.2022.11.04.01.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 01:02:34 -0700 (PDT)
Message-ID: <6c71fcca-c17f-5979-e15e-afcf08899064@redhat.com>
Date: Fri, 4 Nov 2022 09:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, James Morse <james.morse@arm.com>,
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
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
 <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
 <Y2QPSK1/6esl61wQ@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y2QPSK1/6esl61wQ@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_010239_432338_245D0888 
X-CRM114-Status: GOOD (  10.70  )
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

On 11/3/22 19:58, Sean Christopherson wrote:
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 3e508f239098..ebe617ab0b37 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -191,6 +191,8 @@ static void default_init(struct cpuinfo_x86 *c)
>                          strcpy(c->x86_model_id, "386");
>          }
>   #endif
> +
> +       clear_cpu_cap(c, X86_FEATURE_MSR_IA32_FEAT_CTL);
>   }
>   
>   static const struct cpu_dev default_cpu = {

Not needed I think?  default_init does not call init_ia32_feat_ctl.

> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
> index c881bcafba7d..3a7ae67f5a5e 100644
> --- a/arch/x86/kernel/cpu/cpuid-deps.c
> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
> @@ -72,6 +72,8 @@ static const struct cpuid_dep cpuid_deps[] = {
>          { X86_FEATURE_AVX512_FP16,              X86_FEATURE_AVX512BW  },
>          { X86_FEATURE_ENQCMD,                   X86_FEATURE_XSAVES    },
>          { X86_FEATURE_PER_THREAD_MBA,           X86_FEATURE_MBA       },
> +       { X86_FEATURE_VMX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
> +       { X86_FEATURE_SGX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
>          { X86_FEATURE_SGX_LC,                   X86_FEATURE_SGX       },
>          { X86_FEATURE_SGX1,                     X86_FEATURE_SGX       },
>          { X86_FEATURE_SGX2,                     X86_FEATURE_SGX1      },
> 

Yes, good idea.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
