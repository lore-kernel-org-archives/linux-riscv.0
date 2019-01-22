Return-Path: <SRS0=K4JQ=P6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CE9C282C3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 22 Jan 2019 20:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB4120866
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 22 Jan 2019 20:31:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dBdUF4jV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JRwNOwlj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB4120866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=MhSuYFpttAEBJuGS60KistaSqaDDTzBZRZyCdxDlRDY=; b=dBdUF4jVWx53EzGe/P0Y9wM6D
	g8MMDouaHQsTeJRYQNAAngnghnBbr0h57baCHK4TSHtz94KvgSS3Q4z6KhmlMuimPxe9AKpSFjCZE
	mWLO+5mnLRjpSbUT0nF6Ys6uogi0ggzm3W7jcs+ubuTTefVLV642UVGBbVKrlmlMdI52d+Ie75FMi
	FUl+Q+eKel9APqOV/tClmZAC+NIr4zIK9UnIbKYhqjmF7dDfBT7SLi5kkYG2EjD/gFP/umeeWt0CT
	ouZTSotAtexBbO4uTH9WjziojJDFF1SNVobxisjKGlWM6zrAXKJQn26R69X5JAC0RSzePF0BflIKg
	6a0LSKsWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gm2hd-00083O-Jr; Tue, 22 Jan 2019 20:31:21 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gm2ha-000833-MS
 for linux-riscv@lists.infradead.org; Tue, 22 Jan 2019 20:31:20 +0000
Received: by mail-pl1-x643.google.com with SMTP id a14so12011165plm.12
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jan 2019 12:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9QAF88WgOnIWjrLBPZTV6nTfMv8OT4dWq0H/y7s6yBw=;
 b=JRwNOwljqT1QdnX/iAhhYkw56vcRe3ri0k0ryvm2dfarImsqRskVYl6CuBTHAMkNOT
 iLYElHPB1MkARehHsh8dXQ8EIfDFB4csDPRUQT7Q2olZ//pZjtwuvF5dXHRmR2Skp2J1
 /K18TpWvRD8lpuwmtEp6SxvDYuvJ8tP1Lij7AlzHssrFON4K499oNOpXhWXcRcGeIQEx
 L0WMg0fsSCPweqN5e9olgNx96MuJlcNeiWZ5RlTWVVDUPU2uzURD8O/Hg32Fqth7KuBk
 Z4VoW7UCFLK4TisIYxnmpMYk+tjp9Vw2FkB7az+MDBGldtGRMYd2GyHHc9wO2EC4L8Bq
 F43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9QAF88WgOnIWjrLBPZTV6nTfMv8OT4dWq0H/y7s6yBw=;
 b=WF5sAJQTLAzXh8qnP46nYzTQ2RUUEgkMa/yeenhdLSs58gH6ESqxKlwfxn51jJHbsn
 /HrRICXWMVDWTKFaEo4Wn7PsyhR76Q75Q9/qnM5wJW/EVo5f5mrd2UHokCvD4xvGDEI/
 2/ooXTG3RdGWI6o+1sfmJUzE88zI2gxpryTYSYEUHKZAJGP7xQvUmK5Nrb1in/y1u/Rm
 pD7bIwCENfChc1nH/eOmIqToDWkLdNzrb4CB5l0XNn3s84cHuPzw9JlKTK1U/iiitAg2
 Lh0LGeqnUBhNFg9ZwbuVy59Ug4tHgiK+R75R0JscXBvdB1sbXAK7ep+0I8dk8/WVQYSp
 i5tA==
X-Gm-Message-State: AJcUukcd86mdQCLjvQuTTuKgOZE9UKZ953RN8Q2wIZLELVQJsnMQSKic
 LDH8g898mCigoh4P3Ux4+ei1aOtYsI0=
X-Google-Smtp-Source: ALg8bN68W5WSkBf6Ke+iEwy6bXb7eLpQp/B0JUWgg4QLLXRxXW3ecNDqSkVvNDFojn3TYYnmrgn/mw==
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr34298445plp.69.1548189077566; 
 Tue, 22 Jan 2019 12:31:17 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f67sm25383292pff.29.2019.01.22.12.31.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Jan 2019 12:31:16 -0800 (PST)
Date: Tue, 22 Jan 2019 12:31:16 -0800 (PST)
X-Google-Original-Date: Tue, 22 Jan 2019 12:27:14 PST (-0800)
Subject: Re: BUG: FP registers leak across execve
In-Reply-To: <20190104013932.ksexuhjssygj4jml@aurel32.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: aurelien@aurel32.net
Message-ID: <mhng-ee7d6384-45ad-440b-aa59-aaf56d8dfb12@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_123118_801654_33340A05 
X-CRM114-Status: GOOD (  16.93  )
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
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 03 Jan 2019 17:39:32 PST (-0800), aurelien@aurel32.net wrote:
> On 2019-01-03 15:36, Palmer Dabbelt wrote:
>> On Mon, 10 Dec 2018 14:13:28 PST (-0800), aurelien@aurel32.net wrote:
>> > Hi all,
>> >
>> > Debugging some glibc testsuite math failures, I have found out that most
>> > of the time, the FP status register and the FP registers are not zeroed
>> > as they should. This can be tested with the attached code. The best way
>> > to reproduce it is to execute from Python (i guess Perl or another
>> > interpreted language that support FP computation should work). When
>> > running an FP computation before calling the program, the result of the
>> > computation can be seen in f10.
>> >
>> > The zeroing of the FP status happens in kernel/process.c in the
>> > flush_thread function. It seems that the kernel restore that state only
>> > if a context switch happens between flush_thread and the first FP
>> > instruction of the executed program.
>> >
>> > A possible workaround is to restore of the FP registers in flush_thread,
>> > but that's probably not the best way to do that:
>> >
>> >
>> > --- a/arch/riscv/kernel/process.c
>> > +++ b/arch/riscv/kernel/process.c
>> > @@ -93,6 +93,7 @@ void flush_thread(void)
>> >          *      fflags: accrued exceptions cleared
>> >          */
>> >         memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
>> > +       fstate_restore(current, task_pt_regs(current));
>> >  #endif
>> >  }
>>
>> Are you running this in QEMU?  IIRC there was a bug here and we might not
>> have the right fix upstream yet.
>
> I can reproduce the issue in a QEMU 3.1 VM running a 4.20 kernel, but
> also on an HFU board running the original kernel.

OK, so at least it's not a QEMU bug.

I think this is the right place to put it, but we should also add

    regs->sstatus &= ~SR_FS_INITIAL;
    regs->sstatus |= SR_FS_INITIAL;

so the FPU's status register corresponds to the contents of the FPU.  I'm not 
sure if this is strictly necessary, but it'll certainly help FP save/restore 
performance.  I'm trying to construct a scenario where not setting setting 
SR.FS=initial actually manifests in incorrect behavior and can't think of one, 
but it does feel incorrect.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
