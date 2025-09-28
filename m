Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A299CAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLg/E1vU2ocqKALFuK/C2JzFhpzg5hmvpV9sr13dMsQ=; b=fVA/BLiPrHldqH
	7e9+Hk7R8aR3pzdVIJooFEt0D6MeBVOIdLhS2t75ZRKS8cFRQI3Wf5GCSKLAbVL5gIbs9QhyKGiFO
	HY4w5QJ4fzMiwfL32PpANeBlJsvk9EhxkZcq7dcwft2nwHOkttWsSyGyU0BKozZUdr9rlMJCnei/b
	lAknOpF5AC9n4ANOBPVR5MpLVV3Si4iMUQiz+gVrCuRgCzBZGg4sb7AR52rVmTNhZMwdHxeLxfmLq
	6/UeJ8ZC+RZGb0HDuVzv01ZsNDoiFCb+26/aBgR2vg3rO4FK9hnijnUWXC4y8O8IkS4FJnoxTaEdb
	Zyd9kBnNJFTyTgEe710w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2pU4-0000000FBgk-2Njy;
	Sun, 28 Sep 2025 11:22:28 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2pU2-0000000FBg1-1LtZ
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 11:22:27 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0147D3408A2;
	Sun, 28 Sep 2025 11:22:24 +0000 (UTC)
Date: Sun, 28 Sep 2025 19:22:20 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250928112220-GYC1346428@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927105616-GYB1338789@gentoo.org>
 <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>
 <20250928025400-GYB1330052@gentoo.org>
 <11BACC490411452F+aNjtSOiG31hX_hrl@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11BACC490411452F+aNjtSOiG31hX_hrl@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_042226_385089_366A0354 
X-CRM114-Status: UNSURE (   7.09  )
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

Hi Troy,

On 16:09 Sun 28 Sep     , Troy Mitchell wrote:
> 
..[snip]
> Okay..maybe I misunderstood before.
> I'll remove disable/enable the controller IRQ around PIO transfers.
> 
> BTW, the K1 I2C patch [1] for ILCR as the SCL clock hasn't gotten
> any replies in ages. Could you take a look?
stop complain, you have to understand people are voluntary to review the code..
and maintainers are busy, unfortunately..

btw, you've ignored v2's review, no response, not addressed in v3
https://lore.kernel.org/all/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com/


> 
> Link:
> https://lore.kernel.org/all/20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com/ [1]
> > 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
