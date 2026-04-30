Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75109CD13DA
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6nKvnK0+z/ZvomnRSzcVgqQfa2P4lZlyiU/Eapfr2I=; b=DyZuLxT2Iw8NjM
	bqIZ5i/i1bzid0+93+/ZSEND5G+mu+ZEygctb39qiOyfSIZcJmeJ/Y3LsYiunlXFQ7269cHhr5tiA
	3+r5I1BKcuvKBgRLavYQgXIKrAPyPQO5BpT5eltQBMf9Ve8TNR2T2/fNarx8PenIkNAA2YOfQQ43o
	9+ZWxQ7gBdg4iLzPKhp2w0hhPQsitOEnq31xAilIMx1zINVJh8fHkdCZFwFrdQ6dqHBGd3zd8PHCW
	IuPEomWan//NWtW8VqdpnF1rjuhun5SEPXf2439HAMyXQ518ALI8ZLr0Uf/svHEC+WQDIH3LKDrvt
	pj4Ya0fNV+lNuicrNj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIXhG-00000005ttW-2jVM;
	Thu, 30 Apr 2026 20:09:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIXgl-00000005tqe-2mKP
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 20:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39E79405B1;
	Thu, 30 Apr 2026 20:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC1CC2BCB3;
	Thu, 30 Apr 2026 20:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777579727;
	bh=GpaGySVExlgqsNm5CESqhhtwL4t6AT26bR+QPNvrnNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Sr2Ts3u6JVN7NIg9IgCDHDvaSa/2fQOGbM1mzKtx/s+Ao8FKG1nCxupFj7LrJ0ajS
	 cjyZzae/ujjHNpxfxC4vordi0yb5UM09C3P3/AKTrKZOKwVzLFdAXmFsJAg//a2TC3
	 GX3EYGRbG3IiwuCNjGtvD03Hi2ZUxUqz5FpqC/f7Xvh0b2Fp/v6tHIHuQWA5AKCgvz
	 UFn5NJiTuEHSo0qF9+30FAgAnEo8EOB7hlrJlUloEhfsUnudpn3rabPo7bjNi+OAnX
	 Qo0n8HPU/I6lnKfQjRHoC5p8ndzH2IWGNdswMLWTRmIIwl0BJuEAEcSCflF85aAP/P
	 hR+LKpXEJ79kQ==
Date: Thu, 30 Apr 2026 14:08:46 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr
Subject: Re: [PATCH] riscv: cpufeature: Drop this_hwcap clear in T-Head vector
 workaround
In-Reply-To: <20260430045350.22213-1-hui.wang@canonical.com>
Message-ID: <5d71ef6a-ef04-571f-9258-b7727f649ad5@kernel.org>
References: <20260430045350.22213-1-hui.wang@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_130847_717608_CDC16358 
X-CRM114-Status: UNSURE (   6.97  )
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

On Thu, 30 Apr 2026, Hui Wang wrote:

> The variable this_hwcap is initialized to 0 for each loop, it is not
> necessary to do the bit clearance since this_hwcap is still 0 at this
> point, clearing the source_isa is enough here.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Thanks, queued for v7.1-rc.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
