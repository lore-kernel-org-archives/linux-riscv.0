Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEF6CD4F3C
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 05:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PEXF/l/gqe6qkwpE6G1KVTg/p3XXVolKkgS49AVXnAY=; b=Vj5w/IKBJ08X6v
	wzghafV6iQilHRSxHGFC10IWaDP485AVHw1famHhgnzBAxqo4O7Ao0rKgXsXjqvbMRK5R2VAZteeh
	9K+dZ0DV2+ht2Hotc5MvXMVetQiA2YNLwdXI66xi4gw/fVzeoom7EV3RAB9rMSIWhpWWzG3JmMcn6
	8dHS3G3avhUQgnJOOar2vilY2FSK0CMDzzq0sPkcmu/jTCOklXSp1KY8PV+JPDmVAebKn1kCrpNlb
	CZ/zxJ8klZUqX0IFQKiAEkYJhKNGFkXvlQN/hKHoG/e4MGwp29erhoJMmXCwARO5JKYtTWI3QnWQ4
	ZMLY7GNm1zHb4qxE97QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNl8U-00000007PLR-1cxu;
	Fri, 15 May 2026 05:30:58 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNl8R-00000007PKk-0YQd
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 05:30:56 +0000
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id AB42B1C4468;
	Fri, 15 May 2026 07:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1778823050;
	bh=2IpOzIBA2jCXGfNmim6KazLG0KdmWCWJwUb3dW+oJaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2NKJUNedWEGwoiskLnw3HF8ZLmUjPrYG6MYnP3E/OMHYu3I3EhKdoTMu2lAhJPpb
	 tId3gtOXdFOBHUiTDfXpIobGy+nn3YAmuk1MBKi/oqsWFfNRdyVvEXKKJrPyjgw9+A
	 FzhQwdaHhBcjaRJWrLnLYwCj7NuFdFYUIVDKGKYIyMCZbDbykhvDV8lggtwPFOhvUe
	 Q2UVBK0/TntlAUaTelxOofCnEs2kIfEj9L5h2C5QyHZFjrVfq73W0BrmuLHzXNi7AS
	 eTI+n8F3OjpkHpGTMTL9wHbA7K9zQib7cg2vztd7quYC2VCWFL0twK0AMYTzzcVBwN
	 OJ+rVvuzWSuNw==
Date: Fri, 15 May 2026 07:30:49 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>
Cc: iommu@lists.linux.dev, tjeznach@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update Tomasz Jeznach's email address
Message-ID: <ls7fjnjajsws7f67mlyv7iwz6npq5csdrkfefy42jmuwjw3da2@7dvlladcps5b>
References: <41c3c83de6e2d8422261b57609425d43@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41c3c83de6e2d8422261b57609425d43@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_223055_314855_E2AFB0F5 
X-CRM114-Status: UNSURE (   9.05  )
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

On Tue, May 12, 2026 at 10:37:44AM -0700, Tomasz Jeznach wrote:
> Switch from the previous work address to a linux.dev account,
> as the work address is no longer actively monitored.
> 
> Signed-off-by: Tomasz Jeznach <tomasz.jeznach@linux.dev>
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
