Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42CEEE6420
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVyNOOh2tcfTPZ1hoA8HQtSS+Aeqj3OwnJIu/IM4oUw=; b=UJ/qZ05DcIpWaG
	ThCoSfSbsCcPKGwmgBnUMlrKpkSpK486QZSU1MGLUFg/+5gQ7PhXsM7rM4L1V+/XpG8xeDx9ymFfa
	rSzrp01++78BLKIqTi1FYN2lCAfEMJ8ZMtD/87oJTKj/LL/2uFK3BVQNcOrU0jaulnpsyqVZw9wpc
	Cn0YHCTDAIMuXnbLWiJWKHEx0WI3HAhfN6J8ZTb1Yoo9mEvRjgpHxcxVy7emW1foBJ8BJ7tlyeGFe
	0FbUjiWYMF07K1/UMwa7t+Ve6Q+pRT3gQzw3qyMgszb9vBDK6JnHECUlVCskwT7W6VUfFycft/OxB
	QlRLdf8HJ2lfwE720q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2c2-009w7Q-2G;
	Fri, 15 Sep 2023 06:47:34 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2bz-009w5E-2J;
	Fri, 15 Sep 2023 06:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694760451; x=1726296451;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nbiNTtCye3B4MOA9keAnL3jGRC3Z0ZFqO6c5ckMzgn4=;
  b=X1cyTYhZFxuHSkhMCRNlilWkk4sGhucEw7AmevSdjyt7HWs/JW7SGBu7
   DzTHhctlzRoqnRBbbaQ4TxqDvyUuEQkzwXgLrnVcz2FARVqJQLhjpdz5c
   7jGSDlGRgZAXAcohyzN39ycwipah2yCGuBU9ZKQ4V09gs+68NSVjiQI3F
   SEqLz+7DHuWd7EM6C2QjxCaDeSASidK3NSrDjg+1QnLUjIWpdYFHpKLWL
   00/GtQFFMInx28sS2WEzikxqHgSAGULPXtvNo+/w1IPkkiMr0DVqnH6D3
   S4uEnO3AgE1tTONfupfTBUfvcyw+PsJvv2VYqHp4CYWGHhN5QiNg0HF7M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="383000911"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="383000911"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 23:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744857575"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="744857575"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.29.154]) ([10.93.29.154])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 23:47:16 -0700
Message-ID: <d4166c97-6ab3-89a2-eb12-f492f7521f69@intel.com>
Date: Fri, 15 Sep 2023 14:47:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v12 01/33] KVM: Tweak kvm_hva_range and hva_handler_t
 to allow reusing for gfn ranges
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
 Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-2-seanjc@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230914015531.1419405-2-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_234731_823221_7E3E8009 
X-CRM114-Status: GOOD (  13.03  )
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

On 9/14/2023 9:54 AM, Sean Christopherson wrote:
> Rework and rename "struct kvm_hva_range" into "kvm_mmu_notifier_range" so
> that the structure can be used to handle notifications that operate on gfn
> context, i.e. that aren't tied to a host virtual address.
> 
> Practically speaking, this is a nop for 64-bit kernels as the only
> meaningful change is to store start+end as u64s instead of unsigned longs.
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   virt/kvm/kvm_main.c | 34 +++++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 486800a7024b..0524933856d4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -541,18 +541,22 @@ static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
>   	return container_of(mn, struct kvm, mmu_notifier);
>   }
>   
> -typedef bool (*hva_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
> +typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);

Is it worth mentioning the rename of it as well in changelog?

Anyway,

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
