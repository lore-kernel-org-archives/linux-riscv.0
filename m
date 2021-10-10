Return-Path: <SRS0=WJg2=O6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A431C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Oct 2021 16:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C13A60F4B
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Oct 2021 16:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C13A60F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sulmzEEksDxkeAYztZd5QaUOgknOpvUKlHsyEAygEzY=; b=OpxRuSi//Rd54k
	GZIUjS2knk0rXIiNXU2Zimi2Q11QCoe2EnpdE5YuoIsL+Z7Jdaq6kFCOoR49wWpNcQFblB7mdVknF
	F5bD66BnsH7Ow4IKJsZZtVKH5IhAk0oF599xwo7e7U92/iIv1Qtokb85iyXME0Sx4+hxLSqWusduH
	A75+xeuOYepeUVakk4P1Bke8RJHbFCz5eqrRPhhNLCdz0Fg0Gho5G2g5p1OAddldS6zBnOOUOL3xL
	9hT//jFIV8ztj4zyEa+WtM/8s8DHkgV8Dg6fzWlHlzpCda01KGoVcuPTqVxY0zYh75MuGgq+XkuFh
	RzHRfZy7zsak+sfNe9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZcAf-007Aiv-NX; Sun, 10 Oct 2021 16:59:33 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZcAb-007Ahj-V5
 for linux-riscv@lists.infradead.org; Sun, 10 Oct 2021 16:59:32 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4HS7SP3LX9z1sCwc;
 Sun, 10 Oct 2021 18:59:16 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4HS7SN5mBCz1qqkB;
 Sun, 10 Oct 2021 18:59:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 1BznyiYwki0N; Sun, 10 Oct 2021 18:59:16 +0200 (CEST)
X-Auth-Info: eS7SnJC8GqZYFAOkJshQzytzrr8WsECt52Llsw2L7Mgf3wIPSYzs7lAR2weKm9TY
Received: from igel.home (ppp-46-244-185-246.dynamic.mnet-online.de
 [46.244.185.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 10 Oct 2021 18:59:16 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 005D52C19BF; Sun, 10 Oct 2021 18:59:14 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [Request for help] issue when add relative extable support to
 riscv64
References: <20210917235733.6240d6d3@xhacker> <20211010235655.35c55e61@xhacker>
X-Yow: I've got a COUSIN who works in the GARMENT DISTRICT...
Date: Sun, 10 Oct 2021 18:59:14 +0200
In-Reply-To: <20211010235655.35c55e61@xhacker> (Jisheng Zhang's message of
 "Sun, 10 Oct 2021 23:56:55 +0800")
Message-ID: <87ee8sg6jh.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_095930_201717_C84B810A 
X-CRM114-Status: GOOD (  13.76  )
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

On Okt 10 2021, Jisheng Zhang wrote:

> a simple code:
>
> 	nop
> 1:
> .section __ex_table,"a"
> 	.align 3
> 	.long (1b - .)
>
> assemble it, then we can see that there are two entries for the above
> label substraction, R_RISCV_ADD32 and R_RISCV_SUB32
>
> Relocation section '.rela__ex_table' at offset 0x108 contains 2 entries:
>   Offset          Info           Type           Sym. Value    Sym. Name + Addend
> 000000000000  000600000023 R_RISCV_ADD32     0000000000000002 .L1^B1 + 0
> 000000000000  000500000027 R_RISCV_SUB32     0000000000000000 .L0  + 0
>
> The 2nd R_RISCV_SUB32 rela entry causes the problem.
>
> Can we prevent assembler from emitting the R_RISCV_SUB32 rela entry?

There is R_RISCV_32_PCREL, but I guess it isn't used here because it was
a late addition.  The assembler uses it only in a very special situation
(FDE initial location).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
