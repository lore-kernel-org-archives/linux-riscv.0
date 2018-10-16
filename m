Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F69C5ACCA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 18:39:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CAAC2098A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 18:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P5aNeMmL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UOkws/Cc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CAAC2098A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=v3QxjfsOESQzlEmr0QpR9xAoPfeUEIcUE6/AowoBWF0=; b=P5aNeMmLGSsDu1dXuHfc0VKwG
	vH0QM3bPhOOkCpOKaMitAYRlEx9nVhGntPKPpU3kj8ojBJYVKIb7nroXuBSvxa1jBMYNty8WDg5k4
	93Bic2pyF2LrsyD3mx1L89+pHlmjHl7RvjnHUvLYDcCMNmFqoSivrjjhKBiIYQnisSgfsTqRifC/7
	c9f+cUNM/O4vM68ghe+oGegubTkJl/y7dYqZa+7j8toS3PZTLazoXHsumgodutBnWYN1ae2+OvqsV
	5bisewt0/ea1e+3Kdxq30IIGu4C6Mxp6r7X/3GHq9xYdsOEbQ3kLNwVeNWe5HRLk5/xsMNM49ACIw
	brCUj7ZHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCUFJ-0007iL-7f; Tue, 16 Oct 2018 18:39:09 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCUFF-0007g1-Ks
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 18:39:07 +0000
Received: by mail-pg1-x542.google.com with SMTP id f18-v6so11274975pgv.3
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9e5TREYIbZduqYfTe+l8iXUjUiStXCdxThOfSNUbAXE=;
 b=UOkws/Cc8s4WAG2Q0l6Fa/wXHl0WhFkOC1vvlTGRzelvOmYjF4HpvKRU9XhsCj6jvL
 o5kgGraWnD1mqjgbxMywIov8dOCiOcS1yVzIg+A4HQinsVnMDZkkDnB1lojkaoM4IhY5
 5H7YOmVwqe2MMEH9zuyPLPCiUISjVXw2i9/iq4soEzwLl3kYWqAeh5v4aR4XXRi9m7Ul
 iKPIKZn0ZEvifUs4D9zOQ0I45pcz0zZngBTmT2rT4s/ZtM+x4uvgdv6X2eETId27zLRZ
 eumg2/qRGo9uS1nV+Fr1v485Vfs6Asr29XSMe2+5kseckI0dg+onLelAP0wMQzLIhu6V
 xa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9e5TREYIbZduqYfTe+l8iXUjUiStXCdxThOfSNUbAXE=;
 b=TurUcRWHgBkdlyQTy3tMf/3nzhcdWL59lnTa4m1eB4uWhKMFB5od3HOoeqiM+ex8UY
 l8BlR581m53gqk1P6WPNJqlLRADeHOPSPMb4cxF8yXDzuxWs1ChK2rzi/pfv09K54dkJ
 xr3fiLjN857hhcphe5kdFxY0m1W0o2MIGYHr6FA/bGSwBpqImwXLp51BzBo7EJdNbK6D
 0w4ctVFdDtCUOBJmmLeJLxADmQ+4wxVtT7UUL2y+l4/FPVIPBiYAxxfBccdQIFNXtIIT
 wETKzFwjT9Fb+5hFPl8iSmbBEGDZ7Uc8G+My+CIEtpKiMbm1aJbBzE/VZGzbh3oasbRO
 9aTw==
X-Gm-Message-State: ABuFfojdPPMcNNZNyuV9xR5PYjxqq/ryaQWAn1ZmF1EEvy01uCpwiy/s
 QV8EEjhrw/IXZTznFJhs4x9vFg==
X-Google-Smtp-Source: ACcGV626+JGNKLOSbH4OoyDZuYe2k7TfQRPBJ/Bzpa9vqdkLAz0xS5/yooPMLnToz7xt9J/H2cH9EQ==
X-Received: by 2002:a63:1c1b:: with SMTP id
 c27-v6mr21411714pgc.351.1539715134251; 
 Tue, 16 Oct 2018 11:38:54 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m27-v6sm26450675pff.187.2018.10.16.11.38.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Oct 2018 11:38:53 -0700 (PDT)
