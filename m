Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074C6C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 12:47:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9144C64E32
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 12:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9144C64E32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eo9AhFtD+pi1jlod5J+IL6RgQRj96qnv7AayogIA8Aw=; b=M6EfUqpJpHmzFobIEJ7atwoev
	D8EIMMXUJlHtNngE0kbdJco9Xd0FYKNJ4wYVOwC6tWLpsmIJ4f7c2glfGXhFM1n19/oI8Y9+RSHox
	xr0Az+2b2IXxEwE4qDTE+BHXA2hpDUAbp7kFr1aCjlKkbjyx+Dtf30vvjfaCQL6L+BQZqSS0r6YP8
	AjcoNbkMZvVMYKHUe7gX0wkpostunH31MXqRampEJmQnQKTNZ6G1V0S3ZIOZO0EF/Hxyg0lU994Se
	FTJGwjR3Nb4Gf49FnYl+zOMxAC8Ct7bqCItAvR3Pbwxzxux4pa8iKa9kh1aEHXpuEw/OPH2YauoQr
	lrRLiQTtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ouG-0001KS-Ea; Wed, 10 Feb 2021 12:47:44 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9ouE-0001JM-BC
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 12:47:43 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DbKKk2nstz1qs0V;
 Wed, 10 Feb 2021 13:47:38 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DbKKk0wQyz1t6pp;
 Wed, 10 Feb 2021 13:47:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Ul3ytJQpfjMS; Wed, 10 Feb 2021 13:47:36 +0100 (CET)
X-Auth-Info: RuUU4Nm21+ZCGrYnw5dh1sqjchZK5Zl5bOvlUvzxcO9GF0ovy/0kftXqixYAQR7M
Received: from igel.home (ppp-46-244-165-216.dynamic.mnet-online.de
 [46.244.165.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 10 Feb 2021 13:47:36 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 799A32C31E1; Wed, 10 Feb 2021 13:47:34 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] Revert "dts: phy: add GPIO number and active state used
 for phy reset"
References: <20210205034112.2147142-1-palmer@dabbelt.com>
X-Yow: Will it improve my CASH FLOW?
Date: Wed, 10 Feb 2021 13:47:34 +0100
In-Reply-To: <20210205034112.2147142-1-palmer@dabbelt.com> (Palmer Dabbelt's
 message of "Thu, 4 Feb 2021 19:41:12 -0800")
Message-ID: <877dngjdi1.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_074742_525857_06D9EE92 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, yash.shah@sifive.com, robh+dt@kernel.org,
 sagar.kadam@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Feb 04 2021, Palmer Dabbelt wrote:

> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> VSC8541 phys need a special reset sequence, which the driver doesn't
> currentlny support.  As a result enabling the reset via GPIO essentially
> guarnteees that the device won't work correctly.
>
> This reverts commit a0fa9d727043da2238432471e85de0bdb8a8df65.
>
> Fixes: a0fa9d727043 ("dts: phy: add GPIO number and active state used for phy reset")
> Cc: stable@vger.kernel.org
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

This fixes ethernet on the HiFive Unleashed with 5.10.12.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
