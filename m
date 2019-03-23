Return-Path: <SRS0=pIoZ=R2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF65BC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 18:05:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5995E21473
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2019 18:05:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4pEJ7kC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5995E21473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2WI6Bgrk4doGRkOC5MWYuZd3rIUMQDjCdSS1Izm3YuY=; b=l4pEJ7kCxGM79SZW9xObWzFlCm
	0sxhLLUs1fX900ekapNcPbNmhDpkbdoALuOR7+3JJLtb4cmz9+xRzT63LhD0Exk561YwECDMbHJyA
	YcEbli4jZIZB5mpPkHZXrMBLh9xYaiqtRhck5gxuTxodslInhM8BsQ1LrAgiMDz24hUUoIho85yr7
	h/AMaA43ajKg7nJgrNMk7cj+zb5mbLOCbAnPA3ytYrW5+17XXNcRao02myWEdqRqLTAts7VI1N+Ic
	HxEYTqLKCm4RzddPo3iMskumOwtD6mek25xnFYlGUlh/IZ1EPQNC0gIb1RUq4rXCHY7zNVfiiCa2i
	/gxbAdBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7l1O-000886-1F; Sat, 23 Mar 2019 18:05:30 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7l1L-00087h-9B
 for linux-riscv@lists.infradead.org; Sat, 23 Mar 2019 18:05:29 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x2NI59Km017825; Sat, 23 Mar 2019 18:05:11 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-36-5c9675540b4a
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 36.89.09052.455769C5; Sat, 23 Mar 2019 20:05:09 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x2NI58cF032155; Sat, 23 Mar 2019 20:05:08 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 23 Mar 2019 20:05:08 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
Subject: Thoughts on kexec / SBI
Organization: FORTH
Message-ID: <032c5254b0fa91f401fc67169b8d9141@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsXSHc2orBtaOi3G4McyFosnHyayWSxa8Z3F
 YtvnFjaLzRMWsDqweGxeUu9xqfk6u0f7gW6mAOYoLpuU1JzMstQifbsErowzr96zFZwRqzjZ
 fYKxgfG7YBcjJ4eEgInE6iW3WbsYuTiEBI4wSkzasIcdwjnEKHHi7TkmiCpTidl7OxlBbF4B
 QYmTM5+wdDFycDALWEu07zEACTMLyEtsfzuHGcRmEVCVaHlzjwXEZhPQlJh/6SBYuYiAssT8
 e64Q5XYSCybcYQOxhQUUJHZ2LAZr5RcQlvh09yIrxCYXiavzj7FAXKAi8eH3A3YQWxRozIsT
 01knMArMQnLQLISDZiE5aAEj8ypGgcQyY73M5GK9tPyikgy99KJNjOAgneu7g/HcAvtDjAIc
 jEo8vCtm9McIsSaWFVfmAn3PwawkwmvvCRTiTUmsrEotyo8vKs1JLT7EKM3BoiTOe/hFeJCQ
 QHpiSWp2ampBahFMlomDU6qBca79LSfF9QKyBQ36XIdUzPhdphz6trY87nDz+kXF6xz51c5Z
 OFhzp6Q5nFgfqVj288D+gvREjW1Ws89O1FQON434lscmEmWzI/TH8iDnHeFL3yd9f2lakMcm
 OWf596lHbU//1Oq6ur+dneG87RHTaTrN11mbLtw2fqTjwHA2WKgv7XbyLXEZJZbijERDLeai
 4kQAujyDEU4CAAA=
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Sat, 23 Mar 2019 18:05:11 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Sat, 23 Mar 2019 18:05:11 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_110527_692157_BB8B3FED 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: atish.patra@wdc.com, Anup.Patel@wdc.com, palmer@sifive.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello all,

I'm working on implementing kexec on RISC-V (just kexec for now, not 
kdump yet) since we want to be able to test new kernel images easily on 
our testbeds. It's part of a larger project where I'm trying to have a 
unified way of testing various linux-capable RISC-V targets 
(https://github.com/mickflemm/yarvt) that we have on the lab.

The issue is that we don't have a way of stopping the secondary harts in 
a recoverable way, so at this point I have two options, either I'm going 
to call smp_send_stop() on machine_shutdown() and come back from kexec 
with a single hart running (which should be fine for kdump btw), or I 
need to have a reserved memory space where I'll have to keep some code 
to be executed by the secondary harts, that will be patched by the boot 
hart once the new kernel is in place, to let them execute the new 
kernel. The second option is too complicated for no reason and it also 
reduces the flexibility of the process since we can't use the whole RAM 
for the loaded kimage, plus it will be obsolete when we have proper 
handling of CPU suspend / per-hart reset, through SBI. So I'm going for 
the first option until then.

I'd like to jump-start the discussion on how we can handle things 
through SBI, my initial through was this:

a) Have a new IPI code IPI_SUSPEND, handled by the firmware (its 
code/data is persistent across kexecs), that puts the hart on a wfi 
loop, checking for a variable that contains the new virtual address to 
jump to (where the new kernel is located) on this hart's scratch buffer. 
Alternatively this call may do power management and completely shut down 
the CPU, if the hardware supports this.

b) Have another IPI code IPI_RESUME, that wakes up the harts by 
providing them with the virtual address to jump to. This can be a simple 
write of the new address on the remote hart's scratch buffer + 
interrupt, or it can use power management to power up the hart and 
either provide it with a new reset vector, or do some handling on the 
BootROM code for that (this btw is also an open discussion on the TEE 
group where we are discussing Secure Boot). Also in case the hart is 
already running (an IPI_SUSPEND hasn't been sent on it before, e.g. 
during boot), the firmware will ignore the event, alternatively we may 
call IPI_SUSPEND on the firmware during boot so that the boot process 
happens with a single hart and other harts wait for the OS to wake them 
up.

c) During machine_shutdown / machine_crash_shutdown, we issue 
IPI_SUSPEND on all other harts, and on setup_smp() we issue an 
IPI_RESUME to wake them up just in case.

This way we'll also be able to announce ARCH_SUSPEND_POSSIBLE and 
implement CPU hot-plugging (for PM_SLEEP_SMP) even on platforms that 
don't support power management on hardware.

What do you think ?

Regards,
Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
