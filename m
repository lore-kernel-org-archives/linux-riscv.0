Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D287E743EC
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 06:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AkClJCL2YtWHUfoqh+n7emVm1Z6klSW2lXlVxRmaws=; b=O4fN2Yn0yYrcTe
	p1jVjoPQ4E3BoYVM/o1VMr7gbuL8TFwe08FAWnmxh6UdLR68iNWzNXq/F9Va/SkFEzvutmFhaW0rP
	uw6xcR5Eev5efOapsMhFG9u4ng1sX6qSSbXkVTnMc5BAQqYjhScKVwZS2w+zo4otWyeXXoEy2wLWM
	5QmOhaNqzAEavqs2NfsRWWw0Lu8i7gqhRgo7HriGVD8xAal0497zDo2K9fMWjxmHw4C8yBhafolIh
	lZ4iFC/kV5PGW0m/m+jYkP48Fc+IZoLINqYvVgjg1le7ABG4HKPi9iWdzcKLHHeg7Lss5Zu2SOCt6
	BEwCIYES3V10t9W95YNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm6cc-007EG4-1l;
	Fri, 29 Sep 2023 06:05:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm6cZ-007EFS-0s
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 06:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 80915B81E0B;
	Fri, 29 Sep 2023 06:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAA8C433C7;
	Fri, 29 Sep 2023 06:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695967500;
	bh=Nhavc+nkl/WrTYLi4RrwAIVN6PbgwJffcR2eWRUl1xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dsyv8DcgjMd9U5QAhkwMHPBCXoPGytz0tKjFa98+Li9uDz/PaeCWGons8jBVOhC27
	 +g73GLX3gX65/XN3GcoOco7fjfs4xw1j1TPwXbIptOhPAi/jAf0JlTg/+g0r2U/wXl
	 rLpgsbC5WSGmDhfikJ6Vz4OMzPh3Pu5art0sgYas=
Date: Fri, 29 Sep 2023 08:04:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward AD <twuufnxlz@gmail.com>
Cc: alex@ghiti.fr, alexghiti@rivosinc.com, aou@eecs.berkeley.edu,
	conor@kernel.org, guoren@kernel.org, jirislaby@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, liushixin2@huawei.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] riscv: fix out of bounds in walk_stackframe
Message-ID: <2023092939-lagoon-punctual-e312@gregkh>
References: <f74665d1-4d28-01a2-5694-b06fde202d39@ghiti.fr>
 <20230928231239.2144579-2-twuufnxlz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928231239.2144579-2-twuufnxlz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_230503_471043_153AD33B 
X-CRM114-Status: UNSURE (   7.78  )
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

On Fri, Sep 29, 2023 at 07:12:40AM +0800, Edward AD wrote:
> Add vmalloc and kernel addresses check to prevent invalid access.
> 
> Closes: https://lore.kernel.org/all/20230926105949.1025995-2-twuufnxlz@gmail.com/
> Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
> Reported-and-test-by: syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/0000000000000170df0605ccf91a@google.com/T/
> Signed-off-by: Edward AD <twuufnxlz@gmail.com>
> ---
>  arch/riscv/kernel/stacktrace.c | 3 +++

Where are you getting your odd cc: list from?  This has nothing to do
with serial drivers...

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
