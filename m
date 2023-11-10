Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5B9C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 08:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLHyfb8hrERyP/ArEz2w/wT0C9aykP6uZ331KMy+p3s=; b=wVXw20RctDVOC6
	G1CSEHNDKp3x0XkPv0w3NoGGOVCzApYAEXyGFfjvIWnP2aT6Nb2wNeyVXaQD8GUDz+SnwvsAcwL8L
	lFBRPyqPfJg/wUaxBTEomydyD2hrzwqvfftHL/DVp4CK/eYgaEBAegr3kMbLOsVtocBAPhX9RhaKm
	Nnn9x7v6TjrJTuOyFKydZZy+YUY1dg/VsQ7E4PUmMgmAdsGfmZd7DzkKCiPJhCy/QuaRQFpja8zNK
	HHwl5MuWm/WjZ1+zDeJIRHECEdeJcJyW83IWyOLjR6C8F0iH5pZkTmWpCy3qzI6XIDwZQvjtvO6NQ
	R3Nj8jJf2yX/SXRoUNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1NCw-0087SS-1p;
	Fri, 10 Nov 2023 08:49:42 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1NCt-0087RT-2l;
	Fri, 10 Nov 2023 08:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699606179; x=1731142179;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+ZJrwu8dlZjYjWjLp1gdXlOokUQXh0jEVn+ZKnk4oik=;
  b=LG9jFMeNpgUHCozFn/Vg5nl9IcdHRV0R1puIt7KvfQ+bLNhTizeonOeR
   RXJEw3O2sRALcMdB9FQjeKSVqe9EFvclobg1yPP2LriALZOoj1V5MN1m4
   rvwsbjHfCSN9R9C/TysviaQDWo7CW1hKTF4NsaqplmsLNZ7PZDo88B3ZO
   ZbllVuyHBGYkSR2MBMLLwia8o8lrimVouFjzSGX84Q0vVKqas1pCOG/U+
   vj3EgkjS0XRtI5waVgXGxHPZ1COs6WyU6Ww1wrV2J4jq1A96UQqdXNpmm
   DfQ2/6yr9ZLI+UCPgsaQwA+OQ32Wx1NqTKIAM4SIJCUG77wXkcKejNPF+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380545615"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="380545615"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 00:49:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887305217"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="887305217"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.9.145]) ([10.93.9.145])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 00:49:24 -0800
Message-ID: <b4ec10ab-9d06-4784-8893-6e2e895cd9b1@intel.com>
Date: Fri, 10 Nov 2023 16:49:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/34] KVM: x86: "Reset" vcpu->run->exit_reason early in
 KVM_RUN
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
 <20231105163040.14904-17-pbonzini@redhat.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20231105163040.14904-17-pbonzini@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_004939_940008_C4392A70 
X-CRM114-Status: GOOD (  20.81  )
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

On 11/6/2023 12:30 AM, Paolo Bonzini wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Initialize run->exit_reason to KVM_EXIT_UNKNOWN early in KVM_RUN to reduce
> the probability of exiting to userspace with a stale run->exit_reason that
> *appears* to be valid.
> 
> To support fd-based guest memory (guest memory without a corresponding
> userspace virtual address), KVM will exit to userspace for various memory
> related errors, which userspace *may* be able to resolve, instead of using
> e.g. BUS_MCEERR_AR.  And in the more distant future, KVM will also likely
> utilize the same functionality to let userspace "intercept" and handle
> memory faults when the userspace mapping is missing, i.e. when fast gup()
> fails.
> 
> Because many of KVM's internal APIs related to guest memory use '0' to
> indicate "success, continue on" and not "exit to userspace", reporting
> memory faults/errors to userspace will set run->exit_reason and
> corresponding fields in the run structure fields in conjunction with a
> a non-zero, negative return code, e.g. -EFAULT or -EHWPOISON.  And because
> KVM already returns  -EFAULT in many paths, there's a relatively high
> probability that KVM could return -EFAULT without setting run->exit_reason,
> in which case reporting KVM_EXIT_UNKNOWN is much better than reporting
> whatever exit reason happened to be in the run structure.
> 
> Note, KVM must wait until after run->immediate_exit is serviced to
> sanitize run->exit_reason as KVM's ABI is that run->exit_reason is
> preserved across KVM_RUN when run->immediate_exit is true.
> 
> Link: https://lore.kernel.org/all/20230908222905.1321305-1-amoorthy@google.com
> Link: https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Message-Id: <20231027182217.3615211-19-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   arch/x86/kvm/x86.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 8f9d8939b63b..f661acb01c58 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11082,6 +11082,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>   {
>   	int r;
>   
> +	vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
>   	vcpu->arch.l1tf_flush_l1d = true;
>   
>   	for (;;) {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
