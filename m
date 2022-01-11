Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD7DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 03:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdSGm63H8NgCGgEvCpwZgvkAo/lp9DXyxcRzH4PsqLI=; b=dFr6+W1Q5W8Lyb
	s1040+RP+Gas8h6aVhV4wRKjeW79ezuesc4zugNpZKoJEp8ryaPdIuWh+BZ3MKmaoyJinDxBJD3gt
	bTknHPphacQhN+EeC6JJFkzOWG/n2A9h2nITjIzIUvnJmWdWvIORsyvkZSCubPYTl0Gdtx+GYTkl2
	rZbAUsBi/hlMQZ9RODWAo6YpHIpXjNZs+tHcTjTeo2ixj7YcbDkhqVwEgvpQooKPK5jUdoI7u0aZm
	E10TZSiEaLe5bSEoKccpil/xJsD7ly22Cu3IDj5QvYzryl94M05odeEgRxL3FB9KMGzgESw57t6gB
	I5LgVbLzH02FeutcA0lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n77Wp-00EPBZ-GY; Tue, 11 Jan 2022 03:08:55 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n77Wn-00EPA9-Na; Tue, 11 Jan 2022 03:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641870533; x=1673406533;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RMI1RbSj7Nf4sUd+ZkqJlzpz1NnGp0vcp4SZw2pUIQ4=;
 b=NM/k1HB5Oy1rib0Q02sJLahk/FcOfjglC7YTGeL+PclBMumu0OqzdTlb
 bY5L3yWQJSXR2aCYanivheTsnaP8wjvsMd7DUSTw5y5A2sI27M5MVVmrT
 IbSQniFrsZ1V/ejPnQWoGHll5ak60ZvqrbXjdVrb+5YurIIF0kE6zER6D
 9aiU6CPkjptCY+4anUd1kSlrnA85ReqXkt5goBfPgibLgKKp4t3gmSCaa
 WgZudJyvXZ8A/dflcBzEL4V8MeWf45VHDpKmKIAA7R2ZYDtsA+U8iIojQ
 B3s4O7yPNrWJS/r5LX3QYCYrKVTzs7ssltUp1CoWeZG4nhtVWg2vTmT95 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243186997"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="243186997"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 19:08:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; d="scan'208";a="622907157"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.105])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 19:08:40 -0800
Date: Tue, 11 Jan 2022 11:19:34 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, kevin.tian@intel.com,
 tglx@linutronix.de, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 3/6] KVM: Remove opaque from
 kvm_arch_check_processor_compat
Message-ID: <20220111031933.GB2175@gao-cwp>
References: <20211227081515.2088920-1-chao.gao@intel.com>
 <20211227081515.2088920-4-chao.gao@intel.com>
 <Ydy8BCfE0jhJd5uE@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ydy8BCfE0jhJd5uE@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_190853_870349_4C5A4C97 
X-CRM114-Status: UNSURE (   8.63  )
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

On Mon, Jan 10, 2022 at 11:06:44PM +0000, Sean Christopherson wrote:
>On Mon, Dec 27, 2021, Chao Gao wrote:
>> No arch implementation uses this opaque now.
>
>Except for the RISC-V part, this can be a pure revert of commit b99040853738 ("KVM:
>Pass kvm_init()'s opaque param to additional arch funcs").  I think it makes sense
>to process it as a revert, with a short blurb in the changelog to note that RISC-V
>is manually modified as RISC-V support came along in the interim.

commit b99040853738 adds opaque param to kvm_arch_hardware_setup(), which isn't
reverted in this patch. I.e., this patch is a partial revert of b99040853738
plus manual changes to RISC-V. Given that, "process it as a revert" means
clearly say in changelog that this commit contains a partial revert of commit
b99040853738 ("KVM: Pass kvm_init()'s opaque param to additional arch funcs").

Right?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
