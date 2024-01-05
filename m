Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C731DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 18:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VymgmABTvEjxzxMM2B3MbzMZ7VX9kLjRfkLSRsmxao=; b=uZmsFOfb0YHQrR
	WxDGiqaEGNgJwD6g3HVpn1fDH4mDGnRoLLq20EJlxp6huyA1pDkf8upNjgn1alPo55/2rF7AS/oxd
	L10vEQ8pP/Gf85xgpOzi6IXrwhTXrPf0jYeTrM5Q6XEvbAkL4SygEkMBCIjiTiA003btoiK81aYCm
	VxYWD9vDJbSbaUWr+goW+WrCllsezupTFybbRSpvxWhHU1VGE0PGaU4/is0It3Xw7jrg4Q2KJ2goc
	KpXnq3vlA9SMMl+0ur1uaLH4BYIgFlwO/mO+Nh9WYs441n/Im+FyoVjDfUvQfLiAf4QmtJByOS37B
	T/wSdd/kWUTpjND8MVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLpPi-0003iH-2W;
	Fri, 05 Jan 2024 18:59:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLpPg-0003hl-1a
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 18:59:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BECC861BB3;
	Fri,  5 Jan 2024 18:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A06C433C8;
	Fri,  5 Jan 2024 18:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704481163;
	bh=m66kb204xQ4Kyq1bleg/I/TsSm18xBE2qxRfGZGPozE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRrVRuhn1af81UxWWgm2MXur66BTjtcoA3H+xL96dbH3W38Vami8GBbhGLbneKEpL
	 6dEYBdPEVQIBgkhjJA9nMouiY0mN7Mtrkb9f//Y2/85LqtXQ9UqStqzPisXu7E0/Tk
	 VuZgYalrtOmKAgBjQGUqQbj5t7nkAFdvaEYX58m2NJJ3dMTH2Q/SbF9htSv0MuDUv2
	 bv91WyBNpy42U00i+KiARuqncoRkIvxUuGndKWyUnfPf+XT7IVAHvEZFHLbq35hInc
	 xKC8X7u1IS3F0jPm/cala1RPjDu56tQCkAFNnA0CnauKkkASDVJ1eq+lHKM4ZPccaS
	 ijDDLvq/2Pb5Q==
Date: Fri, 5 Jan 2024 10:59:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, Andy Chiu <andy.chiu@sifive.com>,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com,
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org,
	tglx@linutronix.de, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [v9, 00/10] riscv: support kernel-mode Vector
Message-ID: <20240105185920.GA25631@sol.localdomain>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231229143627.22898-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_105924_572620_9514C8D5 
X-CRM114-Status: UNSURE (   8.75  )
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

Hi Palmer,

On Fri, Dec 29, 2023 at 02:36:17PM +0000, Andy Chiu wrote:
> This series provides support running Vector in kernel mode.

Is there any chance that you can take patches 1 and 2 of this series via the
RISC-V tree for v6.8?  The vector crypto patchset depends on those two patches.

Thanks,

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
