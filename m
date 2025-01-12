Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC7FE77188
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jan 2025 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORry6uyxGIF3B5rtIEBvUcHaaFCvZyfUyrPzfEywUG0=; b=bh+7mvC0LqId6Z
	dnT8270Nvuz1PHqUMi30/hb/4tYzlHe4F/LrmeW2fz4kTGfYk1OoNA+IwFxtXzWX2uEe6vy1XOERn
	L9yPu/1JCeLB/iRE734/8NDK5+PASIediR+0oq46Bj3utdvBBBgerz3P691L44ZYaCDZEOM8n8gZ2
	FRYUBNsYdriDR6tDI2I1AJkE/aU83L+jQY4goHUzEgqEta2HHTP2nm9LfZgJ7RcTD2ti0kfxXnxQO
	sTbTsZp5WZ5adk5O4/yK0ST2SrlZa/1bu/eLHcr3TrNEy8K/EDI670vw4VSAWjQZMYOllHOG4BINm
	ABNR9EtWelHfCqgUr0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1og-00000003Bjp-1qS3;
	Sun, 12 Jan 2025 17:32:02 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1j9-00000003A9n-2jw8
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jan 2025 17:26:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B8C840002;
	Sun, 12 Jan 2025 17:26:13 +0000 (UTC)
Message-ID: <0f6e19a9-a222-4b23-8b2b-1ab674a42ba3@ghiti.fr>
Date: Sun, 12 Jan 2025 18:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.13.0-rc6 regression: workqueue: work disable count underflowed
Content-Language: en-US
To: Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <87y0zggj2x.fsf@igel.home>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <87y0zggj2x.fsf@igel.home>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_092619_838068_F2F8FF0B 
X-CRM114-Status: UNSURE (   5.24  )
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

Hi Andreas

On 12/01/2025 16:14, Andreas Schwab wrote:
> I'm getting this warning during boot since 6.13.0-rc6:
>
> [    0.141368] [      T1] smp: Bringing up secondary CPUs ...
> [    0.148136] [     T22] ------------[ cut here ]------------
> [    0.153968] [     T22] workqueue: work disable count underflowed
> [    0.160281] [      C1] WARNING: CPU: 1 PID: 22 at kernel/workqueue.c:4317 enable_work+0xac/0xb8
> [    0.160301] [      C1] Modules linked in:
> [    0.160311] [      C1] CPU: 1 UID: 0 PID: 22 Comm: cpuhp/1 Not tainted 6.13.0-rc6-109-default #1 openSUSE Tumbleweed (unreleased) 854d048b683283a7c361c3ae5310460e68e3fd5c
> [    0.160325] [      C1] Hardware name: StarFive VisionFive 2 v1.2A (DT)
> [    0.160331] [      C1] epc : enable_work+0xac/0xb8
> [    0.160340] [      C1]  ra : enable_work+0xac/0xb8
> [    0.160348] [      C1] epc : ffffffff98a50326 ra : ffffffff98a50326 sp : ffffffc6000e3d60
> [    0.160355] [      C1]  gp : ffffffff9ab79a00 tp : ffffffd6c0315b80 t0 : 756575716b726f77
> [    0.160361] [      C1]  t1 : 0000000000000077 t2 : 65756575716b726f s0 : ffffffc6000e3da0
> [    0.160367] [      C1]  s1 : ffffffd6fdd79310 a0 : 0000000000000029 a1 : ffffffff9aaf3e50
> [    0.160373] [      C1]  a2 : 0000000000000010 a3 : ffffffff9aaf3e50 a4 : 0000000000000000
> [    0.160379] [      C1]  a5 : 0000000000000000 a6 : 0000000000003ffe a7 : 00000000000affa8
> [    0.160385] [      C1]  s2 : 00000000000000c3 s3 : 0000000000000000 s4 : ffffffff9ab88d30
> [    0.160391] [      C1]  s5 : ffffffd6fdd69130 s6 : ffffffd6fdd69158 s7 : ffffffff98c44c1c
> [    0.160397] [      C1]  s8 : 0000000000000000 s9 : 0000000000000001 s10: 0000000000000000
> [    0.160402] [      C1]  s11: 0000000000000000 t3 : ffffffff9afa7ebf t4 : ffffffff9afa7ebf
> [    0.160408] [      C1]  t5 : ffffffff9afa7ec0 t6 : ffffffc6000e3b58
> [    0.160413] [      C1] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [    0.160420] [      C1] [<ffffffff98a50326>] enable_work+0xac/0xb8
> [    0.160430] [      C1] [<ffffffff98a5033e>] enable_delayed_work+0xc/0x14
> [    0.160440] [      C1] [<ffffffff98c44cac>] vmstat_cpu_online+0x90/0xa2
> [    0.160453] [      C1] [<ffffffff98a33c48>] cpuhp_invoke_callback+0xd4/0x52a
> [    0.160467] [      C1] [<ffffffff98a34e86>] cpuhp_thread_fun+0x9c/0x13a
> [    0.160479] [      C1] [<ffffffff98a5f08c>] smpboot_thread_fn+0xbe/0x19a
> [    0.160493] [      C1] [<ffffffff98a5851e>] kthread+0xc6/0xe0
> [    0.160506] [      C1] [<ffffffff9946f126>] ret_from_fork+0xe/0x18
> [    0.160520] [      C1] ---[ end trace 0000000000000000 ]---
> [    0.372191] [      T1] smp: Brought up 1 node, 4 CPUs


That's not related to riscv and hopefully it got fixed in rc7 
https://lore.kernel.org/all/20250106131817.GAZ3vYGVr3-hWFFPLj@fat_crate.local/

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
