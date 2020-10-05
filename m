Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F34C4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 15:50:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A771820639
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 15:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWufBZto";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="jiMa85QU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A771820639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=/mQNFx5yk8HlXjgJK1AHGIYd/QpJghfHxhAqtQhA7OA=; b=PWufBZtowzMnJT0gKcEhS56oa
	bISmKfk80iZcUaxV1kKvVcWT+b9npSGQyL1jeiKCoWqgkvUHDrWUc1SyqWBUupPc3GKkMVQneVvGL
	z9GmHtABWxefYEALTyHxXQQd9mkPQUzLSrINajjw2v0K6z2nUgLp6lfmugnGZSDQaj+/4zDParqvv
	PSqt99VG7yVx6QXu/YEHsSHQptkMq2xw45U0NANg+Skx74c7HiMRlqQHQphvAdkJjuLMarSeF+B6O
	iMVRtv/maE/G6wmoO8XG2YiBv627hHEdXCQN0a8Wv0ik9ysjk+sqwyGKI5XExgee3Vj4TxPtGSUj1
	UyL6Or6Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPSks-0003BR-IR; Mon, 05 Oct 2020 15:50:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSkq-0003A8-8x
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 15:50:25 +0000
Received: by mail-pj1-x1029.google.com with SMTP id t7so2942pjd.3
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 08:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=QdwCfEAqR963uJIdGXq3EhZ3rN4/0H5cNJx6SpjwftU=;
 b=jiMa85QUHzkCjUIfp6utJy2vvdtMAf3NUrHuPwPRYducW8kCt4rg+AiNPQEdLZd0Nz
 0HSGPS1iP/p4mvGWhBKlMxjCv5/yPtIIF/E6zLVeQqsgI8PWgxbkWSCled1QcOea/hx4
 BFcKR7ibXnEZVtPvJ3RbfRMicUn7DxHRilgC+7Wk0kw3RiEmU8aUJN/8hg7riIFCeq8Z
 eEVG06lfIpEqTcdj+5YiH7GnNXkz01DV09Gs4gEIu2yCUIKR5TuHSLSLi61tkf7E4Ama
 XgH9HCHZgbg8o65eBYpD7pWhMw3bNdIgnsVipE2qyhQm2Z5GrgjQkRTaGR8zWDo9EiXO
 XOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=QdwCfEAqR963uJIdGXq3EhZ3rN4/0H5cNJx6SpjwftU=;
 b=FKYrnaTyC0asrHrdnkrg6xqgJVojv7jMlRaVJXql7olYpjZoACMn0sl8MLabYgBixU
 PKi2oVlsyAszxCC4viG6XPKvPGIFax9yQ7rXUCqw5pSQm8m7RctIz6Azw82q7+roF9Ps
 fb1+YZixTeQsvl9EgQBrzbISiLnJwmSnzr+fPsj48t8nWV8230NoqLnZwj1nu1tHDtag
 2Q2TFlTkaejRzfwgybYcDw7aXqxqiSrQUZYLKPKpPvfIZe1R5K7HCPwnEkg+kP8pdtgO
 +0G7/ES4PEg7ogGY5p7D+ljo6qjL9zUq1JQvmGlzf63AKGgCQS5/pJSsi7T7XVElGq1W
 i6Jg==
X-Gm-Message-State: AOAM5318hlIV37+WlY4+kjcUlJTarGtOEzSnsNoqnCfYa40oSm5lpjuv
 ckhrdRtoy+eVlVZi0osRE4VlxA==
X-Google-Smtp-Source: ABdhPJziyWUsU/P0WBOVsS8oI+XCQF+q1Wx6sa8YPdI90RdzXPzMdv3StOgiNsCH5FKQTVJP3Wuy1w==
X-Received: by 2002:a17:90a:2ecb:: with SMTP id
 h11mr435465pjs.195.1601913019937; 
 Mon, 05 Oct 2020 08:50:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z6sm371042pfg.12.2020.10.05.08.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 08:50:19 -0700 (PDT)
Date: Mon, 05 Oct 2020 08:50:19 -0700 (PDT)
X-Google-Original-Date: Mon, 05 Oct 2020 08:50:17 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9
In-Reply-To: <20201005071632.GA14204@infradead.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-a46c3a63-8060-462a-a564-719c5d95df2c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_115024_352405_57A342C0 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 05 Oct 2020 00:16:32 PDT (-0700), Christoph Hellwig wrote:
> On Fri, Oct 02, 2020 at 09:07:27AM -0700, Palmer Dabbelt wrote:
>> * The addition of a symbol export for clint_time_val, which has been inlined
>>   into some timex functions and can be used by drivers.
>
> Err, haven't we just agreed on that this is a bad idea and jitterentropy
> should not call get_cycles()?

Sorry, I hadn't seen that when I'd posted the PR.  It looks like there's a
jitterentropy fix in the works, I'll drop the export when that lands.  Probably
best to talk on that thread, though, as there's more context over there.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
