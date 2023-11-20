Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39261C197A0
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 19:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YgUDRx6+yxN8TsZbDrl3GXIb1zJwZVjo0Q17/s23B0=; b=U+CInWWzBpExPa
	+moau5zbpm1Gpa7Kzvs20r/GpxchMX6EXZBkTepn/z46nzzyipJMlEhSuDEZ1JDbKVGB6h88GHvRz
	WfxgxGAnZUY0UK5Nm0m1Rby1xIUH16w1LbEvCWkyTOQnK0WXpylbmCgOIbdxP8ljWJOIlx5UKBs21
	pisEszRBB5yJAAi3TZkTTpssYUrW4q/0QYDrhs+JVCJhTvvV+CW9DR26srJvUOpEvY3kpDvpPMSR6
	Ff38j8z8dy8WdhoRmrxsCg6uaMFTKNCgXvTWzYyEfImmFki4JM3Z61T4iN0qJ65vsHZY5Pjly2AHa
	rG9V++JA5Ab0aRpnbvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r59wM-00Ehdn-2H;
	Mon, 20 Nov 2023 19:28:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r59wJ-00Ehd5-2R
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 19:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2ACB8B81B1F;
	Mon, 20 Nov 2023 19:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FC7C433C8;
	Mon, 20 Nov 2023 19:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700508484;
	bh=D9xGetJBsZnX1EJOaSpAcRc2P8I2rT0kE7jgOjR+FqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9jDPi+dvngrxY4pnMjeT33brWQCVXkZfXA7MT1UUq8PmeWrCSwP1hJWed8+A2DDM
	 86oYWF6ArCAm1awiKjyewwtmI1MtTJRCs8mi1tY19UpN4LAx8/gkf0qvKQD6bhs1P4
	 IlO8/GJQCSS56lObJxhM3+IdURCjRn6QDNfoMwCxLYkSYl75TKLaSc8bgo01hn6p0C
	 HK9okuAbttEQEa+uMxH5ge0TrGqN6gWuezVceBwwtYTnRFcnnwuVhFzwZRydcCeI2w
	 xmP5RzEn8lZTWZ5eqx9ismJjW21Jn6s3rsRfIQAhhDnJ0ffyFz5p/gFtqtLE7dDNk3
	 omZ0xyb3++HpA==
Date: Mon, 20 Nov 2023 11:28:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, palmer@dabbelt.com,
	Albert Ou <aou@eecs.berkeley.edu>, herbert@gondor.apana.org.au,
	davem@davemloft.net, andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated
 AES-CBC/CTR/ECB/XTS implementations
Message-ID: <20231120192802.GB964@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain>
 <267FDF51-7720-40AC-9416-B5361C45393B@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <267FDF51-7720-40AC-9416-B5361C45393B@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_112811_940486_2AD6C636 
X-CRM114-Status: UNSURE (   9.22  )
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

On Mon, Nov 20, 2023 at 10:47:29AM +0800, Jerry Shih wrote:
> > There's no fallback for !crypto_simd_usable() here.  I really like it this way.
> > However, for it to work (for skciphers and aeads), RISC-V needs to allow the
> > vector registers to be used in softirq context.  Is that already the case?
> 
> I turn to use simd skcipher interface. More details will be in the v2 patch set.

Thanks.  Later, I suspect that we'll want to make the vector unit usable in
softirq context directly.  But for now I suppose the SIMD helper is tolerable.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
