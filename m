Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BD9C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 02:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aS0ZuPCgqw0rPsLt6Onj4iFL0GqpWeE6Km0C6OpoJ0I=; b=hIBLwRwcS1QirS
	e5fSC/UQbnc2DWnp8UEKqyMEs3AQMWfgsGOk+FsFqmhVHInGCaPXwufRIfg89OTaGOwsR+Aax2SUb
	lq40wXy5VeWPVDDnP6g0oH00qYhOq+jIp1t8D7DtAA6JsT3UKtNx7JDqupIhDcVKK/yYuUmy45jQa
	auk046H1oR9w0mRqkKGS+UU2I8p7bjtYEhAJjsPLTROUOhBs/PwXNCXvIyzqiSugJBCUhbtScHgKB
	uxTCn1rw0+tctpOZIcpLCDKGAqKdoBufwfjfqmXfvKJLUdSyfzguqztokZXLCg1xab2475LAz+XS6
	86AzqsRWIX1fyOlmu4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNJn-008XGp-2f;
	Thu, 02 Nov 2023 02:20:23 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNJi-008XAC-0o;
	Thu, 02 Nov 2023 02:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698891618; x=1730427618;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qMSrBq5gKSfvneC99jG0ycqZi9wUzkwKrG5m2lwT0dM=;
  b=GUP3IY6lcx0aIRxEz2bjLNrGq7EPd3IdUeeUM4+ny8hsLV4xnJe4SRJQ
   kCcz/GAZSRsMKVdC7Xxt3IsdDRK3Zap3SAci1/j+ifuJRt073AIwEz/NN
   SEo/4sycs2YElc94IlFMPw+abwaAuTG1MiEpA5wkk29S+EtumEWu4lVdn
   rmEOonre8M2sO5ewSxCaUz0BTfa3gJmWJ1mZ6jyYdXSLKW5UbehsoLff1
   M6WgdCbCAopiaCIFsG5rLODo9wJq5f9aqIMZd+OXSa/4LUwCSt74SLd5B
   IP/0y6BinULV3IhlUlcUjHbFRG828CzXnJamKW/yQjwXlc9fBCWnCNuHH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="373665324"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="373665324"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 19:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="851761891"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="851761891"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.93.9.145]) ([10.93.9.145])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 19:19:53 -0700
Message-ID: <33686031-c1df-4ef5-a6ac-1aab7f5c656e@intel.com>
Date: Thu, 2 Nov 2023 10:19:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>, Kai Huang <kai.huang@intel.com>
Cc: "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "maz@kernel.org"
 <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "willy@infradead.org" <willy@infradead.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "mic@digikod.net" <mic@digikod.net>,
 "liam.merwick@oracle.com" <liam.merwick@oracle.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Isaku Yamahata <isaku.yamahata@intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>, "tabba@google.com"
 <tabba@google.com>, "amoorthy@google.com" <amoorthy@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Vishal Annapurve <vannapurve@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
 "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
 "qperret@google.com" <qperret@google.com>,
 "dmatlack@google.com" <dmatlack@google.com>, Yilun Xu <yilun.xu@intel.com>,
 "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
 "ackerleytng@google.com" <ackerleytng@google.com>,
 "jarkko@kernel.org" <jarkko@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Wei W Wang <wei.w.wang@intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <ZUKMsOdg3N9wmEzy@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_192018_328565_19A24A58 
X-CRM114-Status: GOOD (  12.13  )
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

On 11/2/2023 1:36 AM, Sean Christopherson wrote:
>> KVM_CAP_MEMORY_FAULT_INFO is x86 only, is it better to put this function to
>> <asm/kvm_host.h>?
> I'd prefer to keep it in generic code, as it's highly likely to end up there
> sooner than later.  There's a known use case for ARM (exit to userspace on missing
> userspace mapping[*]), and I'm guessing pKVM (also ARM) will also utilize this API.
> 
> [*]https://lore.kernel.org/all/20230908222905.1321305-8-amoorthy@google.com

I wonder how this CAP is supposed to be checked in userspace, for guest 
memfd case? something like this?

	if (!kvm_check_extension(s, KVM_CAP_MEMORY_FAULT_INFO) &&
	    run->exit_reason == KVM_EXIT_MEMORY_FAULT)
		abort("unexpected KVM_EXIT_MEMORY_FAULT");

In my implementation of QEMU patches, I find it's unnecessary. When 
userspace gets an exit with KVM_EXIT_MEMORY_FAULT, it implies 
"KVM_CAP_MEMORY_FAULT_INFO".

So I don't see how it is necessary in this series. Whether it's 
necessary or not for [*], I don't have the answer but we can leave the 
discussion to that patch series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
