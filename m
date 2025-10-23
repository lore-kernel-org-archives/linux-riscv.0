Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC40ACCD1BE
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wn5GTuzcmzF9CnuxeutLahs6DDXxdbQF2rRvN4f0Dk=; b=idf0UHbRFTgydG
	YCVXSFHmYB7Nmj1/PPuBvc5OL+tU+gmWKKpuCwsBXVVq/YTVtQjgfSl4v8rGMwQm0as6zZJNwIWGH
	hTkXjC4ERzBfc8jl1hXVRpwgs8lr0wKlcv5ryAW+G5H6uVfRWg6rWcvaD6Eo/iUW32x5XeVBvqmHT
	+FcQe2HbDoa5jIpIZFgqttNiJkX4PJ0QL2LY3GBagLu18NnLVih6ueEzwHPMMlXrUh01J99rwJmFF
	MLKuj9BH1GOyY7hb1QfWmXlLcfC8XJoO9gkt9MxpuG8q+WX663AHZW4salZDUlLo9MXUI3k5LvrbQ
	uL5Dhi5NlWRALuuNmeVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBseL-00000005vGg-2yCb;
	Thu, 23 Oct 2025 10:34:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBseJ-00000005vFW-3biV
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 10:34:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2240E43607;
	Thu, 23 Oct 2025 10:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2D2C4CEE7;
	Thu, 23 Oct 2025 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761215667;
	bh=EvgrZI+rymOOfZUCPqItc1VU/vONGS0OSWFKI/tUzDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRI5o5CEuyLF8Dsw/NHSiQH641JTHFRjyjRHMeLd6Ltw3N/WUcoXgM9nnD5zSct3L
	 +m1/CsyFgl0kAZeWmYT4WZVkOCsUe4OHX8G+c+f0GK+vmdra6BvwuoRmsTqaO4zK/7
	 l5jZ/+Lj1gu4cxqy6wfpwkhByYY2ax6WflUUzg4ihhcJgiHmJ8rtTVCR8247axtNrI
	 MC/AQ9p31JRcxevANJ5y0lskvzJW3DtGUdHntQ+tUhok2yvKWaHsv4RwfUnpUAbpFD
	 4G76lppLtXr4SBngcinr0W1lMWdAfBk0WndUTVk26yzEAFMuAUeShMgJKsoOsA+w4S
	 dW3FN/qYIMDtA==
Date: Thu, 23 Oct 2025 12:34:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <lr77avehdf3skwd5o2yur4hvbxhyx2spzve3wpo733l74ppjcx@mn34escjt542>
References: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>
 <t26pyjnmzj62oczwuje2bbscowj22pdge2ef3tcktwmhzpsq47@7odo2ccvc52a>
 <sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx>
 <748544ABF6A72D31+aPg31PBvHDkBALoa@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <748544ABF6A72D31+aPg31PBvHDkBALoa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_033427_936624_250A1F7E 
X-CRM114-Status: GOOD (  23.89  )
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

Hi Troy,

On Wed, Oct 22, 2025 at 09:48:04AM +0800, Troy Mitchell wrote:
> On Tue, Oct 21, 2025 at 06:03:34PM +0200, Andi Shyti wrote:
> > On Mon, Oct 20, 2025 at 11:28:45AM +0200, Andi Shyti wrote:
> > > On Fri, Oct 17, 2025 at 03:27:39PM +0800, Troy Mitchell wrote:
> > > > The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> > > > master mode operations is determined by the ILCR (I2C Load Count Register).
> > > > Previously, the driver relied on the hardware's reset default
> > > > values for this register.
> > > > 
> > > > The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> > > > frequencies lower than intended. For example, with the default
> > > > 31.5 MHz input clock, these default settings result in an SCL
> > > > frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> > > > and approximately 338 kHz (fast mode) when targeting 400 kHz.
> > > > These frequencies are below the 100 kHz/400 kHz nominal speeds.
> > > > 
> > > > This patch integrates the SCL frequency management into
> > > > the Common Clock Framework (CCF). Specifically, the ILCR register,
> > > > which acts as a frequency divider for the SCL clock, is now registered
> > > > as a managed clock (scl_clk) within the CCF.
> > > > 
> > > > This patch also cleans up unnecessary whitespace
> > > > in the included header files.
> > > > 
> > > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > 
> > > merged to i2c/i2c-host.
> > 
> > I'm sorry, because of the report from LKP(*) I reverted your
> > patch. I2C_K1 is selected by MFD_SPACEMIT_P1, so that we get the
> > following warning:
> > 
> >   WARNING: unmet direct dependencies detected for I2C_K1
> > 
> > and compile I2C_K1 without COMMON_CLK. Please, fix it and
> > resubmit the patch.
> Yes, I noticed that too. The issue is introduced by PMIC driver(P1)
> instead of I2C.
> Should I resubmit this patch right after sending the fix,
> or wait until the fix gets merged first?

I have reverted the patch. Please send them both in the same
series, where the first patch is the "fix" (or preparation to
this patch) and then this patch.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
