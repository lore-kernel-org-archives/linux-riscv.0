Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F1AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 04:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/ETirgE+UiNhShEQCcL7d7tYd8L0bMLRO1O1zvIeM4=; b=ehqNWa2Pkzmbzr
	BohhmT4iu2CV6Gzsv4zzEZj2ZYiJJJLeyJmqnhWCA6jLv4o847kdkKeYDQjRk7uA+ltXYFcGodorL
	AxzXWX5Z8K/A/hFxSBGC7+2JjubsxbyZCO4PRIKF6DT43nYOIG3R9+wXYe/4bRJIYBMjPGK01t40k
	hS3ehMu0BtkFJg0ikOOasGUwg7fRRPl3WRE+qHO7lOjR7PBD4A8NR5cZDYXLDkvM9YP3Ys5Af9oz3
	fVJ8fsARzFWke1V2WIYAMQ6LciX0zlIjuPKv+X0gnq5smKNK3LUWK9TkQ+R1tbO84gNMxyVzfpIm5
	X3plOQ3F8sj+yjpa3Xhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qylWG-00Aija-0G;
	Fri, 03 Nov 2023 04:10:52 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qylW9-00Aiho-2s;
	Fri, 03 Nov 2023 04:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698984645; x=1730520645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=juHXPhfl2UOyfQDlVnje9FjGKXxO1moD004mEr2wKcQ=;
  b=oHPxE1ypkL2a/9YYG+fekNYzyMkCqRZqpAeHQnQvu3mT7uxoUwsRX5Wq
   r8np6B8zgHeL0XvcyWsLZUEJovzzI7S+u51xFGw2SmflA/OnerqBXQQ6O
   8Rq8kOPtVm2L20B4sNoQGTWiqPlTsrGEm/bydQQeX/4sED41OicjjVJlG
   O343ZTiXhGyPyF41XPzoRXQMavNZn6+3dctQwxvnHeD+PNwWJCyC0MyLG
   C6bL5VRu7evKADaktAIehdvw6rQ9bHEIAzrL/feoTtoLkKgqEeW7YXPEH
   M4bhJJ+sIj4ya7K/braYEpisR6AIjNj8UlLH1RYX24gTW2oYzyy7EcgOh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="387762860"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="387762860"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 21:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008694807"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1008694807"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 21:10:28 -0700
Date: Fri, 3 Nov 2023 12:09:01 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Anish Moorthy <amoorthy@google.com>,
	David Matlack <dmatlack@google.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
Message-ID: <ZURyXWhZDSCBnMV1@yilunxu-OptiPlex-7050>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-10-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_211045_966007_A81485B0 
X-CRM114-Status: GOOD (  12.22  )
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

On Fri, Oct 27, 2023 at 11:21:51AM -0700, Sean Christopherson wrote:
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6723,6 +6723,26 @@ array field represents return values. The userspace should update the return
>  values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>  spec refer, https://github.com/riscv/riscv-sbi-doc.
>  
> +::
> +
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
                  ^

Should update to "memory_fault" to align with other places.

[...]

> @@ -520,6 +521,12 @@ struct kvm_run {
>  #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
>  			__u32 flags;
>  		} notify;
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory_fault;
>  		/* Fix the size of the union. */
>  		char padding[256];
>  	};

Thanks,
Yilun

> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
