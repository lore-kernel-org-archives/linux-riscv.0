Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A281FC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 19:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E2C23C31
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 19:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6E2C23C31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fUzhnKKeJf0WxqWKsLIMn6OvRPdVLCCk0Zhha7xyd7c=; b=vlHhIGHS1PSOEZhlhAqIbVkGp
	38Qn09yktuVncBNWa5pyzIReID81jvud9YhU2HO8QRKN/B0WdiJvenR8dnyFS0llCJA6dT0RnKi/3
	Eln5yuDblcqTjRZDkH4sDu0teBuh6U3vgWs1CAnhdKN/k6dzSkU0kLYVCWbGLjr4I8vqG3g3bXyKG
	1TL9Wz9EH6sa4f6hpLBKrBDMbSC7czFafssDMkhPzosD5qVAT8rh3Pcg53tXnL7cr/HOGFxEx+LLP
	YXpe1ye4c83WMu9q7UytBYNR4FLxi7B8zbqviNSJ5GPTh15yn0+nouKbWkNqFUKHtraUoWPbBtvAc
	720N0jEtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmj16-00007Y-31; Tue, 08 Dec 2020 19:51:20 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmj12-00006y-PI
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 19:51:18 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Cr9m00D2Mz1qs04;
 Tue,  8 Dec 2020 20:51:11 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Cr9lz6C8Sz1qryt;
 Tue,  8 Dec 2020 20:51:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id CZyAJDmzMGCZ; Tue,  8 Dec 2020 20:51:11 +0100 (CET)
X-Auth-Info: j94MMSxkK5Fd8e1KRm6cOObRgssA27kGQmdMpYtrOr8WMT7p4/X68rXZIOuyRuAN
Received: from igel.home (ppp-46-244-165-151.dynamic.mnet-online.de
 [46.244.165.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  8 Dec 2020 20:51:11 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 7FFB02C32D5; Tue,  8 Dec 2020 20:51:10 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] riscv: Fixed kernel test robot warning
References: <1607455638-4436-1-git-send-email-jrdr.linux@gmail.com>
X-Yow: Once, there was NO fun...  This was before MENU planning,
 FASHION statements or NAUTILUS equipment...
 Then, in 1985..  FUN was completely encoded in this tiny MICROCHIP..
 It contain 14,768 vaguely amusing SIT-COM pilots!!
 We had to wait FOUR BILLION years but we finally got JERRY LEWIS,
 MTV and a large selection of cream-filled snack cakes!
Date: Tue, 08 Dec 2020 20:51:10 +0100
In-Reply-To: <1607455638-4436-1-git-send-email-jrdr.linux@gmail.com> (Souptick
 Joarder's message of "Wed, 9 Dec 2020 00:57:18 +0530")
Message-ID: <875z5ccc0h.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_145116_952207_E60E5B1A 
X-CRM114-Status: GOOD (  10.07  )
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

> Kernel test robot throws below warning -
>
>    arch/riscv/kernel/asm-offsets.c:14:6: warning: no previous prototype
> for 'asm_offsets' [-Wmissing-prototypes]
>       14 | void asm_offsets(void)
>          |      ^~~~~~~~~~~
>
> This patch should fixed it.

Or rename it to main, like most other asm-offsets files.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
