Return-Path: <SRS0=4NHM=NW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190F0C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 22:14:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D540920872
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 22:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m6zTqZ66";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FnNozWaM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D540920872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=7+sRnyv+HHwN4dzp0ptXdtSdeiIFf1lJNbKz84vnrVk=; b=m6zTqZ66B25TcelbpLgr1Duk/
	0tmJ69Pvb0sF3IXjBF5nie/EIj4UCHUChe4KOAjo+q7XfUHeH12sX4BesF3Ctymw9rY4qQ4aFvcw2
	OfWH6sZ80RfmIGABVSGwlqbkiV5ZFHb/9MJoKAIQ4aEZWhjrRUmu+XikveJ4Fmh+RL9ui/ND5SVlB
	1DU8IDY+5NInLw4JN7hwPU/0HT1ksS6RfFx5Bt5VwcRzSD8LA1km0FXw9eIpy7vg35t+9m0mC1i+X
	TnYORujtpJGKnOC1wcj8UGIPvR7Kbivd5q+2EFp86rmwiaMndYXYQwEYXxRHLdoGBFBykOcJXZwOx
	NIXiFHo8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLxzx-0008FB-Mf; Sun, 11 Nov 2018 22:14:29 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLxzu-0008Eo-RC
 for linux-riscv@lists.infradead.org; Sun, 11 Nov 2018 22:14:28 +0000
Received: by mail-pl1-x643.google.com with SMTP id r3-v6so2591780pls.12
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 14:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LqvdH7aWIUli3FTLPBfFtEufjMreDC9Q1EDWd0tjc9k=;
 b=FnNozWaMAPUNqnC649UESqVM97kb6TGA8VwmGxdYAVVd8jtOO7cnHF8gCdx8BEsVu+
 c40PYw4mWkkVjGVZ8CRM32kSL4l3cCKDxXAlieFe2kEJ4Pn7Rt4vJUvRA1/IUlmEPyHb
 iIUMhLx6c/QRflDMgzzcUk8vJ1HwQgZ/+try5WcTqYgg9Ud4ldyTPlTMmomAJAPrcoFr
 nAMNpqgu5i5kJ1qrK9LR6dm31C9qZDuzTxReHhyKpogLYDcPWlLvwf7YgiE6Q2MHrqVr
 KDowszebGWUBzeXxugTqwmW460d+TZBKEhoyXr34ivmuoZ8JNbAR36+8C+S0oNgpclRI
 B28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LqvdH7aWIUli3FTLPBfFtEufjMreDC9Q1EDWd0tjc9k=;
 b=suci2ZxJ4LNKrY/NW15/mNB/ePC7shzQRUiGX4Ve2rlTlR10cKagtPg2VWoJmkDgab
 VSNw9efTdz693Kt6Wdz1HYv0wSht8kRSI0/SXmLl/2mmxya1anUipyuK9xkTJRmuKJLa
 qkA6OTFSYpZmuISuEFZygRPGQe2iqxHIwigxmU5I29EwFpG2yjJYdkwgi/AipxPN9K8B
 e26cYgCy44BliNjcp3dEzhv3GJH/aO1Yp7yiMtD75bg1oOgsPtFBmnOgg59ZGo7cw6kS
 xkTAWOB5FfZ1V7d7miFSWehXiqopF7XfYDl5QkH2mAbkyC7iRNkvsIyJ6Nz5AFf3bCqL
 1WBg==
X-Gm-Message-State: AGRZ1gLr5NDAmI5sDLK0XJf610lfYoiwM6+gzVyajZYzar5B/JT+RUH5
 dqQ6HGmSVhSqhpv+xvA3GCmHcA==
X-Google-Smtp-Source: AJdET5fS+f9PM+FljWJYtLfv0u2pZwTRzSKKWVmjECkBk2gXVxJ/noRYzjG/j1F048c+3skehr7AhQ==
X-Received: by 2002:a17:902:6b87:: with SMTP id
 p7-v6mr17879403plk.282.1541974453584; 
 Sun, 11 Nov 2018 14:14:13 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g8-v6sm15138725pfh.57.2018.11.11.14.14.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Nov 2018 14:14:12 -0800 (PST)
Date: Sun, 11 Nov 2018 14:14:12 -0800 (PST)
X-Google-Original-Date: Sun, 11 Nov 2018 14:13:43 PST (-0800)
Subject: Re: [PATCH] riscv: add S and U modes to ISA string
In-Reply-To: <7958aa50-8808-e909-753c-e232b3d1f84e@packi.ch>
From: Palmer Dabbelt <palmer@sifive.com>
To: me@packi.ch
Message-ID: <mhng-58f419dd-47a6-4540-91b6-08be173d4216@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_141426_919219_70C5301A 
X-CRM114-Status: GOOD (  14.87  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, david.abdurachmanov@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181111221412.HnNTqDJm4lLViqTC1BhLKzgPSRpSpna8J4TMct8CxOc@z>

On Sat, 10 Nov 2018 00:35:15 PST (-0800), me@packi.ch wrote:
> On 10.11.18 07:45, David Abdurachmanov wrote:
>>
>> The patch adds the missing S and U modes.
>
> This is the same patch I submitted earlier (see v2 here [1], based on
> Palmer's feedback). Palmer stated that the "S" extension should not be
> exposed to usermode.
>
> Since two people arrived at the same solution, I wonder if the
> supervisor mode should really be hidden from userspace, as it's about
> the CPU information, not about the environment the calling code is
> running as.
>
> [1] https://lkml.org/lkml/2018/11/10/96

I still think S should be hidden from applications.  This patch was fairly 
mechanical, so it probably just wasn't though about twice -- that's the problem 
with user ABI stuff, lots of times the obvious answer isn't the correct one :).

I'll take your second patch, I just haven't gotten around to actually fully 
reviewing patches yet as I'm still in my email triage phase.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
