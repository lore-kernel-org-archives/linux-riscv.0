Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC7BC3ABD8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 05:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqlrHqbhg06KMJqO9dt001vAWLLVWrbFLQcjb3oUQk4=; b=jyNwWKya9/jnTJ
	CaHlAURf6OnvbjFEOpvgocuzXwJzOus9Z289mPajXYOoZrJ0YohWpa0QFaNODy+By/4YtY+mBX95E
	pKya5ouLyOmPDfeTOFW3G+dpGUTCcuvcyayN1KdPSmFSrEPucTHBa6tjmdWVWwGJuDoDeRtBj6la+
	uLA2CSIlua1VyvkD+jwZazc04BNhGjvRqS1UwQKCFfYXmlXV9NJz+Nx8+ghRrmTkDmpI/7uL12EBU
	x1i/W3Id8v0ok6fgXdV+a+4mOVOjy96eDrIlZlhRvT5Pv8q+4PLU5TBpafYO+gA9TfyrSjsTn4Tge
	kztw9aZzKZxEHmURslNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEhmB-0000000BLma-27ZO;
	Tue, 13 May 2025 05:01:59 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEhm8-0000000BLm5-0Hnl
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 05:01:57 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id DD6E312FB43C;
	Mon, 12 May 2025 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1747112512; bh=+bxIO1TVXDAaN1B8C3jo1UC1Eipqnd36X95ZaU0RUig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/kWoT6+6lxuUSEFhgRknbBr309/qqIzCW2azuz5gLZ2rw3J5YV7WPTb/uJeF67WJ
	 KEgjj5GEUo3ih1OSVWQEFvIHGrKIUvkedwjR2NorNmTImLdGNM+wAQ2xQOSPp2z3/m
	 M/FmXVY1MwcxYQXrpFQ6eLLCr0kQWYULojparMGqbK5e1fCDxJcGQxTVM8ZG88OHPd
	 /gVsfd9W/JWtDzzD+Bd5hMZiSY8sa91QRhzbywWPld0Rud6giXXr9NiHVZ7Z1KEDYR
	 DXL7MLQCx8rZqd3nF8GKqnjpeLSfNIprL3sRyqs2wXrCisfGWABmoLkxFhH36sGe/l
	 zMHb+6Ps+hkcw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4uJWQCw1BHG; Mon, 12 May 2025 22:01:18 -0700 (PDT)
Received: from ketchup (unknown [183.217.81.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 5F6D012FB430;
	Mon, 12 May 2025 22:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1747112478; bh=+bxIO1TVXDAaN1B8C3jo1UC1Eipqnd36X95ZaU0RUig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3auRpyZe2GfkrXIlMAnG9PEMU91B6GPaoPtLsih5ElnJJzQraBE9b5u9pK0gL9MA
	 o4n/Ud1egen/FW/DTrf6AFdFmny9DnLc2U9eLmmgiW/lngex6DvmRfwzODDHXeU2Vu
	 ax9Ma3rCsKCQkM136CndUq+IXkvLv3XABbRjJoFhkJ0bMJ5JzUMTDtDbrqEPde/kla
	 34IVzg4IgUiyELv45EYbhYUtzqb4rF2UIwnYaKN7ALz3U8A0sftG9OmnE9ny6bxEIt
	 nXzVnk1fyuzdc7R3MqLZKHFO+ylhfT48dVAYs3cLeZyFyodA3WGnzWtmFFUWmULFsI
	 D9pHtf1BNEJbw==
Date: Tue, 13 May 2025 05:01:10 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/6] clk: spacemit: set up reset auxiliary devices
Message-ID: <aCLSFmSXLUQYi6on@ketchup>
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250512183212.3465963-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_220156_426582_C8283AA7 
X-CRM114-Status: GOOD (  16.63  )
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

On Mon, May 12, 2025 at 01:32:08PM -0500, Alex Elder wrote:
> Add a new reset_name field to the spacemit_ccu_data structure.  If it is
> non-null, the CCU implements a reset controller, and the name will be
> used in the name for the auxiliary device that implements it.
> 
> Define a new type to hold an auxiliary device as well as the regmap
> pointer that will be needed by CCU reset controllers.  Set up code to
> initialize and add an auxiliary device for any CCU that implements reset
> functionality.
> 
> Make it optional for a CCU to implement a clock controller.  This
> doesn't apply to any of the existing CCUs but will for some new ones
> that will be added soon.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v9: Use ida_alloc() to assign the unique auxiliary device ID
> 
>  drivers/clk/spacemit/Kconfig     |   1 +
>  drivers/clk/spacemit/ccu-k1.c    | 104 ++++++++++++++++++++++++++++---
>  include/soc/spacemit/k1-syscon.h |  12 ++++
>  3 files changed, 107 insertions(+), 10 deletions(-)

Reviewed-by: Haylen Chu <heylenay@4d2.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
