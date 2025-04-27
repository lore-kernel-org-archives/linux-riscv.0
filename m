Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8B1C369CB
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Apr 2025 01:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6NS3RQ8DwmP2gHpYOix/dtb+tET0f4x+Ith4GdQ20E=; b=j2cGtdU/sEJBy/
	ex2F1PptxhgZmmyO+x23Jlb359mSjjvBAQU+frFAI74ARPHZ9AeQRafL1iS3XIBxXPMKDJlV/b2Am
	FCnFnV1fX70EhKttA54I1T2rBglJ9j/WhQfRA3qbA+aJJq7At9AlKZyHE2BfhVMgNMOvqP9U26l5i
	l0nl1bf8b5DC/lyF/RDmxQtHcNCOXyKDbhhDxPaTHH8c3ziZ6n/zCT6+Nf65+pxWL8ctgiztrP3eh
	eImtyPFccY5nz2Ft+ZCOVU/388hfeRqD00n9HhbIFPqTM8iZeAZfEIL0j3iQg0AePx0uKiA9uP++C
	jK7y5YxSrzgY1wWPllyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8rEJ-00000002kkE-1XFa;
	Sun, 27 Apr 2025 01:54:51 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8rCK-00000002kVI-3lEE;
	Sun, 27 Apr 2025 01:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Zwo3jEIV5k/S6BSvnMP3awGiGO3YuYSgcBWh6GzkBJQ=; b=j7FUrS/bY4ibLdXLkJxLUn+ap5
	YhYCpvwpzWdwYop+FOw+Y1rOXudXjrwxEmnvmuQoFhLfW/xwyB50Gj6j035cgOlkI2pmok7ipo2yH
	25crQAk4HTUDesTLMo7qHFGYzbAASFxvnGQgg1Yx5fJujYLkrX8wcSZOOx/WstQN0ioo/Yu8kjWRX
	y9Efcu9GP9BIzj65j++fzzaDauW3eyZ5HRZghn2s7hWiTSLsZpnyu/fgvMYsmPtHmO1P6YKr9X6Fh
	F0mWE3mIuF/Q39gr1a+q4vMiZIu/8G4U/MEIKnjcDFpzIhveaSK5y3NMx6iD7OCc6Ph2xD56WW+5t
	Vjg6IEZw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8rCE-001JpW-2y;
	Sun, 27 Apr 2025 09:52:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 09:52:42 +0800
Date: Sun, 27 Apr 2025 09:52:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <aA2N6oJ9fQYQUtD4@gondor.apana.org.au>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
 <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
 <20250427015041.GF68006@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250427015041.GF68006@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_185248_936647_838855F7 
X-CRM114-Status: UNSURE (   6.98  )
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

On Sat, Apr 26, 2025 at 06:50:41PM -0700, Eric Biggers wrote:
>
> But this one does have a lib/crypto/ interface now.  There's no reason not to
> use it here.

I need to maintain a consistent export format between shash and
ahash, and the easiest way to do that is to use the shash partial
block handling.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
