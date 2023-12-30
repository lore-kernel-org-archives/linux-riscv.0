Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECBAC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 03:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPzR7pIJgXSgRI0AbnICyJXNET6pqOYUEoF6slnYbbQ=; b=o9oX99rpGvI5XT
	VeUqC9hX9UeNzmKBWy1V1spP/vRMdjp7e9JXTIu4q9u0P9cQWY3mn8gt1EFRZZ99ibdX3u8I761vj
	MIUm0/3tynwZZ74+PlijMjyeOUMN0qXMnGONjJQD4BJi4sovKdCRrttrxG8VDu9+ejiRtTrL1l52B
	PdTrXw0u/oFSXXN/GxsT/Q9+0iCN1kcs2UCBs+QDndzJ38NoTMEI4pyl5HKEbH14SOg3ckMoZHI6i
	iX90PHGu75TxAXZLOfg0RhywtFrVeIM+kDU3qPWepjq9eJ4ddK92wVynSXf3QPBzGlj/+fLpnquNL
	OW9rBtfp4177Bb8rIJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJQNj-0025wA-1o;
	Sat, 30 Dec 2023 03:51:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJQNg-0025vl-1f
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 03:51:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4FCC7CE1914;
	Sat, 30 Dec 2023 03:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEB4C433C7;
	Sat, 30 Dec 2023 03:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703908278;
	bh=VmHUTGM7aUkCwtaREvb2oEHYRyKp2dpYapW36y8fVsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IETRLd9/8x1XdEH6vckYtcj+6m+nrONX26HaiYsB2i/PwwV5wuZTrbBwkx4PRCVx6
	 8K6Xbp6W8MB0Ekuy/BH74/8uS72kXdb0MXq/h8epX1NzPPBuLTUHzNE0fTS8x7J4++
	 uiBypkSDkTJOoAiWOR35ew0lgAQHsGRZNol0/OPLr9cCU0hEVvj+ukH7yGUoRfQ+QC
	 YwUz1Pq03w52eiuLXxbrvziBLdzKz90cStOWIR0kBJYgAnnpiU3WedhDu+A7eMlrmG
	 ytmZa2mbxQYWpONhvooW/ChkHikK3W56Ii65Azg7IX4BdHGXXmkyvGqvFDmp4BKemY
	 dKW79xDOkzGdQ==
Date: Fri, 29 Dec 2023 21:51:12 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, conor@kernel.org,
	heiko@sntech.de, phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v3 00/12] RISC-V: provide some accelerated cryptography
 implementations using vector extensions
Message-ID: <20231230035112.GC770@quark.localdomain>
References: <20231205092801.1335-1-jerry.shih@sifive.com>
 <20231222054827.GE52600@quark.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222054827.GE52600@quark.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_195124_795012_7C69A0DB 
X-CRM114-Status: GOOD (  16.85  )
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

Hi Jerry,

On Thu, Dec 21, 2023 at 11:48:27PM -0600, Eric Biggers wrote:
> Hi Jerry,
> 
> On Tue, Dec 05, 2023 at 05:27:49PM +0800, Jerry Shih wrote:
> > Changelog v2:
> >  - Turn to use simd skcipher interface for AES-CBC/CTR/ECB/XTS and
> >    Chacha20.
> 
> If I understand correctly, the RISC-V kernel-mode vector support now seems to be
> heading down the path of supporting softirq context, as I had suggested
> originally.  With patches 1-2 of Andy Chiu's latest patchset
> "[v7, 00/10] riscv: support kernel-mode Vector"
> (https://lore.kernel.org/linux-riscv/20231221134318.28105-1-andy.chiu@sifive.com).
> applied, the kernel has basic support for kernel-mode vector, including in
> softirq context.
> 
> With that being the case, "skcipher" algorithms can just use the RISC-V vector
> unit unconditionally, given that skcipher only supports task and softirq
> context.  Therefore, can you consider undoing your change that added fallbacks
> using the simd helper (crypto/simd.c)?  Thanks!
> 

I had a go at incorporating my suggestions into your patchset, and rebasing the
patchset onto riscv/for-next plus the first two patches of "[v9, 00/10] riscv:
support kernel-mode Vector".  You can get the result from branch "riscv-crypto"
of https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git.
Everything seems to work (tested in QEMU, as usual).

Please consider using it when you send out v4; thanks!  I can even send it out
myself, if you want, but I assume you're still "owning" the patchset.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
