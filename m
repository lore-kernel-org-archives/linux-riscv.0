Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B17CCDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 18:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYXRDamlP3i2/C71nbRL6V3uD8+/aULtqYPS51EusXs=; b=cTNGoLW21slRQg
	nWidFfARdEn5SubA6belOhFWce5AfoqWD6JHnjEl4kdWYtqqeN6v15walRZ7DZekgMX3QSlspvrfH
	GhE10Su7HYoDhoFD/pXLIn1OnbWa14EVW/RAwIFNPkVJAZR+i08U7Zyi2up0T1pxjEJDsoKjhX891
	GAbpqEJDBhNsMvyEo0u1+0sxeSY+l0h4W2UTb1eUNI5xYxQgwQfZS6aD5b6LopnaXCyCANdRHIBJB
	1wtVpC3opv9Q5tZDtCTYUIM5tX/p/hbYcCP1+Py8gT5xtExYnMwdZiq0A7jMxpey2JhT/ofhnZxaU
	vndQy7nImL4s+b3fFhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsSK1-00AKLG-2n;
	Mon, 16 Oct 2023 18:28:09 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsSJx-00AKKt-2d
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 18:28:08 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1e993765c1bso3119965fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697480883; x=1698085683; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bm51Bwy2SpdgE6SyKdoP36JXJJ8T1AHayysY044xqt4=;
        b=YuFAtkxTE/5SLEYmIp+aahLSNy1gNcR4WEe4oJNMC0EaUqfOJOkd1gnHKB8BpICmE8
         g+EkWbTF0A7uZ6BVyDU+ocd4ZCq261ka28VnjMUYvjfIoa0z4jB2XDiljz2BMlxAkMla
         /HTpDtu3CQttui2Nfos0J7FAO8bbXTeH8YCGBhP2mLfA+L9+C5cr3XE9eGAisN7rSw14
         BY5fIz7scjxQbEX/DiFNH63THyUqcS/mDVmOULQhYpCPaDf2GZe9dpLmtb8+FB1EDGJN
         FCCA/1NI8AZ2ThcTQdvOC0d4ogsbvrZBk5/m7JGgFTcLo8li2zlQBUYTMWCfXzsyfnCC
         tvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697480883; x=1698085683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bm51Bwy2SpdgE6SyKdoP36JXJJ8T1AHayysY044xqt4=;
        b=cSNuCMKHFXSRBxS7KXire/GLH8DLxDYXW3zih2h6nbeVNf0MFknUj3X2P9dGhbht7p
         igDh+taK84Lrrg1CLcsrwKIxqONiDW3zvjO88c6mfOyAZIdBqr6pUGv256Qh7KxD3++L
         v4VCUPatcZ5mltJHvm/oc+MW7HrM5gB04mC106IPpdQyjT0ydx9rrGB8q0vh/G9m4mkn
         yFuKw2zfYjT6TgD7U/vJXN43efRd+aY7I3ClVaA68xqwzWt529kNr/XhDrh/BPdGBsBy
         EzMwZS31G3xYhGulyrig3p+W+IRZQYHUjugxkZ3tXhMJZ4bgiCjVkNyBDjAI6a7RwY7a
         AndA==
X-Gm-Message-State: AOJu0YxfkhvdkaxDeBbtvuMjXUpnvR2j1SufKlOnhnXeQs1VidZPnda1
	miK34/fBuzJCPpHb7jHxhtMIFoVeCO5W/ft2cDh8uA==
X-Google-Smtp-Source: AGHT+IH0b3UYP/NwvVPYsP+quIm8KcdipLbFwgA4UjJRziEIlf48UD0ptL99BDxxzAPpnZ9uEYY5I75/pTi4/zQi4DQ=
X-Received: by 2002:a05:6871:e46:b0:1e9:90ec:140 with SMTP id
 vk6-20020a0568710e4600b001e990ec0140mr13011252oab.58.1697480883424; Mon, 16
 Oct 2023 11:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-b720eb90-633f-498b-a487-0cfdc9f00ddd@palmer-ri-x1c9> <65e98129-0617-49ca-9802-8e3a46d58d29@efficios.com>
In-Reply-To: <65e98129-0617-49ca-9802-8e3a46d58d29@efficios.com>
From: Robbin Ehn <rehn@rivosinc.com>
Date: Mon, 16 Oct 2023 20:27:52 +0200
Message-ID: <CAEEvPLAoznHHq9A5CLQgRkqVhtiuyMDYxig1fgWGK0HsxpoQDg@mail.gmail.com>
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, parri.andrea@gmail.com, charlie@rivosinc.com, 
	paulmck@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mmaas@google.com, hboehm@google.com, striker@us.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_112805_873447_DD054AEF 
X-CRM114-Status: GOOD (  16.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> But fence.i would only have effects on the hart it is being called from, right ?
> What is the use-case for allowing user-space to issue this instruction ?

Right now openjdk uses flush_icache for every cmodx write. And it does
a lot of cmodx.
If the hardware does not require an IPI/icache flushing we still need
to serialize the reader.
(locally stopping out-of-order execution/speculation at least)
And in some cases the reader knows the code stream has been changed
and can emit fence.i itself instead.
So we want the option to emit fence.i directly into the code stream.

As fence.i is an unpriv instruction there is no issue with emitting it.
But we need the assurance that context switching to a new hart does
not eliminate the effects of the fence.i.

/Robbin

>
> One more thing: membarrier(2) sync_core only issues things like "fence.i" on
> the various cores in the system running threads belonging to the process, but
> does not intend to take care of doing any kind of cache invalidation per se
> (e.g. invalidating an address range worth of cache). On ARM, this is done by a
> separate system call (e.g. cacheflush(2)), or can be done by instructions
> available from userspace in some cases.
>
> Do you expect to have a need for flushing only specific icache lines, or is
> the intent to always flush the entire icache ?
>
> >
> > Charlie is volunteering to do the work here, so hopefully we'll have
> > something moving forward.
>
> That's great! I hope my feedback will help.
>
> Thanks,
>
> Mathieu
>
> >
> >>
> >>   Andrea
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
