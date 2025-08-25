Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E263CA0FE8
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7liUY1H3akQLn6SpXqzYr8umPHaBK7ufdfa/34qDtv4=; b=ubbs2oT5RipC4Z
	8zZSBIhWcLcCDrldoj31CQ1/10QWmriE5h3UEnX3dZQX4Q4qK6Ga5cIx4SkCsZK+TpNP05mZoy/nQ
	+2Q7aVWuL0LtBBDTi+EccT6VwzDHKXG6gqzgtuzbiuv9jWokACh/HxhikGTiijSyhTZbeHWo2+xUE
	8YvF88hUl10ruOePPlp8VBmdICq7+qNaMPkS2YCPV+nZ0qVxjvWMsEAZ4alwJr8gFUQk8Qcn1RlyV
	fA4PXv55i8msbWEJHEHouw5lc0Ikw0jYv2J+VoJTmOXI2q+iB92etT5rRLEqfw4Nrp6Xd/BIcOP+Z
	l1MUiuu8ehaWAB4SySxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYr-00000008kVR-2ZfK;
	Mon, 25 Aug 2025 17:00:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZsI-00000008d9H-3CAI;
	Mon, 25 Aug 2025 16:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=efhPlHl0mwuo/YmEbezr7uVAgnsDqK5bzZYmj7qssNg=; b=Vx4q1Tx8JOcamCHSRKbolFFc/f
	45VY4a4WDN8RkxgiRFzCUgc4vLLeN2r04gcloQbXhxXdGDIonKUAc+WZzNY+OOcbxtIXb0UJuyoVz
	/0UVZaIyc63nYjUQmSzBsbaFT6zvTHxDrV6PQAv3YxZGT+/nUcsh3mY/NZAM4nxbj7tvQeiAuBPME
	ak1hWUQKYAhmm8lueydvceBWM6VD7MHadD78PZ57BcD0oDgSSmx13xehRzthTGwlvcKAl5Mgb+Mqq
	chLEl3P4h3lmbdFN4hEenVUwRL3llrNd2PZlrU9dod12FZ7DsN/gsrSqKdvBndEa/jOOhxvV7PA6W
	vYU4N5+A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZsF-00000001vos-3XIg;
	Mon, 25 Aug 2025 16:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6E00419DD;
	Mon, 25 Aug 2025 16:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6A4C4CEED;
	Mon, 25 Aug 2025 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756138605;
	bh=9C0JTroVYJnMkJclSuilfgsfM6RmsoK/moXeHS/dRAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfFYvZXMBbgRSX0K3rOpSm2H32pNwz0EEz0H4S8bd5+3uFOutsnu/gA4+ctEHS7ur
	 VtzlPW/aRP0P5S9aTe+JhuI3FChzXIEqbC+aN2veGXaOG1WRIWV4Psi+l4ONt+ohTF
	 RyjzwfR0rTyuppZ+FJ3jNBUbzMZaGKzzoFEBXFRp23llVJvWbp47wn+tZBjZQGeoWB
	 tb71D1+B7nImbFFmi9AowNEy8a6DHnwM8VKGxCarOVIkIRzF9fk369PfmrjngRV5/s
	 NiocBqHCJ5uUXBhjX8UU+eppr7zFxbil46Apb7ckJhm0LZaf7z5J34/iQwh6ScYl9O
	 CfcB+v7OD/pyg==
Date: Mon, 25 Aug 2025 09:16:45 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <202508250916.6424C531F@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
 <20250825155923.GY3245006@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825155923.GY3245006@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_171648_129319_BE73729F 
X-CRM114-Status: GOOD (  12.41  )
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

On Mon, Aug 25, 2025 at 05:59:23PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:
> 
> 
> > +	if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> 
> You could just make that cfi_debug and add:
> 
> 	if (builtin)
> 		cfi_debug = false;
> 
> at the very end of __apply_fineibt().

Oh sneaky! Yeah. Will do.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
