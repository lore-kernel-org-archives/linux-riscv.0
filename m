Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09D5C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 01:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=De/3xE/ETMBPfCfESJu6VH4IYAIrGqzasZJ5W9O2YP4=; b=uGxkqXSj9zTGnf
	/xGjNFtGADVAivsvCoEnaiZ2DpzAkXZb8VFLfOt7XrHf1biNXkt+b6125tlhAaltD6EubS/5NOQMj
	OhFrhVkf2AH0I5VUPnzksLiqO6DDykBR3zfBnIlItexuVUKKKP+N3hn9h4SmApsIOe734s2Q4jTyy
	5tWbrG2XiKMPfODO/64nNmjrvvX1PJn3LupRwkrgGXWufhL9vOuO6xkyOLN5Furn6WDY6KyAOes9q
	VCaZw7Cf5zBMIdUcvDIQEDPpvJJT4y2sHDNJXIYxq5m/bzJRmbTZiIBn0X7xn58OCp67sK6RqBUb+
	kADZzd5Vn6NZoVgikb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0YTn-003ncH-DP; Thu, 01 Dec 2022 01:35:11 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0YTT-003nVw-QW; Thu, 01 Dec 2022 01:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669858491; x=1701394491;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YopNAk0o4R/Gm+eGMQdhkQKi75mYgT2RAg4YlRHu29c=;
  b=bpOijAC9/nN+0QvL8R9oSxAj3J0jCxQfrlRlqh2OPCAkRn/Bw/TpgyHp
   YyAxBuyMA6nvbKgsiNfuhfSReS2wFSAktO7kled0IayUPFiejOx4x//BO
   XXtfopSO5z581B0dQzbKaV91xtOp9qiBRcZyrPvGqmDAXiwiaG+zM0EjX
   12+A2jmHFc1lmoBqXClZ0fL2DQ2S/Lvb/rpvGmXmhoedHnqjXKkbtCtMM
   xLtOASCxIALXp0N5Q3nAyXRxC97SrEfL5dTw7BGKKHgJ2KArX1ygd5NNs
   y493+4wh7b1IP9V1nDtS4EcTamQhuGi0nM8L8tkvCRu1bSFIZi3gHTYtc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="313186492"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="313186492"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 17:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="707875700"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="707875700"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org) ([10.239.48.212])
  by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2022 17:34:38 -0800
Message-ID: <ceb3bb1e98a3933c3bf34641d731c69b67d761b4.camel@linux.intel.com>
Subject: Re: [PATCH 32/44] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
From: Robert Hoo <robert.hu@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 James Morse <james.morse@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>,  kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
 Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,  Thomas Gleixner
 <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
Date: Thu, 01 Dec 2022 09:34:37 +0800
In-Reply-To: <Y4fg+MO2DusqMSZO@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-33-seanjc@google.com>
	 <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
	 <Y20r2NR9MaBbOGLn@google.com> <Y4fg+MO2DusqMSZO@google.com>
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_173451_920739_B102C24B 
X-CRM114-Status: GOOD (  14.46  )
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

On Wed, 2022-11-30 at 23:02 +0000, Sean Christopherson wrote:
> On Thu, Nov 10, 2022, Sean Christopherson wrote:
> > On Thu, Nov 10, 2022, Robert Hoo wrote:
> > > After this patch set, still find some printk()s left in
> > > arch/x86/kvm/*,
> > > consider clean all of them up?
> > 
> > Hmm, yeah, I suppose at this point it makes sense to tack on a
> > patch to clean
> > them up.
> 
> Actually, I'm going to pass on this for now.  The series is already
> too big.  I'll
> add this to my todo list for the future.

That's all right, thanks for update.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
