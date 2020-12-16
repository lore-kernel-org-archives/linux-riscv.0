Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3171FC4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95F5D236FB
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95F5D236FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hhcFzt22hRjeREgQK7Ffa4soYOZaRWY++ZpqhHXcKdI=; b=MnkVlar/KX1fK4UcA1MRM37qK
	wC+UPYhHA5bw4rPVjcUcOnr1E92HgLrcJe1BwgBLkUiKG90fEv00gK8tCEMTNDdbE4lLLjE2r3AId
	Nz7nt2zHMAGmtNmEqWo1BPEiwgAdpXJXvpt8Ii/RvkWc9YmvfWj5/e6qPvMkWF1v4UrjARS3Sahx+
	JYiXbOHOg8joKA0901v+UkY86KZInECmwP8DyWBlewmShhG+KpNNeopZuGOsptiH9UN7w05kcSaf+
	qYWIai+1QGe0f15FdZQd3etegmrjEANGnJiPowLiMD5xwIRQGqUse2vWmpc9aNWi/jA9/OsrlV9ah
	TqZ2iVI9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpdIl-0006M7-AH; Wed, 16 Dec 2020 20:21:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpdIi-0006LC-Ev
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 20:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608150091;
 bh=lls6UfjvqS9lO825QuepZmHisTnOFKzad07I7ebvkS0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=DxCbBPKHId3tpuuVHrDuRU9tvpuDMAyFL3sq5Ygl7Nw1XedyXujZfXkZO8icu4wvm
 pn0L6uAeJKaBQ3XPK7pE3SE59NwD//nRA50JkAXNi2gkz+aNBC37fUUVIIlznSgC+h
 ocs6HUc36btOojQwu5aXul/KFovjDgWmGiznF9gKfWxYpqFbdR6UYVJmKE2ip8tRnb
 mnSgxVvMf0KjGQ5ohTtm5CxAl8LDHVccr8O9qHHSCt69JY80D18QxsdTdR6bKoimXn
 DZX0aCjH2GaQC57kQlkcusGqaJWoODVqabjsmnldnCtu2SBwGlYtBAtc9eDbw5B4Hh
 kZZ0iJUjjFy7A==
MIME-Version: 1.0
In-Reply-To: <20201209094916.17383-5-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com>
 <20201209094916.17383-5-zong.li@sifive.com>
Subject: Re: [PATCH v7 4/5] clk: sifive: Fix the wrong bit field shift
From: Stephen Boyd <sboyd@kernel.org>
To: Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pragnesh.patel@openfive.com, schwab@linux-m68k.org,
 yash.shah@sifive.com
Date: Wed, 16 Dec 2020 12:21:30 -0800
Message-ID: <160815009047.1580929.7758511273578717067@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_152132_591411_FD7389E7 
X-CRM114-Status: UNSURE (   4.32  )
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
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Zong Li (2020-12-09 01:49:15)
> The clk enable bit should be 31 instead of 24.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reported-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
