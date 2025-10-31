Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2356CCCFA00
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMlHlu+FsqOia2f6D8KoapazM+OvKidIU8Ci1ZTd+u8=; b=DS1M0ncIgK1M2N
	xpkn35TmP67VuKGdySWwDC/5vhkFe4cr77j+2m/KACQXIiYewWj2mccOUrocGNhOVv66IkklOp9pd
	E1DYmNMyKOw8WNhjzrZWlaR7kEUxw7X4ZZt6ZlR5e2oBJiRKVT2gTnRv5/+F+s+y2My1V/mS6RAqe
	M8+X67fkbV02//t20EAKFskti8NSgJCoVYAEU+xyyhLnGyehL0FQTj8qRR8FMCwhZenr98927WWy9
	Mo1w05J+Uh5JeGPSXPN2VVHRX3RSrOL/+I8oKEJ/yrVPfhxTx/inhTOEfO+pqUQskUwoRBa/TtBZk
	huIsARdmljx/lA/aGHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkyZ-00000005jOr-2296;
	Fri, 31 Oct 2025 08:59:15 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkyV-00000005jNH-1sHM;
	Fri, 31 Oct 2025 08:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761901151; x=1793437151;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=14teRbdSNDZoo6LY1BdIEFiTD+Kt/E9bpeaMX41fhsM=;
  b=ZaJZCK5NvAhuyMYg6HJmSMLjm1NwHD/SXEx32GGuB6YLCCY3iTCkV7rR
   522S2gQp49wj8A6Q5v6hN1xwQZwZjyFlSj+FnJc3E1lu1m66LiP03SfWU
   HIufguom79ZKqv/4m7/Zt9X/QTSBMGmZWFdhed0Xid4Bj252T5qLAOCmv
   vC8F0lOeUaAaLP6b8qwywpSbg4s/ViE83Kv9sFVKFmAb4RPsi2B5+BemM
   KWFAZJIDyNVDZc4vzuxVcl+rQKUNtH0v81CzrTSHGBS+5QhV5F8IZpgSg
   Cdpdndq7sHsi/KhOiMgMeKugfYDMLHVP1l7ClRgbusZQiozP+NRmBLZ12
   A==;
X-CSE-ConnectionGUID: fUixyae/RYS8DX9U1J49bQ==
X-CSE-MsgGUID: DA37wERATc6B/St4H3Dy6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81685946"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="81685946"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:59:11 -0700
X-CSE-ConnectionGUID: Qkn6DZO5Rceyyp8KD2OnrQ==
X-CSE-MsgGUID: hAjIabqjQHemJifWFRIz7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186119255"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:59:02 -0700
Message-ID: <5eaab97d-30c3-46a5-8be2-2ea1ef28e71e@linux.intel.com>
Date: Fri, 31 Oct 2025 16:58:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/28] KVM: TDX: Combine KVM_BUG_ON + pr_tdx_error()
 into TDX_BUG_ON()
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-19-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-19-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_015911_734247_9721CB54 
X-CRM114-Status: UNSURE (   6.24  )
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



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> Add TDX_BUG_ON() macros (with varying numbers of arguments) to deduplicate
> the myriad flows that do KVM_BUG_ON()/WARN_ON_ONCE() followed by a call to
> pr_tdx_error().  In addition to reducing boilerplate copy+paste code, this
> also helps ensure that KVM provides consistent handling of SEAMCALL errors.
>
> Opportunistically convert a handful of bare WARN_ON_ONCE() paths to the
> equivalent of KVM_BUG_ON(), i.e. have them terminate the VM.  If a SEAMCALL
> error is fatal enough to WARN on, it's fatal enough to terminate the TD.
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
