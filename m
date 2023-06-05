Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A769DC7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 06:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=850PS5wsjWQyAyZzhOqQthmXCyHrfJeUSDg0bIT07Xw=; b=1nTPYHKitLhxoQ
	rTk7NiPM+P+B/oB34pGbptVHUPHXxSyZ2eMVu1MYCCLGs/qzBy4yp787/xyzPD1Da5XjNZMBMXc0z
	PVD6y5nsN86SEf4Mxtb7kNZ6HYvugBgKBDsMUdh+ObvDqxaKBux3B6JK3ZEQYVUzOQLp4wFkVyDmg
	r5VJaJBnHf5NyTS57ske70aseFnIYcyYjxFpYd2KsUavvbMSSNSTGzkDfmeoYN5/V06uvUKbo1iiU
	I+zTz5vE5tGc/cNoUurmCvJg5cC71Za6glGdp46/o7J7GSdSggpCY/D2BHmLRDp9S1kZ4T4O9208I
	0HiC7fqRTwy5S1x0nwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q63lp-00EMeB-2Z;
	Mon, 05 Jun 2023 06:32:49 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q63lm-00EMdV-2A
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 06:32:48 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3556WbUV005965;
	Mon, 5 Jun 2023 08:32:37 +0200
Date: Mon, 5 Jun 2023 08:32:37 +0200
From: Willy Tarreau <w@1wt.eu>
To: thomas@t-8ch.de, Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/4] selftests/nolibc: fix up and improve test report
Message-ID: <ZH2BhWcRzvmvjzn8@1wt.eu>
References: <cover.1685936428.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1685936428.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_233247_591116_144675A6 
X-CRM114-Status: UNSURE (   9.93  )
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

On Mon, Jun 05, 2023 at 11:47:41AM +0800, Zhangjin Wu wrote:
> Thanks very much for your merge of the v3 generic part1 of rv32, just
> tested your latest 20230604-nolibc-rv32+stkp6 branch, everything work
> well except a trivial test report regression on the 'run' target.
(...)

I've squashed your fix into the pending patch and pushed branch
20230605-nolibc-rv32+stkp7. I have only tested userland (I really
need to leave now, no time for a kernel build).

Zhangjin and Thomas, now that your last two fixes are merged, I'm
assuming that Paul can take the branch any time. If you're seeing a
showstopper that needs to be fixed, please let him know, and I'll
deal with it once I'm connected again, but please no more attempts
to further improve that branch for now (i.e. consider it merged for
any future work so that we can finally settle on something).

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
