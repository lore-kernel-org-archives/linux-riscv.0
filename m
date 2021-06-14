Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECE7C2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 19:51:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADD3B610A0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 19:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADD3B610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfmuzSbYrXAzmcQYrkGO94EciDmhvNhCb8X5LdSSjTQ=; b=UmBi2YU7CidyIe
	mSjvgYir9EzWTPgnIdhPt0ocmEPHHoHkWJhiUZZUEnh1lc3wIXEOsKIks6fyAPvTD2qvsg0qY77iB
	uWi7ZZTtQfRLH5C+GuyVRM/WSozegjGJf96WLqu1twxVD9oBQQ2xyq97jMlgy1tfQPZQaJHzqTcnC
	UjzJVqe5cHbBF5HS970mwLX6XFUVRyJA8QtMd1AxAedUclrDAGabWYzbwM2Q3SGRCurrnM/ZyImuA
	MRRUvUzhEjHLk481s811qaO0zkvIbj3nrhmleQZOWzITYTwm5Q4h1rjSWz4GJ2qgiAWOe4rIyesSY
	LUeg5CC7KHI4nXf2bC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lssc8-00Fwom-C1; Mon, 14 Jun 2021 19:51:16 +0000
Received: from shards.monkeyblade.net ([23.128.96.9] helo=mail.monkeyblade.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lssc6-00FwoE-Cv
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 19:51:15 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id 251124D079864;
 Mon, 14 Jun 2021 12:51:12 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:51:11 -0700 (PDT)
Message-Id: <20210614.125111.1519954686951337716.davem@davemloft.net>
To: mcroce@linux.microsoft.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, kuba@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, drew@beagleboard.org, kernel@esmil.dk
Subject: Re: [PATCH net-next] stmmac: align RX buffers
From: David Miller <davem@davemloft.net>
In-Reply-To: <20210614022504.24458-1-mcroce@linux.microsoft.com>
References: <20210614022504.24458-1-mcroce@linux.microsoft.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Mon, 14 Jun 2021 12:51:12 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_125114_451317_73A0F776 
X-CRM114-Status: UNSURE (   2.93  )
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


But thois means the ethernet header will be misaliugned and this will kill performance on some cpus as misaligned accessed
are resolved wioth a trap handler.

Even on cpus that don't trap, the access will be slower.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
