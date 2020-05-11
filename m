Return-Path: <SRS0=qmG6=6Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE21C47255
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 08:14:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA9820661
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 May 2020 08:14:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPJ5t+gW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CA9820661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HB1oL4/hWmGO32viSqndym4HVESsa054XSwxAWohYEk=; b=CPJ5t+gWuJUrhkZLQE45NXUB4
	juIqBH8JbCg2kkTA8TJUzBdaKZBNgTDNuayDEGQVWMmVTfWQnixvfrIUL4dWMkDq6NsuHU7XTagIz
	TPXXiA9Ww+yYl4D+EeusDMCFnI3Np3A3oICMg5hCUyMwlriwz0dY71KhixwHsLa/CEa42WZnlHSDz
	r8Dy+6tRzwr75anDiUi9oJrnxMq9MQPJ/bNEhG4XyvfvPVZaefMk99jFuOVINkbaP9/NQ9xhC2CL6
	bDqgQhX/dC0QjCnDYI9FM/e5sOD/5s/ANf9n3Vm/likUnLOLrtowt2azWckxN+duxjqyRqe0Zey0g
	ThDw7PvkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY3ZX-00033I-H7; Mon, 11 May 2020 08:13:59 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY3ZU-00032M-7k
 for linux-riscv@lists.infradead.org; Mon, 11 May 2020 08:13:58 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 50000AD5D;
 Mon, 11 May 2020 08:13:55 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] RISC-V Fixes for 5.7-rc5
References: <mhng-81c83c19-6f5d-4ed1-a0bb-26accf4b7d3a@palmerdabbelt-glaptop1>
 <CAHk-=win0EVU_GuO=GuJu3Ck0WG1B3+ub-CjncM3B1G9x5d9cw@mail.gmail.com>
X-Yow: The FALAFEL SANDWICH lands on my HEAD and I become a VEGETARIAN...
Date: Mon, 11 May 2020 10:13:52 +0200
In-Reply-To: <CAHk-=win0EVU_GuO=GuJu3Ck0WG1B3+ub-CjncM3B1G9x5d9cw@mail.gmail.com>
 (Linus Torvalds's message of "Sat, 9 May 2020 16:26:53 -0700")
Message-ID: <mvmr1vqkhxb.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_011356_566733_D1A21793 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mai 09 2020, Linus Torvalds wrote:

> glibc depending on kernel version is WRONG. It's bogus. You can't do
> feature detection based on kernel version, it's fundamentally broken.
>
> So I really would prefer to see glibc fixed not to do that stupid
> thing, instead of adding pointless vdso notes to the kernel.

I'm not aware of any discussion or bug report on this issue.  Any
pointer?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

