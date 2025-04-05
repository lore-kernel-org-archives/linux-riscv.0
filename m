Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846C5C36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWTOeE11LINl58Sd/i06w9XNMvzND7BFfkBW29Zr11E=; b=EjQFqbObAMMzWq
	BgqWyKY2/gAw3IR4Z12AGsJ259RBFbBAi1Pm3MnLAfnd4aHASEkT8ET9g1lbij34z39AI5+NpGkMu
	p28U+LXxp5LxYsmo4Vc3MLWCXrIrGoKcpv1zKkw/0lvwlSx2dOb0bhaQdIPbHu1XdPxzVydA+dGGq
	4KUtrCuW33kmsQVjqhzWhlV9lSfbMZZ3wTg9oN6bv9cF7/JGT1MueFFfx1PkMZNw3KTLE2o0otx2V
	p9Stb/nARXAicCVp05JjuFTzYRzz6otiONSdeVQO40bsGaJ79k7qHuWFEYMXxOxGR5L0vpR7QEA01
	9N1sHHBxX6Givy3loA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0y5c-0000000DdOO-0dNT;
	Sat, 05 Apr 2025 07:37:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0y5Z-0000000DdNx-3J7p
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 07:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6631A40D9F;
	Sat,  5 Apr 2025 07:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B39C4CEE4;
	Sat,  5 Apr 2025 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743838632;
	bh=SMWsKryjlEudisI7vSbfFoDtNgIR3H1MEF8h/a/GMKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCbfqK1UEhEtBfJLZTRQOJcyActqHfTLGkzrpSYdkqkLLEG2U1qCgTNKJlJlxsej5
	 vDaCKOHPz5OWgjTqpxlsTxqlKfIEs5Swe4Wnphp7C8gMD9fl8YVOrqwVOjgPtXfIv8
	 9q0GRVYPDs2sE1CFy69gT+9x4VqFQ0wDRVue1egw=
Date: Sat, 5 Apr 2025 08:35:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, jirislaby@kernel.org,
	john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pmladek@suse.com,
	samuel.holland@sifive.com, u.kleine-koenig@baylibre.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <2025040553-video-declared-7d54@gregkh>
References: <20250405043833.397020-1-ryotkkr98@gmail.com>
 <20250405044338.397237-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250405044338.397237-1-ryotkkr98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_003713_888417_4F154E18 
X-CRM114-Status: GOOD (  10.39  )
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

On Sat, Apr 05, 2025 at 01:43:38PM +0900, Ryo Takakura wrote:
> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
> The register is also accessed from write() callback.
> 
> If console were printing and startup()/shutdown() callback
> gets called, its access to the register could be overwritten.
> 
> Add port->lock to startup()/shutdown() callbacks to make sure
> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
> write() callback.
> 
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> Cc: stable@vger.kernel.org

What commit id does this fix?

Why does patch 1/2 need to go to stable, but patch 2/2 does not?  Please
do not mix changes like this in the same series, otherwise we have to
split them up manually when we apply them to the different branches,
right?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
