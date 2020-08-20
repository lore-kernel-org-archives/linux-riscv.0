Return-Path: <SRS0=ioKI=B6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48978C433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 18:00:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F3720758
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 18:00:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+I1R97X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="O5SbuHAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F3720758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=48uBgCHPJtBbT7wAO4qOb8Ep0AxqG5EWbRofBGvI2Kg=; b=P+I1R97XToaI/0Rs/Dwu8B+cn
	g6/WmiOTt9prFLNlKbxuSs66b2KxHZnFbsZZqjzQ8dN/xhWSJfQxzJbRpFzBBpAoJQOpTwa14zl8y
	zFAcyhLBwY7TdJ86baHItyYVhaMccJHj6iN76tw9VVaUANQHDofBKXz8yuRvPSwJexJ6EVxU9wrDi
	9iU8wUIyPMeFH8k9VbC3lOXlwGEd5cuU1fFaaGat09yy0bYW0whjzGUqmCZsYIrOMw1HvBzY8q5gj
	ZTptki625LWEJxXwQBb7JHp+axK3UDc73yhAt2/nnhKGWsEtdMDuBAKvIW5Kyfyp9DBc9x/I6NxHX
	ydJz8z3kQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8orq-00075I-L0; Thu, 20 Aug 2020 18:00:50 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8oro-00074N-PX
 for linux-riscv@lists.infradead.org; Thu, 20 Aug 2020 18:00:49 +0000
Received: by mail-pf1-x441.google.com with SMTP id m71so1426202pfd.1
 for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2020 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/wa5x3tWumll3tJWqVpkUlIl5h1FhpMpXXXF7R1rXaU=;
 b=O5SbuHAFRJEmnF9HkFVw7MmE8KD8Vw+mXRjcSxGAVtXrHeHlMtBeWY8BvkwnszUFi2
 ucL1VXco2cnck1J+EuARc5ydJ6Nf/P0cVUp4L6gCIKqIGyeHdriNjQJ6LBSWQ2nL4cSy
 SffkIojCyJta6U8iakUCxfPRso1fzTAxfSLQpWp/zxuPsTYtbSU8eyNNmDxcVvh1NP9S
 a1GCeFyhotUS0znO6iQ5l3I8SD/t0f5QDW7boXGFI3Bv8KiUC9AWXBcdVVaW5UJ0pvAi
 XXVZOzwPAisOaZR6PDMIGmUBnBOXS2FSw8CQpiz1lz29tjcJjlzYOZu0vTad8mDxgZNt
 8g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/wa5x3tWumll3tJWqVpkUlIl5h1FhpMpXXXF7R1rXaU=;
 b=Bq2j6AMVIYKTr2yTtVo+J2Pqjp15QQpUSVODyalkM+PyLoXnSlrBG7PlQA7577beqk
 RliwmHr648P7KQlmolOgvx9VVGUt1NMiAnUxe44rAgWXq7oWFIo21FXMQTkY9MfgsXaB
 OQ5tsWHowoP+JbGXfpabD/dRnoyvSBew75a9yEITm4eeLKFY16aKi3qzIM6gfIZI5i7X
 D0hRiNML5GJF0gLSOvRm6YDO94rlK8QXDD4qdD1APjt2FqJ2d3gQ7bqLaHLKYzCRnGcX
 ZO1LhjaWE1QDcd1YIV7e/xcxzPkK5OUyKU03gSG5ygguaJ7OBI4hcBuoYFS3OUUejP/n
 A+/A==
X-Gm-Message-State: AOAM532mz6H+a0tUi/KmiyuCPvoamCaDKsfGR86MI6n130Y7OxUjvUrs
 HeK2JUKZFknJ0+/02H8hlATcMw==
X-Google-Smtp-Source: ABdhPJzGDvPdCvENvuekxJsAl0zqGl3JCa1UKA8m+RUvx0Xz7xgrukvf+1RBmimjWdd8LErSILtALA==
X-Received: by 2002:a05:6a00:2247:: with SMTP id
 i7mr3105514pfu.217.1597946446560; 
 Thu, 20 Aug 2020 11:00:46 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y19sm3336332pfn.77.2020.08.20.11.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 11:00:45 -0700 (PDT)
Date: Thu, 20 Aug 2020 11:00:45 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Aug 2020 11:00:44 PDT (-0700)
Subject: Re: [PATCH] riscv: Add SiFive drivers to rv32_defconfig
In-Reply-To: <CAEUhbmW6S2TG14w0smXQ6foZvmSfVvcdYf4kgkLwT9ivXV+m0Q@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-33055009-35bf-4356-afdc-df546371b795@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_140048_872425_09400D26 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: bin.meng@windriver.com, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 18 Aug 2020 02:29:53 PDT (-0700), bmeng.cn@gmail.com wrote:
> On Fri, Jul 17, 2020 at 12:39 AM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
>>
>> On Wed, 2020-07-15 at 21:39 -0700, Bin Meng wrote:
>> > From: Bin Meng <bin.meng@windriver.com>
>> >
>> > This adds SiFive drivers to rv32_defconfig, to keep in sync with the
>> > 64-bit config. This is useful when testing 32-bit kernel with QEMU
>> > 'sifive_u' 32-bit machine.
>> >
>> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>
>
> Ping?
>
> Is this patch applied anywhere? Thanks!

Sorry, I must have missed it.  It's on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
