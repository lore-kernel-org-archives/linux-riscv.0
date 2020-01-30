Return-Path: <SRS0=BSbV=3T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2375C2D0DB
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2020 15:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC4B2082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2020 15:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WilriWlF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="R2tx+EnM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC4B2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:References:
	In-Reply-To:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzeuyLNwcHGeqDrPxY0hfInJ/Fb4wBiuy591zoPKvm4=; b=WilriWlFJ2dcw1
	eA/9kjnDRqkBcKs1awEX0jc12UgrHPjfOX/4YEVr2lK67lq9b5ZsUuC57o6PyBa0qg/mm6aaT+ily
	7jU59rLH/VYDZdPzHdVXYNnM7u835o1Z2H+gJBejvGssRUb/86hP9qgT9pXD/FV/4JVN1KRX9wCV6
	MDNYBdpkyfMwFHp7tc2G890BPCG2cp92MwK8UlUi9hacNcOJ8JniocWeyoBteiqnevjy0XaFw6J2L
	f+/MCEDwzVvrXWDGNeA9ahWYZyyuxWosTqtJpuuHBc/QagwGTbk680sAZqWc550BNeAhxAd7FP3Rr
	KfyuGSMw5ugwP2WTwjQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixBwb-00078q-1g; Thu, 30 Jan 2020 15:41:25 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixBwY-00077Y-Jz
 for linux-riscv@lists.infradead.org; Thu, 30 Jan 2020 15:41:23 +0000
Received: by mail-wm1-x341.google.com with SMTP id b17so4807891wmb.0
 for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2020 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=IzeuyLNwcHGeqDrPxY0hfInJ/Fb4wBiuy591zoPKvm4=;
 b=R2tx+EnM5ZzTjItg0Tg5V2axHD+nEJ5NjMp2Ev7oVIqipAnp4Y0ybqeCE1+HZKApwi
 KtfNJ/pVQcuWLA5f3+oquh9bNNGdnUfvrm003U/iJwPSY9OKPQdesACoQ0vyzqmOI+ss
 ZXLtlAc0d/YLG538qIKqO9yhW3N6aTx7Cu038skXnDed81IvwIGxRMTjffMdjkcmQPzt
 riTl3yrRfqJkrWLNGsPkQrm4osqzs5qR2VNSzceFYPZxoqGgBZEOjkz5aWhlUQJBeQHZ
 FeoJcDzrcMt4Q6hVAFCAKTe53mHYD54QPk/GdByiOm2dFhH6YpuxiTBjOiOkqncMOYfw
 lMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=IzeuyLNwcHGeqDrPxY0hfInJ/Fb4wBiuy591zoPKvm4=;
 b=QR8De1v9WhiaNcvAMXb53FQ7hnMF4/wm4p2/zLESlIB8i3zLdaXrz3X8l36JBPS7YX
 j7dBiNY396PuoO07cjvqRsZa6aF0xCSj56wRMpaMFH6yfsZXUIonXLe8y/WtxQfQUHtG
 J8vGaAeLAtQvVrJXRnpCRJCDtHKdDU4x0jsYRCyXuRZo7FFB6ljPMiY3t5k49cfyBEqG
 KZwHcoGAhIyQDeeStE4rbHEkJd+Cl0q5H0d/UjH8kgOfZivKG5o+0L152gzdUqY6heNg
 O3XtOdjCborU6ZoKyKB4sSc4wGR7Z2nPp7YTvavDwGupQfavQRuJd3ysc9WZd64q8rUa
 aGPA==
X-Gm-Message-State: APjAAAU/EPQ/cgDKJrzJ6a4pFmpdFsJQiZMHVKVZTMthWlYbrlDjsvsV
 uP9tMM/dSEYQrIiXboqCr2vt3w==
X-Google-Smtp-Source: APXvYqyqINQ1Dub9uL0itvcPYMPK8EFOKgs62EfLhNvh8oAS/swT1ioulL8RsQiM/8PP3tVGifFHNg==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr6326916wmi.0.1580398872454;
 Thu, 30 Jan 2020 07:41:12 -0800 (PST)
Received: from localhost ([2a00:79e0:d:11:1da2:3fd4:a302:4fff])
 by smtp.gmail.com with ESMTPSA id w22sm6652544wmk.34.2020.01.30.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 07:41:11 -0800 (PST)
Date: Thu, 30 Jan 2020 07:41:11 -0800 (PST)
X-Google-Original-Date: Thu, 30 Jan 2020 15:24:25 GMT (+0000)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 4/4] RISC-V: Select Goldfish RTC driver for QEMU virt
 machine
To: Paul Walmsley <paul.walmsley@sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.2001221147260.248939@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.2001221147260.248939@viisi.sifive.com>
 <20191203034909.37385-1-anup.patel@wdc.com>
 <20191203034909.37385-5-anup.patel@wdc.com>
Message-ID: <mhng-c7d78b33-d53f-41c5-955a-604eec4478c6@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_074122_652788_DEDB7F1A 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 22 Jan 2020 19:49:54 GMT (+0000), Paul Walmsley wrote:
> On Tue, 3 Dec 2019, Anup Patel wrote:
>
>> We select Goldfish RTC driver using QEMU virt machine kconfig option
>> to access RTC device on QEMU virt machine.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> I just grepped for Goldfish through the QEMU git tree, and it didn't come
> up with anything.  Per our discussion last year: as a general matter of
> policy, until QEMU merges support for a simulated hardware device into
> their master branch, we shouldn't speculatively enable support for it.
> So, NAK from me on this one until that happens.

Thanks, I thought they were going in through a hw/rtc tree and forgot about
them.  I've queued them up for QEMU via the RISC-V tree, there's still some
other patches I'd like to batch up but I'll send them up soon.  I don't see any
reason why the Linux patches can't go in via an early-ish RC, so we shoul be
fine.

