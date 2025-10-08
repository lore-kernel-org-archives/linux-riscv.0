Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3617ACCD184
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 17:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPGUq/de6/aJYmfWe9RnBCJxX7GuJ/AWq4BCQPecmbg=; b=BVwrZ4DHhC5j7x
	lYnLajFgeZIf0+i1QJwe25oea9AYEwHtlk1h052tHo8PeauiNFFZSpQ/wkqjM/upKoK+6u9KXKpN7
	44hokpVsZIsPpdr3ec852TuCUnf1BqLbMlIa9MjxzpUaBLbppk+xky196DfvSOqaygZhfBb3adzu7
	d3+W/3WEBk/ETzBLRVy0088rcmlip6qkf/WF3n8IFJ1F+JAcoxjX+i2Kzck2ckNRmE6aPBRZX9vjz
	mNZbrg9odmXwHE5X4TfVm7SGwQCJojV9GVtU6JBNJ0miqUrRt+oDACqwEf3IaTDfQ0LbNxSJI56dX
	pb+sPEVMMUOjTDXEuALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJY-00000004P8j-2tEE;
	Wed, 08 Oct 2025 17:51:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YJX-00000004P8J-1uY6
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 17:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2B0261148;
	Wed,  8 Oct 2025 17:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66A8C4CEE7;
	Wed,  8 Oct 2025 17:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759945858;
	bh=Da1eqrZCMQTfiA7GWCzrdL36EgR1rBWR0A1debnvh+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rk5N31tXSG7Lp2JaTap0qUfFvs8YVYtXUVWw6RnBnjRcZAyBY3BkrvAu7UB6nWMIJ
	 J6KOkhYHVddhUV9dd4BbNHgCTHNYq/6WOHYqyjJHga8bhFCcXJodrTUvYKStFuFlg1
	 EQbgMQd21Ecwwlq8Q9cR91MACITK+u+U7COzWZ6NqViUfpmfrlBgHNYs85kTj59xRL
	 YG77XzyPn7F4ppwUkg6oGdb9RfpPXI6Y5236eO1otbwr2WQ0J2kXdFmo0pcoohe+V+
	 QXLbfeGdjz/eFuz/izGdKqNouK12Fd5DtV7z5DAUvWd1ZeEsDwblWaDSSStqlqnvGE
	 lfGlxMPxXW9oQ==
Date: Wed, 8 Oct 2025 11:50:53 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Danil Skrebenkov <danil.skrebenkov@cloudbear.ru>
cc: pjw@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, 
    WangYuli <wangyuli@uniontech.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: cpu-hotplug fix
In-Reply-To: <20250919132849.31676-1-danil.skrebenkov@cloudbear.ru>
Message-ID: <7bc8eb67-0a48-1756-c907-dae7751b4c98@kernel.org>
References: <20250919132849.31676-1-danil.skrebenkov@cloudbear.ru>
MIME-Version: 1.0
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

On Fri, 19 Sep 2025, Danil Skrebenkov wrote:

> openSBI v1.7 adds harts checks for ipi operations. Especially it
> adds comparison between hmask passed as an argument from linux
> and mask of online harts (from openSBI side). If they don't
> fit each other the error occurs.
> 
> When cpu is offline, cpu_online_mask is explicitly cleared in
> __cpu_disable. However, there is no explicit clearing of
> mm_cpumask. mm_cpumask is used for rfence operations that
> call openSBI RFENCE extension which uses ipi to remote harts.
> If hart is offline there may be error if mask of linux is not
> as mask of online harts in openSBI.
> 
> this patch adds explicit clearing of mm_cpumask for offline hart.
> 
> Signed-off-by: Danil Skrebenkov <danil.skrebenkov@cloudbear.ru>

Thanks, queued for early v6.18-rc after cleaning up the subject line to be 
more descriptive:

"RISC-V: clear hot-unplugged cores from all task mm_cpumasks to avoid 
rfence errors"


- Paul



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
