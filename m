Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5135C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qved/XR3JawzCMoA7grGx80HjFO8/2jFzbp1SJCCIDc=; b=WbJ1MwQ4ZFlGHo
	hi5nXSTdsP/g1Eh4IwiAobr7ccBQJ5MzcSuJiMwxkInOJEzDWtrLZyUhTa3dKMCeMO639mFoK4J4i
	pYr+GPWXt1Bfh7oMsraBcfRP6R24D62XUptZWfsLSCKXWq7uk53SteKKrSKrcbjrMEpsiDtZc7Q/w
	mZWgI98jnctxDYJ9GsMTSKEs8xXNxxvtBcUXavZmahPpYhlO8aPqzqGLGtL6OujhSJHmMwtXe8euj
	2OQuIW3frR06mXOzfoWINPQ51wJ6ECERXx7S22zpRq6PcstpZkeOnVOnZewuLXXWn6XP/WLZSPxhn
	uGQS/aQQOG07bB+uFN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUG63-00AnuF-Oa; Tue, 15 Mar 2022 22:56:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUG61-00AntZ-Sk
 for linux-riscv@lists.infradead.org; Tue, 15 Mar 2022 22:56:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75DC361494;
 Tue, 15 Mar 2022 22:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAD1C340E8;
 Tue, 15 Mar 2022 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647385012;
 bh=N0VKvWBXk7mkDxQ+/L+M4POKqwF9FuwJqmqkJlnxmlI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sgvcKJLNDDW+o7EHkrLO3ydsvTNzqopH7ZWr5kG+MNyZuOyh0cMRc6BamAfHn3+d/
 dqM9ugmNfdYU7rCLOKhhT2WympchfaBtos01Nf6RFPJc/qiBHMevLUIfeOgKGpvHrQ
 /DysRybj4ZBSlndCsuR7GWLPVHvteaoUORXMJP1y1LulZ3TJlENn2kGeJzbU8yX8VR
 9h6TrolfiXQA4kwq30OQ9qZGb4SvZOQ1EB3yrmDUChcD8KPwm6NAbl/sKNnhMmDu1a
 pLuMNdGVT5q7Kgs6fpSbZ/wSimpQLXnNWAvUa/MgkhldzNOlvEZ5AVIzLM0SjJUpr3
 WsGREJTHuKi1A==
MIME-Version: 1.0
In-Reply-To: <20220315225459.73F2DC340E8@smtp.kernel.org>
References: <cover.1646388139.git.zong.li@sifive.com>
 <db92d209fa700f7da8bc8028083476fcc138d80e.1646388139.git.zong.li@sifive.com>
 <20220315225459.73F2DC340E8@smtp.kernel.org>
Subject: Re: [PATCH v2 3/5] riscv: dts: Change the macro name of prci in each
 device node
From: Stephen Boyd <sboyd@kernel.org>
Cc: Zong Li <zong.li@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
To: Zong Li <zong.li@sifive.com>, devicetree@vger.kernel.org,
 lee.jones@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org
Date: Tue, 15 Mar 2022 15:56:50 -0700
User-Agent: alot/0.10
Message-Id: <20220315225652.CDAD1C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_155653_991091_CCB3BB23 
X-CRM114-Status: GOOD (  12.41  )
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

Quoting Stephen Boyd (2022-03-15 15:54:57)
> Quoting Zong Li (2022-03-04 02:03:19)
> > We currently change the macro name for fu540 and fu740 by adding the
> > prefix respectively, these marcos are referenced by some device nodes,
> > they should be modified as well.
> > 
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> 
> Cool. So it looks like I can take the clk patches and not this one and
> it should be OK?

To speed things up I can take the whole pile. Thanks for fixing the
bisection problem.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
