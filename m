Return-Path: <SRS0=Vdo/=NK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFA8C2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 17:26:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06DE620664
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 17:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pTKNRQKw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com header.i=@mforney-org.20150623.gappssmtp.com header.b="lQmfzQyI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06DE620664
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mforney.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lF+N/3ximExQCExhyO0G+X9T64V9mLiBsk4zlFOZ/g4=; b=pTKNRQKwxACBIk
	OgqUBCpZ74RzzTfMvjPIHTeM7fyPweoj9jFL5qxWg7hn0czvGgx2Q5V93Oo1gvqVvaKHo6IOG8va1
	/C+mRtCeM5TfA2gUYQ0WHkaz1CBS0S63QyKMFX5lvdyqU+OOIflrE/f98ipoTOF/VehIcwp4Zb4Ge
	z2yQadUKpkYDQf5c7bcAX4JtZ5WmM9Xu1MNv8z3tTKlX4LTqZd0zfwI8cVOMHc+i4ibFdWrDJooFQ
	O6ZVr4cwz9zEeWAcKX7V1iwA/iVyqTxf/WmkbjZXCg6m5Rc8CbaiOUDHhf0M7Occvt0+bakQ5YHTa
	Hq8pfW6ebTXmafGZoOfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHXmJ-0007tn-2n; Tue, 30 Oct 2018 17:26:07 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHXmG-0007rr-MR
 for linux-riscv@lists.infradead.org; Tue, 30 Oct 2018 17:26:06 +0000
Received: by mail-ot1-x336.google.com with SMTP id x4so11888262otg.3
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 10:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RjL85scSzxNjZmcRsGwfJ8JNHj5csGo4wWNkY118Sek=;
 b=lQmfzQyIFSkVrZuDRV5SYYdbEZHreztDeI7LpbAbo+uITHLNqvRDqPqwjWnvWebKs8
 R4fwUhqBiqdE2wUUNZhs6KfLQuFNSThrMkn4laZ3eJq9glb1YwRu2x2bAEiCmVT/AHFx
 qf2M+HJxUHJ+O5bkPcHk5fKY/rUUYRNmsUZn49C8zY9/7GpJGHlRNNqiJW4NmdLiIcM1
 bWuzXHyasmouQt9O7eGpwHsHrYpMbAReZgInYI74DdiORlyjVzT72EjJICuYDx1P7LyS
 TNs0qst9eWNa8rNJ2BGoZxbpEhExx2xJLmY6D0aH07q3WRRHuDuDD8PBp0TuG5y8btFO
 ZhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RjL85scSzxNjZmcRsGwfJ8JNHj5csGo4wWNkY118Sek=;
 b=BaApUzXxu/0AXA3SgkV70VpjHSnJzMH19wWSHaNFF/ReM/s6/3ecw3tcjfIhWx2D4n
 tf+J/BoClvOP8zm6IZb9gwi7OrHEv942UTiM7b1xQVU/sTunsFqguyOURray/+Aq3XpS
 J9fDUPCmlGuNhrEEscGhmIz134++u73zF3weUCEh71zso6bd32nYvCjZvi497B7coD6T
 Wgcf9TNzrvJoiI85M+zZLoTkb/Gdxumv/CELwoHj0t3ErUgXVZ4eXVwzT72Pb8QOiOnr
 5VoVNYXEzO9+YXX5W/HL8gTvR2HG9yi96HZ/AaKo81T2eZkSuypJfFEunyFj8QqhSJDu
 6EUg==
X-Gm-Message-State: AGRZ1gKHx8lrnCg4tUhEB5Di1HTHQM8hbuGgMC4FH3+N4k0s8zaPBW/k
 5fDJ3McHu5seZJ9aWcvJuA9ZQBN7RxtrolDMRxS7pQ==
X-Google-Smtp-Source: AJdET5fGsD7z8sdjkjN7ENpxtuYvnKNRc0SR505AfvBkTk9AlOkSGkCqRgQRAYELFYTSipVCkdgPS3Kq5AmYOf1Cai8=
X-Received: by 2002:a9d:2339:: with SMTP id j54mr5863989otb.263.1540920353276; 
 Tue, 30 Oct 2018 10:25:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:370b:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 10:25:52
 -0700 (PDT)
X-Originating-IP: [2601:647:5180:35d7:16dd:a9ff:fee7:6b79]
In-Reply-To: <CAEn-LTopspBXzoLZEFWQGxxC7uNJ9RZHiHyYmJPpWR4zKnj5zw@mail.gmail.com>
References: <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
 <CAEn-LTopspBXzoLZEFWQGxxC7uNJ9RZHiHyYmJPpWR4zKnj5zw@mail.gmail.com>
From: Michael Forney <mforney@mforney.org>
Date: Tue, 30 Oct 2018 10:25:52 -0700
Message-ID:
 <CAGw6cBtMu7qs2in-=eX1J6bpPK-L-8cSa5pocQ6CA=en-ju3EA@mail.gmail.com>
Subject: Re: virtio-gpu without ARCH_HAS_SG_CHAIN
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_102604_870031_D472889D 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181030172552.XBzBNiE4KOKfP4GlUeBMNMlBVc9ponPNse6RqgTV-Ec@z>

On 2018-10-29, David Abdurachmanov <david.abdurachmanov@gmail.com> wrote:
> On Mon, Oct 29, 2018 at 8:47 PM Michael Forney <mforney@mforney.org> wrote:
>>
>> - Should riscv support ARCH_HAS_SG_CHAIN?
>
> Non-expert here, but it looks like ARCH_HAS_SG_CHAIN
> support is generic, and a number of well known architectures
> support it.
>
> So it's basically two line patch someone needs to send and
> at least make a test by building the kernel. I can do that if you want.

If that's all there is to it, then yeah, that would be appreciated. Thanks!

Though, I assume there's *some* architecture-specific consideration
that needs to be done, since it has to be selected on each
architecture that supports it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
