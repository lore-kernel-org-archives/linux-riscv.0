Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E9BC83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 21:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2hD56a2SeEe2vgvLaTTzCEr5/BQCAAy57AsC4QQD1Y=; b=YCZsUWxbJVGQ34
	MjwONjU/3RV/GQz9f+Un90YHAsdCxHwMSpmOV7kWErplZ2xFFnvMP7RXGf5nhZRbM+EIQY60SwvkZ
	h8kXJ5WYZneznNe89kAiJR/s44KkbQQ0Onm+Z/eGyu9bepzXohF6gXs+65DEddpFF1mazM1xabqqJ
	Q51aencyTno946gSbfsyfAmX8JwMHpJyAuAh+l29ypO6z0SjyeoWovyVJIxqwY/zOkHwkd7IPs5t4
	BR2nvui7KeM/B5lgNz0HYo5BjBwIsmQOzk8OYFZLq/7HJfmCa6Eg1FpI8osuLMTkO4lfcFhCD+uZu
	2V93Ok8a/5osK4banKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxc3-00000000gbV-2E2u;
	Mon, 21 Jul 2025 20:59:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxbs-00000000gZf-27UZ
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 20:59:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E85A461416;
	Mon, 21 Jul 2025 20:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800FCC4CEED;
	Mon, 21 Jul 2025 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753131583;
	bh=PCXzX9mRr03P4nIeOBJHP6i8R1DCS2Xu1AeHEIn4Lik=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=gPrKGkoLjrzV0Hxl9NUKSMbgI16pVII/ZZ/B4DsELC02ucKg8XXqMJaGBfe57GfJP
	 wRfF1DUI+sgnQRxePGpQTIXFStocXxNHL/BKmYVJloyBc9BZESGTEhCcVahbrwupPf
	 p5IYJbI+09t6WcT4dqJS85eYFUiIa0QjGNv/yFp2rIfIDmn4Y4nPbqShGP/cjZ5LL/
	 7keD2GBRn3KCBvdi3Ad/K9THHcICLxAjjF5Ge571sm2osd1Za6RMZxP4n5wWszyq5G
	 S/yGwelZCef9ROmrOPz6lXXMeD1jrzC6eaIGff/RFRDTB8YTefkfA7Fl2fKTm00sJW
	 QPN681c9YJchQ==
Date: Mon, 21 Jul 2025 13:59:39 -0700
From: Drew Fustini <fustini@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aH6qO3c39gmybwEc@x1>
References: <20250719033912.1313955-1-fustini@kernel.org>
 <aH4u_OHqZHZtXjn3@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aH4u_OHqZHZtXjn3@localhost.localdomain>
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

On Mon, Jul 21, 2025 at 08:13:48AM -0400, Darius Rad wrote:
> On Fri, Jul 18, 2025 at 08:39:13PM -0700, Drew Fustini wrote:
> > From: Drew Fustini <dfustini@tenstorrent.com>
> > 
> > Clobbering the vector registers can significantly increase system call
> > latency for some implementations. To mitigate this performance impact, a
> > policy mechanism is provided to administrators, distro maintainers, and
> > developers to control vector state discard in the form of a sysctl knob:
> > 
> > /proc/sys/abi/riscv_v_vstate_discard
> > 
> > Valid values are:
> > 
> > 0: Do not discard vector state during syscall
> > 1: Discard vector state during syscall
> > 
> 
> Is the intention for this this mean "don't guarantee vector state is
> clobbered" or "preserve vector state"?  I suspect it is the former, but the
> wording seems unclear.  Additionally, if that's indeed the case, maybe the
> documentation should more clearly articulate the tradeoff (performance vs.
> security/robustness).

Thanks for your comment. I agree it could be worded better and the trade
off should be explained. I believe the motivation behind clobbering in
all syscalls was to make sure that userspace does not rely on the vector
being preserved through a syscall. The goal of this strictness was to
catch any programs that were misbehaving.

Thus, it might be better if I described it as:

0: Vector state is not strictly clobbered in all syscalls
1: Mandatory clobbering of vector state in all syscalls

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
