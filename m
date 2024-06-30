Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A65C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jun 2024 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cvfio5ZzIthaTDBCJ78pUoeg0PBsgWPHzDn+o/lbsNk=; b=cUYVaGKvKBUKZB
	or17cSNqKkjm/KYozGt/4J96DNknFVPaiWhCBC8nt0wqd/m63rFkxR3MAYRWADQOix3Qsk5Lhm2la
	r6V6AvYxNIbFO/GtHCFndP8Hym7g0rR47WsHSGpB32K1QZEXjuYiu0lkn5Ekw2+4aCeaLZ1ceyyN3
	UZFcU57ae9grdj1yWXiGRc53JW9kW+csrC9hK/6q7np/ChWr3oi9TWVG7AbCOvzD3ozRBUEj8QKTB
	/LWjkLOXam0GRdKAlb64VuystVnLdpUQ/lfGwceD1UqdiY2dVRvlULZAlgDtKyp5hot/RnH9+r4o9
	+HGLlRHpJeGFf9hxlcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNw8a-00000000ZlV-2BaN;
	Sun, 30 Jun 2024 15:06:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNw8P-00000000Zip-1QKK;
	Sun, 30 Jun 2024 15:06:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7F1B60E2C;
	Sun, 30 Jun 2024 15:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A87C2BD10;
	Sun, 30 Jun 2024 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719759990;
	bh=c+JK2VSNQ31PnD2iQNuRuQbry+DoqeD124arYuJ+Juw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bEV6mBHYlCdS2EsLB3+1Z+jegmRJYISn1E6aJWP8DJf7/ZDu7B9YbhsWuL4L04Tki
	 rDIus2kqQ9Vzk6hQASgX42OhzRpJIa/jkeF3GPzgwTVdVrWtFuMXKCCITnd89CetSz
	 bx8lLyu32y9LigNdM5B71TKlRPHfGEKpwJDDqIf5ofQ06fprpfoQUtdLnusKwOkLR4
	 T99F4w6aSaZl6oXo3CVPuMbmouJvyDoFpYZPRCE78XL/W4KcURso2ThVuP9TsupsV6
	 T0XhcUN6IC8azj9sFxEhrjg4H0FdeUrKDZySdOOeX3L708xEwYCARQpOVaPCKGALel
	 t7JWg5vj6ugXA==
Received: by wens.tw (Postfix, from userid 1000)
	id B90A05FD47; Sun, 30 Jun 2024 23:06:27 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] riscv: allwinner: ClockworkPi and DevTerm devicetrees
Date: Sun, 30 Jun 2024 23:06:15 +0800
Message-Id: <171975990845.1182816.12708794418763846620.b4-ty@csie.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622150731.1105901-1-wens@kernel.org>
References: <20240622150731.1105901-1-wens@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_080633_498550_A0B47E1B 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Chen-Yu Tsai <wens@csie.org>

On Sat, 22 Jun 2024 23:07:28 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi folks,
> 
> Here are a couple patches that were originally sent by Samuel, but later
> dropped due to the system LDO regulator bindings not getting merged. The
> regulator bindings were recently resent and landed [1], so now is the time
> to get the rest of the stragglers in.
> 
> [...]

Applied to sunxi/drivers-for-6.11 in sunxi/linux.git, thanks!

[1/3] dt-bindings: sram: sunxi-sram: Add regulators child
      https://git.kernel.org/sunxi/linux/c/3a6fb9025cdf

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
