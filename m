Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908EDCA5FFC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 15:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PueWRpY4tb5brLBTY5Wcc71h8FqVvMvmkNM09R8c/sQ=; b=KWneDC92/g1Agt
	UvRjTUZRLdo0ro0MCs/XuEbImj80gj+sbsUwOqQmlNRwjgHIFcHFzxM6cf6bceBn86t2Qs6oZRKOo
	urFYMhK04DIF6eX0d8GYDv2bF8beOMDtsAWw+Wq9RULOClAIlQ4SCmMixKwSXWY4OfKdZIH031yS+
	vN4Gr5JyCuqWV3+UVDC/KuGj3W973lN8NDUZsAYvNQ6ZNi3nqIcd8O4AARXg73MRtysIYw1MtpfX2
	3+IejiIjbUSt6Tx9jrm3B+wBfdl5RZR5u4tpd9yAP5DFVnlDEeA4BbJNgWHafV1poNc0ZkO65cq63
	K/a1BMiD+e3+v6TpZ2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETjZ-00000002ije-3FD7;
	Wed, 07 Oct 2026 15:39:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETjY-00000002ijR-1Owa
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 15:39:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82DED60202;
	Wed,  7 Oct 2026 15:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625CF1F000FF;
	Wed,  7 Oct 2026 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791387547;
	bh=p346DBewhLxeZdx36JJxUf8JaJdqjbbB8zICG+z4Gag=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=S171WsZruMhmWqVUT1wEsBGoQpcCiOreN97b5RnO44HrFGwuJt4tgcLEPCjvdWpyF
	 P6w29UIbMaRvnLv71WcHBrQizbGaspuHyDyvGO0a6ysTKA1lU4SnaV5GdcA9u7lTyK
	 c1VqW/jSGg5ZU7mUwMRs+dnJjTKlKZUzHs64+3/OLGDgkFB/RQSFozUX9nK+lAIe17
	 +CRoj7/bGyw3DLnyiNx9xVKGOq2wGBrRiDlo6YPNSxz9KLqT7ekvQl1szSkeosregV
	 6+ULo0OUxxvSbokkGjG2ww/ooA1gvFgAsfn06tUbThUEQIoAXyBeXH4/EzF5KLVogp
	 PYylQg+sbjZFA==
Date: Wed, 7 Oct 2026 09:39:03 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
cc: pjw@kernel.org, oleg@redhat.com, debug@rivosinc.com, alex@ghiti.fr, 
    guoren@kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ptrace: reject CFI regset access when extensions
 are absent
In-Reply-To: <20260820063233.2567-1-cp0613@linux.alibaba.com>
Message-ID: <8a340efc-d50f-40b1-698e-65bde2cc0660@kernel.org>
References: <20260820063233.2567-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
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

On Thu, 20 Aug 2026, Chen Pei wrote:

> riscv_cfi_get() and riscv_cfi_set() do not check whether the Zicfilp
> or Zicfiss extensions are present. On systems without them,
> PTRACE_GETREGSET on REGSET_CFI still succeeds and returns a zeroed
> user_cfi_state, misleading debuggers into believing the register set
> is available, and PTRACE_SETREGSET silently accepts writes that have
> no effect (e.g. clearing SR_ELP).
> 
> Reject the access with -EINVAL when neither branch landing pads nor
> shadow stack is available to userspace, using the same availability
> helpers as the prctl path.
> 
> Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
