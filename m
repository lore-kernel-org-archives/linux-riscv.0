Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D10C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p90isEW46b/p2ojOKP+9T4ZIcWQFPAVRAJ3sEYoesyQ=; b=E9Qx4dnzhxs4Ty
	tdRbOhr9nDDIOA/xAVulQ7QXxWv4Q9l/QmTt79nqWzYhaDt6PktGIGo404/KMUoEBuGn3p/3Q6HoN
	FsoXtjNMZz8rgWintfzMUe496isB9TTWPQIgCzmVU0ZLyquezw8VLDpMLV0tVmikfWJCIJNc82VIX
	tkgo9SnOv1PqdU1ZFXrHCRRHvNmsKPPUwvKIKIEqQE3UlvMp/NUjn9WNOR4RAp44UJdFG6T+TyNCg
	LBvSiTd2sgkU6NCdpVy3F+2MFmE6DJPXDBRbaIN6MsYZiL5D6CFNe1WBSm0ubema5S5ID4zMlD2Hz
	JiGaTMu0d9wZ74QlB21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0gN-00000007O0T-1sZx;
	Wed, 29 Jul 2026 09:34:35 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0gK-00000007Nz2-2Vbx
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 09:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=ITBzCiYFggLZSp8ukd13GDp1HtfOO2NZFOp5MB2pVow=; b=kdi/JtthPnX56uF4eH+kuw5eYD
	trqbHxfHmfj2NHpVtUVcW1YphSCep8WEl67mFZw5GgO9UpV4+W1D3EhZULM7MIsA5zWe+CPaAkAH5
	0CmOMqf66GM0nECNm8FNlqNbe4PKMqjllXwCBnpAnfmSS8quKSz+rm9OfOiLtH/vLATqMi/6ucNyv
	m6APXjKGTpNxUcruAr+6x8gsWY2gxtVzdpAZ/Bs5m3nsvkzorNdB0SZNnTcCXXPkOlDx6q1W55Ju2
	RVedMHyvQGiZ9eDnyKJR3AqoARyxiWh0Tz8A2QTWWmlvd0rEVGVFkaatlzu/2S1xytayblrXXJGvS
	knDAuHGQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp0gG-00000002JWq-0fjs;
	Wed, 29 Jul 2026 11:34:28 +0200
Date: Wed, 29 Jul 2026 11:34:23 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <amnJH7rsvbtTUheL@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260729013240-GKF76518@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729013240-GKF76518@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_023432_637437_2251849C 
X-CRM114-Status: GOOD (  12.45  )
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

Hi Yixun,

On 2026-07-29 01:32, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 23:05 Tue 28 Jul     , Aurelien Jarno wrote:
> > This series adds cpu scaling support for the Milk-V Jupiter boards.
> > 
> > The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> > 
> > The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> > the common part, i.e. everything but the model name and the operating
> > point tables, in a shared DTSI file. This file is then included for both
> > K1 and M1 variants.
> > 
> > CPU frequency scaling was verified up to 1.8 GHz on the M1 board.
> > 
> Looks good to me, will queue for v7.3, thanks
> 
> Reviewed-by: Yixun Lan <dlan@kernel.org>

Thanks for the review. Unfortunately Sashiko pointed out issues in those 
patch series, including preexisting high severity issue that also affect 
the BPI-F3. I'll reply to the individual patches.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
