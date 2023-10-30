Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A760FC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 16:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVgl9G/Tg6E8CXTRMoc7pE6JF01qI1+G/IVg+Xaz7Uw=; b=tw213FMrtsnur+
	a39SYeBf/YZFQaVbE6nhEwWV3sBJJff9OnkWY/Fn8uhQB4JQjvsSr8mp5ZXd4YPjTasJ+JWP25b8y
	jz9axdtQamSxC0Ddzy+HhwbECHFjuuRqfxcESb9NJXsfmG55BXCDKN7Yip2kClQmtlEKplMMXEFj5
	MpJCKSP94plWjqkFBWt8EeKzWSg1VVMNvjz6Ve5mJ9UANDOPBmeq60N3T1Ts+gSMRYxD81I2OxxPC
	fm+KcVPJyo5hhCtZdX0IT7sNZ0b8CLazt8PWM3AWQQvL64KSDNDqBM1IaBb+6xp9NfGwNjM9nuXe5
	i/v+rnSDcDOFpHNakGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxVHR-003fVA-0K;
	Mon, 30 Oct 2023 16:38:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxVHN-003fTn-0v
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 16:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698683896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hJI+hdEWXbKa+M8W7tfHy5n3N8xPX6O0WbfIPeXfRTc=;
	b=aBm6eZRyoqeJn0Oo8ofOusNplu2VxXbZ10coZ1RNpiM4zg3RGQ1D0JFJFdGGTTDHVlTPLE
	RnmcVv53uyAL6OrvUlGbQvJYQK5tML31NjDgQhZ4ao0fqaduKt9OfM+tWBLhLyjHAOgsgR
	O2akOUaUP73GGgJgvjY3IvxtHoMD3O0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-9QgMyVpOPTqy4sDaHRsOXA-1; Mon, 30 Oct 2023 12:38:14 -0400
X-MC-Unique: 9QgMyVpOPTqy4sDaHRsOXA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-408f9e9e9b0so35845975e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 09:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683893; x=1699288693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJI+hdEWXbKa+M8W7tfHy5n3N8xPX6O0WbfIPeXfRTc=;
        b=docQaVgROTKY6W4ol7v15LQ8o6vG+oK2FnpG8iG2fdaab/cI+egBUuObCCUuaMIq0n
         VXTcV4hDWPJ1Do7AOweYaR+EiX7Mb//1O7Uf02fEceSUIvchMrGTXwkUT4HWJDxpdMRP
         IAoIR7rnuQsomBxpS0Nly8zbmN+MUR9twMPyg0qnhoFFg4goc99dtFbypCAhK+9crf58
         utP4tNbf+lrEf0BftQ96ZQdehG3cP4nJIwNDDumCjqpnCaoBkJUiQv3d6SrzU5NH+hlc
         DK5WhydzV1BZbfWnNdCuITHs2lzKpgeFSIfmZlfRrqHoXpSVfP1sFSYnCcxIvWON7dps
         g/yA==
X-Gm-Message-State: AOJu0YwcT7vu7AXhfPG8idHtzV27Jaha3/BNiuPmvjtagRJkXpQBOggB
	cxv6Wsq1LhV/UOPRYhVgUG/HtqJoHIQxGIVpKQ5pCgcPUUFAKrIMqxcYXRKn0Fa1NGrFWh07JZs
	MqOrJKjgHn59/7ENWaWh4Heo7E9iOLwQGMdbE
X-Received: by 2002:a05:600c:4f53:b0:3fa:934c:8356 with SMTP id m19-20020a05600c4f5300b003fa934c8356mr8459620wmq.10.1698683892957;
        Mon, 30 Oct 2023 09:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZEMK/0a4y6GRranfUYFosow/+q05YMqexgnrNudyg+ulCeoJJOVHXdjy3BiTQsTruKVMBhA==
X-Received: by 2002:a05:600c:4f53:b0:3fa:934c:8356 with SMTP id m19-20020a05600c4f5300b003fa934c8356mr8459576wmq.10.1698683892541;
        Mon, 30 Oct 2023 09:38:12 -0700 (PDT)
Received: from [192.168.1.174] ([151.81.68.207])
        by smtp.googlemail.com with ESMTPSA id m1-20020a05600c4f4100b004063d8b43e7sm13252825wmq.48.2023.10.30.09.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 09:38:11 -0700 (PDT)
Message-ID: <09966596-397a-47c6-8f43-610a1013d34a@redhat.com>
Date: Mon, 30 Oct 2023 17:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 07/35] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to
 CONFIG_KVM_GENERIC_MMU_NOTIFIER
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>,
 David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-8-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231027182217.3615211-8-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_093817_397801_8F59BEDE 
X-CRM114-Status: UNSURE (   9.70  )
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

On 10/27/23 20:21, Sean Christopherson wrote:
> Convert KVM_ARCH_WANT_MMU_NOTIFIER into a Kconfig and select it where
> appropriate to effectively maintain existing behavior.  Using a proper
> Kconfig will simplify building more functionality on top of KVM's
> mmu_notifier infrastructure.
> 
> Add a forward declaration of kvm_gfn_range to kvm_types.h so that
> including arch/powerpc/include/asm/kvm_ppc.h's with CONFIG_KVM=n doesn't
> generate warnings due to kvm_gfn_range being undeclared.  PPC defines
> hooks for PR vs. HV without guarding them via #ifdeffery, e.g.
> 
>   bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
>   bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
>   bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
>   bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> 
> Alternatively, PPC could forward declare kvm_gfn_range, but there's no
> good reason not to define it in common KVM.

The new #define should also imply KVM_CAP_SYNC_MMU, or even: 
KVM_CAP_SYNC_MMU should just be enabled by all architectures at this 
point.  You don't need to care about it, I have a larger series for caps 
that are enabled by all architectures and I'll post it for 6.8.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
