Return-Path: <SRS0=euR7=ZM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE4BC432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2019 10:24:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 889512243F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2019 10:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="txi2fUjs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 889512243F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:From:Date:
	MIME-Version:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PpQLxZ7UZDRwFOJXS86glOOK+SBO7f6YmwjyBtPZkQY=; b=txi2fUjs7r2Oi8T6T5mMVqHdT
	yqlwn6hfeRWf24lO0f91fk39SPv5mpUKokMeulac3L+XY+uuUMvINt76p2X0vhtZ+AvifNRgSH77j
	ZrCVIoVRdrwUCsQ+HdFd5MTiwcPv+Pa3sYtnKjqOQ1OPhJaOGAPmuAxitpIJfmd+xmFsxprsiEEzo
	9pGwUWp0+amfGucgkYrGGIfNik7wvm4ld91TOKa5pDhpg62GdNiWBq2o1zjGmitPGUdwaorNMkWlp
	3zBdU9Uy2WqPGZI68Mnxn9qsyuc8ae/Hopz8xuQ4+7hXBfzJmaNqymuOiAZGj7rIyNwGtssTUHjYm
	HgFGKQtuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXN9m-0004dP-Ax; Wed, 20 Nov 2019 10:24:18 +0000
Received: from inca-roads.misterjones.org ([213.251.177.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXN9i-0004cr-JP
 for linux-riscv@lists.infradead.org; Wed, 20 Nov 2019 10:24:16 +0000
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1iXN9a-0001Lb-Iw; Wed, 20 Nov 2019 11:24:06 +0100
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 1/5] genirq: introduce =?UTF-8?Q?irq=5Fdomain=5Ftra?=
 =?UTF-8?Q?nslate=5Fonecell?=
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Date: Wed, 20 Nov 2019 10:24:06 +0000
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1911201034240.6731@nanos.tec.linutronix.de>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
 <1574233128-28114-2-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.1911201034240.6731@nanos.tec.linutronix.de>
Message-ID: <31ed00455bd8374b26ea6b649c14e288@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: tglx@linutronix.de, yash.shah@sifive.com,
 linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, jason@lakedaemon.net, bmeng.cn@gmail.com,
 atish.patra@wdc.com, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_022414_781097_A1BC93B7 
X-CRM114-Status: UNSURE (   6.15  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 jason@lakedaemon.net, atish.patra@wdc.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, palmer@dabbelt.com,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-gpio@vger.kernel.org,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, bmeng.cn@gmail.com,
 Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2019-11-20 09:34, Thomas Gleixner wrote:
> On Wed, 20 Nov 2019, Yash Shah wrote:
>
>> Add a new function irq_domain_translate_onecell() that is to be used 
>> as
>> the translate function in struct irq_domain_ops for the v2 IRQ API.
>
> What is the V2 IRQ API?

I believe that's a reference to a rather misleading comment in 
irqdomain.h:

#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
	/* extended V2 interfaces to support hierarchy irq_domains */

which we could drop, as everything refers to hierarchical domain
support.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
