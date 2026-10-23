Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00392606A31D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aTvPPowY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=nr1MGqpR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JrbS/z/czAIuHweJgyTTWtfQfkXl0ckA/UvbWQaRHos=; b=aTvPPowYymUbJf4r9t8mDGapcH
	N2Kc/z33qhcQhDEO4GmA+NGDmK7Y+jFTVGgNRTDCKw+ZtnPRc18S9x3QAllIdxotbn0w/31fbl5SB
	cEiYo2ZEAd8SvMNfRQ5fxWyW54X4dOOn6F819I8lK57B7rjlxkS5RQzu2jl3TMjSGm6l8Vokm3Fp4
	88PlaUIi6dRDThT+GfEFa8Jlh26MhG+SbrAAQkX1W6W72wftXiOOM40W6fnRNy9Usgzw+XwRj1Kfm
	kIEIEBB2a9Q9nDJaaF8mA9RSzWKO7+GeCFF/vCA8VqUMB5azwVotBNzi1CK5VFHDwOJDAxaz/NSY+
	9Hd2DMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHUI-0000000GcmD-3bRL;
	Fri, 23 Oct 2026 15:47:23 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHUF-0000000GclK-3ork
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 15:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1792770433;
	bh=LBxLVBAzhD8PnAjoJ0Ac22ybO01a1W4k52zwzB7Vd/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nr1MGqpRXovpKxwFNCUnab+BhHhBam7aazQ3MqZ5YGJMAII1f5QLuELu6yycitAAj
	 ZqSg89TRyQNQ1F9CS/6kVMw3tnMnDT4mIAuVRRpctkDXxwUcDBqDPhgGisW6EAvhqK
	 2MKmE7cEhfpeYz5/8Cs5AZeGWeYAm6lnSExusphw=
Date: Fri, 23 Oct 2026 17:47:12 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Thomas Huth <thuth@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 00/13] treewide: Replace __ASSEMBLY__ with
 __ASSEMBLER__ in header files
Message-ID: <2aa62156-9139-42a1-b993-4e01ef408da0@t-8ch.de>
References: <20261023064908.66707-1-thuth@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_084720_124568_E97E934F 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-23 08:48:37+0200, Thomas Huth wrote:
(...)

> I split the patches per architecture / maintained subsystem to ease
> the review, and I also split the uapi headers from the normal ones in
> case we ever decide that uapi needs to be treated differently from the
> normal headers here and the patches would need to get reverted.

Nit:

The UAPI split doesn't really matter anymore, now that
scripts/headers_install.sh normalizes all UAPI headers.

(...)


Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
