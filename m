Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DA4C54E49
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 00:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+niDqTrk8Q43AqmpqGuVFqNWUQA59MccIv+ROAdIkTA=; b=OyX0K/QyT0lBY+
	Dxvx5kqXm0xjj9uJtYjD58YNV0660ZB5ktpWY+i/EA52EOHz9KeXuXZB+OmI7WwZHu04rdK49p/sA
	rz4HU3c2k/VaF+JavQFmG+nm3cBb7pBh1WHOS0X2OfBMfacS8AK3l8zJLSaXbWPJNn1Qi6SYI/7uF
	+17FB1lpqgTmflK9cojVqqkaNnCk+SLaq5U+xGs8ia9Zs4logCC1Y/iCm/MqAE81Hy+4OJslt0PH8
	uwPh4av1Cg34PuIKVpj0YN5QA146wPGYSkvb0wGq3MPtyzsnxFHY7GG0fDmBGxrMcG2GSz2Uj3wXE
	4sXcEtBcEzUK46wpclGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf7bE-00000007Mu6-2IAd;
	Wed, 28 Feb 2024 00:15:04 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf7bA-00000007Mss-2G0c;
	Wed, 28 Feb 2024 00:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709079300; x=1740615300;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rx8auOqwAhy8kMX7uwjsnwlR7SlEVNwlATa6UTNue6E=;
  b=RHqXMEJkSDZGDuCdDjmNNEIq67+6uRPyPEQTgVfW5yG4sAiUQ3iZ7bYa
   RRkTZ9DuscCV0U722rNMDhhST2491i8WXSrfqfeiy4sahnKkjlpjDVxrL
   R7Xv2c4vjrtverFvXlNGT07QG5SdCyuQSs7f5gsSTqy6VBILSgZkx8mgg
   PAnA2uIbMPSlPO49849KWTIaFWTLWRRFb6AfjFL4WhV5BI+qvZ7mDo+sB
   NJayldyVKGUNWcy/fPYIAOnePRX5z36dXoADkgi9YodAZ6F1EvlZS1Rm7
   vGvsxgF6jIMFQ514xXRLKcnr2P9GzjBuLOV6I8QFNTLqbpVp/c6P4oNUN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3617019"
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; 
   d="scan'208";a="3617019"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 16:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,189,1705392000"; 
   d="scan'208";a="11890341"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.125.243.127]) ([10.125.243.127])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 16:14:49 -0800
Message-ID: <75d37243-e2a3-421a-b74f-ccbe307fef96@intel.com>
Date: Wed, 28 Feb 2024 08:14:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/11] KVM: selftests: Allow tagging protected memory
 in guest page tables
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>, Andrew Jones
 <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>,
 Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>,
 Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
References: <20240223004258.3104051-1-seanjc@google.com>
 <20240223004258.3104051-8-seanjc@google.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20240223004258.3104051-8-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_161500_638683_BA25553E 
X-CRM114-Status: UNSURE (   8.72  )
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

On 2/23/2024 8:42 AM, Sean Christopherson wrote:
...
> diff --git a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> new file mode 100644
> index 000000000000..218f5cdf0d86
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> +#define _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H

Since the file name is changed from kvm_host.h (in v7) to 
kvm_util_arch.h, we need to update it as well.

Ditto for other archs

> +struct kvm_vm_arch {};
> +
> +#endif  // _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
