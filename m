Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09236C61DD9
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbVwz6FyGT8hGsaL6QV4WqEB7zHDnNubaNHDDMhVnHs=; b=obRGtKLYoD+JKC
	OxyWn40GSXF6MyIB4m79I6T9hIOEh471m3VNdasbhuL9xHI2vsi90NztMdkEJAMXCl5nkJtoZRuAs
	Xva9owcA2tIHMZcT8Oa2tG8IAbabhhPGv5TbUKrxe061Sij1BSsAeVSjNXPGQpRMeSDGy8MZCw09k
	Cnj46Jar0CBoXCtlP7wd3q1cCRZwW2LuBt1G08mx/LTEbsxpS5dP7BrbFj+tK4JaWyQ8NpQdK9kZs
	lUkiPAbnQVZIAJd60hNEe/0v6LzWu5PSxiIHtVZ7KvWDeWmRUma5FrZX3iaIojsbOk2mTnq3inkMi
	SF6lzUUXw2YBxOyXVo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0jHW-00000007xU8-1A1q;
	Sun, 30 Aug 2026 17:25:22 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0jHT-00000007xT2-1rYL
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 17:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=QQV/uWRS7tgfezg/sawm+VTmjnW6NBkrHD0CZvG0/go=; b=GAo4sAYpo7eX+8qk04GvnaEk2z
	dbpNKa9EoHp7mQBVIhlLLlmUa0NwEBc1NxubyY67SeWjNyitZcQEUV/9hT9aUOt5Grh9l7qFn7cwh
	1Gs6b+DS7TTczjg1kkWSozcp1/upncYkp1siitfK9BbGgE4MqEmdpJKAGHpRofd3PhsJia4kHTyL2
	e3tkOjG/vRbllxlYen5j2JFJrK4QpjK1CBNnRs8pHNCXsrK49IfeOZYI6+iTUYovjP0/8jfqKeDRU
	DI+w7pWD98ZT49yqwjpwnQBfWakzDgsk4oMpQj350IMPq+uMeXT7m4YciFKgvdpqtqlAF0CgmWpv2
	RxSz7S2w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0jHF-0000000ACVU-0Zvn;
	Sun, 30 Aug 2026 19:25:05 +0200
Date: Sun, 30 Aug 2026 19:25:04 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
Message-ID: <apRncBmtm7w0Emwf@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
References: <20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_102519_488818_108AEBC0 
X-CRM114-Status: GOOD (  11.09  )
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

On 2026-08-10 16:46, Troy Mitchell wrote:
> K3 boot firmware configures the C2 and C3 CPU clock domains at
> 1.8 GHz. PLL5 feeds C2 and PLL8 feeds C3, but their rate tables
> currently contain only the 2 GHz overclocking operating point.
> 
> Add the nominal 1.8 GHz configuration as the first entry in both
> tables. This lets determine_rate() and set_rate() select the firmware
> operating point while retaining 2 GHz as a supported overclocking rate.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> The related U-Boot change is available at:
> https://github.com/spacemit-com/uboot-2022.10/commit/fb95cf3d848b771c61b5a1b3e5cbbee223faf352
> ---
> Changes in v2:
> - Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
>   will be handled in a separate series.
> - Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
>   patch.
> - Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
> - Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com

This make sense and looks good:

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>

I wonder if it should be backported to stable, as users will deploy 
newer firmware.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
