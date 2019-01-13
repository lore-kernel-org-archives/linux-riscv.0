Return-Path: <SRS0=5F/0=PV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509CCC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 13 Jan 2019 23:04:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF7120842
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 13 Jan 2019 23:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T+KI+mYb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF7120842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fit.cvut.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPPOBCVkM2F4UdlHofnicXJeBrthz3lRfOkjjFL3gaA=; b=T+KI+mYbpytzO4
	XgdbiHYCssfUf/ZAoXP/TbNO1XbyvY9gO6OPcDfw+0KJZXijususJE6977IptV7lHkSNHTSfFe2iw
	ikZ4Lk1nqApl9/ZSFsW1xiaQq5US2+cRPkQbnbcEiZc5m8MqT66ZfuEtFx1RWCIbcT+Aubo5P/TtM
	O3MuhZ4HsoE7J00kPcJtqHLfMLNptVzdIr8I8R6sm9mVzyPrPfG+qNE7KpUVbMp5Gt4K+gaLgBRCy
	vGQcEEqVw6CqWtHuvXoyl0Gq+AqZ/NGwv+K8rajcuaO880rOQv8LFsZT1WJqdM1IbBkVUaf9yDw1i
	hCgAKi8CQ96jBvmzzNew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gionP-0003Pa-IA; Sun, 13 Jan 2019 23:03:59 +0000
Received: from relay.fit.cvut.cz ([2001:718:2:2901::237])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gionK-0003Ok-Qs
 for linux-riscv@lists.infradead.org; Sun, 13 Jan 2019 23:03:57 +0000
Received: from imap.fit.cvut.cz (imap.fit.cvut.cz [147.32.232.238])
 by relay.fit.cvut.cz (8.15.2/8.15.2) with ESMTPS id x0DN3e5Z035662
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jan 2019 00:03:42 +0100 (CET)
 (envelope-from jan.vrany@fit.cvut.cz)
Received: from sao (027906ee.bb.sky.com [2.121.6.238] (may be forged))
 (authenticated bits=0 as user vranyj1)
 by imap.fit.cvut.cz (8.15.2/8.15.2) with ESMTPSA id x0DN3b2x000616
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 14 Jan 2019 00:03:38 +0100 (CET)
 (envelope-from jan.vrany@fit.cvut.cz)
Message-ID: <a6c6f9004f6e46f51e78958f330c7b136b664248.camel@fit.cvut.cz>
Subject: Re: Ethernet performance issue on HiFive Unleashed with kernel 4.20
From: Jan Vrany <jan.vrany@fit.cvut.cz>
To: Andreas Schwab <schwab@linux-m68k.org>
Date: Sun, 13 Jan 2019 23:03:37 +0000
In-Reply-To: <87bm4n8he4.fsf@igel.home>
References: <69e7b1cae1168ac2d8c0e477183be9fae95b8cc0.camel@fit.cvut.cz>
 <87bm4n8he4.fsf@igel.home>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190113_150355_229458_9AD3D521 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: linux-riscv@lists.infradead.org, Boris Shingarov <boris@shingarov.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2019-01-11 at 14:15 +0100, Andreas Schwab wrote:
> On Jan 11 2019, Jan Vrany <jan.vrany@fit.cvut.cz> wrote:
> 
> > The sources I'm using are here: 
> > https://github.com/janvrany/riscv-linux/tree/users/jv/riscv-linux-4.20
> 
> I'm using essentially the same patches, but there is no issue with
> networking.
> 
> https://github.com/andreas-schwab/linux/commits/master
> 

Thanks! I compiled your very version (8d1cfe95) with my config
and the problem is still there. Could you please send me your 
config? Perhaps I'm missing some option or something like that.

Jan

> Andreas.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
