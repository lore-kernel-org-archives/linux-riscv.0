Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B45C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 22:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5R7cIlz/dGXau+Rxmqew5LPLuWpgCYZKXwNOl3kXJ6c=; b=LZeE2SEryQVDin
	2UyM2aTjVry8pxOydIjlqshlsrnVEyXpCEeU4BZcOrQoVGtvcSwT6W8refSesDC+kBI0a4nL74LSJ
	OZbLKZPoYbafr0QA5t2X7YxtDU9svAQwvBab7z4KkLaeHOyRM4TYpAh2ChqjUgJiDWeDLoMEzcKQe
	UbNmBSQnKkjGXiT46ijW+udD0qoVeoCOmvWifTsPDPIrfo2zf0db3E7MGb1iEckebZsSOIP9i4+YX
	Uoo4TDR97XcKIOysCxb1PufyH3w1HS+A57YfxVv0YX9qh1rObfLmi5MWzC9XQ1BXkAN4fyNKbrNFP
	1vdy2pM9LsOZN6EYkm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni1LV-002dR6-7p; Fri, 22 Apr 2022 22:01:45 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni1LR-002dQD-QQ
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 22:01:43 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4KlSzd5kRwz1s7t9;
 Sat, 23 Apr 2022 00:01:33 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4KlSzd4SfCz1qqkB;
 Sat, 23 Apr 2022 00:01:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 6a3O8dIO9l8U; Sat, 23 Apr 2022 00:01:32 +0200 (CEST)
X-Auth-Info: w2GcOGZC/sL8KVkiMYfk58wvLkSRn44COzI3VdI5wVSUBLsx/hVRETz6wryPZxvN
Received: from igel.home (ppp-46-244-179-55.dynamic.mnet-online.de
 [46.244.179.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 23 Apr 2022 00:01:32 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 5B9872C370E; Sat, 23 Apr 2022 00:01:32 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: alexandre.ghiti@canonical.com,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Allow the used to downgrade to sv48 when HW
 supports sv57
References: <20220422211055.9278-1-palmer@rivosinc.com>
X-Yow: ..  I want to perform cranial activities with Tuesday Weld!!
Date: Sat, 23 Apr 2022 00:01:32 +0200
In-Reply-To: <20220422211055.9278-1-palmer@rivosinc.com> (Palmer Dabbelt's
 message of "Fri, 22 Apr 2022 14:10:55 -0700")
Message-ID: <87y1zwydz7.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_150142_040677_3F1DFF3F 
X-CRM114-Status: UNSURE (   7.24  )
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

s/used/user/?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
