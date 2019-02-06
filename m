Return-Path: <SRS0=S271=QN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A7EC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:44:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2BA72175B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  6 Feb 2019 10:44:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="snAvPEw/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2BA72175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pC8OnHJV85Xy0sXa+0A+6h5P+N1ueQW/kypJS4gup18=; b=snAvPEw/U9TwWT
	odqgZdFwvf+uiMTXHI03oNT+KDExDimYNVtlH2or642D6ej6jyXe5aSkmqm7sdim8xPYe3KnS5+mN
	GMeI1XmSDaluWR19iUyXDK/6ExcQ7RnM6MgO5kHltCB60NtJbmdWIyzAugxsR39I/F7AOvaMeCI0U
	tkQcgLe2WBeldVEMM3VfHShVUSy+Sc5SxDLTziVmg2WF+RFh2PrA0Mz+fB8oJ/CK+VSyBoC3lvyay
	ld+yMusIvBgq/vHyZFjaRk2DL+K58Ji1KAhKwog/UK/CJDSHLJ9sdMAF0SWjrsuphylWVRDVooSw8
	lqdAxNvwlC+OzvcOxVeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grKgu-0005L0-Ky; Wed, 06 Feb 2019 10:44:28 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grKgr-0005KQ-Kk
 for linux-riscv@lists.infradead.org; Wed, 06 Feb 2019 10:44:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 429ABB0C2;
 Wed,  6 Feb 2019 10:44:24 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <anup@brainfault.org>
Subject: Re: Boot stuck at "smp: Bringing up secondary CPUs ..."
References: <mvmsgx22r3u.fsf@suse.de>
 <F77EA382-959C-4142-9A00-F1EBB58D37F8@wdc.com>
 <mvmtvhh1dl2.fsf@suse.de>
 <CAAhSdy1OWwh86u1w=jtX-3SidWjZm46T-5giKtXD1LMcZSywQg@mail.gmail.com>
 <mvmftt11bdq.fsf@suse.de>
 <CAAhSdy33AFXrCQppswWzscy8TQh0Tjp1ixcjFcoB97v6vAwWxw@mail.gmail.com>
 <mvmbm3p1a1u.fsf@suse.de>
 <CAAhSdy3Dw=_dszr3css71zOfbu-i1adMwXxYS7115NO2e0JWqA@mail.gmail.com>
X-Yow: You must be a CUB SCOUT!!  Have you made your MONEY-DROP today??
Date: Wed, 06 Feb 2019 11:44:23 +0100
In-Reply-To: <CAAhSdy3Dw=_dszr3css71zOfbu-i1adMwXxYS7115NO2e0JWqA@mail.gmail.com>
 (Anup Patel's message of "Wed, 6 Feb 2019 16:07:47 +0530")
Message-ID: <mvmy36tyz5k.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_024425_819296_194021D7 
X-CRM114-Status: UNSURE (   5.93  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Feb 06 2019, Anup Patel <anup@brainfault.org> wrote:

> Not sure what case you referring with BBL.

I don't refer anything.  It just doesn't boot any more.

> Please review Atish's SMP fix patches.

The very same image has booted previously without any issues.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
