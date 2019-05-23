Return-Path: <SRS0=tx4i=TX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781CFC282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 12:49:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A8F21019
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 12:49:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oIg4qghj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48A8F21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fr6qnjxY+ksP/a4VJYKmY9i1r1SbG/COyDzxkJBAAnM=; b=oIg4qghjhxvZIF
	0OF4R6Lz8GxMMj5M0QtxyiwNFct+Ih6s8qurZEqdJdo/gF8ZezagwQ03vut2C4t+7XzgMqQwPAWxf
	WrD4cVQhCZnO8ayf1Ohgn3kfvpcg31Sqkxlsy2W4/fPQHB7Z84swoe81ll37S2zblJjxeR0MGWQWv
	fl3azjgjhs74ZR1YSHR1axs4Wp4ZGV8fIb2obSPR7OBYBuF/sJaUSsHO0Z3S9EJfT5VSG2J32T/QB
	nniUl1u11qEli/LqxNQugq35T7l948DDIy7gzDQHf46RfzixolemJ7fVpUmrl1KMqSeZ6BKpE1uen
	TZ1TCunolKTpr6a1BjkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTn9v-0001Py-BI; Thu, 23 May 2019 12:49:23 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTn9s-0001Jb-Fo
 for linux-riscv@lists.infradead.org; Thu, 23 May 2019 12:49:22 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0EDE5AEBB;
 Thu, 23 May 2019 12:49:18 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 0/2] net: macb: Add support for SiFive FU540-C000
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
X-Yow: Don't worry, nobody really LISTENS to lectures in MOSCOW, either!
 ..  FRENCH, HISTORY, ADVANCED CALCULUS, COMPUTER PROGRAMMING,
 BLACK STUDIES, SOCIOBIOLOGY!..  Are there any QUESTIONS??
Date: Thu, 23 May 2019 14:49:16 +0200
In-Reply-To: <1558611952-13295-1-git-send-email-yash.shah@sifive.com> (Yash
 Shah's message of "Thu, 23 May 2019 17:15:50 +0530")
Message-ID: <mvmwoihfi9f.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_054920_749977_5337644B 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 netdev@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, sachin.ghadi@sifive.com, robh+dt@kernel.org,
 paul.walmsley@sifive.com, ynezz@true.cz, linux-riscv@lists.infradead.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mai 23 2019, Yash Shah <yash.shah@sifive.com> wrote:

> On FU540, the management IP block is tightly coupled with the Cadence
> MACB IP block. It manages many of the boundary signals from the MACB IP
> This patchset controls the tx_clk input signal to the MACB IP. It
> switches between the local TX clock (125MHz) and PHY TX clocks. This
> is necessary to toggle between 1Gb and 100/10Mb speeds.

Doesn't work for me:

[  365.842801] macb: probe of 10090000.ethernet failed with error -17

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
