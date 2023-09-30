Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28521E77354
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 06:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gzPkcz18WOuBTOpsim1EeC2RpR89wARyismJc8PdjE=; b=EhNgXsgjyhzuDA
	L2kDrM6uYHwyLNV2KViUVxcUpVRzZzhrTtNMQ0XMDCfIa9lOvkJ9j8ygPKIteHsX/1kxYozoDleDj
	b9XTikBaHBpwem482vlW+MJH8xQfAaEmI8lUgesnu9R7gp0Ia94o0kIXGD7SvKOsRWvbDyT9dd7p2
	V8LTojL0LeB/qz03r769rZSVofnbNQhPBQxDoSMcMmj3qPzhTgQ1IJq7GTGNlT5+8c+IzVD/kaC/L
	3w7dUGUXITC4YD2wwnTyd7N9WDIu6hLGZmV/cJ3axx4XGtgC8GEh0qrBKWQizNS8TlKhLurluOYjh
	wTJl/vKeiU4rFEdv63Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmTEq-0093VP-32;
	Sat, 30 Sep 2023 06:14:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmTEo-0093Uk-0v
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 06:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A35C4B818B1;
	Sat, 30 Sep 2023 06:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64FDC433C7;
	Sat, 30 Sep 2023 06:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696054439;
	bh=4a0tblP3n3uiYoGh+jE1PItEJ/6scR1bU+57t6WA/Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GoZG9Ek04SuxXMOWz5g1jo6otBnQ6yg156MfkMYh/W71zFTiCWDMA1D8LyzpOcw0l
	 p4MBD9ef1ZcVsI/nT38Am1LOaDw8Iq1vSKdKZAOePkw5s9tYmpzxYYMZSCqbm8NujO
	 6zpk3+MHuetHecsJqPSrXYl4EdUfDdqn4K7RQr+k=
Date: Sat, 30 Sep 2023 08:13:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward AD <twuufnxlz@gmail.com>
Cc: alex@ghiti.fr, alexghiti@rivosinc.com, aou@eecs.berkeley.edu,
	conor@kernel.org, guoren@kernel.org, jirislaby@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, liushixin2@huawei.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] Test for riscv fixes
Message-ID: <2023093049-next-confusion-b812@gregkh>
References: <2023092939-lagoon-punctual-e312@gregkh>
 <20230929230534.45142-2-twuufnxlz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230929230534.45142-2-twuufnxlz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_231402_502057_3AE4443E 
X-CRM114-Status: UNSURE (   7.70  )
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

On Sat, Sep 30, 2023 at 07:05:35AM +0800, Edward AD wrote:
> On Fri, 29 Sep 2023 08:04:57 +0200 Greg KH wrote:
> > Where are you getting your odd cc: list from?  This has nothing to do
> > with serial drivers...
> https://lore.kernel.org/all/0000000000000170df0605ccf91a@google.com/raw

I do not understand this answer.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
