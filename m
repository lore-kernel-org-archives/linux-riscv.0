Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272F2C369CB
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Apr 2025 01:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OaUT+RFmqEY1yi/034pf+/siG06SHcBErl9eLKa+sc=; b=TFpOD45ND5ZCKz
	ZrHfxoJj4AMF+K5kPCNzc8xBLWW14kmXk6MjcAiFH2NKeYs/JonZEwG0fBM2+/GhihgJRS4NvXqlv
	zaxOg7qQBBdluCSJ75h4RQXUJKY8qBZAkQoe0pn5UzcsvmAWJSG3qPA1CInyG5Cw3oD6vQHB4BKbk
	TELbPzSez4Qbf7K+EVsfS3R5fnDPjzcd0VexqkhwISQjIpOxXrEXlD62UIAUBCyrQK8NIkhxW/h7N
	Q8k3+soKiBHTgIX3h2Bhi7Edz4G0e9eCtBZVBOFx4ZvuFh/iOx4zFYoZLNBmVGLCVZQR37Y/8QRDC
	pR61UOH0NVGbhFEVsKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qg9-00000002iUz-2iHd;
	Sun, 27 Apr 2025 01:19:33 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qeC-00000002iMW-0i90;
	Sun, 27 Apr 2025 01:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3F7iDEdSRBB2mSL+5QpO5w6bndUe8WQsHE1GcHOmdVw=; b=O/r0niVzoyOPfmEco/LPho1OAX
	gGXZ6INsJ4cKg8F+kqhcLeP1EXxcw67SKKTXtAYghFdkrDnWzOKvFToEc+FXMWFz+W5Kfn0d6Ha1v
	nmJArGe4ph0x2aoDazE7UTjfa1YdP1htxevT63zScgCUYo+6c0dDx1v7WR+XB7TEo9exFgzd5VNqd
	r0TVQdHeibdui8OTBHi7kfB5aY9rOS8YEXOKtdp1R5EKYF+U1zPv4G9zi4m+ESO/9A2yInPbZc+Gt
	hMr4wQQDBJIVBcyMMzH9rW+cWwtPJNGXlJWOdNbe5szGd3MGES9JjNOr8P/cWSx2hg8/c8kMhmAzz
	WlEHOoKg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8qe8-001JTp-1j;
	Sun, 27 Apr 2025 09:17:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 09:17:28 +0800
Date: Sun, 27 Apr 2025 09:17:28 +0800
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
Message-ID: <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250427011228.GC68006@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_181732_207537_5E4C7C2F 
X-CRM114-Status: UNSURE (   8.29  )
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

On Sat, Apr 26, 2025 at 06:12:28PM -0700, Eric Biggers wrote:
>
> No, that would be silly.  I'm not doing that.  The full update including the
> partial block handling is already needed in the library.  There is no need to
> implement it again at the shash level.

shash implements a lot more algorithms than the lib/crypto interface.
If you won't do this then I'll just do it instead.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
