Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5925C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 05:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876B420843
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 05:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jGKxRQmW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="fazlc9tT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876B420843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsivOedpiCXfFhBh2HlGw1Le5aDKy5eWyfm5qlSTO0g=; b=jGKxRQmWW1R6lM
	cKuDiCxim7WQY3PaEoLGOoAC7cqSO2QpUYP8oIuPL4ef1hU9M7+8RoA64AxfNXheKRCECI32vIp+x
	s9SQqHsowQkdH08/pOTLjrNdFklGfEoj6AqMvplf2yXYHDgHJrmJ0dHXZ2OB0KRrzBpAkJnBJ27Wq
	H6PiGXnjJ4Q9TM7rrpJ2zKFeKTeP+SBjrTJw5DcDmfn8klcdrQct8U93Jfi67Id1YS6ppD0I3sZtL
	BBxh0BxDOJBC8vlwDgideexjzU0YyF9cnxZZSMGK9D8pFaLGo8n7VPj9eDxZM63hnw56yTsPNALKp
	Xe4fjdMwc12py7VZBamg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g52ne-0006ia-BJ; Wed, 26 Sep 2018 05:55:50 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g52nM-0005Qj-9U
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 05:55:35 +0000
Received: by mail-wr1-x443.google.com with SMTP id z3-v6so13759533wrr.13
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 22:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6F//37tKLAYgXDjZTgenOShggxid6AOcFiyV450DGso=;
 b=fazlc9tTakpyeTjpQB8Y46E0moKh2rkThqLTUduPf0eczWUUFKqXBnBXdVUXnBeSQB
 U9eQr20gZO3VUPsCcVh5BiJWED1Cls76PmV5wkJU+7SGuhEV+jW5XqrvUqEV7plpE7XU
 adPKFaPbq2v7shb1IcikY8JSvA8zxd4+tklW3KUZnhNitXMJO0lD2bPnjZAgJsSE8ZV1
 xRVd1QfvDYVZSUVQ8BoYcFcOjNhJCZLIni7VAiEOipAX8yVvERnM8G8IMwbu5dj//8+F
 XSepkFXb/XuWuxoX+PPhPBH+0MjyI+IeeCsjprdDuPCv8HNUTW97h6xOJVAnNFDYZcO+
 MQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6F//37tKLAYgXDjZTgenOShggxid6AOcFiyV450DGso=;
 b=f5v/2pMsNWZc2sXfBj0l8aTmr88h5LGdozlPD1PZbaf/Tw+R1BvqyqA/2QaazbUlSR
 4D8v2DCq/x935uMbRHxfhcNxBRt6PmNe8EsAmYs8f0FsYfHYOEvhXDbQonck5pRohf4Q
 ZWKLJEwqNCQdASdW9LYo0p5YB7Y4vbXtkPwE09l1JhTHZXPkcKQmuNjIv4yiCa2Gw9dm
 yW/vjFzde2EfrcipiuH3AAE//b3cpZFBTjpOXpE99bQZIbUBHJ+9dOCFNNqfkLqu70CI
 4TUi3cO5A78BGuGymrL7LtluHfK1xPZKm7f3MR/Xvce0XSl7cCcEZwvHFyC1b1qjDIkC
 0MEg==
X-Gm-Message-State: ABuFfoh3GJDSb/wtmFt0aAWo3rWoJP9D8V6RLWkmLIO5LLB4ihT4NFPf
 FJn8LjHNtbEn7H2hTyZtOpl7cqxbeSh3qe09WSTEPQ==
X-Google-Smtp-Source: ACcGV62kiW7eNzgKy0Q6aeyPDO5KuJIZH/Yk2JZlQdQ9ABpp+uepapJkTUDTngfJ6+hKxtOK7Jr20VlYqLW/vP3oR+E=
X-Received: by 2002:adf:f5ce:: with SMTP id
 k14-v6mr3587533wrp.59.1537941299876; 
 Tue, 25 Sep 2018 22:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1809101533330.1292@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1809101536410.1292@nanos.tec.linutronix.de>
 <20180910133902.GB21593@infradead.org>
 <alpine.DEB.2.21.1809101544560.1292@nanos.tec.linutronix.de>
 <20180910134915.GB30774@infradead.org>
 <CAAhSdy1be_ibiowifBdgBZjbHuFU=CR4rZXQDwQghVYkex5bMg@mail.gmail.com>
 <20180910161328.GA13171@infradead.org>
 <CAAhSdy2Y-XTZ12i5aV+SzraMZP1YQBhAArpER-YssPcBJNOPOA@mail.gmail.com>
 <20180910163543.GA13052@infradead.org>
 <CAAhSdy2PSLjrtmSbkJ4w-v-zWm2hjii3XL6HE5Pe7u3wz4BmZA@mail.gmail.com>
 <20180917141436.GB2821@infradead.org>
 <CAAhSdy1gD3tZLmBzfpJV1qQKsG4GKgLkoBC7v5Kycw8KX+YeLg@mail.gmail.com>
In-Reply-To: <CAAhSdy1gD3tZLmBzfpJV1qQKsG4GKgLkoBC7v5Kycw8KX+YeLg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 26 Sep 2018 11:24:48 +0530
Message-ID:
 <CAAhSdy3unGBSS9Xgozwt4so_RBOr1WSugiP-4J49q-GOub2mDQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] irqchip: RISC-V Local Interrupt Controller Driver
To: Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@infradead.org>, 
 Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_225532_394036_6F73FE1E 
X-CRM114-Status: GOOD (  13.68  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926055448.v1kFl2Y0Ly6y-douJvXL0CeV3Fd-tz43I0JMxJGvoGM@z>

On Mon, Sep 17, 2018 at 7:58 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Sep 17, 2018 at 7:44 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Mon, Sep 10, 2018 at 10:08:58PM +0530, Anup Patel wrote:
> > > > They could in theory IFF someone actually get the use case through
> > > > the riscv privileged spec working group.
> > >
> > > Their is no point in having each and every possible local interrupts
> > > defined by RISC-V spec because some of these will be CPU
> > > implementation specific in which case these local interrupts will
> > > be described in platform specific DT passed to Linux.
> >
> > Again, to legally have implementation specific local interrupt types
> > you'll first need to convice the spec to change the status for those
> > fields from reserved to implementation specific.
>
> I agree, this needs to be first clarified in RISC-V spec. May be this is
> a good topic for discussion in any upcoming RISC-V meetup.
>
> Until then anyone can try these patches from riscv_intc_v2 branch of
> https://github.com/avpatel/linux
>

I released that CLIC is going to be available for both M-mode and S-mode.
Software can choose to use HLIC or CLIC based on it's own preference.

If we are going to support both HLIC and CLIC in Linux kernel for per-CPU
local interrupts then we should definitely have irqdomain and irqchip for
per-CPU local interrupts. The selection between HLIC and CLIC will be
based on which driver gets probed via DT.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
