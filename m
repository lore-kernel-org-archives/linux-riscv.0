Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E8EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTReUyo74MhaN+vDzIh7da/q2s9HEBcX4Fr0Wc32IsM=; b=17B+nFZOrS18xg
	Lv8qsEFTxRjjBV1cUzRrFJZ78Zs8LnoiotZwiaAgjDvU+ZiTdOD8WfcasYw7H2JSZE+kLh5jeu4i3
	wvLFZzNPX+kWtYpntkqu4ZfKWJYtq1If8mdxI8ohWBv1TGBoCMVNz11p5BQ/Rr983vBuZQ6j6KnI6
	k6qQT9DVR7KUbOPq3JAga+D9b74L+9oRM5aD4uuUor5/UbVdAoQB2YXm76zn9PHC/eUxrV91rwjV8
	j/5vsHTIhH8WJcVAGDGPKY9eIga8GcWBTv5Fn2968kH05dIZgQeJju9cOJJo/vCHOleZ37amPj/Yw
	zH7Vgab/Tz3MJXmjBcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGzXP-009Nw8-50; Mon, 07 Feb 2022 08:38:19 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGzXL-009NuD-Rd
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 08:38:17 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Jsffm0nXYz1rB81;
 Mon,  7 Feb 2022 09:38:08 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Jsffm00XGz1qqkP;
 Mon,  7 Feb 2022 09:38:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 7iAGubkoVI4f; Mon,  7 Feb 2022 09:38:07 +0100 (CET)
X-Auth-Info: 3fmUPnVS0Kvboy0oxbh9eBJwvyO+NTPtLCgh38lLIqw+6NL2h6OEzMlpGRGwyssh
Received: from igel.home (ppp-46-244-191-16.dynamic.mnet-online.de
 [46.244.191.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  7 Feb 2022 09:38:07 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 9D7122C36AF; Mon,  7 Feb 2022 09:38:06 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linux-riscv
 <linux-riscv@lists.infradead.org>,  "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] riscv: reduce THREAD_SIZE from 16KB to 8KB for RV64
References: <20220206174359.2986-1-jszhang@kernel.org>
 <CAEn-LTrZwq1-6F8PWScGPp1TRk1eaB-7qOrvPjyLhK=OzDTQBQ@mail.gmail.com>
X-Yow: ..  One FISHWICH coming up!!
Date: Mon, 07 Feb 2022 09:38:06 +0100
In-Reply-To: <CAEn-LTrZwq1-6F8PWScGPp1TRk1eaB-7qOrvPjyLhK=OzDTQBQ@mail.gmail.com>
 (David Abdurachmanov's message of "Mon, 7 Feb 2022 10:05:14 +0200")
Message-ID: <87bkzjvzpt.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_003816_087508_E68ACF4F 
X-CRM114-Status: GOOD (  12.84  )
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

On Feb 07 2022, David Abdurachmanov wrote:

> On Sun, Feb 6, 2022 at 7:53 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>>
>> After irq stack is supported, it's possible to use small THREAD_SIZE.
>> In fact, I tested this patch on a Lichee RV board, looks good so far.
>
> We went from 8K to 16K somewhere in mid-2020 on riscv64 because we
> were seeing some random crashes in various distributions (Debian,
> Fedora, OpenSUSE). Thus we matched what other popular arches do, i.e.
> 16K.

I think NFS is one of the worst offenders.  I'm running an Unleashed
with NFS root, which probably amplifies this.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