Date: Tue, 16 Oct 2018 11:38:53 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Oct 2018 11:38:40 PDT (-0700)
Subject: Re: [sw-dev] Re: [isa-dev] riscv-qemu - linux boot is failing for vda
 device
In-Reply-To: <CAOuPNLiR+BLUno8sYjwLwW1BqJbBrH-suBiHEx1-dtMO906Ung@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: pintu.ping@gmail.com
Message-ID: <mhng-14c6ccbd-b9ff-40e3-b69b-4333d814c6c1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_113905_735668_07CEFB43 
X-CRM114-Status: GOOD (  22.23  )
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
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org, rjones@redhat.com,
 Michael Clark <michaeljclark@mac.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016183853.GVqFa9wRNa7VtGGre8ZbIimifaczkbvETVVZhp38qZs@z>

On Tue, 16 Oct 2018 06:12:11 PDT (-0700), pintu.ping@gmail.com wrote:
> On Tue, Oct 16, 2018 at 6:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Mon, 15 Oct 2018 14:14:51 PDT (-0700), rjones@redhat.com wrote:
>
>> >
>> >> > virtio_blk: probe of virtio0 failed with error -22
>> >
>> > ... I saw this exact error when I was using the upstream kernel
>> > instead of the one which supported interrupt handling.  Interrupt
>> > handling for RISC-V was added upstream after 4.18 so wouldn't be
>> > included in upstream 4.18.0-rc6.
>>
>> Your best bet today is to run 4.19-rc8, which should be pretty stable.
>
> Yes, I checked with mainline linux-kernel 4.19.
> Now I am able to boot successfully and login into qemu-riscv shell.
> Thank you so much :)
>
> But I am curious to know what changes resulted into this fix, in 4.19 kernel ?
> Which is the exact patch in mainline, that fixes this issue?
> Because at times during the development, it will be difficult to
> simply upgrade the kernel version.

Yes, that's expected.  RISC-V Linux is still pretty bleeding edge, you just 
happened to catch it between when master started working and when there was a 
proper release that contained your patches.  Since master is very calm right 
now (there was an rc8 before release, but it's very close to a release) it's OK 
to use, but you best bet going forward is to use the release tarballs just like 
normal.

> So, I wanted to stick to 4.18 itself, however I can back port the
> patches from 4.19 to fix the issue.

We have a backports branch, it's called "riscv-linux-4.18".  I'll continue to 
produce a backports branch for the latest upstream release until things get 
pretty stable.

> So, if you can point me to the exact patch, it will be of great help.

Here's the PLIC driver, but it depends on a bunch of other patches.  Like I 
said, that's what the backports branch is for :)

$ git log drivers/irqchip/irq-sifive-plic.c | cat
commit 8237f8bc4f6eb7e5ce2a19276079cfd3a7c6314a
gpg: Signature made Mon 13 Aug 2018 08:31:32 AM PDT
gpg:                using RSA key 00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
gpg:                issuer "palmer@dabbelt.com"
gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
gpg:                 aka "Palmer Dabbelt <palmer@sifive.com>" [ultimate]
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Jul 26 16:27:00 2018 +0200

    irqchip: add a SiFive PLIC driver

    Add a driver for the SiFive implementation of the RISC-V Platform Level
    Interrupt Controller (PLIC).  The PLIC connects global interrupt sources
    to the local interrupt controller on each hart.

    This driver is based on the driver in the RISC-V tree from Palmer Dabbelt,
    but has been almost entirely rewritten since, and includes many fixes
    from Atish Patra.

    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Acked-by: Thomas Gleixner <tglx@linutronix.de>
    Reviewed-by: Atish Patra <atish.patra@wdc.com>
    [Binding update by Palmer]
    Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

>
> Thanks,
> Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
