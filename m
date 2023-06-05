Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FBAC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 10:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yz7GtOPXE7EEP8XkfuUZKlwiL748k5W78uo0eO8TGAw=; b=1R7aUKZMkfcfFS
	DD8KaBnMO/1u9A+Tfoyi9Ng93A0IOvogOuTPXT5aqpYJo6lrDc9Sg/t1vaZ7yGnpJVuB4MjYbDy8l
	/eF5gTNwZXWgCRd0W/o+nvnKEzu1GXE7NHlMogvnDnezHRXNlgIUW3LoIy8dd03dgq8BkoVYZ3x4u
	yIcc+5R0ylbqQBxdzghUTSiBGKDXXs7VYrz/dO2HobC3AHSj14d4FoCQbiY8/QxyDhOPXuNV9CVqS
	EJavXGIVKBBnalc5L2yvhhgr87visoyCBZYSBEvZ1+3YLMZGa/OLmVP8BgfMpf/61ott8wEBMAVyX
	iaV2lMoJpSUwGyMNNQ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q67qh-00F6gv-15;
	Mon, 05 Jun 2023 10:54:07 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q67qe-00F6bM-0c
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 10:54:05 +0000
X-QQ-mid: bizesmtp64t1685962422tk6mmkxh
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jun 2023 18:53:41 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: k8Irs33ik7tnjsoDgjWjI3LC4qOfQWHYM30jJacF0M6fVfrVsLBbwbcZG0OQy
	imap5Tt6ar5OuT1r9rwsuHV/ixWQwcEQr2dHZeJLjinsSBuTz+oWl2n4sj1DY8FIVkjygVj
	t7+cjT3hCJftPzZP/lhhhgS4sVv3cv2299aF0ehg4zpC+0f5zT4pMryksZ9cWI0+/lVLUxs
	/o3cdgI2pnHCjHFGkRkvaBt1VOzWLhThw6lF3ChLPJptM0z/1QBTX5P+8hfCKR6eEI+9Cu8
	nJLi+FQYPwpyARrWBtJcmH7U5ZMQ7E2GY0X2Pm+kuewb6YBsM16rSys4880GZ8S4MezifVW
	+HnBmWGGSEk5Ajsjjj322+prpWJJPa7Qiuq6FjPt3ENXY/NWj0Zf1fA+KjzwQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7363967119739023590
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	paulmck@kernel.org,
	thomas@t-8ch.de
Subject: Re: [PATCH 0/4] selftests/nolibc: fix up and improve test report
Date: Mon,  5 Jun 2023 18:53:32 +0800
Message-Id: <20230605105332.245553-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZH2BhWcRzvmvjzn8@1wt.eu>
References: <ZH2BhWcRzvmvjzn8@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_035404_558628_E3281A3B 
X-CRM114-Status: GOOD (  13.83  )
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

> On Mon, Jun 05, 2023 at 11:47:41AM +0800, Zhangjin Wu wrote:
> > Thanks very much for your merge of the v3 generic part1 of rv32, just
> > tested your latest 20230604-nolibc-rv32+stkp6 branch, everything work
> > well except a trivial test report regression on the 'run' target.
> (...)
> 
> I've squashed your fix into the pending patch and pushed branch
> 20230605-nolibc-rv32+stkp7. I have only tested userland (I really
> need to leave now, no time for a kernel build).
>

Just did kernel build + nolibc test for arm, aarch64 and rv64, no regressions
found.

> Zhangjin and Thomas, now that your last two fixes are merged, I'm
> assuming that Paul can take the branch any time. If you're seeing a
> showstopper that needs to be fixed, please let him know, and I'll
> deal with it once I'm connected again, but please no more attempts
> to further improve that branch for now (i.e. consider it merged for
> any future work so that we can finally settle on something).

Ok, let's work on v6.6 ;-)

Best regards,
Zhangjin

> 
> Thanks!
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
