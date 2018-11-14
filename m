Return-Path: <SRS0=rRaS=NZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26670C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 16:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E64E9214F1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Nov 2018 16:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e3X31fWQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UCi0CIjB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E64E9214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pZTHbtkSe9Z0T+RarRhdnQCjNyFLrRROBurJd4yZeps=; b=e3X31fWQYVaJUT
	2SpR1oZiCf9Yu1utfXxAD09Qj6YW8b4UsqM4hTUQlwtZbInoq+FV4cTK7KCQ9UdjJzA1DE5PtFZDQ
	o51Fm+eShAfFnNEDpvHhKT0BINISDIYeKkTjuDFjU+biKBQXenBdzLv5IJm6k5gCpuhB+3kzRwj2p
	Xpf8cB47lU7I8y60d/5x05qZsmYFMu+UCsKXrdZRXa8wfhv1et0MsKtQ/yWRUZDB07nVVrroCEF2x
	m16U9n+1hUuak2SpgGnjZWtkFlHfY26KclcMsR1aDC3OYwKGgS7R2fz7ZJo7YDaqaoyPwtxXnJqgO
	MsXmYGg0KRV+cuGLaHJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMy6G-0003jD-O9; Wed, 14 Nov 2018 16:33:08 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMy6G-0003j1-1M
 for linux-riscv@bombadil.infradead.org; Wed, 14 Nov 2018 16:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MX8b7q+KuvblRRMn3CnXSOu313lgRAviScilhC2vh50=; b=UCi0CIjBVGKrdY1xNfI/qgc8tj
 xyduFbYK2ysBj3jUUo35Gy+5im1VvyifR/ct/vBueGtn31SdG/RTPnxwaz6J6kjWsRUWLQ+0jDN+H
 DZoi1ySYVFObKoern7tfEGhDhe/XPpeBR1Mkjp2gjPCWa1yKLHJkQ6tCEmn5wW4VoCbqaLf2SnTZl
 R0qplJPTtliveVuwPGJhUdSpqJTz019Av/jH6PCZl30lxRgYr9iYasNt6E7tR4jJSvQW85Txsy5V0
 TB7pTYQAAo2w8AE2It6ypmzNIWRBdlNI85oYt0WMUrxDQupIYwZbDCH3kQSjntLMfSzoZNkA5LhtG
 2F/REjgA==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMy6D-0000KI-IB
 for linux-riscv@lists.infradead.org; Wed, 14 Nov 2018 16:33:06 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5782AB11D
 for <linux-riscv@lists.infradead.org>; Wed, 14 Nov 2018 16:32:52 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: MACB in 4.20-rc2
X-Yow: I'd like MY data-base JULIENNED and stir-fried!
Date: Wed, 14 Nov 2018 17:32:51 +0100
Message-ID: <mvmwopffwlo.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181114_113305_707080_3D681D3F 
X-CRM114-Status: UNSURE (   7.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181114163251.WKYPOI3XoHRU-qv6_jIfeFphZJkrZPOVL1kDrax1ucg@z>

It looks like the MACB driver is broken in 4.20-rc2.  I can see these
two messages:

[   38.530000] macb: GEM doesn't support hardware ptp.
[   38.540000] libphy: MACB_mii_bus: probed

but appears to be stuck without ever reaching this message:

[   38.750000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: attached PHY driver [Microsemi VSC8541 SyncE] (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL) 

The module never finishes initializing.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
