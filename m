Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3282EC48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 20:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RPyyS+QkFU/b5S4Q12SiPv4y7dV/d4tHr9z6uZPz+s4=; b=4w1pj7Rs1xcJFzH+hhVCFxLex3
	eBCNyFkTzZ0x1tUpXSA5PYjKKGmto/NQCAcL909ziZFeaCy2D01IRzhWSxAkJnFkFTDu4ZmwdxR5L
	mL3RLvAP7I4LKVLp5Jrx4A2kkstkC04zEgjREQcNwNNvNfbagGEBLq7TWS9aGmJGVbA4krOA/lRkZ
	UFD/aMlNB9VvlpU6HkAzPcdey/fw3nmuo5Me9mDIOCLDydpXRh4hE6rsOLrA10YiZOsa9z+8IP5eT
	A3JX1/LSiMCCTaQL0abM9zx8MJ7qmfuU7BO3AzqEXwYeMLNRNHRZPvboPSrWLRnM2e/jWTNptqIwg
	bSqKYjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdG8s-00000006Zag-3fzj;
	Thu, 22 Feb 2024 20:58:06 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdG8o-00000006ZYV-34u7
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 20:58:04 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-21f8665908bso77034fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 12:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708635481; x=1709240281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/JstmNsXGrATrdQJrqYAdriIsItVvYWhgpEZTS+OEc=;
        b=da4DfPNqtz8YQN/WIgtXpnM/yDy21Z4CYMPYcb8BBkUDE3/uKTtKFxdDTTCCvc0+iC
         KRIx3rZSh/+uAy173vOmNO0V2J768yetNenssaKeTvmyjfyoGXrabShussSHtVIiAsO8
         2hZDepaQjcHSSYSRfj03r/WpHlVCt7UOS81QF5n3/v1TXIFSfizRwfFTLgzOUjZqB6MY
         nilh1LHMBW1PWP6Kd4i9yGWgP9kkfajAWR6YmgOY5EOrLa+1Tq2C59c0gAPHJW6YRdow
         fpxBXHpzCTFvBYeQiWdvZJ0xq1+daYiuA/kRG5i3k//6TbCcER3u4jN8RlVsXK5YI8yY
         +6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635481; x=1709240281;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/JstmNsXGrATrdQJrqYAdriIsItVvYWhgpEZTS+OEc=;
        b=sadm9d/qKSK207GW7wGguH+nJtUE+1p5JmoHKsRl6jfcX3ZEWO8Tqd7IY+wJD6MjwD
         NWUtC4sOsgrd7eGaNyEh6uif3HLv0faAqykhOKX06wcwKyDUEIZ8W9cjn/ZUYSfeyCj0
         OemG1qWLg61LKyWLqzVzAhpWsEYGDBqddCT5JjVyHDC4wnCnYJI5+N8CtwixVvE9x48u
         I99n07wa5dAHrbTJa4+F4jFAAqjaopFEXSk6k2hhPYIPiXWmEg1cRcn3e6FWm6plZKHS
         JDy48ORgWpA6A9EpbwFXcXBystzG8wx0br18gHn6baGfdvF+YsMEmp3s+GXbl2pofUpV
         4fZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5RV8pnoIpXzBW/6/TB35poWPjIHh6d2w7xXg6BE6HY0RVNs/f5B8xcGrBy0beLJ1yad0NhlRlaQ8H94OrCI6OtAf2Zt7MpfzO0EjdMjRe
X-Gm-Message-State: AOJu0YwRfylPjLl9QifabJ0d085NvMcyoh/OmrBFofkH+Gk0eWF3dVrN
	m9jY1j+gUYLtspOebpfRNqlK48XlXX0EcsEDsPY1244QJjlzqldR/bFnecofZWs=
X-Google-Smtp-Source: AGHT+IFzHbOMj9bR4XwoTV78+XQQDpkce4tWRSTpsF1S4rvhPsRaNJYaAkOqP1nVzW664TOOaBFWYA==
X-Received: by 2002:a05:6870:3306:b0:219:48a9:2d08 with SMTP id x6-20020a056870330600b0021948a92d08mr84346oae.12.1708635481161;
        Thu, 22 Feb 2024 12:58:01 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id u2-20020a656702000000b005dc26144d96sm9549017pgf.75.2024.02.22.12.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:58:00 -0800 (PST)
Date: Thu, 22 Feb 2024 12:58:00 -0800 (PST)
X-Google-Original-Date: Thu, 22 Feb 2024 12:57:58 PST (-0800)
Subject: Re: [RFC PATCH 0/1] riscv: dts: Allow BUILTIN_DTB for all socs
In-Reply-To: <ac11967c-3ab4-42be-86ca-0d40c35eee04@ghiti.fr>
CC: cyy@cyyself.name, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>,
  linux-kernel@vger.kernel.org, masahiroy@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-a0b00545-1522-4045-a4fe-97c3fbb8b082@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_125803_020332_D4713687 
X-CRM114-Status: GOOD (  28.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 20 Feb 2024 12:46:57 PST (-0800), alex@ghiti.fr wrote:
> Hi Yangyu,
>
> On 20/02/2024 20:01, Yangyu Chen wrote:
>> The BUILTIN_DTB kernel feature on RISC-V only works on K210 SoC only. This
>> patch moved this configuration to entire riscv.
>>
>> Although BUILTIN_DTB is not a good choice for most platforms, it is likely
>> to be a debug feature when some bootloader will always override something
>> like the memory node in the device tree to adjust the memory size from SPD
>> or configuration resistor, which makes it hard to do some debugging. As an
>> example, some platforms with numa like sg2042 only support sv39 will fail
>> to boot when there is no ZONE_HIGHMEM patch with 128G memory. If we want

I guess that's a surprising one, but there's always some Kconfig entries 
that are necessary to set in order to get platforms to boot -- at a bare 
minimum errata and drivers, for example.

> Orthogonal to this patch, but if needs be, we can fix this issue with
> 128G on sv39 by changing the sv39 address space layout, we still have
> room to gain the 4G you miss, at that time I was pretty sure that amount
> of memory would come with sv48 :)

That seems like a reasonable way to go, as long as it's not overly 
complex.

>
> Thanks,
>
> Alex
>
>
>> a kernel without this patch to boot, we need to write the memory nodes
>> in the DT manually.
>>
>> Also, changing DT on some platforms is not easy. For Milk-V Pioneer, the
>> boot procedure is ZSBL -> OpenSBI -> LinuxBoot -> Linux. If DT gets
>> changed, OpenSBI or LinuxBoot may refuse to boot. And there is some bug on
>> LinuxBoot now which does not consume --dtb argument on kexec and always
>> uses DT from memory. So I would like to do debugging on DT using

I'd argue those are bootloader/firmware bugs.

>> BUILTIN_DTB, which makes it very simple, I can even install the kernel in
>> the distro's way and provide a kernel package for other users to test.
>>
>> Yangyu Chen (1):
>>    riscv: dts: Allow BUILTIN_DTB for all socs
>>
>>   arch/riscv/Kconfig                  | 16 ++++++++++++++-
>>   arch/riscv/Kconfig.socs             | 32 -----------------------------
>>   arch/riscv/boot/dts/Makefile        |  2 +-
>>   arch/riscv/boot/dts/canaan/Makefile |  2 --
>>   4 files changed, 16 insertions(+), 36 deletions(-)
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
