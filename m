Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E84EE36AF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 17:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+grhAgynET2HJuSS/hEcyVcvO3EIqUK9GMOH81LnUc=; b=bWOL/F2DPnM5+F
	3uUmS93v8e3NqcGY3Xkorbg+mS/Ros4xEHHXl3wSogrHuRmeVG5ijmINILp4hh9gJK/u9n0ocPHkI
	QNFtftRDzMfx4qU+sr7OUzhZQbpjx2Z/SjXCsjhe/v2SttpgfqaiCurjPjGgbGOAmBT4EgvBEDfkI
	btz/6yQkaGYpmKNJn9UNEUAyotfdvrldGUucb8863kT/gxTHhex3Iqk0CBN3hXAj5rEmSQmPTYZSO
	AHkpwS9BeThDJE0nzAKa8pTRGeP/ffXbZqnjSNDKMdhp1UbW7MhFIUW33PvV4ZP4DynihXfH0fd9g
	oVxOQNghfV6JpqN6QkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqanG-00000002TAT-1ZEH;
	Thu, 12 Feb 2026 17:47:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqanD-00000002TA7-1hMV
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 17:47:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC7524323D;
	Thu, 12 Feb 2026 17:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4019AC4CEF7;
	Thu, 12 Feb 2026 17:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770918473;
	bh=63eALC78UAbwjHtNgvnNd25XAYb18N5UP5293tvCClU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKe3Ln0UIr4Hxfec1A3/xVtsDdcLvg80s4LuHq1oza0sSlEywXxtMmg9UkccIajiV
	 GxfS4/9ajVZrpziQlUerIPURVBOKjk03L2nh09x9SHmKBol0EYiYQNqX1/+Tp9Prrq
	 wrqtV8SXeFL/ZdrVYA9SY5b+PItDZ2oVz1z8bEXEuGSl9eRAR+GiOuJmUoyssTF0Kc
	 5UAGTesxrS/qMcqfvsgAr9a1YNRgZQl/cbcN76KRfRZGnq3y9kyT1V1KcxJLBOqYN0
	 oosjmhRXrsuwBl42QzUqfp8vQ2rmixIlsW18hhWrUnFXIqWDByOxslfjEm/swawxKk
	 Trn4Ey5jLcMoQ==
Date: Thu, 12 Feb 2026 09:47:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Jerry Shih <jerry.shih@sifive.com>,
	"David S . Miller" <davem@davemloft.net>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Han Gao <gaohan@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: riscv: Depend on
 RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
Message-ID: <20260212174709.GB2269@sol>
References: <20251206213750.81474-1-ebiggers@kernel.org>
 <mvm1piq9ron.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mvm1piq9ron.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_094755_486461_ABF3AFD7 
X-CRM114-Status: GOOD (  11.08  )
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

On Thu, Feb 12, 2026 at 11:34:00AM +0100, Andreas Schwab wrote:
> On Dez 06 2025, Eric Biggers wrote:
> 
> > Replace the RISCV_ISA_V dependency of the RISC-V crypto code with
> > RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS, which implies RISCV_ISA_V as
> > well as vector unaligned accesses being efficient.
> 
> That should be a runtime dependency.
> 

Currently there's no easy way to make it a runtime dependency,
especially given RISC-V's support for systems where the
"vector unaligned accesses are supported and efficient" property can
vary across CPUs on the same system and thus also vary at runtime as
CPUs go online and offline.  See
https://lore.kernel.org/linux-riscv/20251206195655.GA4665@quark/ where I
described these challenges in more detail.

I'd certainly *like* to make it a runtime dependency.  But the RISC-V
folks will need to provide a way to do that.  Part of that will likely
involve dropping support for systems where some CPUs don't have the same
feature set as the boot CPU, aligning with the other architectures.

For now, this patch was the only real option.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
