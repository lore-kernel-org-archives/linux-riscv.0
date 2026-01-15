Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE75DD44C48
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDV/VZ0VjlU1t5A1mW9w13XbSuuMvGJIWOfk3BuBjfQ=; b=LctB05tVn0lS8c
	/7Uu3nlXBD48OMZd7s1pBgA3RXdA2nCRkBREF0mNBoksGSgUKD9yLxBn89hQYaoLUfXLVoM53iJEN
	uxwmbKXK3hD5nxVWlwA/iQzmSuOdxE9Dqggvz+PzIMzVjSWZpbIUPim8hI6IjrKh65QyqqS63epLJ
	Zh+wDPT257gUmJOQ0T59saaA+dPJslscTBauNVIcpm1XWUmC8H0C+F5SiQeJvosLHO0GMzL7HI5hD
	oreSwI9qghCGLvyiiLFLNlAio3YhZiPPisiA1zzB+O93aK2AL1BbdRTsw/iR/9jozqjff2JXu0JRZ
	m04KrJNYmo4dW8GEvO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNOt-0000000CQ8E-3RPI;
	Thu, 15 Jan 2026 13:28:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNOs-0000000CQ86-2VjH
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 13:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF21C601D5;
	Thu, 15 Jan 2026 13:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34A3C16AAE;
	Thu, 15 Jan 2026 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483713;
	bh=KkguYVdhvZYXRcg/IO6o4pzafy0TJxYwSM1Upcj7g1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=koAXMGkFOUqcNCjLP3cQMW7EarvWVDLzAWDpHjePVFKOj9a5RgGs4T00AnPTMzQ00
	 //ahHQPUMq+evkJe8Y4IJBdFwuPJEPlW+kdw1hvuS48Tz6EJ5E2PfTOE+PpF4fF2Ao
	 mBYoJTzyIZ0+YhtHrocnIB28PCyLe8/+SCY3JGAalOh/eSv/4TE2BeTQBSI5zAjZcI
	 7U2bjN0WTb4sFvFebyXPU65TXogFcgPH53bvFAC/LvOft8ux9wthiGIpFQnC3x0xeg
	 Y2aZMHZQHexB/UeeDPtxAfyPueDAL5Chz9mHW5YEAFb1whWAeW6qiHTUplLL4SYHbo
	 y+Hkmite6mQow==
From: Thomas Gleixner <tglx@kernel.org>
To: Yicong Yang <yang.yicong@picoheart.com>, Anup Patel
 <apatel@ventanamicro.com>
Cc: yang.yicong@picoheart.com, anup@brainfault.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 geshijian@picoheart.com, weidong.wd@picoheart.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] irqchip/riscv-aplic: Register the driver prior to
 device creation
In-Reply-To: <e30ee004-64f9-4003-8907-c407a76fc244@picoheart.com>
References: <20260114063730.78009-1-yang.yicong@picoheart.com>
 <CAK9=C2XrExRLihwveMxs-Ourr+8bXja5UAmN_muAJz5FSpFW8A@mail.gmail.com>
 <7b859dd5-9262-4d68-9a8e-e0be0c24ac4a@picoheart.com> <877btkht2v.ffs@tglx>
 <e30ee004-64f9-4003-8907-c407a76fc244@picoheart.com>
Date: Thu, 15 Jan 2026 14:28:29 +0100
Message-ID: <87y0lz2ef6.ffs@tglx>
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

On Thu, Jan 15 2026 at 16:31, Yicong Yang wrote:
> so based on above, if we use async_wq (with async_schedule* APIs) in
> acpi_scan_clear_dep_queue() for creating these devices, the issue
> could be solved since we're sure to have these devices before entering
> userspace, since the barrier of async_synchronize_full(). This should be
> a solution with a conceptual support and I did a quick test on our
> platform it solves the issue.

Sounds about right to me. The drivers core and ACPI folks might have
opinions though :)

> As for the order of console_on_rootfs()/async_synchronize_full(),
> though our issue is not directly caused by it, it will cause the
> same issue (by the console open time the async probing maybe not
> finised) theoretically and needs to be fixed, is it?

Yes, that should move past the synchronization point.

Thanks,

        tglx


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
