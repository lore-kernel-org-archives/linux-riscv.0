Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7AACCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 23:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtRde2KMhwC5fOhbIlbTTUAqBduFjwLDi3xD/O1ZByc=; b=L3Ui99NK6hxdqeN64tp6sJDMQu
	FOprKJ1bUk8NFJ9NZDaE2XRXnyyoLv5Bev/1JFcCHfbuUURBzjsDHSR1TiL9vNuohVuxFBiQ4HxTl
	zn8htg9DLaIMsZFNdY366SAqymvPH1x9q7WzEW5/FdB2B7Xn2Glscr9SMRTU26PqtSdLg8qVm4RAp
	jBEMjhJxOUkSp6Whesoo8vcRtrTGRaYtC2K5RKFg3MKe1t6ctALPSnzf8ZHbSGfT+aBMihe0pCUZM
	C0rknRlQZi2DK+KlzsxqLOrm9acXhO8SOZc4XewvxIqmsFhGk/Fstl63buztfCGYRbq3p1XGuPSox
	3pqPntMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v708M-00000007JlH-26yT;
	Thu, 09 Oct 2025 23:33:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v708L-00000007JlB-2Oh1
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 23:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CC6762451;
	Thu,  9 Oct 2025 23:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E31DC4CEE7;
	Thu,  9 Oct 2025 23:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760052795;
	bh=pnPG2TG9PTYq3RQMqhtbs/di2ZVkxvmkOAoJj5TwnbI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VE2eqbNlv8RrqSiVqCSRoOkpzX4n5+VwPosz1GP5I60VojE7MkbOI/Ux2Y9yrCE/0
	 odDR06RhlMN8SXdAc16X22QxSHahTt3r1XwMzbsUi9XrRPaxZlzEAa9kQjNTEdcB/Y
	 fwZ3gtsBVXMJtzFeS/+qoK4rUYxOZVo/0Poqy8DtZT5i/L2e4ph1I9W+T0bglimnqV
	 PYWv0t+iE4GqKCnRa5gHAnmJbe9sH+zRB4DyIrQEj5X4Odw4Tvpp2GNRqKCOXTKCIV
	 9VPDpOeqfuDYBvwZStSXSWaQmJ3+cvmGrPMg/wv/9SeZaAX0p4COfIzNqsPOQLIlAD
	 woWZEZ2bzIVIQ==
Date: Thu, 9 Oct 2025 17:33:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    duchangbin <changbin.du@huawei.com>, Alexandre Ghiti <alex@ghiti.fr>, 
    andybnac@gmail.com
Subject: Re: [PATCH] riscv: Prevent early kernel panic in instrumented
 apply_early_boot_alternatives
In-Reply-To: <4de90ac7-f05d-4c16-a5c5-8101f5d2fe91@iscas.ac.cn>
Message-ID: <58b5a08f-b10c-668b-fbb7-cf44ef2ac940@kernel.org>
References: <20250624113042.2123140-1-changbin.du@huawei.com> <a89f5970-5ea9-4d92-8952-6c26a22ac153@ghiti.fr> <d41d9c7a103f4600a4fc5beea77e0f4e@huawei.com> <2396743a-480e-2ab3-f7fe-569d8f2adfcf@kernel.org> <4de90ac7-f05d-4c16-a5c5-8101f5d2fe91@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-560156192-1760052795=:1991624"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-560156192-1760052795=:1991624
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hi Vivian,

On Thu, 9 Oct 2025, Vivian Wang wrote:
> On 10/9/25 10:01, Paul Walmsley wrote:
> > On Wed, 25 Jun 2025, duchangbin wrote:
> >
> > [...]
> >
> > Working on cleaning out Patchwork.  Was there any further conclusion 
> > reached on this patch, or more broadly, static ftrace ?
> 
> Static ftrace for riscv is no longer supported in 6.17. config RISCV is now:
> 
>     select DYNAMIC_FTRACE if FUNCTION_TRACER
> 
> Since commit 5874ca4c6280 ("riscv: Stop supporting static ftrace"). This
> patch should be obsolete.

Thanks for the followup.

- Paul
--8323329-560156192-1760052795=:1991624
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-560156192-1760052795=:1991624--

