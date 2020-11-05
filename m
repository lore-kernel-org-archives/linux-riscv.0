Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C409AC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 09:19:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBED92080D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 09:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P6pNMS64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBED92080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5i1xnUe/NeVcXkkJ+FlWpnfAx2jthCyN4lRG9T3X9bA=; b=P6pNMS64k6AB+FH0ChkBEg7JQ
	ljJkFGSVysrAVV7ppz9dIBayrTc2c0ozw4g4H8Nq37UD2ahjRj48C1oOCwHTXq5qNnWVustF+Ufb0
	FfHKBGKVd5BYzb2OaAzN6bMlnCZJkCK8d5NsD43I4tjLtpkhFw6ddPfYNaT10ZXwnHewL9WicUvLE
	x0n466rYsfWQFectk0npP4ppjJB2xg2tTZ2hLvozHblgwGEqEN0ETccBuX9EPC5rNwmo5FYzgST1W
	SQ/DkD1jXlhufdOoXxHjf/AaOQdbLIXgkfvjDQMfrpvdL9Qp4GVeIFk16kbqfGfY6IsX9yVzrBb98
	riU9kktvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kabQe-0001cs-Gn; Thu, 05 Nov 2020 09:19:36 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kabQb-0001bR-00
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 09:19:34 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CRdJK1N31z1qsjm;
 Thu,  5 Nov 2020 10:19:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CRdJK0GsQz1qrfj;
 Thu,  5 Nov 2020 10:19:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id sQUnT8RSgdnP; Thu,  5 Nov 2020 10:19:28 +0100 (CET)
X-Auth-Info: rkSLcMeXSjekit1Q5DvtPq8Ky/Q5iiR2fP8AGVpyZbr4x/llLl2dWCyMTSvZSG1x
Received: from igel.home (ppp-46-244-161-230.dynamic.mnet-online.de
 [46.244.161.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  5 Nov 2020 10:19:28 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 83B552C35FC; Thu,  5 Nov 2020 10:19:27 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 1/4] clk: sifive: Extract prci core to common base
References: <cover.1602838910.git.zong.li@sifive.com>
 <b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com>
 <160454434294.3965362.6100009498384462585@swboyd.mtv.corp.google.com>
 <CANXhq0qpEXejD765A5S5KfbuYQc=in5sFdEmk5K=BzZy2L=nmQ@mail.gmail.com>
X-Yow: That's a decision that can only be made between you & SY SPERLING!!
Date: Thu, 05 Nov 2020 10:19:27 +0100
In-Reply-To: <CANXhq0qpEXejD765A5S5KfbuYQc=in5sFdEmk5K=BzZy2L=nmQ@mail.gmail.com>
 (Zong Li's message of "Thu, 5 Nov 2020 15:22:10 +0800")
Message-ID: <87a6vw40v4.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_041933_239683_0541F095 
X-CRM114-Status: GOOD (  10.58  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 05 2020, Zong Li wrote:

> I tried to add -M and -C option to find renames and copies, but it
> doesn't detect anything here.

-C40 finds a copy drivers/clk/sifive/{fu540-prci.c => sifive-prci.c}.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
