Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8C9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 06:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUEB0Jast1U0/Kz6sjAkv67qRSV7v+Z0Gpk4oSiikcQ=; b=dS2ZgIlnYGPakv
	m/dWAB1OCcAUTFCnF7NlZzFX/DABu/6lo0eF5N9bRgPvrEPcvB/63SOJxiIOiGT0m0ZTs2xbL95BD
	JE7fPf5bWWmuLkCvzfHH6mloe9kVDEx2DBOpZW6IdqyGNUbzkaDXQF16i5LcvgEyf6gMU4TYs0NMT
	43DhkWWNybNyjbEi/k48aq7++o3zqfpWIueKMrqt6ADNgt8LQLzemFmwO/7fBhwQj3HcfOpTKPAs0
	ieiIMmCfrqTI928gaQQIXqv9QgnndhcoS5G4sv/T+MxMTdwSPJhWWm04tjV1V4HPhyb6yRbHlqHy6
	wq4qAlic9XDKIaxeF1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqTmg-0066ZK-6m; Mon, 16 May 2022 06:00:46 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqTmd-0066Xp-E9
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 06:00:44 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id DEE5F68D08; Mon, 16 May 2022 08:00:34 +0200 (CEST)
Date: Mon, 16 May 2022 08:00:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v2 2/3] riscv: Implement Zicbom-based cache management
 operations
Message-ID: <20220516060033.GC12339@lst.de>
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220511214132.2281431-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511214132.2281431-3-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_230043_658698_6BF2D6CD 
X-CRM114-Status: UNSURE (   7.81  )
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

I'm still only getting one of three patches here, making it impossible
to review.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
