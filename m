Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDE1C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1nZWYsNnit2lW01Q9w6cn4lJsaVKSEH2TwP1HQsjFc=; b=CeFCgbCef6XDs/
	o4+9rChc9/73RrtxtwVFAnuAMBk6e59scMTFvTMjd8hj6kM3vR2JfKawZpx9TfKyS05H/z4slUKXV
	Rs/v99GUDuUc5biIWnQbwy6P7BSa0RisUAKFLFXN/aA/a9ImBS9Xl8mNrkWz7ETNc7IN8hq0rpaz5
	xpguB+VA2f2QSVCHvHzxTFzatZxlUHeLjooVtMp9Ws+tjBq4aaZQXALxIhSyLg9xahT549o0Noofx
	V7ifglT3v1NkbqOhQCE8R0b3Scnx4Mil2ZMLcJdODyOiTTyMP+kFd8iWHMQQtOrKSwjVcib8LGdtS
	rMB0FD3AmOYo6qlSWpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropoh-00000001YIb-3u4m;
	Mon, 25 Mar 2024 19:17:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropoc-00000001YFg-0Zj2
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 19:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D784CCE0E56;
	Mon, 25 Mar 2024 19:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FEDC433C7;
	Mon, 25 Mar 2024 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711394219;
	bh=hii92yni5m4VfZz2P67wncTjXZJRmTHvfpwyMPi4358=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvHK54vCdibf8Bx3wsJsAhxLlpKrBU2MsRU/IPvCTu6oTcuXEieM7ySmo+I/P16YC
	 /DdrWdwGtdEN5Q5T12edc/DsKmVXyuiWybT/F9vnLo9t+zrDP9e4E1BK6qw0K4j+aZ
	 OmDi+tUZ7HmB9qQPQ8i7epvDcgkX/G4cC0jPiy1nsWBNAGndu+kQdJlHsKOLZ9vJUK
	 3F2xfv/uj+L8hL++3pnZtwWAVmYQjKG2iI5g8uu4CmtfeVBtGAbS/XWo92bbRT4aSG
	 PLdDhVg5aIR938fsKUCBoiodr3ZQ3xPoFvE42SkRe/nQW4ppf6bleuUOBQaLXPoeUs
	 Snh0j5cU67dMQ==
Mime-Version: 1.0
Date: Mon, 25 Mar 2024 21:16:55 +0200
Message-Id: <D032M8W5K5M5.1ZBHEIJFFNTCI@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Masami Hiramatsu"
 <mhiramat@kernel.org>
Cc: <linux-riscv@lists.infradead.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>, "Naveen N .
 Rao" <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 <linux-trace-kernel@vger.kernel.org>, "Calvin Owens"
 <jcalvinowens@gmail.com>
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
X-Mailer: aerc 0.17.0
References: <20240323232908.13261-1-jarkko@kernel.org>
 <20240325115632.04e37297491cadfbbf382767@kernel.org>
 <D031SE4QN1CG.18GY6AS20QF1J@kernel.org>
 <D032IFOPKJI8.3TKDPQQI9I6LG@kernel.org>
In-Reply-To: <D032IFOPKJI8.3TKDPQQI9I6LG@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_121702_414881_ED0EE9B3 
X-CRM114-Status: GOOD (  10.06  )
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

On Mon Mar 25, 2024 at 9:11 PM EET, Jarkko Sakkinen wrote:
> On Mon Mar 25, 2024 at 8:37 PM EET, Jarkko Sakkinen wrote:
> > > You also should consider using IS_ENABLED(CONFIG_MODULE) in the code to
> > > avoid using #ifdefs.
>
> Hmm... I need make a couple of remarks but open for feedback ofc.
>
> First, trace_kprobe_module_exist depends on find_module()
>
> Second, there is a notifier callback that heavily binds to the module
> subsystem.
>
> In both cases using IS_ENABLED would emit a lot of compilation errors.

Also I think adding 'gfp' makes sense exactly at the point as it has
a use case, i.e. two call sites with differing flags. It makes sense
but should be IMHO added exactly at that time.

Leaving it from my patch set does not do any measurable harm but please
correct if I'm missing something.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
