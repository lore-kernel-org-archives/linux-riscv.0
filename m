Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4370C61CE7
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfPa7OVdL3SBZK+HZwtLhgWj3xl2kMEjeIKospu5c+o=; b=1wCkrv36IbyJBA
	xFjYB5ID3fjbkSSoG9Ni7qdYenfNm2u1nnejhbYjl2t34+9HsynGitzRh1jZKf43GQI+fMSInCYty
	7OHDh4lNPa9dUDsYE+bCHfCj1xp48cqX2+pJIouRp0TFjXnQCVYfBbvJ4F6dTSgr/YR/8bHnbDkOb
	JyVP6cMQOF8zqyIWsZair655VISZpczD++WCDZflVpMKyRnngy6Y9BELYqis7f1nIiWFIqEZlurBj
	iTK24Td9P6suDLcoOiiqmnjn64sCtb6qxYHsyaZjsQSMBaeTFvDf+IMSbq6reMPWbDF6J4/ZD46vA
	JTKerCF6vzjqsQmKTRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPnX-000000039s6-3YK3;
	Sun, 08 Jun 2025 23:51:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPkn-000000039Nm-15kh;
	Sun, 08 Jun 2025 23:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 183605C5486;
	Sun,  8 Jun 2025 23:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECB5C4CEEE;
	Sun,  8 Jun 2025 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749426519;
	bh=PNJP4F4SM5CKWVi44F6XN3CvXe0mnkBMQtyo2ioWp6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOEtAeuZjpWvk9z46QbzwFTvSH+ljw/hQKIzEhZJx7YF2EwgrcI3+lI1VVKscms0d
	 m3qcoPnMMDVh4lKObwmfsWuGFAfWfD9VrvL51JeF8gEdf9j5e89zlEOEgaCwxiok5N
	 /aXy/hTwK0fEa7Z/G4j2/UPMcbFCWgXgxCUhbLoCrXwDNwOBWfrQbnnk/HZXwh/U2/
	 WnpIAIMFGu/oqqi+ROzvz89sXkm5O6vGwJ/PQ3JdxSPps11zhBrcyuDg/46eion+ad
	 2/v4rAxctCfEtqWu0G117hIgv+MXBMm76WuvxTusmww2Scut4P917GLHnfL8cwD0i5
	 36P1VSkTzVNzw==
Date: Sun, 8 Jun 2025 16:48:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250608234817.GG1259@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <aETPdvg8qXv18MDu@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aETPdvg8qXv18MDu@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_164841_337240_8ECEB2AB 
X-CRM114-Status: GOOD (  16.27  )
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

On Sat, Jun 07, 2025 at 05:47:02PM -0600, Jason A. Donenfeld wrote:
> On Sat, Jun 07, 2025 at 01:04:42PM -0700, Eric Biggers wrote:
> > Having arch-specific code outside arch/ was somewhat controversial when
> > Zinc proposed it back in 2018.  But I don't think the concerns are
> > warranted.  It's better from a technical perspective, as it enables the
> > improvements mentioned above.  This model is already successfully used
> > in other places in the kernel such as lib/raid6/.  The community of each
> > architecture still remains free to work on the code, even if it's not in
> > arch/.  At the time there was also a desire to put the library code in
> > the same files as the old-school crypto API, but that was a mistake; now
> > that the library is separate, that's no longer a constraint either.
> 
> I can't express how happy I am to see this revived. It's clearly the
> right way forward and makes it a lot simpler for us to dispatch to
> various arch implementations and also is organizationally simpler.
> 
> Jason

Thanks!  Can I turn that into an Acked-by?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
