Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D4AC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 17:17:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01C320B7C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 17:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="alZEK/OY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwe4qs3d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01C320B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUbXQmXBvQZWmOADlT3f37k2tcM8gKF5ofBil0rD7kk=; b=alZEK/OYSYYaSW
	xw25R9JWyvdjI7l0tF8bhwbBAOFNb/6pndGRkoa3xsvILSkJR8cplNhhZ8QGdmtkH//6Y8nJbOCBH
	Td5GyH8QSeHIyx3/YeQLREiwv6vIe4POZIKdBkMVPB6AuDDCd1e9yJhEEm7HGS8c1wTzKO7v1BFEO
	dNJ0xGauNIAyldkpDJfgAx98PVUI6AfRwXX6ATraYwpW57YTkQcvSPOztqbQ0fur1zRtD+i4duKDM
	O7XN0WzAH9AJj+/CpVpeFd1BSx2qWspmyzpZ6Ylro70ToDqPJRsvB5NCDwQQ6r0EzIuufCsj1+bEC
	nnPi+FwXASYYfmfEMdZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK4TS-0000JP-EH; Fri, 26 Apr 2019 17:17:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK4TP-0000Ie-GK
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 17:17:20 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A97E212F5;
 Fri, 26 Apr 2019 17:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556299038;
 bh=YOqdRP1NibCHtG7DRV7/U52ilDs1WxrKyoCTk50cxM0=;
 h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
 b=qwe4qs3dYnolA64U11jZvfhn/j37Iv6ZCuKR4WL1MSHxIBouZbgjhY6LjtqOdEpQ3
 bbOxeujdj/rMuxTwmQ7mgz1gYTgH6qnQtOLY7nEeXkFqGOtBa2OVWi0YwvUfyj52PT
 IUvIjrhK2aF4EmZHRmjiqhk8H1ED4faU7k5pBiwY=
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1904261000090.28496@viisi.sifive.com>
References: <20190411082618.3502-1-paul.walmsley@sifive.com>
 <155624271876.15276.8637203698438742304@swboyd.mtv.corp.google.com>
 <alpine.DEB.2.21.9999.1904261000090.28496@viisi.sifive.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: add driver for the SiFive FU540 PRCI and PLLs
 it controls
To: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <155629903755.15276.1866080713022430392@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Fri, 26 Apr 2019 10:17:17 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_101719_555312_008B89F7 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Paul Walmsley (2019-04-26 10:01:23)
> On Thu, 25 Apr 2019, Stephen Boyd wrote:
> > 
> > Can you please send the dt macro patch along with the rest of the
> > patches? I can't apply these patches and build them without it.
> 
> It's upstream now as commit 6ec4bae178d8 ("dt-bindings: clock: sifive: add 
> FU540-C000 PRCI clock constants")
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6ec4bae178d8a1e9814eb3bfdd321b0475de0468
> 

Hmm ok. Thanks for the pointer.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
