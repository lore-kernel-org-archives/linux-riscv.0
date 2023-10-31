Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D139C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 02:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boFgWbee5QjNsd6m+ru2BGUUkacA94aEFp7TTYvmfvY=; b=EnrjxzO26N9WJq
	GyPWEHCleko5pcN47Zn4mStd8f9hW2e64VtyfEAS63yahdnGzmZ7YreqD9KWpw05Skp9Cz7Rf4Xto
	kfd/RGLyImpkGxYK7Zud5p3HD1clRaE7dhK2eKc/4aVB7OcPOlJt4dDdwYahaUfo1EjhXnnrMVo+y
	HATs7m2fVVa2oukFVHPPPhq3A5CiEDykrYszIrC6eEsI4dfmb6u2VsGsSUz7Z0ue/+884cVVySLI/
	+W2brx93GJdp+znp589DYIsIcYLmf0tGy1qgO8+c54CjFPghviDmDzA+LkkwsCo98wI6eQNb0YeNC
	doggioX6xo7MZJV+xHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxeUG-004QId-2P;
	Tue, 31 Oct 2023 02:28:12 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxeUE-004QHn-0R;
	Tue, 31 Oct 2023 02:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698719290; x=1730255290;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vr6E776DqFsISXT/abuJv1DHpqFpjFuaZ5JfgggngVk=;
  b=BuIMI15paS4O474D/tJ3ESPG+5u1lGEewVuhvPJe7YZ0/1HEWfN/7M3c
   HpzVSw1qB1JI+u3zMh3NP36trFyqcHAkKXSSr7f5Rqjr1iY62B7OofwuO
   l1F52dqdFmmbEHHERIKtgpaW4kciWfagziccCFuEhZlrwYzxqIxi7FOgI
   UPYZ9Rtios6G1zuaTVEbKTGCOiIlBUjtoEZvAuRXf+fUHEMNPacOa+FT2
   ntoIrjUluGFo7ilMLu7a1B5BV/LL6a6d6KnSb4KMTIMbskfw1TsJUj3A3
   4PRUVCE/Zl6k0peS5ngn/KtHf9FH5kH5o1F38/SVmYOa9zyUfGFPHRdSi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="373249932"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="373249932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 19:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="8161979"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.9.145]) ([10.93.9.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 19:27:57 -0700
Message-ID: <aecdc915-8541-4933-b8cd-04ce0ade68e6@intel.com>
Date: Tue, 31 Oct 2023 10:27:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
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
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-17-seanjc@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_192810_258020_756122F8 
X-CRM114-Status: GOOD (  11.76  )
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

On 10/28/2023 2:21 AM, Sean Christopherson wrote:
...
> +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGION that
> +allows mapping guest_memfd memory into a guest.  All fields shared with
> +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_PRIVATE in
> +flags to have KVM bind the memory region to a given guest_memfd range of
> +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target guest_memfd
> +must point at a file created via KVM_CREATE_GUEST_MEMFD on the current VM, and
> +the target range must not be bound to any other memory region.  All standard
> +bounds checks apply (use common sense).
> +
>   ::
>   
>     struct kvm_userspace_memory_region2 {
> @@ -6087,9 +6096,24 @@ applied.
>   	__u64 guest_phys_addr;
>   	__u64 memory_size; /* bytes */
>   	__u64 userspace_addr; /* start of the userspace allocated memory */
> +  __u64 guest_memfd_offset;

missing a tab

> +	__u32 guest_memfd;
> +	__u32 pad1;
> +	__u64 pad2[14];
>     };
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
