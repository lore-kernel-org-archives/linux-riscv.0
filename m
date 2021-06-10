Return-Path: <SRS0=8YMt=LE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABD6C48BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 17:12:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 113E2613E9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jun 2021 17:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 113E2613E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hz4ZUYmxHWuAGNmB/JEw27leITaqOD5wqpSkfQX5Bf4=; b=Qnic180FCZHAN3
	zvB+q9M8yLXUElY7nvdhxtCcp5obScUZ8JshQrqH0pNhlBkF4MWP6NWweAtvhyAT9YemuTfYEEDDY
	ZHcBCFjBkbM0LPkrKdYPFic3ps6gfkUDLZ809nxwNniyWzP0K3lsad8cDGOyQSsQpZ5ySEt9quBj/
	XCxzNuZO+N2XL1jwv+0oZbMRNH1PMEYSk7B6n3mUGNYBXJaWCABoVqPPaLf/CoPu8ACFiYKVgqXwQ
	A+Rp2iWeypcntOTw9cQ23KCpAupVdPQ/lAa+BSPx2DcOjTk1j8/AvuVi47pfdslvLdl5qpu+U+TZf
	0Dc6AAuRozWwRnuTioJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrODd-001txH-CO; Thu, 10 Jun 2021 17:11:49 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrODa-001tvw-La
 for linux-riscv@lists.infradead.org; Thu, 10 Jun 2021 17:11:48 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4G19W10RlZz1s3pn;
 Thu, 10 Jun 2021 19:11:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4G19W05vXlz1qr46;
 Thu, 10 Jun 2021 19:11:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id jeCLGjcaYHdm; Thu, 10 Jun 2021 19:11:39 +0200 (CEST)
X-Auth-Info: tTD/jRVROUkeu+CRr/dYNOPU0H88WKfaxb3K8PZ1hjL42mqxsQYgvXW0pSyHF28S
Received: from igel.home (ppp-46-244-161-203.dynamic.mnet-online.de
 [46.244.161.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 10 Jun 2021 19:11:39 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 8C8602C36A1; Thu, 10 Jun 2021 19:11:38 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alex Ghiti <alex@ghiti.fr>,  Palmer Dabbelt <palmer@dabbelt.com>,
 corbet@lwn.net,  Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu,  Arnd Bergmann <arnd@arndb.de>,
 aryabinin@virtuozzo.com,  glider@google.com,  dvyukov@google.com,
 linux-doc@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,  kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear
 mapping
References: <mhng-90fff6bd-5a70-4927-98c1-a515a7448e71@palmerdabbelt-glaptop>
 <76353fc0-f734-db47-0d0c-f0f379763aa0@ghiti.fr>
 <a58c4616-572f-4a0b-2ce9-fd00735843be@ghiti.fr>
 <7b647da1-b3aa-287f-7ca8-3b44c5661cb8@ghiti.fr>
 <87fsxphdx0.fsf@igel.home> <20210610171025.GA3861769@roeck-us.net>
X-Yow: There's a little picture of ED MCMAHON doing BAD THINGS to JOAN RIVERS
 in a $200,000 MALIBU BEACH HOUSE!!
Date: Thu, 10 Jun 2021 19:11:38 +0200
In-Reply-To: <20210610171025.GA3861769@roeck-us.net> (Guenter Roeck's message
 of "Thu, 10 Jun 2021 10:10:25 -0700")
Message-ID: <87bl8dhcfp.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_101146_885985_ED005BF7 
X-CRM114-Status: GOOD (  12.04  )
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

On Jun 10 2021, Guenter Roeck wrote:

> On Thu, Jun 10, 2021 at 06:39:39PM +0200, Andreas Schwab wrote:
>> On Apr 18 2021, Alex Ghiti wrote:
>> 
>> > To sum up, there are 3 patches that fix this series:
>> >
>> > https://patchwork.kernel.org/project/linux-riscv/patch/20210415110426.2238-1-alex@ghiti.fr/
>> >
>> > https://patchwork.kernel.org/project/linux-riscv/patch/20210417172159.32085-1-alex@ghiti.fr/
>> >
>> > https://patchwork.kernel.org/project/linux-riscv/patch/20210418112856.15078-1-alex@ghiti.fr/
>> 
>> Has this been fixed yet?  Booting is still broken here.
>> 
>
> In -next ?

No, -rc5.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
