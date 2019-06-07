Return-Path: <SRS0=Yvo4=UG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9CEC28CC3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2019 06:43:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32D602089E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2019 06:43:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pRzafHzr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="BDiMYDHU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32D602089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3NV3OIpIaArZQiuX/2EjXNVSdD3BjEjtKa2sgeFGiA=; b=pRzafHzrW30fjG
	OHZA7/f+lIHqPWb7QsJerMqzyEJFx04l0DI0vfzCPB+lEjMRRRRltaMVJINU0pvEtwcZuuZa+PcLa
	ijHCBayTdzIzrbAcXLM54t0owWXarvzWnok0EGegcL7RUSU5cs0PyFlLxQ4H870S6NacbLq6KeH46
	YTKidACbU8V6SsmuHmGgXa6JUwX3PGzgDjgbNErC78l4sGC9cJJ6KPI9Ika8LPiGGEEaFzA6x2Vm9
	jHXQYa31g0nQAVKe7PkcuPd7VYP1J1jVmkO5bYvl3FUJSve8LrK/M7/2WsIf/pzomy8mVWMw2Ym6x
	eUwBtOXr6ZM7fJvGz1+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZ8as-0006Wv-If; Fri, 07 Jun 2019 06:43:18 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZ8aq-0006WU-1b
 for linux-riscv@lists.infradead.org; Fri, 07 Jun 2019 06:43:17 +0000
Received: from zn.tnic (p200300EC2F066300E4B954D67B383BA9.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f06:6300:e4b9:54d6:7b38:3ba9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 10C431EC0997;
 Fri,  7 Jun 2019 08:43:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1559889788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=FIRsXlvkn4IbYLUoughk3PTq9Sf/ybYYaQGniFuSkhg=;
 b=BDiMYDHUa1WuQ+ZlX/VirkDu50nNmmSm5oWa9kzkeBU7yzlC0ReYRpi47fbdpROKtRrhWj
 OSY+rtkp4Lj+uRbA0zXNxeG2sAiGh9VARRiw9WO9dzn3dweSgrkx6qxWER4qhq4MTQq1Aj
 jEGoJkXUbh0InhEIkz5cOH9vTBrkJsc=
Date: Fri, 7 Jun 2019 08:43:00 +0200
From: Borislav Petkov <bp@alien8.de>
To: James Morse <james.morse@arm.com>, Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2] edac: sifive: Add EDAC platform driver for SiFive SoCs
Message-ID: <20190607064300.GB20269@zn.tnic>
References: <1557142026-15949-1-git-send-email-yash.shah@sifive.com>
 <1557142026-15949-2-git-send-email-yash.shah@sifive.com>
 <CAJ2_jOG9Ag0spbh3YCxavUE5XEAUP1pHcgCZ56Nu2u4TqfrzHQ@mail.gmail.com>
 <20190521182132.GB7793@cz.tnic>
 <1c7eb8ab-6f48-c41a-1d3a-a9b0f5ce8a7f@arm.com>
 <ABA6726C-CC1D-4092-887E-7D5A5B90509B@alien8.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ABA6726C-CC1D-4092-887E-7D5A5B90509B@alien8.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_234316_240999_249A8E4E 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: aou@eecs.berkeley.edu, paulmck@linux.ibm.com, gregkh@linuxfoundation.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 mchehab@kernel.org, davem@davemloft.net, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 22, 2019 at 04:34:38AM -0500, Boris Petkov wrote:
> >Still fine by me:
> >Reviewed-by: James Morse <james.morse@arm.com>
> >
> >(...this patch already has my reviewed-by on it...)
> >
> >I commented that it couldn't be merged in pieces here:
> >https://lore.kernel.org/lkml/4072c812-d3bf-9ad5-2b30-6b2a5060bb55@arm.com/T/#u
> >
> >which is what Yash is replying to.
> 
> Ok, I'll take it when I get back. Thanks for clarifying.

Now queued.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
