Return-Path: <SRS0=FXTp=BN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED8FC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 21:32:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D91207DF
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2020 21:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qWNa3IZd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D91207DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xXLpOsV801otybXZF91rekzt+reXqrZ9HWR2rkJxzqY=; b=qWNa3IZd8AXlaPAyB14S6a+0i
	3v+WQ3hkyjBcfg/UIep/HGv1DJHvoIm7bLWH5JExkE41XX/hcnRPArENjpnGF7Xg+KnFsoreITu6/
	3tDdZY2RXueve9gzhjo1PWFpWeuaiPi5HussTBV1CuRMlJFJLDpD8YNrS31LBZnolk4BF0GO/0wNM
	lTg99kyJvHr26y0sS5AHqlBMTVi7TJkdqenQshutDRliBorzGi+/sS/TmGeu71U02KBytLbAra2lJ
	Jljl50t9gMnqYREZmTWr8A4liSeiXCvyoLbpL08wYLq48Y8SMPzk39crNsuKCBvuP6UeGGhbiGYAX
	5dFnREFtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2i4E-0001Qr-D4; Mon, 03 Aug 2020 21:32:22 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2i4C-0001QT-Dm
 for linux-riscv@lists.infradead.org; Mon, 03 Aug 2020 21:32:21 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BLB1D0Czdzvjc1; Mon,  3 Aug 2020 23:32:15 +0200 (CEST)
Date: Mon, 3 Aug 2020 23:32:15 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: 5.8 Pull Request
Message-ID: <20200803213215.2g6525h7kzcstxsu@distanz.ch>
References: <mhng-5eec5674-c0b1-4909-b30f-7fda1228a99f@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5eec5674-c0b1-4909-b30f-7fda1228a99f@palmerdabbelt-glaptop1>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_173220_571947_D8ECD038 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-08-03 at 22:28:40 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> Looks like I managed to get my 5.8 PR stuck in my outbox so as a result it
> didn't get to Linus and therefor wasn't merged.  There wasn't anything
> critical (just the -fno-stack-protector patch), but it does mean that
> riscv-for-linus-5.8-rc8 isn't going to get merged -- I could send it out as-is
> for the merge window, but it seems easier to just put it in with the rest of
> the patches.

Putting it in with the rest of the patches sounds good to me. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
