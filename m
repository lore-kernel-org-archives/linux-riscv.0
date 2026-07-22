Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB18EC44532
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 01:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3UcWXSLkkfO2xtROD1ix7T00zldAlpl/CVo33JPQyU=; b=yCcBNcczBOxmia
	MwzdtLz423MKLzF/CwHjMgatnHnX1Z+wlE7E8xQv73D0Q5y6Ypfmsn3UYZNNL967S29WLifFWh6M1
	u3PqYd8b3kY9mw62ayQ3SiPfPNXK5n8o8HlPgqbdtN7W2YTfpmZ/wgqIrySEdMzdYeRWhioRoB2YY
	WPkEgMRiozLhcgPw2RYUtGu5WaP3IINBBSfdd4lTq2ONNlpeDf0mTsa+ivGODoJzjt08lOAM02arW
	Cg/zjW/o/jLKczvJxL89q5Px78FTKgmhSADu/CXn3x2aFokYeoUJ3T0Gol7MaelAY5Y1kfqz3FFMQ
	tFZe87suN5DZnLLehuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiHo-0000000D2cu-1C6g;
	Thu, 23 Jul 2026 01:31:44 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiHj-0000000D2cL-0hC5
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 01:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784770271;
	bh=yAUgDyUzgV75t775RLHTRzDx+K4j+WGYlepCAavK6fk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=euB0T8Bx/i9rRTN6jwE6AlDP1WWON/3T3R7ire95ch6WU67NVsFN1nhS2SRWnFBDE
	 sUW3MdVUZRt57YJKSeGLJGiyJNcdz9tu15yhW/miX53Ez9jtRvmEZBMKgRF4W6gasu
	 v64Ki8u2PbexVxAzQ2ZgFWGaEFt+BNpgTI50url4=
X-QQ-mid: zesmtpgz8t1784770263t38c77256
X-QQ-Originating-IP: bVYjHVoJ/jFoyrpIdXFPpgw76CxkbZdkCUD8fa/J0hs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jul 2026 09:31:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15860423990033171300
EX-QQ-RecipientCnt: 9
Mime-Version: 1.0
Date: Wed, 22 Jul 2026 05:15:29 -0700
Message-Id: <DK53C3CZF06Q.37189IIFM8VQ3@linux.spacemit.com>
Subject: Re: [PATCH] i2c: spacemit: request IRQ after controller
 initialization
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Linmao Li" <lilinmao@kylinos.cn>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Andi Shyti" <andi.shyti@kernel.org>
Cc: "Yixun Lan" <dlan@kernel.org>, "Alex Elder" <elder@riscstar.com>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260722094302.2284191-1-lilinmao@kylinos.cn>
In-Reply-To: <20260722094302.2284191-1-lilinmao@kylinos.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N4ZILu3POr3OIwaScrzSHsGFbS/q61DUNQMJU2jFaZjB2/oKABASSbJP
	0K+0muEUQkohCHwbrte8Ln6u0NE/P3OpSkPwBdnfs+EcXZwcR/47PboHuWJ1QgDPVz5kg3I
	d7O+ANDZXGAQkFOjEH+Dq/0KJ0WRpztB9ooMtIyNOeOUsCBgOz287NSiQwaZrWhBddMvkRS
	XuCaMarClzNoAJKmnnyyYVua7g4WBZ8pm7wcNwnI0CTNKrV+EMNFlAXssfwGIGS9TySscEj
	RdFOnoeluM1cX7nCMr1oyIq6b6Xl9qI0gl1mucxOF+tIiVarDUlOpmRW5Olq7/DSb5qM8qu
	rKqB9yp2ZGfnmdHu/+uVeFzb4W82OHLTR/T6OY6Zri9dOAfrEdbmNsVh2QuddOCpRwjvJ0B
	HOJlzYPBqjfAF20fo2ox5PbXyt8uMKJdnUvNz42j6AOMMIrFU2vYrIOGSmseCVKWbXyb9Q3
	A46LH/uhoRdcGiK2OABnjrE59pFTkIfwOWtusz7zCeK6kS9LcD4A1rjgfbprI2eUxOfr0n2
	b053nRk3PEsN9I0wzbX7XscKmmadu+WnFNkFvseRSkiiNKnsrP55OPbVgyMtUkGzWw6FxwO
	JZbT+/Vqk3UpobQQX8apVMLyo7Rx+CLgeHXrARLfn9mQwTizHou2PrVLFCZEgQZWP5/J7PH
	64F6Fb1IHKLPECjxDAPw3W9zMTjz//SL25D6w0txmyNg0rQbEWkNaI0dGGglawPexl7KXOc
	6QdcUVgdekVR+FIj1S4Qt2UTX6XV8U/we12hDpd40zT+nblKYAbjhPQ3VFuPoXRvI2U7GJu
	anrN54LmqsO9ZEVfSbNq+knYpM3kUzf4QacxnfAyoErbhcMbuS6oYLth0OXlFJiIffTEv9F
	YBb5RYq0oCsR7jUwrz9ohhVbYi97Is3yi1yhmRJ8ssAC0i/ceZTof5ebocvvD/jzfCl1NMe
	uAuLU/tYd9hbet8BsXq2rXUHyf/Xw+V8mIHVk9TPemmAzXYr9Zpp3X9bkdqPhcE6fMQW5WB
	GUguvK3qtZc3I6Hu26eEfmaNDzE6U8TZHlB6MqVQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183140_247109_80E27CE1 
X-CRM114-Status: UNSURE (   6.42  )
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

On Wed Jul 22, 2026 at 2:43 AM PDT, Linmao Li wrote:
> spacemit_i2c_probe() requests the IRQ before it enables the clocks, resets
> the controller and runs init_completion(). If an interrupt is already
> pending, the handler runs too early: it reads registers while the clocks
> are still off and calls complete() on an uninitialized completion. Request
> the IRQ after the controller and completion are initialized, but still
> before the adapter is registered.
>
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

This should also be applied to the stable trees. Please add:
Cc: stable@vger.kernel.org # v6.15+

                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
