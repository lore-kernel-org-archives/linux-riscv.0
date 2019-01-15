Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DB4C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:28:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8195F20675
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ORS+fD0h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8195F20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCTKnUWGTekE/rauml5arlZlb3O8E5wHf33YpAjBWxM=; b=ORS+fD0hO8HlVS
	tZvTj8enGxOt57/cP7iEl48UCOjNtHzZtCW9U9dvx7dusgJ+4BTPzOhZQQOMNXlAKlLHr94oDM+I1
	rlROF3AezvI6ypCH4/R4XGOkmmiDtbW6njPy9JohZtKvw1ZE33f6xrfQpxt0NZNHd9x+W6g7R++/n
	ehq/wfZBmcW5mksZwVTzM0iQGGHkQ6h421v+8XaF3ddWEFaLX7XHf9o6oQ2+p/eI/oAxILgstVgv8
	dW5zVBYv6WXPPxISP8p67dRrVCO1g8FqJAToupTM9fxSI3Iq4HKHSjB5AaoRhi+lDo6pgrn1aqoZd
	lqrkzAHCmxyNAyRfg8rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjQdD-0007yM-D1; Tue, 15 Jan 2019 15:27:59 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjQdB-0007yB-T1; Tue, 15 Jan 2019 15:27:57 +0000
Date: Tue, 15 Jan 2019 07:27:57 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190115152757.GB26443@infradead.org>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, thierry.reding@gmail.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From a general code quality point of view this looks fine to me.
I don't really know anything about the PWM subsystem, though:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
