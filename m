Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C17D715C7
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 07:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvzZRpa5oVksHGHAaDUxw94I01k0YLjQpuRJZ1P1Iug=; b=4YjyycL0y3DZ/u
	AjVAzaq+e4ggwzkzRAt6zykD7uWvHCOfyV9E/G84umtFof2Joxk1ASrYWEPTKZLWhgFzxiWkI+mE9
	NmOBwkJX1gieOTRENeq3duVb7fSLkndYYJanvgatdQNIV+btNfCAwYMdX5ldxrgVhu1ojmnmclSWt
	JHtTUu2tZX92CGR0P06XnHq5iXM1BGQzBqVAB4nrtI/hx+2zgZ7HUjjNWn8u5hTXG7/zpi+KQNjwZ
	LYZhqMhJUBAveEjzgan5sIiJ0u92kgP5t1ErYML80u8j4pVQApP3knjzx8D9hbF5PG8hDh4LO59aH
	Ks17U9NESSmKKOvG9+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYUt-0000000A52v-40X5;
	Sat, 24 Jan 2026 07:55:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYUt-0000000A52o-0ceZ
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 07:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E72960053;
	Sat, 24 Jan 2026 07:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7706FC116D0;
	Sat, 24 Jan 2026 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769241353;
	bh=1FtbiGnuwmQ28dQgRU4jKKoCQsv5CiQHWYCVnzGTOhg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UsQoXd/ynJFIzGp8ZBNtqppH2Jx53jpA7E+CeKGxGAIZ4BkvFxI+qgVsZMKtXUzPM
	 A9LsaXY1mZKKVBECU5k8jVvHhC4B4HSjzAWg93whuldxdMl63Fj1/HNM1KU8XblnQ7
	 lFVG9DcQwJq9NzB761QeeRC7GyabxX1uZ8K6zIXkzxubXuoB/wJq+Q+769WW5YkqEh
	 gZFMh3X9wgE9t/+ja5ZIhtJwDmI/GQDGWG7Z0g6+QljASj88/1X01pP5IWiZ+QIO9B
	 dlbp8Z+EuUiLKoXKY6z8amqAjWsZxpSzdUrOlzYyj/mMhz/9SIkNAbh0r+7r5Xozrb
	 vEqcjxpBz36vw==
Date: Sat, 24 Jan 2026 00:55:49 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Austin Kim <austindh.kim@gmail.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, inux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix minor typo in syscall.h comment
In-Reply-To: <aW3Z4zTBvGJpk7a7@adminpc-PowerEdge-R7525>
Message-ID: <a4e97928-a953-ae2b-3c49-339d5cad2aad@kernel.org>
References: <aW3Z4zTBvGJpk7a7@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
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

On Mon, 19 Jan 2026, Austin Kim wrote:

> From: Austin Kim <austin.kim@lge.com>
> 
> Some developers may be confused because RISC-V does not have
> a register named r0. Also, orig_r0 is not available in pt_regs structure,
> which is specific to riscv. So we had better fix this minor typo.
> 
> Signed-off-by: Austin Kim <austin.kim@lge.com>

Thanks, queued for v6.20.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
