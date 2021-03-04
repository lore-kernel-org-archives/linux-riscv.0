Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DAEC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 13:46:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0881564EEC
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 13:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0881564EEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d0uOZkksPdiwcVFPxxUtJBVIyz2g7eFA6KA1RE0UFjc=; b=UuBUyoar1or4IDyspe1EqDPUa
	SD1WeFw+W9NPHHq49Kr76RyO+M/fbXydxIqGnXY31SB3LjINrH/fTe86jtpdaGyVw6neD1CLkKgrW
	qeh2bdf//QLABv4fq7HDozRPQ+F3AN8QvjA9pm/ADCmLBiTx6NQQpXQuQGER8PbDF6S3c1o5AL5e5
	ogiLygNlNbBM5HrFdc/lPQFxbnEbuCt9aJP5pz2tjl2iKkZMaYl238R/xNv60V1dVhGBg2IF+EyF3
	0gHyLKcbV1Pz5/WqLBmJojOy67T5nSvavv+z6sanQ7kM0axNJ8fdHZKkCgdelRllB9Eywo7sulPTw
	1uzmrq9Rg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHoJ7-008nCD-RA; Thu, 04 Mar 2021 13:46:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHoIp-008n98-UY; Thu, 04 Mar 2021 13:46:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED35164F45;
 Thu,  4 Mar 2021 13:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614865564;
 bh=uStLyUhWNhdDMx2ZDs6rM4kw9fBh35DMg6kTC+SrY7s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZRUezqyN1ysi7HtF16CF7nuZo6UsGoPaDbTYbYgpGpbVmqzDVHBFKpIvcZ1q65qSM
 ZM8HUea5+V2FKGsb9fHWDtkf+JfNN9cQaeEfel2jc+XfPUE9crlQNkw8chIREWQXz2
 w1RPFbmaDCrgE9/gX4eJ8aJboJhnH8N896kft6YE=
Date: Thu, 4 Mar 2021 14:46:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 nsaenzjulienne@suse.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rppt@kernel.org,
 lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
 sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
 song.bao.hua@hisilicon.com, ardb@kernel.org,
 anshuman.khandual@arm.com, bhelgaas@google.com, guro@fb.com,
 robh+dt@kernel.org, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, frowand.list@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 wangkefeng.wang@huawei.com
Subject: Re: [PATCH stable v5.10 0/7] arm64: Default to 32-bit wide ZONE_DMA
Message-ID: <YEDkmj6cchMPAq2h@kroah.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
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

On Wed, Mar 03, 2021 at 03:33:12PM +0800, Jing Xiangfeng wrote:
> Using two distinct DMA zones turned out to be problematic. Here's an
> attempt go back to a saner default.

What problem does this solve?  How does this fit into the stable kernel
rules?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
