Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8190AC43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Subject:
	From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ln8GU392IVd8FOHDpvSi/YRfyzOa1cUxnoHeHaI7Bqs=; b=tdoYP0aIRWPQFO2tv0+KrWuxMl
	sbFqQV4k2J04ZcEChNP6UyIuwYEg+BxWcfXhgmw501t+1mJqVlwfbx7BzK25pWUN9zp5aNYSJPA0l
	2n36hLlItL0Xc5YntUhVWid6uoRVwL6f4h6QjkKIRAMXxUti52yaYbXo5nZvpAiVz8JF5YCYrgM2d
	FfPiMdTPr0q5qjjOQxbTyq3gtcZgtAI3Pc4wNGNBJB9QDMnxwVgSxAxkP5xf5I5irV+oaMZIcIV+t
	S/am7Ee155aZvt2PNWjZcVDsrZ7fckIBy+vywzy5QMObyj7LTbAkObScUOMVYd03f4tosF5+/0ZKQ
	vXVLfzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozD2x-00AUn0-Hn; Sun, 27 Nov 2022 08:29:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozD2w-00AUmq-4R
	for linux-riscv@bombadil.infradead.org; Sun, 27 Nov 2022 08:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Date:Reply-To:Content-Type:To:Subject:
	From:Sender:Message-ID:Cc:MIME-Version:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dTSmjDzeYhtwTGbkCZ1Jzr50B4SvBX2Rigm/uZiQD7I=; b=UncJjfR7E/9T9XP79jkzv6maNq
	U3Ubqotgh8t2P3Vok06xBwPWtoHUHKWWqGeUd3HHnhWXYKM4CQ74xkaR2Sfh5YozKP9TApa9xlfw8
	lcIwPEFL13KEqvf9S9Npe0EVVYOW40gFOd02oZQtG6Oh7PWPUydbpDtUnjdChCs9cN8ZX5xSd2T9l
	d2UHtjuzaoLJQ0lJDcT/dEjp6o3aNidBynhZ9BCdZWmf2jMBfgtmy/meIsMAir22fQWuXXejvhLib
	NU7SPuCEUwUMzP46toajne0sRkgNdxYyaevvXlz0cI54niZ0Aih/et4MMyT1cjghfYn5crxbEoWYu
	u3mbVhBA==;
Received: from vps-024a1f20.vps.ovh.ca ([139.99.47.232] helo=nbkq1rn.com)
	by casper.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozD2z-00BP1t-H7
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 08:29:59 +0000
From: "fa ying" <9sporsts9@gmail.com>
Subject: to invest in your country
To: linux-riscv@lists.infradead.org
Date: Sun, 27 Nov 2022 15:29:36 +0700
X-Priority: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_082957_847491_56E306A6 
X-CRM114-Status: UNSURE (  -4.26  )
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
Reply-To: fa ying <9sporsts9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Message-ID: <E1ozD2x-00AUn0-Hn@bombadil.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


I am Ms. Chuachan ,
from Thailand in Asia continent but currently residing in abroad,

I trust this email meets you
in good health,
I want to invest in your country and I would
 like you to assist me in my
investment
with moral and physical advises
Please do reply 
me as soon as possible so

we can discuss more.



I look forward to hear from you soon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
