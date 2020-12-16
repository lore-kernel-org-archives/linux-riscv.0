Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9999AC4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FCA2236FB
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FCA2236FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TUsoOVBkpbWBxFPIKgWx77saauNEflO3L5qBTSfVRjo=; b=HiA9Y43qXIm8Y1GvG3oafZwQZ
	7tXy8MJoVKJId2QQRx7liBz9daE88h5BHLsez+g7o90ysE1VQDdMIBhxjcMyZNCD0fjqcVTkG3G0C
	2LoCqcdUNPS2xPGFDM3arBmzUGBUPERrgJZkHJcz7mvy2hygy5SjWbdpRq+WuTeHaoy5vlENCv/BE
	U7coN/6drX5zjajKL9WeF4+FEdsVzq9kalPp84Z0++oULh5FQAv+EXvNkTtJbhI1mCnutExcdhwc9
	x1j1cymV4qDtBK5anvJxp2PhCrEinF5Gg4Oruiv1s/gDSHIl3ETjRbPK3qn2Y5C3IT9dPsJrbQ6La
	x16NiqwBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpdIr-0006Ng-0v; Wed, 16 Dec 2020 20:21:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpdIo-0006N0-Lj
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 20:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608150098;
 bh=7ckuVfE0d05hL3c+ScGa4gAayuEONTcC8xOhReADeyM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YK2h4QuCqaxq6KZIXPkLIcKysjp9AyWuLXFN1crIGkTx8ArT9vkxFop93wGrdA2YG
 axtvGpeb46FMFyrgUi84IGrNkokb+zs6xcdTCvS4RnqvVMo+yIZOa5qF1qipu02k+T
 YyHNeJOwpy6PLsNzgCavmBD91ZXmCZY+nj7fWvE3qAbGTnyZO/w62frre0/s8gKad5
 Gdz+Xwuaf3Cxr5XT0UBRWT5pJBSqXrLcePVcxPGGZEVnZnylz4eoNogqqbyCfNaSv3
 Up+YDKcSLHPwKut/xXPYpYabR8UAbdzkAJe9diXkXKPA69MJ18ydtiWVw1DEIlWygT
 p+DQYrx8tOfRQ==
MIME-Version: 1.0
In-Reply-To: <20201209094916.17383-6-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com>
 <20201209094916.17383-6-zong.li@sifive.com>
Subject: Re: [PATCH v7 5/5] clk: sifive: Add clock enable and disable ops
From: Stephen Boyd <sboyd@kernel.org>
To: Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pragnesh.patel@openfive.com, schwab@linux-m68k.org,
 yash.shah@sifive.com
Date: Wed, 16 Dec 2020 12:21:36 -0800
Message-ID: <160815009666.1580929.1809751674908825268@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_152138_805114_844E4566 
X-CRM114-Status: UNSURE (   4.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>, Pragnesh Patel <pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Zong Li (2020-12-09 01:49:16)
> From: Pragnesh Patel <pragnesh.patel@sifive.com>
> 
> Add new functions "sifive_prci_clock_enable(), sifive_prci_clock_disable()
> and sifive_clk_is_enabled()" to enable or disable the PRCI clock
> 
> Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> Tested-by: Zong Li <zong.li@sifive.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
