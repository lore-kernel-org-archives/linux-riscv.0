Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503D1EEA871
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 00:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fl9zAMcodrCRmiBgf/SAJLzxrVdw61A1x7Iay/ln+Bk=; b=HV8zhI3oQofrk+3pAlsC1xeAFH
	KrECECrvH5Ros5SdD+80lfw7GkI6oKUQULtOWHAfkl71z6DWVo6RiDJjhliDbbupbt2mcb4jHiINJ
	Cy/RGFdPcjySzXGcbIFBQTWN3ey7UXmwjtoaoFgk8tfWsMjeA6XDACfj8QnNOs0zk1JBtaDCu0yFC
	OwB5rAUp3PJJ0HrkWvU/rRtwD2+0OwXDnOy/obiVHkYazWLxBNQdmDYuGoORew104FVwA1tF5Wwhm
	WXRqDdIcri2pOo9Vr8kJtLhnlCq5t1MGbuvdJT40kJ1cRFxLy8G8RAKyvFR9/3SQW/2QRz6L9lAY2
	nqRvxokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgm8-00000002kgt-1QU6;
	Fri, 13 Feb 2026 00:11:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgm6-00000002kga-2SZD
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 00:11:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B422A44374;
	Fri, 13 Feb 2026 00:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7E0C4CEF7;
	Fri, 13 Feb 2026 00:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941467;
	bh=Bt+riuVcrxvV9lyOlhY+2RdFfnCKQOVQZkwCDQpe8EU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GU3KclXem5Ye6Jty+KY1bt6o3fSC0/sJNZKyLiND0idci37Xt0q0M1AGu8FLN/xb4
	 BVuEe55q1oO47Nzyoc7Ol6hz3bb4w7594hm+aPTkmL/sBX5hQPwDVuoMh0nrrwQTUa
	 jw54yLQxkRc5jH/7xaduKRD25qHt4+xOr0//W5+mJ8oeGGtxie8Bys6Z+9Fy8Man2B
	 Bz11oy0tPnMGACaaW5YJTqWnkdlW0OQCanCxe2mS4GIKCnjj/ab5U7u63zUqrpJopf
	 FLjWIr9HwSNbChAHpjPrb1qdKV90xuAyMdWX+UUKuspOcViV226ppH5fI8X791vJ9F
	 qrYvr6o/Ft5NA==
Date: Thu, 12 Feb 2026 17:11:04 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Sean Chang <seanwascoding@gmail.com>
cc: linux-riscv@lists.infradead.org, conor@kernel.org, palmer@dabbelt.com, 
    pjw@kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] riscv: fix various typos in comments and code
In-Reply-To: <20260212163325.60389-1-seanwascoding@gmail.com>
Message-ID: <7d0b996f-f6ab-cb7d-0803-493ca5abcb62@kernel.org>
References: <20260212163325.60389-1-seanwascoding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-478193425-1770941467=:1307628"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_161110_648669_EEA4EB9B 
X-CRM114-Status: UNSURE (   6.88  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-478193425-1770941467=:1307628
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 13 Feb 2026, Sean Chang wrote:

> Fix various typos in RISC-V architecture code and comments.
> The following changes are included:
> 
> - arch/riscv/errata/thead/errata.c: "futher" → "further"
> - arch/riscv/include/asm/atomic.h: "therefor" → "therefore", "arithmatic" → "arithmetic"
> - arch/riscv/include/asm/elf.h: "availiable" → "available", "coorespends" → "corresponds"
> - arch/riscv/include/asm/processor.h: "requries" → "is required"
> - arch/riscv/include/asm/thread_info.h: "returing" → "returning"
> - arch/riscv/kernel/acpi.c: "compliancy" → "compliance"
> - arch/riscv/kernel/ftrace.c: "therefor" → "therefore"
> - arch/riscv/kernel/head.S: "intruction" → "instruction"
> - arch/riscv/kernel/mcount-dyn.S: "localtion → "location"
> - arch/riscv/kernel/module-sections.c: "maxinum" → "maximum"
> - arch/riscv/kernel/probes/kprobes.c: "reenabled" → "re-enabled"
> - arch/riscv/kernel/probes/uprobes.c: "probbed" → "probed"
> - arch/riscv/kernel/soc.c: "extremly" → "extremely"
> - arch/riscv/kernel/suspend.c: "incosistent" → "inconsistent"
> - arch/riscv/kvm/tlb.c: "cahce" → "cache"
> - arch/riscv/kvm/vcpu_pmu.c: "indicies" → "indices"
> - arch/riscv/lib/csum.c: "implmentations" → "implementations"
> - arch/riscv/lib/memmove.S: "ammount" → "amount"
> - arch/riscv/mm/cacheflush.c: "visable" → "visible"
> - arch/riscv/mm/physaddr.c: "aginst" → "against"
> 
> Signed-off-by: Sean Chang <seanwascoding@gmail.com>

Thanks, queued for v7.0-rc.


- Paul
--8323329-478193425-1770941467=:1307628
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-478193425-1770941467=:1307628--

