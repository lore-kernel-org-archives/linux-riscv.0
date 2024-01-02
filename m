Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D8FC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 18:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+/Ht4K+E3JJgFEV6ovWKhUa3bG0ssO0idpFNJc6mkE=; b=HPQ2yrxVBI81L2
	zJK2NnKT/3x6rcWi+puMA6SbfaoEKzO7zIoXMAt2WpQrxb1g1oPJAXbeBENYpm83TSoAwMwbfVlqM
	a1fE51TzFqJNYuDgbzLYFXyZrPN/sRnGdER7cMVn/qHS82yS67Cz4p1VGEGB4o+7JclySS8mWoWez
	jU48Leu9ihucXE/PuNYn5ZbO3DjtLKt5xZk5EHXAmDh9WqCJhI++CgzkcjnSJ9enoDfO1FICOA3Pi
	Aw6mopKG+a/lnL5+hkPuc3R/dr9GDj62xIxgVszs01AJ3kqgTYZTVcYORvOOoQ/vOP4nZlD9Vu3sj
	9gIcV94EqJLwO0mw+51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKjAi-008fZm-0p;
	Tue, 02 Jan 2024 18:07:24 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rKjAg-008fZO-12;
	Tue, 02 Jan 2024 18:07:22 +0000
Message-ID: <44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org>
Date: Tue, 2 Jan 2024 10:07:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jan 2 (riscv & KVM problem)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
References: <20240102165725.6d18cc50@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240102165725.6d18cc50@canb.auug.org.au>
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



On 1/1/24 21:57, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20231222:
> 

It is possible for a riscv randconfig to create a .config file with
CONFIG_KVM enabled but CONFIG_HAVE_KVM is not set.
Is that expected?

CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_KVM_MMIO=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
CONFIG_KVM_GENERIC_MMU_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m

Should arch/riscv/kvm/Kconfig: "config KVM" select HAVE_KVM
along with the other selects there or should that "config KVM"
depend on HAVE_KVM?


The problem .config file causes build errors because EVENTFD
is not set:

../arch/riscv/kvm/../../../virt/kvm/eventfd.c: In function 'kvm_irqfd_assign':
../arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
  335 |         eventfd = eventfd_ctx_fileget(f.file);
      |                   ^~~~~~~~~~~~~~~~~~~
      |                   eventfd_ctx_fdget
../arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  335 |         eventfd = eventfd_ctx_fileget(f.file);
      |                 ^


-- 
#Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
