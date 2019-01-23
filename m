Return-Path: <SRS0=FsxO=P7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D04EC282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 18:57:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D962184B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 18:57:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k65qALRq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="h5IRtFuI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01D962184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=imQaNlJW0bLo9YgF0O6kGrf8POOpZV3regvoDTdLG48=; b=k65qALRqwVsLF9kXqILUbMU4V
	Ud0qp9KwfHTVuRMiZ0abq98ie88eLY/lXfVcRvxzc6Ee1sRJP26msAhjTQQbnupkW+tIBX82MSMTG
	8cqMM+I9J1JqizfAWg+lPpTr4tmMxcoiuONDx2H2tpq/zmcHXRQGjD4UZ9zKgMtsO4FmJ3xa9iCxX
	G6AOTw8IPGLEKqtcHpBFPNOVHsXX2ekkcz1RHG+SoOczygxrWXfeJ4OV92Mooqp4VYUHh/bVY8VpV
	Wr2vdMB1GOcuHZanW6jEJ32gMBFsRRXvPzFR74eeSi6AcI+FJHgQRNkO6odL+D7VUt6zos6BiBORY
	xtHuhfWKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmNiD-0000P1-Sx; Wed, 23 Jan 2019 18:57:21 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmNiA-0000OU-TE
 for linux-riscv@lists.infradead.org; Wed, 23 Jan 2019 18:57:20 +0000
Received: by mail-pf1-x443.google.com with SMTP id c123so1641035pfb.0
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jan 2019 10:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uzkyORv9WHDjxXAzIFaE9ySsH2mGC9U4XGK9nC78CHA=;
 b=h5IRtFuIVJH/cG3FVACxeIC4AI/AcK3/3xbMyrcYh3sq2L98YlyPIylJWOA+NPneVq
 vfpL9vMlD+w1B0AJ8UnE8lS+zZ2cUt/ASW7a8Ut/w1V6JHuaQ3pA3TqkfcYef94rwMIj
 YsYUEO5Y+cQ5NV6MDHoA3LdJQAjuzS76/EdhuzrXSoXS12Yr7610MpwxonbjZ+Q9/anS
 vM8Ll+P7kPlMJ/T91z9FsBr9j7t/PgurOX3ZPhhiPv38ARc+7RyWtiEJ7oT8LyhaRl0k
 aFd9kP+sZYJsXMJHB5bn3d2vZ0JtpGRUw9U1KoCc8twFRm8aA+aIZiICADoDeBE5mTpu
 7eSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uzkyORv9WHDjxXAzIFaE9ySsH2mGC9U4XGK9nC78CHA=;
 b=h5z+0otOhRSHmDbowFgA30dunselyoNSYA40lrG2Xrw0oGrBjdijDOO1YwXHmRUoyp
 TmzUnpoXVLa4npmP0Eyj/8GUZ8lgBtOv3VO4g4EOT9hx0MhFj8XWIu2PKOFd9eGQ+dda
 FM5+tc+FaOeUKiJSv1WR1jCIW+oIwdwnGe9AUgADTBc7otedsPhbAlHcrGIgNgjUQf6R
 VVpfexXfJhzR28XugEpYtmh6oFo0Nd23xbaIrHCctMEHi/aEHMJ2x/n614uMnwLsx/Gq
 y/stv9ttgh6bEuTq/kWheDFR4lcxM2+8WvwzaxYMT6kuh5jvbEGoi3Z8UiJR+69qENrm
 nT0A==
X-Gm-Message-State: AJcUukc0/kQ0DLSIvfiHzLJAnbzS40w7aEmmOcT6S7WPFDtVorkrnZkW
 eT0VNgkd+UglX7v5i2yGkdMIgz4CHw4=
X-Google-Smtp-Source: ALg8bN5mwouh5JuNw9Q+C5Y6nK005HnUqC2PlgGXjXxercm2orfgwKaSxnp0K6Ef32dTNhpSeMxLZQ==
X-Received: by 2002:a63:bd51:: with SMTP id d17mr3068841pgp.443.1548269838008; 
 Wed, 23 Jan 2019 10:57:18 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z62sm28719238pfi.4.2019.01.23.10.57.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 10:57:16 -0800 (PST)
Date: Wed, 23 Jan 2019 10:57:16 -0800 (PST)
X-Google-Original-Date: Wed, 23 Jan 2019 10:51:09 PST (-0800)
Subject: Re: [PATCH v4 0/5] IRQ affinity support in PLIC driver
In-Reply-To: <CAAhSdy0NYKgX0whXLF8h9Pjeg05D=pL8FcH674jTrTwUX3YX3Q@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-228e5168-7ccc-49e6-91a3-a883a2aa8e58@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_105719_005161_5539AC6C 
X-CRM114-Status: GOOD (  16.07  )
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
Cc: aou@eecs.berkeley.edu, jason@lakedaemon.net, marc.zyngier@arm.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Jan 2019 04:14:05 PST (-0800), anup@brainfault.org wrote:
> On Thu, Dec 27, 2018 at 4:48 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> This patchset primarily adds IRQ affinity support in PLIC driver and
>> other improvements.
>>
>> It gives mechanism for explicitly route external interrupts to particular
>> CPUs using smp_affinity attribute of each Linux IRQs. Also, we can now
>> use IRQ balancer from kernel-space or user-space.
>>
>> The patchset is tested on QEMU virt machine. It is based on Linux-4.20
>> and can be found at riscv_plic_irq_affinity_v4 branch of:
>> https://github.com/avpatel/linux.git
>>
>> Changes since v3:
>>  - Dropped PATCH2
>>  - Added PATCH to not inline plic_toggle() and plic_irq_toggle()
>>  - Moved PATCH3 changes to PATCH6
>>  - Used WARN_ON_ONCE() instead of WARN_ON() in PATCH5
>>
>> Changes since v2:
>>  - Fixed incorrect address of enable registers using sizeof(u32) in PATCH1
>>  - Retained comment about need for locking in PATCH1
>>  - Split PATCH2 into two patches
>>  - Split PATCH3 into two patches
>>  - Minor fix in commit description of PATCH4
>>
>> Changes since v1:
>>  - Removed few whitspace changes from PATCH1
>>  - Keep use of DEFINE_PER_CPU() as it is
>>
>> Anup Patel (5):
>>   irqchip: sifive-plic: Pre-compute context hart base and enable base
>>   irqchip: sifive-plic: Don't inline plic_toggle() and plic_irq_toggle()
>>   irqchip: sifive-plic: Add warning in plic_init() if handler already
>>     present
>>   irqchip: sifive-plic: Differentiate between PLIC handler and context
>>   irqchip: sifive-plic: Implement irq_set_affinity() for SMP host
>>
>>  drivers/irqchip/irq-sifive-plic.c | 110 +++++++++++++++++++-----------
>>  1 file changed, 71 insertions(+), 39 deletions(-)
>>
>> --
>> 2.17.1
>>
>
> Any comments on this series??

Sorry, I haven't had a chance to take a look -- I've still a bit too behind on 
getting my act together on our fixes and haven't had time to take a look at 
things for the next merge window.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
