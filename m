Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51289C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/t5MRc3qOVxNS5Jb1BO/RSpegist9WJ6MXhiJPZtJA=; b=KIzAz4KRNOjbiG
	TuNi115VEmNtXwZIV1puPB9jDQox52XtfDLHedePVp995lNftpLy5KuFdSEczUswfpoExLXPPCcAN
	45miEnv2CYWo/49KXXl0xZWaVJ/IdnpKV+qLu45jm8/L/kv1hwKpIdTx2ktfTREXe87vRhtbjWjgh
	BPFyfDrTOYj/S4q0MAyI5ohMtnp6p4PsAK+kJ0DDWi0C4PCXx0km7fTkEOfFileh3NMPtnV/M9uJ4
	vPEHsfuW1p3gvZpcdd8UeQb23abJs+qu1MPzbCsMi83LiieURqKBFaNKeGfNi/JpS6hvof2r3WX5y
	EG8lEXk3cDLaNI1c2liA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Zp-00000007YaR-1Pol;
	Wed, 29 Jul 2026 10:31:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Zo-00000007Ya0-38XY
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 10:31:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E16F4379E;
	Wed, 29 Jul 2026 10:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730A71F000E9;
	Wed, 29 Jul 2026 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321112;
	bh=WDcll2X4mfJ1x6C91gw/T6xgZXDCk4vzi+VVaCjZA6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VpF2YZYdhEHuZhuA2QCSr9P6niyM6E1ULRbDaMn9FdMXI19a0H+jMitMbzMAzCRJq
	 XyqkRdMVcScz8E+rw2moetKAqQ4pgoLgctNvXP0nLDTd78vJSnoTj4OisX75O5aFWe
	 8zlw83xz0wFMFIHyzHH16ZsQHUd9fSNabHkE8Ca/mwWWjp5yfLfMMO71fzmINb2Mwh
	 WdGvQcLhlbOzRA5Xae1NTCDyEZcEdftGqD7AebZXXWzix//vqo19RE4PX6vYYBKa4q
	 ji5BmdczgRpBPe6AXJLtqqxs5GJG0lRl+zy74TESVcE3GU8kQ7MehVj2dJkshjBfOd
	 T1aGqQhZWRn4g==
Date: Wed, 29 Jul 2026 10:31:48 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: spacemit: validate pins in pinconf callbacks
Message-ID: <20260729103148-GKI76518@kernel.org>
References: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
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

On 02:26 Wed 29 Jul     , Troy Mitchell wrote:
> Pin 0 is a valid pin ID, but spacemit_pinconf_get() rejects it by
> testing the numeric ID rather than the result of the descriptor lookup.
> It also fails to reject nonzero IDs absent from the SoC pin table before
> computing their register addresses. Check the descriptor and use its pin
> ID for the register lookup.
> 
> spacemit_pinconf_group_set() validates only the first group member when
> generating the configuration. If a later member is invalid,
> spacemit_pin_set_config() returns -EINVAL, but the callback ignores it
> and reports success after partially updating the group.
> 
> Validate every group member before writing any registers so malformed
> groups fail without being partially applied.
> 
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
The fix looks good to me, thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
