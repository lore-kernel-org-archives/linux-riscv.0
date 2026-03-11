Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1281125865
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbWBgoDF3DoPkk4h22CGApLul8RuFtfxKxAgUqX7D7k=; b=G9WKOsPm8w4/N9
	sFAwU7Nz9nAACdN0ZrYgNeqdvkyNqcNtpfl8yzgxM6aa08Z9rC3YYpWejzGti9wW8eQegcPywW5el
	ddkLu1jH6QPTbyqmsvWlqgtBE+pc2KETBDbXIQ0VDSlNdXdWGJPFOH0mJdkl2/l1qJFKeVQYFMcHY
	MG3NWPaHOP1ybvj4E0Bmv7axGiJCYYo6V/u7T2xy0MZoFbF/j6qJhrBxwimAOOcepjV46A59yLky2
	VjN4iKMjlzo1ygfmQ2Ctg+xeSWI4QfDpLwtUNnOfVXqljqinb8C9p49m/89Lx5Ou6sb84hlA5gHkx
	nX+imrePg/jzdJUsBOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OBa-0000000C9rQ-2XMf;
	Wed, 11 Mar 2026 18:21:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OBZ-0000000C9r5-05Z6
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 18:21:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 151D560142;
	Wed, 11 Mar 2026 18:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2498CC4CEF7;
	Wed, 11 Mar 2026 18:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773253291;
	bh=AJB4cnK+6nPF7XzrEc9Y40aawrnv3LRCOW/DGQO3ZZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W9tvad2afirxz5QyDgrlCDCxXjihPnftjOpJ7+KqNngldAnfoQFK2cv9M//Hf6Csr
	 ZSJHebet8RVatcWVMDWmhLOEwO74GZZPxCIMPAGzK+qjptr/YrTXxIADgkQdkZD9+F
	 VYic28ogFaHKpZnfJAOvq93A0zlvilwkyAZ1qcskIj3XUbklvKcSgoTVAIDfC2ArWD
	 gASlAXyrPtEd6zn//x4iMxb4Jb8/L5a/TYXmF3fSHYhifYueUYq+5w1piWPHN6xkRs
	 YFK3M6wSAAtrItwdCJGNamJYdZfxIRJ01ybMlznZkJn70XpnbxO96d2d/U+R55o5Bu
	 iMkpgT7xmlB9w==
From: Thomas Gleixner <tglx@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Nick Hu
 <nick.hu@sifive.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH] irqchip/riscv-aplic: fix PM for multi-aplic system
In-Reply-To: <20260311143749.4058818-1-vladimir.kondratiev@mobileye.com>
References: <20260311143749.4058818-1-vladimir.kondratiev@mobileye.com>
Date: Wed, 11 Mar 2026 19:21:28 +0100
Message-ID: <875x72qlav.ffs@tglx>
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

On Wed, Mar 11 2026 at 16:37, Vladimir Kondratiev wrote:

> This results in double registration of the same syscore. Warning
> triggered:
>
> [    0.553569] ------------[ cut here ]------------
> [    0.553572] list_add double add: new=ffffffff81314a68, prev=ffffffff81314a68, next=ffffffff8131f588.
>
> Move syscore registration to the driver init

This is completely wrong because it installs the syscore ops
unconditionally even when there is no APLIC available in the
system. Works for me is not the right approach.

> Fixes: 95a8ddde3660 ("irqchip/riscv-aplic: Preserve APLIC states across suspend/resume")

No. It makes it worse.

> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

But nothing to do here anymore. This got already fixed correctly:

  https://lore.kernel.org/all/20260310141349432DBRJJclgnBHYWu8it0geX@zte.com.cn/

Thanks

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
