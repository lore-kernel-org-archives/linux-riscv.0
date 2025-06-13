Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940A4C71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 05:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8Wp1OzhnVXzJdPev+qD0yo1CpJRVrVnmbkglAMCjds=; b=IcnSpgrjf/3LKa
	lwSMDjyodFTnoYMIEdWGweB+l+ImK4DgBY48I/QzBhoMP4lqxmjI9vdAUcV/JIZvGCe3IhrZQnusf
	IlNLRVUz1hvq3LxWRbszW1dl0i3Ywj1tW/cg1ek7QybcMFJQUfHxHC3nruPWi+NFtLSDmEHAzXyia
	cHya2WcShfYhH3fTss6OSowSw6vXjTvrHD3eDzzdt24Ci+MBp9hGUxnKhHzrBylsT6Txmv84GysYs
	vljtPQ/2YQ2lIXtr84fcmPDpjrez1pySJLY0jZHRLAdE1YNJOTD8Y4LraStTR/Rh/dWfSX+Jt+9Yw
	yEF1alqCrDXhTo0vUEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxPt-0000000FROu-2lhE;
	Fri, 13 Jun 2025 05:57:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxNb-0000000FR5D-1yvi;
	Fri, 13 Jun 2025 05:55:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 093EE5C66AD;
	Fri, 13 Jun 2025 05:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5502C4CEE3;
	Fri, 13 Jun 2025 05:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749794106;
	bh=EQinaykufdJiEoc3wJL6eCiS8HSVV69EbKQuUIqZ4A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVzOhHxZEdRmDryhkzWsTUbgiD80/nGUFYqT/E2H+ztH9dYmB23yyHwGXucNgb2VC
	 Y8Fz2QN/YcPImgTIEsMmi2at1hh7Wusg/Swln8/tybuDvO3yr/9PIT9HrSY4//46t5
	 wtPpMSe6toD4o5BT4+TPQT4O1tvI0PZdKnRtsNZdCUINNq+fm+Z7UIGWhXakpXNeOk
	 F5q+LOT72fea0DA8ZY+ppJ0ZUz+JakkY/jajzT1HCY7f4skIu/5PCji8+056SRLZlm
	 Nfznk/+2lNHXfKpY+IVm0D/dqRpgiSfNfamOFv9YVmEk/vwZgHtnXyp+mDs5EU19PK
	 JVeDVyOn9w/jQ==
Date: Thu, 12 Jun 2025 22:54:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250613055439.GB163131@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEu5cyDOMcKteW_b@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_225507_558226_951C4AF5 
X-CRM114-Status: GOOD (  13.35  )
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

On Fri, Jun 13, 2025 at 01:38:59PM +0800, Herbert Xu wrote:
> On Thu, Jun 12, 2025 at 10:36:24PM -0700, Eric Biggers wrote:
> >
> > You do know that most of the sha512 asynchronous hash drivers use custom state
> > formats and not your new one, right?  So your code in ahash_do_req_chain() is
> > broken for most asynchronous hash drivers anyway.
> 
> Every driver needs to be converted by hand.  Once a driver has
> been converted it'll be marked as block-only which activates
> the fallback path in ahash.

Actually, crypto_ahash::base::fb is initialized if CRYPTO_ALG_NEED_FALLBACK,
which many of the drivers already set.  Then crypto_ahash_update() calls
ahash_do_req_chain() if the algorithm does *not* have
CRYPTO_AHASH_ALG_BLOCK_ONLY set.  Which then exports the driver's custom state
and tries to import it into the fallback.

As far as I can tell, it's just broken for most of the existing drivers.

- Eric


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
