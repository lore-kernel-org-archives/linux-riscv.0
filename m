Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0613BC04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 23:19:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9ECD2089D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 23:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdG4DMtj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hbGIrbOt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9ECD2089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aafzGytt5iSzsrxq+9ib6A45a/HexgfcU3F+vKsdSBw=; b=NdG4DMtjfbmxDR
	CWvYQ3XKrHd4qDUUgJ24ci2hfpHtxI3KEBMb+ck/6kxrTmTDCy4G6BpzAkU7kVBu0gI5NMhmLtlj+
	sO1wQHrCJrxO8FZxTT2fq1VwquCiOjKzwk0p7TAmNhxBvR6Kd+g5s6O5c8gLYniU8FkBUBQO70oae
	hFrEfTiReXeRhD1nOmyAmN/peuA3acSOSWTTi6uWRb149CEw4eTpKEdJcrJky1iRBn/yUH78GsD1M
	aWmVHJk8EYMJ5BVuQzIxRZGM4Giu4fkZDCy4EiHZjdI8Gx5a0FJfyPAhxsQhYU9twS8AXR86+PU1A
	2BZQkF/4iWxvNunzJ5mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCC9K-0007M1-AP; Mon, 15 Oct 2018 23:19:46 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCC9H-0007JF-2T
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 23:19:44 +0000
Received: by mail-yb1-xb30.google.com with SMTP id o63-v6so8181454yba.2
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 16:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfgvSs63g/h45RD9rTLDUMJIpOacz1g63SGkw+GTkTo=;
 b=hbGIrbOti+zWYy9rq/oXHCiNRqhWLt8AI7qGGdBhY+qHKwh+MVG6+EwnLtzUsB09RH
 +hWBRTmQ0GKOi9aZ28dOsEWakdbiM9YjBytj6z9Nm+2nzymAfpe7B9LBzGglw0GRfi7t
 Jwn8LGEihzgXlpnPd1P93IkWfsbdatemPLOWJA8jgRqySH8/veQPaYm4OxJkUA0Hf4hJ
 bfvwOVvgPmUKe4F951PtMEWTbZqSpdfpGGAB2J+GUPNfkTA3eYhR/eG8KPlCv64ZnSbr
 EHCaKheg2Cvo5VJOBFEvDPm1omuuVnkwcTKSoSKVeBMJM8mmsPInI63UTuKMrwkIWr1e
 oqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfgvSs63g/h45RD9rTLDUMJIpOacz1g63SGkw+GTkTo=;
 b=BqBqBHKwhm6qckORlvR/3wMdGiV+fbxU5tg1x3r7+ExNVxJAdB00Sd3jTuiLvG31CB
 dUAboxeiQ6IjlVo9mTUIsVhvQzKVHCf6k8pxudMVzHiZ7QmOVAoh5XlhTct+u/egf/M2
 W4B6RvWu/VhK9v8p1XLwg4c6s3YT6V/myJJ0bl95qI66/RX/9YuuCrGKBYPv4VRiWYYs
 d3HVv+Vlxcp0nE1ZOnngIMK/Jn2pWkZ7Psnypv+K7G0HyEbyxJViJNSExh7w9VK3esCJ
 s/bDsOM1XNtmXnfSNhNqu1QesWsZAk7Oo2gylsTTj6UtOGesWAWFh5oJFfk0XXDQ/pyZ
 Nw0Q==
X-Gm-Message-State: ABuFfoiFJHJrTuhIGxDH/GZIvFevv265f/j42Fj9v7uo+sMrYyBQ8J9l
 owFqHVzeuuJxIuVx35lIM8F8eGhIkeWCOZJBepZPQVYe
X-Google-Smtp-Source: ACcGV60EGFWVy2RlcWyHlaeM8RRzXKerazWPsZlW5KwxzYC73n6TL48lHcZSrvB5WsdbO3w4okjQr9XqPuzSray/hEI=
X-Received: by 2002:a25:abc1:: with SMTP id
 v59-v6mr5905098ybi.321.1539645571320; 
 Mon, 15 Oct 2018 16:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo>
 <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
In-Reply-To: <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
From: Wesley Terpstra <wesley@sifive.com>
Date: Mon, 15 Oct 2018 16:19:20 -0700
Message-ID:
 <CAMgXwTieXNa13_xGp2mkw99+VJm-R1xrxMHSmRLZV-hG5oSdzA@mail.gmail.com>
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_161943_117524_594B729A 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 linux-gpio@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015231920.V_tmJvUmj0zmlZRdjBu96bIQ7VxZSCr_XHJWvtBcOBk@z>

On Mon, Oct 15, 2018 at 3:57 PM Atish Patra <atish.patra@wdc.com> wrote:
> >> +SiFive PWM controller
> >> +
> >> +Unlike most other PWM controllers, the SiFive PWM controller currently only
> >> +supports one period for all channels in the PWM. This is set globally in DTS.
> >> +The period also has significant restrictions on the values it can achieve,
> >> +which the driver rounds to the nearest achievable frequency.
> >
> > What restrictions are these? If "nearest achievable" is too far off the
> > target period it might be preferable to error out.
> >
>
> @Wes: Any comments?

When I last looked at this driver and hardware, I briefly considered
throwing up my hands and pretending that this PWM device had no period
control at all, only duty-cycle. There are several examples of PWM
controllers in linux already that behave that way.

Most of the uses of this PWM are only going to care about the
duty-cycle, not the period. So failing when the period is unachievable
seems worse to me than just completely eliminating access to period
control.

> I think yes. Since fu540 is the first Linux capable RISC-V core, SiFive
> Guys decided mark it as version 0.
>
> @Wesly: Please correct me if I am wrong.

Correct.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
