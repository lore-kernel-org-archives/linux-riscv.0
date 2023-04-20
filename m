Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BEEC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 22:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YIAVj6FTfOQyybejgq2O2KoiYLRXrjIaVDuPBENlS3k=; b=d7hnCtsbCA2PSj
	mwp6s4RSlXaiRxGbID5WMPXjXB6GLCmPipdmNPEHsiH8YNVpzNGbm3W/Shh+eG/XZJi2GSqx4loMi
	Wm/+1vCjoOT/wHioHXAyuw5LrVDz2p70XarTsEIjMYGT38sW7HqOsAi9u7PW1y7SO2b3gs4swz6Vk
	V9aKRb5nwIAggW4Z18EfxnOvrJUcBFd4cJ7UQawVImk603EKSWTR//bqFFYlxUwKegbbTzeWcn/2f
	pfiapdWXpRZmT8A0hdzV0k+Ce+XrlREEupQecvQxZ4dFjo278XR39QsKlTKYNUVN3uGf+JxNyognZ
	oX4MOQg0gk67ILIMMY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppcZT-0096pi-0r;
	Thu, 20 Apr 2023 22:16:07 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppcZQ-0096of-0f;
	Thu, 20 Apr 2023 22:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682028964; x=1713564964;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IS7ZXuBIDcdEHWCz73K8Pgp/gskIbDBObXQBP3E1Hs8=;
  b=f8AY56r5YGiUvOhbRpBQ/DpsUX2E1hV491m2cwcy/Nkdg+KIAnm1XYXZ
   4nzw0Ib2VFpPuQPzsAu7p+927W7w3+58p9wPDeKJ/RcpH6kNa/fK6xIgx
   Tx4RZsrGZwAsa3FyoQK4jsAXEUMAov+yDGhJtMkT5kMoRJ90G3XzEbRyn
   1wgo2t17z6Db/jAv8HsDZJC2buoYEFRsArtA9Lna2rfIqomHcegDpwLX0
   aDUbBHMkgmUA/hBKmhov22Hu0lxc+0tYkox2DjeVXI+qJ9c3TXylIPXPa
   MovW0Cc5RVSIAWUUT1VBLCz8snXYKhhDCOOzH6wZF+ErwHmIMoM5AO60Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="373781275"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="373781275"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 15:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756693577"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="756693577"
Received: from ashleyst-mobl1.amr.corp.intel.com (HELO [10.209.71.65]) ([10.209.71.65])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 15:15:58 -0700
Message-ID: <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com>
Date: Thu, 20 Apr 2023 15:15:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap
 hooks
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>,
 Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev,
 Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com,
 Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren
 <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Uladzislau Rezki <urezki@gmail.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
 <20230419221716.3603068-46-atishp@rivosinc.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230419221716.3603068-46-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_151604_256318_2721DBFE 
X-CRM114-Status: GOOD (  11.08  )
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

On 4/19/23 15:17, Atish Patra wrote:
> The guests running in CoVE must notify the host about its mmio regions
> so that host can enable mmio emulation.

This one doesn't make a lot of sense to me.

The guest and host must agree about the guest's physical layout up
front.  In general, the host gets to dictate that layout.  It tells the
guest, up front, what is present in the guest physical address space.

This callback appears to say to the host:

	Hey, I (the guest) am treating this guest physical area as MMIO.

But the host and guest have to agree _somewhere_ what the MMIO is used
for, not just that it is being used as MMIO.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
