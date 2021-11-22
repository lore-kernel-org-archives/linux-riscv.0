Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787ABC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0cMDXBI97i65xM7Zazv8FPxzS8cpxajywfrADTGO9s=; b=M4Bx8aG12uYCew
	bWLXnKvRFNP36t8AbclDSd7QleLw7XuG/jr0UVgOfqDMkxm7NNs4NiQOdEDL40XRk/KvW+/5zp6Mb
	PbUn8xz5ods5CqdzZwiU1Vaw7VT4T5F40NUi0dsPwdWaTvmui78XLOBiOYaD6DUehqDfXq7B1qZDX
	Ht7TWBeFjHjIJefmLqDG8/5HnKF5aibq663vMvnqdqZGV1u4K60C8lO9VDD7wQJHHKg9j019CxCJn
	8cV2L+qU0rrVDQlR/OMWjHWFTSOhcv63RGlbmhsy3ze/+KSXdtFuDJ7dv6qiFRwRBWCRtvIawAXeF
	UFUdzhsbYmAewpaP6LoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp8g8-00GR3y-WA; Mon, 22 Nov 2021 12:44:13 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp8XO-00GODj-Ei
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 12:35:12 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4HyRYd4KKKz1r877;
 Mon, 22 Nov 2021 13:35:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4HyRYd3YQYz1qqkM;
 Mon, 22 Nov 2021 13:35:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id VfhmymXEeXXA; Mon, 22 Nov 2021 13:35:00 +0100 (CET)
X-Auth-Info: 8MTS2QsXckqrscYn896OKyBKMo3LlBWhZtzGf+hI4zNW9aZqS964yBYLEaSFv+8k
Received: from igel.home (ppp-46-244-171-139.dynamic.mnet-online.de
 [46.244.171.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Nov 2021 13:35:00 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 1C6B12C3835; Mon, 22 Nov 2021 13:35:00 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH 1/3] riscv: Correctly print supported extensions
References: <2d536b65-e6fd-873f-ed34-4aab7cca4771@irq.a4lg.com>
X-Yow: TATTOOED MIDGETS are using ALFREDO in their SALAMI FACTORY!
Date: Mon, 22 Nov 2021 13:35:00 +0100
In-Reply-To: <2d536b65-e6fd-873f-ed34-4aab7cca4771@irq.a4lg.com> (Tsukasa OI's
 message of "Sat, 20 Nov 2021 17:53:50 +0900")
Message-ID: <87k0h0pdvv.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_043510_707182_363DC33C 
X-CRM114-Status: UNSURE (   9.88  )
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

On Nov 20 2021, Tsukasa OI wrote:

> This commit replaces BITS_PER_LONG with magic number 26.
>
> Current ISA pretty-printing code expects extension 'a' (bit 0) through
> 'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
> cause an issue in practice), it will be an annoying problem if we start to
> use those in the future.

Perhaps replace 26 by 'z' - 'a' + 1?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
