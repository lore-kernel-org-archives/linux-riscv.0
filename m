Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5560ACD5BAB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 22:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nAlUfO4R8fR7Ct+JPno4Fpu5UATpKfpAcpd1gMr7UA=; b=frW9tfDg+bgaT6
	Wtup01xQnOAYlsi4fAKGV5YA4CkUtgcimwo3ZXxopRO3Xz7Ovl/dwrh7nnttHHKawa0tH7Z9T9FT7
	mFAO/yEZ3ttY24WcqsZNvVyMSBaY5bGi5DhEYdXTlh5hABYpjmIAX2ZiEBeH1E4iowF8Mfn52P1Zj
	jl5wJhH7/Qb1fYIuWW3XBOArff7TeK9EYLfEzcyiZx4y0qIjFeq1v7nC3hBACHOZur/owXeP2VFhE
	ng3rxc2P0YwOMdILO24cY/qKaDixjcYPmc8iBzNideEwmPrjdKRq6iZyFRmrOkm+HAu6DPi7QwmMh
	r+q4Uq8fuqOYJk+S4f3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBUs-00000009Bcj-3nmN;
	Thu, 21 May 2026 22:04:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBUq-00000009Bc8-0BjD
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 22:04:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45F6D43B97;
	Thu, 21 May 2026 22:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A012E1F000E9;
	Thu, 21 May 2026 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779401043;
	bh=g9Wwgieyid4ilZdQDYHVMkAeDsWF/TO85blq4iUxsfI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=azbNvxnFIskqX4Jdc+qoAL9jsNpDoBLJ8JEKVyvKVHOSylw5qH4clM+L1NTf5/YOl
	 mqYh0EDBhYyfwNTiqrpPOPyyqJzu9PtD/PnhCZKAo0iyzbcaR77BOC5B/lE0CeLFlB
	 e51r5hdHM2M3oRXw6s/fEhsEphCaGKGREospKoWVMDBqqAX54I7rBVR7Wc2L4LiHOI
	 CQh1HM7Yxv1Eee/R4Hed8b4wQpsFQnRo3xZgwGA3mlb5N4UR2K5oAiHlK8cefrpa30
	 Q14FNt4EFoQo1gWV8VUzi5w285KHs5mfLIr5OJ11gclVmpoPJGSaX6jT0+jHo02nth
	 2qnbZ56V6/8eQ==
Date: Thu, 21 May 2026 16:04:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH] riscv: unconditionally select ARCH_KEEP_MEMBLOCK
In-Reply-To: <20260519165546.123105-1-gaohan@iscas.ac.cn>
Message-ID: <b06ac7de-6c91-4536-1f06-56fb782150d4@kernel.org>
References: <20260519165546.123105-1-gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_150404_102357_CB94E8BE 
X-CRM114-Status: UNSURE (   6.91  )
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

On Wed, 20 May 2026, Han Gao wrote:

> Select ARCH_KEEP_MEMBLOCK unconditionally. kexec requires memblock
> to be kept after boot to initialize the secondary kernel. Device
> Tree platforms also need this for kexec support.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Thanks for the patch.  If this patch is just about kexec, shouldn't 
ARCH_SELECTS_KEXEC just be changed to select ARCH_KEEP_MEMBLOCK?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
