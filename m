Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C56D4A60E
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4cDlxfRH6jX9A3bYsQgwo7EQmOy1oha3BgwF8CkKgw=; b=HSY/6uztxxU5dt
	p4pE4TdaQDH+dVE8N8l8hPGBggC2tFeS8LLrWh6pGcmrhGL+mCChMjpUL2Ct+1j91SYV4cqgFtDgG
	79HVqIdShyeQLs276iiH1U2nlM7YfemxA+HTHLjTFnAnF4Tti+qFdJbg3OLSxj0c9ZxrOW/uPVeK0
	U44byT5nIYmneCHSD8hXNs5D35n0/P0c2JYUHjITnBUk9bDNk6tsGpZDO4AaOvDtnn8zeevVchqIs
	ppcBRE/IhLYn5jeUa0VUyyRQJvQMlC+pTaO4CNr7Qu5FxGpe/hJUUurG4pX7ufGMrWPw404GDUrHP
	nkZ38Zu5BMaHKwYl1/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfh3-0000000Do3e-1cX3;
	Fri, 16 Jan 2026 09:00:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfh1-0000000Do3J-1GEx
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 09:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EADFA43275;
	Fri, 16 Jan 2026 09:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46881C19421;
	Fri, 16 Jan 2026 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554030;
	bh=nY2Y7tuo/irtFglGsNVs/lN0qhnd0rOHIAhJwfKVSZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfQT/2XPLf2n6v0v8lmdRiqzk1J6kgQmhNK8JFgYZPhfIi/O6AM+QYHl/d1Tte96k
	 56LjniEuf8lroBL0GZE8qW8MRf1le5xs0Rdp3HJQiEQpyiiMhkPp3vBgGJ/y9GpnmM
	 OAFneIl62Kj6EXsvCZR+fO+PjT42c1Dr3SKgVrWNpo1kSkOSp4WbUDPkF6J6vCa1xQ
	 ZgUFnB1UkTZjNWZSs6oMgNAwf8k17O9hNeYB+z45+IyVS0FfPffo4C/lsuOdoECOqs
	 hr0aO+/eYgfgkdoOyQnrAEU3G7W8zZOEGM0GJ36uqi45Gjn5Y7UVXKcZaiS8lX5mLt
	 9hWoPDd4Nsryw==
Date: Fri, 16 Jan 2026 10:00:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <20260116-frisky-heavenly-pig-953fa4@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
 <aWmc73irBAM8DZwF@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWmc73irBAM8DZwF@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_010031_366906_A6576D2E 
X-CRM114-Status: UNSURE (   8.17  )
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

On Thu, Jan 15, 2026 at 09:05:35PM -0500, Brian Masney wrote:
> 
> > +static void atlantis_ccu_lock(void *_lock)
> > +{
> > +	spinlock_t *lock = _lock;
> > +
> > +	spin_lock(lock);
> > +}
> > +
> > +static void atlantis_ccu_unlock(void *_lock)
> > +{
> > +	spinlock_t *lock = _lock;
> > +
> > +	spin_unlock(lock);
> > +}
> 
> Are these abstractions really needed? Why not just call spin_lock/unlock
> directly?

They are actually harmful - make code less readable and introduce very
poor (lose) API accepting whatever pointer... This is exactly code which
should notbe here.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
