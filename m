Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCCBC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 09:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYqO9M8w7CqGXs8X7+uN//HPp82kiv/vU/t+CmkLvEE=; b=EGxZc1srmnGXPv
	imrWgL+Cr2vLWMedGDVGy3CvXaVkQRgdyzxqxUMbLhvrsBCJEGb9IJ1NjRqZt7WnqfwncTTOgQjSk
	nVT3m6KS6gJU139BXmSLHawfBkQHetzetsmCmGbA0Yf9BUVnlUohnI30AovVgXzWLXys2HpsFeNRQ
	LiXDIbpqAI2b37vyVR7jH49pMlmrgrQnW/6+a2D5execMqMMV1Mwd45tn/2DiPirv8jDZOA5jbhxL
	AakDbUu99iPaDVvb/T2p+ZWeMpLn97Rm7Hto1FX2yA4hv4myEY6Q7Wbjn8Ow04Aq0WaNGldv743xX
	grPM36iySQ8eI/NPKVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0od-00000007Pez-2BOq;
	Wed, 29 Jul 2026 09:43:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp0ob-00000007Pet-2aZd
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 09:43:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97CB260A5E;
	Wed, 29 Jul 2026 09:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F631F000E9;
	Wed, 29 Jul 2026 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785318184;
	bh=gAID/OGinxtFgFlPhsHRor54uCIhJClSpvnVsPSAhfg=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=N/QafSwOO2Ah6PDwebPgumjrBc0bKjuEGD80CVu02u29/3vRbP8rofdK5/GV5A2iH
	 tMGta/+4aErf/bvHSA3DQkV3aFercKNuxrUo5DpS+k0A9xoY4F+9hYP6S+G3bMuGyh
	 ilySaMNVvuuey+5I1sRSLWU6N3nsTt5XGyslI+wBNOnPUDcCevda5ERjKhMx704GXX
	 qPvbft+8KKLdTr4l2R3YG5hFmTzhrScNJ+qdxv7AUw9wWGVQsKuiLrg/bVNIwmmDvN
	 MVIU2zeqg5OMD4WBQ04TrlbhvV1GflRFmluVDeMINRTj8/E3JBRwLTmHcve2+4aKNo
	 4O2xAsdU7esnA==
Date: Wed, 29 Jul 2026 09:43:01 +0000
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: Add cpu scaling for Milk-V
 Jupiter
Message-ID: <20260729094301-GKG76518@kernel.org>
References: <20260728211020.1248676-1-aurelien@aurel32.net>
 <20260729013240-GKF76518@kernel.org>
 <amnJH7rsvbtTUheL@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <amnJH7rsvbtTUheL@aurel32.net>
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

Hi Aurelien,

On 11:34 Wed 29 Jul     , Aurelien Jarno wrote:
> Hi Yixun,
> 
> On 2026-07-29 01:32, Yixun Lan wrote:
> > Hi Aurelien,
> > 
> > On 23:05 Tue 28 Jul     , Aurelien Jarno wrote:
> > > This series adds cpu scaling support for the Milk-V Jupiter boards.
> > > 
> > > The first commit adds it to the existing "Milk-V Jupiter (K1)" board.
> > > 
> > > The two following commits add a "Milk-V Jupiter (M1)" board, by moving
> > > the common part, i.e. everything but the model name and the operating
> > > point tables, in a shared DTSI file. This file is then included for both
> > > K1 and M1 variants.
> > > 
> > > CPU frequency scaling was verified up to 1.8 GHz on the M1 board.
> > > 
> > Looks good to me, will queue for v7.3, thanks
> > 
> > Reviewed-by: Yixun Lan <dlan@kernel.org>
> 
> Thanks for the review. Unfortunately Sashiko pointed out issues in those 
> patch series, including preexisting high severity issue that also affect 
> the BPI-F3. I'll reply to the individual patches.
> 
No problem, I can wait for your v2 series, but may postpone to next merge
window due to time constraints..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
