Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E350FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 08:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktR0uE5xdOUL2az7+tbbeY64HIDqUgS7DwobiGeIk9g=; b=kn1grR0/cwPhOU
	0WGc4d/CIOz2ntcKukRR70dUOPN3cd/XLhmvs9+GROOJmlBXUrUU4Cbw3YcvlfhOPtkcT19v5jFhL
	sbHiprrR2bSSFcBMuHL1ud/fXeAPs+eLduU0pQDDU2O0hkFoNVFTtJ0kUToYfl//EE0rSnXWD1JMo
	6uZCtl+cU9aWXWdH7KN6x3vst407cYg93GMa3SiYgnfZ+WjAvvc7GTq2f9cHCgnMX2KChHJMzBhtg
	kZdu4lupxX+bB70P93G/p81QxrNVa5YtwJLoRzf8QWb3fBJB6CPqgwJOjsnL0/YyUUxwQxwIadem+
	2wyWcNHF13SOp38C+FpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkEc-004mnk-0X;
	Tue, 31 Oct 2023 08:36:26 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxkDc-004mND-2Z;
	Tue, 31 Oct 2023 08:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698741324; x=1730277324;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=P66Mu8Qvvs1bSZcrJh1IrkuvvxdPz+TRpT/cX8K5jyg=;
  b=HF/aq1aKX0AEQJ6p5OCq177hf/hgvm8BDy9PuwK4P10EL6t43isbenZV
   ssgovxU4JCBaCX3RJsx8J3agyvVn54zps6oEFbMcIJ8IInri0SO+Qv7o9
   vhP+D0K7fELFd0MxMpML28YOYTEVAuvkxeEQO6jNgnM8KVdsHO8xsgK7M
   LoC5hQ9Ktbry8tcF6+XnT+i0AWw9Yx76pjGyrzq4k6l1L2EXNmHdvVOtP
   GcRU1YuSC1/JPl1fNcdzuxKOkboVRHVoIDizTEFvxG93PFOkAb7x6BGlY
   fOhqHtlNUhCthuO5uViTAUjo1SgOdcq5ljaCs65BaRgN5lPk3qakixnUu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474479547"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="474479547"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 01:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="795488444"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="795488444"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.9.145]) ([10.93.9.145])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 01:35:11 -0700
Message-ID: <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
Date: Tue, 31 Oct 2023 16:35:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
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
 <20231027182217.3615211-18-seanjc@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20231027182217.3615211-18-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_013524_884986_BC0999BE 
X-CRM114-Status: UNSURE (   9.50  )
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

On 10/28/2023 2:21 AM, Sean Christopherson wrote:
> Extended guest_memfd to allow backing guest memory with transparent 
> hugepages. Require userspace to opt-in via a flag even though there's no 
> known/anticipated use case for forcing small pages as THP is optional, 
> i.e. to avoid ending up in a situation where userspace is unaware that 
> KVM can't provide hugepages.

Personally, it seems not so "transparent" if requiring userspace to opt-in.

People need to 1) check if the kernel built with TRANSPARENT_HUGEPAGE 
support, or check is the sysfs of transparent hugepage exists; 2)get the 
maximum support hugepage size 3) ensure the size satisfies the 
alignment; before opt-in it.

Even simpler, userspace can blindly try to create guest memfd with 
transparent hugapage flag. If getting error, fallback to create without 
the transparent hugepage flag.

However, it doesn't look transparent to me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
