Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38512C47DDF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 02:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bcGb9SDPt1Se/fC9WITMzNhwwZTh4bckjJhsE9kDsw=; b=v+FYci2mJDA6qN
	VSjrnnSy7iIeyfH745ZU9I9WUnyjHZ4gI9imx+1Rkm03MPRgoncEMwsXBJvsz7kJ0J+D+Q2A2ng2G
	FTAFXxtLw5uMXyVJCQTn0mq+Sd9Wf+k3BfkKuA9vY0dAdXOHlPup8c0PpqR/P5fZo7ladSsSZIshf
	LmxX5Fc9rIzAWK0j3qzz9CXvk7rMvP+scTC/LnwsHAU09ixPC6vUDS5ybFlGB2EGSc9C4XxPaZKxV
	b12DRDYyh+F3qSup3/lF0R+rabcGrpYumV6vxmjYtarEDoo44Qy5lS34eex5qVFuPG/Ybl2ZuAcE3
	VznmRBrESd8cT/MMzUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBaD-00000002p0C-3yXW;
	Fri, 26 Jan 2024 02:04:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTBa7-00000002oyo-3lRx;
	Fri, 26 Jan 2024 02:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CAA1BCE354C;
	Fri, 26 Jan 2024 02:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74479C433C7;
	Fri, 26 Jan 2024 02:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1706234672;
	bh=HWEos3+udILzj8RZ/TTxlduuwOKMV4VQFbTq8RZGoPM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tuc+1XPr+hUVWa4GOyLQhEugYXMMsybYvWuE0/xs82eeqs83luvv7hWozsTjDEJU2
	 xqH+oihlu/t9Hy0Adp3wCLYFeU2IG8f5LdvEXo7yJ7AqNEu5svDOvx1sFx40QZHZup
	 Q5dVW0OiqBacQI7MjfRyUJZIaPhBJ+rifm367ymU=
Date: Thu, 25 Jan 2024 18:04:24 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: willy@infradead.org, will@kernel.org, catalin.marinas@arm.com,
 palmer@dabbelt.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
 agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King
 <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH 1/1] arch/arm/mm: fix major fault accounting when
 retrying under per-VMA lock
Message-Id: <20240125180424.121455beae4d56799a0bac28@linux-foundation.org>
In-Reply-To: <20240123064305.2829244-1-surenb@google.com>
References: <20240123064305.2829244-1-surenb@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_180436_122462_6F87CAC9 
X-CRM114-Status: UNSURE (   8.73  )
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

On Mon, 22 Jan 2024 22:43:05 -0800 Suren Baghdasaryan <surenb@google.com> wrote:

> The change [1] missed ARM architecture when fixing major fault accounting
> for page fault retry under per-VMA lock. Add missing code to fix ARM
> architecture fault accounting.
> 
> [1] 46e714c729c8 ("arch/mm/fault: fix major fault accounting when retrying under per-VMA lock")
> 
> Fixes: 12214eba1992 ("mm: handle read faults under the VMA lock")

What are the userspace-visible runtime effects of this change?

Is a cc:stable backport desirable?

> Reported-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
