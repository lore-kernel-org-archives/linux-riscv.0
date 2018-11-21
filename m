Return-Path: <SRS0=BHV5=OA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEB5C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 16:28:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B32E621479
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 16:28:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZiqssEsi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZpZsnbrQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B32E621479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=UOGtYfKz44XXLmkEoJY2RE0kOo8opRITBrrUf7h4pvw=; b=ZiqssEsizX58nn9GJ0IgahcOk
	rxG913Evf9OtEVBaCIYOACcamXPFsUEcHspiYIqz9Fwm7A/xlh3krKlX1Y8LWoWGm2rE7Vx7e24Ol
	JU+ASaepUNVoRyBZ5yFIUa6+qLM/L2QoY/ld1e76x+tAvtzvjJK+Q+UnVOze8EVxqM1/3XTiV6frh
	U7Q5Oo04YlDra6PH1jZWQfU1UNsG6UgyRrDA/7HmZz6zx+04KeM1uiqAcz28kZBnvAQZlFKuQyW7V
	zbbNFSLdG+Tb5STWwQe7cnZ9G/dCPGxobpij1Xg5GqmniBYCxUWxMdugz6TuSOdcu18CeXwsZCM2b
	e8Oc8M3YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPVMX-0007B3-3s; Wed, 21 Nov 2018 16:28:25 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPVMT-0007AB-KE
 for linux-riscv@lists.infradead.org; Wed, 21 Nov 2018 16:28:23 +0000
Received: by mail-pl1-x643.google.com with SMTP id e5so6225674plb.5
 for <linux-riscv@lists.infradead.org>; Wed, 21 Nov 2018 08:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FiJirZOKa6myaADfJkWWPvVJZk+uUHJpApLtjnmWJ04=;
 b=ZpZsnbrQIkGy0yAT8hDURuztVDP4+0szesFbKkNciZGbfx74oc7Eeg45wKXs8R4tRc
 FZ+QB8Zu7mG73lcuniMYVIECgRd3gJZTlJAiU1deRHG9CkAKjusJb6L35cecs7F/Jx0t
 HMQYCPcE6BEwk/hUu+qbwBcboe//0bTF4SLhrVzpxFPJw0ycXzM3InK1g/pUhWTEJfFN
 Tcig49c6Hdiq6WoKkEIpurgVpDLwfQ0nNxPxeFkgRZM4DT7gQ8rD9Sm//KP3tvY86daU
 iPJYtm0TIx67+Y7Y4uz5CLqp8y22dWneJAqQeIEBfClKSH9H9hzzMyEEre/JS6ynsZWP
 /Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FiJirZOKa6myaADfJkWWPvVJZk+uUHJpApLtjnmWJ04=;
 b=Ml25shpxJpwaIgHmpAQtImp9qp8YdWNpVwKE+g71Y2eKR0oLjpyqQjTZ8uGPBeLcfO
 j89sMm8WqB1g30Mb2PJZe8acbG48Dux99Xd0cpaGyOXWqD1yaG2oA+CXLarAx1ZBPlN+
 5X1t4DA9SP1Lp7VrdyVkSUS4GAT/d3MZhk1Z1yE8ZTpiXroLqcvU4fs8MVq9BRcyZGcL
 0EIAvMiJjzoNXZt0B8yVkR3LATTnDa3MJ/RLA6SqtaN4S7mPMGKX7DDkhXX5u4Dd2DlU
 KQUTMc3nkkla8nT6woN8wuLu8ox5sl99LNWZF/du/F1pOo4kKi8idTjx4V2ylxXW3z1g
 08Aw==
X-Gm-Message-State: AA+aEWZT4ek9cnq5OlvXZ+3D18/1xhZf/aYVDaQZxajqxUUh0nOqfNtV
 7vuQ4YatMqlGSyHli+Ui9kbLkg==
X-Google-Smtp-Source: AFSGD/WXeOS0KlX1r2RSw2QA0XrwM5Ra4HrOGvAd1oHkvZUp2UX2jEagq2U+kgLgqghDS0f1SiC1DA==
X-Received: by 2002:a65:448a:: with SMTP id l10mr6599607pgq.387.1542817690651; 
 Wed, 21 Nov 2018 08:28:10 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f13sm29790412pfa.132.2018.11.21.08.28.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Nov 2018 08:28:09 -0800 (PST)
Date: Wed, 21 Nov 2018 08:28:09 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 08:27:47 PST (-0800)
Subject: Re: [PATCH] RISC-V: Build flat and compressed kernel images
In-Reply-To: <CAEUhbmWskEtQR-kAuAYx=SHOJ4-MrCRUchSQ68WwZ62hxsTQyQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-7be4f47d-bc3a-4073-a6db-dc5588304d2d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_082821_689533_3089255E 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181121162809.yS-GIl6apIo4K12NZhcYtTsz6IdCP9j-tTXaFW82B3E@z>

On Tue, 20 Nov 2018 21:06:18 PST (-0800), bmeng.cn@gmail.com wrote:
> On Mon, Nov 12, 2018 at 1:55 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> This patch extends Linux RISC-V build system to build and install:
>> Image - Flat uncompressed kernel image
>> Image.gz - Flat and GZip compressed kernel image
>>
>> Quiet a few bootloaders (such as Uboot, UEFI, etc) are capable of
>
> nits: U-Boot
>
>> booting flat and compressed kernel images. In case of Uboot, booting
>
> nits: U-Boot

Thanks for the review.  The PR has already been tagged, but it's not scheduled 
to be sent out until later today.  I generally try to avoid rewriting the tags 
unless there's something major that's wrong, so unless you feel very strongly 
about this then I think I'll let it stand.

Let me know if this is a big deal for you, I can rewrite things.

>> Image or Image.gz is achieved using bootm command.
>>
>> The flat and uncompressed kernel image (i.e. Image) is very useful
>> in pre-silicon developent and testing because we can create back-door
>> HEX files for RAM on FPGAs from Image.
>>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>> ---
>>  arch/riscv/Makefile             | 15 ++++++++-
>>  arch/riscv/boot/.gitignore      |  2 ++
>>  arch/riscv/boot/Makefile        | 33 ++++++++++++++++++
>>  arch/riscv/boot/install.sh      | 60 +++++++++++++++++++++++++++++++++
>>  arch/riscv/kernel/head.S        | 10 ++++++
>>  arch/riscv/kernel/vmlinux.lds.S |  2 +-
>>  6 files changed, 120 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/riscv/boot/.gitignore
>>  create mode 100644 arch/riscv/boot/Makefile
>>  create mode 100644 arch/riscv/boot/install.sh
>>
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> Tested with U-Boot s-mode on QEMU virt, using bootm to boot the kernel
> Tested-by: Bin Meng <bmeng.cn@gmail.com>

I also won't include the tags unless I rewrite the tags.

Thanks for the review!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
