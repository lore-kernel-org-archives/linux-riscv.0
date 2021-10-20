Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF081C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 11:32:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF2060FC2
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 11:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DF2060FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzL7xDnFAzYwq5NR6T0ZVLOhtia62VH5xsOl8racEY0=; b=VppHLDo3InIShV
	yIqldNgkfORcO3kZxuc0VK6e7B5Ldrdtm4y1l0vSSQtpiZ4A9tJhG0bLJTsVjUVm/pXVBe8GHAOoG
	8G97H8oMVgZrYK6ZPDRa6KH3cTpt/OuqoQ9Y4rLJUzKtwKd/nsGGhXqVpJh0h7sILkmqwyNiptDAu
	dkNemzXXvGe1I9NKnMY4WKgpFUafkTfWI6J57HrYx1I4kTUrgmDlJxozjJNikssudI7BjliNfn8Dg
	gDEnjfNMfsu6MGv2dSx3/l7FDZtPorViERv6pAGhDS+5aQA96HMzOQOjrNRwmCyJF/4RkFUrDEDQZ
	IhQ6VpnvnlBUM4TU598g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md9pu-004JPc-SZ; Wed, 20 Oct 2021 11:32:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md9ps-004JOQ-LB
 for linux-riscv@lists.infradead.org; Wed, 20 Oct 2021 11:32:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso9436211wms.4
 for <linux-riscv@lists.infradead.org>; Wed, 20 Oct 2021 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MjxIrvk/Yl7FyJdOEiFsoFMK0aeLC3D9xFTesUWCWms=;
 b=hwzCcURg7S6VuyAzMWLwMKCv9uspNgKKOXKaDuTuCmIyG/RQHWiwLX2sOcIc+FZLsG
 9Fm+uGNvZmpe26dXP/LgJj4+1HHFDA7veVvODmyw9FkQ9AichvEEseWdVSBJ+Epw98L9
 auvzP4R6xpae5qlkv9IktPQ+8i9neJakL1W09TexqYHAM+/MXJPzAOsWHuO/8kxdPcdP
 Kvv1eBH+zrO59Mkp6/yidKfVsL2cccdYBNJBpB4en4EOjMzBXD+EMX8NHYwn3UTTvqlu
 vcD/ubbYMrkkzAbM53lH1xMdJMOpd69VBiWI9j4EKV2ztjsYD8QTlWu3hghKAId+Whom
 PYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=MjxIrvk/Yl7FyJdOEiFsoFMK0aeLC3D9xFTesUWCWms=;
 b=ljSa0ulGK6UZ+64v3mAJuL9cabq+qgAcir1o/JxbNGVfaVD5GiUbuVX3cHnWQbkMS0
 l87KG2AhK2p+qAqquqGiwM2RPJdC7sOI0AZJik5G6HpSVZlFAs75oFXwHVt2NIIsdQwT
 pp47aJEL1ucrqfjSl7skA3iqCXkph60AUk13mj763qbvGumyrpsQC8YYJ70y1znxZkb4
 MBB0RZ1Pu6KEaTJHMpzr+0G9t9K0K5KDTI8qgjqyLVw9L4rNkdl/s/yZtgxmb/j713bt
 abSGCK0iOKMCAf27WDpR/X5R8IND0LJ0aw9KOrmnZ0SfbkAOV8z9ppkyCwm3Az83/G+2
 5k0w==
X-Gm-Message-State: AOAM5300ZS5NCHqlAa/4vwNOZ81YNyFEReKQ+1/3G27mzK7wDMTicI8u
 xumE7LVmWNUljE2LR2/cAEGBeA==
X-Google-Smtp-Source: ABdhPJzFd3L7Um3YxbVsrTjbc10dqj8xy+EEfvMzQoNet50seHE/J51qfmW5hbzj1kiXtQq19BtXHA==
X-Received: by 2002:a05:600c:3b99:: with SMTP id
 n25mr12984380wms.50.1634729562680; 
 Wed, 20 Oct 2021 04:32:42 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id c132sm4843902wma.22.2021.10.20.04.32.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Oct 2021 04:32:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/1] dt-bindings: T-HEAD CLINT
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAAhSdy22y3gWM0Y9x7m84CdmtHKo7VsDC4+ZDY7+mhkJ9HcYyA@mail.gmail.com>
Date: Wed, 20 Oct 2021 12:32:40 +0100
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@linux.alibaba.com>,
 Bin Meng <bmeng.cn@gmail.com>, Xiang W <wxjstz@126.com>,
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
Message-Id: <D1622375-A6BE-4B45-AD99-E4476D603E96@jrtc27.com>
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
 <CAAhSdy22y3gWM0Y9x7m84CdmtHKo7VsDC4+ZDY7+mhkJ9HcYyA@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_043244_717539_C8F19008 
X-CRM114-Status: GOOD (  14.27  )
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

On 20 Oct 2021, at 12:27, Anup Patel <anup@brainfault.org> wrote:
> 
> On Wed, Oct 20, 2021 at 3:06 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>> 
>> The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
>> not support 64bit mmio access to the MTIMER device.
>> 
>> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
>> restriction and the "sifive,cling0" compatible string. An OpenSBI
>> patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
>> is generally used in the devicetree schema for such a condition.
>> 
>> As the design is not SiFive based it is preferable to apply a compatible
>> string identifying T-HEAD instead.
>> 
>> Add a new yaml file describing the T-HEAD CLINT.
>> 
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>> @Palmer, @Anup
>> I copied you as maintainers from sifive,clint.yaml. Please, indicate if
>> this should be changed.
>> 
>> For the prior discussion see:
>> https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt@canonical.com/
>> https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt@canonical.com/
>> 
>> A release candidate of the ACLINT specification is available at
>> https://github.com/riscv/riscv-aclint/releases
> 
> T-HEAD supporting only 32bit accesses to MTIME and MTIMECMP
> registers are totally allowed. The RISC-V privileged specification does
> not enforce RV64 platforms to support 64bit accesses to MTIME and
> MTIMECMP registers

It does. See [1].

Jess

[1] https://github.com/riscv/riscv-isa-manual/commit/50694a2c0d5393690a9e0c8d309cf064f6c8c0e4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
