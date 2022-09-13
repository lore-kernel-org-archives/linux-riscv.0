Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FCC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 07:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0x5aiEAPj4ULor86xVWptmL5ofXq4bomb27P8FiSN4=; b=A+BWk0B+rHZ3fv
	88om4dLGOYFYKaeuAwqqJZKHC+E+UJ3ufP5C3blptEOY+cW3VgOmLGfUhIcU6fYFuFuXJ32S1oDNC
	zIEE8aWH/n5QH5jhzV16sgmfcNkRKPGoOlA8cY1S8HuInitDVUk0ARx9/srcibEDhAaEYRqMY0XPD
	mBjv2SVMzfnphfmJ3ieUIuB07PaH+fsy3FOo7/ME4i8RPTWPsw/Bdld2HuxGOE5rddO61O4OLliE6
	N41SgDG6aLUfEfSdF2kZUpJe1Q2JY0bSPp1oExnlm68nifH6JDs8TK8i03mCmP7gPNBlnhJaTSF1O
	Xn/eid7zn6Yj/xa9Tvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY05T-003PCa-J6; Tue, 13 Sep 2022 07:12:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY05Q-003P5P-S9
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 07:12:02 +0000
Received: from [89.101.222.236] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oY05E-0003Bu-4I; Tue, 13 Sep 2022 09:11:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: atishp@atishpatra.org, Conor Dooley <mail@conchuod.ie>
Cc: ajones@ventanamicro.com, anup@brainfault.org, conor.dooley@microchip.com, jrtc27@jrtc27.com, linux-riscv@lists.infradead.org, lkp@intel.com, mchitale@ventanamicro.com, nathan@kernel.org, palmer@rivosinc.com, stable@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4] RISC-V: Clean up the Zicbom block size probing
Date: Tue, 13 Sep 2022 09:11:45 +0200
Message-ID: <8114822.T7Z3S40VBb@phil>
In-Reply-To: <20220912224800.998121-1-mail@conchuod.ie>
References: <20220912224800.998121-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_001200_956889_A82DA3B2 
X-CRM114-Status: GOOD (  12.61  )
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

Am Dienstag, 13. September 2022, 00:48:01 CEST schrieb Conor Dooley:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This fixes two issues: I truncated the warning's hart ID when porting to
> the 64-bit hart ID code, and the original code's warning handling could
> fire on an uninitialized hart ID.
> 
> The biggest change here is that riscv_cbom_block_size is no longer
> initialized, as IMO the default isn't sane: there's nothing in the ISA
> that mandates any specific cache block size, so falling back to one will
> just silently produce the wrong answer on some systems.  This also
> changes the probing order so the cache block size is known before
> enabling Zicbom support.
> 
> CC: stable@vger.kernel.org
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: Heiko Stuebner <heiko@sntech.de>
> CC: Atish Patra <atishp@rivosinc.com>
> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> [Conor: fixed the redefinition errors]
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
