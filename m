Return-Path: <SRS0=8YMt=LE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30C8C47094
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 16:40:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B82860231
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 16:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B82860231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOKQFS0fp5GlgNuRqKpLqz0X16WRaJDg1ujMuoTFdXQ=; b=Hx8/ATnZGFV6AT
	B7gZc+in8spU2B0OtJJuzDJ10G6M4XenbXp/tuxdXTprzeoSnqvXK18JsETzkuCgqP9QSB+Ul4anf
	ydMME8kl6OXnLtfpfq8PRrtSiJ/uGV3BgJBGZvhNRA90hjwuOuCIkxN2WWMNiL5FgyaVQzkYj85Wj
	JA2yaCUe1M1oOys+ybDqfCHlwQWW+Ef1cBH8f0QpX8qyO7GnkXCmWzad/XKqZU/S1Q/JXZsUGLycG
	4tjLyDLWb88rVQzndmUpfD4Ha5CH1PguBPTJrPUZv6ARPmi26/7W7ok5tz9+DX6d+aaejQhyCB6dS
	ZD127FpT54soETCYrF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrNio-001i13-87; Thu, 10 Jun 2021 16:39:58 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrNih-001hzw-FV
 for linux-riscv@lists.infradead.org; Thu, 10 Jun 2021 16:39:53 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4G18p640mYz1qtQ2;
 Thu, 10 Jun 2021 18:39:42 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4G18p626MNz1qr43;
 Thu, 10 Jun 2021 18:39:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id UWj4Zzhp75L1; Thu, 10 Jun 2021 18:39:40 +0200 (CEST)
X-Auth-Info: uOvEB6x6tEBbFu4rjQpXHZh4ihXcEo6qHZ3hLcNwGzcQDLB3o4xhP8eA0qGjKLTp
Received: from igel.home (ppp-46-244-161-203.dynamic.mnet-online.de
 [46.244.161.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 10 Jun 2021 18:39:40 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 031D22C36A3; Thu, 10 Jun 2021 18:39:39 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Alex Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,  corbet@lwn.net,  Paul Walmsley
 <paul.walmsley@sifive.com>,  aou@eecs.berkeley.edu,  Arnd Bergmann
 <arnd@arndb.de>,  aryabinin@virtuozzo.com,  glider@google.com,
 dvyukov@google.com,  linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com,  linux-arch@vger.kernel.org,
 linux-mm@kvack.org,  Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear
 mapping
References: <mhng-90fff6bd-5a70-4927-98c1-a515a7448e71@palmerdabbelt-glaptop>
 <76353fc0-f734-db47-0d0c-f0f379763aa0@ghiti.fr>
 <a58c4616-572f-4a0b-2ce9-fd00735843be@ghiti.fr>
 <7b647da1-b3aa-287f-7ca8-3b44c5661cb8@ghiti.fr>
X-Yow: Quick, sing me the BUDAPEST NATIONAL ANTHEM!!
Date: Thu, 10 Jun 2021 18:39:39 +0200
In-Reply-To: <7b647da1-b3aa-287f-7ca8-3b44c5661cb8@ghiti.fr> (Alex Ghiti's
 message of "Sun, 18 Apr 2021 07:38:09 -0400")
Message-ID: <87fsxphdx0.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_093951_699066_0338A681 
X-CRM114-Status: UNSURE (   9.99  )
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

On Apr 18 2021, Alex Ghiti wrote:

> To sum up, there are 3 patches that fix this series:
>
> https://patchwork.kernel.org/project/linux-riscv/patch/20210415110426.2238-1-alex@ghiti.fr/
>
> https://patchwork.kernel.org/project/linux-riscv/patch/20210417172159.32085-1-alex@ghiti.fr/
>
> https://patchwork.kernel.org/project/linux-riscv/patch/20210418112856.15078-1-alex@ghiti.fr/

Has this been fixed yet?  Booting is still broken here.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
