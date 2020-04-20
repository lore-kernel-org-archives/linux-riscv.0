Return-Path: <SRS0=WK8G=6E=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8696C3815B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2020 20:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7CB72078C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2020 20:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SsjhV1jd";
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="fSK7kA0I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7CB72078C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=19yBrIFZIMYk4X7aPMURCOJoSsm3/dEUBgsQ9QOmuag=; b=SsjhV1jd2cpAms
	3Qb4uoJcSpU/dlc/xI110B4bOGc9UDE1tIdbwh231eTB/V+mkpbyzyr2KUcetR6bxxxVt7g28K5wu
	Z6yDtrsfVyP24pOzc0061kZfQ/XgvBKjmHkDFRZW/THFJKWVrSlSt0dPAezwfeh+6pPrOqE06WN8k
	yo1bmOXUysXx1tGbsz/3D+n9DPyq0GhleSXjqVwQ+++EecIdVLU+/eAEuGQmwISalTRli4HyxjVWb
	hJfWQcsgMK2cC6bMgSasrbji/bWGQlEo1gWNh7oTIlhb4A/i/cU9TH4pmHXcTD6IituITLt7VBXBw
	Zs2OA3UMvN6lClRRHJ/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQd2L-0002XO-4y; Mon, 20 Apr 2020 20:29:01 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQd2J-0002Ws-6w
 for linux-riscv@lists.infradead.org; Mon, 20 Apr 2020 20:29:00 +0000
Received: by mail-pf1-x443.google.com with SMTP id 18so1863287pfx.6
 for <linux-riscv@lists.infradead.org>; Mon, 20 Apr 2020 13:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=19yBrIFZIMYk4X7aPMURCOJoSsm3/dEUBgsQ9QOmuag=;
 b=fSK7kA0IuqZJSDAEsTaPmmmjt7YabcTJW+/8AzWMnKEC+1RdoQOvZ8LL6Q02/SkqNL
 WmbouVMstrkZ2pPcSN2U192ehaLELdtc/GzqDgSna/CUTqi96h1noxer+R2FFcY9TBxq
 0bKeUsLBRKW+OvWmbnSueydlfHKEOtWZYq205kEDhNnp6v530/FpNGzFvvkvYgLkehL9
 xD/e+H4XTrTQnDYtYh+kSQ9NcofqEvUA50jV20tDDxuokV2F9gEUhNr7s9EKHXreDCzW
 GI3MxAy/aCCWSzc6wWLI/wY1K2TsYXBXQt6UTPAoVbW4MK7BR31sTU7ba27WUIPLXiC8
 AUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=19yBrIFZIMYk4X7aPMURCOJoSsm3/dEUBgsQ9QOmuag=;
 b=p+zUwNm7Cd4Fo0s7mELqp/RjlCs4DwfBymgoK1Ahc5H8noqJjPEkx3U5IlQyRWk4P9
 m0j7r8W7Zc2u7/JYeztWAPCkD+MW1kfhZw+aTJmqIUywTfxY9rozgEAyy8soCfKIa+A8
 TUjGv0mdGVAvgT3g1NsSpnYQwC6MedkSz1FVX5As50OF5KpXWbrWxqZVQ0Ph28VCktj/
 ou01WH5j8wd6aIacAYU3ro74o0HBItQ3kpVMf6x++/XTCY1tWTL6R0yRoxVT+vPKGrmT
 UhmrqV7n0SSBcBz0WSAsRCexVfrXWJeMHWwI2poPBAQ1R5iHebe8zC55v5IWZRql4WQ6
 qTyA==
X-Gm-Message-State: AGi0PubpFX/HNR5L1WLt4wHyRzb60uZLWXPqfThVmAb50q2IGq+SYFKN
 KQTCH5JRQfa9DDpxm4l0LzOw8EVY6KpbPw==
X-Google-Smtp-Source: APiQypIELEWCa75xt1r00oB3VWvo7ltB+KZGmCzl3ojCNfISY+bvyqvtCD6lSTcZSUSSMhmHnOuePw==
X-Received: by 2002:a63:d24f:: with SMTP id t15mr1540214pgi.214.1587414538072; 
 Mon, 20 Apr 2020 13:28:58 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c125sm341770pfa.142.2020.04.20.13.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 13:28:57 -0700 (PDT)
Date: Mon, 20 Apr 2020 13:28:57 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Apr 2020 13:28:55 PDT (-0700)
Subject: Re: More K210 Support
In-Reply-To: <BY5PR04MB6900E87C1FBBC6B50006627FE7DD0@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-95d9ee53-d6a2-4cc9-923c-f21f92eb16a6@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_132859_277434_6838CF68 
X-CRM114-Status: GOOD (  13.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, kernel-team@android.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 12 Apr 2020 18:45:33 PDT (-0700), Damien Le Moal wrote:
>> On 2020/04/09 1:58, Palmer Dabbelt wrote:
>> * Builds a table of device trees, keyed by mvendorid/marchid/mimpid.  This
>>   allows multiple device trees to be built into the kernel.  I don't really
>>   like maintaining the two lists (one in C and one in assembly) or having that
>>   function in the table, but it's the best I could come up with.
>> * "handles" PMP traps by just skipping the PMP setup phase.
>> 
>> I don't actually have a K210 so I can't test any of this.  I also couldn't find
>> the K210 identifiers listed anywhere online, so someone will have to dig them
>> out of the board.
>> 
>> I also didn't spend any time thinking through how we free these device trees,
>> but given that .dtb.init.rodata already exists as a section I'm just guessing
>> that's were we're supposed to put them.
>
> I cannot test anything yet. Something funky is going on with boot objcopy/Image
> size: I end up with an Image file (and loader/loader.bin) that are 8.5MB instead
> of the 1.4MB I had before pulling in Linus tree. rc1 as of this morning still
> shows the same problem. vmlinux is 1.8MB vs 1.9 MB before.
>
> To check if my toolchain is broken, I recompiled the 5.6 tree I used for
> developing the series and I end up with a loader.bin file of 1.4 MB. All looking
> good. But there are changes to the vmlinux elf section headers which likely
> cause the huge final size I am seeing. Will try to dig into this.

Thanks!

