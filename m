Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4341EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 04:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ypg5fYgnlz9FYg9y7A/FkTLTnORzXB+oV+1zrVF1Q7c=; b=RhZyRTA6yB8flE2Lye4Q7DgdI0
	iqQGDiUa54U2pr4s1pt5beVyzr3VhM3cNSTyZr0vYF5JfXpY+YNYu5hncvMJXf9E2p8Tap6ze/664
	TJHlLtayHYePhgzmI4xFFZmRhXNVEO7PK66tt2I6Ach8quyPKgtlz0jgCz08KGSpI+O/IIFZN3X/Y
	/6Wo9ZD9OqzE1OeBE+dzvfo/XLSpC7JGjAi0MIMFhYrE8PKSYi/0UWqJvLBi5TSq9i6p9Ijn+eW4T
	8cUJGePg4C2Ja/iGiZut2bSDWlKKzWNgEpcmem8FgfNgBlBG8fAo2tebp5xb63H7tnTpSZ+Jg7FbV
	ryRbUINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZmYN-000dXA-Az; Thu, 31 Mar 2022 04:36:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZmYK-000dVh-RR
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 04:36:58 +0000
Received: by mail-pl1-x62c.google.com with SMTP id j8so12163304pll.11
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 21:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iTqjJDSb+/yzJWcdCCytDT/Tzm2iecGsUWNqI05lIbM=;
 b=LdCs/zdzdu0NVhz3rpsZ2tcb6nXb9WBEgVVzJm5oFhI3/jRhW6Pp8WDDIFNSMTRicf
 JwQZZdHAfVZR07+IbFdUlJTardVFobzGIBb099pFuw8DRfotc888aNL+Jt0uqsyVXEO9
 y/X2j45tGtCsdmcifgGNYJcCLRW8mONH8Sm6ASzjCqbcvU504WGViJZd0H/XAuIpWkIx
 Ijgrx7IvwCpALsgRPuAubUXBEONsjhonLYsMg28lCnJ978orIUxvQ/95mzGDofO8HdG8
 neErZ0yxk/3nsjggKKbcl8nT6rVL8smz/8mEKaeG2BhEPmRndDv3P21Lp7TKl+SLVA4T
 lsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iTqjJDSb+/yzJWcdCCytDT/Tzm2iecGsUWNqI05lIbM=;
 b=gYjxbHQFK0ItQgLsif4e1lo3t+C30K7nYZfHm+0by9ubadZ5qp88+i9oC8tfxvvPhM
 GjBr/7HE//9jXRIbYUSrCOGVdsWoUh8AM0Ydk+Kr4MGGQtK5u6isQkZkQTAtokH0YO7i
 5rjR4gbFxfTExvCr9hQwJuk7sfxxxRwo4dd4SInPg27VPh0iERZ9fLvpuBN0ojGVb/Vm
 bxY7S2ikjxOUX7AKLCiTZz6jQZEiAhlxHgXJ0ZGa7JkQgCSdJamxi28s0WPQ91pHsEox
 Mat5TFIrOFpXywygvH7d6jrZh2XzLNbmKCoE/kBvYu81UVrBasRkI90yS/lv0bA917k0
 4RbQ==
X-Gm-Message-State: AOAM530gOSYTQSpvaxgkOj0pqYsg6Fx2Nt00RX0LL6B7TAUngOJaCiMv
 dTZOraZ6ddILZhM9+Z71ffpOBg==
X-Google-Smtp-Source: ABdhPJzSgcV93Ew3ce/Bt7G9Wdrok5iwN3imE2N7LeRntdJXgZ5qFX0N7VstM01sz6q6KHpFWooByA==
X-Received: by 2002:a17:903:404b:b0:154:2b02:a496 with SMTP id
 n11-20020a170903404b00b001542b02a496mr38520661pla.73.1648701413674; 
 Wed, 30 Mar 2022 21:36:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 i9-20020a17090a2a0900b001c6e540fb6asm8106453pjd.13.2022.03.30.21.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 21:36:53 -0700 (PDT)
Date: Wed, 30 Mar 2022 21:36:53 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 21:36:41 PDT (-0700)
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
In-Reply-To: <CAKmqyKNzQELfs4SQhRJ_XDcFNvFyp5PLA-2qWfBciKN3nCDJHw@mail.gmail.com>
CC: idan.horowitz@gmail.com, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, 
 phantom@zju.edu.cn, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-252c93bc-7d59-4169-9dc4-3792ef995e4e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_213656_911162_DB0B4F7B 
X-CRM114-Status: GOOD (  29.60  )
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

On Wed, 30 Mar 2022 20:23:21 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, Mar 31, 2022 at 3:11 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
>>
>> On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >
>> >
>> > Presumably you mean "revert" here?  That might be the right way to go,
>> > just to avoid breaking users (even if we fix the kernel bug, it'll take
>> > a while to get everyone to update).  That said, this smells like the
>> > sort of thing that's going to crop up at arbitrary times in dynamic
>> > systems so while a revert looks like it'd work around the boot issue we
>> > might be making more headaches for folks down the road.
>> >
>>
>> The opposite in fact, I did not suggest to revert it, but rather undo
>> the revert (as Alistair already removed it from the apply-next tree),
>> since my original patch fixes buggy behaviour that is blocking the
>> testing of some embedded software on QEMU.

Ah, sorry -- the QEMU tree I was looking at still had the patch in 
there, must have just been an old one.

> So, this is a little tricky.
>
> We want to apply the fix, but that will break current users.
>
> Once the fix is merged into Linux we can apply it here. That should
> hopefully be right at the start of the 7.1 QEMU development window,
> which should give time for the fix to propagate into stable kernels
> and not break too many people by the time QEMU is released.

If you think this is a Linux bug then that makes sense, but I think this 
is a QEMU bug -- I sent a patch, not sure if it went through as it didn't 
make it to lore.

I also think the bug will manifest without the TB exit patch, maybe in 
single-step mode and definately if we happen to exit the TB at that 
point for other reasons.  Assuming my reasoning is correct in that 
patch, we may also be hitting this as arbitrary corruption anywhere.  
I'd started to write up a "QEMU errata" Linux patch for this, but then 
convinced myself that just adding the sfence.vma was insufficient.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
