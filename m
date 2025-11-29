Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16888CFD2F6
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Nov 2025 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FwASrV68RwgZfz7zVsABwnDlJLYz3DziD9fojROiGY=; b=zZFog3Rnuzdqom
	+Y32Dl6D7dyqLJQgBAquuhpOMiHTDFDgjNRCNs9WTAJCWKQuJij/WnowKw+sVNZbwrEaRLKlPlbet
	UqiJBtgmAToPHe6/WwAf+4vqeJnthmUzxGghJtEablRBFf2nGAfdyqUTT/EGefcRKfy7UvjAjE2pU
	NFXAnGuXoB+3VM5bKZLXblJypL35M9QiY3zR42obrC/OmudzaJYOao7g5/SM21EY2TaDk+yKbzbBd
	X/2JRxpSmrY04WRljznKfd17GarmoJj55HwOaF5IAimrXPZFBdNdkid+Q/DEqLkbU+3N/1hG4Rbf9
	A+DJnMWbk+Ixb0bgVeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPO48-00000001ft4-1AnM;
	Sat, 29 Nov 2025 16:44:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPO46-00000001fsx-2uOM
	for linux-riscv@lists.infradead.org;
	Sat, 29 Nov 2025 16:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2DAD60051;
	Sat, 29 Nov 2025 16:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4992FC4CEF7;
	Sat, 29 Nov 2025 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764434693;
	bh=XbdQrctocb5sLnKbVGTUwZksoGZGaJ2xjbY3U1nwOPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9GIHPxFgSo1TfwonKR/Fuxcdt/JgFBeUiMI9ljnQw29XbQlwvSOH5/8r7UXsy/g/
	 w7reA8wPk/Boll0dRCXIXj1Ntt8foScekJ2UU0FsHNPHI7K6HFOIcKZaKI8v9MQfaO
	 IqmoA1FX1nr9hiYv6+L/s/jG7fDLQNY5lTrla+yydhEmVIwIqHYQE+8RG4DB4pPkTy
	 BJEyIKfOeFyc5Okd0REI3JQMj2tLEpFvvhLQrE2jIhe1+JqmgofZLADgKYaJx/jvXx
	 HaikJiaGTzUm9G9iHt15oq1jt/Ftb/1unF4faCyNRgACYCpC7gLy5Ca7mK56R/77kA
	 t7CuPTbSgAj/g==
Date: Sat, 29 Nov 2025 08:44:51 -0800
From: Drew Fustini <fustini@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] mailbox: th1520: fix clock imbalance on probe failure
Message-ID: <aSsjA9RimtLpQ0KF@x1>
References: <20251017055414.7753-1-johan@kernel.org>
 <aRGswsgOmPGXMjMI@hovoldconsulting.com>
 <aScppcza9xwGwqn3@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aScppcza9xwGwqn3@hovoldconsulting.com>
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

On Wed, Nov 26, 2025 at 05:24:05PM +0100, Johan Hovold wrote:
> On Mon, Nov 10, 2025 at 10:13:38AM +0100, Johan Hovold wrote:
> > On Fri, Oct 17, 2025 at 07:54:14AM +0200, Johan Hovold wrote:
> > > The purpose of the devm_add_action_or_reset() helper is to call the
> > > action function in case adding an action ever fails so drop the clock
> > > disable from the error path to avoid disabling the clocks twice.
> > > 
> > > Fixes: 5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")
> > > Cc: Michal Wilczynski <m.wilczynski@samsung.com>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> > 
> > Can this one be picked up for 6.19?
> 
> It's been another month so sending another reminder. Can this one be
> picked up for 6.19?
> 
> Johan

It looks like this is now in the 6.18-rc7 PR from Jassi :)

https://lore.kernel.org/all/CABb+yY2GeWHWeASzemit8XvgvHg=Cse+46CqF3KJfsBXNPEBAw@mail.gmail.com/

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
