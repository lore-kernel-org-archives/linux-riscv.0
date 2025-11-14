Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB11CDB480
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 03:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBUgcU9grO4NHY5rwrG5boZjsfPiW+raMZ/pimklaoY=; b=BNXYRODr3Nldn/
	ACrogKktBUSmBgnoB1i/kEYa3tda+rxKZ72Ym5jfk5VEAd6HB7Q7fG9MXWQr9CJipZQSmWcDugllj
	aTkHLg10J4IHWYmwTc7H9kvVJxhw4/xmzBE+nEqGtG/8ml0Zc/UvcTEXsK6Lnfn7yUrIRWZTe9Ghk
	vG8zRYnaI5TFw7smwt5IpF2627kBdbMRKuZuHeMyc+S81ihpcZbtrOW3pr941BGfJNMh4U+CZPP7c
	rEMuURvanPbCHLhXICGtsU2OGNBbtXFBWlFWWzEric1xrG3RIraftfAkkVH2i04IEPOw/GYziR0bt
	5TRiX5fS4slHWxJmMdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkbe-0000000BUc5-2Izb;
	Fri, 14 Nov 2025 03:36:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkbc-0000000BUb8-31yH
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 03:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C30F4425A;
	Fri, 14 Nov 2025 03:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1270BC2BC87;
	Fri, 14 Nov 2025 03:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763091371;
	bh=r8TKIB45aMDi3ryZ+DZqTIm3kPWTh7/BSnelWP8mN3g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Nh2D/2r9q0X5Yt72wb3vtGJxRBe7jbWsOJrjHSQjBxLxmPwiGiObkLys7w9r4YinH
	 iBLffmB6mPXZ1mW45/DmiVj1ck9asbKfHcWa0tSNrfQmkjSsAbkQIOixs6SutYMv8U
	 yUh2btWgHdbss9eEfBYMxCQODH6oFug5JzadwejI6Lapk113pnnrC2cJxzmnGpIUVw
	 Ej+eefYjIhfbSYut0c1YddMoHbVPzEkv1u0QGYUcJTST4uvFsXVtXc92WVzJJwMHym
	 6E7OKsy3Wm3pWLdzDowh8P+P1ugQQlFY9hDTDHDUImwx2uTtem+2ufIbnfOvX8JcEs
	 HALc4s4EORbng==
MIME-Version: 1.0
In-Reply-To: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
References: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
Subject: Re: [PATCH v2] clk: spacemit: fix comment typo
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Encrow Thorne <jyc0019@gmail.com>
To: Encrow Thorne <jyc0019@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Yixun Lan <dlan@gentoo.org>
Date: Thu, 13 Nov 2025 18:20:02 -0800
Message-ID: <176308680236.11952.8317865187541221730@localhost.localdomain>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_193612_783655_EAAC88F5 
X-CRM114-Status: UNSURE (   3.93  )
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

Quoting Encrow Thorne (2025-11-11 07:50:09)
> Fix incorrect comment to match the filename.
> 
> Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
