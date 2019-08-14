Return-Path: <SRS0=pZSk=WK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25556C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 02:09:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA56920843
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 02:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L/cOS/Vo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="f0mdcQOF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA56920843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uCpGjYzSgnOjjWL+VH6d7qfx4V4N+svhvEMOSzy0fXc=; b=L/cOS/VomGqu5+
	f7hvBfzEmgNoA7pTs2n0RcVZq1AefK0JT3cTSMWKw1bqtSqmN/pm/IHjUudE2SJpJbbMQ445B921J
	ZWUQQ+/x0Eh/FN4L5dOisS4Pf5Kr4rw981Lr+UvCiq76Mh6k1LWqTnxzBKf1f/qncjZ05w1nPYiCg
	o/3iirHE05VCxOnpqBEePr02QsXPgK8LvqtXeFKeFek91l2c1s8iWtrX8GcrGLhik68XPf8yykYVs
	dIY+fO9kkbMdAdhih2hZ3H4SrxD+94V2mCFVf0yM74htejkDi24b8n+g8Tif69dSUBUEEb55ODkvw
	pfUw/MWxMbYlauFebVHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxij0-0004IM-Nq; Wed, 14 Aug 2019 02:09:18 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxiix-0004GP-EA
 for linux-riscv@lists.infradead.org; Wed, 14 Aug 2019 02:09:16 +0000
Received: by mail-ot1-x341.google.com with SMTP id q20so25934955otl.0
 for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2019 19:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=U5rK7CmZdWXI7174a6MB3z970/1H6iq0dTgliVzFJu8=;
 b=f0mdcQOFQqeKflGWWG+kh3b7Xr7vrgZEqZ7lWhJUP6cljRtolwr/lQbk5qfyoJGbuP
 3uGPlBTw/KmHJ9YPHGKF4FvOvCWwsDHrceZ2n14obdkNFCdmgoDprm0Fg4APAb+BXVs3
 nnJtSQL5oJrJgsKDc3iZbBGJmN8FJtDM60LLdBJ9E62/Tez5nwj4vE79VlUbmz8juILM
 sBEN1K77inOSygU6lRXV2n3okV2xJ/Om7Dyf54dTsdLm48Whn/9ehXxwLexV9VEA6hLZ
 uEhWSVq79gN2Kqi7eK/f3H4F9sZYYMFLzZgG7tX6yG+UL8nTEWqoIxdW+zc4QalESIMN
 B/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=U5rK7CmZdWXI7174a6MB3z970/1H6iq0dTgliVzFJu8=;
 b=jsjw0CfKOhRnNb7Di4rfwVa5/iqDyu766KBIF610EbgH0eui69HibqNORkrmLbVruz
 Czkh2fAJ/t38yDj3Zj6t+wsHX56PuybUU4Sn17TVEqk26ddY/z5UTt5GUtpSao4v6hIJ
 Ch1aI6VVsq5szl/8y4CeNVW9pDz5o4eOIbLTBiFjqXtwIGOJquqIATzY/6IQ7FbTM/+W
 EUsw2fBBcnoNvQSK1hTJ6MMySf8AYLz4oHg1hfDw4Y4iLa+ZduWkJv4Xq/YVV1Jp0g0v
 KGSZ7/zfmR0DNfSZf67EYZRL91T9bjY3f2IzBfftf0hSfMAbhED+Os8hEBm8fljNgEPr
 vRDw==
X-Gm-Message-State: APjAAAXSs/bKtRgtau/ppP/bsjnIme0S+gLRDVpz+T/J0ff5jguW6dsJ
 6irLxprvlpLGbHa4yDG4EdUZANEN4OU=
X-Google-Smtp-Source: APXvYqyQjKGcvVCmZUjpyJHlxUuKe9HA1j8+Dg2m+K8ewXImqzFUN2InkvHO9U4QhQFTqDrwOYtW4w==
X-Received: by 2002:a05:6602:2413:: with SMTP id
 s19mr43520646ioa.161.1565748554426; 
 Tue, 13 Aug 2019 19:09:14 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 v13sm87500772ioq.13.2019.08.13.19.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 19:09:13 -0700 (PDT)
Date: Tue, 13 Aug 2019 19:09:13 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Carlos Eduardo de Paula <me@carlosedp.com>
Subject: Re: Changing SiFive Unleashed core clock rate on 5.x kernel
In-Reply-To: <alpine.DEB.2.21.9999.1908131417450.29979@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1908131908000.19217@viisi.sifive.com>
References: <CADnnUqcp_7yN4WK2uXberCV_uwjPSj0PxpiXg6kp71--QGPJaA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1908131417450.29979@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_190915_490652_B656AFC7 
X-CRM114-Status: UNSURE (   8.31  )
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

On Tue, 13 Aug 2019, Paul Walmsley wrote:

> On Mon, 12 Aug 2019, Carlos Eduardo de Paula wrote:
> 
> > Now with Kernel 5.x and with the board DTB, what's the correct way to
> > set this clock rate?
> 
> There are some experimental patches here:
> 
> https://github.com/sifive/riscv-linux/tree/dev/paulw/cpufreq-dt-aloe-v5.3-rc4
> 
> Only the userspace governor is enabled - for one-off, manual frequency 
> changes, like the one you mentioned above.

By the way, the command lines to change this would be the usual CPUFreq 
sysfs changes.  Something like this:

echo userspace > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo 1400000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
