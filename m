Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F56C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A84C20651
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 13:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mMO52n46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A84C20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pyf4ckZT6zknwKo92yBLQ7ik0VNLpCdzMazG43PUPo8=; b=mMO52n46UP967O
	I3hNnAGR37YwSF/0zMjRKhCZXsOkxHuhwT5bLgicENXLJdU0ZpD/QFy6nbS1OJ9DT8dNnYV7eb170
	QQjasl4PSIzpQhWmsp1Pi9umyPgtmRAkeDpXtYv//JSR7m+Paog53QWX0l7pscnbwOJXIUjbm5o+X
	qPeGv0mnEqy3BT1rGuDMf1i5kR8gcNW1wyDxlroS49qrjdyFi53yaut6++BLaZ4HGmE6dsiezrfdU
	RSYGo/ZAb1fcmcxCXX9O56ZUiTWI4XhTzzP8txFbfzxp1zl0GAoX0J5kaUpmOxSNEGzk08QG9XDJo
	st9mr6sr6AZBMv60w0sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjP7m-0000mq-VM; Tue, 15 Jan 2019 13:51:26 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjP7l-0000mc-Gl; Tue, 15 Jan 2019 13:51:25 +0000
Date: Tue, 15 Jan 2019 05:51:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v2 1/8] RISC-V: Do not wait indefinitely in __cpu_up
Message-ID: <20190115135125.GA28946@infradead.org>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-2-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1546940318-9752-2-git-send-email-atish.patra@wdc.com>
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
Cc: Patrick =?iso-8859-1?Q?St=E4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

>  
>  void *__cpu_up_stack_pointer[NR_CPUS];
>  void *__cpu_up_task_pointer[NR_CPUS];
> +static DECLARE_COMPLETION(cpu_running);
>  
>  void __init smp_prepare_boot_cpu(void)
>  {
> @@ -81,6 +82,7 @@ void __init setup_smp(void)
>  
>  int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>  {
> +	int ret = 0;
>  	int hartid = cpuid_to_hartid_map(cpu);
>  	tidle->thread_info.cpu = cpu;
>  
> @@ -96,10 +98,15 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>  		  task_stack_page(tidle) + THREAD_SIZE);
>  	WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
>  
> -	while (!cpu_online(cpu))
> -		cpu_relax();
> +	wait_for_completion_timeout(&cpu_running,
> +					    msecs_to_jiffies(1000));

Having a global completion here worries me.  I bet we have some higher
level serialization, but can we comment or even better lockdep assert on
that?

Also please use up your available lines (72 in commit logs, 80 in source
files) instead of adding spurious line wraps.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
