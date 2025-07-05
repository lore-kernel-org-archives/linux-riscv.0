Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3D4C8303D
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEjn0Hluc8r+nQfK+jLVEYxdj8Ul6UhCCQJLTdlV4H8=; b=jrTy2NeVPSuWgk
	Wpi4gl9Mkwumv9N5yGzdiJTHrWXID+yxfS+pLDUOPNaCTXBohkZq6rnyENXdupJPSh+u0v17FHlrK
	d/tUo5u3rVSq4y3L52c47SlJ9FniQ94uLGhwHuqVh1zIRHhLuR3u3J8A4xAWjEN0LqoB7/iZL+GGz
	IqGncggBbgPfFiOz64egDHwC/dbs9OeYEw2W9ZT0Qd3SQel3aOednWw7nucZ9w+exO494ctMlf0Yn
	5pjiVJ5ZWb3NHqg4RcvSEZC6UN/zC7H8hb6d4VwE2R21ADyJ5Zd5vV3LR5GVmA87ma+ebGvRDbeiN
	456jzpre9i8j9R9L3RHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxiA-0000000GFbp-2A2Q;
	Sat, 05 Jul 2025 07:53:26 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxYo-0000000GEuV-0JRO
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 07:43:47 +0000
Message-ID: <031be49c-b079-40c3-af92-7ab3abeec6b3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751701424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cOvaEMZDlYCZuGP3rV6CtMosiqfse3Z99B9fDQMSYw=;
	b=FbNTWIVgOlZtetO3M0PMTBYjNEGkFB6gofMu0uuxu6L278lqSckZEj5A5BLsbZQmMt9GSy
	5xXYY4i67hFkR0gDmGta1AFupbhMqb6ObtZD6RAlwW/dBxCJ9FmIj3zYA4/rGw0hg4c65P
	R+Kats95irR9U7JcEne0wYdhlMeA/EQ=
Date: Sat, 5 Jul 2025 00:43:36 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Few timer and AIA fixes for KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250704153838.6575-1-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250704153838.6575-1-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_004346_257106_904E91DC 
X-CRM114-Status: GOOD (  12.70  )
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


On 7/4/25 8:38 AM, Anup Patel wrote:
> The RISC-V Privileged specificaiton says the following: "WFI is also
> required to resume execution for locally enabled interrupts pending
> at any privilege level, regardless of the global interrupt enable at
> each privilege level."
>
> Based on the above, if there is pending VS-timer interrupt when the
> host (aka HS-mode) executes WFI then such a WFI will simply become NOP
> and not do anything. This result in QEMU RISC-V consuming a lot of CPU
> time on the x86 machine where it is running. The PATCH1 solves this
> issue by adding appropriate cleanup in KVM RISC-V timer virtualization.
>
> As a result PATCH1, race conditions in updating HGEI[E|P] CSRs when a
> VCPU is moved from one host CPU to another are being observed on QEMU
> so the PATCH2 tries to minimize the chances of these race conditions.
>
> Anup Patel (2):
>    RISC-V: KVM: Disable vstimecmp before exiting to user-space
>    RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization
>
>   arch/riscv/include/asm/kvm_aia.h |  4 ++-
>   arch/riscv/kvm/aia.c             | 51 +++++---------------------------
>   arch/riscv/kvm/aia_imsic.c       | 45 ++++++++++++++++++++++++++++
>   arch/riscv/kvm/vcpu.c            |  2 --
>   arch/riscv/kvm/vcpu_timer.c      | 16 ++++++++++
>   5 files changed, 71 insertions(+), 47 deletions(-)
>
For the entire series :

Tested-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
