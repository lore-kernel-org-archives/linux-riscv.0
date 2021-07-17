Return-Path: <SRS0=adiZ=MJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DAAC636C9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jul 2021 06:56:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11324613AF
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jul 2021 06:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11324613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRosGoyCY6VJ1ntvab7eQmpsB5LPcTVOUZnY4ut25e8=; b=MHY8g0/9t7BpKV
	6JaP3CSB0kUmfWnCtBU+N05xYycVi00nMXSx65WeGIPu2NJtyXP7yExzmoAZYeBvtCIPDWenMc9ph
	AIAhWbix1xLa2mh9E8pCBtPu/ulhMuaRD4ilqsB/+TuBI2kCGn32MVCDYhEUumlaH8Q7C+lh3rS68
	1gZl3v+Po8MInQrED3wNA3CX5C+b2tTwxKkDRVBw2gJFsBVtrhFihxCkDyQmy7vBQgu+RrLtS723o
	PTwpZ0lFlBzdQcVDdBuIUhHYvLc7Bua/jGdJxkfPmhsmEmAtjLiMsb8HN0GIhibIVT4gq05IfyLDD
	dfMmrH2C0gHAG4w6284A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4eF1-0064xa-Am; Sat, 17 Jul 2021 06:56:03 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4eEy-0064wd-Bu
 for linux-riscv@lists.infradead.org; Sat, 17 Jul 2021 06:56:02 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GRf5P0WMxz1qwGh;
 Sat, 17 Jul 2021 08:55:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GRf5N6Vjqz1qqkp;
 Sat, 17 Jul 2021 08:55:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id S-rncmjGV8P5; Sat, 17 Jul 2021 08:55:51 +0200 (CEST)
X-Auth-Info: ttBBSncvPvWxCsoB24c5cQK0+OdIzsqtJ76ETM1VxzIZYm8dChFf2ksCeGRCMqv2
Received: from tiger.home (ppp-46-244-176-127.dynamic.mnet-online.de
 [46.244.176.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 17 Jul 2021 08:55:51 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
 id DD1A748743; Sat, 17 Jul 2021 08:55:50 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Tong Tiangen <tongtiangen@huawei.com>,  <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
References: <20210621032855.130650-1-tongtiangen@huawei.com>
 <87pmvjtumc.fsf@igel.home> <20210716205332.5856df78@xhacker>
 <871r7yz241.fsf@igel.home> <20210717101805.2afabacb@xhacker>
X-Yow: Now I'm concentrating on a specific tank battle toward
 the end of World War II!
Date: Sat, 17 Jul 2021 08:55:50 +0200
In-Reply-To: <20210717101805.2afabacb@xhacker> (Jisheng Zhang's message of
 "Sat, 17 Jul 2021 10:18:05 +0800")
Message-ID: <875yx9qvih.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_235600_596462_783BF0EB 
X-CRM114-Status: UNSURE (   7.83  )
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

Please use
https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/jeos/images/openSUSE-Tumbleweed-RISC-V-JeOS-efi.riscv64.raw.xz
and run it in qemu with u-boot as kernel.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
