Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278E2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 06:15:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA2CD60FED
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 06:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA2CD60FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgnGBYN0y8AEH6W3I4B5sgFx6KTwm8iunqkzHJ3r6wo=; b=ieAELJqkPSaXNL
	0c6icYaadpnXbp0RTCN30J0JlfMag223kElaWO5ae6ZLxwDuIZ6+24nQLPOwT1EcPHGcAZGQyzRf6
	ldKke9cJD3sjfrM3KTHPvGYcVFDxZCP4jZIg7cdxC40Bdag56p6VEBds+mu9aP9nWJMpdaoCIIzy+
	DLpBKdLibGCiTwCyt2TFRyPjN/SwViHl8etP3iroxLnkSdaUKdOeT7CcfFOqAsMsvlUxgI0dHmVsy
	3lFpmovyG/AfkYFb5+vWeAhNwhZKIu/1sxrTaVm6/s0iAe0MUj4Bpyd0kr6SozAFMBCW4pBGPixad
	PWsdYkY+79Q7yPEFuPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV6OK-005nTq-US; Tue, 28 Sep 2021 06:15:01 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV6OF-005nS1-Hp
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 06:14:57 +0000
Received: by mail-yb1-xb34.google.com with SMTP id b82so28528082ybg.1
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 23:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xl0BfBGgxrV775K+OAAR9ROcoUMbviR83515iJHs9Pg=;
 b=ZiY2B+kaLqTnRMorpc1rM8lvjhYPPwu0524KzOYs7ONOS0oWDg8M6W4k9uWwhCtdRF
 m0CorqPXNUqxOQoT1Mk5EEviGajopuysCX6L2FoqEi9R722Sb/9j396aesS7T0ZESy7q
 0h3anQ6wOSc1GsuDYvbe1hfFqZjo6wuVSGfag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xl0BfBGgxrV775K+OAAR9ROcoUMbviR83515iJHs9Pg=;
 b=vl8DHi1iqg5SaqN29Rrpxiuizw4vixHK+cZ5R15YDG+Jq6+g1coLKwbhM+W8hSsZhJ
 X1hNCzw6SK2RQ4WHNpftapH53B9iEHGHf54JfxhXzq57z8QMf+TxzpNbjnRt1lnSMAcU
 9a1yEu3oz3I+01BrWHsFH745ohWOG/ee1vW5BE0mg3ivTsUwXY0yokL+wIiIOwtqSEiF
 a2ESN9TLV5Xs0Zsu4xZV4sF/8UW19uDvd37AD8rCoqDWA2vNesBxjznmgoBXuYMX1CPg
 th2l6w8hTgyr4Pgscu+2bCBFqUeOfORqnlkqyOFFeS9NP9Vy+uMQVPpt5luGK+LEq6rT
 OSPg==
X-Gm-Message-State: AOAM530f542BLYn5gM0ypeXAr/1ewZGOCcyM8TjDtdExoqSrYS4gARqN
 CfojNuuGka+dqTUacGFvp93grmihN3fKi4Qs9msc
X-Google-Smtp-Source: ABdhPJzjnD/7v7qxbp+vpteOKkEmbYlUJ9dcmK8qoIOObjDqP29xq3zKWgGXI6UIcxGi99anDY4+a1jEM5Shobp6S1s=
X-Received: by 2002:a05:6902:1549:: with SMTP id
 r9mr5059591ybu.204.1632809693291; 
 Mon, 27 Sep 2021 23:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
 <0790abcfa1174e0e9b5e7b185f87ced9@mailhost.ics.forth.gr>
 <CAAhSdy2-y4xpM9PCrS0vgCN9ngFiBygeDOWcbgsX6Myb4XjDQg@mail.gmail.com>
 <CAOnJCULg36kNiDV6ymTSRff8yYZvFKpxm5uh=cAicQT44OcLYw@mail.gmail.com>
 <CA+Qh7T=p4+p0c8XF4YiVaCmc--HtjTLdn6=YNa4SBb8yZk2maA@mail.gmail.com>
In-Reply-To: <CA+Qh7T=p4+p0c8XF4YiVaCmc--HtjTLdn6=YNa4SBb8yZk2maA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 27 Sep 2021 23:14:42 -0700
Message-ID: <CAOnJCU+tw1Lsjk8YvNumz0nztT+7p9KppufyTc5JZudi6krKwg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
To: Greg Favor <gfavor@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Guo Ren <guoren@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, 
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, 
 Bill Huffman <huffman@cadence.com>, Allen Baum <allen.baum@esperantotech.com>, 
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_231455_678166_710971C6 
X-CRM114-Status: GOOD (  20.45  )
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

On Mon, Sep 27, 2021 at 9:49 PM Greg Favor <gfavor@ventanamicro.com> wrote:
>
> On Mon, Sep 27, 2021 at 9:26 PM Atish Patra <atishp@atishpatra.org> wrote:
>>
>> IMHO, if we want to support this board in upstream, we should just
>> clearly state that it is one time special exception
>> for this board only because of the following reasons
>
>
> I'm not quite following what the exception is?  If RVI's policy is followed for how software support for custom extensions (which D1 falls under) should be handled (as part of allowing such software to be upstreamed), then that doesn't burden standard distros nor the community to maintain ongoing support.

I am a bit confused. As per our understanding, D1 doesn't fall under
custom extensions because they have non-standard conflicting
implementations of the PTE bits that violate the privilege
specification (v1.12 with svpbmt & svnapot extension merged).
Custom extensions can only be defined via satp mode (14-15). Am I
missing something?

>  And this doesn't stop a custom Linux build from being provided to users of the D1 board (like what any other vendor would need to do to support the custom extensions on their hardware).

A custom Linux build is already floating around for the users for the
D1 board. Whether the upstream mainline kernel supports this board is
the key question here.

>
> Or are you proposing that standard binary distros would have to support D1's custom extension?  (And how would that even work if and when Svpbmt becomes required in some rev of the OS-A platform spec - at which point the D1 boards have a nonconforming extension that can't be disabled and thus conflicts with required (Svpbmt) functionality?)

I was suggesting to support D1 in the unified kernel image built from
defconfig only if we decide to support it.
standard binary distros(such as Fedora, RHEL, Suse, Ubuntu) anyways
use custom config. They can always disable support for D1 if they want
it.

>
> Greg
>
>>
>>
>> 1. The board design predates the patch acceptance policy.
>> 2. We don't have enough affordable Linux compatible platforms today.
>> 3. Allowing running an upstream kernel on D1 helps the RISC-V software
>> ecosystem to grow.
>>
>> No more exceptions will be allowed in future for such hardware that
>> violates the spec. Period.
>>
>> > Regards,
>> > Anup
>>
>>
>>
>> --
>> Regards,
>> Atish



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
