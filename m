Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED67C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jan 2022 23:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gbk9G3i489rVGh2aFwhO3WtPXuwlmNSBA5bZobglj9Y=; b=sDvXP8/twS2PRdjRNnKpRp/CCw
	IHVL2dvsMIWf0M1Mz7Hnja+5AD7T1CMXC4jN+LtE8xA21okmTqMHJmcZF2wMjILCW00J6TpDqqWxk
	7VDQlZsnDCYoBfKJLjg+SAROs6iBFAAHa+VVzq6ML5dI0U5By9/CV2IRMHTs5VUFmfylTmh043MUd
	0ITRD2F3TZAfo0LQGjSHq+GdDfu2eTllcLs+PJ5q6rqlI+8PxFaEb2XnZsnIhUh2qx7pDasSwZch6
	NVVqiVwXNtzV3yvt82Bi0LXvpAvboSl/h3+L+hSVpDrxRGFwMtD1D7vIT1q5Edu2TYOcuXADmlRzk
	ZlhxF9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Fu2-00G0R0-14; Wed, 05 Jan 2022 23:41:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Ftz-00G0QB-SO
 for linux-riscv@lists.infradead.org; Wed, 05 Jan 2022 23:41:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24C51B81D63;
 Wed,  5 Jan 2022 23:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D597CC36AE9;
 Wed,  5 Jan 2022 23:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641426063;
 bh=G4C3FTeEqFCchis4B9Pm8AP/vx5kPQjerC9GFilM3Ys=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=UYcBnuwUd8aT8AjjP9i42BD2hicdUpwmKWBIl1cYJPSY9jyU1WoQYU2dtevex1TPh
 wlOqh1tWBswUwMUDFQU/pVTxRe57bGfJZ7V5piP9rYovC7zux950WC2LTUmqnYtSoX
 knrjDG/fVNjSNJ0+GoMFDkSHOZkbX/bYmtkvLLuFKCbK9QM3V/YZnNzr9mQ/Yt1Ba2
 LWRDih5XzQIDW6YJUs2csyGjWE67O8sz9AEFzcBNMhX7YxHo/Vy2ovVBQ/zXV/Cb2p
 6SISQGDPo7N4JBp84SaVuO+JYuKdwEfl7EShy1QrOK4TqISuzo38QQUH4hee1MNoLT
 LcOXDZmizQYLA==
MIME-Version: 1.0
In-Reply-To: <CANXhq0qdNxxi=jmrpMO-NKbxbHwaqoj=VGqphCw8cz+9DAyBDw@mail.gmail.com>
References: <7823666b57c105aee8323e6896f83f3ed249d9ee.1638957553.git.zong.li@sifive.com>
 <CANXhq0qdNxxi=jmrpMO-NKbxbHwaqoj=VGqphCw8cz+9DAyBDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: sifive: Fix W=1 kernel build warning
From: Stephen Boyd <sboyd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Zong Li <zong.li@sifive.com>, lee.jones@linaro.org,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Date: Wed, 05 Jan 2022 15:41:02 -0800
User-Agent: alot/0.9.1
Message-Id: <20220105234103.D597CC36AE9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_154108_077762_A3492017 
X-CRM114-Status: UNSURE (   7.86  )
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

Quoting Zong Li (2022-01-04 20:24:28)
> On Wed, Dec 8, 2021 at 6:06 PM Zong Li <zong.li@sifive.com> wrote:
> >
> > This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> 
> ping

Please don't send "ping" at the very end of the mail and trim nothing
else. It wastes time.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
