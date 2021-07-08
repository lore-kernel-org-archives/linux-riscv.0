Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B8FC07E96
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 05:29:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3DF361CDA
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 05:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3DF361CDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9KnJB+Zk1JlooJ5mCaAuwe9ku644iS0k6wlTZ/wxWk=; b=GSf3jsL5OUdxp/
	PhqoARRykXABRo352eHIsD+Wce8QUrzvSVp9ElBnT6NDlmPhaX4rVLMtrc/uR60/gsqsWlTS8O6dT
	AbKh1Hd0XMQh6d6IXoOLUusOuL5gTaBDqcoP8YmGqnz3NG/P59gxhtLgO/cLZPewek44/PQMvFh8c
	U0KHaePkpVq5Nn/nDLuhigoA6zuDkmXpL33a/zo0KUMGdCWCVCQwcEQaV68vZ2tg4wuW7iT8shXk4
	vU0tQn9F7iEWGoj0oUNrHxPG/RjXsO1BdvWIWSbX5SnHraMwnAi937ijuCJizc2Kza87n1M2AsuML
	6ds81WbXXbVwOSyFjOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1MaX-00G61u-BT; Thu, 08 Jul 2021 05:28:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1MaV-00G61L-Ac
 for linux-riscv@bombadil.infradead.org; Thu, 08 Jul 2021 05:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OIfsa/YbHy0XxxKvbIwODliTSIBR1jMxzn42a8ynFko=; b=NyhQ054LV9u9Te1MlrwFvqD0Nt
 egJ34ejqiwsARPy5wbKcQkJyHaio3tljHxHTbgMc439+cN6lIuPyYgVP2oFn0v6ZOwzj3yPY8yByI
 nbiD4mUzsAuI8PK9peBqRg0wJTZutd2ZT1jxCAeuZQFViIvUYctLO4ftNxo0igJDR8KtWfAxwcV0b
 BEcIgqFHXPvqMGiUEteDqXPTeg+agU5ZAB3YRmQhngchNhJe5K3SVfgKONgFEbF8qXOEQyXe9KeRL
 HioyZ0FwtyrHT95ydD1hLs+f6nTTW7nzF31Q7GxR12wu53/ZvMi+le/GOdW5CUx83DOojyZwnnWNV
 alJ4nsbA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m1MaD-00D7BK-R4; Thu, 08 Jul 2021 05:28:27 +0000
Date: Thu, 8 Jul 2021 06:28:21 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: palmerdabbelt@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] riscv: Allow forced irq threading
Message-ID: <YOaM9bfqZiU386T7@infradead.org>
References: <20210708015949.20076-1-wangkefeng.wang@huawei.com>
 <20210708015949.20076-2-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210708015949.20076-2-wangkefeng.wang@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Jul 08, 2021 at 09:59:47AM +0800, Kefeng Wang wrote:
> The timer interrupt and the perf interrupt on riscv are with
> IRQF_PERCPU, so it's safe to allow forced interrupt threading.

"Architecture code needs to select CONFIG_IRQ_FORCED_THREADING after
 marking the interrupts which cant be threaded IRQF_NO_THREAD.
 All interrupts which have IRQF_TIMER set are implict marked
 IRQF_NO_THREAD. Also all PER_CPU interrupts are excluded."

Did you do that audit?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
