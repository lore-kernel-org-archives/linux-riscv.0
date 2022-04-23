Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8A1C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTb0U7glhptqD5pjv5el/gT6BWTs4atdpgw0yXdjMkk=; b=qvbI6QJJSrXWgK
	sxu5NRawtTImkOnq7gFv1XFPEJwUE0798Stj3SGZbbGEU7wBrYwY8Xfx/ihQuZdH7y2DwunTpPTAZ
	sg6eb2rfynd5elkXXRehYEKgC7tD65L6P00vn/jPV0jWxw99U8ugGMYVrRLbSzeK2HimKvwlM90/E
	w/Y7n+CXtVi4pdEOHGXlFw/7sphl/ulRQRg6DpNWb549MuuCBGauHhKVIeoF5lfWJt6KlZX2ymyc1
	IEHqcrUjlsSy/+Zz9lT/d+mxdrXEG+fK+C+CGg0l3ACSzKo4pNjQtrwFp3dfc21rndSD8gVCd+okS
	T822N9Z7RW9UxtJC0fgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4mk-003Aq5-DA; Sat, 23 Apr 2022 01:42:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4mh-003Anf-2e
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:42:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97F9B61365;
 Sat, 23 Apr 2022 01:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC10C385A4;
 Sat, 23 Apr 2022 01:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650678122;
 bh=4KnlRJYulWnZ68ZF4bHllHzn8HcaDgDKHWhKudKDFEo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jHQICZetUsT+dXdq0t6+3+YCGgjNL4ktfLVStpnFEHbrEFaQxOApR9v+VTRSSPiat
 zG9kmA+JdErG5eolP+RNXQoPVZHuK2c44LClrq5AwL/Y+46i3qaTxTwLCTxu5D8cb4
 9icFZkd6ZL+ri8wHnpSzPYra0lFkehHcbdgBCwZ9GZU7eZTzdA5L1UTdm0JGEyG6av
 l+5Rl2Pepi/9K6kerYusRB9Ns1L/oJZDvd41Al3J28Zw4WNMeCp7UvAo4pbSKsoVDZ
 ed7vEcnmHL7Lx0Mm2svQvmxUgPETD5VRCMFxlx73ZIkY8c41DwqjOHsn9PHrfWUaSH
 AasWBSIz9/IRA==
MIME-Version: 1.0
In-Reply-To: <20220413075835.3354193-9-conor.dooley@microchip.com>
References: <20220413075835.3354193-1-conor.dooley@microchip.com>
 <20220413075835.3354193-9-conor.dooley@microchip.com>
Subject: Re: [PATCH v3 8/9] clk: microchip: mpfs: add RTCREF clock control
From: Stephen Boyd <sboyd@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, krzk+dt@kernel.org,
 mturquette@baylibre.com, palmer@rivosinc.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Date: Fri, 22 Apr 2022 18:42:00 -0700
User-Agent: alot/0.10
Message-Id: <20220423014201.EEC10C385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_184203_174427_C6AEF52F 
X-CRM114-Status: UNSURE (   6.77  )
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

Quoting Conor Dooley (2022-04-13 00:58:35)
> The reference clock used by the PolarFire SoC's onboard rtc was missing
> from the clock driver. Add this clock at the "config" clock level, with
> the external reference clock as its parent.
> 
> Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
