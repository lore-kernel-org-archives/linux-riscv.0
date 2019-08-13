Return-Path: <SRS0=0jWI=WJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A04C32750
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 21:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756EF20665
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2019 21:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aGkYzsg2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lq1nBADk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756EF20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJsSyXQu0iNDnP0MkChz4ANqKJSiDYpNY1yDzdgAip8=; b=aGkYzsg2tZDrYi
	gWjBXfiD972kr3m7HsXRKqR5BQ2uNBACOyVwrt0bvj0UB6F9b8bIXX4JxWB1E1t57wpTeVjjsPKC/
	lzJrmnOedAJBuESIV5bP3LhDAVs2g6UI3kREL9F9d5+uotV24ytVdxAPN1s99NUKu4Ko0d/7QMysX
	vzmXbsN3PncoFwc58/ouZhx/pwC4UWAcr0mhbwX8oRMM9IlNwgfBHAKpfRFTzg8FSkeXNLDcO3IkV
	KN5+IOGFmkshuUcMa9FL6QzVNVx8p1yLBrX9OjDIMq5fnbO2zp8gWEwYYwHWKhWfyFTCJ3tamu2qS
	BepWifeSpeo3Z4YeK2zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxeFl-0005VL-KE; Tue, 13 Aug 2019 21:22:49 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxeFi-0005UF-Gr
 for linux-riscv@lists.infradead.org; Tue, 13 Aug 2019 21:22:48 +0000
Received: by mail-ot1-x343.google.com with SMTP id k18so45366404otr.3
 for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2019 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=HCEURFnu1F6VcmzkSBvu3b17UuLbHzkG6upPe1wKPpI=;
 b=lq1nBADk4Zsi0vD3oVAVAHMR9RcNN7R2j6i9NfQJESTvAbJ7j72bCysYFgb+ZuULI4
 /t3XOL/nWw7iyiTusBsiu3Uz9dwe5VjwU4vTVGQYle5MaPDwrwvJrOx+z8Qv5svqEk+3
 DJSFbZymFrUSy1OEVnxVgfmI7OfKN4pxMbpCdQytWdbIHU/ep6jvExi2iNz9JLSw/2uH
 NcAL7dxyT9PXKr00ZI8hhtCERS7sy0E1OldVJffiePbS16v/knoMepJbhqCmxoxIqDzA
 eyNye2rT9qHQs0rY6i6PW0i2JbwaZbJGy7gYZw8EJZKKcTU7yrDLhFV5cZPx67TLOYMx
 0rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=HCEURFnu1F6VcmzkSBvu3b17UuLbHzkG6upPe1wKPpI=;
 b=NOoImFr8H5yHcWkcva3BEc57ta6ZxCJHJUs4SAkoSAwkr+8H0V9stlk7xMtRfDtGkj
 J7LEuguv75bPd0DlYOM47a+dLqVrPT5BWRWBq8YdWm0VVIdRHMCpPA5uGZ8M7b9w3El5
 LgNYYoOuYJhsYmP6EBpMp2maTwLIbpMzdFRkPhkxOX2a+6yMpmz7261/7G+R6294pCQb
 jQ7yqGgtG4ZBu5SjOP0FmpbWrZwITXgCKkxdDxqJ6MMyPMYYhilx4Aa9Nwbe4rdbjArs
 8WRcJLQsHu/nYrkRnrWEA1dce0/CiM7g6ryzaJOf4NrBqMjUgCDEynMvTUjCZwgZI1Ed
 ZXKw==
X-Gm-Message-State: APjAAAWg7nky+E5HAJJuioVUpSSItOX3Y5bV6V+Pdfdl143N8EXxvMDs
 Z/diwbe0cz5lIuZTKAJ0nISX7o1fULQ=
X-Google-Smtp-Source: APXvYqxYmd0KYMaxU3ncGiQd8V+hBRE+Mr3WojAB+zrYvIQz6aRwQk6a7C6kdPihnQYIbUZkUIeppA==
X-Received: by 2002:a6b:fd13:: with SMTP id c19mr17401753ioi.168.1565731365859; 
 Tue, 13 Aug 2019 14:22:45 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 x1sm16091606ioa.85.2019.08.13.14.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 14:22:45 -0700 (PDT)
Date: Tue, 13 Aug 2019 14:22:44 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Carlos Eduardo de Paula <me@carlosedp.com>
Subject: Re: Changing SiFive Unleashed core clock rate on 5.x kernel
In-Reply-To: <CADnnUqcp_7yN4WK2uXberCV_uwjPSj0PxpiXg6kp71--QGPJaA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1908131417450.29979@viisi.sifive.com>
References: <CADnnUqcp_7yN4WK2uXberCV_uwjPSj0PxpiXg6kp71--QGPJaA@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_142246_562751_2CF9B0CA 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 12 Aug 2019, Carlos Eduardo de Paula wrote:

> Back in 4.x kernel, we could set the board clock rate by echoing like:
> 
> echo 1450000000 > /sys/devices/platform/soc/10000000.prci/rate
> 
> Now with Kernel 5.x and with the board DTB, what's the correct way to
> set this clock rate? I tried changing RTCCLK_FREQ from 1000000 to
> 1450000 but I got some clock skew during use.

RTCCLK is used for timekeeping, so changing it won't help.

> Is there anywhere else this need to be set?

There are some experimental patches here:

https://github.com/sifive/riscv-linux/tree/dev/paulw/cpufreq-dt-aloe-v5.3-rc4

Only the userspace governor is enabled - for one-off, manual frequency 
changes, like the one you mentioned above.  During frequency change stress 
tests, or when a CPUFreq governor is enabled that causes more frequent 
rate changes, either the board or the serial console will hang.  So more 
debugging work is needed before this can go upstream.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
