Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB87ACA0EDC
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 01:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQTRr2bfm7bcmLZ276d/juNNVEis69Tj+r4eV7BJ9ZM=; b=q0hQVxmCPThOfh
	4OpwdG1Vw4//wU9y/vYfAWJu8/lD6g0M6Q/BEwZRH4D68RvOCvsqRrXR1fgZ4BcSFEU+HPVwKDUWy
	QN74l/FFTHfRq1BMuWRaUUBtBNuYqVjTHS71X6dc4ciiUSTqVUmnEbL38HTXAe8t95TZELG1QgKYG
	2b0sOxFsHZtRa0c6PtRiuB9RKJxL1PvgERVtS0TWSsXRaeyra6GTHZ/VxLJMLssU7kbUEcJkzASpe
	kSBFrfGsKTnFWTzxMb2W5MvojkFb7dOhUF9akLFb7BljcziPfdhCrx+7MZ9TA/Liy9nejmB3WZdUC
	eNTKNx12k+JtWKiTbFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umium-000000010F2-3cwC;
	Fri, 15 Aug 2025 01:07:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiA8-00000000sFA-2Xvt
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 00:19:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6B895C664A;
	Fri, 15 Aug 2025 00:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3238EC4CEED;
	Fri, 15 Aug 2025 00:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755217155;
	bh=g4zR21hNRbpIwW2GjR4PpTESla0shxBvfcD4TLxCbgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kd73VYw0MpCR4rPM18k9+ZktOhzAEjAUwD1o8+Fe6aPeWrMhI1AZwI0YZvijEZy8c
	 fIiewGAMhP1MPHIXrCt2fbHgPm8P616BSrRfUptBE8iCnanb4v1yJRSbg8klLocbi8
	 UpenqMDDDJBI97YRl2wpQn/HxQPQElh6IeoTiaS9IxlLmjLcVzS8jqfAcKWiAOBz+Z
	 FX+J6kNwaChIWnBSokvk+FKXB9J1hZzAamhiBG/nAy3NInMS++71/n7lUq8XXIdg++
	 V965Neoi4auIKv6LnymCAB15UyDqBG0ZxcC77/ogBns/5F5svd6x51x2um7UuqagQC
	 +AiIUSXjUYkbg==
Date: Thu, 14 Aug 2025 17:19:13 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: thead: add support for enabling/disabling
 PLLs
Message-ID: <aJ59AfgQNHUpMM7x@x1>
References: <20250813072702.2176993-1-uwu@icenowy.me>
 <20250813072702.2176993-2-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813072702.2176993-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_171916_685740_103BA866 
X-CRM114-Status: GOOD (  18.00  )
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

On Wed, Aug 13, 2025 at 03:27:00PM +0800, Icenowy Zheng wrote:
> The 2nd control word of T-Head TH1520 PLLs contains a bit to put the VCO
> into reset state, which means disabling the PLL.
> 
> Some PLLs are put to disabled state by the bootloader, and the clock
> driver should be able to enable them.
> 
> Add support for enabling/disabling PLLs. PLLs other than DPU ones are
> set CLK_IS_CRITICAL to prevent killing the system -- they're meant to
> drive CPU or system buses (even the GMAC/Video ones are driving arbitrary
> buses).

Do you think there is a way in the future to allow disabling PLLs for
run-time power management?  I think it is more important right now to
get hardware peripherals working upstream like you are doing, but I was
curious if there is the potential to do something more granular in the
future.

> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> No changes in v2.
> 
>  drivers/clk/thead/clk-th1520-ap.c | 38 +++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 5 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
