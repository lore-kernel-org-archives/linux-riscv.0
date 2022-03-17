Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083E5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 09:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zITpVW9hR0VAN5I37KNPRN9YAPQRSLad57yP7fxf5Ug=; b=myaRo07CXa+QYZ
	6qI/I/0Xs/L0D3gt1/OjERRu1jU1m/b/4W/dmCXZB3bQyzKNAyUatP4ycUUlgivhin3g0fvvfON2j
	j4H0Ura7AEdX12oxkd5wbjIUC/qdNUrWwRs+qpxgyRxZpjSad+P1o3SqMVbV5vcVa1Qxhi2+ss86y
	QleQBJdLxtlGAM8aZDg7ewT9vTbqbh44OoYWgQGhzMlgtiX6wK1v6YxRpnLFLvW5zZL9lw0r7YjFY
	Q7fdCBwWLK5VfW0jRQ0G+RBQ/VZQNJVvCkgSIVp2D4e619YInJ7VXO1UXDvxDdM6uxHGE+EgljI0S
	W9m5bULLP4kyyPMADgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmEl-00FUnp-VY; Thu, 17 Mar 2022 09:16:04 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmEi-00FUmM-5y; Thu, 17 Mar 2022 09:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647508560; x=1679044560;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AgYkRzO8ksOYyWWAS/gpvfK0lt7Rzm9dkVzVmq0l0/w=;
 b=Bs0cFtW3GGgWk3eo569IEg6ZJCgONhPamSoOvx7LGexv3Y6gbwOOMkfQ
 LL7sY4w67U3K+daOc5hSbvEJn42iZSRP2jUPUwqjaYohfiNwXUCDeWnGO
 ctDhKqw1KzvllA1goaaurzEHs9ZIKOxUrw+fHl9cdFxh+2zcS2kN+txWm
 PZw7XbGb42JoHmGYheRD20nC1LCey9gJwnnrAgZC1WbXFjb9f2D+KIbh7
 DkIdEU4jOgSBrcyHYWEyoggDHb7Gb6G4QOEr2jAUC4WkIL+nmW+bNADzN
 Dc1FSJW4d8fGQriJsEmehq8GTgB5wdOCs822FpnOADSkntcJxNH3+uuea A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="317541104"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="317541104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 02:15:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="557852602"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.23])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 02:15:44 -0700
Date: Thu, 17 Mar 2022 17:15:41 +0800
From: Chao Gao <chao.gao@intel.com>
To: seanjc@google.com, maz@kernel.org, kvm@vger.kernel.org,
 pbonzini@redhat.com, kevin.tian@intel.com, tglx@linutronix.de
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Andrew Jones <drjones@redhat.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Hector Martin <marcan@marcan.st>, Heiko Carstens <hca@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 James Morse <james.morse@arm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Jia He <justin.he@arm.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 John Garry <john.garry@huawei.com>, Juergen Gross <jgross@suse.com>,
 kvmarm@lists.cs.columbia.edu, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Qi Liu <liuqi115@huawei.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Richter <tmricht@linux.ibm.com>,
 Tom Zanussi <tom.zanussi@linux.intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Will Deacon <will@kernel.org>,
 x86@kernel.org
Subject: Re: [PATCH v4 0/6] Improve KVM's interaction with CPU hotplug
Message-ID: <20220317091539.GA7257@gao-cwp>
References: <20220216031528.92558-1-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216031528.92558-1-chao.gao@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_021600_324333_0D6DBD02 
X-CRM114-Status: UNSURE (   4.08  )
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

Ping. Anyone can help to review this series (particularly patch 3-5)?

FYI, Sean gave his Reviewed-by to patch 1,2,5 and 6.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
