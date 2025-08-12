Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB476CA0EDA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeHuWwEI7HCQcep/vXsdsKPdEXnECTkuUc51Rm2ZLso=; b=4gCNqM8ohvTHQ4
	vaWM3an27aKKnK4R/0hmV/9jkY6iBgZb6fzWiu/ecp5QRli6P2J1ohSEG3i2+y6XGeqztJgKkgv8Q
	q0yiEeqeC+cV25HfmtLkQrCmQJHtBeH+eW7rzEv3A9quVQGLHBXgVYc45/e/sgVrkQNVHnjHgG0Xv
	tDfjS4BhLBoCmkAmNHNkeDER2A0R84EBTz8XzMZqJiE052FhRmraIKTZ/IZys0U5HnG8IjDVvrZ0U
	zDkfeXuSzQk/gSLKaE7O7E6tN3hOVTWfpcdusojnkjE+nfLC444loEy/E+Mpd1BJOGIfwTHsZ+s+6
	IQUsAr7RX7fnNZPYxrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullWr-0000000APg4-0gUB;
	Tue, 12 Aug 2025 09:42:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhpq-00000009wQu-3jBI
	for linux-riscv@bombadil.infradead.org;
	Tue, 12 Aug 2025 05:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=emT7OGVf8qADB77VZW2wfXK77ogLhNB615LiAihipYI=; b=lSAuvUVT5WcevpB1F5usIrtLYk
	smen9em30MaOZSgmcVrPHtXq3Ey0Nwafdd7l2cvGEfsnQ5BQ3GtdkC1+odMz0dQYan8iXDigGbRF6
	J8IziwnkYOwhmkzV0/oeJJObRwkqDNBXCr8NVbUhHHBrdRL6L5ChB2mqEPmgxfNjtvNBgnmRKHrZ3
	m8/AB59zEA5SXFP0SLCkYuWuJXxCy3PGwN+G5BYIeVCO4Atkagy1DvjLO6QzY8tuUmhCkygwfRk+o
	LpyLQdWlzDqfn96jUEj2cyZMsQ1ghd+6sH84oXbG5gPkVodpL2R4Xi3h8Gx8oZ2/jA2CC3fsLnmqK
	NbqsfKig==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhpo-0000000FgVj-0Ofu
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 05:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D006044A2F;
	Tue, 12 Aug 2025 05:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEA5C4CEF0;
	Tue, 12 Aug 2025 05:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754977566;
	bh=FMFubZzw5IsK4kYuUJoxjkzx4VzJv3nuhFsuIBFsRLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=codgUbls4Jz8D1XxnqnT/EyunZJUa9myWZ6KM6clwyGUJ6WEPqJZaW8dW1l6LmCR6
	 HV764gnLlxlkLNykXx4JDVpET2TYITdaH6XLQSdaxoN/nW1/dBEDf8XR19kQ2cukyZ
	 ekOySjByBeQxpGA8jVU8pZ6CH/0uA35Z18MUh1rPKSolwbKqfkaMH41MxfC/sPnvOS
	 BiJBfrVSHpa8b1UFS7xtaTGxczxvZuio7abrv2I8I/sLZdocmAgK1vBX09PB8nT6ZA
	 JCQT9BhD4zK5vNhtkK5VRbofDm9VltutqHmoe4zOsUMZ79btNRR9OV42jsnmEXM6Ce
	 C8dhIXrTcWyJw==
Date: Mon, 11 Aug 2025 22:46:05 -0700
From: Drew Fustini <fustini@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Darius Rad <darius@bluespec.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v2] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aJrVHenvkMTRYcsS@x1>
References: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
 <aJXvWuPKIc2lCSX3@localhost.localdomain>
 <e4d21516-23b5-404b-a7da-cf6ebfd02dbc@iscas.ac.cn>
 <aJb+wifbIAsit+me@x1>
 <5a96d08e-0714-4925-a9c4-ea66549623d1@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a96d08e-0714-4925-a9c4-ea66549623d1@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_064608_395209_DEE3FDD0 
X-CRM114-Status: GOOD (  15.29  )
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

On Sun, Aug 10, 2025 at 05:52:54PM +0800, Vivian Wang wrote:
> >   Discarding vector state on syscall entry can help identify userpace
> >   programs that are mistakenly relying on vector state being preserved
> >   across syscalls. This can be useful for debugging and test suites.
> >   However, this behavior can negatively impact performance on some
> >   RISC-V implementations.
> >
> >   Say Y here if you want mandatory clobbering of vector state before
> >   entering all syscalls. If you select N, then userspace can still
> >   eanble it via the abi.riscv_v_vstate_discard sysctl knob.
> 
> Typo: eanble -> enable
> 
> Also, I think it kinda makes the false impression that the sysctl knob
> is only available with this set to N? I think this should be structured
> to say something like this being the default value, and also say that
> userspace can override this behavior system-wide via the sysctl knob.

Thanks, that is a good point that I should clarify that the user can
still override via the sysctl knob regardless of whether choosing Y or N
for this Kconfig option.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
