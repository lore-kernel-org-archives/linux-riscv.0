Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F80CF2560
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 23:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jBd1z9cFJW9Zz+UI9yID6ElgprUdGVkIbZ+b0SK5gOk=; b=ogyXAZpD3zzcP+TaFn5xwFF7f4
	GIUYLbFGVM2Zh4ttuL2uEQvyTN6Isa0pmIpEmFrou9uwaYdjApGUp/IS2NFnZDe9/AEYT8e4usQ7i
	NZGo6/RDuCYr/d6cNZebFdXUpqB0YUMfnHpsI1FH1svMrsEfj4MmF3TDMUSKxdGGqOmx47zCwBrHC
	v8SrPPhm3kVt3VHVTqN5yA/GuwAoZC/aQMngxwY+dueTZrh3gncaeHl3wfT+/bBY0XNuY0Tcox5hQ
	Ec9pGVLWt0NKc5qfKd6NatLN8FiAyJeTSf4J5j0fSvvMaJwerp77eOzFlBfd2OBWx93uW1PAyEkaH
	jiGihgLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVAW-00000001Eme-2JhP;
	Tue, 18 Nov 2025 23:31:28 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVAT-00000001ElU-3bxJ
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 23:31:26 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso7299215a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763508684; x=1764113484; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhbmIaudy7FUgPhz41c9iiSjQeSWp1bqqQI5ni0zcdI=;
        b=26jaJNME71p+fMBJa5pXtu02zAEUnsF18KIhxny+Ac9XjlH4W8+10a+z21UFilUNgP
         O0kt1hdhE0hdABbbR1BBKZmoBXbfnJddvOZ4HuXLWJgbStOAlPoXlWDkiR2uxfJhLN5a
         0ny8Qmevs3rMPan+jTe1QrjeN3vOUqZJzpBLRYmsFAp2TxHrcqHQKNbmQgRM1LxHDiJ9
         8cfLm9ISzpGeIandsVeuce6S0zAvGW/cFLOr5sfmpmdDHISeTJti1EpxhGwcoIXDLVra
         mzTj29Q5g2+JBEblYSlIikV+HFfb2ma8KKDv/g9PDopOeibvdCRkVL8NCye8hKJCdqj8
         SjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763508684; x=1764113484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhbmIaudy7FUgPhz41c9iiSjQeSWp1bqqQI5ni0zcdI=;
        b=O2SiD8mOGShyuwJuDSa/geJPNf0ALtwrVkXYaTwqMsaPQgpt3X0/n3hNgAC25blDPa
         u/cRbb3Yj7QMBkK30rVv8T/MMjLwX8BkOT85iAe6s88HQIonN5GEnMJ7VPmjzbEkLuUk
         9bu1kr+kifdR/uO3Xt4ZkEts6ArT+CWuAWphPO0S6ci/9/I34LtpQBpuI7wvVX0kA5Gm
         ztazkn7mfCPUvxjp5pqdGnInVhqN6EmeDwTe0JQkMdtfomnwZ1C8gIXHDBtYQH3BMlii
         KpoPCV0vNvVeXMii5iFHCp2DWB0rPHD/OSnbi4mlAIh91Cbgdu66sJUXAERYok64Ids9
         /Ksw==
X-Forwarded-Encrypted: i=1; AJvYcCVYyuvIwqaXcSdZZ5Qh/rXc795MQfVIkog5RJWhL+lUfR3TzayJdr59VaWyiDlPbZVCRdPsMBhrRml+bw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXf7xQjDYD8/K9oqddDNleRjQYACMieyD+zbSlC+gJadvOqkKS
	bjuTcwcc7jhlt6xQpeqD+zbh0PHm+SSD0IYk8Lzt2GHRAEyzYTnkan6UuL3T9CboIH6IgRRtvgl
	PaoW7jw==
X-Google-Smtp-Source: AGHT+IE1o3OuDgEYh+WwImWCZtj32ss/bDTcBxOCjrPrz1sqG0DLMNd/QRhOEpFCg6/bq23FewNy3cS6Bik=
X-Received: from pjbpd18.prod.google.com ([2002:a17:90b:1dd2:b0:340:e8f7:1b44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5484:b0:341:124f:474f
 with SMTP id 98e67ed59e1d1-343fa6390cfmr19214010a91.32.1763508684387; Tue, 18
 Nov 2025 15:31:24 -0800 (PST)
Date: Tue, 18 Nov 2025 15:31:22 -0800
In-Reply-To: <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Mime-Version: 1.0
References: <aP-1qlTkmFUgTld-@google.com> <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Message-ID: <aR0Byu3bd3URxzhu@google.com>
Subject: Re: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
From: Sean Christopherson <seanjc@google.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: ackerleytng@google.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	binbin.wu@linux.intel.com, borntraeger@linux.ibm.com, chenhuacai@kernel.org, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, ira.weiny@intel.com, 
	kai.huang@intel.com, kas@kernel.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, maddy@linux.ibm.com, maobibo@loongson.cn, 
	maz@kernel.org, michael.roth@amd.com, oliver.upton@linux.dev, 
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org, 
	vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com, 
	zhaotianrui@loongson.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_153125_898165_E9FBAC80 
X-CRM114-Status: GOOD (  21.07  )
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

On Mon, Oct 27, 2025, Rick Edgecombe wrote:
> Take MMU lock around tdh_vp_init() in KVM_TDX_INIT_VCPU to prevent
> meeting contention during retries in some no-fail MMU paths.
> 
> The TDX module takes various try-locks internally, which can cause
> SEAMCALLs to return an error code when contention is met. Dealing with
> an error in some of the MMU paths that make SEAMCALLs is not straight
> forward, so KVM takes steps to ensure that these will meet no contention
> during a single BUSY error retry. The whole scheme relies on KVM to take
> appropriate steps to avoid making any SEAMCALLs that could contend while
> the retry is happening.
> 
> Unfortunately, there is a case where contention could be met if userspace
> does something unusual. Specifically, hole punching a gmem fd while
> initializing the TD vCPU. The impact would be triggering a KVM_BUG_ON().
> 
> The resource being contended is called the "TDR resource" in TDX docs 
> parlance. The tdh_vp_init() can take this resource as exclusive if the 
> 'version' passed is 1, which happens to be version the kernel passes. The 
> various MMU operations (tdh_mem_range_block(), tdh_mem_track() and 
> tdh_mem_page_remove()) take it as shared.
> 
> There isn't a KVM lock that maps conceptually and in a lock order friendly 
> way to the TDR lock. So to minimize infrastructure, just take MMU lock 
> around tdh_vp_init(). This makes the operations we care about mutually 
> exclusive. Since the other operations are under a write mmu_lock, the code 
> could just take the lock for read, however this is weirdly inverted from 
> the actual underlying resource being contended. Since this is covering an 
> edge case that shouldn't be hit in normal usage, be a little less weird 
> and take the mmu_lock for write around the call.
> 
> Fixes: 02ab57707bdb ("KVM: TDX: Implement hooks to propagate changes of TDP MMU mirror page table")
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> Hi,
> 
> It was indeed awkward, as Sean must have sniffed. But seems ok enough to
> close the issue.
> 
> Yan, can you give it a look?
> 
> Posted here, but applies on top of this series.

In the future, please don't post in-reply-to, as it mucks up my b4 workflow.

Applied to kvm-x86 tdx, with a more verbose comment as suggested by Binbin.

[1/1] KVM: TDX: Take MMU lock around tdh_vp_init()
      https://github.com/kvm-x86/linux/commit/9a89894f30d5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
