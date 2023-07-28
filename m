Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EF5C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTbj9BIF+s99S8GcpVIDRNND5xXd+kfJq72i6khYyHo=; b=zIC6vGX2fNtDj/
	YFcEZZhj7wZCkdFMHgS0MuYpyerDnge3aPBijxMgA1WSmM5uEk5YwjNyKeN7RnQ0VGziPUjYwQBie
	Ez6YQ8IQCbHv3jNRqRnzUbesOivI5GquNCwIH0Mx+Ar190UUqFP0MvT9F93o81dzuMIEj1lKgA/UU
	e+6BCTaKyZdNvEhm1ALcyuQlyi0QLobCCASuy8dDlKfhIFcbOqgp9lS251HEDqOekuclVfCHSNj/n
	nXfZuSlzTH+VYklTyEI1hnHOUMzY4fVwkE+DQ6O8sdboJ4tQ2uKscjUhwxsIMrldNh84h5kbR/C3D
	DWXem4jD1rZSvQO3v81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPL5X-0030xL-0C;
	Fri, 28 Jul 2023 10:52:51 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPL5U-0030wk-0J
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 10:52:50 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4RC4Gg5LkGz1sBqx;
	Fri, 28 Jul 2023 12:52:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4RC4Gg2JqRz1qqlW;
	Fri, 28 Jul 2023 12:52:43 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id 7DaC5YOn98cw; Fri, 28 Jul 2023 12:52:42 +0200 (CEST)
X-Auth-Info: ER/e5xJ+bZh/E/nl0XDogkAwrCn1t4QiEXc4uGOYPrg14xKWC6y2j4rcN0nnCk4o
Received: from igel.home (aftr-62-216-205-91.dynamic.mnet-online.de [62.216.205.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 28 Jul 2023 12:52:42 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 5FBE22C1B31; Fri, 28 Jul 2023 12:52:42 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Petr Tesarik <petrtesarik@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: How to deal with openSBI reserved regions?
In-Reply-To: <76ff0f51-d6c1-580d-f943-061e93073306@huaweicloud.com> (Petr
	Tesarik's message of "Fri, 28 Jul 2023 12:02:49 +0200")
References: <76ff0f51-d6c1-580d-f943-061e93073306@huaweicloud.com>
X-Yow: I want to kill everyone here with a cute colorful Hydrogen Bomb!!
Date: Fri, 28 Jul 2023 12:52:42 +0200
Message-ID: <874jlo9ukl.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_035248_286039_76750064 
X-CRM114-Status: UNSURE (   6.55  )
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

On Jul 28 2023, Petr Tesarik wrote:

> Or, is the provided DTB incorrect?
> Should the memory node exclude the firmware area?

It should be marked as reserved memory.

# ls /sys/firmware/devicetree/base/reserved-memory
#address-cells  mmode_resv0@80040000/  name
#size-cells     mmode_resv1@80000000/  ranges

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
