Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32DEC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihWwQPf3hHhT3ZTVlNcpS02KOkhqUSpMyBlbfjBRgLw=; b=PUxYusQ2lfl3eK
	v3UZ8mKSEJefIRRxjVbZ97XsuyvB/xbeeAb9Dq0aiWNcsoLGxP+RmsPjAM4mSFJKC6Zk6l+i4HRL9
	VTDlMzcgFgnOiQGSHZZ2zpGJbPlNHVCPAEIRrNejIVi/pvRAv2U24DaYaQFWoSGWNJWYXBfXR3Ywh
	EO5hIDxi+OB/n6Li8pa22O3jxbhyH5kI29iNt4sUSzkbjUM1RNFX9DexplpEXoFblxodnBsiEYCi6
	dzfl38WMSk851ZjvDIWuDGtEUHYNt8FALS3kmQ5rXfzsOWOm33hNCZ5UY6RED9jXl5vH05iW3J6Dp
	gWR7aMYRIGhtPYPKr4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRao-0000000CQYN-06kg;
	Sat, 27 Jun 2026 11:53:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRam-0000000CQXy-0F0q
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 11:53:01 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782561178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NrvIXBmyQCpArzVTIgx2K7SVdrmTheHKmkp2Bifz8cw=;
	b=nVzRBxFYlxGMNeOMTHdkZfIOTcEuWkDJpjKLXgODVCYVK7tXDWdnZkxIif0FydmQxJmlPn
	gwzT987spXF59HAvnP5IaL+WR1R2RguXdzsYOAkPa9vQpYZeDtGp49zUdVvKB7GPMZUMrS
	e4l+V2KrRN0Lhe9o51wwH0Cmr9t3k258MLt9oq/1VVMAUXtZZLHKmO8DRHO7KPET7mzaWI
	7ZJJgx46q89M7KmcPTyyYgxBRix3koZP79UQcGPe3AfAFNrIfG9DuyXqk4WOQHoefOsKSV
	1MPZMhLR0VUuYvCa7i9OqgMdYoQ9nN8WXdCl/VzHl0t1HC7gZw0dd2j6hNLtog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782561178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NrvIXBmyQCpArzVTIgx2K7SVdrmTheHKmkp2Bifz8cw=;
	b=sEJWAL/sEDO2NQpQcktKtub2xs7FtS7whUot9N3o5lkvhAEiIakIhZDu+bBWH5iUz4mhBr
	ywhqVHMqLr02QzDw==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Xiaofeng Yuan
 <xiaofengmian@163.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: probes: simulate c.jal instruction
In-Reply-To: <878q805jvd.fsf@yellow.woof>
References: <20260627001939.3847-1-xiaofengmian@163.com>
 <178253409654.105999.9483335947060007692.b4-review@b4>
 <878q805jvd.fsf@yellow.woof>
Date: Sat, 27 Jun 2026 13:52:54 +0200
Message-ID: <8733y85hex.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_045300_246852_142095C2 
X-CRM114-Status: UNSURE (   3.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Nam Cao <namcao@linutronix.de> writes:
> Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
>> Can you also add a test case to:
>> arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S?
>
> I already have a patch adding test case. Let me send it.

I screwed up and didn't cc you two. But here it is:
https://lore.kernel.org/lkml/20260627115051.3235783-1-namcao@linutronix.de/

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
