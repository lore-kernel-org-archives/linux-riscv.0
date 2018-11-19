Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CC1C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 15:13:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6770120831
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 15:13:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aT65R02q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gTYRIiY7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6770120831
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQv+Jyu1aYDqF2w6iBxT7k83dS8wHWx2nbh2Phvhuco=; b=aT65R02qjTTFzp
	Nkfi6IPovEQnvNNLggB1v8rMmK3tcSooOaAzcWfoldLC2Bn3EFUg+7ypktBbm3pTtfmMuVc8Q0xZh
	TWz6zMyxEPtN1kqyfVhbd5hRJ92I/XDoulJ6yZQAEW/6iiNzOJtskNkVDRcvqsLNbw7qQmb8daBH6
	qgoXW+lOeUu9fdHtNHGjo1Ck70HI4O+ShF91nO77A4QgBFYinpD1v+Joq6WA1VYceMOvYoHMaPYDu
	4wXc8/8pmCcz3omVM9qo7mutN7h+o/CcRfy7obD6O/p27ZeI4h1QmWZ+1dVxvFF0wTe6Fia23bXeD
	i/dEukME8+FlR1nCPBxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOlEv-0002dU-Qo; Mon, 19 Nov 2018 15:13:29 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOlEu-0002dL-19
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 15:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DyykKU1qH3iKI+3ka6cVj5KOie3dt+/7CwqPyeu6Emc=; b=gTYRIiY7f8Kxf+MV9SDHSJj6U
 cywuM0ZzCfksXaFGvnNbRNRBbkxspwQZni5s3z3S9Abs7vq7ob1fcTFPo+j1G5ZDwgodBr9hKelkA
 lpx2eAHF9a7o1sGPTU362uTmy3KwwYCGIfwRW0tQc3AucGyqvC4ztwWxaqAVL+X/clFiVOKUG+Hj+
 gcqQOB088VtXnz7KGaXzCiQF8joWMkuk797IJBtZTdncO+g4QFV0kzese0KhrY1iBnmy7QGmO7UwN
 OMxPtRBo3mqGYNxahrxGY2FtMd5vC8Ysxi0stlpeltNjauSMhEggLT2sJTvt/IIzQlUlIfgKCOnz8
 KwEy42qtA==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOlEr-0000qs-9b
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 15:13:26 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53372B00E;
 Mon, 19 Nov 2018 15:13:11 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 1/6] net: phy: mscc: migrate to
 phy_select/restore_page functions
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de> <20181119151057.GC26852@lunn.ch>
X-Yow: Either CONFESS now or we go to ``PEOPLE'S COURT''!!
Date: Mon, 19 Nov 2018 16:13:10 +0100
In-Reply-To: <20181119151057.GC26852@lunn.ch> (Andrew Lunn's message of "Mon, 
 19 Nov 2018 16:10:57 +0100")
Message-ID: <mvm4lcdaynt.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_101325_447455_E1C51B5D 
X-CRM114-Status: GOOD (  16.84  )
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
Cc: alexandre.belloni@bootlin.com, f.fainelli@gmail.com,
 Quentin Schulz <quentin.schulz@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, allan.nielsen@microchip.com,
 thomas.petazzoni@bootlin.com, linux-riscv@lists.infradead.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119151310.WJSYsJ-ohTUpMQtFdyZdo6lrr0kl2Q9_o8X2L2tbBt0@z>

On Nov 19 2018, Andrew Lunn <andrew@lunn.ch> wrote:

> On Mon, Nov 19, 2018 at 03:57:17PM +0100, Andreas Schwab wrote:
>> On Okt 08 2018, Quentin Schulz <quentin.schulz@bootlin.com> wrote:
>> 
>> > The Microsemi PHYs have multiple banks of registers (called pages).
>> > Registers can only be accessed from one page, if we need a register from
>> > another page, we need to switch the page and the registers of all other
>> > pages are not accessible anymore.
>> >
>> > Basically, to read register 5 from page 0, 1, 2, etc., you do the same
>> > phy_read(phydev, 5); but you need to set the desired page beforehand.
>> >
>> > In order to guarantee that two concurrent functions do not change the
>> > page, we need to do some locking per page. This can be achieved with the
>> > use of phy_select_page and phy_restore_page functions but phy_write/read
>> > calls in-between those two functions shall be replaced by their
>> > lock-free alternative __phy_write/read.
>> >
>> > Let's migrate this driver to those functions.
>> 
>> This has some serious locking problem.
>
> Hi Andreas
>
> Could you be more specific. Are you getting a deadlock? A WARN_ON?

See the stack trace.  That's where it hangs.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
