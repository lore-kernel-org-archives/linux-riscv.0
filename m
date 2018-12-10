Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C94C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 10:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F421320821
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 10:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmJ1NBg6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F421320821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iWs1KCHg6+wI5gmtaAYHy+DOfk4lVJK66hyd2noYhA=; b=BmJ1NBg6grcQ+Q
	Q7I8IrqVbmUdyuOvBytHc8zEmAdQKiLHLo4fy3InebPIYvUsL3pctqhIpixffRpPZCqc3NGaUoMii
	FoXWs08DIwYpWxkAINxP56SQOjtDUOsOBh/iv25zCNhc3iV7wu9YF3GHfxeudYdW5fRlBWczG/1U2
	PcJl/DAEyL2i5syYDRQBh8b67QsMoMfh5E486E0HivFrcr78A33ehOR9vAC49nt002kjRamBYJKQk
	EqOOVxQs1b9EwjC3G2/kurJLmqRrPkTeiBTkPxB2u4OhrA66Lg/RPlDxPxyaCnsXBf2dxudsgR9R7
	zv3h6ahG5oMyXrVornPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWJGh-0004rc-4s; Mon, 10 Dec 2018 10:58:31 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWJGc-0004pT-QB
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 10:58:29 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DFFB3AD36;
 Mon, 10 Dec 2018 10:58:12 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] riscv: don't stop itself in smp_send_stop
References: <mvmbm67etfg.fsf@suse.de>
 <72991c58-91f5-abb1-54f9-35ae4533a26e@wdc.com>
X-Yow: Your CHEEKS sit like twin NECTARINES above a MOUTH that knows no BOUNDS
 --
Date: Mon, 10 Dec 2018 11:58:12 +0100
In-Reply-To: <72991c58-91f5-abb1-54f9-35ae4533a26e@wdc.com> (Atish Patra's
 message of "Thu, 29 Nov 2018 10:52:40 -0800")
Message-ID: <mvmsgz5bqd7.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_025827_068106_97382320 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 29 2018, Atish Patra <atish.patra@wdc.com> wrote:

>> +	cpumask_copy (&mask, cpu_online_mask);
>> +	cpumask_clear_cpu (smp_processor_id (), &mask);
>> +	on_each_cpu_mask(&mask, ipi_stop, NULL, 0);
>
> The function header of on_each_cpu_mask says func should be
> non-blocking. Not sure if that's a hard requirement or not.

What does that mean?

>> +
>> +	/* Wait up to one second for other CPUs to stop */
>> +	timeout = USEC_PER_SEC;
>> +	while (num_online_cpus() > 1 && timeout--)
>> +		udelay(1);
>> +
>> +	if (num_online_cpus() > 1)
>> +		pr_warn("SMP: failed to stop secondary CPUs\n");
>
> May be print the remaining online cpus so that we know which one failed ?

I have copied that from arm.  The only user of smp_send_stop is panic,
which can cope with that, and the probability of that happening is very
low anyway.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
