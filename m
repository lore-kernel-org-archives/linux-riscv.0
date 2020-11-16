Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF643C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 18:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF5B7206F9
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 18:30:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bsm6x25Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF5B7206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y6TMiRPNunZhdtveqCGKWQv7aCs7/dLh38uIRF/ylA4=; b=Bsm6x25Y8+iryegu+pag+WCmn
	t4UxO05Fo5Ppg+djMZ6xaK0P/2exyLBQBWZHA/p4fJq2fFC4HqnID/JCChuimoqgGEnM5uLTZBvhl
	xb0/MVeDfHW3foBVbfjzljJOUSAFb7ukSaljaywkFgaG1ZBURVEB9eps17twIJhRNKTyK0kYtPuBO
	pCxsocuqteX2pkCfEUX6++uPsDazyXRKrYPUsy0Roo6NgXDw4HysRUWgcBUYnskLMagAseitED1Q/
	wKakc43UKnTJv81UluFtPDjDqUOHUbxJZpNKSzFLZH6ctk8vNRjM9o3p8E2s9IdZTjwiwKCAfeY3R
	vbGKc90Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kejH9-0001IS-MJ; Mon, 16 Nov 2020 18:30:51 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kejH7-0001Ha-26
 for linux-riscv@lists.infradead.org; Mon, 16 Nov 2020 18:30:50 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CZd1L2sZ4z1qtQ4;
 Mon, 16 Nov 2020 19:30:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CZd1L1fr5z1qqkD;
 Mon, 16 Nov 2020 19:30:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2sLldMLemxsg; Mon, 16 Nov 2020 19:30:45 +0100 (CET)
X-Auth-Info: wpRWNF213h3MGa7UAqzEQHN5/HEAVynfkwBs7YWsrYdgY7k3jknJXYi1b/kpiH+r
Received: from igel.home (ppp-46-244-169-244.dynamic.mnet-online.de
 [46.244.169.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 16 Nov 2020 19:30:45 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id F11F62C3359; Mon, 16 Nov 2020 19:30:44 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] compiler.h: Fix barrier_data() on clang
References: <20201014212631.207844-1-nivedita@alum.mit.edu>
 <87sg999ot0.fsf@igel.home>
 <0dbaca2d-9ad0-8c1a-a280-97be01cac2bd@infradead.org>
X-Yow: Actually, what I'd like is a little toy spaceship!!
Date: Mon, 16 Nov 2020 19:30:44 +0100
In-Reply-To: <0dbaca2d-9ad0-8c1a-a280-97be01cac2bd@infradead.org> (Randy
 Dunlap's message of "Mon, 16 Nov 2020 09:53:46 -0800")
Message-ID: <87k0ul9msr.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_133049_251055_A9714051 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Arvind Sankar <nivedita@alum.mit.edu>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 16 2020, Randy Dunlap wrote:

> What kernel version are you building?

5.10-rc4

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
