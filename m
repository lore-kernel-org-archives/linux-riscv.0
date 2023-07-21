Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F61EEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMAVxz/OTZqYovbk/gnEZqtuNKpa5NgdhsN9af+oYJU=; b=Dexw4uawAlBodr
	+owcKgyGrTOQWjndRNg0HQtRCJfci3kmcPTXHE5qYQBJhCqKEccVM3HM7kfux2iJInBPUy+Yu09sE
	7QERm26bB6Rhxv/xsFAOkHys2UkLUFkzw0PBXNHYMwCKaqpfwV5QviYI+dShyk7dYjhtXMp7ACl7N
	0mthqYgVEsiQC9kDAY+mkqI78fHVTI76ESCXBANvVwmESfGqF2TGZGIgsswq+zF62zTW2sC1hF7He
	mYq7XQPbnW+VWLRtBYBTsIY6u4jB+pm71SOzwklfVJRp88J7dLFDAvoA2kMP8IlC8SB15XjW84D/8
	zTzB9i6i16q3cm4skE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrhu-00ENSZ-0v;
	Fri, 21 Jul 2023 15:06:14 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrhr-00ENQv-26;
	Fri, 21 Jul 2023 15:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689951971; x=1721487971;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m75I2ERfRQTCcOTwNioBlzNNFor8J6AUk5uhhkX1LBE=;
  b=g3zi9p5DRVUyz0icyAJW9P0T0XKhoOgiWejie3Xk0TXdlQwl0aTiyj+f
   xsm45s+F5oUTj0683NOlggU9hIabeo7sgKbs3LOryNKrojg/bGjzEfOIa
   JQuzZzk1NWP6NhKX4c/CPyKlhSVpUb4qEUcUPUvdcZUdaKxn81KDcTuLv
   Yc5kzYNqn95NlepX3f7HbD8Lqq/99aYdFpf3iWEO+RwFyRyxv4WPI0MHq
   N3Xr985PaYO1UoBX+LK7MFr+nnOo2qT7KHvmxXLLaGlNt3ROxGgle4CAH
   jPuubf2sHm6y0SF0bQXJPjLZLXZFWVzwTuGyGJes72jcSzUABYN75FMpJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430835125"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="430835125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="790229682"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="790229682"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.6.77]) ([10.93.6.77])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:05:57 -0700
Message-ID: <fdc155f5-041b-a1b1-15aa-8f970180a13a@intel.com>
Date: Fri, 21 Jul 2023 23:05:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 Wang <wei.w.wang@intel.com>, Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_080611_749133_03D4E26E 
X-CRM114-Status: UNSURE (   6.34  )
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

On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> @@ -6255,12 +6298,17 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
>   	if (r)
>   		goto err_async_pf;
>   
> +	r = kvm_gmem_init();
> +	if (r)
> +		goto err_gmem;
> +
>   	kvm_chardev_ops.owner = module;
>   
>   	kvm_preempt_ops.sched_in = kvm_sched_in;
>   	kvm_preempt_ops.sched_out = kvm_sched_out;
>   
>   	kvm_init_debug();
> +	kvm_gmem_init();

why kvm_gmem_init() needs to be called again? by mistake?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
