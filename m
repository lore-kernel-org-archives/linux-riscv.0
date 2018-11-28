Return-Path: <SRS0=pb0J=OH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4119C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Nov 2018 18:15:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76098206B2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Nov 2018 18:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQrZNcks";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="NT/zg9FP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76098206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dA/hlcSuy02YkA0zJl8uXxcnsaZkDpHmtjeLYFeUB8Q=; b=CQrZNckss1IO8UlT9S0KiBseD
	/hgIuYby6QXffgbYwcysVfntcip9TCX4ALQer0Y7EfmLOshRg1GQxp3MMfOFDOadfDxI22SCnhvIb
	4YFwC+J1B894qPu53xbH8rl60afec2mK71dF/3BG+nfnSiiGTugBmDFKB9BD3HBRC8ZDrzXIzWmSv
	79kGsG+HlEVfN8gwy9j7bNqgzXHDSIAV/6pz3fjD3tofeKdFiv/DK1iDdwEz4/Fpj1wyUaEwtLR1K
	NrIElm+1o5nfJCSdce84CdAdggvEiIMNX6shTULUPZsrRhA59TAGSQNv196pqqqNZtMcXS8tzXb+j
	MSSDnraZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gS4NG-0001p6-O8; Wed, 28 Nov 2018 18:15:46 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS4ND-0001oe-7j
 for linux-riscv@lists.infradead.org; Wed, 28 Nov 2018 18:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1543428943; x=1574964943;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=VbCtUK0B6nIp8n9Xq8wecIQp5tDLrwRfU98MVtEmGLc=;
 b=NT/zg9FP+3xx7Lnva17rye7rqT67VqpRYP6bb/pnyRQPF9nu9tV8bifp
 V26pWlqTtBxlqKAp+5eILbOYiWewImZx/m987k3cbw4L4iCJ7/v4tN8JZ
 efwk85ijjxy7QRlebxknRNbfCGbh1lu/9eLQMZhunJq7eXfoHvQ2fHb1X
 T+V1xGZthbzt4pAm4oN77ipgVmOZ1vqKulROa/P12v0l7eflI/396Ig/3
 g41KSx5NP6oYMn79sFQNvIoCFcRct2MvOPgVYzP1Gj/uiYROBJ6QjeAkb
 7SOsVClrVh4OBO3DxG/tL7w4IMRNNqGnMKPBnYtECDppmF3o4xQOZOmUL A==;
X-IronPort-AV: E=Sophos;i="5.56,291,1539619200"; d="scan'208";a="199911690"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2018 02:15:28 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 28 Nov 2018 09:57:56 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.72.98])
 ([10.111.72.98])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 Nov 2018 10:15:29 -0800
Subject: Re: macb: probe of 10090000.ethernet failed with error -110
To: Andreas Schwab <schwab@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <mvmefb5fr6d.fsf@suse.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <f1e5d078-bc4d-910e-8717-f5870a0e994a@wdc.com>
Date: Wed, 28 Nov 2018 10:15:28 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <mvmefb5fr6d.fsf@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181128_101543_416797_E3580F6F 
X-CRM114-Status: GOOD (  14.48  )
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181128181528.YpIqPpp9KgjCFD6WK5JEZIX2ln_iV8ZgrpvI0sNQoks@z>

On 11/28/18 2:11 AM, Andreas Schwab wrote:
> The PHY probing of the macb driver appears to be rather unreliable.
> Most of the time it doesn't work the first time, I have to reload the
> module several times to let it succeed.
> 
> [   40.530000] macb: GEM doesn't support hardware ptp.
> [   40.530000] libphy: MACB_mii_bus: probed
> [   41.450000] macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not attach to PHY
> [   41.510000] macb: probe of 10090000.ethernet failed with error -110
> [ 1354.400000] macb: GEM doesn't support hardware ptp.
> [ 1354.410000] libphy: MACB_mii_bus: probed
> [ 1355.260000] macb 10090000.ethernet (unnamed net_device) (uninitialized): Could not attach to PHY
> [ 1355.300000] macb: probe of 10090000.ethernet failed with error -110
> [ 1358.100000] macb: GEM doesn't support hardware ptp.
> [ 1358.110000] libphy: MACB_mii_bus: probed
> [ 1358.310000] Microsemi VSC8541 SyncE 10090000.ethernet-ffffffff:00: attached PHY driver [Microsemi VSC8541 SyncE] (mii_bus:phy_addr=10090000.ethernet-ffffffff:00, irq=POLL)
> [ 1358.320000] macb 10090000.ethernet eth0: Cadence GEM rev 0x10070109 at 0x10090000 irq 12 (70:b3:d5:92:f1:07)
> 
> This is 4.20-rc4 on a HiFive-U.
> 
> Andreas.
> 

Here is my previous analysis on the issue.
http://lists.infradead.org/pipermail/linux-riscv/2018-September/001503.html

Not sure if you have tried the hack already. But here it is anyways.
https://github.com/atishp04/riscv-linux/commit/aa230e7dc2ab01db5b630f427e57297ffc25c884


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
