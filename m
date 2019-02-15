Return-Path: <SRS0=HaOg=QW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBE5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 07:18:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86B912190B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 07:18:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NPTdcT9k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="G5sNFRV3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86B912190B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeZ2+H15Wmh/m/HJiA0V5c7kI3yFN9ePHLnh7uXyedo=; b=NPTdcT9koQ70fe
	0I9QACQZ6xIglcFNmrCxPzcl62NE5rSj4OpRYjvaiCprEM1ahAX0DxdYbcAao9Pbb+CA/WkzoAMzE
	kMBsVNMN+TeuB3emwXhrFFWOrSKQz96yNDQN51CttvQxsndl5B148BLxs7gmasskKBfejQgxz86JA
	7k2gGUAoRJ2evSRGDarBD5ZbME+nniHER1aqTQBW8pK88j6IGgmq1LvAuCuJoWih76UWa3bCJa3yD
	X6dggQMT2F3jcG1CwtJ4IzVztImfJOeT8J/Ld+IBa5eTVM/FHfn0RAM24sD3d0Mvz+9rBjui/6Mgb
	4H3RhunKO8iZs6dzy00Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guXkw-0006Ui-38; Fri, 15 Feb 2019 07:17:54 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guXks-0006U6-FC
 for linux-riscv@lists.infradead.org; Fri, 15 Feb 2019 07:17:52 +0000
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id x1F7HQef021268
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 16:17:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x1F7HQef021268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1550215047;
 bh=GeopkqQtXzwUJZ3y6qZvd9T4Uw6r5SvlPQNc24Bsa4Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G5sNFRV3kQ3kFp1cpwQ/p977o6bRCOnlYRwRNZbkuKWgFr31TpOAUskfjCkCnggKQ
 bulUyTGR9xrCN2VpS5d9St1neRX4yw62qWtdsw0HBtyn1j5hbwxlhgcjzB+8LnteAj
 KF5Wc0ZLpE3uIZLcK/f8me4qiCozF3AhqXjaf6N3nAbupH9ncY+2IWXtspUZAi3Xjd
 WTtVbIYCTGpMxC8PDivjPWuAWe4F/PcsOgcBrGN2LV3WR6q6hsQIotn0as3Y6WQIUJ
 WwC7hCUSj3KnoLdRwtoHqyvBsQCyP3o6YHxEC6HvDuoD6dzpE4aZfPU+hVbdNCv7VA
 zQ0DRyIAughAA==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id u64so5210461vsc.12
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 23:17:26 -0800 (PST)
X-Gm-Message-State: AHQUAua0WAfOa4uz0SFIVF8OKAtZyHcrZYjbsB/NqgA3fk6BbY4NlGyq
 FVH3fwTYEuKIcPg6lgQ72e79Wo+Q6Jia2TYvRVU=
X-Google-Smtp-Source: AHgI3IZyIXujDelplfko6wBHrsbS2dq6CNqn7D68TH0m2IT92ENSLenQrLKXfUJMf7PNeCSldoJEBtW7NN6lWFtuNvE=
X-Received: by 2002:a67:7f43:: with SMTP id a64mr4199596vsd.155.1550215045700; 
 Thu, 14 Feb 2019 23:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-7-hch@lst.de>
In-Reply-To: <20190213174005.28785-7-hch@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Feb 2019 16:16:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQZm2TXO1gxif2LZQzwYae2AiqgZnNGJBxBjiPwoZLqig@mail.gmail.com>
Message-ID: <CAK7LNAQZm2TXO1gxif2LZQzwYae2AiqgZnNGJBxBjiPwoZLqig@mail.gmail.com>
Subject: Re: [PATCH 06/11] lockdep: consolidate the LOCKDEP_SUPPORT symbol
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_231750_724856_030A9E71 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greentime Hu <green.hu@gmail.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

+CC Greentime Hu
+CC Vincent Chen


On Thu, Feb 14, 2019 at 2:40 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Add one definition to lib/Kconfig.debug and let the architectures
> select if it supported.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>


This changes the behavior of nds32.

So please leave a note in the commit description.
(Ideally, we want Ack of a NDS32 maintainer)

Also, please do compile test for NDS32.


-------------------------
This commit changes CONFIG_LOCKDEP_SUPPORT to y for nds32.

NDS32 selects LOCKEP_SUPPORT, but there was previously
no config entry of LOCKDEP_SUPPORT in nds32.

It is now available in lib/Kconfig.debug,
so this commit enables LOCKDEP_SUPPORT for nds32.
-------------------------






--
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
