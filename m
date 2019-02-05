Return-Path: <SRS0=rZMy=QM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080CBC282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 18:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F8E217D6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 18:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hPBUpw0s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Bt0z/3q4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F8E217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=2y7M4RkW2sEVu7bTajKlHZLeFymzSpF9NpFfFi3t6AM=; b=hPBUpw0sa9ZvOu5IC5Hpbeq3W
	YhHm9Rj4IywmvHKH0SkXgEXmKeQ+Ak/kii9NcJU2B273vwXPCfqhdcv9lIIOyehISbDrgtzgAYAdA
	QawfTN+mbpyJ8F73xpQL1Jr7pe4TBS5itBaL7qGF6mFbiN8o4EfcNy/IIqRGR4WVl44LlCmBusSy6
	EPlj9aku8rYROoeleXwQQzoaTn8tr62rj2nfexTBUIUfkt0LSOGXEu/a1XVmZhXwvaxRk8BnY782d
	Umd8/vOhZOJ9ssaQAK6/p/f+p4mUUcXcv/mmesxCILjfJydEGBodPDaB/UD4vPCnfYQQsMeqVjYq3
	fQiblqqOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr5l5-0001kW-6G; Tue, 05 Feb 2019 18:47:47 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr5l2-0001jz-Co
 for linux-riscv@lists.infradead.org; Tue, 05 Feb 2019 18:47:45 +0000
Received: by mail-pl1-x641.google.com with SMTP id p8so1889097plo.2
 for <linux-riscv@lists.infradead.org>; Tue, 05 Feb 2019 10:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6MeX6AJgZnQWZ8bG+0mJFvlGjpOZ2OJ43X7VH/qkj0o=;
 b=Bt0z/3q4ehmyARt4X4V6yrFMiA8JUM4OsOjs7OwAIQB8gzhzxynL3IVK7IZ8kV86WW
 Bd+TLEaeHjiIq+BnpXlgRZ139EP2uqWuAEdiPkIPqpe5TBao4mRGV+APM0nHTQO0O7xl
 7E1QIHREdQS+u1IQoZkuSZQqnthYzWpo+JBFDPgdd2qtLyVxbh8KQEP1wnAoNAXX6jAu
 xHq3Mf7KwzPeIXat49uh+ZJTzl9dfzNs9hF5kW4EUGaE+5HnNTmJDU69Zm6tu+miTgup
 k36V8KQD/VSvCaABamGWQAqXSMVZMT4SEnFCWoUnrdpjjAXoevX5BWML8aKLyxE4GJPQ
 4hHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6MeX6AJgZnQWZ8bG+0mJFvlGjpOZ2OJ43X7VH/qkj0o=;
 b=JvDjYg6U2F4JxMdauDKiWKZ1Sho3v3KFmuv+U9xv0tU4gAcRCRbqYTMTvkLFK8nz6V
 Aw4GMvQ2tN6mK4L3H3BHwkb7JboRj0Qk09SbkW6Zm3FRdOV+4KvsLpBXFxmK02YtftRd
 CJTNdmPkd9qalLmns1ebzZ3muGNHFpfrWb6jR/9bMaTv2jVtQtlJk/il8SOhFBKcKelB
 ZqftD0xtgoHmPX8MTwMVLYsriee1olEeNhxsl8eWolEA7fP/2NnJBo5iwxdJ2GFgOCfV
 +8TWo/oCBZdVDf5TKS8WQwyyyJA44LDoEAZXlh8LT+kGaXKf4mxnNEfEgpSQjuXBAUbs
 rLTw==
X-Gm-Message-State: AHQUAuadpL/1KaaJfcsBOmBE+CXMTkWBgQ1urp0+DV1ZO1/eO9YYPm8b
 HBVOO4CEE14SEfWmhTF4Zri4npCm9CRZYg==
X-Google-Smtp-Source: AHgI3IafzyG9lY9CBjlULAUjkS9JClq6ch0aWDREP2rMvKD1RVd08EDKU5Z/Usda6V92dwQ/bZnREw==
X-Received: by 2002:a17:902:6b87:: with SMTP id
 p7mr6607259plk.282.1549392462894; 
 Tue, 05 Feb 2019 10:47:42 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m20sm4676694pgv.93.2019.02.05.10.47.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Feb 2019 10:47:42 -0800 (PST)
Date: Tue, 05 Feb 2019 10:47:42 -0800 (PST)
X-Google-Original-Date: Tue, 05 Feb 2019 10:22:10 PST (-0800)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.0-rc5
In-Reply-To: <CAHk-=wgY_pN59-b9Whk47CaA21ktGEfYAfJL192g6i6SWxdoYA@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-d00a6741-5cca-4428-a44a-f072b04b47a2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_104744_496104_9130F07B 
X-CRM114-Status: GOOD (  11.77  )
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

On Sat, 02 Feb 2019 10:48:56 PST (-0800), Linus Torvalds wrote:
> On Sat, Feb 2, 2019 at 1:43 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> RISC-V Fixes for 5.0-rc5
>
> Just a note: your pull requests don't get the automated pr-tracker-bot
> emails about having been pulled, because you only cc the linux-riscv
> mailing list.
>
> If you want notification when I've pulled and pushed out, you should
> consider just cc'ing lkml too, and then the automation will pick up
> your pull requests, and do the "it has been merged" email thing when
> it notices.

Thanks, I'll do that.  In fact, I think I remember to do it about half the time 
as I've seen these messages in the past.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
