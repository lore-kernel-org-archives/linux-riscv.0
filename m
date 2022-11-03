Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F711C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBMvVG4a0VVakmr8ceRa9vJVtioUuyqJMP3UR28r/UY=; b=whF5J9hUULVyQ8
	5j6mkjIt+LIxuNhNFwAy6ZDW4EqvU1PTcDUBSKFQHqjXUr/AkSQEOmj3DtZCEav6RSJjfCmzn+TZe
	BM0EAoLlOZ4REaiRze66n8URIoRrHK6YcmHTL7AHc5MJGeM4iXDR7xa7OsnXG6CPOeAMBowACCWtr
	NPM96vO9ydUk9tzcBxy7cNVqjvgm8q4gK9/0LZ1puhymMOStsc//2DCbw1UmarV2b/pyNk4SQSvk5
	OdUvo4pjrbCiiUgLmepTYyH40Pq60HTuh0bFs56cywddPk7d3K6HGQsTY0kVrnasanDd6W0Eqv2dO
	qictP2KHVtzrrqfSba9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbpi-000EOh-3L; Thu, 03 Nov 2022 15:08:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqbpK-000EBt-2I
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 15:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667488095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MLzJVyRQvNMkBYTyqF+CAZ1OHQes3dhnjH8NkXHBEKk=;
	b=CY0XdSUNeD70Vl1nGxs1Lz+fnk0kusmK2S1UsPsNT8dLTmXjInbelY6+e3b5y7Ko5tIVIJ
	GjNatx/L9IwHA5zc6/OiTWykTS/bAEj8ZzaX1UXKPxhZ3sbJ8ZDVRaIEoUtDDguhIUMpHD
	qTYzz17K/R2E4/sKLw6Sj0PqzQp7mp8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-Wa01ClZzOvilNmNf2P9kbQ-1; Thu, 03 Nov 2022 11:08:14 -0400
X-MC-Unique: Wa01ClZzOvilNmNf2P9kbQ-1
Received: by mail-ej1-f69.google.com with SMTP id ga26-20020a1709070c1a00b007ad4a55d6e1so1432895ejc.6
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 08:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLzJVyRQvNMkBYTyqF+CAZ1OHQes3dhnjH8NkXHBEKk=;
        b=bWy9kJqpI90pchQqR/vHdyrEl4+ChYzabEZHnXo4FDFJXGcNsNCqNAZa6BdWvOx3U7
         9fBWRBvlY+CMxs1jEEErPIYjcFwFQOzGuKyiLFbZRscJfh0SlbRuIY01oNjVluq2odNb
         RVh1c0+0vBsfFpqxDK/zle2Z5ataFj3dfk5qBdDWnPRoMv4bYf9WlPNN/hbETm5jxVef
         aHpqjyD3bO2ksyuYKAJ5Hwt/9EzEkT2w7BusDjrjNjXck+njRMB7Zes04GJA/lQVN6Au
         VvfGHIWpA9Zr3GudmeKVcFGsq+MfB5ecSunKNJLUp9GiVi3KhNVnNCm6klRfZO/nbOsL
         SgHA==
X-Gm-Message-State: ACrzQf0ErtEf+VhR75t35pp0AZPQ6Q3+++KreZbZq8OFZH9jajmR5P7z
	WeAPwm7J5d1VlGCoB3EIKq/9L+zf5OF72hlpp8BM8ioXOl5KvqQq4DkEb3fPT964euP+2ftCdEp
	ePwQUXHFZBkkYl6PgnmVuthk9ifca
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id fi14-20020a056402550e00b00456f79f2bedmr31117715edb.106.1667488093028;
        Thu, 03 Nov 2022 08:08:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ksX1XHskAylW8hRvHj1WJtzsGVm4o7GE4R3Qlz1mullFc3dI571812AyMzkQixxOznTrmOg==
X-Received: by 2002:a05:6402:550e:b0:456:f79f:2bed with SMTP id fi14-20020a056402550e00b00456f79f2bedmr31117664edb.106.1667488092781;
        Thu, 03 Nov 2022 08:08:12 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id s28-20020a056402037c00b0045bccd8ab83sm646641edw.1.2022.11.03.08.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 08:08:11 -0700 (PDT)
Message-ID: <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
Date: Thu, 3 Nov 2022 16:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
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
 <20221102231911.3107438-34-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221102231911.3107438-34-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_080818_209009_56BDF53D 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On 11/3/22 00:19, Sean Christopherson wrote:
> +	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> +	    !boot_cpu_has(X86_FEATURE_VMX)) {
> +		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
> +		return false;

I think the reference to the BIOS should remain in these messages and in 
svm.c (even though these days it's much less common for vendors to 
default to disabled virtualization in the system setup).

The check for X86_FEATURE_MSR_IA32_FEAT_CTL is not needed because 
init_ia32_feat_ctl() will clear X86_FEATURE_VMX if the rdmsr fail (and 
not set X86_FEATURE_MSR_IA32_FEAT_CTL).

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
