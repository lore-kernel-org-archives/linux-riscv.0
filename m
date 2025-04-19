Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D36C369AB
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 02:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJjNVRntxEGmHFCgBhhEA6mrWXGtkYATv9UTv3r0CsU=; b=idJ6OpuZiwLaIP
	jRFhPbo0BYpU2WipudmV8BlHO8jL75uf7mxptw9gp4uEGgQdYzoSS+t7ZmZ7VHKlMDejvZfKO/xDv
	CB6IRa3lYILV4Iqlv0e0i5P2IGkW8tem9uIUfMmzbYc+DrTcQMONXGbiOkLFQ/K4yTfkTcGK5ZCyq
	xbjB2Ez7o42x6samN2HYB0VsBoMFm22z4W5BOTpkYLXBIZRIOtKxV/YuVKFF7zxNRgBAUmhzAnysS
	F0iLBtA8QMLWbCxw2MZlrYEa/Zt+53mpiUQUfPEVN148O32LVYFP2d+vb05vM5BjYCMexPPE9VQoy
	W2PI6woHZNjsinB2RF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5yAa-00000000jId-28Cc;
	Sat, 19 Apr 2025 02:43:04 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5y8i-00000000jAV-0Tzz;
	Sat, 19 Apr 2025 02:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=N71ulJFC7EzRy4IJC7JSkf+9aBSGBV5BXmKIuPUJx7U=; b=rmQd0n5Ffd7wgXc5CRfMsYvfej
	vy0M0uiUROHxK3PxU1ELCUZ55bqRS7IKOzdkIx2x/h3kf6i7ueq2uF2iXk+esRyER676Vn8nn6HPl
	/EUIRrt1qKRpgU7dPHA+0/rAdhZq8SqQqgwdPs18fXqmj5Vc6DfqBTMqCH2VeKeOqjtpsk1uVQdTB
	7C97E7AWZ+VRMuouNeTm66I/v/5mhb++Kjp8acKAz23ZX1T1sTBZddTZjuWyEHiOyEpxbSEZiqzYd
	8FLG2KSwbrYBgiH88lXTv2vFiWUXkF2HqN7hW+YAXzbLMgU3rYK+eiYH+SBvpg8M1ru6r24TM8ix6
	GC1QefCQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5y8W-00Gtuw-1E;
	Sat, 19 Apr 2025 10:40:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 19 Apr 2025 10:40:56 +0800
Date: Sat, 19 Apr 2025 10:40:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAMNOJa-xcxLrmgX@gondor.apana.org.au>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
 <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
 <20250418040931.GD38960@quark.localdomain>
 <aAIMhLD3UMM41JkT@gondor.apana.org.au>
 <20250418150149.GB1890@quark.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250418150149.GB1890@quark.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_194108_150417_6D5916BA 
X-CRM114-Status: UNSURE (   6.91  )
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

On Fri, Apr 18, 2025 at 08:01:49AM -0700, Eric Biggers wrote:
>
> Doing it as a follow-up when this series hasn't been merged yet would be kind of
> silly, since it would undo a lot of this series.  I'll just send out a v2 of
> this series.

OK that's fine too of course.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
