Return-Path: <SRS0=k7QB=MW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D3FC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:29:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 240612087A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:29:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GxM+1Ph2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 240612087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2F87DMJJh+4asKS6N2rPj0aMgQxz5faU2SE9dx8nBVc=; b=GxM+1Ph29Iqs+v
	0QW+xMynDCjF+lbdi1QMuRSCLhkKViVRkOoafrqv5o4hooXlG5jreOYqOaIhJfKSznwDrCyrQhgsd
	wnriKkcy6rxt1ToPIvzUdBq9pZWSfszSR876CrfaKHG1LMsvVazUWP4kxtbug9ob0EOiWXeAl1ytq
	CE8Q2UdHfvBRf4AnvotXzEOkwNmcaLzWYUzgn1EV92qUfH0ChokqIsrV76tCcpE6aGU/rY8bMEe9+
	UzJvIaD1LuR1tRcd4IO7qyk3hRVuHdEmLeXY3i5B35UYzkKOBV7v+GBP4Ls7/JxD7Dw6SGk8cBdLZ
	67lrGoXDDwAeB54FHaGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAEY2-0008LA-Kp; Wed, 10 Oct 2018 13:29:10 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAEXv-0008JP-H9
 for linux-riscv@lists.infradead.org; Wed, 10 Oct 2018 13:29:09 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D12ACB0BC;
 Wed, 10 Oct 2018 13:28:51 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC 4/4] gpio: sifive: Add GPIO driver for SiFive SoCs
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-5-git-send-email-atish.patra@wdc.com>
 <mvmo9c22bx2.fsf@suse.de> <20181010131255.GB29142@infradead.org>
X-Yow: ..  So, if we convert SUPPLY-SIDE SOYBEAN FUTURES into
 HIGH-YIELD T-BILL INDICATORS, the PRE-INFLATIONARY risks
 will DWINDLE to a rate of 2 SHOPPING SPREES per EGGPLANT!!
Date: Wed, 10 Oct 2018 15:28:50 +0200
In-Reply-To: <20181010131255.GB29142@infradead.org> (Christoph Hellwig's
 message of "Wed, 10 Oct 2018 06:12:55 -0700")
Message-ID: <mvmk1mq2anh.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181010_062903_717765_938A85B7 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181010132850.Hlo3oHzWjYVCJxZa90VcYQ6uvIaTn0unLi_HuxRhevM@z>

On Okt 10 2018, Christoph Hellwig <hch@infradead.org> wrote:

> On Wed, Oct 10, 2018 at 03:01:29PM +0200, Andreas Schwab wrote:
>> On Okt 09 2018, Atish Patra <atish.patra@wdc.com> wrote:
>> 
>> > +static void sifive_set_ie(struct sifive_gpio *chip, unsigned int offset)
>> > +{
>> > +	unsigned long flags;
>> > +	unsigned int trigger;
>> > +
>> > +	raw_spin_lock_irqsave(&chip->lock, flags);
>> > +	trigger = (chip->enabled & BIT(offset)) ? chip->trigger[offset] : 0;
>> 
>> This should use test_bit instead.
>
> Given that this apparently needs the spinlock for atomciy with more than
> just the bitmap test_bit would be rather pointless.

BIT and test_bit/assign_bit are not compatible.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
