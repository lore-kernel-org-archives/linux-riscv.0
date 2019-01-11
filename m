Return-Path: <SRS0=/Bz6=PT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74D6C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 13:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A482084C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 13:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ICjdynYX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85A482084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iPu0YmfK9CrzgyY14JNfj1CJgPGpEBS1wlNTeCj6PI=; b=ICjdynYXKFAezz
	aLUB+H29D2AVHrp8EOvt9iLxG/dcuah7Hju0DKIImCfEMyJShr9ql4cwiJO4LRhYiUwc1PfPmTUdT
	egVqd+oqZGZKdGxmiL4IydOxJo/zwRuXwjREUzzs24sbXXQDnne+nqP2Vlu5e2U+b76niAjzk8JZ2
	qEqc+P20AB5MAtajNs/KsGFYhS6ZW5Dl3NI76dFaBFuyyM2S6BabByJjKlR/I2h+SFWPFW9nncZHf
	u7B2gMbRapl3KZIH05YG0pG7ObmnCBjVtogSXnKJHbkLX0RXaA6aBdr2TwxaYGnrU4oQegFkAJM5i
	PGxhLevjcBGxtZkLwGZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghwez-0000FO-Ac; Fri, 11 Jan 2019 13:15:41 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghwev-0000ER-TO
 for linux-riscv@lists.infradead.org; Fri, 11 Jan 2019 13:15:39 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 43bjz92m1Tz1rXZj;
 Fri, 11 Jan 2019 14:15:33 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 43bjz928FLz1qvX5;
 Fri, 11 Jan 2019 14:15:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LGN--UHkji75; Fri, 11 Jan 2019 14:15:32 +0100 (CET)
X-Auth-Info: DYRP1EZXGh8vxtmBqbRGLXBr1Vv7MWpP+xW5orXrtjVL0yjIAehCxQQoHnc4h8ov
Received: from igel.home (ppp-188-174-158-90.dynamic.mnet-online.de
 [188.174.158.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 11 Jan 2019 14:15:31 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 7917F2C174A; Fri, 11 Jan 2019 14:15:31 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jan Vrany <jan.vrany@fit.cvut.cz>
Subject: Re: Ethernet performance issue on HiFive Unleashed with kernel 4.20
References: <69e7b1cae1168ac2d8c0e477183be9fae95b8cc0.camel@fit.cvut.cz>
X-Yow: TATTOOED MIDGETS are using ALFREDO in their SALAMI FACTORY!
Date: Fri, 11 Jan 2019 14:15:31 +0100
In-Reply-To: <69e7b1cae1168ac2d8c0e477183be9fae95b8cc0.camel@fit.cvut.cz> (Jan
 Vrany's message of "Fri, 11 Jan 2019 12:12:11 +0000")
Message-ID: <87bm4n8he4.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_051538_099203_1C6FED4C 
X-CRM114-Status: UNSURE (   7.92  )
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

On Jan 11 2019, Jan Vrany <jan.vrany@fit.cvut.cz> wrote:

> The sources I'm using are here: 
> https://github.com/janvrany/riscv-linux/tree/users/jv/riscv-linux-4.20

I'm using essentially the same patches, but there is no issue with
networking.

https://github.com/andreas-schwab/linux/commits/master

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
