Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B730EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 09:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C43D20651
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 09:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pH4gLiiP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C43D20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fit.cvut.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4XGkMJonkLwXx35p+fx96pInoTjkMHd4M4wbbXu/JI=; b=pH4gLiiP9rranS
	SNBurshNT6IUOmCuR0x/6qE5N8kxdeSRM/Bicjr0xBsKCTQHWsei5jixYX6erD8HjKv5yM1sjKb8S
	BCiw8sqfwdbPFU4ByjIIjyT3euhQmRHElgl7o4umsJZSR7u+LiaPJilwFfk6z+Qx0nlObdJS3Hqhb
	yyK3kaAPt9H8hBOu0g98iFVW2q0x7oHVrBZey1jugRRb+CJ/KiHPreuhC1P/DyeLvMidGw1vTDdX8
	QRjcRfI3YM5CsVo9lgnDS5ULGw8BHOPfVfK4CYkgseBIMoNXBWJUzOJ2k8IucqPB6POZPRIXY3G9n
	sdieke91pAgIb24OPa+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjKtf-0001X7-WA; Tue, 15 Jan 2019 09:20:36 +0000
Received: from relay.fit.cvut.cz ([2001:718:2:2901::237])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjKtd-0001Wf-AT
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 09:20:35 +0000
Received: from imap.fit.cvut.cz (imap.fit.cvut.cz [147.32.232.238])
 by relay.fit.cvut.cz (8.15.2/8.15.2) with ESMTPS id x0F9KIp3086731
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jan 2019 10:20:19 +0100 (CET)
 (envelope-from jan.vrany@fit.cvut.cz)
Received: from sao (027906ee.bb.sky.com [2.121.6.238] (may be forged))
 (authenticated bits=0 as user vranyj1)
 by imap.fit.cvut.cz (8.15.2/8.15.2) with ESMTPSA id x0F9KGkO048483
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Jan 2019 10:20:17 +0100 (CET)
 (envelope-from jan.vrany@fit.cvut.cz)
Message-ID: <5dbe411eecfed2a1bb60db4afd65265904111604.camel@fit.cvut.cz>
Subject: Re: Ethernet performance issue on HiFive Unleashed with kernel 4.20
From: Jan Vrany <jan.vrany@fit.cvut.cz>
To: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 15 Jan 2019 09:20:16 +0000
In-Reply-To: <878szneeao.fsf@igel.home>
References: <69e7b1cae1168ac2d8c0e477183be9fae95b8cc0.camel@fit.cvut.cz>
 <87bm4n8he4.fsf@igel.home>
 <a6c6f9004f6e46f51e78958f330c7b136b664248.camel@fit.cvut.cz>
 <878szneeao.fsf@igel.home>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_012033_662247_6CC6C580 
X-CRM114-Status: UNSURE (   7.29  )
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

On Mon, 2019-01-14 at 11:14 +0100, Andreas Schwab wrote:
> I have already moved to 5.0-rc1, so here is the updated config.
> 

Thabks a lot! 

I think I found the problem.. The issue  was that RX/TX rings were
for some reason too small: 

root@unleashed:~# ethtool -g eth0
Ring parameters for eth0:
Pre-set maximums:
RX:             8192
RX Mini:        0
RX Jumbo:       0
TX:             4096
Current hardware settings:
RX:             512
RX Mini:        0
RX Jumbo:       0
TX:             512

Setting them to max before bringing the interface up
seem to solve the problem:

ethtool -G eth0 rx 8192
ethtool -G eth0 tx 4096

Thanks for your help! 

Jan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
