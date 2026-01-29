Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E686ED358F2
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERMLYzQ9U6XZgjE9UYRcUpjS+6cWcXboifEcSpDd1Qg=; b=k6u6Y74DlwYrCG
	piMb1cYMC1hwLzLr7Vr1wbANzRBlE2DnffSAovaZRLejOp9aRPe7Pq4QCsXu8PxKyrapkZ+nlCmsz
	lb1RGEZnx2LbM0o/VNAztm8vsUMSpOjg0Xt5ofbvStphiogASNZUos72IFAqVXO4qbDst8LGAK6F0
	qzh5DYodRaspgB7SUxwao2e2BpYyQR3+w/D3WZrD7GCok0n5OBKPHj0jYp04XuSkFEEex0dzmDbbR
	mfGtiBDhYY0L5zyxvMsDnWoE0M8anxxggCUeqctr+MSkhvcpILYVTkLxaFRYro0gbue/dsYBLXBqO
	m8iAoIR4bz7fppjlonXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOpK-0000000HXyu-0UTv;
	Thu, 29 Jan 2026 10:00:38 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOpG-0000000HXxS-1o7c
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 10:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1769680734;
	bh=kSD46m1ogNc6zC/u0ZXCX57K0B/t6fYmWXp2hGNifYg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=vuYThn8U74BN0Yu/AvpQUIhw2sjpSDauoYx47je587NroJVJ1KMemGuf6sgerOqT3
	 gLcCg6YCGb27FBP+rj1VFtSXIxsiosv+Sh7FVHCfQ0gnYGYLLKku8NT/xi0F2qcO0E
	 mHZsOq5HGe2rkvQnMJS7WyRN1VgkQ4r8VdZE51fQ=
X-QQ-mid: esmtpsz19t1769680725tf47f9eb6
X-QQ-Originating-IP: NwNr+iF54gvctsdaQA7HUEs9uDmvl39kJiwn0igpLYg=
Received: from = ( [183.48.244.175])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jan 2026 17:58:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11216958157623042392
EX-QQ-RecipientCnt: 11
Mime-Version: 1.0
Date: Thu, 29 Jan 2026 17:58:43 +0800
Message-Id: <DG0ZGKX13IY6.3798PMYUYKW8P@linux.spacemit.com>
Cc: "Andi Shyti" <andi.shyti@kernel.org>, "Yixun Lan" <dlan@gentoo.org>,
 "Alex Elder" <elder@riscstar.com>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Troy Mitchell"
 <troymitchell988@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH v6 0/2] i2c: spacemit: introduce pio for k1
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260108-k1-i2c-atomic-v6-0-41b132b70f68@linux.spacemit.com>
 <aXlBe1CHq_HbbpCR@aurel32.net>
In-Reply-To: <aXlBe1CHq_HbbpCR@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NkXVHN8YrGFczZQ7FM3RkHP7vr+sTE0CKkTDV9CnTExoPslZtViOeYer
	w56BNkalZLAOO98MhR4uno5JcjbJ90IF0lzl/sKKQvKZPj1RTEc5zOAhaOi6W4rh2jXtKf4
	IxeW5+1FJ3bOXwsVRSGvaUsk7md+M1WhcTqZ7RwXimQD3cIg2Aic20RzZpMXxed4YfNkho5
	FDTMkIW9M1kfFLTlUXi3PSAwOSdUcjf2CMeZ8d4pZrxZxNOKlFxEhv9lV2xfXZcEpyr1TkB
	fJI4Z7q4TFj+PbOyYJYh7pDrqIPK3SvhBuoskq70SnlJfjtDjgGslr5D8y9+di0yGkXw3Z9
	tCQcTyY2igy7s7Iu91f0BBC8LscpzudT2gRzd9BIxFUmjV0eUzPddLGTnC7mH/RYvw531q7
	mnteJwmIosekp4PN7bWX59IjALmcWCvGGGAA5nR0c1Od5I94jW2mmin5iYbgYLMKHWiM09e
	yrw1BfD5o9+TUkXbe5a5dLeGzFQGtmwrcdA3nh5IR/85x1m80jXBjC1/t8OePAWb8N3ofFJ
	+A/I+J1++qW4y5v+vFsIQ2QLXq67eKsoqJ0iRq0cXHty6XCnpjSSx7yYNXTaadIF55/Wz5e
	A1WCK1qA9z+lUdmo6Ix74lzrCkr4UNHXoeUUblBboKvy9Qib9/GKz615VL+fcIYuoRu551T
	6uXchD7Li14LXmLn6OyT8n4jQHR60OPZAkyW8pjJW+KuJzkb2qb/o5hO2mfSdKo5NO1kZnA
	1+vjLEEyXmJgXSUzMlqQiuQyXisFdnRQpoaGDpdGEdy7TxpBf663WoLFU72lb+/xpcvQqoy
	hN3J+el5WhUHIsLoTJOmmLNKr9abvvh9Nx+gG/1m7Z9UhxP8I9xxhcr4pi8gP1+yDpsZm/h
	iQDQRWMUIylKK5eiWaSvT26pZ73/RPexYCoaAdKtVhpx9+hFwR7jKVxXwZnWFORB1KQj5SS
	70irZrJtozX2H3djB1nQnQ1PN4EpDcadqb3zaGRcM5YzvvV3QJn0rZ3DKAh6/spQflspO1k
	436fGMA6nZj18btAQKtHZJ43RaLgy4gZJHW2FQQ+VFZUNRyCvrs+2vQj/V3nqCTwD/gu2dR
	FyaIzzkq/R8
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_020035_449552_59E9E787 
X-CRM114-Status: UNSURE (   9.04  )
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

On Wed Jan 28, 2026 at 6:51 AM CST, Aurelien Jarno wrote:
> Hi Troy,
>
> On 2026-01-08 15:52, Troy Mitchell wrote:
>> This patch introduces I2C PIO functionality for the Spacemit K1 SoC,
>> enabling the use of I2C in atomic context.
>> 
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Troy Mitchell (2):
>>       i2c: spacemit: move i2c_xfer_msg()
>>       i2c: spacemit: introduce pio for k1
>> 
>>  drivers/i2c/busses/i2c-k1.c | 314 +++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 237 insertions(+), 77 deletions(-)
>> ---
>> base-commit: 003e84792ce811256114dee4f4ecc1cafdab2b0d
>> change-id: 20250814-k1-i2c-atomic-f1a90cd34364
>
> This patch series got a few comments. Do you need help to address them 
> and send a new one?
No. I'll address them ASAP.
Thanks!

                                  - Troy
>
> Thanks
> Aurelien


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
