Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1817BCCD1AF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2EZDLEhtZHSLj194LZWvkwZspnN/Fl/FXA7/snRUpM=; b=vBnUZxjY98hxXs
	IpvWinNDgZ8cLpJmuzeJ5uKt/6cIjRZ2KP7Bc7QE8pfq++FL5c4Ko+1QgbVGNAzfJjf8ZYI9cTxiQ
	WylR3zlK0i9NN2a5b4V9/R5kdQz+MIeN/wrtv59Y0U1X7mjOxh72AbhqjL5oOPKwI8rLC/0d7GLdd
	PTjjZux9PurKzIV6aLWEBYN6En57Go9pJCG7nEL5aK5DCoSwUiyfoKDiwwYmH/Yxq5qfpslcKRZHM
	tcViM7ILB1v8sx3bDQcUyH+SAsjZfu17NhAIL4wZBNS62zJ0iC2BTHwP01FQ7XvSQ6ibQeNj4xkV6
	xUYfOFjZExTTYPwpwsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEpn-000000002hk-31Xt;
	Tue, 21 Oct 2025 16:03:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEpm-000000002hb-3P2T
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 16:03:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED2E16252F;
	Tue, 21 Oct 2025 16:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27765C4CEF1;
	Tue, 21 Oct 2025 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761062617;
	bh=zoulm8EJmHkp5upUtaKeojnxWqc+0aK6cJfLOtxU50w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJ7ImcdNqkvgbz/NjNhcAVJX3kDtbZQM9JuSFDwKztdNqFiQIWb5iLKwmjzbrQW9Q
	 xKtpRev8etsG/CLdiNGOMNcyVTDxNPoE91iYm83cw5ynjO1Ey3rPRYnYOzqgmvSlWd
	 iPEARZLqjbyCAObZTGNtIT/fXkvfACdMk8F/zhf10Zm8kfoOZmmZUU36Gy4gnJI7ax
	 K7Br4HxvlX7GAOml1zyFc72yqYaOG3fwHk1UyF7Sj+nTBmuDeuuKeX+vTkLMneclwN
	 aXN5P2pXQRKRTQHf8gHq9VT7Dld5EY9tFCz0gahJeXjKRIYgZNtssG/SmLlyzqdbMg
	 UvlubZmRdNhgw==
Date: Tue, 21 Oct 2025 18:03:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx>
References: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>
 <t26pyjnmzj62oczwuje2bbscowj22pdge2ef3tcktwmhzpsq47@7odo2ccvc52a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <t26pyjnmzj62oczwuje2bbscowj22pdge2ef3tcktwmhzpsq47@7odo2ccvc52a>
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

On Mon, Oct 20, 2025 at 11:28:45AM +0200, Andi Shyti wrote:
> On Fri, Oct 17, 2025 at 03:27:39PM +0800, Troy Mitchell wrote:
> > The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> > master mode operations is determined by the ILCR (I2C Load Count Register).
> > Previously, the driver relied on the hardware's reset default
> > values for this register.
> > 
> > The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> > frequencies lower than intended. For example, with the default
> > 31.5 MHz input clock, these default settings result in an SCL
> > frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> > and approximately 338 kHz (fast mode) when targeting 400 kHz.
> > These frequencies are below the 100 kHz/400 kHz nominal speeds.
> > 
> > This patch integrates the SCL frequency management into
> > the Common Clock Framework (CCF). Specifically, the ILCR register,
> > which acts as a frequency divider for the SCL clock, is now registered
> > as a managed clock (scl_clk) within the CCF.
> > 
> > This patch also cleans up unnecessary whitespace
> > in the included header files.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> merged to i2c/i2c-host.

I'm sorry, because of the report from LKP(*) I reverted your
patch. I2C_K1 is selected by MFD_SPACEMIT_P1, so that we get the
following warning:

  WARNING: unmet direct dependencies detected for I2C_K1

and compile I2C_K1 without COMMON_CLK. Please, fix it and
resubmit the patch.

Thanks,
Andi

(*) https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
