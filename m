Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50380C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANGX2AG4Ifd4ipiUOt72BnwWz+Auh4ydLLQZAdLYhYc=; b=0ZkLgb3SWqwenl5GO4wCsG9/Jt
	Hx21NO377Ijufr9UfbXGE7m5az/HyxsThLLY6E6dOnj0aKakCye9u8jPbW8h0oVV1z/6HSs3MjBcD
	x2nTEZ2w7GCos5rHrRAXFo/DlDdbUgQdOxoYym7+ATx9R5b1gqri1d8ZdSJE5suobHCFeJsP+xzfI
	n4L0dySLYDdkxpcgEGhylRROF9vIA5dMrVxGnH/NoHRh+6q/w/v19zqbFKyAPOP2gerwo4PFYBOF6
	+ErFO5vTeOmRUDVqFwTsLKgj2i4uFK36nWUFIE5bXsDFcGMPoQ68Mj+KUCnHgxToY9q0SzgO8DnN3
	G4lEy3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpE8W-000000098Xo-38o0;
	Wed, 29 Jul 2026 23:56:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpE8V-000000098Xf-13hC
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:56:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 936F3600AA;
	Wed, 29 Jul 2026 23:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF741F000E9;
	Wed, 29 Jul 2026 23:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785369389;
	bh=BYvo+6xj4x0XjKaGZgAYpZOq0QnAqPUEa3/hWx8Nn2I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=JSj0rHFNX2IAmpl3O+uBogdRtBWk9YqmTsuXgqExiH0HAznp7OfVIJgCXHXKzhREA
	 oQcWjrxwblGqFNpAnG4JsXLQnRpjqMc6dYqejqFBLwKyrRO7f1oDBNZW8jiw84co4Y
	 DRLP2/3w/7lhx+j533m0LVBm3SXwq2koMIQTcG57yv3ce+9/hoaAqwpYlKKoHSGyVa
	 fnN6De1NaBqYnS3ENGAXDS3gjKPKSpqinORFAm71V2dClRgtElBwHOwOfx4KW9ue3C
	 1bVktaXDMnv0p9S7HIWUcwILIwvIYz68xTOQb5DUmexQJ3SFo8ERqnKu896M+uzPnm
	 xHE9HBre8M0Bw==
Date: Wed, 29 Jul 2026 17:56:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    David Abdurachmanov <david.abdurachmanov@gmail.com>, 
    Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: vdso: Only try to install vDSO when present
In-Reply-To: <20260709-riscv-install-vdso-v1-1-0ba4345419ca@linutronix.de>
Message-ID: <8e31eee7-86a8-154c-d4ce-01e2467e9777@kernel.org>
References: <20260709-riscv-install-vdso-v1-1-0ba4345419ca@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-366263061-1785369389=:100339"
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

--8323329-366263061-1785369389=:100339
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 9 Jul 2026, Thomas Weißschuh wrote:

> vdso.so.dbg is only built with CONFIG_MMU.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607090258.iSAUYlO1-lkp@intel.com/
> Fixes: f157d411a9eb ("riscv: add missing vdso_install target")
> Fixes: 3edf39916977 ("vDSO, kbuild: Provide vDSO debug variants at runtime")
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Thanks, queued for v7.2-rc.


- Paul
--8323329-366263061-1785369389=:100339
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-366263061-1785369389=:100339--

