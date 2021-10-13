Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7336DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 13:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A56A610FC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 13:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A56A610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUPeilGfPQIGOBxZokOIXoDPr9M+55X7zT+Ms+K8tq4=; b=pZXBfsoV1a572gzQs+KwIRKACN
	zYwgKnplPh0G62YUess4YO6GMB7rlXvIGUg9cmGmLYkj0uNw9dbQvEEA/jRmYldGQZdaMgASG1zmZ
	Tchh3xPwvA/fCgx+gDk2VS4k1HlRztDnQcCWWhEEekGoG96N2FkWo1FNzK7J0nvesM/e0z/MEJYyC
	BhFZoaDu6mzyTvesCg1DtXt8i5JZUlxM6U7ozQT+xKHohw8uVaQqaLz8gI9Vd0rR4MA91YHYHzF4u
	zzkkpwzdERBiew2ZABDUHDE90uG9hb7qxIyt6n+miRrr1hm5zE2oMmpYNVrqNNWoPfR3JRs63O5sI
	p41kIQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mae5S-00GoPi-SM; Wed, 13 Oct 2021 13:14:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1madY1-00Gca2-OD
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 12:39:55 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A9D760527;
 Wed, 13 Oct 2021 12:39:53 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1madXz-00GUGU-7F; Wed, 13 Oct 2021 13:39:51 +0100
MIME-Version: 1.0
Date: Wed, 13 Oct 2021 13:39:51 +0100
From: Marc Zyngier <maz@kernel.org>
To: guoren@kernel.org
Cc: anup@brainfault.org, atish.patra@wdc.com, tglx@linutronix.de,
 palmer@dabbelt.com, heiko@sntech.de, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, Rob
 Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
In-Reply-To: <20211013012149.2834212-1-guoren@kernel.org>
References: <20211013012149.2834212-1-guoren@kernel.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <5eb20b41ca611f410cf802d4d4a9e945@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 guoren@linux.alibaba.com, robh@kernel.org, palmerdabbelt@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_053953_876909_9A645BCB 
X-CRM114-Status: UNSURE (   8.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021-10-13 02:21, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Add the compatible string "thead,c900-plic" to the riscv plic
> bindings to support SOCs with thead,c9xx processor cores.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atish.patra@wdc.com>

Please add a cover letter when sending more than a single patch.

This isn't complicated, and git will do it for you if you kindly ask.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
