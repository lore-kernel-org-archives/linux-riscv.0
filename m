Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0E4C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsZgI+JWiGpiYeLYBs6I/Byg9P6euR+40VQDoLxiWvg=; b=n4Tr+pJkLPhMoY
	fQJErBJ+XFSUd+ouPiuPq0hRLTCKF3a8iOFQgq9XxwPv5BhtT4ILGOm3P0js0uPmwIec4TzeQGvZx
	aCBSp2r3QchRv9H3IquvygUS12ER9xvZx3OZPMZ65b0CMaK3fxbkjdPk18+9Ms80MBz8qAr8/Lp5K
	meZ/GSXHHPBC2b7rgstEOu2Nn/HyQAZZJyQE0ENcWrCXc2vkSZp9sXx+tPmHtI+VJe1oRKSuYmRhw
	hSKP9KM14G7qr46wRIXSmBs5C40Ur5+Jj4hbQobMiI8II7ArlC0SFOnO8Q5jWgkC1f5L1pkM7oSVN
	fq8OpTtuwo5ZHIceJZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDDF-007kSr-0H;
	Wed, 01 Nov 2023 15:32:57 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDD9-007kR3-0L;
	Wed, 01 Nov 2023 15:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698852771; x=1730388771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2nyEdm6cgXtLmEHT90SMnCtukFAW1r//JISNY6vr7Ro=;
  b=AB9aOGNTwfNXdz20a3zzlsLekdSDIio6U/oXgq25y/QXmDUXGdQUMqaK
   MU7AJgQ6Ehr5nAVbWPMe+lehGpksIFCwuu6roaWpl8czJbGafujotj5Lz
   pglwH10ATYPYeqV20Z2DctnIBQo5ePtoduMJh13oGusSUUmS19Mxsp1ig
   ND9piVUPcpq21BbyhpAD+HxaQcaNEQxLd02pvj/B2D0ObCJ7yiXBwDOz9
   8pAEHhakgFDzrwMOspoVLx8GTnUuaAIDhTZ1I+OTu1OrbT72ivsizvusf
   SsUqoZqb8OU5bXv6nEzZ1cRyCS3FL+kDlbYqT94Nic24ubWCiimlqy1ZX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="474758872"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="474758872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 08:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="2207680"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2023 08:32:35 -0700
Date: Wed, 1 Nov 2023 23:31:10 +0800
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
Subject: Re: [PATCH v13 03/35] KVM: Use gfn instead of hva for
 mmu_notifier_retry
Message-ID: <ZUJvPi9TRsHZzVag@yilunxu-OptiPlex-7050>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-4-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-4-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_083251_175375_2A08CC8C 
X-CRM114-Status: UNSURE (   7.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 27, 2023 at 11:21:45AM -0700, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> Currently in mmu_notifier invalidate path, hva range is recorded and
> then checked against by mmu_notifier_retry_hva() in the page fault
                          ^

should be mmu_invalidate_retry_hva().

Besides this, Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
