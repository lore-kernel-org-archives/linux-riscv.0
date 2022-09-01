Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831E4ECAAD1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBcDJRHPlOo/9NJNgEQKePOtpn9PUf570Ms9ZzkKwfQ=; b=ibhF4mCxYzxoY+
	eIUZgv5zOAukAZjUsTt2fx01iKfTWu+JxzMuQNHa1Ix9wMz2P3sCS35brOLG8km61zu0grDb2bADq
	3ddlKgGF63s2RsBdgtsYpVe+S4MmqkcTioECnE7Z4xhLqcwAbHyh74k9eaCxQOKuFz1FJ/yW/5BC7
	Ni+d5BBCe2/evDiODfdQ0ydBRVxYJ8dhp39SbKueCAzP4f2aDfhNHUjCWzKjyhUPFGOFcesaihpIL
	L3dNTkEY9IUGFVsMxHLskwM84i+9gM8nClFHnR6usL0zJv/X+zzQqv8bBo0lzN6QpbJ5VNWhWysYY
	87bQKO3v8MUwNt3a5vmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmZ1-00D5jF-Ti; Thu, 01 Sep 2022 15:57:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmYz-00D5hf-4N
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 15:57:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oTmYv-0005vV-MZ; Thu, 01 Sep 2022 17:57:01 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, anup@brainfault.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>, kernel test robot <lkp@intel.com>, Palmer Dabbelt <palmer@rivosinc.com>, conor.dooley@microchip.com
Subject: Re: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
Date: Thu, 01 Sep 2022 17:57:01 +0200
Message-ID: <4581901.fW5hKsROvD@diego>
In-Reply-To: <20220812154010.18280-1-palmer@rivosinc.com>
References: <20220812154010.18280-1-palmer@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_085705_216739_00B30583 
X-CRM114-Status: GOOD (  16.24  )
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

Am Freitag, 12. August 2022, 17:40:10 CEST schrieb Palmer Dabbelt:
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
> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

With Conor's fixes folded in, this compiles and breaks the T-Head CMOs
as they rely on that default value :-) .

Can we do the following:

(1) pick Anup's patch moving the block-size init over to cacheflush [0]
(2) apply this patch (with Conor's fixes and adapted to the changed
    location) and add this one additional line:

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index d4b1526538ad..67fa078f303f 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -42,6 +42,7 @@ static bool errata_probe_cmo(unsigned int stage,
        if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
                return false;
 
+       riscv_cbom_block_size = L1_CACHE_BYTES;
        riscv_noncoherent_supported();
        return true;
 }


With that done everything works (again) and looks great, so would be
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>


Heiko

[0] https://lore.kernel.org/r/20220830044642.566769-3-apatel@ventanamicro.com



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
