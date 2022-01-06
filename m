Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FBAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QHufSerjt1TxMj7X2AYrm7tOMLXq0lCO+VyO0DfNBLQ=; b=uwM9nY51kliJ1IkZwBmd0OPmoS
	EXltjEFV3l4XLQ4gJbUy49ppWgvRaZGm42s764mD9ZCv194H0asQQu0Vm2wUt5S0A90JGqa4rxkMe
	S0gdYfJhDc9r63y9T4G7hd9XiCpT3LEvszj4HLNNQldmn4Wn1R8NU+/ILC2fPIC+flVFhytGew/Xm
	g/6ALyqHQAhkFbhW5kLxCSCpepFsLQH+DJ2ZPnS2CZeCEDWmOWq3fb0jnxJd0ALuk+DrlIOqs9nY2
	iswHutJF4Dr1+e40LI4QplEj3lVS6ByKhmdA3zBoVX3KT4l+CgFnd8tHki6IakKN1KgFurSIQh5dY
	bADqmx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5X5L-000uyw-DU; Thu, 06 Jan 2022 18:01:59 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5X5I-000uwu-5S
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 18:01:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id f8so3252493pgf.8
 for <linux-riscv@lists.infradead.org>; Thu, 06 Jan 2022 10:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XgTsSDw/cwN0SZ5s5fkZLZ3uXbTWYqRAbY7QRxHVY18=;
 b=8JVlsFdlqxOaS82s31Ts55+GXRP8BLCxJJgLC9uDmZ4opT+mG0Jzng218K3mB+rZRZ
 cilULMNS51t5yA/qi20o6ha5xXhwRk6k1VhWaaKxwW9TBYySNmC3rfQmamPTmO/JIsPI
 spQGwdlmCY7JEvXEBOeYnJORd7X8klyiUimItQ4tZgdKcpwdVknPK6Eah/OMHavBIyqt
 tOK8+uTnaXF9JflPvbX0hOr5y2T1VVxjRPtLka3jxwWkG07iFgMnGCU+I9cYXwnjDOTy
 JC/EdA2QACjR1vT9FER48Bl4XuVmrl5tCiLnrUP6xtzDcRiNrYZoAXsJPmyTS6eeZjDk
 wj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XgTsSDw/cwN0SZ5s5fkZLZ3uXbTWYqRAbY7QRxHVY18=;
 b=XwpUQ48U4G51RRwb2FVowlaqEtZgH+q3bJybMTUMPTl/FaY1Uaz2GdTk1zt96LAlys
 ourLhgH2HSa5j2zibAkrj8XZBy9IHvdtWgkVu+BOj5Ms75PMIvgs07GwFBqIlvb27lTN
 yMgXhCqOdHJtuKFTceQacdCNYA2Yc2GWsD9xJlzvZUfN821tAtF3BhkHDAuxMwYQiL4j
 gcIo2iA0DG6+Ys4oCcGyWgJ3ln04Y+ZOwvYW+Qm+XfROZFVYA5JhN3LCgh1gTPtzjJam
 O6KlqKs5DrQl/aj/BJdmD69EybI5Gtbt3iTpYGbBG9PI6aNjYWEwQBT0vJ7uUF2m/5pv
 AoTA==
X-Gm-Message-State: AOAM530ab0zZSIyhxCZ1U73s9GIZDpEu8FJIcXz7iKb0OPzmxpldkMJ7
 ir7uwbKsrnhTXOrB2ZJ1FAHXVg==
X-Google-Smtp-Source: ABdhPJwT1LjozBUHdb4tR7Ch6r8coyZ3NWcoe4v9PJh1J2xlNchg8+tOBsAnqgBCccZL2ctKWhCpuA==
X-Received: by 2002:a63:43c6:: with SMTP id
 q189mr53653779pga.424.1641492114780; 
 Thu, 06 Jan 2022 10:01:54 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z13sm3123044pjq.0.2022.01.06.10.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:01:54 -0800 (PST)
Date: Thu, 06 Jan 2022 10:01:54 -0800 (PST)
X-Google-Original-Date: Thu, 06 Jan 2022 10:01:12 PST (-0800)
Subject: Re: [PATCH 0/12] RISC-V: Clean up the defconfigs
In-Reply-To: <CAEUhbmWP_e3_UWf-mO8AFwECw5Li0L=4Ywjb00jUHy2J1RX5Yg@mail.gmail.com>
CC: anup@brainfault.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 anup@brainfault.org, heinrich.schuchardt@canonical.com, 
 bin.meng@windriver.com, sagar.kadam@sifive.com, damien.lemoal@wdc.com,
 axboe@kernel.dk, linux-kernel@vger.kernel.org, atishp@atishpatra.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-b74a848e-3cd7-4cd9-8831-d66c12b41aae@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_100156_276820_11E0D7AA 
X-CRM114-Status: GOOD (  29.56  )
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

On Sun, 21 Nov 2021 18:45:24 PST (-0800), bmeng.cn@gmail.com wrote:
> On Sat, Nov 20, 2021 at 12:32 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Fri, Nov 19, 2021 at 10:14 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>> >
>> > It's been a while since updating the defconfigs, so I figured it would
>> > be good to go through all the diff to make sure nothing was lurking.  It
>> > turns out there were two minor issues, which I've fixed with the first
>> > two patches.  The rest of these are just cleanups that should have no
>> > functional change.
>> >
>> > I don't have a K210 (I might somewhere, but I've yet to boot it) so I
>> > can't test this to make sure, but I think patch 2 is the reason we have
>> > a special !MMU PAGE_OFFSET config.  If someone does have one it'd be
>> > nice to be able to remove that special case.
>> >
>> >
>>
>> Using savedefconfig, I used to always get a huge diff so thanks for
>> doing this cleanups. Going forward, I suggest that we insiste everyone
>> to always use "make savedefconfig" for creating defconfig patches.
>
> Yep, using "savedefconfig" is always required by U-Boot maintainers. I
> thought that's always the case for the Linux kernel but it seems it is
> not the case.

It's actually a bit more complicated than that, as the results of
savedefconfig change to track Kconfig updates.  I'd mostly been running
savedefconfig and tossing the extra diff for people, but that led to a
bit of a mess here.

There's no way we can require everyone to run savedefconfig on our tree 
(and even if we could, it'd be a merge nightmare).  IIUC what most folks 
do is regularly re-spin the defconfigs, now that they're clean that 
should be easy.  I'm going to start doing that, the best I can come up 
with is in the second week of the merge window -- that way we'll have 
both fixes and for-next based on the newer defconfigs, along with all 
the WIP branches that folks base on rc1.  If anyone's got a better 
scheme then I'm all ears, though.

This patch set is on for-next.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
