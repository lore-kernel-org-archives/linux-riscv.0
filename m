Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3ECBC4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2156236F9
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2156236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=npijfcsPgmG/20mat+pTZhHNMpE9GmLT3JEG8z9Vy1I=; b=jYLa11z2cqPyFCUyWCRNQLbQv
	6z45Hs5Sscd4CRdqFJpMyVu2rXG2Bf5rwI3fS8b2H2VREmQwLD9wGykXhRtZPiHurWwcWu73G2dFx
	Roi89jssNU9Hced+awx3fXjVJ2rBHXRMIuuEuA7bBxTu1mLb2nGbtYeSVjPExMxdix2oZ/R+hS6iS
	BM+yJHu0VC16ZmSmlYqyoHj6il/bhvMS+CT8CPReI1u5XuS859fUDPljCnYRLlyBKKa+7gEqdsDCk
	RQD7rly6O0k4YyCXcdTGyEeLEq7Lov8Gi5sqQYTAmPqRJ7PbELAB/1f+SVbQDId0JIbEXRvU/rQE7
	Kn5rqRFEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpdIZ-0006Iy-9n; Wed, 16 Dec 2020 20:21:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpdIW-0006IU-T5
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 20:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608150080;
 bh=b1ue91HKAdvBszoEAlb+S8MEYd6BUIJHMyKElC7UKEI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=bFsNp+XaUY3yM/uKFPmFtw+0F+Rvv9QTkkS8lgcmQWattARGL7xIG8aHw1BYmRH1K
 p/mBbkr9SJTOx7lQQPm4A3bjfqt1wBrMe4X5PH1OhzHRleDaP+vATxj2qivGGROvMd
 rYPHa+n7omYgL9hl3ra9EDfZzEx8giao8pZc/A2H4YBkt2tKBZaCI7bdExb6SjndyX
 al8rfGtHj0LVZHq8SALLTmygzxfBYufYf+OesKJRcagGfLLbUZD6ayWL5nyHJSNkiw
 e0FsW0+fpLIaiQ2uDGpsJBWWo916DczBWuQ90c2JVq0JPUJlF6g5PMsrspeaiWB/vV
 4yTNnmQybLOjQ==
MIME-Version: 1.0
In-Reply-To: <20201209094916.17383-3-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com>
 <20201209094916.17383-3-zong.li@sifive.com>
Subject: Re: [PATCH v7 2/5] clk: sifive: Use common name for prci configuration
From: Stephen Boyd <sboyd@kernel.org>
To: Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pragnesh.patel@openfive.com, schwab@linux-m68k.org,
 yash.shah@sifive.com
Date: Wed, 16 Dec 2020 12:21:18 -0800
Message-ID: <160815007878.1580929.1338503226146217305@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_152121_069526_05112553 
X-CRM114-Status: UNSURE (   4.56  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Pragnesh Patel <Pragnesh.patel@sifive.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Zong Li (2020-12-09 01:49:13)
> Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
> patch is prepared for fu740 support.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
