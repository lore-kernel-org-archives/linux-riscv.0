Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A69C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 22:23:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A0960F39
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 22:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1A0960F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzPO4Z824k4fYnRtmLYj8ScVt3Y/SHwVXiCN3wuQVB4=; b=vDKHdClOUduz+c
	ee5KLIBZmKv9z+pVmBfVnfEzJL8NP5PGX8hG/HcV2aF2csnSE52RZyP8GsmPve7HvaxZP8+6juSyy
	+vkgkhQLBiumF3X6/ENFOyEWL/3oLrZkYR3CHsvwkA6L7Ay2ZUHWjcIhmVglJf1eZfyiUSv+nEg/W
	nZOh3iKxX4a15SjpCvPck5MbHt11V1CiQoNTyWv3DRkTaFXm6jGL8xFrye1CLhbcO1GY3CqQezvyI
	DytaQNDlKfDQ6HHd77Wx1dwh6WCHoWiIFYv7APQh+NTYA4yQKKRqzbPjBnp+747DEy7x2hyvbSSwY
	XXf7ahvKy4Gwdquk7S+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlewq-00BiIn-Up; Fri, 12 Nov 2021 22:23:04 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlewn-00BiHi-S5
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 22:23:03 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4HrY4b2NTNz1qwyc;
 Fri, 12 Nov 2021 23:22:55 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4HrY4b1jBWz1qqkB;
 Fri, 12 Nov 2021 23:22:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id SCeZGLDoE2bf; Fri, 12 Nov 2021 23:22:54 +0100 (CET)
X-Auth-Info: RW8h+FSRRzkLu9k8ehRaMppl2SdT1LX5nbc4X25EYpVibUHp04OzscLLLfKgurqT
Received: from igel.home (ppp-46-244-178-12.dynamic.mnet-online.de
 [46.244.178.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 12 Nov 2021 23:22:54 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 215462C3936; Fri, 12 Nov 2021 23:22:54 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Patches for the 5.16 Merge Window, Part 1
References: <CAHk-=whkh5Qma5rHtiRQXF9jVRXDe=bRG+D+LFu4dZpwP1uWAw@mail.gmail.com>
 <mhng-8aed9afb-1b05-413b-9808-5d0936c9f131@palmer-ri-x1c9>
X-Yow: Yow!  Am I having fun yet?
Date: Fri, 12 Nov 2021 23:22:54 +0100
In-Reply-To: <mhng-8aed9afb-1b05-413b-9808-5d0936c9f131@palmer-ri-x1c9>
 (Palmer Dabbelt's message of "Fri, 12 Nov 2021 13:52:46 -0800 (PST)")
Message-ID: <87mtm9rp35.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_142302_146872_6F020D4D 
X-CRM114-Status: UNSURE (   8.57  )
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

On Nov 12 2021, Palmer Dabbelt wrote:

> I wasn't planning on sending anything else for the merge window.

Not even the KBUILD_EXTMOD build fix?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
