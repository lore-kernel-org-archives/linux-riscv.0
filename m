Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57CBC02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 07:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRa5XUeDmiDmRq2RoxTAFSTVlrj5ZI7slxMPZoYk5No=; b=RYJxwyGpcYKb/n
	TwO51Qi0Txnmhgt4Sez/jYQCGFN/kQD3RCZuEswqQCHf3xc5N88mgdeL1t3uSgs9QQblCa2wyhS6C
	ntv9pIy1Ukj7Jq09CntJTxYnkLZ8b1WC7qj43i0ObRYuJ2DmE2fzxvxLHmqmoL0NcPdSlK7X2xy5r
	/y8wnSSHa0n2XF+4vf99VcrVWW4nPk10jHCy3ukksV/BhR8+b+t9t7N+wNNpyDcZwAiCCyYk08ZyS
	X7HiMghTogzTBVhNbw8stVLoONURk7uhYDbSNh6DoscsyepcwW7sOZoHY8DPcAsMezNcWU5bq/tKl
	qLZnYutYMDtagShe0G+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxq9-0000000AwL8-3p83;
	Wed, 15 Jan 2025 07:29:25 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxq6-0000000AwK0-281z
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 07:29:24 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id B8D06122FE26;
	Tue, 14 Jan 2025 23:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1736926157; bh=6nZ7MSfskgPOfJaGxHTVHLkypF/3zP7VLSUDpv6jkFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrqWg6vRcCsCxus4T8JQ7/eNQZkjzrtfZy84Nw0CZVTvUKmKv+d7mlYnMmAE0JaXF
	 HdV4VdMBuOep40wnFqi6PtmJSclZk7s64Ngg0+sh9bfzcuDms87f0NofE4uqr/1lQ/
	 iX7nIAmlr2ku57/79ltk+WuYIInmNUJBucrNoxCPFbP3slj8wwFKE6GY51QleULCXS
	 3F5yQzdDpG1naRTm159aj6a1jMdM71cUw2r5Hn0gcv7f5xFgAzAYzprGD07+Vcrr4+
	 zojEeuXfQVP26WeyzuSbSJLjjg2xHVqOLkHBo6bqWppIy3fGT/UMWvPx4bcW+AsPWf
	 4Febtcv1IupYg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jdWJcIIIEqu; Tue, 14 Jan 2025 23:29:16 -0800 (PST)
Received: from ketchup (unknown [183.217.83.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 4CE85122FE1A;
	Tue, 14 Jan 2025 23:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1736926156; bh=6nZ7MSfskgPOfJaGxHTVHLkypF/3zP7VLSUDpv6jkFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0NMRBc5R6vRo1jNMVN18tfgamNJHbNzBtBK713yGo92DK4NIY+Si47vQS6LVXnMb
	 83ntH91xItw2OjCTMGkzLG4L3Y5SppI7fX/np0GPuxQc+Qw6KTbKD2bdtZzb0dLg7n
	 D2LVOJa+cVqvJ5ewscDV7EEJiN0vYp5Hd+5cQ+X9HpQKzxk4KIT6BdjaiRad+u3YNg
	 oB0H6C9d40F06xMmhxIDVF9o0TowzRKEmBQpwEL4/s0YKMGyrl+J5wcRTQFPslltSF
	 B2Xc6CiFcw+Maz6W4VRUYYzBsRGVabPLQ3/ZDROODVUjnbscAqlhNWA0gM7RelzAAU
	 /TTFj87psIw4Q==
Date: Wed, 15 Jan 2025 07:29:00 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: spacemit: Add clock
 controllers of Spacemit K1 SoC
Message-ID: <Z4djvOcKuFhYbfKv@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-3-heylenay@4d2.org>
 <coyp227rh643slvrrtlls6zc4r2fgvajrvsw63xpyxno7b73wy@cvsjtsghmnx4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <coyp227rh643slvrrtlls6zc4r2fgvajrvsw63xpyxno7b73wy@cvsjtsghmnx4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_232922_867163_4DA72ED4 
X-CRM114-Status: UNSURE (   9.96  )
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

On Sat, Jan 04, 2025 at 10:58:54AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 03, 2025 at 09:56:34PM +0000, Haylen Chu wrote:
> > +#define CLK_PLL3_80		32
> > +#define CLK_PLL3_40		33
> > +#define CLK_PLL3_20		34
> > +#define CLK_APBS_NUM		35
> 
> Binding looks fine, thanks for the changes, but now I noticed this
> define.  Please drop. Number of clocks is rarely useful as a binding and
> usually leading to ABI issues.
> 
> Same for all other clock controllers below.

Okay, will drop it.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
