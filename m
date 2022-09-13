Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43965C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqitqvzXh9P57Lv6VTS2qq4KjLEk6p5DdsV++L+z2/4=; b=TyCFJDJ64NyBQy
	Izpc9pVA9ztrQD8CvLmwI7ftB9BBe7V1NanMFLIIk1H2Dn0qfZT+bihMwOAGpHX1nhnP8a0qsCMn6
	p83ASjkyRdMjNOkhTeoOc9h9jMc2UpJrUd1+TvsbRjrEmhnXUOILhu7UmNr7PEyo+GHXVj/EaRdDz
	aOWUroqcHdxOA+5IjybTVUfL/uvNC8lgLPofOwxJ7cnycJ2EDJ5eJM/MAPWnlCJ0xZet+P5XLti+f
	iMRa3MiL+v6daiQjXW1lKcdsKQXq9ogzSAHVPjap54a9PYlKBkLAufnmD/hkXzT2/KxEv5MBFVQ0p
	oXf6piyFbb6DmMYdtzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3wu-0085s8-8k; Tue, 13 Sep 2022 11:19:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY3wi-00859G-Ag; Tue, 13 Sep 2022 11:19:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 283AF61376;
	Tue, 13 Sep 2022 11:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBC9C433D6;
	Tue, 13 Sep 2022 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663067954;
	bh=8WL+2ChhNqJlCeEkSghkmVAikI1JBjjo/JWZKZfMn+A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UhfEBLtkgUc3lrz38hjnenMo+Rg51QOM1iTk1lKYeEgONVhVxyeH3CGOrJw68hTV6
	 7jHgezmYrca3LZj1v+4hhN791suCz3UG9K9vWr4AsXS8+NGkB++3IVcLjEfr/OhNj6
	 1DsTUc6SUW31x79tpKfQbuU5YMehEz8dafiHWM01nVwvKRPlzazhtlJbJxkotBnNYV
	 rBpHAmzgoUsvAcjspfavQ4X6fhp31cH6AVI6kKTsw14N2zZKnCIYrbm3WsuzNlzGN3
	 R9uNKDAjHumn5p9xb/T6kR2qfrskiGYaFTT+iCy2vrXySykOI/RxJ/3RC04WV2Qx5Q
	 tBP94Ih85TpVg==
Date: Tue, 13 Sep 2022 20:19:09 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Liao Chang <liaochang1@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <rostedt@goodmis.org>, <maz@kernel.org>, <alexandru.elisei@arm.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH V2 0/3] kprobe: Optimize the performance of patching ss
Message-Id: <20220913201909.2c7e38a40e719461e3c19b12@kernel.org>
In-Reply-To: <20220913033454.104519-1-liaochang1@huawei.com>
References: <20220913033454.104519-1-liaochang1@huawei.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_041916_455119_7C0B8A96 
X-CRM114-Status: GOOD (  12.26  )
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

On Tue, 13 Sep 2022 11:34:51 +0800
Liao Chang <liaochang1@huawei.com> wrote:

> Single-step slot would not be used until kprobe is enabled, that means
> no race condition occurs on it under SMP, hence it is safe to pacth ss
> slot without stopping machine.

All these patches look good to me, since single-step slot must not
be executed until it is prepared.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
for this series.

But I need Ack by each architecture maintainer.

Thank you,

> 
> v2:
> Backport riscv patch to cksy and arm64.
> 
> Liao Chang (3):
>   riscv/kprobe: Optimize the performance of patching single-step slot
>   csky/kprobe: Optimize the performance of patching single-step slot
>   arm64/kprobe: Optimize the performance of patching single-step slot
> 
>  arch/arm64/kernel/probes/kprobes.c | 5 ++---
>  arch/csky/kernel/probes/kprobes.c  | 6 +++++-
>  arch/riscv/kernel/probes/kprobes.c | 8 +++++---
>  3 files changed, 12 insertions(+), 7 deletions(-)
> 
> -- 
> 2.17.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
