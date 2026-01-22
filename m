Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4493BD3EE67
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCFKLv2k0kxZNgUzu2Ff01JVtTRk70sXHUod92U+/mc=; b=m7EYkbjZ4+hMSN
	oBGVW4fzI9zGlobIQzmAsDIw/10beHPpHHZoiW2Hwf/hXuBjkgFZ0GK+yf23c7HZi9j7ppALLmXi/
	iL5xyCsUb7i33QRHC6OzLn61L0meeRMFekN6cePoYeP0buRRqKT3dCnc/bA4aCGoieFrZio0PH83s
	+PMirxl6M6XWqm4QPFHgOF4eG7wN0Zykopv2saEfutZfbtyfk25VBchMx1xuV3sPB9LfrpQRwRTze
	qi14GcuHT1H28jpHUUM9gII4GWc2nH1jDLCdHQjPZelA9DIZ/1PjnGwiLzbMWgGmpFyhwjNtzeBp4
	YuakddcXClP9hHBINWVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuwf-00000007AQU-40Gd;
	Thu, 22 Jan 2026 13:41:57 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuwd-00000007APy-2UwE
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 13:41:56 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 94C24341990;
	Thu, 22 Jan 2026 13:41:49 +0000 (UTC)
Date: Thu, 22 Jan 2026 21:41:45 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Mark Brown <broonie@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <20260122134145-GYE63789@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org>
 <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
 <20260122121223-GYC63789@gentoo.org>
 <2e2c2754-fd3e-4fd3-aae4-d7af63e3b528@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e2c2754-fd3e-4fd3-aae4-d7af63e3b528@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_054155_660141_63962267 
X-CRM114-Status: GOOD (  13.42  )
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

Hi Mark,

On 13:28 Thu 22 Jan     , Mark Brown wrote:
> On Thu, Jan 22, 2026 at 08:12:23PM +0800, Yixun Lan wrote:
> > On 11:27 Thu 22 Jan     , Mark Brown wrote:
> 
> > > Patch 1 looks like it should be OK as is?
> 
> > then with patch 3, and for other boards (milkv jupiter), should have similar
> > DT fix as patch 4..
> 
> Yes, changing the supply names would at a minimum need all the boards
> updating (it's an ABI change so shouldn't really happen, but perhaps
> there are few enough users for everyone to coordinate and it's what you
yes, that's what I care..

> all prefer).  Patch 1 shouldn't have any effect unless a board already
> specifies a wider range than the driver currently supports.
I realized you were talking about patch 1 only, and plan to take it?
then yes, please feel free to do it..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
