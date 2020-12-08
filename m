Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5E7C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 20:23:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA1A2388C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 20:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA1A2388C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gCulb2sUY/j83KtSmNhKeefBRsP7+Ef80DwOvbJ2fO8=; b=keP6DXju5pnsvtXoutU2XTEJA
	QEKA+XxDkWr34eANkO6T1xgTp4OThB0Xuw4nB08lUTN3NlauBhdUnUwzoDg7dZp95T20mSvIiFjQv
	ke9b4fqtNTShVaEyQabHbThE4UXOuTToItuceEA1sEXDwRbkCiZq46ckwX0QDY7wBYCUGNglVzgp6
	1OuX46Uof1iVOd2Ckkvsj+gP12tJ2peIRbfbbpW6QDMRmZxhlRwRpY3WVd3G6MIwWCGDDsBvEqrkX
	Zbnsz77ftfDVaFdZIbmSzCLrytFiujJRgAzAUn0v6UjwC5xH8VNBtnYdcYKELfUfrT/6qTMU3HMzD
	JwGrNKNhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmjVe-0002zo-Uo; Tue, 08 Dec 2020 20:22:54 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmjVb-0002zP-AK
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 20:22:52 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CrBSS2CGSz1rx8j;
 Tue,  8 Dec 2020 21:22:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CrBSS165fz1qryr;
 Tue,  8 Dec 2020 21:22:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id wAxyBkqaZCjP; Tue,  8 Dec 2020 21:22:47 +0100 (CET)
X-Auth-Info: XN9GgVFTCsqN4NMFudgvER1EBciES0UKNg5Oyi5bDEAyg/56E9p6gDiGwvW3RN7U
Received: from igel.home (ppp-46-244-165-151.dynamic.mnet-online.de
 [46.244.165.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  8 Dec 2020 21:22:47 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id C6DE12C32D8; Tue,  8 Dec 2020 21:22:46 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] riscv: Fixed kernel test robot warning
References: <1607455638-4436-1-git-send-email-jrdr.linux@gmail.com>
 <875z5ccc0h.fsf@igel.home>
 <CAFqt6zbp56nOfnLvuieMMtpEi7TXuB67bGS_Y=offyiROc=etg@mail.gmail.com>
X-Yow: My DIGITAL WATCH has an automatic SNOOZE FEATURE!!
Date: Tue, 08 Dec 2020 21:22:46 +0100
In-Reply-To: <CAFqt6zbp56nOfnLvuieMMtpEi7TXuB67bGS_Y=offyiROc=etg@mail.gmail.com>
 (Souptick Joarder's message of "Wed, 9 Dec 2020 01:28:44 +0530")
Message-ID: <871rg0cajt.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_152251_709090_7F0800FA 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Dez 09 2020, Souptick Joarder wrote:

> On Wed, Dec 9, 2020 at 1:21 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>>
>> On Dez 09 2020, Souptick Joarder wrote:
>>
>> > Kernel test robot throws below warning -
>> >
>> >    arch/riscv/kernel/asm-offsets.c:14:6: warning: no previous prototype
>> > for 'asm_offsets' [-Wmissing-prototypes]
>> >       14 | void asm_offsets(void)
>> >          |      ^~~~~~~~~~~
>> >
>> > This patch should fixed it.
>>
>> Or rename it to main, like most other asm-offsets files.
>
> Few asm-offsets files named it as foo(). Does a rename to main() will
> work straight forward ?

Calling it main will suppress the warning, but other than that it is
completely irrelevant how you call it.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
