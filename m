Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28823C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 04:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owNd0T51EFHYU9hfIhljGMb7ANzSmBnWl0V2fuR+JwY=; b=MvRJq8YbeIfqdt
	KcCX7fkR4jhJoQFlVza7nB2Gg0M2zkMNYkTUbRZpbsC/aJKmC441of9L2tvChBT4jBDa/4xBUVSRf
	UkQGZU/YJ/KU+rEMiDgcspgw2+IgqgZEPJWkpiWyaaqYolcNmHa1g1Td3SRyLCCWVDIeBdb5YzXll
	Xe9bH7yexl3cGOwccaZY0w74kWCsxvd12nqpi7TrjUAZjrRbEOSRbBtcjlRJoUOc3N08bHB6l2gkg
	ojxOp/8V13DehkShzMYLuaOYqHca902mpHOw6UdSIKs7y+/TF/4KYaCKVtKbGyKXXt4gAlJhyWeMq
	n7oZRhDb6eGpM0JLJGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Oeg-000Aub-32;
	Tue, 06 Jun 2023 04:50:50 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Oed-000Atz-2K
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 04:50:49 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3564od2B017477;
	Tue, 6 Jun 2023 06:50:39 +0200
Date: Tue, 6 Jun 2023 06:50:39 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        paulmck@kernel.org, thomas@t-8ch.de
Subject: Re: [PATCH 0/4] selftests/nolibc: fix up and improve test report
Message-ID: <ZH67HwwLe89OPmuj@1wt.eu>
References: <ZH2BhWcRzvmvjzn8@1wt.eu>
 <20230605105332.245553-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605105332.245553-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_215048_620509_8A62050B 
X-CRM114-Status: GOOD (  12.09  )
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

On Mon, Jun 05, 2023 at 06:53:32PM +0800, Zhangjin Wu wrote:
> > On Mon, Jun 05, 2023 at 11:47:41AM +0800, Zhangjin Wu wrote:
> > > Thanks very much for your merge of the v3 generic part1 of rv32, just
> > > tested your latest 20230604-nolibc-rv32+stkp6 branch, everything work
> > > well except a trivial test report regression on the 'run' target.
> > (...)
> > 
> > I've squashed your fix into the pending patch and pushed branch
> > 20230605-nolibc-rv32+stkp7. I have only tested userland (I really
> > need to leave now, no time for a kernel build).
> >
> 
> Just did kernel build + nolibc test for arm, aarch64 and rv64, no regressions
> found.

Much appreciated, thank you. This evening I'll try the remaining
archs as I already have the cross-compilers, then will give Paul
the go.

Cheers,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
