Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF90C43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 15:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1tWU+ugLKXN/7KmHbGjR+Hcmq9vw80FYWffp2IG3P0=; b=w8tKfXc9EQGF1A
	gdaLD/YpDoEK7inoWxkt1Gywm580xlnXmEG3XUw2wpuLsjPS0w+Nyih4bajcOwzpkD54xaPmAayTC
	PVX2nLf1Y7z1nsJCKs7eBYztBIY7e0rDz4ZtOv7G85g4aG1zi2jpri9PBZ4+R1ac+3ITG1WcM5Vsf
	vGAKC1Ge+0To6D0jsB8kfwgaub7IKMLGeG2N9U2SzGCVJceMpAzY1ptKiEBZDtP9K7ZZkXx8pZLOm
	e3Gx136/Z+ksVO/4QPiyi47yA7Y2ayrud19UCi5hpprZ8aOGLoZwx/H0NSxPCeZJRDTevrhnaBfND
	roshXTiQDQ6CEK8GLYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaEL-0000000HLwH-1FZU;
	Tue, 30 Jun 2026 15:18:33 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaEH-0000000HLvt-1zal
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 15:18:31 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c127813835aso251822866b.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 08:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832707; x=1783437507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/KBEaRwzQxEmv419xD4ZZ9bpbQPWDLZFF8bQ7NEZ/M=;
        b=mPVLEpxdoeg2uWK5/5ybL5COY0Tp0c5WLajt52BH0ypKzUQPMVBzsxiCqXYpD0dT1/
         6gI/nUG5bWaoFy1l3XJBD78+lQz7D7b459qV1BdMo9tQ/iqhxM+n+bXzl9xav7G/TiaE
         8E89TjMTLB6VZV3Mo4NSHq9DJTBFvD6il+bbMVi78cempZJqoPAhyWENr54R8nOxA18k
         Pjsjmj22sH/QUun9bJW7tXikqxeJPj0EsflWZ85Z3VlqSs088REeGyU6jQ5RLciTKFF3
         zQ7v2tIg7JYq6PvZJDv+x2qCW7U1ydZiMU95pDyXjyz3KxrJ5ufNBuWH6idmhhFzIpLu
         197w==
X-Gm-Message-State: AOJu0YxjypDE+wzmFtDYi5txKmBY7r7rex6FW6BaPtw49j9hhStQHMrD
	VlJRjFv9M0WJ3ZJLeDnEb/hRYDnEcDsWmOP7iKkBF86cNUW+WWSzkaqrXr4iLJd6lqs=
X-Gm-Gg: AfdE7ckKWketSmedzYKpxdJP1UhEICvE4dEnQIge/hDIVN72U87y4/70o00xVPXrlJS
	I35B94/uqXsOqq6z2bBXHvZwaSAWwdOyX8DIqGe8Y6JE75kvxkK4DAELyY2ED26FVmTJ1N7E3ej
	w0kOcZ1RfoZ6KneYGvZcmPD7Woeoged4em0TBIpYqk4ubaOiSEAP+PfB3JYCHfEUp3bJb0W5xUn
	eK3SnzseIz2MTnIR67c17GNEUG4yJ5UGFeYG/wCjH4T1RDmFfK4npmrwzmunRGo4er2y9L52ahi
	ePchzCCUcSowni7ZzavmqO9xF96b+tX82dcAZYVtIL9/SFux8MboNRXvlwNwWHxId0UQjvyTa8Q
	BmkN9ir8DyFAgeuaTw3epq9V4JdK6P1Qvn5nJ1LW0BCIHHN8W6jIPeObCTLae+EvcieLhV1kGgY
	VaXquodSR6YLUAtV9dm0T2pEf6yBEYbqx9/znX3ssO8k8SyeisQ9666she3ImE
X-Received: by 2002:a17:906:140c:b0:c12:2b09:6c83 with SMTP id a640c23a62f3a-c1297fb28d0mr44676766b.33.1782832706824;
        Tue, 30 Jun 2026 08:18:26 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f47394sm144641266b.43.2026.06.30.08.18.26
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:18:26 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so7163497a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 08:18:26 -0700 (PDT)
X-Received: by 2002:a05:6402:4490:b0:698:48c4:361c with SMTP id
 4fb4d7f45d1cf-6988786091fmr817966a12.28.1782832706307; Tue, 30 Jun 2026
 08:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260513-panhandle-ashy-70c6abf84d59@spud>
In-Reply-To: <20260513-panhandle-ashy-70c6abf84d59@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 17:18:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnkeantjtoMg+3unfP8ZSeG+7K+EGkn48=BEi_RWENwg@mail.gmail.com>
X-Gm-Features: AVVi8Cc1NkuZmAxV303oD2tKXfYtzTdOGchmD-0yx3VkueavnJtU938JZF73YgY
Message-ID: <CAMuHMdXnkeantjtoMg+3unfP8ZSeG+7K+EGkn48=BEi_RWENwg@mail.gmail.com>
Subject: Re: [PATCH v1] rtc: mpfs: fix counter upload completion condition
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Valentina.FernandezAlanis@microchip.com, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_081829_543592_8076F70D 
X-CRM114-Status: GOOD (  25.19  )
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

Hi Conor,

On Wed, 13 May 2026 at 20:04, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The condition that needs to be checked for upload completion is the
> UPLOAD bit in the completion register going low. The original iterations
> of this driver used a do-while and this was converted to a
> read_poll_timeout() during upstreaming without the condition being
> inverted as it should have been.
>
> I suspect that this went unnoticed until now because a) the first read
> was done when the bit was still set, immediately completing the
> read_poll_timeout() and b) because the RTC doesn't hold time when power
> is removed from the SoC reducing its utility (I for one keep it
> disabled). If my first suspicion was true when the driver was
> upstreamed, it's not true any longer though, hence the detection of the
> problem.
>
> Fixes: 0b31d703598dc ("rtc: Add driver for Microchip PolarFire SoC")
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks, this landed as commit 9792ff8afa9017fe ("rtc: mpfs: fix counter
upload completion condition") in v7.2-rc1, and finally the endless
stream of:

    mpfs_rtc 20124000.rtc: timed out uploading time to rtc

is gone!

And no, it didn't go unnoticed, at least not for me, but you couldn't
reproduce it reliably before:
https://lore.kernel.org/bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
