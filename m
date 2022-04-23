Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A73CC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ve3m+2X2SeQ8RE1+wsrDHIGh0gdiF5Fd9GW1MrhmFDo=; b=C4wptoRFj3Tbti
	bpBpFpAHdkVUcOyJIouqyNmPI7hbciVRVhRQNjb8GVwcCRZLPN4k3DJjMdCdNpFhppFv/gzK7D0cS
	A34j8OUnYsidjFQiGL/sxvTkmMrRguHA73kZbphR5J9M6yqux5xSIuUMqjuFpyVBvsHqn5jjJvavo
	on2q5FBXOJf6rQVBrlgUdCcWs5h9znNYygy7/s8wUo1JnSFvwkwYQkTddL8jHGypwo87OHF5xbz2B
	fHonaGmfCkUcx6pJV1QDqSQ+8LV4TvlascB5Ojs32C0gGb36/4l49UF9fCgO6kCDeuOxF1/Dgl5dK
	fSBFPj1cXuuM+jE7kboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4mL-003AY4-7v; Sat, 23 Apr 2022 01:41:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4mH-003AW6-Pl
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:41:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BABC60FFC;
 Sat, 23 Apr 2022 01:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17ABC385A0;
 Sat, 23 Apr 2022 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650678096;
 bh=3+41YMiN4Ki21OPIbhXDBNTykkQdEPBi1dXT1rLdlQ4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=kVnQUhShsuz2MBhUl6M76Ri/ZvwJbPP2fmBLqWSWbxl19C1N+yObPoiOUBq9cTGIP
 wZ7seN2bivWIkh3x71Gz/C4/jpkJluJdpwjU8VQ0Xm/kviSb4yQKATJC0t0RLqje8G
 6ARYlU4SxcX3rUtJF+v2b/xkZpF4FDn4O1X4kK8YXqnzB4JKlnSxmL1Jd2g0J3gUJ2
 r5Q6mbHVrrlUPLsEGH5xvtynBBFGpLKU2xruLDyKwv+sNbNdg4t+hoHwlanYNlokBC
 FuDZlu6APhyo9CbPtT7z17vO5nBHuq1EQHQOYGZpws1cKpilvb8b2099SikXuTxoCL
 8eJ2xCttqdRrQ==
MIME-Version: 1.0
In-Reply-To: <20220413075835.3354193-6-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-6-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, krzk+dt@kernel.org,
 mturquette@baylibre.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Date: Fri, 22 Apr 2022 18:41:34 -0700
User-Agent: alot/0.10
Message-Id: <20220423014136.B17ABC385A0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_184137_934224_98689B15 
X-CRM114-Status: UNSURE (   7.05  )
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

Quoting Conor Dooley (2022-04-13 00:58:32)
> The RTC reference and MSSPLL were previously not documented or defined,
> as they were unused. Add their defines to the PolarFire SoC header.
> 
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
